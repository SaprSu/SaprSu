using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace VysotaPlugin
{
    public class Vysota : IComputingPlugin
    {
        #region Члены IComputingPlugin

        public Parameters Calculate(Parameters inputparams)
        {
            
            // schityvanie parametrov v peremennye

            double Hmax = (double)inputparams["max_mopl"].Value;
            double Hmin = (double)inputparams["min_mopl"].Value;
            double HStrugMax = (double)inputparams["max_depth_rez"].Value;
            double B = (double)inputparams["excess_rez_nad_str"].Value;
            double Hpogr = (double)inputparams["height_pogruz"].Value;
            double Kc = (double)inputparams["koef_h_str"].Value;


            // vychisleniya

            double HcMin = Hpogr + 4.8 * Hmin * HStrugMax + B;
            double HcMax = Kc * Hmax;


            //sapis' parametrov v basu

            Parameters result = new Parameters();
            result.Add("h_smax", HcMax);
            result.Add("h_smin", HcMin);

            return result;
        }


        // schityvanie vhodnyh parametrov is basy

        public string[] InputParams
        {
            get
            {
                return new string[]
                {
                    "max_mopl",
                    "min_mopl",
                    "max_depth_rez",
                    "excess_rez_nad_str",
                    "height_pogruz",
                    "koef_h_str"                    

                };
            }
        }

        public string Name
        {
            get { return "Высота"; }
        }

        #endregion
    }
}
