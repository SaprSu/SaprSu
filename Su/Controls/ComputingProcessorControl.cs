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
using SUCore.Computing;
using System.Configuration;
using System.Collections.Specialized;

namespace Su.Controls
{   
    public partial class ComputingProcessorControl : UserControl
    {
        List<IComputingPlugin> _plugins = new List<IComputingPlugin>();
        Queue<IComputingPlugin> _queue = new Queue<IComputingPlugin>();
        ComputingProcessor _computingProcessor;
        bool _isProcessing = false;

        public bool UseLog { get; set; }

        public ComputingProcessorControl()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Плагины
        /// </summary>
        public List<IComputingPlugin> Plugins
        {
            get { return _plugins; }
            set { _plugins = value; }
        }

        public PlowMachine @PlowMachine { get; set; }

        private void chxbxAutoMode_CheckedChanged(object sender, EventArgs e)
        {
            if (chxbxAutoMode.Checked)
            {
                grpbxAutoMode.Enabled = true;
                grpbxUserMode.Enabled = false;
            }
            else
            {
                grpbxAutoMode.Enabled = false;
                grpbxUserMode.Enabled = true;
            }
        }

        private void btnUserModeSettings_Click(object sender, EventArgs e)
        {
            using (Dialogs.ComputingQueueBuilderDialog dlg = new Dialogs.ComputingQueueBuilderDialog())
            {
                dlg.Plugins = Plugins;
                if (DialogResult.OK == dlg.ShowDialog())
                {
                    _queue = dlg.Queue;
                }
            }
        }

