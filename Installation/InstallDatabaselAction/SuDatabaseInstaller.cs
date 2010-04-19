using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration.Install;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Threading;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Win32;
using System.Security.Principal;

namespace InstallDatabaselAction
{
   
    [RunInstaller(true)]
    public class SuDatabaseInstaller : Installer
    {
        public override void Install(System.Collections.IDictionary stateSaver)
        {
            base.Install(stateSaver);

            string sqlServer = Context.Parameters["SQLSERVER"];

            

           
            SqlConnectionStringBuilder bldr = new SqlConnectionStringBuilder();
            bldr.DataSource = sqlServer;
            bldr.IntegratedSecurity = true;


            //WindowsIdentity wi = WindowsIdentity.GetCurrent(false);
            //EventLog.WriteEntry("Install", wi.Name);
            //WindowsImpersonationContext impersonationContext = wi.Impersonate();

            EventLog.WriteEntry("Install", bldr.ConnectionString);

            //
            //  проверка БД
            //
            bool isExists = false;
            using (SqlConnection connection = new SqlConnection(bldr.ConnectionString))
            {
                connection.Open();

                DataTable schema = connection.GetSchema(SqlClientMetaDataCollectionNames.Databases);

                var query = from db in schema.AsEnumerable()
                            where db["database_name"].ToString().Equals("ASPM2003_SU_Database", StringComparison.InvariantCultureIgnoreCase)
                            select db;

                if (query.Count() != 0)
                {
                    EventLog.WriteEntry("Install", "БД существует.");
                    isExists = true;
                }

                connection.Close();
            }

            if (!isExists)
            {
                #region Создаем базу
                using (SqlConnection connection = new SqlConnection(bldr.ConnectionString))
                {
                    string[] commands = Properties.Resources.sqlscript.Split(new string[] { "GO" }, StringSplitOptions.None);

                    try
                    {
                        EventLog.WriteEntry("Install", "Создаём...");
                        connection.Open();
                        foreach (var command in commands)
                        {
                            SqlCommand cmd = connection.CreateCommand();
                            cmd.CommandText = command;
                            cmd.ExecuteNonQuery();
                        }
                        EventLog.WriteEntry("Install", "Ok.");
                    }
                    catch(Exception ex)
                    {
                        EventLog.WriteEntry("Install", "Ошибка. " + ex.Message, EventLogEntryType.Error);
                        throw new InstallException("Не удалось создать БД СУ", ex);
                    }
                    finally
                    {
                        connection.Close();
                    }
                }
                #endregion
            }

            bldr.InitialCatalog = "ASPM2003_SU_Database";
            Registry.LocalMachine.OpenSubKey(@"SOFTWARE\MSMU\SAPR SU", true).SetValue("ConnectionString", bldr.ConnectionString);


            //impersonationContext.Undo();
        }
    }
}
