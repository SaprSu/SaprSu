using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace TolshinaPlugin
{
    public class Tolshina : IComputingPlugin
    {
        #region Члены IComputingPlugin

        public Parameters Calculate(Parameters inputparams)
        {
            
            // schityvanie parametrov v peremennye

            double fi = (double)inputparams["ko_razr"].Value;
            double VcMax = (double)inputparams["sko_str_max"].Value;
            double psi = (double)inputparams["ko_zap"].Value;
            double Qy = (double)inputparams["teor_pr_act1"].Value;
            double F = (double)inputparams["s_sech_konv"].Value;
            double H = (double)inputparams["mo_ugpl_1"].Value;
            double A = (double)inputparams["so_ugre"].Value;
            double A2 = (double)inputparams["A2_pol"].Value;
            double A1 = (double)inputparams["A1_pol"].Value;
            double A0 = (double)inputparams["A0_pol"].Value;
            double VkMax = (double)inputparams["sko_konv_max"].Value;
            double y = (double)inputparams["pl_ug"].Value;
            

            // vychisleniya

            double fi1 = 1.6;
            double Vc = VcMax;
            double Vk = VkMax;
            double yn = y / fi;
            double Qkr = 60 * F * psi * Vk * yn;
            double Kr = Qy / Qkr;
            double Ko = (Qy * VkMax) / (Qkr * psi * Vc);
            double C = 1 / (4 * Ko - 1);
            if (C < 1)
            {
                C = 1;
            }            
            double h1 = A2 * C * C + A1 * C + A0;
            double Hstrug = (h1 * 10 * F * fi1) / (H * fi);
            Vk = Vc / C;

            
            //sapis' parametrov v basu

            Parameters result = new Parameters();

            result.Add("max_depth_rez", Hstrug);

            result.Add("c_sg_konv", C);

            result.Add("proiz_konv", Qkr);

            result.Add("v_konv", Vk);

            result.Add("ko_skor", Ko);

            return result;
        }


        // schityvanie vhodnyh parametrov is basy

        public string[] InputParams
        {
            get
            {
                return new string[]
                {
                    "ko_razr",
                    "sko_str_max",
                    "ko_zap",
                    "teor_pr_act1",
                    "s_sech_konv",
                    "mo_ugpl_1",
                    "so_ugre",
                    "A2_pol",
                    "A1_pol",
                    "A0_pol",
                    "sko_konv_max",
                    "pl_ug"

                };
            }
        }

        public string Name
        {
            get { return "Толщина"; }
        }

        #endregion
    }
}
