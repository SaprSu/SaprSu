using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SUCore.PlowMachine;

namespace Su.Dialogs
{
    public partial class OpenPlowMachineDialog : Form
    {
        bool _selectPrototype = true;
        List<PlowMachine> _loadedList;

        PlowMachineManager _manager = null;

        public OpenPlowMachineDialog()
        {
            InitializeComponent();
        }

        public OpenPlowMachineDialog(bool selectPrototype) : this()
        {
            _selectPrototype = selectPrototype;
            chxbxSelectPrototype.Checked = true;
        }

        private void OpenPlowMachineDialog_Load(object sender, EventArgs e)
        {
            _manager = new PlowMachineManager();

            _loadedList = _manager.GetPlowMachineList();

            if (!_selectPrototype)
                plowMachineBindingSource.DataSource = _loadedList;
            else
                plowMachineBindingSource.DataSource = from p in _loadedList where p.IsPrototype == true select p;

        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            if (plowMachineDataGridView.SelectedRows.Count != 0)
            {
                PlowMachine pm = (PlowMachine)plowMachineDataGridView.SelectedRows[0].DataBoundItem;


                pm = _manager.LoadPlowMachine(pm.PlowMachineId);

                if (pm.IsPrototype)
                    if (DialogResult.Yes == MessageBox.Show("Вы хотите использовать прототип в качестве основы для новой СУ?", "", MessageBoxButtons.YesNo))
                    {
                        pm = _manager.ClonePlowMachine(pm);

                        string pmname = string.Empty;

                        using (Dialogs.NameDialog name = new Su.Dialogs.NameDialog())
                        {
                            name.ShowDialog();
                            pmname = name.EnteredText;
                        }

                        pm.Name = pmname;
                    }
                    else
                    {
                        pm = null;
                    }


                SelectedPlowMachine = pm;

            }

            DialogResult = DialogResult.OK;
            Close();
        }

        public PlowMachine SelectedPlowMachine { get; private set; }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
            Close();
        }

        private void chxbxSelectPrototype_CheckStateChanged(object sender, EventArgs e)
        {

            if (chxbxSelectPrototype.Checked)
            {
                _selectPrototype = true;
                plowMachineBindingSource.DataSource = from p in _loadedList where p.IsPrototype == true select p;

            }
            else
            {
                _selectPrototype = false;
                plowMachineBindingSource.DataSource = _loadedList;
            }

        }

        private void OpenPlowMachineDialog_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (_manager != null) _manager.Dispose();
        }

        
    }

    
}
