using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SULibrary;

namespace Su.Dialogs
{
    public partial class SelectPluginDialog : Form
    {
        private List<IComputingPlugin> _plugins;

        public SelectPluginDialog()
        {
            InitializeComponent();
        }

        private void btnSelect_Click(object sender, EventArgs e)
        {
            SelectedPlugin = (IComputingPlugin)dataGridView1.SelectedRows[0].DataBoundItem;
            DialogResult = DialogResult.OK;
            Close();
        }

        public IComputingPlugin SelectedPlugin { get; private set; }
      
        public List<IComputingPlugin> Plugins
        {
            get
            {
                return _plugins;
            }
            set
            {
                if (value != null)
                {
                    _plugins = value;

                    dataGridView1.AutoGenerateColumns = false;
                    dataGridView1.Columns.Clear();

                    DataGridViewColumn column = new DataGridViewColumn(new DataGridViewTextBoxCell());
                    column.DataPropertyName = "Name";
                    dataGridView1.Columns.Add(column);

                    dataGridView1.DataSource = _plugins;
                }
            }
        }
    }
}
      
        