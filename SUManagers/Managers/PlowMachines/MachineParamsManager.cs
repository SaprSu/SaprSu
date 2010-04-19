using System;
using System.Collections.Generic;
using System.Text;
using System.Data.Common;
using System.Data;

namespace SUCore.Managers.PlowMachines
{
    using Managers.Metadata;
    using SULibrary;

    /// <summary>
    /// Менеджер для работы с параметрами струговой машины
    /// </summary>
    sealed class MachineParamsManager : IDisposable
    {
        MetadataManager _manager;
        DbConnection _connection;
        Guid _plowMachineId;

        public MachineParamsManager(Guid plowmachineId, Metadata.MetadataManager manager)
        {
            _plowMachineId = plowmachineId;
            _manager = manager;
            _connection = DBConnectionProvider.GetConnection();
            _connection.Open();
        }

        public SULibrary.Parameters LoadParams(IList<MetadataField> paramsNames)
        {
            Parameters result = new Parameters();

            foreach (MetadataField param in paramsNames)
            {               
                double? value = SelectFieldValue(param);
                if (value.HasValue)
                {
                    result.Add(param.Name, value.Value);
                }
            }

            return result;
        }

        public SULibrary.Parameters LoadParams(string[] paramsNames)
        {
            Parameters result = new Parameters();

            foreach (string paramname in paramsNames)
            {
                //  получаем информацию о поле
                MetadataField fieldInfo = _manager.GetFieldInfo(paramname);
                if (fieldInfo == null) throw new ArgumentException("Параметр с именем '" + paramname + "'");

                double? value = SelectFieldValue(fieldInfo);
                if (value.HasValue)
                {
                    result.Add(fieldInfo.Name, value.Value);
                }
            }

            return result;
        }

        public void SaveParams(Parameters p)
        {
            foreach (Parameter value in p)
            {
                InsertFieldValue(value);
            }           
        }

        private void InsertFieldValue(KeyValuePair<string, object> value)
        {
            MetadataField field = _manager.GetFieldInfo(value.Key);
            if (field == null) throw new ArgumentException("Параметр с именем '" + value.Key + "'");

            MetadataModule module = _manager.GetModuleById(field.ModuleId);

            using (DbDataAdapter adapter = DBConnectionProvider.GetAdapter())
            {
                using (DbCommandBuilder cmdbuilder = DBConnectionProvider.GetCommandBuilder())
                {
                    DbCommand selectCommand = _connection.CreateCommand();
                    selectCommand.CommandText = "SELECT * FROM " + module.ModuleName + " WHERE PlowMachineId = '" + _plowMachineId.ToString() + "'";
                    adapter.SelectCommand = selectCommand;
                    cmdbuilder.DataAdapter = adapter;

                    DataTable table = new DataTable();
                    adapter.Fill(table);

                    if (table.Rows.Count == 0)
                    {
                        DataRow r = table.NewRow();
                        r[field.Name] = value.Value;
                        r["PlowMachineId"] = _plowMachineId;
                        r["CreatedOn"] = DateTime.Now;

                        table.Rows.Add(r);
                    }
                    else
                    {
                        table.Rows[0][field.Name] = value.Value;
                        table.Rows[0]["ModifidedOn"] = DateTime.Now;
                    }

                    adapter.Update(table);
                }
            }
        }

        private double? SelectFieldValue(MetadataField field)
        {
            double? result = null;

            MetadataModule module = _manager.GetModuleById(field.ModuleId);

            using (DbCommand cmd = _connection.CreateCommand())
            {
                cmd.CommandText = "SELECT " + field.Name + " FROM " + module.ModuleName + " WHERE PlowMachineId = '" + _plowMachineId.ToString() + "'" ;

                using (DbDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (!reader.IsDBNull(0))
                        {
                            result = reader.GetDouble(0);
                        }
                    }
                }
            }

            return result;
        }

        #region IDisposable Members

        public void Dispose()
        {
            _connection.Dispose();
        }

        #endregion
    }
}
