using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.EntityClient;

namespace SUCore.Metadata
{

    public class MetadataManager : IDisposable
    {
        readonly string ENTITY_METADATA = @"res://*/MetadataModel.csdl |
                                            res://*/MetadataModel.ssdl |
                                            res://*/MetadataModel.msl";
        SUMetadataEntities _context;
        DatabaseManager _dbManager;

        public MetadataManager()
        {
            string connectionString = DBConnectionHelper.GetConnectionString();

            EntityConnectionStringBuilder bldr = new EntityConnectionStringBuilder();
            bldr.Metadata = ENTITY_METADATA;
            bldr.Provider = "System.Data.SqlClient";
            bldr.ProviderConnectionString = connectionString;

            _context = new SUMetadataEntities(bldr.ConnectionString);
            _dbManager = new DatabaseManager();
        }

        public List<ModuleMetadata> GetModulesList()
        {
            return (from mm in _context.ModuleMetadataSet select mm).ToList();
        }

        #region IDisposable Members

        public void Dispose()
        {
            _context.Dispose();
        }

        #endregion

        /// <summary>
        /// Список параметров модуля
        /// </summary>
        /// <param name="modulename"></param>
        public  List<FieldMetadata> GetModuleParamsList(string modulename)
        {
            return (from fm in _context.FieldMetadataSet 
                   where fm.MetadataModules.ModuleName.Equals(modulename, StringComparison.InvariantCultureIgnoreCase) 
                   select fm).ToList();
        }

        /// <summary>
        /// Модуль по имени
        /// </summary>
        /// <param name="moduleName"></param>
        /// <returns></returns>
        public ModuleMetadata GetModuleByName(string moduleName)
        {
            var modules = from mm in _context.ModuleMetadataSet 
                          where mm.ModuleName.Equals(moduleName, StringComparison.InvariantCultureIgnoreCase) 
                          select mm;

            ModuleMetadata result = null;

            if (modules.Count() != 0)
            {
                result = modules.First();
            }

            return result;
        }

        /// <summary>
        /// Параметр
        /// </summary>
        /// <param name="paramName"></param>
        public FieldMetadata GetParamByName(string paramName)
        {
            var parameters = from pm in _context.FieldMetadataSet
                             where pm.FieldName.Equals(paramName, StringComparison.InvariantCultureIgnoreCase)
                             select pm;

            FieldMetadata result = null;

            if (parameters.Count() != 0)
            {
                result = parameters.First();
            }

            return result;
        }

        /// <summary>
        /// Создаём модуль
        /// </summary>
        /// <param name="module">модуль</param>
        public void CreateModule(ModuleMetadata module)
        {
            //
            //  Открывам соединение и создаем транзакцию для создания
            //  физическйо таблицы
            //
            _context.Connection.Open();
            using (System.Data.Common.DbTransaction transaction = _context.Connection.BeginTransaction())
            {
                try
                {
                    _context.AddToModuleMetadataSet(module);
                    _context.SaveChanges();

                    _dbManager.CreateTableFromModuleSchema(module);

                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();
                    throw;
                }
                finally
                {
                    _context.Connection.Close();
                }
            }
        }
    }
}
