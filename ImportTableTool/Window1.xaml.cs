using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data;
using System.Data.SqlClient;
using SUCore.Metadata;

namespace ImportTable
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            foreach (DataRow row in System.Data.Sql.SqlDataSourceEnumerator.Instance.GetDataSources().Rows)
            {
                cmbbxSqlServer.Items.Add(row["ServerName"]);
            }

           
        }

        private void cmbbxSqlServer_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SqlConnectionStringBuilder bldr = new SqlConnectionStringBuilder();
            bldr.DataSource = cmbbxSqlServer.SelectedValue.ToString();
            bldr.IntegratedSecurity = true;


            try
            {
                using (SqlConnection connection = new SqlConnection(bldr.ConnectionString))
                {
                    connection.Open();
                    DataTable databases = connection.GetSchema(SqlClientMetaDataCollectionNames.Databases);
                    foreach (DataRow db in databases.Rows)
                    {
                        cmbbxDatabase.Items.Add(db["database_name"]);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void cmbbxTables_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            txbxModuleName.Text = cmbbxTables.SelectedItem.ToString();
        }

        private void cmbbxDatabase_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SqlConnectionStringBuilder bldr = new SqlConnectionStringBuilder();
            bldr.DataSource = cmbbxSqlServer.SelectedValue.ToString();
            bldr.InitialCatalog = cmbbxDatabase.SelectedItem.ToString();
            bldr.IntegratedSecurity = true;

            try
            {
                using (SqlConnection connection = new SqlConnection(bldr.ConnectionString))
                {
                    connection.Open();
                    DataTable tables = connection.GetSchema(SqlClientMetaDataCollectionNames.Tables, new string[] {null, null, null, "BASE TABLE"});
                    foreach (DataRow table in tables.Rows)
                    {
                        cmbbxTables.Items.Add(table[2]);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnCreate_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                SqlConnectionStringBuilder bldr = new SqlConnectionStringBuilder();
                bldr.DataSource = cmbbxSqlServer.SelectedValue.ToString();
                bldr.InitialCatalog = cmbbxDatabase.SelectedItem.ToString();
                bldr.IntegratedSecurity = true;
                bldr.MultipleActiveResultSets = true;

                using (SqlConnection connection = new SqlConnection(bldr.ConnectionString))
                {
                    SqlCommand cmd = connection.CreateCommand();
                    cmd.CommandText = "SELECT * FROM " + cmbbxTables.SelectedItem.ToString();

                    //
                    //  схема столбцов выбранной таблицы
                    //
                    connection.Open();
                    DataTable schema = null;
                    using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SchemaOnly))
                    {
                        schema = reader.GetSchemaTable();
                    }
                    

                    //
                    //  создаем модуль в СУ
                    //
                    using (MetadataManager manager = new MetadataManager())
                    {
                        ModuleMetadata metadata = new ModuleMetadata();
                        metadata.ModuleName = txbxModuleName.Text;

                        foreach (DataRow column in schema.Rows)
                        {
                            FieldMetadata f = new FieldMetadata();
                            f.FieldName = (string)column[0];            //  название столбца
                            f.ClrType = ((Type)column[12]).FullName;    //  тип в Clr


                            if (IsExist(f.FieldName))
                            {
                                throw new InvalidOperationException("Поле '" + f.FieldName + "' уже существует.");
                            }

                            f.Description = GetFieldDescription(f.FieldName, connection);

                            metadata.MetadataFields.Add(f);
                        }

                        manager.CreateModule(metadata);

                        //  если все прошло удачно
                        MessageBox.Show("Готово.", "Операция завершена успешно", MessageBoxButton.OK, MessageBoxImage.Information);
                    }                    
                }

               
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.InnerException != null ? ex.InnerException.Message : ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private bool IsExist(string fieldname)
        {
            SqlConnectionStringBuilder bldr = new SqlConnectionStringBuilder();
            bldr.DataSource = ".";
            bldr.InitialCatalog = "ASPM2003_SU_Database";
            bldr.IntegratedSecurity = true;

            using (SqlConnection connection = new SqlConnection(bldr.ConnectionString))
            {
                connection.Open();

                SqlCommand cmd = connection.CreateCommand();
                cmd.CommandText = "SELECT COUNT(*) FROM MetadataFields WHERE FieldName ='" + fieldname + "'";

                int count = (int)cmd.ExecuteScalar();

                if (count != 0) return true;

                connection.Close();
            }

            return false;
        }

        private string GetFieldDescription(string paramName, SqlConnection connection)
        {
            string result = string.Empty;

            try
            {
                SqlCommand cmd = connection.CreateCommand();
                cmd.CommandText = "SELECT name_param FROM modul WHERE name_field = '" + paramName + "'";
                result = (string)cmd.ExecuteScalar();
                
            }
            catch
            { 
            }

            return result;
        }
    }
}
