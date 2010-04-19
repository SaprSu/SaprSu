using System;
using System.Collections.Generic;
using System.Text;

namespace SUCore.Managers.ExecutionProcess
{
    using Managers.Module;
    using Managers.PlowMachines;
    using SULibrary;

    /// <summary>
    /// Ведёт расчёт параметров струговой установки заданныими модулями. Контролирует процесс
    /// выполнения расчётоа
    /// </summary>
    public class ModulesActionExecuter
    {      
        ////PlowMachine _plowMachine;
        //Dictionary<Guid, Module> _modules;
        //ILogger _logger;

        //public ModulesActionExecuter(PlowMachine plowMachine, Module[] modules)
        //{
        //    //_plowMachine = plowMachine;

        //    _modules = new Dictionary<Guid, Module>();
        //    foreach (Module m in modules)
        //    {
        //        _modules.Add(m.ModuleId, m);
        //    }
        //}

        //public ILogger Logger
        //{
        //    get
        //    {
        //        return _logger;
        //    }
        //    set
        //    {
        //        _logger = value;
        //    }
        //}

        //public Dictionary<Guid, Module> Modules
        //{
        //    get
        //    {
        //        return _modules;
        //    }
        //}

        //public void ExecuteAction(Guid moduleId)
        //{
        //    StringBuilder message = new StringBuilder("==============================================================\n");
        //    try
        //    {
        //        #region Логирование

        //        if (_logger != null)
        //        {
        //            message.AppendLine("ДАТА СОБЫТИЯ : " + DateTime.Now.ToString());
        //            message.AppendLine("ЗАПУСК РАСЧЁТА В МОДУЛЕ");
        //            message.AppendLine("ID МОДУЛЯ  : " + moduleId.ToString());
        //            message.AppendLine("ИМЯ МОДУЛЯ : " + _modules[moduleId].ModuleName);
        //            message.AppendLine("ПОЛУЧЕНИЕ ВХОДНЫХ ПАРАМЕТРОВ ДЛЯ МОДУЛЯ...");
        //        }

        //        #endregion

        //        String[] inputs = _modules[moduleId].InputParams;
        //        Parameters inputsParams = _plowMachine.GetParams(inputs);

        //        #region Логирование

        //        if (_logger != null)
        //        {
        //            message.AppendLine("ПОЛУЧЕННЫЕ ПАРАМЕТРЫ:");

        //            foreach (KeyValuePair<string, double> value in inputsParams)
        //            {
        //                message.AppendFormat("\t{0,10}  :  {1}", value.Key, value.Value);
        //            }
        //            message.AppendLine("");
        //            message.AppendLine("ПЕРЕДАЧА ПОЛУЧЕННЫХ ДАННЫХ В МОДУЛЬ...");
        //        }

        //        #endregion

        //        Parameters output = _modules[moduleId].Calculate(inputsParams);

        //        #region Логирование

        //        if (_logger != null)
        //        {
        //            message.AppendLine("ПАРАМЕТРЫ РАСЧИТАННЫЕ МОДУЛЕМ:");
        //            foreach (KeyValuePair<string, double> value in output)
        //            {
        //                message.AppendFormat("\t{0,10}  :  {1}", value.Key, value.Value);
        //            }
        //            message.AppendLine("");
        //            message.AppendLine("СОХРАНИЕНИЕ ПАРАМЕТРОВ В БД...");

        //        }

        //        #endregion

        //        _plowMachine.SaveParams(output);

        //        #region Логирование

        //        if (_logger != null)
        //        {
        //            message.AppendLine("OK");
        //            message.AppendLine("==============================================================");
        //        }

        //        #endregion
        //    }
        //    catch (Exception ex)
        //    {
        //        message.AppendLine(ex.Message);
        //        message.AppendLine(ex.StackTrace);
        //        throw;
        //    }
        //    finally
        //    {
        //        if (_logger != null) _logger.Log(message.ToString());
        //    }

        //}
    }
}
