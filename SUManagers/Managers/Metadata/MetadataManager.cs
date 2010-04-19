using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;
using System.Data.Common;

namespace SUCore.Managers.Metadata
{
    /// <summary>
    /// Менеджер метаданных
    /// </summary>
    public sealed class MetadataManager : IDisposable
    {
        DbConnection      _connection;

        public MetadataManager()
        {
            _connection = DBConnectionProvider.GetConnection();
            _connection.Open();
        }

        /// <summary>
        /// Получение списка модулей
        /// </summary>
        /// <returns></returns>
        public List<MetadataModule> GetModulesList()
        {
            List<MetadataModule> modules = new List<MetadataModule>(0);
            
            //
            //  формируем строку запроса, для выборки иформации по модулям
            //
            using (DbCommand cmd = _connection.CreateCommand())
            {
                cmd.CommandText = "SELECT * FROM MetadataModules";


                //
                //  изфлекаем полученные данные
                //
                using (DbDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        MetadataModule module = new MetadataModule();

                        module.Id = reader.GetGuid(0);
                        module.ModuleName = reader.GetString(1);
                        module.Description = reader.GetString(2);

                        modules.Add(module);
                    }
                }
            }

            return modules;
        }

        /// <summary>
        /// Идентфикатор модуля
        /// </summary>
        /// <param name="moduleName">названеи модуля</param>
        /// <returns></returns>
        public MetadataModule GetModuleByName(string moduleName)
        {
            MetadataModule module = new MetadataModule();

            //
            //  формируем строку запроса, для выборки иформации по модулям
            //
            using (DbCommand cmd = _connection.CreateCommand())
            {
                cmd.CommandText = "SELECT * FROM MetadataModules WHERE ModuleName = '" + moduleName + "'";


                //
                //  изфлекаем полученные данные
                //
                using (DbDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.SingleRow))
                {
                    while (reader.Read())
                    {
                        module.Id = reader.GetGuid(0);
                        module.ModuleName = reader.GetString(1);
                        module.Description = reader.GetString(2);
                    }
                }
            }

