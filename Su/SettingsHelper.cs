using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;

namespace Su
{
    class SettingsHelper
    {
        /// <summary>
        /// Сохранить сопоставление плагинов для автоматического режима
        /// </summary>
        /// <param name="map"></param>
        public static void SaveAutoModePluginsMap(StringDictionary map)
        {
            StringCollection result = new StringCollection();
        
            #region Заполняем
            if (map.ContainsKey("PlowHeigth"))
                result.Add("PlowHeigth:" + map["PlowHeigth"]);

            if (map.ContainsKey("PlowWidth"))
                result.Add("PlowWidth:" + map["PlowWidth"]);

            if (map.ContainsKey("CuttingEfforts".ToLower()))
                result.Add("CuttingEfforts:" + map["CuttingEfforts"]);

            if (map.ContainsKey("ActiveLoading"))
                result.Add("ActiveLoading:" + map["ActiveLoading"]);

            if (map.ContainsKey("TractiveEffort1"))
                result.Add("TractiveEffort1:" + map["TractiveEffort1"]);

            if (map.ContainsKey("TractiveEffort2"))
                result.Add("TractiveEffort2:" + map["TractiveEffort2"]);

            if (map.ContainsKey("ElectricDrive"))
                result.Add("ElectricDrive:" + map["ElectricDrive"]);

            if (map.ContainsKey("Productivity"))
                result.Add("Productivity:" + map["Productivity"]);

            if (map.ContainsKey("CheckingDynamic"))
                result.Add("CheckingDynamic:" + map["CheckingDynamic"]);
            
            #endregion

            Properties.Settings sett = Properties.Settings.Default;
            sett.PluginsMapForAutoMode = result;
            sett.Save();
        }

        /// <summary>
        /// Загрузить сопоставление плагинов для автоматического режима
        /// </summary>
        /// <returns></returns>
        public static StringDictionary GetAutoModePluginsMap()
        {
            StringDictionary result = new StringDictionary();

            if (Properties.Settings.Default.PluginsMapForAutoMode == null)
            {
                Properties.Settings.Default.PluginsMapForAutoMode = new StringCollection();
            }


            StringCollection coll = Properties.Settings.Default.PluginsMapForAutoMode;

            foreach (string str in Properties.Settings.Default.PluginsMapForAutoMode)
            {
                string name;
                string value;

                int index = str.IndexOf(":");
                name = str.Substring(0, index);
                value = str.Substring(index + 1, str.Length - index - 1);

                result.Add(name, value);
            }

            return result;
        }
    }
}
