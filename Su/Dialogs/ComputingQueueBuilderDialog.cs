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
    public partial class ComputingQueueBuilderDialog : Form
    {
        List<IComputingPlugin> _plugins;
        List<IComputingPlugin> _selectedPlugin = new List<IComputingPlugin>();

        public ComputingQueueBuilderDialog()
        {
            InitializeComponent();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;           
            Close();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.OK;
            Close();
        }

        public Queue<IComputingPlugin> Queue
        {
            get
            {
                return new Queue<IComputingPlugin>(_selectedPlugin);
            }
        }

        public List<IComputingPlugin> Plugins 
        { 
            get 
            { 
                return _plugins;
            } 
            set
            {
                _plugins = value;
                lstbxSourcePlugins.DataSource = _plugins;
                lstbxSourcePlugins.DisplayMember = "Name";                
            }
        }

        private void UpdateSelectedPluginsListBox()
        {
            lstbxBuildedListOfPlgins.BeginUpdate();
            lstbxBuildedListOfPlgins.DataSource = null;
            lstbxBuildedListOfPlgins.DataSource = _selectedPlugin;
            lstbxBuildedListOfPlgins.DisplayMember = "Name";
            lstbxBuildedListOfPlgins.EndUpdate();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            IComputingPlugin selected = (IComputingPlugin)lstbxSourcePlugins.SelectedItem;
            _selectedPlugin.Add(selected);
            UpdateSelectedPluginsListBox();                 
        }      

        private void btnRemove_Click(object sender, EventArgs e)
        {
            IComputingPlugin selected = (IComputingPlugin)lstbxBuildedListOfPlgins.SelectedItem;
            _selectedPlugin.Remove(selected);
            UpdateSelectedPluginsListBox(); 
        }

        private void btnUp_Click(object sender, EventArgs e)
        {
            int selectedIndex = lstbxBuildedListOfPlgins.SelectedIndex;

            if (selectedIndex != 0)
            {
                _selectedPlugin.Reverse(selectedIndex - 1, 2);
                lstbxBuildedListOfPlgins.SelectedIndex = selectedIndex - 1;
                UpdateSelectedPluginsListBox();
            }
        }

        private void btnDown_Click(object sender, EventArgs e)
        {
            int selectedIndex = lstbxBuildedListOfPlgins.SelectedIndex;

            if (selectedIndex != lstbxBuildedListOfPlgins.Items.Count - 1)
            {
                _selectedPlugin.Reverse(selectedIndex, 2);
                lstbxBuildedListOfPlgins.SelectedIndex = selectedIndex + 1;
                UpdateSelectedPluginsListBox();
            }
        }
    }
}