            return module;
        }

        public MetadataModule GetModuleById(Guid id)
        {
            MetadataModule module = new MetadataModule();

            //
            //  формируем строку запроса, для выборки иформации по модулям
            //
            using (DbCommand cmd = _connection.CreateCommand())
            {
                cmd.CommandText = "SELECT * FROM MetadataModules WHERE ModuleId = '" + id.ToString() + "'";


                //
                //  изфлекаем полученные данные
                //
                using (DbDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.SingleRow))
                {
                    while (reader.Read())
                    {
                        module.Id = reader.GetGuid(0);
                        module.ModuleName = reader.GetString(1);
                        module.Description = reader.GetString(2);
                    }
                }
            }

            return module;
        }

        /// <summary>
        /// Список полей для модуля
        /// </summary>
        /// <param name="moduleId">идентификатор модуля</param>
        /// <returns></returns>
        public List<MetadataField> GetFieldsList(Guid moduleId)
        {
            List<MetadataField> fields = new List<MetadataField>(0);

            //
            //  формируем строку запроса, для выборки иформации по модулям
            //
            using (DbCommand cmd = _connection.CreateCommand())
            {
                cmd.CommandText = "SELECT * FROM MetadataFields WHERE ModuleId = '" + moduleId.ToString() + "'";

                //
                //  извлекаем полученные данные
                //
                using (DbDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string name = reader.GetString(0);
                        System.Data.SqlDbType type =(System.Data.SqlDbType)Enum.Parse(typeof(System.Data.SqlDbType), reader.GetString(1));
                        string description = reader.GetString(2);
                        Guid mdlId = reader.GetGuid(3);
                        uint length = (uint)reader.GetByte(4);
                        
                        MetadataField field = new MetadataField(mdlId, name, description, type, length);

                        fields.Add(field);
                    }
                }
            }

            return fields;
        }

        /// <summary>
        /// Информацио о поле
        /// </summary>
        /// <param name="fieldName"></param>
        /// <returns></returns>
        public MetadataField GetFieldInfo(string fieldName)
        {
            MetadataField field = null;

            //
            //  формируем строку запроса, для выборки иформации по модулям
            //
            using (DbCommand cmd = _connection.CreateCommand())
            {
                cmd.CommandText = "SELECT * FROM MetadataFields WHERE FieldName = '" + fieldName + "'";

                //
                //  извлекаем полученные данные
                //
                using (DbDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string name = reader.GetString(0);
                        System.Data.SqlDbType type = (System.Data.SqlDbType)Enum.Parse(typeof(System.Data.SqlDbType), reader.GetString(1));
                        string description = reader.GetString(2);
                        Guid mdlId = reader.GetGuid(3);
                        uint length = (uint)reader.GetByte(4);

                        field = new MetadataField(mdlId, name, description, type, length);
                    }
                }
            }

            return field;

        }

        /// <summary>
        /// Создаём модуль 
        /// </summary>
        /// <param name="moduleName"></param>
        /// <param name="fields"></param>
        /// <returns></returns>
        public Guid CreateModule(string moduleName, string description, List<MetadataField> fields)
        {
            Guid moduleId = Guid.NewGuid();

            //
            //  транзакция для соаздания модуля
            //
            using (DbTransaction trans = _connection.BeginTransaction())
            {
                try
                {
                    #region Добавление информации по модулю

                    using (DbCommand cmd = _connection.CreateCommand())
                    {
                        cmd.Transaction = trans;

                        // MetadataModules
                        cmd.CommandText = "INSERT INTO MetadataModules VALUES('" + moduleId.ToString() + "', '" + moduleName + "', '" + description + "') ";
                      
                        
                        //  MetadataFields
                        foreach (MetadataField f in fields)
                        {
                            cmd.CommandText += "INSERT INTO MetadataFields VALUES('" + f.Name + "', '" + f.SqlType.ToString() + "', '" + f.Description + "', '" + moduleId.ToString() + "', " + f.SqlTypeLength + ") ";
                        }                      

                        cmd.ExecuteNonQuery();
                    }

                    #endregion

                    #region Создание физической таблицы модуля

                    using (DbCommand cmd = _connection.CreateCommand())
                    {
                        //
                        //  добавляем к коллекции полей служебные
                        //
                        MetadataField PlowMachineId = new MetadataField(moduleId, "PlowMachineId", "", System.Data.SqlDbType.UniqueIdentifier, 0);
                        MetadataField CreatedOn = new MetadataField(moduleId, "CreatedOn", "", System.Data.SqlDbType.DateTime, 0);
                        MetadataField ModifidedOn = new MetadataField(moduleId, "ModifidedOn", "", System.Data.SqlDbType.DateTime, 0);

                        fields.Add(PlowMachineId);
                        fields.Add(CreatedOn);
                        fields.Add(ModifidedOn);

                        cmd.Transaction = trans;
                        cmd.CommandText = ImplementModuleCreateTableCommand(moduleName, fields);
                        cmd.ExecuteNonQuery();
                    }
                    
                    #endregion

                    // фиксируем транзакцию
                    trans.Commit();
                }
                catch
                {
                    // откатываем
                    trans.Rollback();
                    throw;
                }
            }

            return moduleId;
        }

        #region Форирование строки с командой для создания таблицы

        /// <summary>
        /// Объявление команды
        /// </summary>
        /// <param name="tableName">название таблицы</param>
        /// <param name="fields">поля таблицы</param>
        /// <returns></returns>
        private string ImplementModuleCreateTableCommand(string tableName, List<MetadataField> fields)
        {
            StringBuilder createTableCommand = new StringBuilder("CREATE TABLE " + tableName + " (");

            for (int i = 0; i < fields.Count; i++)
            {
                AppendCreateColumnString(createTableCommand, fields[i]);
                createTableCommand.Append(", ");
            }

            createTableCommand.Append("PRIMARY KEY (PlowMachineId), FOREIGN KEY (PlowMachineId) REFERENCES PlowMachines(PlowMachineId)");
            
            createTableCommand.Append(")");

            return createTableCommand.ToString();
        }

        /// <summary>
        /// Формирование строки с описание столбца
        /// </summary>
        /// <param name="builder"></param>
        /// <param name="field"></param>
        private void AppendCreateColumnString(StringBuilder builder, MetadataField field)
        {
            builder.Append(field.Name + " " + field.SqlType.ToString());
            if (IsTypeWithLength(field.SqlType))
            {
                builder.Append("(" + field.SqlTypeLength + ")");
            }
        }

        
        #endregion

        /// <summary>
        /// Есть ли у типа SQL длина
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        private bool IsTypeWithLength(System.Data.SqlDbType type)
        {
            switch (type)
            {
                case System.Data.SqlDbType.NVarChar:
                    return true;
            }

            return false;
        }

        #region IDisposable Members

        public void Dispose()
        {
            if (_connection != null) _connection.Dispose();
        }

        #endregion
    }
}
