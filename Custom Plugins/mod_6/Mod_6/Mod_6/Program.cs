using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SULibrary;


namespace static_engine
    {
        class Program
            {
                static void Main(string[] args)
                {
                    StatEnginePlugin modul = new StatEnginePlugin();
                }
            }
        public class StatEnginePlugin : IComputingPlugin
        {
            #region Члены IComputingPlugin

        public Parameters Calculate(Parameters inputparams)



        {

            //Получение входных параметров по их имени в БД из объекта типа Parameters
            double Pn = (double)inputparams["nom_moschn"].Value;                 // Номинальная мощность
            double _In = (double)inputparams["nom_tok"].Value;                   // Номинальный ток
            double Un = (double)inputparams["nom_napr"].Value;                   // Номинальное напряжение
            double Nn = (double)inputparams["nom_skor"].Value;                   // Номинальная скорость (частота) вращения
            double r = (double)inputparams["sopr_yakor_cep"].Value;              // Сопротивление якорной цепи двигателя
            double rdn = (double)inputparams["sopr_dop_polus"].Value;            // Сопротивление дополнительных полюсов
            double p = (double)inputparams["chislo_par_polus"].Value;            // Число пар полюсов
            double J1 = (double)inputparams["mom_in_val_dvig_1priv"].Value;      // Момент инерции вала двигателя основного привода
            double Jc = (double)inputparams["mom_in_strug"].Value;               // Момент инерции струга
            double C1 = (double)inputparams["koef_zhestk_rab_vetv"].Value;       // Коэффициент жесткости рабочей ветви цепи
            double C3 = (double)inputparams["koef_zhestk_obr_vetv"].Value;       // Коэффициент жесткости обратной ветви цепи
            double Ks = (double)inputparams["koef_otn_moschn_id_vipr"].Value;    // Коэффициент, характеризующий отношение мощностей в идеальном выпрямителе
            double Kc = (double)inputparams["koef_zapas_napr"].Value;            // Коэффициент запаса по напряжению
            double Sn = (double)inputparams["nom_mosch_trans"].Value;            // Номинальная мощность трансформатора
            double Kr = (double)inputparams["koef_paden_napr_obmot_trans"].Value;// Коэффициент учитывающий падение напряжения в вентилях и обмотках трансформатора
            double Pxx = (double)inputparams["mosch_hol_hod"].Value;             // Мощность холостого хода
            double Ki0 = (double)inputparams["koef_otn_tok_vipr"].Value;         // Коэффициент характеризующий отношение токов в выпрямителе
            double dPkz = (double)inputparams["poter_kor_zam"].Value;            // Потери короткого замыкания
            double Uk = (double)inputparams["paden_napr_kor_zam"].Value;         // Падение напряжения в режиме короткого замыкания
            double dPmdr = (double)inputparams["poter_obm_dros"].Value;          // Потери в обмотках дросселя
            double U2n = (double)inputparams["nom_lin_napr_2obm_trans"].Value;   // Номинальное линейное напряжение вторичной обмотки сети трансформатора
            double Wcm = (double)inputparams["max_priv_ugl_skor_strug"].Value;   // Максимальная приведенная угловая скорость струга
            double Idrn = (double)inputparams["nom_tok_reakt"].Value;            // Номинальный ток реактора
            double Uym = (double)inputparams["max_napr_vhod_sifu"].Value;        // Максимальное напряжение на входе СИФУ преобразователя
            double Ishn = (double)inputparams["nom_tok_shunt"].Value;            // Номинальный ток шунта
            double dUshn = (double)inputparams["paden_napr_nom_tok_shunt"].Value;// Падения напряжения при номинальном токе через шунт
            double Uztm = (double)inputparams["napr_zamk_kont_tok"].Value;       // Напряжение замкнутого контура тока
            double Cot = (double)inputparams["emkost_cep_obr_svyaz_tok"].Value;  // Емкость цепи обратной связи по току
            double Uzc = (double)inputparams["zad_napr"].Value;                  // Значение задающего напряжения
            double Roc = (double)inputparams["sopr_cep_obr_svyaz"].Value;        // Сопротивление в цепи обратной связи
            double Ki = (double)inputparams["kof_otn_tok_id_vipr"].Value;        // Коэффициент, характеризующий отношение токов в идеальном выпрямителе
            double Ku = (double)inputparams["kof_otn_napr_id_vipr"].Value;       // Коэффициент, характеризующий отношение напряжений в идеальном выпрямителе
            double J2 = (double)inputparams["mom_in_val_dvig_2priv"].Value; // Момент инерции вала двигателя вспомогательного привода
            double Tn = (double)inputparams["post_vremen_tir_preobr"].Value;   // Постоянная времени тиристорного преобразователя
            double U1l = (double)inputparams["lin_napr_1obm_trans"].Value;       // Линейное напряжение первичной обмотки
            double mtr = (double)inputparams["chisl_faz_trans"].Value;           // Число фаз трансформатора
            double Mb = (double)inputparams["chisl_faz_vipr"].Value;             // Число фаз выпрямителя
            double Kzt = (double)inputparams["koef_zapas_tok"].Value;            // Коэффициент запаса по току
            double nb = (double)inputparams["chisl_paral_vent"].Value;           // Число параллельно соединенных вентилей
            double Kobr = (double)inputparams["koef_otn_max_obr_napr_eds"].Value;// Коэффициент, характеризующий отношение между макс обратном напряжении на вентиле и ЭДС 
            double wnc = (double)inputparams["krug_chast_pit_set"].Value;        // Круговая частота питающей сети
            double Kdk = (double)inputparams["koef_kompens_obm"].Value;          // Коэффициент учитывающий наличие компенсационной обмотки
            double Wn = (double)inputparams["nom_ugl_skor_dvig"].Value;          // Номинальная угловая скорость двигателя
            double Bt = (double)inputparams["koef_izmen_sopr_peregrev"].Value;   // Коэффициент учитывающий изменение сопротивления при перегреве
            // =====================================================================



            // ============================== Расчет ===============================
            double J = (J1 + Jc) / J1;
            double Str = Ks * Kc * Ki * Kr * Un * _In * 0.001;
            double U2f = Ku * Kc * Kr * Un;
            double I2 = Ki0 * Ki * _In;
            double U2l = Math.Sqrt(3) * U2f;
            double I2n = (Sn * 1000) / (U2n * Math.Sqrt(3));

            if (!(Sn >= Str) && (U2n <= U2l) && (I2n >= I2))
            {
               
                // MessageBox.Show("Выберите другой трансформатор");
                return null;
            }

            double U2fn = U2n / Math.Sqrt(3);
            double I1n = Sn * 1000 / (U1l * Math.Sqrt(3));
            double Ktr = U1l / U2n;
            double Rtr = dPkz / (mtr * I1n * I1n * Ktr * Ktr);
            double U1f = U1l / Math.Sqrt(3);
            double xtr = (Uk * U1f) / (100 * I1n * Ktr * Ktr);
            double Rdr1 = Rtr / mtr;
            double Rdr = dPmdr / (Idrn * Idrn);
            double Rn = Rdr + Rtr + ((xtr * Mb) / (2 * 3.14));
            double Ed1 = Un + _In * Rn;
            double Imax = 3 * _In;
            double Ibcp = Imax / (Kzt * mtr * nb);
            double Uobr = Kobr * (U2fn / Ku);
            double Imin = 0.1 * _In;
            double L = 0.126 * (U2n / (wnc * Imin));
            double Ltr = xtr / wnc;
            double Ldv = Kdk * Un / (p * Wn * _In);
            double Ldr0 = L - Ldv - 2 * Ltr;
            double Rdv = Bt * (r + rdn);
            double Rnz = 2 * Rtr + Rdr + (xtr * Mb / (2 * 3.14));
            double Cd = (Un - _In * Rdv) / Wn;
            double Rj = Rdv + Rnz;
            double Lj = Ldv + Ldr0 + 2 * Ltr;
            double Tj = Lj / Rj;
            double Tm1 = (J1 * Rj) / (Cd * Cd);
            double Ed0 = U2f / Ku;
            double Kn = Ed0 / Uym;
            double Kw = Rj / Cd;
            double Kmc = Rj / (Cd * Cd);
            double Tmc = (Jc * Rj) / (Cd * Cd);
            double T4 = Math.Sqrt(J2 / C3);
            double T3 = Math.Sqrt(Jc / C1);
            double Ksh = dUshn / Ishn;
            double Kj = 1 / Rj;
            double Kt = Imax / Uztm;
            double Tt = 2 * Tn;
            double Kot = 1 / Kt;
            double Kdt = Kot / Ksh;
            double K = Kot * Kt;
            double Tpt = Tt * Kn * Kj * Kot;
            double Rot = Tj / Cot;
            double R2t = Tpt / Cot;
            double R1t = R2t * K;
            double Kq1 = (2 * T3 * C1) / (Cd * (J - 1) * Kt);
            double Kq3 = (2 * T4 * C3) / (Cd * Kt);
            double Koc = Uzc / Wcm;
            double Kpc = (Tmc * J * J) / (Kt * Cd * (J - 1) * Kmc * Koc * 2 * (2 * T3 + J * Tt));
            double R2c = Roc / Kpc;
            double R1c = R2c;


            Parameters result = new Parameters();
            // ===================================================================

            //Формирование выходных параметров в виде объекта типа Parameters
            result.Add("sootn_mom_inerc_strug_priv", J);    // Соотношение моментов инерции струга и приводов
            result.Add("tip_moschn_trans", Str);  // Типовая мощность трансформатора
            result.Add("faz_napr_2obm_trans", U2f);  // Фазное напряжение вторичной обмотки трансформатора
            result.Add("deyst_tok_2obm_trans", I2);   // Действующее значение тока вторичной обмотки трансформатора
            result.Add("lin_napr_2obm_trans", U2l);  // Линейное напряжение вторичной обмотки трансформатора
            result.Add("nomin_faz_napr_2obm_trans", U2fn); // Номинальное фазное напряжение вторичной обмотки трансформатора
            result.Add("nomin_tok_2obm_trans", I2n);  // Номинальное значение тока вторичной обмотки трансформатора
            result.Add("nom_tok_1obm_trans", I1n);  // Номинальный ток первичной обмотки трансформатора
            result.Add("koef_transf", Ktr);  // Коэффициент трансформации
            result.Add("aktiv_sopr_trans", Rtr);  // Активное сопротивления трансформатора
            result.Add("induk_sopr_trans", xtr);  // Индуктивное сопротивления трансформатора
            result.Add("aktiv_sopr_sglaz_dros_poter_obmot", Rdr1); // Активное сопротивление сглаживающего дросселя при потерях в обмотках
            result.Add("ekvivalent_sopr_preobr", Rn);   // Эквивалентное сопротивление преобразователя
            result.Add("eds_preobr_nom_tok_nagr", Ed1);  // ЭДС преобразователя при номинальном токе нагрузки
            result.Add("max_tok_nagr", Imax); // Максимальный (Пусковой) ток нагрузки
            result.Add("sred_znach_tok_ventil_max_tok_nagr", Ibcp); // Среднее значение тока через вентиль при максимальном токе нагрузки
            result.Add("max_obr_napr_ventil", Uobr); // Максимальное обратное напряжение на вентиле
            result.Add("min_tok_nagr", Imin); // Минимальный ток нагрузки
            result.Add("induk_cep_viprelen_tok_nepreriv_tok_dvigatel", L);    // Индуктивность цепи выпрямленного тока из условия обеспечения непрерывного тока двигателя при мин. токе нагрузки
            result.Add("indukt_faz_trans_skor", Ltr);  // Индуктивность фазы трансформатора скорости
            result.Add("Indukt_yakor_cep_dvigat", Ldv);  // Индуктивность якорной цепи двигателя
            result.Add("indukt_sglazh_drosel", Ldr0); // Индуктивность сглаживающего дросселя
            result.Add("aktiv_sopr_sglazh_drosel", Rdr);  // Активное сопротивление сглаживающего дросселя
            result.Add("aktiv_sopr_yakor_cep_drosel", Rdv);  // Активное сопротивление якорной цепи двигателя
            result.Add("ekvivalent_sopr_cep_preobr", Rnz);  // Эквивалентное сопротивление цепи преобразователя
            result.Add("eds_dvig", Cd);   // Коэффициент ЭДС двигателя
            result.Add("aktiv_sopr_cep_vipremlen_tok", Rj);   // Активное сопротивление цепи выпрямленного тока
            result.Add("indukt_cep_vipremlen_tok", Lj);   // Индуктивность цепи выпрямленного тока
            result.Add("elmag_post_vrem_cep_vipreml_tok", Tj);   // Электромагнитная постоянная времени цепи выпрямленного тока
            result.Add("elmeh_post_vremen_privod", Tm1);  // Электромеханическая постоянная времени привода
            result.Add("nach_znach_eds_preobr", Ed0);  // Начальное значение ЭДС преобразователя
            result.Add("koef_usilen_tiris_preobr", Kn);   // Коэффициент усиления тиристорного преобразователя 
            result.Add("koef_pered_shunt", Ksh);  // Коэффициент передачи шунта
            result.Add("koef_pered_zven_tok_yakor", Kj);   // Коэффициент передачи звена тока якоря
            result.Add("koef_pered_zven_skor", Kw);   // Коэффициент передачи звена скорости электродвигателя
            result.Add("koef_pered_isp", Kmc);  // Коэффициент передачи исполнительного органа (шунта)
            result.Add("post_vremen_shunt", Tmc);  // Постоянная времени исполнительного органа (шунта)
            result.Add("post_vremen_koleb_mass_vspomog_priv", T4);   // Постоянная времени колебаний массы вспомогательного привода
            result.Add("post_vremen_koleb_mass_strug", T3);   // Постоянная времени колебаний массы струга
            result.Add("koef_pered_zamkn_kont_toka", Kt);   // Коэффициент передачи замкнутого контура тока
            result.Add("post_vremen_kont_toka", Tt);   // Постоянная времени контура тока
            result.Add("koef_obr_svyaz_tok", Kot);  // Коэффициент обратной связи по току
            result.Add("koef_usilen_datch_tok", Kdt);  // Коэффициент усиления датчика тока 
            result.Add("koef_usilen_regul_tok", K);    // Коэффициент усиления регулятора тока
            result.Add("post_vremen_regul_tok", Tpt);  // Постоянная времени регулятора тока
            result.Add("sopr_reist_obt_svyaz_tok", Rot);  // Сопротивление резистора обратной связи по току
            result.Add("sopr_rezist_cep_datch_tok", R2t);  // Сопротивление резистора в цепи датчика тока
            result.Add("sopr_rezist_vhod_regul_tok", R1t);  // Сопротивление резистора на входе регулятора тока
            result.Add("koef_korekt_svyaz_proizvod_deform_rab_vetv", Kq1);  // Коэффициент корректирующих связей по производным деформации рабочей ветви цепи
            result.Add("koef_korekt_svyaz_proizvod_deform_obr_vetv", Kq3);  // Коэффициент корректирующих связей по производным деформации обратной ветви цепи 
            result.Add("koef_obr_svyaz_skor_ispoln_organ", Koc);  // Коэффициент обратной связи по скорости исполнительного органа
            result.Add("koef_usilen_regul_skor", Kpc);  // Коэффициент усиления регулятора скорости
            result.Add("sopr_kont_regul_skor_vhod_regul_toka", R1c);  // Сопротивление в контуре регулирования скорости на входе регулятора тока
            result.Add("sopr_kont_regul_skor_datch_skor", R2c);   // Сопротивление в контуре регулирования скорости в цепи датчика

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
                    "nom_moschn",
                    "nom_tok",
                    "nom_napr",
                    "nom_skor",
                    "sopr_yakor_cep",
                    "sopr_dop_polus",
                    "chislo_par_polus",
                    "mom_in_val_dvig_1priv",
                    "mom_in_strug",
                    "koef_zhestk_rab_vetv",
                    "koef_zhestk_obr_vetv",
                    "koef_otn_moschn_id_vipr",
                    "koef_zapas_napr",
                    "nom_mosch_trans",
                    "koef_paden_napr_obmot_trans", 
                    "napr_faz_1obm_trans",
                    "mosch_hol_hod",
                    "koef_otn_tok_vipr",
                    "poter_kor_zam",
                    "paden_napr_kor_zam",
                    "poter_obm_dros",
                    "nom_lin_napr_2obm_trans",
                    "max_priv_ugl_skor_strug",
                    "nom_tok_reakt",
                    "max_napr_vhod_sifu",
                    "nom_tok_shunt",
                    "paden_napr_nom_tok_shunt",
                    "napr_zamk_kont_tok",
                    "emkost_cep_obr_svyaz_tok",
                    "zad_napr",
                    "sopr_cep_obr_svyaz",
                    "kof_otn_tok_id_vipr",
                    "kof_otn_napr_id_vipr",
                    "mom_in_val_dvig_2priv",
                    "post_vremen_tir_preobr",
                    "lin_napr_1obm_trans" ,
                    "chisl_faz_trans",
                    "chisl_faz_vipr",
                    "koef_zapas_tok",
                    "chisl_paral_vent",
                    "koef_otn_max_obr_napr_eds",
                    "krug_chast_pit_set",
                    "koef_kompens_obm",
                    "nom_ugl_skor_dvig",
                    "koef_izmen_sopr_peregrev"

                };
            }
        }
        //Возвращает имя модуля в виде строки
        public string Name
        {
            get { return "Статический режим"; }
        }
        #endregion
    }
}