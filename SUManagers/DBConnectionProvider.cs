using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Data.Common;

namespace SUCore
{
    sealed class DBConnectionProvider
    {
        static System.Data.Common.DbProviderFactory _factory;
        static ConnectionStringSettings _connectionStringSettings;

        static DBConnectionProvider()
        {
            _connectionStringSettings = ConfigurationManager.ConnectionStrings["SU_DB"];

            // создаем фабрику для провайдера указанного в файле конфигурации
            _factory = DbProviderFactories.GetFactory(_connectionStringSettings.ProviderName);        
        }

        public static System.Data.Common.DbConnection GetConnection()
        {
            //
            //  инициализируем соединение с БД, со строкрой подключения из config файла
            //
            System.Data.Common.DbConnection connection = _factory.CreateConnection();
            connection.ConnectionString = _connectionStringSettings.ConnectionString;
            return connection;
        }

        public static System.Data.Common.DbDataAdapter GetAdapter()
        {
            return _factory.CreateDataAdapter();
        }

        public static System.Data.Common.DbCommandBuilder GetCommandBuilder()
        {
            return _factory.CreateCommandBuilder();
        }
    }
}
