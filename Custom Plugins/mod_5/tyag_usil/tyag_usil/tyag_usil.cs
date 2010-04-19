using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;

namespace tyag_usil
{
    public class TyagUsilPlugin : IComputingPlugin
    {
        #region Члены IComputingPlugin

        public Parameters Calculate(Parameters inputparams)
        {
            //Получение входных параметров по их имени в БД из объекта типа Parameters
            double H = (double)inputparams["depth_rez1"].Value;
            double H1 = (double)inputparams["mo_ugpl_1"].Value;
            double B1 = (double)inputparams["width_pogr_pov"].Value;
            double A5 = (double)inputparams["ves_ug"].Value;
            double H2 = (double)inputparams["vis_pogr"].Value;
            double H3 = (double)inputparams["vis_str"].Value;
            double A1 = (double)inputparams["arc_pogr_nije"].Value;
            double A2 = (double)inputparams["arc_pogr_vishe"].Value;
            double F0 = (double)inputparams["ko_tr_pogr"].Value;
            double A3 = (double)inputparams["ug_esot"].Value;
            double Q0 = (double)inputparams["ko_rej"].Value;
            double G7 = (double)inputparams["ko_ugug"].Value;
            double A6 = (double)inputparams["ug_mepl"].Value;
            double T0 = (double)inputparams["pr_stug"].Value;
            double M = (double)inputparams["ko_vntr"].Value;
            double A4 = (double)inputparams["a4"].Value;
            double Y1 = (double)inputparams["y1"].Value;
            double Y3 = (double)inputparams["y3"].Value;
            double Y7 = (double)inputparams["y7"].Value;
            double Y8 = (double)inputparams["y8"].Value;
            double Y9 = (double)inputparams["y9"].Value;
            double Z2 = (double)inputparams["z2"].Value;
            double Z3 = (double)inputparams["z3"].Value;
            double X1 = (double)inputparams["x1"].Value;
            double X2 = (double)inputparams["x2"].Value;
            double X3 = (double)inputparams["x3"].Value;
            double L1 = (double)inputparams["ras_centr"].Value;
            double G4 = (double)inputparams["g_resh"].Value;
            double K2 = (double)inputparams["koef_kol"].Value;
            double G5 = (double)inputparams["sil_tyaj"].Value;
            double M1 = (double)inputparams["ko_tr_m1"].Value;
            double M2 = (double)inputparams["ko_tr_m2"].Value;
            double M3 = (double)inputparams["ko_tr_m3"].Value;
            double M4 = (double)inputparams["ko_tr_m4"].Value;
            double K3 = (double)inputparams["ko_zapas"].Value;
            double L2 = (double)inputparams["dlin_su"].Value;
            double K6 = (double)inputparams["k61"].Value;
            double W = (double)inputparams["us_pro"].Value;
            double K7 = (double)inputparams["k7"].Value;
            double K9 = (double)inputparams["k9"].Value;
            double K5 = (double)inputparams["ko_vl_sko"].Value;
            double K4 = (double)inputparams["koef_nerav1"].Value;
            double P3 = (double)inputparams["obw_sil_rez_1"].Value;
            double P1 = (double)inputparams["obw_bok_sil_rez_1"].Value;
            double P2 = (double)inputparams["obw_otj_sil_rez_1"].Value;
            double U4 = (double)inputparams["ko_variaciy_u4"].Value;
            double U2 = (double)inputparams["ko_variaciy_u2"].Value;
            double Q4 = (double)inputparams["ko_izn"].Value;
            double R = (double)inputparams["rad_priv_zv"].Value;
            double N6 = (double)inputparams["qty_rez"].Value;
            double C1 = (double)inputparams["per_ch_red"].Value;
            double N1 = (double)inputparams["kpd_soe_mu"].Value;
            double N2 = (double)inputparams["kpd_pri_re"].Value;
            double N3 = (double)inputparams["kpd_pri_zv"].Value;
            double N5 = (double)inputparams["nom_rot"].Value;
            double A8 = (double)inputparams["a81"].Value;
            double K0 = (double)inputparams["k0"].Value;
            double rezhim = (double)inputparams["rezh_r_su"].Value;
            double Tnew = (double)inputparams["Tmod4"].Value;
            double Vc = (double)inputparams["sko_str"].Value;
            double L15 = (double)inputparams["dlp_is_konv"].Value;
            double Bc = (double)inputparams["Bc"].Value;
            double L25 = (double)inputparams["dlz_is_konv"].Value;


            //Блок вычислений
            A1 = A1 * Math.PI / 180.0;
            A2 = A2 * Math.PI / 180.0;
            A3 = A3 * Math.PI / 180.0;
            A6 = A6 * Math.PI / 180.0;
            A4 = A4 * Math.PI / 180.0;

            double F11 = 5.4 * B1; //сила внедрения погрузочной поверхности в штабель угля

            double G1 = H * (H1 + H2 - H3) * A5 * H2 * Math.Cos(A1) / Math.Sin(A1);//сила тяжести угля, расположенного
            //на погрузочной поверхности струга ниже уровня высоты погрузки
            double F22 = G1 * (F0 + (Math.Sin(A1) / Math.Cos(A1))) / (1.0 - F0 * Math.Sin(A1) / Math.Cos(A1));//составляющая усилия
            //перемещения угля по погрузочной поверхности ниже уровня высоты погрузки
            double G2 = H * A5 * B1 * (H3 - H2 + B1 * Math.Sin(A3) / Math.Cos(A3)) * Math.Cos(A4);//сила тяжести угля,
            //расположенного на погрузочной поверхности струга выше уровня высоты погрузки
            double F33 = G2 * (Math.Sin(A2) + F0 * Math.Cos(A2));
            double F3 = F33 / ((Math.Cos(A2 - A1) - F0 * Math.Sin(A2 - A1)) * Math.Cos(A1));//составляющая усилия перемещения угля по
            //погрузочной поверхности струга выше уровня высоты погрузки
            double G3 = H * A5 * B1 * B1 * Math.Sin(A3) / Math.Cos(A3) * Math.Cos(A4);//сила тяжести угля, перемещаемого
            //на конвейер
            double F4 = G3 * Q0 * G7 / (Math.Cos(A4) - F0 * Math.Sin(A4));//составляющая усилия перемещения угля на конвейер

            double H4 = H2 + B1 * Math.Sin(A3) / Math.Cos(A3);//высота штабеля угля перед стругом

            if (H4 > H3)
                H4 = H3;

            double F5 = (2.0 * H2 * B1 * (T0 + (M * A5 * H4 * Math.Sin(A1 + A6) * Math.Cos(A6)) / (2.0 * Math.Sin(A1))));
            F5 = F5 / Math.Sin(2.0 * A6);//сила преодоления внутреннего трения в штабеле угля перед стругом

            double F6;
            if (rezhim == 1)
                F6 = F11 + F22 + F3 + F4 + F5; //результирующая сила погрузки угля стругом
            else
                F6 = F11 + F22 + F3 + F4 + F5 + Tnew;

            double Y2 = B1 + Y1 + H;//координата точки приложения силы Pz по оси y

            double Y5 = B1 / 2.0 + Y1;//координата точки приложения силы Fn по оси y
            double Y6 = B1 + Y1;//координата точки приложения силы Tb по оси y
            double Z1 = L1 / 2.0;//координаты точек приложения реакций Ra и Rc по оси z
            double G6 = G4 * K2;//сила тяжести участка конвейера, расположенного на подконвейерной плите струга

            double F7 = G6 + G5 + P1;//сумма проекций сил Gk, Gc и Pz на ось x
            double Y4 = (G5 * Y8 - G6 * Y9 + P1 * Y2) / F7;//координата точки приложения силы трения T3 по оси y

            double T1 = G6 * M1 * (Y7 - Y9) / (2.0 * Y7);//сила трения в точках контактов подконвейерной плиты струга с конвейером
            double T2 = G6 * M1 * (Y7 + Y9) / (2.0 * Y7);

            double T3 = F7 * M2;//сила трения между подконвейерной плитой струга и почвой
            double C = P3 * (Y2 + Y3) + P2 * (Z3 - Z2) - P2 * (Y6 + Y5) * M3;
            double U = F6 * (Y5 + Y3) + T3 * (Y4 + Y3) + T2 * (Y3 - Y7) + T1 * (Y3 + Y7);
            double E = Z3 + (2.0 * Q0 - 1.0) * Z1 - (Y3 + Y6) * M3 - (Y3 + Y1) * M4;
            double N0 = K3 * (C + U) / E;//сила подачи струга на забой
            double R1 = N0 - P2;//реакция в опоре ограничителя струга на забой
            double M5 = P2 * X2 + G6 * Y9 - G5 * Y8 - N0 * X3 - R1 * M3 * Y6 - P1 * Y2;//сумма моментов сил
            //и реакции Px, Gc, Gk, Nc, Py, Tb' и Rb относительно оси z
            double T = G6 * (M1 + M2) + (G5 + P1) * M2 + N0 * M4 + (N0 - P2) * M3;//сила трения в опорах струга

            double F8 = 2.0 * L2 * W / 1000.0;//сила протягивания струговых цепей

            double F9 = K5 * (P3 + F6 + T + F8);//среднее значение тяговых усилий в цепи струга
            double U1 = K4 * U2;//коэф. вариации низкочастотных составляющих тяговых усилий в цепи струга
            double U3 = K0 * U4 * Math.Exp(-Q4) / Math.Sqrt(N6);//коэф., характеризующий наибольшие значения
            //результирующей силы резания в момент скола элемента стружки
            double K8 = 1.0 + 0.3 * U3;//коэф. влияния наибольших значений результирующей силы резания
            //в момент скола элемента стружки
            double A7 = A8 * K6 * K7 * K8 * K9;//средневзвешенное значение аплитуды высокочастотной
            //составляющей тяговых усилий в цепи струга за проход по лаве
            double U5 = A7 / (Math.Sqrt(2.0) * F9);//коэф. вариации высокочастотной составляющей тяговых усилий в цепи струга
            U = Math.Sqrt(U1 * U1 + U5 * U5);//результирующий коэф. вариации тяговых усилий в цепи струга
            double M7 = F9 * R / C1;//ср. значение суммарного крутящего момента электродвигателей привода струга
            double U8 = 1.5 * U1;
            double U9 = 0.5 * U1;
            double U0 = Math.Sqrt(U8 * U8 + 4 * U5 * U5);//результирующий коэф. вариации крутящего момента
            //электродвигателя основного привода струга
            double Q2 = Math.Sqrt(1.0 + U0 * U0);//коэф., учитывающий неравномерность крутящего момента
            //электродвигателя основного привода струга
            double Q3 = Math.Sqrt(1.0 + U9 * U9);//коэф., учитывающий неравномерность крутящего момента
            //электродвигателя вспомогательного привода струга
            double Q1 = Math.Sqrt((Q2 * Q2 + Q3 * Q3) / 2.0);//коэф., учитывающий различный уровень неравномерности
            //загрузки электродвигателя основного и вспомогательного приводов струга
            double M6 = Q1 * M7;//эффективное значение суммарного крутящего момента электродвигателей привода струга
            double N4 = N1 * N2 * N3;//коэф. полезного действия механической передачи привода струга
            double N11 = M6 * N5 / (9.5 * N4);//суммарная мощность на валах электродвигателей привода струга

            double Lp = 1.0;
            double L = L15 + L25 + L1;//длина изгиба конвейера
            double Np = Math.Round(L / Lp);//общее кол-во рештаков на линии изгиба конвейера
            double Np1 = 4;//кол-во рештаков на 1-ом участке линии изгиба конвейера
            double Np2 = Math.Round((Np - Np1) * 0.444);//кол-во рештаков на 2-ом участке линии изгиба конвейера
            double Np3 = Math.Round(Np - Np1 - Np2);//кол-во рештаков на 3-ем участке линии изгиба конвейера

            double k35 = 0.0, k45 = 0.0, k55 = 0.0;

            if ((Vc >= 0.4) && (Vc <= 0.99))
            {
                k35 = 1.1;
                k45 = 1.05;
                k55 = 0.9;
            };

            if ((Vc >= 1.0) && (Vc <= 1.1))
            {
                k35 = 1.15;
                k45 = 1.1;
                k55 = 0.9;
            };

            if ((Vc >= 1.6) && (Vc <= 2))
            {
                k35 = 1.2;
                k45 = 1.15;
                k55 = 0.9;
            };

            E = k35 * 2.0 + 0.5 * (((k45 * 6.0) / Np2) + ((k55 * 15.0) / Np3));
            double Pc = N0 / E;//требуемое усилие на штоках гидравлических домкратов подачи струга на забой
            double P = Pc / (0.785 * 8.0 * 8.0);//давление рабочей жидкости


            Parameters result = new Parameters();
            
            //Формирование выходных параметров в виде объекта типа Parameters
            result.Add("rez_sil_pogr1", F6);
            result.Add("sila_pod1", N0);
            result.Add("sil_tr1", T);
            result.Add("sr_tyag1", F9);
            result.Add("rez_ko_var1", U);
            result.Add("su_mosh_va1", N11);
            result.Add("davl_rzhgl_psz1", P);

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
                    "width_pogr_pov",
                    "ves_ug",
                    "vis_pogr",
                    "vis_str",
                    "arc_pogr_nije",
                    "arc_pogr_vishe",
                    "ko_tr_pogr",
                    "ug_esot",
                    "ko_rej",
                    "ko_ugug",
                    "ug_mepl",
                    "pr_stug",
                    "ko_vntr",
                    "a4",
                    "y1",
                    "y3",
                    "y7",
                    "y8",
                    "y9",
                    "z2",
                    "z3",
                    "x1",
                    "x2",
                    "x3",
                    "ras_centr",
                    "g_resh",
                    "koef_kol",
                    "sil_tyaj",
                    "ko_tr_m1",
                    "ko_tr_m2",
                    "ko_tr_m3",
                    "ko_tr_m4",
                    "ko_zapas",
                    "dlin_su",
                    "k61",
                    "us_pro",
                    "k7",
                    "k9",
                    "ko_vl_sko",
                    "koef_nerav1",
                    "obw_sil_rez_1",
                    "obw_bok_sil_rez_1",
                    "obw_otj_sil_rez_1",
                    "ko_variaciy_u4",
                    "ko_variaciy_u2",
                    "ko_izn",
                    "rad_priv_zv",
                    "qty_rez",
                    "per_ch_red",
                    "kpd_soe_mu",
                    "kpd_pri_re",
                    "kpd_pri_zv",
                    "nom_rot",
                    "a81",
                    "k0",
                    "rezh_r_su",
                    "Tmod4",
                    "sko_str",
                    "dlp_is_konv",
                    "Bc",
                    "dlz_is_konv"
                };
            }
        }

        //Возвращает имя модуля в виде строки
        public string Name
        {
            get { return "Тяговые усилия"; }
        }

        #endregion
    }
}
