using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace SUCore.Computing
{
    using PlowMachine;

    class ComputingHelper
    {
        public static void Compute(PlowMachine plowmachine, IComputingPlugin calculator, bool logparametrs)
        {
            StringBuilder message = new StringBuilder("==============================================================\n");
            ILogger logger = logparametrs ? GetLogger() : null;

            try
            {
                #region Логирование

                if (logger != null)
                {
                    message.AppendLine("ДАТА СОБЫТИЯ : " + DateTime.Now.ToString());
                    message.AppendLine("ЗАПУСК РАСЧЁТА В МОДУЛЕ");
                    message.AppendLine("ИМЯ МОДУЛЯ : " + calculator.Name);
                    message.AppendLine("ПОЛУЧЕНИЕ ВХОДНЫХ ПАРАМЕТРОВ ДЛЯ МОДУЛЯ...");
                }

                #endregion

                Parameters inputparams = ParametersHelper.GetParams(calculator.InputParams, plowmachine);

                #region Логирование

                if (logger != null)
                {
                    message.AppendLine("ПОЛУЧЕННЫЕ ПАРАМЕТРЫ:");

                    foreach (Parameter p in inputparams)
                    {
                        message.AppendFormat("\t{0,10}  :  {1}", p.Name, p.Value);
                        message.AppendLine();
                    }
                    message.AppendLine("");
                    message.AppendLine("ПЕРЕДАЧА ПОЛУЧЕННЫХ ДАННЫХ В МОДУЛЬ...");
                }

                #endregion

                Parameters outputparams = calculator.Calculate(inputparams);

                #region Логирование

                if (logger != null)
                {
                    message.AppendLine("ПАРАМЕТРЫ РАСЧИТАННЫЕ МОДУЛЕМ:");
                    foreach (var p in outputparams)
                    {
                        message.AppendFormat("\t{0,10}  :  {1}", p.Name, p.Value);
                        message.AppendLine();
                    }
                    message.AppendLine("");
                    message.AppendLine("СОХРАНИЕНИЕ ПАРАМЕТРОВ В БД...");
                }

                #endregion

                ParametersHelper.SaveParams(outputparams, plowmachine);

                #region Логирование

                if (logger != null)
                {
                    message.AppendLine("OK");
                    message.AppendLine("==============================================================");
                }

                #endregion
            }
            catch (Exception ex)
            {
                message.AppendLine(ex.Message);
                message.AppendLine(ex.StackTrace);
                throw;
            }
            finally
            {
                if (logger != null) logger.Log(message.ToString());
            }
        }

        private static ILogger GetLogger()
        {
            return new SULibrary.FileLogger();
        }
    }
}