        private void btnStartStop_Click(object sender, EventArgs e)
        {
            try
            {
                if (!_isProcessing)
                {
                    _computingProcessor = new ComputingProcessor(PlowMachine, _queue, UseLog);

                    if (chxbxAutoMode.Checked)
                    {
                        ComputeInAutoMode();
                    }
                    else
                    {
                        if (chxbxStepByStepMode.Checked)
                        {
                            #region Расчёт в пользрвательском режиме пошагово
                            _computingProcessor.PluginComputeEnd += delegate(string pluginName)
                                            {
                                                MessageBox.Show("Расчет плагина '" + pluginName + "' закончен.", "Информация", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                            };

                            _computingProcessor.ComputingProcessingEnd += delegate
                            {
                                MessageBox.Show("Расчет закончен.", "Информация", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            };


                            bool result = _computingProcessor.ComputeNextPlugin();
                            if (result) btnNext.Enabled = true;

                            _isProcessing = true;
                            btnStartStop.Text = "Стоп";
                            #endregion
                        }
                        else
                        {
                            #region Расчёт в пользовательском режиме "все за раз"
                            _computingProcessor.ComputingProcessingEnd += delegate
                                           {
                                               MessageBox.Show("Расчет закончен.", "Информация", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                           };

                            _computingProcessor.ProcessAll();
                            #endregion
                        }
                    }
                }
                else
                {
                    btnNext.Enabled = false;
                    btnStartStop.Text = "Запуск";
                    _isProcessing = false;
                    _computingProcessor = null;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void ComputeInAutoMode()
        {
            StringDictionary plugins = SettingsHelper.GetAutoModePluginsMap();

            #region PlowWidth
            PlowWidth:
            if (plugins.ContainsKey("PlowWidth"))
            {
                IComputingPlugin plugin = GetPluginByName(plugins["PlowWidth"]);
                if (plugin == null)
                {
                    MessageBox.Show("Не найден плагин для расчёта толщины струга.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    goto Finish;
                }

                ComputingProcessor.Compute(PlowMachine, plugin, UseLog);

                if (chxbxDebugMode.Checked)
                {
                    if (DialogResult.Cancel == MessageBox.Show("Расчёта толщины струга закончен. Продолжить расчёт?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
                    {
                        goto Finish;
                    }
                }

            }
            else
            {
                MessageBox.Show("Не указан плагин для расчёта толщины струга.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                goto Finish;
            } 
            #endregion

            #region PlowHeigth
            PlowHeigth:
            if (plugins.ContainsKey("PlowHeigth"))
            {
                IComputingPlugin plugin = GetPluginByName(plugins["PlowHeigth"]);
                if (plugin == null)
                {
                    MessageBox.Show("Не найден плагин для расчёта высоты струга.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    goto Finish;
                }

                ComputingProcessor.Compute(PlowMachine, plugin, UseLog);

                if (chxbxDebugMode.Checked)
                {
                    if (DialogResult.Cancel == MessageBox.Show("Расчёта высоты струга закончен. Продолжить расчёт?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
                    {
                        if (DialogResult.Cancel == MessageBox.Show("Прекратить расчёт?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
                        {
                            goto PlowWidth;
                        }
                        goto Finish;
                    }
                }
            }
            else
            {
                MessageBox.Show("Не указан плагин для расчёта высоты струга.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                goto Finish;
            } 
            #endregion
           
            #region CuttingEfforts
            CuttingEfforts:
            if (plugins.ContainsKey("CuttingEfforts"))
            {
                IComputingPlugin plugin = GetPluginByName(plugins["CuttingEfforts"]);
                if (plugin == null)
                {
                    MessageBox.Show("Не найден плагин для расчёта режущих усилий.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    goto Finish;
                }

                ComputingProcessor.Compute(PlowMachine, plugin, UseLog);

                if (chxbxDebugMode.Checked)
                {
                    if (DialogResult.Cancel == MessageBox.Show("Расчёта режущих усилий закончен. Продолжить расчёт?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
                    {
                        if (DialogResult.Cancel == MessageBox.Show("Прекратить расчёт?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
                        {
                            goto PlowHeigth;
                        }

                        goto Finish;
                    }
                }
            }
            else
            {
                MessageBox.Show("Не указан плагин для расчёта расчёта режущих усилий.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                goto Finish;
            } 
            #endregion

            #region ActiveLoading
            ActiveLoading:
            if (DialogResult.Cancel == MessageBox.Show("С активной погузкой?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
            {
                goto TractiveEffort;
            }

            if (plugins.ContainsKey("ActiveLoading"))
            {
                IComputingPlugin plugin = GetPluginByName(plugins["ActiveLoading"]);
                if (plugin == null)
                {
                    MessageBox.Show("Не найден плагин для расчёта активной погрузки.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    goto Finish;
                }

                ComputingProcessor.Compute(PlowMachine, plugin, UseLog);

                if (chxbxDebugMode.Checked)
                {
                    if (DialogResult.Cancel == MessageBox.Show("Расчёт активной погузки закончен. Продолжить расчёт?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
                    {
                        if (DialogResult.Cancel == MessageBox.Show("Прекратить расчёт?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
                        {
                            goto CuttingEfforts;
                        }
                        goto Finish;
                    }
                }
            }
            else
            {
                MessageBox.Show("Не указан плагин для расчёта расчёта активной погрузки.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                goto Finish;
            } 
            #endregion

            TractiveEffort:
            if (DialogResult.Cancel == MessageBox.Show("С наклонной направляющей?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
            {
                goto TractiveEffort1;
            }
            else
            {
                goto TractiveEffort2;
            }

            #region TractiveEffort1
            TractiveEffort1:
            if (plugins.ContainsKey("TractiveEffort1"))
            {
                IComputingPlugin plugin = GetPluginByName(plugins["TractiveEffort1"]);
                if (plugin == null)
                {
                    MessageBox.Show("Не найден плагин для расчёта тяговых усилий отрывного действия.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    goto Finish;
                }

                ComputingProcessor.Compute(PlowMachine, plugin, UseLog);

                if (chxbxDebugMode.Checked)
                {
                    if (DialogResult.Cancel == MessageBox.Show("Расчёт тяговых усилий усилий. Продолжить расчёт?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
                    {
                        if (DialogResult.Cancel == MessageBox.Show("Прекратить расчёт?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
                        {
                            goto ActiveLoading;
                        }
                        goto Finish;
                    }
                }
            }
            else
            {
                MessageBox.Show("Не указан плагин для расчёта расчёта тяговых усилий отрывного действия.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                goto Finish;
            }

            
            #endregion

            #region TractiveEffort2
            TractiveEffort2:
            if (plugins.ContainsKey("TractiveEffort2"))
            {
                IComputingPlugin plugin = GetPluginByName(plugins["TractiveEffort2"]);
                if (plugin == null)
                {
                    MessageBox.Show("Не найден плагин для расчёта тяговых усилий с наклонной направляющей.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    goto Finish;
                }

                ComputingProcessor.Compute(PlowMachine, plugin, UseLog);

                if (chxbxDebugMode.Checked)
                {
                    if (DialogResult.Cancel == MessageBox.Show("Расчёт тяговых усилий с наклонной направляющей закончен. Продолжить расчёт?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
                    {
                        if (DialogResult.Cancel == MessageBox.Show("Прекратить расчёт?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
                        {
                            goto ActiveLoading;
                        }
                        goto Finish;
                    }
                }
            }
            else
            {
                MessageBox.Show("Не указан плагин для расчёта расчёта тяговых усилий наклонной направляющей.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                goto Finish;
            }

            #endregion
           
            #region ElectricDrive
            ElectricDrive:
            if (DialogResult.Cancel == MessageBox.Show("С регулируемым приводом?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
            {
                goto Productivity;
            }

            if (plugins.ContainsKey("ElectricDrive"))
            {
                IComputingPlugin plugin = GetPluginByName(plugins["ElectricDrive"]);
                if (plugin == null)
                {
                    MessageBox.Show("Не найден плагин для расчёта электропривода.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    goto Finish;
                }

                ComputingProcessor.Compute(PlowMachine, plugin, UseLog);

                if (chxbxDebugMode.Checked)
                {
                    if (DialogResult.Cancel == MessageBox.Show("Продолжить расчёт?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
                    {
                        if (DialogResult.Cancel == MessageBox.Show("Прекратить расчёт?", "Вопрос", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
                        {
                            goto TractiveEffort;
                        }
                        goto Finish;
                    }
                }
            }
            else
            {
                MessageBox.Show("Не указан плагин для расчёта расчёта электропривода.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                goto Finish;
            } 
            #endregion

            #region Productivity
            Productivity:
            if (plugins.ContainsKey("Productivity"))
            {
                IComputingPlugin plugin = GetPluginByName(plugins["Productivity"]);
                if (plugin == null)
                {
                    MessageBox.Show("Не найден плагин для расчёта производительности.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    goto Finish;
                }

                ComputingProcessor.Compute(PlowMachine, plugin, UseLog);
            }
            else
            {
                MessageBox.Show("Не указан плагин для расчёта расчёта производительности.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                goto Finish;
            } 
            #endregion

            #region CheckingDynamic
            if (plugins.ContainsKey("CheckingDynamic"))
            {
                IComputingPlugin plugin = GetPluginByName(plugins["CheckingDynamic"]);
                if (plugin == null)
                {
                    MessageBox.Show("Не найден плагин для расчёта динамики.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    goto Finish;
                }

                ComputingProcessor.Compute(PlowMachine, plugin, UseLog);
            }
            else
            {
                MessageBox.Show("Не указан плагин для расчёта расчёта динамики.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                goto Finish;
            }          
            #endregion

            Finish:
            return;
        }       

        private IComputingPlugin GetPluginByName(string name)
        {
            IComputingPlugin plugin = Plugins.Find(delegate(IComputingPlugin p)
            {
                return p.Name.Equals(name, StringComparison.InvariantCultureIgnoreCase);
            });

            return plugin;
        }
    
        private void btnNext_Click(object sender, EventArgs e)
        {
            try
            {
                bool result = _computingProcessor.ComputeNextPlugin();
                if (!result)
                {
                    btnNext.Enabled = false;
                    btnStartStop.Text = "Запуск";
                    _isProcessing = false;
                    _computingProcessor = null;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);               
            }
        }

        private void btnAutoModeSettings_Click(object sender, EventArgs e)
        {
            using (Dialogs.AutoModeSettingsDialog dlg = new Su.Dialogs.AutoModeSettingsDialog())
            {
                dlg.Plugins = _plugins;
                dlg.ShowDialog();
            }
        }

        private void ComputingProcessorControl_Load(object sender, EventArgs e)
        {
            if (chxbxAutoMode.Checked)
            {
                grpbxUserMode.Enabled = false;
                grpbxAutoMode.Enabled = true;
            }
            else
            {
                grpbxUserMode.Enabled = true;
                grpbxAutoMode.Enabled = false;
            }
        }

        private void chxbxLogParameters_CheckedChanged(object sender, EventArgs e)
        {
            UseLog = chxbxLogParameters.Checked;
        }
    }
}
