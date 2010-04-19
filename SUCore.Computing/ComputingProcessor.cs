using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;


namespace SUCore.Computing
{
    using PlowMachine;

   
    /// <summary>
    /// Класс контролирущий процесс вычисления
    /// </summary>
    public class ComputingProcessor
    {
        public delegate void PluginComputingEventHandler(string pluginName);
        public delegate void VoidEventHandler();

        PlowMachine _plowMachine;
        Queue<SULibrary.IComputingPlugin> _computingQueue;
        Queue<SULibrary.IComputingPlugin> _inprocessQueue;

        /// <summary>
        /// Расчёт плагина начат
        /// </summary>
        public event PluginComputingEventHandler PluginComputeStart;

        /// <summary>
        /// Расчёт плагина закончен
        /// </summary>
        public event PluginComputingEventHandler PluginComputeEnd;

        /// <summary>
        /// Расчёт закончен
        /// </summary>
        public event VoidEventHandler ComputingProcessingEnd;

        /// <summary>
        /// Статус процесса вычислений
        /// </summary>
        public ComputingProcessState State { get; private set; }

        /// <summary>
        /// Логировать передачу параметров
        /// </summary>
        public bool UseLog { get; set; }
        
        #region Constructors

        public ComputingProcessor(PlowMachine plowMachine, Queue<SULibrary.IComputingPlugin> computingQueue, bool useLog)
        {
            _plowMachine = plowMachine;
            _computingQueue = computingQueue;
            State = ComputingProcessState.Stop;
            UseLog = useLog;
        }        

        #endregion

        #region Protected Methods

        protected void OnPluginComputeEnd(string pluginName)
        {
            PluginComputingEventHandler temp = this.PluginComputeEnd;
            if (temp != null) temp(pluginName);
        }

        protected void OnPluginComputeStart(string pluginName)
        {
            PluginComputingEventHandler temp = this.PluginComputeStart;
            if (temp != null) temp(pluginName);
        }

        protected void OnComputingProcessingEnd()
        {
            VoidEventHandler temp = this.ComputingProcessingEnd;
            if (temp != null) temp();
        }

        #endregion 
        
        #region Public Methods

        /// <summary>
        /// Запуск расчёт слдеующего плагина
        /// </summary>
        /// <returns></returns>
        public bool ComputeNextPlugin()
        {
            bool processingResult = false;

            if (State == ComputingProcessState.Stop)
            {
                State = ComputingProcessState.Processing;
                _inprocessQueue = new Queue<IComputingPlugin>(_computingQueue);
            }

            if (_inprocessQueue.Count() != 0 && _inprocessQueue.Count() != 1)
            {
                IComputingPlugin currentPlugin = _inprocessQueue.Dequeue();

                OnPluginComputeStart(currentPlugin.Name);
                ComputingHelper.Compute(_plowMachine, currentPlugin, UseLog);
                OnPluginComputeEnd(currentPlugin.Name);

                processingResult = true;
            }
            else
            {
                IComputingPlugin currentPlugin = _inprocessQueue.Dequeue();

                OnPluginComputeStart(currentPlugin.Name);
                ComputingHelper.Compute(_plowMachine, currentPlugin, UseLog);
                OnPluginComputeEnd(currentPlugin.Name);

                _inprocessQueue = null;
                State = ComputingProcessState.Stop;
                OnComputingProcessingEnd();

                processingResult = false;
            }

            return processingResult;
        }

        /// <summary>
        /// Обработать струговую установку плагином  
        /// </summary>
        /// <param name="plowMachine">СУ</param>
        /// <param name="plugin">плагин</param>
        public static void Compute(PlowMachine plowMachine, IComputingPlugin plugin, bool useLog)
        {
            ComputingHelper.Compute(plowMachine, plugin, useLog);
        }

        /// <summary>
        /// Выполнить всю очередь вычислений
        /// </summary>
        public void ProcessAll()
        {
            if (State == ComputingProcessState.Processing)
            {
                throw new InvalidOperationException("Расчёт уже запущен.");
            }

            State = ComputingProcessState.Processing;

            _inprocessQueue = new Queue<IComputingPlugin>(_computingQueue);

            while (_inprocessQueue.Count != 0)
            {
                IComputingPlugin currentPlugin = _inprocessQueue.Dequeue();

                OnPluginComputeStart(currentPlugin.Name);
                ComputingHelper.Compute(_plowMachine, currentPlugin, UseLog);
                OnPluginComputeEnd(currentPlugin.Name);
            }

            _inprocessQueue = null;
            State = ComputingProcessState.Stop;
            OnComputingProcessingEnd();
        } 

        #endregion
    }
}