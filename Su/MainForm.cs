using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SUCore.Computing;
using SULibrary;
using System.Diagnostics;

namespace Su
{
	public partial class MainForm : Form
	{
		/// <summary>
		/// Плагины для расчёта
		/// </summary>
		List<IComputingPlugin> _plugins = PluginsLoader.LoadPlugins();

		public MainForm()
		{
			InitializeComponent();

			pluginsView1.AddRange(_plugins);
			computingProcessorControl1.Plugins = _plugins;
		}

		public void Save()
		{
			try
			{
				plowMachineBaseView1.SavePlowMachine();
				MessageBox.Show("Изменения сохранены успешно.", "Сохранение", MessageBoxButtons.OK, MessageBoxIcon.Information);

			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
				EventLog.WriteEntry("SU", ex.Message + "/n" + ex.StackTrace, EventLogEntryType.Error);
			}
		}

		public void SaveAsPrototype()
		{
			try
			{
				plowMachineBaseView1.CurrentPlowMachine.IsPrototype = true;
				plowMachineBaseView1.SavePlowMachine();
				MessageBox.Show("Изменения сохранены успешно.", "Сохранение", MessageBoxButtons.OK, MessageBoxIcon.Information);

			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
				EventLog.WriteEntry("SU", ex.Message + "/n" + ex.StackTrace, EventLogEntryType.Error);
			}
		}

		public void New()
		{
			string pmname = string.Empty;
			using (Dialogs.NameDialog name = new Su.Dialogs.NameDialog())
			{
				name.ShowDialog();
				pmname = name.EnteredText;
			}

			plowMachineBaseView1.CreteNewPlowMachine();
			plowMachineBaseView1.CurrentPlowMachine.Name = pmname;
			plowMachineBaseView1.RefreshView();

			pluginsView1.PlowMachine = plowMachineBaseView1.CurrentPlowMachine;
			computingProcessorControl1.PlowMachine = plowMachineBaseView1.CurrentPlowMachine;
		}

		public void Open()
		{
			using (Dialogs.OpenPlowMachineDialog dlg = new Dialogs.OpenPlowMachineDialog(true))
			{
				dlg.ShowDialog();

				if (dlg.DialogResult == DialogResult.OK)
				{
					plowMachineBaseView1.CurrentPlowMachine = dlg.SelectedPlowMachine;
					plowMachineBaseView1.RefreshView();

					pluginsView1.PlowMachine = plowMachineBaseView1.CurrentPlowMachine;
					computingProcessorControl1.PlowMachine = plowMachineBaseView1.CurrentPlowMachine;
				}
			}
		}

		private void newToolStripMenuItem_Click(object sender, EventArgs e)
		{
			New();
		}

		private void openToolStripMenuItem_Click(object sender, EventArgs e)
		{
			Open();
		}

		private void saveToolStripMenuItem_Click(object sender, EventArgs e)
		{
			Save();
		}

		private void exitToolStripMenuItem_Click(object sender, EventArgs e)
		{
			Application.Exit();
		}

		private void newToolStripButton_Click(object sender, EventArgs e)
		{
			New();
		}

		private void openToolStripButton_Click(object sender, EventArgs e)
		{
			Open();
		}

		private void saveToolStripButton_Click(object sender, EventArgs e)
		{
			Save();
		}

		private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
		{
			using (AboutBox about = new AboutBox())
			{
				about.ShowDialog();
			}
		}

		private void settingsToolStripMenuItemToolStripMenuItem_Click(object sender, EventArgs e)
		{
			using (SettingsForm frm = new SettingsForm())
			{
				frm.ShowDialog();
			}
		}

		private void suSettingsToolStripMenuItemToolStripMenuItem_Click(object sender, EventArgs e)
		{
			using (SUModulesSettingsForms frm = new SUModulesSettingsForms())
			{
				frm.ShowDialog();
			}
		}

		private void computingProcessorControl1_Load(object sender, EventArgs e)
		{

		}

		private void MainForm_Load(object sender, EventArgs e)
		{

		}

		private void toolStripMenuItem2_Click(object sender, EventArgs e)
		{
			SaveAsPrototype();
		}


		private void tlstrSaveAsPototype_Click(object sender, EventArgs e)
		{
			SaveAsPrototype();
		}

		private void tlstrbtnDelete_Click(object sender, EventArgs e)
		{

		}

		private void btnDelete_Click(object sender, EventArgs e)
		{
			Deleted();
		}

		private void Deleted()
		{
			if (plowMachineBaseView1.CurrentPlowMachine != null)
			{
				if (plowMachineBaseView1.CurrentPlowMachine.IsPrototype == true)
				{
					MessageBox.Show("Прототип удалить нельзя.", "Внимание", MessageBoxButtons.OK, MessageBoxIcon.Information);
					return;
				}

				if (MessageBox.Show("Вы действиельно хотите удалить текущую СУ?", "Подтверждение удаления", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
				{
					try
					{
						plowMachineBaseView1.DeletePlowMachine();
						pluginsView1.PlowMachine = null;
					}
					catch (Exception ex)
					{
						MessageBox.Show(ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
					}

				}
			}
		}

		private void btnSetModes_Click(object sender, EventArgs e)
		{
			new ModesForm(this.plowMachineBaseView1.CurrentPlowMachine).Show();
		}

		private void построитьЧертежToolStripMenuItem_Click(object sender, EventArgs e)
		{
			Process.Start(System.IO.Path.GetFullPath("gendemo.exe"));
		}
	}
}
