using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace proizvod
{
    public class ProizvodPlugin : IComputingPlugin
    {
        #region Члены IComputingPlugin

        public Parameters Calculate(Parameters inputparams)
        {
            //Получение входных параметров по их имени в БД из объекта типа Parameters
            double H = (double)inputparams["depth_rez1"].Value;
            double M = (double)inputparams["mo_ugpl_1"].Value;
            double T3 = (double)inputparams["vre_rev_pri"].Value;
            double S4 = (double)inputparams["vrem_podg"].Value;
            double S1 = (double)inputparams["time_mine_work"].Value;
            double L = (double)inputparams["dl_la"].Value;
            double T5 = (double)inputparams["vrem_raz"].Value;
            double V = (double)inputparams["sko_str"].Value;
            double K = (double)inputparams["ko_got"].Value;
            double L1 = (double)inputparams["hod_gid"].Value;
            double T6 = (double)inputparams["vrem_pod"].Value;
            double G = (double)inputparams["pl_ug"].Value;
            double L2 = (double)inputparams["shag_ust"].Value;
            double T7 = (double)inputparams["vrem_peredv"].Value;
            double T8 = (double)inputparams["vrem_perem"].Value;
            double S2 = (double)inputparams["time_ex_tex"].Value;
            double S3 = (double)inputparams["prod_smen"].Value;


            //Блок вычислений
            double T1 = L / (60.0 * V);
            double T2 = T1 * L1 / H;
            double Q1 = 3600.0 * M * H * V * G;
            double N4 = L / L2;
            double T4 = (T5 + T6 + T7 + T8) * N4;
            double T9 = (L / V) * (1.0 / K - 1.0);
            double K1 = 1.0 / (1.0 + (V / L) * T3 + ((H * V) / (L1 * L)) * (T4 + T9));
            double Q2 = K1 * Q1;
            double T0 = S1 + S2;
            double K2 = 1.0 / (1.0 + (V / L) * (T3 + H / L1 * (T4 + T9 + T0)));
            double Q3 = K2 * Q1;
            double Q4 = Q3 * (S3 - S4);
            double Q5 = 2.0 * Q4;
            double Q6 = 3.0 * Q4;
            double Q7 = M * L1 * G * L;
            double N1 = Q4 / Q7;
            double N2 = Q5 / Q7;
            double N3 = Q6 / Q7;


            Parameters result = new Parameters();

            //Формирование выходных параметров в виде объекта типа Parameters
            result.Add("teor_pr1", Q1);
            result.Add("koef_nepr1", K1);
            result.Add("teh_pr1", Q2);
            result.Add("koef_nepr_ex1", K2);
            result.Add("ex_pr1", Q3);
            result.Add("sm_pr1", Q4);
            result.Add("sut_pr_21", Q5);
            result.Add("sut_pr_31", Q6);
            result.Add("kol_smen1", N1);
            result.Add("kol_sut_21", N2);
            result.Add("kol_sut_31", N3);
            result.Add("cikl_pro", Q7);

            //Возвращаем выходные параметры
            return result;
        }

        //Возвращает строковый массив имен входных параметров необходимых модулю
        public string[] InputParams
        {
            get
            {
                return new string[]
                {
                    "depth_rez1",
                    "mo_ugpl_1",
                    "vre_rev_pri",
                    "vrem_podg",
                    "time_mine_work",
                    "dl_la",
                    "vrem_raz",
                    "sko_str",
                    "ko_got",
                    "hod_gid",
                    "vrem_pod",
                    "pl_ug",
                    "shag_ust",
                    "vrem_peredv",
                    "vrem_perem",
                    "time_ex_tex",
                    "prod_smen"
                };
            }
        }

        //Возвращает имя модуля в виде строки
        public string Name
        {
            get { return "Производительность."; }
        }

        #endregion
    }
}
