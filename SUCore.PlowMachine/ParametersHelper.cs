using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace SUCore.PlowMachine
{
    public sealed class ParametersHelper
    {
        /// <summary>
        /// Сохраняем параметры в струговой установке
        /// </summary>
        /// <param name="outputparams">параметры для сохранения</param>
        /// <param name="plowmachine">струговая установка</param>
        public static void SaveParams(Parameters outputparams, PlowMachine plowmachine)
        {
            foreach (var param in outputparams)
            {
                foreach (var module in plowmachine.Modules.Values)
                {
                    //
                    //  выбираме параметры, названия которых совпадают
                    //
                    var moduleparam = from mp in module.ModuleParams
                                      where mp.Name.Equals(param.Name, StringComparison.InvariantCultureIgnoreCase)
                                      select mp;

                    //  если нет таковых...то продолжаем
                    if (moduleparam.Count() == 0) continue;

                    // перезаписываем значение 
                    module.ModuleParams[param.Name].Value = param.Value;
                }
            }
        }

        /// <summary>
        /// Достаем параметры из установки
        /// </summary>
        /// <param name="names">название параметров</param>
        /// <param name="plowmachine">струговя установка</param>
        /// <returns></returns>
        public static Parameters GetParams(string[] names, PlowMachine plowmachine)
        {
            Parameters result = new Parameters();

            foreach (var param in names)
            {
                foreach (var module in plowmachine.Modules.Values)
                {
                    //
                    //  выбираме параметры, названия которых совпадают
                    //
                    var moduleparam = from mp in module.ModuleParams
                                      where mp.Name.Equals(param, StringComparison.InvariantCultureIgnoreCase)
                                      select mp;
                    if (moduleparam.Count() != 0) 
                        result.Add(moduleparam.First());
                }
            }

            return result;
        }
    }
}
