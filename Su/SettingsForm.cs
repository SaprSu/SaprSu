using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Su
{
    
    public partial class SettingsForm : Form
    {
        public SettingsForm()
        {
            InitializeComponent();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            //
            //  насройки БД
            //
            SqlConnectionStringBuilder bldr = new SqlConnectionStringBuilder(SUCore.DBConnectionHelper.GetConnectionString());
            bldr.DataSource = txbxServer.Text;
            bldr.InitialCatalog = txbxDatabase.Text;
            SUCore.DBConnectionHelper.SaveConnectionString(bldr.ConnectionString);

            Close();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void SettingsForm_Load(object sender, EventArgs e)
        {
            SqlConnectionStringBuilder bldr = new SqlConnectionStringBuilder(SUCore.DBConnectionHelper.GetConnectionString());
            txbxServer.Text = bldr.DataSource;
            txbxDatabase.Text = bldr.InitialCatalog;            
        }

        private void btnTestConnection_Click(object sender, EventArgs e)
        {
            SqlConnectionStringBuilder bldr = new SqlConnectionStringBuilder(SUCore.DBConnectionHelper.GetConnectionString());
            bldr.DataSource = txbxServer.Text;
            bldr.InitialCatalog = txbxDatabase.Text;

            using (SqlConnection connection = new SqlConnection(bldr.ConnectionString))
            {
                bool withErrors = false;
                    
                try
                {
                    connection.Open();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Ошибка",MessageBoxButtons.OK, MessageBoxIcon.Error);
                    withErrors = true;
                }

                if (!withErrors)
                {
                    MessageBox.Show("Ok", "Инофрмация", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

                connection.Close();
            }
        }
    }
}
