using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SULibrary;
using System.Collections;
using System.Collections.Specialized;

namespace Su.Dialogs
{
    public partial class AutoModeSettingsDialog : Form
    {
        public AutoModeSettingsDialog()
        {
            InitializeComponent();
        }
        
        public List<IComputingPlugin> Plugins { get; set; }

        private void btnPlowWidth_Click(object sender, EventArgs e)
        {
            txbxPlowWidth.Text = ShowSelectPluginDialog();
        }

        private string ShowSelectPluginDialog()
        {
            string selectedPluginName = string.Empty;
            using (SelectPluginDialog dlg = new SelectPluginDialog())
            {
                dlg.Plugins = Plugins;
                dlg.ShowDialog();

                if (dlg.DialogResult == DialogResult.OK)
                {
                    selectedPluginName = dlg.SelectedPlugin.Name;
                }
            }
            return selectedPluginName;
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnPlowHeigth_Click(object sender, EventArgs e)
        {
            txbxPlowHeigth.Text = ShowSelectPluginDialog();
        }

        private void btnCuttingEfforts_Click(object sender, EventArgs e)
        {
            txbxCuttingEfforts.Text = ShowSelectPluginDialog();
        }

        private void btnActiveLoading_Click(object sender, EventArgs e)
        {
            txbxActiveLoading.Text = ShowSelectPluginDialog();
        }

        private void btnTractiveEffort1_Click(object sender, EventArgs e)
        {
            txbxTractiveEffort1.Text = ShowSelectPluginDialog();
        }

        private void btnTractiveEffort2_Click(object sender, EventArgs e)
        {
            txbxTractiveEffort2.Text = ShowSelectPluginDialog();
        }

        private void btnElectricDrive_Click(object sender, EventArgs e)
        {
            txbxElectricDrive.Text = ShowSelectPluginDialog();
        }

        private void btnProductivity_Click(object sender, EventArgs e)
        {
            txbxProductivity.Text = ShowSelectPluginDialog();
        }

        private void btnCheckingDynamic_Click(object sender, EventArgs e)
        {
            txbxCheckingDynamic.Text = ShowSelectPluginDialog();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            StringDictionary coll = new StringDictionary();

            #region Заполняем
            if (!coll.ContainsKey("PlowHeigth"))
                coll.Add("PlowHeigth", txbxPlowHeigth.Text);
            else
                coll["PlowHeigth"] = txbxPlowHeigth.Text;

            if (!coll.ContainsKey("PlowWidth"))
                coll.Add("PlowWidth", txbxPlowWidth.Text);
            else
                coll["PlowWidth"] = txbxPlowWidth.Text;

            if (!coll.ContainsKey("CuttingEfforts"))
                coll.Add("CuttingEfforts", txbxCuttingEfforts.Text);
            else
                coll["CuttingEfforts"] = txbxCuttingEfforts.Text;

            if (!coll.ContainsKey("ActiveLoading"))
                coll.Add("ActiveLoading", txbxActiveLoading.Text);
            else
                coll["ActiveLoading"] = txbxActiveLoading.Text;

            if (!coll.ContainsKey("TractiveEffort1"))
                coll.Add("TractiveEffort1", txbxTractiveEffort1.Text);
            else
                coll["TractiveEffort1"] = txbxTractiveEffort1.Text;

            if (!coll.ContainsKey("TractiveEffort2"))
                coll.Add("TractiveEffort2", txbxTractiveEffort2.Text);
            else
                coll["TractiveEffort2"] = txbxTractiveEffort2.Text;

            if (!coll.ContainsKey("ElectricDrive"))
                coll.Add("ElectricDrive", txbxElectricDrive.Text);
            else
                coll["ElectricDrive"] = txbxElectricDrive.Text;

            if (!coll.ContainsKey("Productivity"))
                coll.Add("Productivity", txbxProductivity.Text);
            else
                coll["Productivity"] = txbxProductivity.Text;

            if (!coll.ContainsKey("CheckingDynamic"))
                coll.Add("CheckingDynamic", txbxCheckingDynamic.Text);
            else
                coll["CheckingDynamic"] = txbxCheckingDynamic.Text;
            #endregion

            SettingsHelper.SaveAutoModePluginsMap(coll);

            Close();
        }

        private void AutoModeSettingsDialog_Load(object sender, EventArgs e)
        {
            StringDictionary coll = SettingsHelper.GetAutoModePluginsMap();

            #region Заполняем
            
            if (coll.ContainsKey("PlowHeigth"))
                txbxPlowHeigth.Text = coll["PlowHeigth"];

            if (coll.ContainsKey("PlowWidth"))
                txbxPlowWidth.Text = coll["PlowWidth"];

            if (coll.ContainsKey("CuttingEfforts"))
                txbxCuttingEfforts.Text = coll["CuttingEfforts"];

            if (coll.ContainsKey("ActiveLoading"))
                txbxActiveLoading.Text = coll["ActiveLoading"];

            if (coll.ContainsKey("TractiveEffort1"))
                txbxTractiveEffort1.Text = coll["TractiveEffort1"];

            if (coll.ContainsKey("TractiveEffort2"))
                txbxTractiveEffort2.Text = coll["TractiveEffort2"];

            if (coll.ContainsKey("ElectricDrive"))
                txbxElectricDrive.Text = coll["ElectricDrive"];

            if (coll.ContainsKey("Productivity"))
                txbxProductivity.Text = coll["Productivity"];

            if (coll.ContainsKey("CheckingDynamic"))
                txbxCheckingDynamic.Text = coll["CheckingDynamic"];

            #endregion
        }
    }
}
