using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SULibrary;
using SUCore.PlowMachine;
using System.Diagnostics;

namespace Su.Views
{
    public partial class PluginsView : UserControl
    {
        List<IComputingPlugin> _plugins = new List<IComputingPlugin>();
        PlowMachine _plowmachine;

        public PluginsView()
        {
            InitializeComponent();            
        }

        public void AddPlugin(IComputingPlugin plugin)
        {
            _plugins.Add(plugin);
            InitializeTabControl(_plugins);
        }

        public void AddRange(IEnumerable<IComputingPlugin> plgins)
        {
            _plugins.AddRange(plgins);
            InitializeTabControl(_plugins);
        }

        public void RemovePlugin(string pluginName)
        {
            IComputingPlugin finded = _plugins.Find(delegate(IComputingPlugin p)
            {
                return p.Name.Equals(pluginName, StringComparison.InvariantCultureIgnoreCase);
            });

            if (finded != null)
            {
                _plugins.Remove(finded);
                InitializeTabControl(_plugins);
            }
        }

        private void InitializeTabControl(List<IComputingPlugin> plugins)
        {
            tabctrlPlugins.TabPages.Clear();

            if (_plowmachine == null) return;

            foreach (var p in plugins)
            {
                try
                {
                    TabPage tab = new TabPage(p.Name);

                    //  полчаем список параметров из плагина
                    Parameters parameters = ParametersHelper.GetParams(p.InputParams, PlowMachine);

                    //
                    // подготавливаем view
                    //
                    ParametersView pview = new ParametersView(parameters);
                    pview.Dock = DockStyle.Fill;

                    tab.Controls.Add(pview);

                    tabctrlPlugins.TabPages.Add(tab);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ошибка при загрузке входных параметров плагина для отображения.\nПлагин '" + p.Name + "'.\nСообщение об ошибке:\n\t" + ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    EventLog.WriteEntry("SU", ex.Message + "\n" + ex.StackTrace, EventLogEntryType.Error);
                }
            }
        }

        public PlowMachine @PlowMachine 
        {
            get
            {
                return _plowmachine;
            }
            set
            {
                _plowmachine = value;
                InitializeTabControl(_plugins);
            }
        }

    }
}
