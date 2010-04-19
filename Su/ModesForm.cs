using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SUCore.Computing;
using SUCore.PlowMachine;
using SULibrary;

namespace Su
{
	public partial class ModesForm : Form
	{
		private PlowMachine plowMashine;

		private static List<IMode> modes = PluginsLoader.LoadModes();

		private IMode selectedMode;

		public ModesForm(PlowMachine mashine)
		{
			InitializeComponent();
			plowMashine = mashine;
			if (plowMashine == null)
				btnCalculate.Enabled = false;
			cbModes.DataSource = modes;
			cbModes.DisplayMember = "Name";
		}

		private void btnCalculate_Click(object sender, EventArgs e)
		{
			ParametersHelper.SaveParams(
				selectedMode.Calculate(
					ParametersHelper.GetParams(selectedMode.InputParams, plowMashine)
					), plowMashine);
		}

		private void cbModes_SelectedIndexChanged(object sender, EventArgs e)
		{
			selectedMode = modes[cbModes.SelectedIndex];
			if (plowMashine != null)
				btnCalculate.Enabled = true;
			parametersView.Params = ParametersHelper.GetParams(selectedMode.InputParams, plowMashine);
		}
	}
}
