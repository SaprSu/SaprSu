using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using Microsoft.Win32;
using System.Diagnostics;
using System.Data.SqlClient;

namespace SUCore
{
    public class DBConnectionHelper
    {
        public static string GetConnectionString()
        {
            //ConnectionStringSettings css = ConfigurationManager.ConnectionStrings["SU_DB"];
            
            //HKEY_LOCAL_MACHINE\SOFTWARE\MSMU\SAPR SU
            string connectionString = "Data Source=.;Initial Catalog=ASPM2003_SU_Database;Integrated Security=True";//string.Empty;

            try
            {
                connectionString = (string)Registry.LocalMachine.OpenSubKey(@"SOFTWARE\MSMU\SAPR SU").GetValue("ConnectionString");
            }
            catch(Exception ex)
            {
                EventLog.WriteEntry("SU", ex.Message + "\n" + ex.StackTrace, EventLogEntryType.Error);
            }

            if (connectionString == string.Empty)
            {
                throw new InvalidOperationException("Строка подключения к БД СУ не найдена");
            }

            return connectionString;
        }

        public static void SaveConnectionString(string connectionString)
        {
            Registry.LocalMachine.OpenSubKey(@"SOFTWARE\MSMU\SAPR SU").SetValue("ConnectionString", new SqlConnectionStringBuilder(connectionString).ConnectionString);
        }
    }
}
