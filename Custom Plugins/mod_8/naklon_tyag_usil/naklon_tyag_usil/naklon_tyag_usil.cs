using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace naklon_tyag_usil
{
    public class NaklonTyagUsilPlugin : IComputingPlugin
    {
        #region Члены IComputingPlugin

        public Parameters Calculate(Parameters inputparams)
        {
            //Получение входных параметров по их имени в БД из объекта типа Parameters
            double b_c = (double)inputparams["width_pogr_pov"].Value;
            double h_max = (double)inputparams["max_depth_rez"].Value;
            double H_min = (double)inputparams["min_mopl"].Value;
            double H_p = (double)inputparams["vis_pogr"].Value;
            double H_cmin = (double)inputparams["vis_str"].Value;
            double Alfa_1 = (double)inputparams["arc_pogr_pov"].Value;
            double Gamma = (double)inputparams["ves_ug"].Value;
            double f0 = (double)inputparams["ko_tr_pogr"].Value;
            double Psi = (double)inputparams["ug_esot"].Value;
            double Rou = (double)inputparams["a4"].Value;
            double Alfa_2 = (double)inputparams["arc_pogr_vishe"].Value;
            double k_r = (double)inputparams["ko_rej"].Value;
            double f1 = (double)inputparams["ko_ugug"].Value;
            double Tet = (double)inputparams["ug_mepl"].Value;
            double r0 = (double)inputparams["pr_stug"].Value;
            double Mu = (double)inputparams["ko_vntr"].Value;
            double x_4 = (double)inputparams["ras_p_tr_opor"].Value;
            double fi = (double)inputparams["arc_naknap_p"].Value;
            double m = (double)inputparams["ras_centr"].Value;
            double G_c = (double)inputparams["sil_tyaj"].Value;
            double P_z = (double)inputparams["obw_sil_rez_1"].Value;
            double P_y = (double)inputparams["obw_otj_sil_rez_1"].Value;
            double P_x = (double)inputparams["obw_bok_sil_rez_1"].Value;
            double Mu_5 = (double)inputparams["k_sopr_st_nakl"].Value;
            double y_12 = (double)inputparams["tpu_tzrtcso"].Value;
            double y_10 = (double)inputparams["ktpsr_y"].Value;
            double d = (double)inputparams["diam_to"].Value;
            double z_2 = (double)inputparams["t_rez_sil_z"].Value;
            double x_2 = (double)inputparams["t_rez_otshs_x"].Value;
            double y_2 = (double)inputparams["t_rez_bok_y"].Value;
            double y_8 = (double)inputparams["t_prilst_y"].Value;
            double k_3 = (double)inputparams["kvssds_ugd"].Value;
            double D_p = (double)inputparams["diam_pgd"].Value;
            double L_c = (double)inputparams["dlin_su"].Value;
            double W_c = (double)inputparams["us_pro"].Value;
            double k_v = (double)inputparams["ko_vl_sko"].Value;
            double k_p = (double)inputparams["kvnersrs_ntuc"].Value;
            double Nu_L = (double)inputparams["kvrsr_oissurdl"].Value;
            double A_sh_F = (double)inputparams["srvzznam"].Value;
            double k_6 = (double)inputparams["kof_vlzhstrc"].Value;
            double k_7 = (double)inputparams["kof_vlmasstr"].Value;
            double k_8 = (double)inputparams["kof_zrsrsmces"].Value;
            double k_9 = (double)inputparams["kof_vl_dlstust"].Value;
            double R = (double)inputparams["rad_priv_zv"].Value;
            double i = (double)inputparams["per_ch_red"].Value;
            double Nu_n1 = (double)inputparams["kof_vnskmeops"].Value;
            double Nu_n2 = (double)inputparams["kof_vnskmevp"].Value;
            double kpd_1 = (double)inputparams["kpd_soedmuft"].Value;
            double kpd_2 = (double)inputparams["kpd_privreduk"].Value;
            double kpd_3 = (double)inputparams["kpd_privzvezd"].Value;
            double n_n = (double)inputparams["nom_rot"].Value;


            //-----------расчет результирующей силы погрузки угля------------------------
            double F_1 = 5400.0 * b_c;   //{Н}
            double G_1 = Gamma * 1000.0 * h_max * (H_min + H_p - H_cmin) * H_p * 1 / Math.Tan(Alfa_1 * Math.PI / 180.0); //{Н}
            double F_2 = G_1 * (f0 + Math.Tan(Alfa_1 * Math.PI / 180.0)) / (1.0 - f0 * Math.Tan(Alfa_1 * Math.PI / 180.0));        //{Н}
            double G_2 = Gamma * 1000.0 * h_max * b_c * (H_cmin - H_p + b_c * Math.Tan(Psi * Math.PI / 180.0)) * Math.Cos(Rou * Math.PI / 180.0); //{Н}
            double F_3 = G_2 * (Math.Sin(Alfa_2 * Math.PI / 180.0) + f0 * Math.Cos(Alfa_2 * Math.PI / 180.0)) / ((Math.Cos((Alfa_2 - Alfa_1) * Math.PI / 180.0) - f0 * Math.Sin((Alfa_2 - Alfa_1) * Math.PI / 180.0)) * Math.Cos(Alfa_1 * Math.PI / 180.0)); //{Н}
            double G_3 = Gamma * 1000.0 * h_max * b_c * b_c * Math.Tan(Psi * Math.PI / 180.0) * Math.Cos(Rou * Math.PI / 180.0); //{Н}
            double F_4 = k_r * f1 * G_3 / (Math.Cos(Rou * Math.PI / 180.0) - f0 * Math.Sin(Rou * Math.PI / 180.0)); //{Н}
            double H_sh = H_p + b_c * Math.Tan(Psi * Math.PI / 180.0);  //{м}

            if (H_sh > H_cmin)
                H_sh = H_cmin;

            double F_5 = (2.0 * H_p * b_c / Math.Sin(2.0 * Tet * Math.PI / 180.0)) * (r0 + Mu * Gamma * 1000.0 * H_sh * Math.Sin((Alfa_1 + Tet) * Math.PI / 180.0) * Math.Cos(Tet * Math.PI / 180.0) / (2.0 * Math.Sin(Alfa_1 * Math.PI / 180.0))); //{Н}
            double F_p = F_1 + F_2 + F_3 + F_4 + F_5; //{Н}

            //-----------------расчет сил трения в опорах струга-------------------------
            double y_13 = b_c / 2.0; //{м}
            double x_5 = ((0.5 * F_2 + F_3 + 0.5 * F_4) * H_p + 0.5 * (F_4 + F_5) * H_cmin) / F_p; //{м}
            double y_11 = (y_13 - (x_4 - x_5) / Math.Tan(fi * Math.PI / 180.0)) * Math.Cos(fi * Math.PI / 180.0) - (0.5 * m - (x_4 - x_5) / Math.Sin(fi * Math.PI / 180.0));

            double F_x = (G_c + P_x) * Math.Cos(fi * Math.PI / 180.0) + P_y * Math.Sin(fi * Math.PI / 180.0); //{кН}
            double F_y = P_y * Math.Cos(fi * Math.PI / 180.0) - (G_c + P_x) * Math.Sin(fi * Math.PI / 180.0); //{кН}
            double F_sh_rv = P_z + F_p / 1000.0 + (F_y + F_x) * Mu_5;          //{кН}
            double M_x = -F_sh_rv * y_12 + F_p * y_11 / 1000.0 + P_z * y_10 + F_y * ((d + m) / 2.0) * Mu_5 - (P_y * Math.Cos(fi * Math.PI / 180.0) - P_x * Math.Sin(fi * Math.PI / 180.0)) * z_2; //{кНм}
            double M_z = -P_y * x_2 - P_x * y_2 - G_c * y_8; //{кНм}
            double T = (Math.Abs(F_x) + Math.Abs(F_y)) * Mu_5;  //{кН}

            //----расчет требуемого усилия на гидравлических домкратов струга на забой---
            double P_c = k_3 * P_y;  //{кН}
            double P = P_c * 10000.0 / (0.785 * D_p * D_p) / 1000.0;  //{мПа}

            //-----------расчет усилий протягивания струговых цепей----------------------
            double F_tch = 2.0 * L_c * W_c; //{Н}

            //---------расчет средних значений тяговых усилий в цепи струга--------------
            double F_t = k_v * (P_z + F_p / 1000.0 + T + F_tch / 1000.0); //{кН}

            //---расчет основных параметров неравномерности тяговых усилий в цепи струга-
            double Nu_n = k_p * Nu_L;
            double A_F = A_sh_F * k_6 * k_7 * k_8 * k_9;

            double Nu_v = A_F / (Math.Sqrt(2.0) * F_t);
            double Nu = Math.Sqrt(Math.Pow(Nu_n, 2.0) + Math.Pow(Nu_v, 2.0));

            //-----расчет суммарной мощности на валах электродвигателей привода струга---
            double M_t = F_t * 1000.0 * R / i; //{Нм}
            double Nu_1 = Math.Sqrt(Math.Pow(Nu_n1, 2.0) + 4 * Math.Pow(Nu_v, 2.0));
            double k_12 = Math.Sqrt(1 + Math.Pow(Nu_1, 2.0));

            double k_13 = Math.Sqrt(1 + Math.Pow(Nu_n2, 2.0));

            double k_11 = Math.Sqrt((Math.Pow(k_12, 2.0) + Math.Pow(k_13, 2.0)) / 2.0);
            double M_ef = k_11 * M_t; //{Нм}

            double kpd_m = kpd_1 * kpd_2 * kpd_3;

            double N = M_ef * n_n / (9550.0 * kpd_m); //{кВт}


            Parameters result = new Parameters();

            //Формирование выходных параметров в виде объекта типа Parameters
            result.Add("rez_sil_pogr1", F_p);
            result.Add("sil_tr1", T);
            result.Add("us_gdpsz_resh1", P_c);
            result.Add("davl_rzhgl_psz1", P);
            result.Add("sila_prstrcep", F_tch);
            result.Add("sr_tyag1", F_t);
            result.Add("sum_power_priv1", N);

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
                    "width_pogr_pov",
                    "max_depth_rez",
                    "min_mopl",
                    "vis_pogr",
                    "vis_str",
                    "arc_pogr_pov",
                    "ves_ug",
                    "ko_tr_pogr",
                    "ug_esot",
                    "a4",
                    "arc_pogr_vishe",
                    "ko_rej",
                    "ko_ugug",
                    "ug_mepl",
                    "pr_stug",
                    "ko_vntr",
                    "ras_p_tr_opor",
                    "arc_naknap_p",
                    "ras_centr",
                    "sil_tyaj",
                    "obw_sil_rez_1",
                    "obw_otj_sil_rez_1",
                    "obw_bok_sil_rez_1",
                    "k_sopr_st_nakl",
                    "tpu_tzrtcso",
                    "ktpsr_y",
                    "diam_to",
                    "t_rez_sil_z",
                    "t_rez_otshs_x",
                    "t_rez_bok_y",
                    "t_prilst_y",
                    "kvssds_ugd",
                    "diam_pgd",
                    "dlin_su",
                    "us_pro",
                    "ko_vl_sko",
                    "kvnersrs_ntuc",
                    "kvrsr_oissurdl",
                    "srvzznam",
                    "kof_vlzhstrc",
                    "kof_vlmasstr",
                    "kof_zrsrsmces",
                    "kof_vl_dlstust",
                    "rad_priv_zv",
                    "per_ch_red",
                    "kof_vnskmeops",
                    "kof_vnskmevp",
                    "kpd_soedmuft",
                    "kpd_privreduk",
                    "kpd_privzvezd",
                    "nom_rot"
                };
            }
        }

        //Возвращает имя модуля в виде строки
        public string Name
        {
            get { return "Наклоная направляющая"; }
        }

        #endregion
    }
}
