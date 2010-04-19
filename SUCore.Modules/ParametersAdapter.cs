using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using SULibrary;
using SUCore.Metadata;
using SUCore.Modules;
using System.Xml.Serialization;
using System.IO;
using System.Data;
using System.Reflection;
using System.Diagnostics;

namespace SUCore.Modules
{
    /// <summary>
    /// Адаптер параметров
    /// </summary>
    public sealed class ParametersAdapter : IDisposable
    {
        String _connectionString;
        MetadataManager _manager;

        public ParametersAdapter()
        {
            _connectionString = DBConnectionHelper.GetConnectionString();
            _manager = new MetadataManager();
        }

        /// <summary>
        /// Заливаем параметры значениями из БД
        /// </summary>
        public void FillParams(Module module)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand selectCommand = connection.CreateCommand();
                selectCommand.CommandText = InitSelectSqlCommand(module);
                
                connection.Open();
                using (SqlDataReader reader = selectCommand.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        foreach (var param in module.ModuleParams)
                        {
                            if (reader[param.Name] != null)
                            {
                                try
                                {
                                    module.ModuleParams[param.Name].Value = DeserializeParamValue(reader[param.Name], param.Name);
                                }
                                catch(Exception ex)
                                {
                                   // throw;
                                    Console.WriteLine("");
                                    EventLog.WriteEntry("Error", param.Name + " " + ex.Message);
                                }
                            }
                        } 
                    }
                }
            }
        }

        public void FillParamsSchema(Module module)
        {
            module.ModuleParams.Clear();

            foreach (var param in _manager.GetModuleParamsList(module.Name))
            {
                Parameter p = new Parameter()
                {
                    Name = param.FieldName,
                    Description = string.IsNullOrEmpty(param.Description) ? param.FieldName : param.Description,
                    Value = null,
                    ValueType = Type.GetType(param.ClrType)
                };
                
                module.ModuleParams.Add(p);
            }
        }


        /// <summary>
        /// Обновляем параметры в БД
        /// </summary>
        /// <param name="parameters">параметры</param>
        public void UpdateParams(Module module)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand selectCmd = connection.CreateCommand();
                selectCmd.CommandText = InitSelectSqlCommand(module);

                using (SqlDataAdapter adapter = new SqlDataAdapter(selectCmd))
                {
                    SqlCommandBuilder cmdBldr = new SqlCommandBuilder(adapter);

                    DataTable table = new DataTable();
                    adapter.Fill(table);

                    if (table.Rows.Count != 0)
                    {
                        //
                        //  если в таблице есть строка
                        //

                        foreach (var param in module.ModuleParams)
                        {
                            if (param.Value == null) continue;
                            table.Rows[0][param.Name] = SerializeParamValue(param.Value, param.Name);
                        }

                        adapter.Update(table);
                    }
                    else
                    {
                        //
                        //  если в таблице нет строк
                        //  

                        DataRow row = table.NewRow();
                        row["PlowMachineId"] = module.PlowMachineId;
                        
                        foreach (var param in module.ModuleParams)
                        {
                            if (param.Value == null) continue;
                            row[param.Name] = SerializeParamValue(param.Value, param.Name);
                        }
                        table.Rows.Add(row);
                        adapter.Update(table);
                    }
                }
            }
        }

        private string InitSelectSqlCommand(Module module)
        {
            StringBuilder selectCommand = new StringBuilder();
            ModuleMetadata moduleMetadata = _manager.GetModuleByName(module.Name);

            if (moduleMetadata == null)
            {
                throw new ArgumentException("Модуль с именем '" + module.Name + "' не найден.");
            }

            selectCommand.Append("SELECT * FROM " + moduleMetadata.ModuleName +" WHERE PlowMachineId = '" + module.PlowMachineId.ToString() + "'");

            return selectCommand.ToString();
        }

        private Type GetClrType(string paramName)
        {

            FieldMetadata fm = _manager.GetParamByName(paramName);

            if (fm == null)
            {
                throw new ArgumentException("Параметр с именем '" + fm.FieldName + "' не найден.");
            }

            return Type.GetType(fm.ClrType);
        }

        private object DeserializeParamValue(object value, string paramName)
        {
            object result = new object();

            if (value != null && !string.IsNullOrEmpty(value.ToString()))
            {
                XmlSerializer sr = new XmlSerializer(GetClrType(paramName));
                StringReader rdr = new StringReader(value.ToString().Replace(',', '.'));

                result = sr.Deserialize(rdr);
            }
            else
            {
                result = null;
            }
           
            return result;
        }

        public object SerializeParamValue(object value, string paramName)
        {
            object result = null;
            object targetValue = value;

            Type valueClrType = GetClrType(paramName);

            //
            //  если значение строка и тип передаваемого значения не строка
            //
            if (value.GetType() == typeof(String) &&
                valueClrType != typeof(String))
            {
                MethodInfo mi = valueClrType.GetMethod("Parse", new Type[] { typeof(String) });

                try
                {
                    targetValue = mi.Invoke(null, new object[] { value.ToString() });
                }
                catch (TargetInvocationException ex)
                {
                    throw new ArgumentException("Неверный тип значения. Параметр " + paramName, ex);
                } 
            }
            

            XmlSerializer sr = new XmlSerializer(valueClrType);
            StringWriter wr = new StringWriter();
            sr.Serialize(wr, targetValue);
            result = (object)wr.ToString();

            return result;
        }

        #region IDisposable Members

        public void Dispose()
        {
            _manager.Dispose();
        }

        #endregion
    }
}
