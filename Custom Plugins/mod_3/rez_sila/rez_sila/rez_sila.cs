using System;
using System.Collections.Generic;
using System.Text;
using SULibrary;


namespace rez_sila
{
    public class RezSilaPlugin : IComputingPlugin
    {
        #region Члены IComputingPlugin

        public Parameters Calculate(Parameters inputparams)
        {
            //Получение входных параметров по их имени в БД из объекта типа Parameters
            double H = (double)inputparams["depth_rez1"].Value;
            double H1 = (double)inputparams["min_mopl"].Value;
            double H2 = (double)inputparams["max_mopl"].Value;
            double H3 = (double)inputparams["height_pogruz"].Value;
            double D = (double)inputparams["excess_rez_nad_str"].Value;
            double B = (double)inputparams["width_rej_kr_b"].Value;
            double B1 = (double)inputparams["width_rej_kr_b1"].Value;
            double H5 = (double)inputparams["max_depth_rez"].Value;
            double A = (double)inputparams["so_ugre"].Value;
            double B2 = (double)inputparams["arc_ustan_rez_b2"].Value;
            double B3 = (double)inputparams["arc_ustan_rez_b3"].Value;
            double T2 = (double)inputparams["step_rez_t2"].Value;
            double T3 = (double)inputparams["step_rez_t3"].Value;
            double K1 = (double)inputparams["k01"].Value;
            double K2 = (double)inputparams["k02"].Value;
            double K3 = (double)inputparams["k03"].Value;
            double K4 = (double)inputparams["k04"].Value;
            double K5 = (double)inputparams["k05"].Value;
            double K6 = (double)inputparams["k06"].Value;
            double K7 = (double)inputparams["k07"].Value;
            double K8 = (double)inputparams["k08"].Value;
            double K9 = (double)inputparams["k09"].Value;
            double L = (double)inputparams["ko_lin_nij_l"].Value;
            double K = (double)inputparams["ko_lin_nij_k"].Value;
            double HR = (double)inputparams["ko_lin_nij_hr"].Value;
            double U6 = (double)inputparams["ko_variaciy_u6"].Value;
            double U7 = (double)inputparams["ko_variaciy_u7"].Value;
            double U8 = (double)inputparams["ko_variaciy_u8"].Value;
            double M = (double)inputparams["xar_ug"].Value;
            double F = (double)inputparams["ko_sore"].Value;
            double C = (double)inputparams["avg_proek_plow"].Value;
            double D4 = (double)inputparams["d4"].Value;
            double D5 = (double)inputparams["d5"].Value;
            double D6 = (double)inputparams["d6"].Value;
            double D7 = (double)inputparams["d7"].Value;
            double L4 = (double)inputparams["l4"].Value;
            double L5 = (double)inputparams["l5"].Value;
            double L6 = (double)inputparams["l6"].Value;
            double L7 = (double)inputparams["l7"].Value;
            double R4 = (double)inputparams["r4"].Value;
            double R5 = (double)inputparams["r5"].Value;
            double R6 = (double)inputparams["r6"].Value;
            double R7 = (double)inputparams["r7"].Value;

            //Блок вычислений
            double H0 = H3 + 4.8 * H1 * H5 + D;
            double H4 = 0.8 * H2;
            double T = (0.075 * H / (H + 0.0065) + 0.3 * H + (B - 0.02)) * K1;
            double T1 = (0.075 * H / (H + 0.0065) + 0.3 * H + (B1 - 0.02)) * K1;

            double N1 = H0 / T + 1;
            N1 = Math.Round(N1);

            double N2 = H4 / T + 1;
            N2 = Math.Round(N2);

            double T11 = H0 / (N1 - 1.0);
            T11 = 0.1 * ((int)T11 + 1.0);

            double T4 = (H0 - T2 - T3) / (N1 - 2.0);

            double P = (0.45 * H + 0.023) / H;
            double K11 = 0.38 * (1.0 + 2.0 * Math.Pow((T11 / T - 1.0), 2.0));
            double Z = 110.0 * A * (0.35 * B + 0.003) / ((B + H * P) * K2);
            Z = (Z * H * T4 * K11 * K6 * K8 * K9 * K3) / Math.Cos(B2 * Math.PI / 180.0);
            double Z1 = 110.0 * A * (0.35 * B + 0.003) / (B + H * P) / K2;
            Z1 = (Z1 * H * T2 * K4 * K6 * K8 * K9 * K3) / Math.Cos(B3 * Math.PI / 180.0);
            double Z2 = 110.0 * A * (0.35 * B + 0.003) / (B + H * P) / K2;
            Z2 = (Z2 * H * T3 * K5 * K7 * K8 * K9 * K3) / Math.Cos(B3 * Math.PI / 180.0);
            double Z3 = 110.0 * A * H * (0.35 * B1 + 0.003) * K7 * K8 * K3;
            Z3 = Z3 / Math.Cos(B2 * Math.PI / 180.0);

            double Q0 = 0.0, Q1 = 0.0;
            switch ((int)M)
            {
                case 1:
                    Q0 = 0.35;
                    Q1 = 0.85;
                    break;
                case 2:
                    Q0 = 0.4;
                    Q1 = 0.9;
                    break;
                case 3:
                    Q0 = 0.45;
                    Q1 = 0.95;
                    break;
            }

            double Y = Z * Q0;
            double Y1 = Z1 * Q0;
            double Y2 = Z2 * Q0;
            double Y3 = Z3 * Q0;
            double Y44 = Y * 100.0 * (0.01 + 1.8 * C);
            double Y55 = Y1 * 100.0 * (0.01 + 1.8 * C);
            double Y6 = Y2 * 100.0 * (0.01 + 1.8 * C);
            double Y7 = Y3 * 100.0 * (0.01 + 1.8 * C);
            double Z44 = Z + F * Y44;
            double Z55 = Z1 + F * Y55;
            double Z6 = Z2 + F * Y6;
            double Z7 = Z3 + F * Y7;

            double Q2 = 0.0;
            if (H == 0.03)
                Q2 = 1.5;
            if (H == 0.04)
                Q2 = 1.2;
            if (H >= 0.05)
                Q2 = 1.0;

            double X4 = 0.22 * A * K3 + 750.0 * H * Q2 - 400.0 * T11 - 10.0;
            double X5 = 1.3 * (0.22 * A * K3 + 750.0 * H * Q2 - 400.0 * T11 - 10.0);
            double X6 = 1.5 * (0.22 * A * K3 + 750.0 * H * Q2 - 400.0 * T11 - 10.0);

            double P3 = HR * Z6 + Z7 + Z55 + L * Q1 * Z44;
            double P2 = HR * Y6 + Y7 + Y55 + L * Q1 * Y44;
            double P1 = HR * X6 + X5 + K * Q1 * X4;
            double D3 = (HR * Z6 * D6 + Z55 * D5 + Z7 * D7 + Q1 * L * Z44 * D4) / P3;
            double R3 = (HR * Z6 * R6 + Z55 * R5 + Z7 * R7 + Q1 * L * Z44 * R4) / P3;

            double D2 = (HR * Y6 * D6 + Y55 * D5 + Y7 * D7 + Q1 * L * Y44 * D4) / P2;
            double L2 = (HR * Y6 * L6 + Y55 * L5 + Y7 * L7 + Q1 * L * Y44 * L4) / P2;
            double L1 = (-HR * L6 * X6 + X5 * L5 + Q1 * X4 * L4 * K9) / P1;

            double B4 = ((N1 - 1.0) * B + B1) / N1;
            double B5 = ((N2 - 1.0) * B + B1) / N2;
            double Q4 = C * 2.7 / Math.Pow(B4, 2.0);
            double Q5 = C * 2.7 / Math.Pow(B5, 2.0);
            double Z4 = Math.Sqrt(((Math.Pow((U6 * Math.Exp(-Q4)), 2.0)) / N1) + Math.Pow(U8, 2.0));
            double Z5 = Math.Sqrt((Math.Pow((U6 * Math.Exp(-Q5)), 2.0) / N2) + Math.Pow(U8, 2.0));
            double Q6 = C * 2.9 / Math.Pow(B4, 2.0);
            double Q7 = C * 2.9 / Math.Pow(B5, 2.0);
            double Y4 = Math.Sqrt((Math.Pow((U7 * Math.Exp(-Q6)), 2.0) / N1) + Math.Pow(U8, 2.0));
            double Y5 = Math.Sqrt((Math.Pow((U7 * Math.Exp(-Q7)), 2.0) / N2) + Math.Pow(U8, 2.0));


            Parameters result = new Parameters();

            //Формирование выходных параметров в виде объекта типа Parameters
            result.Add("rac_step_rasstanov_t1", T);
            result.Add("rac_step_rasstanov_t11", T1);
            result.Add("avg_sil_rez_lin_1", Z);
            result.Add("avg_sil_rez_verx_1", Z1);
            result.Add("avg_sil_rez_nij_1", Z2);
            result.Add("avg_sil_rez_oper_1", Z3);
            result.Add("bok_sil_lin_1", X4);
            result.Add("bok_sil_verx_1", X5);
            result.Add("bok_sil_nij_1", X6);
            result.Add("obw_sil_rez_1", P1);
            result.Add("obw_otj_sil_rez_1", P2);
            result.Add("obw_bok_sil_rez_1", P3);
            result.Add("d3_1", D3);
            result.Add("r3_1", R3);
            result.Add("d2_1", D2);
            result.Add("l2_1", L2);
            result.Add("l1_1", L1);
            result.Add("koef_var_z4", Z4);
            result.Add("koef_var_z5", Z5);
            result.Add("koef_var_otj_y4", Y4);
            result.Add("koef_var_otj_y5", Y5);

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
                    "min_mopl",
                    "max_mopl",
                    "height_pogruz",
                    "excess_rez_nad_str",
                    "width_rej_kr_b",
                    "width_rej_kr_b1",
                    "max_depth_rez",
                    "so_ugre",
                    "arc_ustan_rez_b2",
                    "arc_ustan_rez_b3",
                    "step_rez_t2",
                    "step_rez_t3",
                    "k01",
                    "k02",
                    "k03",
                    "k04",
                    "k05",
                    "k06",
                    "k07",
                    "k08",
                    "k09",
                    "ko_lin_nij_l",
                    "ko_lin_nij_k",
                    "ko_lin_nij_hr",
                    "ko_variaciy_u6",
                    "ko_variaciy_u7",
                    "ko_variaciy_u8",
                    "xar_ug",
                    "ko_sore",
                    "avg_proek_plow",
                    "d4",
                    "d5",
                    "d6",
                    "d7",
                    "l4",
                    "l5",
                    "l6",
                    "vl7",
                    "r4",
                    "r5",
                    "r6",
                    "r7",
                    "l7"
                };
            }
        }

        //Возвращает имя модуля в виде строки
        public string Name
        {
            get { return "Ружущая сила"; }
        }

        #endregion
    }
}