using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.EntityClient;
using System.Configuration;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Common;
using SUCore.Metadata;

namespace SUCore.Metadata
{
    /// <summary>
    /// менеджер для работы с БД
    /// </summary>
    class DatabaseManager
    {
        Database _database;

        public DatabaseManager()
        {
            string connectionString = SUCore.DBConnectionHelper.GetConnectionString();
            SqlConnection connection = new SqlConnection(connectionString);
            Server server = new Server(new ServerConnection(connection));
        
            SqlConnectionStringBuilder bldr = new SqlConnectionStringBuilder(connectionString);
            _database = server.Databases[bldr.InitialCatalog];
        }

        /// <summary>
        /// Создаём таблицу из схемы модуля
        /// </summary>
        /// <param name="module">Метаданные модуля</param>
        public void CreateTableFromModuleSchema(ModuleMetadata module)
        {
            
            if (!_database.Tables.Contains(module.ModuleName))
            {
                try
                {
                    //  создаём таблицу
                    Table targetTable = new Table(_database, module.ModuleName);

                    //
                    //  добавляем базовые столбцы в таблицу
                    //
                    #region Внешниый ключ
                    Column plowMachineIdColumn = new Column(targetTable, "PlowMachineId");
                    plowMachineIdColumn.DataType = DataType.UniqueIdentifier;
                    plowMachineIdColumn.RowGuidCol = true;
                    plowMachineIdColumn.Nullable = false;

                    ForeignKey fk = new ForeignKey(targetTable, "FK_" + module.ModuleName + "_PlowMachine");
                    ForeignKeyColumn fk_column = new ForeignKeyColumn(fk, "PlowMachineId");
                    fk_column.ReferencedColumn = "PlowMachineId";
                    fk.ReferencedTable = "PlowMachines";
                    fk.Columns.Add(fk_column);

                    targetTable.ForeignKeys.Add(fk);
                    targetTable.Columns.Add(plowMachineIdColumn); 
                    #endregion

                    //
                    //  добавляем столбцы в таблицу 
                    //
                    foreach (FieldMetadata f in module.MetadataFields)
                    {
                        Column column = CreateColumn(targetTable, f);
                        targetTable.Columns.Add(column);
                    }
                    
                    targetTable.Create();

                    #region Первичный ключ

                    Index idx = new Index(targetTable, "PK_" + module.ModuleName);
                    IndexedColumn idxc = new IndexedColumn(idx, plowMachineIdColumn.Name);
                    idx.IndexedColumns.Add(idxc);
                    idx.IndexKeyType = IndexKeyType.DriPrimaryKey;
                    idx.IsClustered = true;
                    idx.IsUnique = true;
                    idx.Create();


                    #endregion
                }
                catch (Microsoft.SqlServer.Management.Smo.InvalidSmoOperationException)
                {
                    throw;
                }

            }
            else
            {
                throw new InvalidOperationException("Таблица с именем '" + module.ModuleName + "' уже существует в БД.");
            }
        }

        private Column CreateColumn(Table parentTable, FieldMetadata fieldMetadata)
        {
            Column column = new Column(parentTable, fieldMetadata.FieldName);
            column.DataType = DataType.NVarCharMax;
            return column;
        }

        /// <summary>
        /// Удаляем таблицу
        /// </summary>
        /// <param name="module">модуль</param>
        public void DeleteTable(ModuleMetadata module)
        {
            _database.Tables[module.ModuleName].Drop();
        }

        /// <summary>
        /// Изменяем структуру таблицы
        /// </summary>
        /// <param name="module"></param>
        public void AlterTable(ModuleMetadata module)
        {
            if (_database.Tables.Contains(module.ModuleName))
            {
                try
                {
                    //  создаём таблицу
                    Table targetTable = _database.Tables[module.ModuleName];
                    targetTable.Drop();
                    CreateTableFromModuleSchema(module);
                }
                catch (Microsoft.SqlServer.Management.Smo.InvalidSmoOperationException)
                {
                    throw;
                }
            }
            else
            {
                throw new InvalidOperationException("Таблицs с именем '" + module.ModuleName + "' не существует в БД.");
            }
        }
    }
}
