using System;
using System.Collections.Generic;
using System.Text;
using SULibrary;

namespace gruz
{
    public class GruzPlugin : IComputingPlugin
    {
        #region Члены IComputingPlugin

        public Parameters Calculate(Parameters inputparams)
        {
            //Получение входных параметров по их имени в БД из объекта типа Parameters
            double M = (double)inputparams["mo_ugpl_1"].Value;
            double V = (double)inputparams["sko_dv"].Value;
            double V8 = (double)inputparams["sko_ug"].Value;
            double H = (double)inputparams["depth_rez1"].Value;
            double G = (double)inputparams["pl_ug"].Value;
            double K = (double)inputparams["ko_otj"].Value;
            double K1 = (double)inputparams["ko_stra"].Value;
            double K2 = (double)inputparams["ko_zapol"].Value;
            double R = (double)inputparams["rad_priv_zv"].Value;
            double R1 = (double)inputparams["r_nij_osn_korp"].Value;
            double R2 = (double)inputparams["r_verx_osn_korp"].Value;
            double R3 = (double)inputparams["r_nij_lop"].Value;
            double R4 = (double)inputparams["r_verh_lop"].Value;
            double H1 = (double)inputparams["height_lop"].Value;
            double L = (double)inputparams["length_sred_lop"].Value;
            double L1 = (double)inputparams["length_konc_lop"].Value;
            double H2 = (double)inputparams["vi_stlo"].Value;
            double F0 = (double)inputparams["ug_esot"].Value;
            double B = (double)inputparams["arc_zaostr_konc_lop"].Value;
            double Y = (double)inputparams["arc_naklona_pogr"].Value;
            double R5 = (double)inputparams["r_verh_osn_lop"].Value;
            double H3 = (double)inputparams["height_skos"].Value;

            //Блок вычислений
            double Q = 3600.0 * V * H * G * M;
            double V1 = V / 2.0;
            double Q1 = 3600.0 * V1 * H * G * M;
            double Q2 = Q1 * K;
            double V3 = R1 * H1 * L1 / 6.0 + R1 * H1 * L / 2.0 + R1 * H1 * (6.0 * R1 - Math.PI * R1 - Math.PI * R2) / 12.0;
            double V4 = (Math.Pow(H1, 2.0)) * (Math.Sin(F0 * Math.PI / 180.0) / Math.Cos(F0 * Math.PI / 180.0));
            double V5 = (R1 - R2 - H2 * (Math.Cos(B * Math.PI / 180.0)) / (Math.Sin(B * Math.PI / 180.0)));
            double V6 = V4 * V5 / (4 * Math.Sin(Y * Math.PI / 180.0));
            double V7 = (Math.Pow(H2, 2.0)) * H1 * (Math.Cos(B * Math.PI / 180.0) / Math.Sin(B * Math.PI / 180.0)) / (3.0 * Math.Sin(Y * Math.PI / 180.0));
            double V2 = V3 + V6 + V7 + Math.PI * H1 * ((Math.Pow(R3, 2.0) + Math.Pow(R4, 2.0) + R3 * R4) - (Math.Pow(R1, 2.0) + Math.Pow(R2, 2.0) + R1 * R2)) / 24.0;
            double V9 = V2 - ((R4 - R5) * 0.5 * H3 * R1 * Math.Sin(Y * Math.PI / 180.0) / Math.Cos(Y * Math.PI / 180.0));
            double Q3 = 7200.0 * G * V * V9 * K2 / (Math.PI * K1 * R);
            double W = (Math.PI * K * K1 * H * V * M) / (2.0 * V9);
            double S1 = (R3 - R1 + R4 - R2) * H1 / 2.0;
            double S = H * V * M / (2.0 * V8);
            double P = W * S1;
            double P1 = W * S;


            Parameters result = new Parameters();

            //Формирование выходных параметров в виде объекта типа Parameters
            result.Add("teor_pr1",Q);
            result.Add("teor_pr_act1",Q1);
            result.Add("teor_pr_pogr1",Q2);
            result.Add("arc_chast1",W);
            result.Add("plow1",S);
            result.Add("pogr_spos_kons1",P);
            result.Add("pogr_spos_rej1",P1);
            result.Add("teor_pr",Q3);
            result.Add("plow_sech",S1);
            result.Add("ob_stug",V2);

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
                    "mo_ugpl_1",
                    "sko_dv",
                    "sko_ug",
                    "depth_rez1",
                    "pl_ug",
                    "ko_otj",
                    "ko_stra",
                    "ko_zapol",
                    "rad_priv_zv",
                    "r_nij_osn_korp",
                    "r_verx_osn_korp",
                    "r_nij_lop",
                    "r_verh_lop",
                    "height_lop",
                    "length_sred_lop",
                    "length_konc_lop",
                    "vi_stlo",
                    "ug_esot",
                    "arc_zaostr_konc_lop",
                    "arc_naklona_pogr",
                    "r_verh_osn_lop",
                    "height_skos"
                };
            }
        }

        //Возвращает имя модуля в виде строки
        public string Name
        {
            get { return "Грузчик"; }
        }

        #endregion
    }
}
