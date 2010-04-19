USE [master]
GO
/****** Object:  Database [ASPM2003_SU_Database]    Script Date: 02/13/2009 15:37:33 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'ASPM2003_SU_Database')
BEGIN
CREATE DATABASE [ASPM2003_SU_Database]
END
GO
USE [ASPM2003_SU_Database]
GO
/****** Object:  Table [dbo].[MetadataModules]    Script Date: 06/10/2009 22:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MetadataModules](
	[ModuleName] [varchar](254) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_MetadataModules_1] PRIMARY KEY CLUSTERED 
(
	[ModuleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Название SQL таблицы' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MetadataModules', @level2type=N'COLUMN',@level2name=N'ModuleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Краткое описание функций модуля' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MetadataModules', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Описание расчётных модулей' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MetadataModules'
GO
INSERT [dbo].[MetadataModules] ([ModuleName], [Description]) VALUES (N'cep', NULL)
INSERT [dbo].[MetadataModules] ([ModuleName], [Description]) VALUES (N'ed', NULL)
INSERT [dbo].[MetadataModules] ([ModuleName], [Description]) VALUES (N'ep', NULL)
INSERT [dbo].[MetadataModules] ([ModuleName], [Description]) VALUES (N'gruzchik', NULL)
INSERT [dbo].[MetadataModules] ([ModuleName], [Description]) VALUES (N'Konv', NULL)
INSERT [dbo].[MetadataModules] ([ModuleName], [Description]) VALUES (N'krep', NULL)
INSERT [dbo].[MetadataModules] ([ModuleName], [Description]) VALUES (N'PlowMachineBase', N'Базовые параметры стругвой установки')
INSERT [dbo].[MetadataModules] ([ModuleName], [Description]) VALUES (N'sg', NULL)
INSERT [dbo].[MetadataModules] ([ModuleName], [Description]) VALUES (N'Su', NULL)
INSERT [dbo].[MetadataModules] ([ModuleName], [Description]) VALUES (N'transf', NULL)
INSERT [dbo].[MetadataModules] ([ModuleName], [Description]) VALUES (N'zb', NULL)
/****** Object:  Table [dbo].[PlowMachines]    Script Date: 06/10/2009 22:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlowMachines](
	[PlowMachineId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](254) NOT NULL,
	[IsPrototype] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifidedOn] [datetime] NULL,
 CONSTRAINT [PK_PlowMachines] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Идентификатор' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlowMachines', @level2type=N'COLUMN',@level2name=N'PlowMachineId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Название' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlowMachines', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Является прототипом' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlowMachines', @level2type=N'COLUMN',@level2name=N'IsPrototype'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Стуговые установки' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlowMachines'
GO
INSERT [dbo].[PlowMachines] ([PlowMachineId], [Name], [IsPrototype], [CreatedOn], [ModifidedOn]) VALUES (N'7c51939d-f048-4ae8-8d9a-c1160ab471a0', N'1УСВ67', 1, CAST(0x00009C240125DC22 AS DateTime), CAST(0x00009C24012615CD AS DateTime))
/****** Object:  Table [dbo].[zb]    Script Date: 06/10/2009 22:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zb](
	[PlowMachineId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[id_zaboy] [nvarchar](max) NULL,
	[name_z] [nvarchar](max) NULL,
	[mo_ugpl_1] [nvarchar](max) NULL,
	[so_ugre] [nvarchar](max) NULL,
	[max_mopl] [nvarchar](max) NULL,
	[ko_sore] [nvarchar](max) NULL,
	[ob_stug] [nvarchar](max) NULL,
	[ug_esot] [nvarchar](max) NULL,
	[vi_stlo] [nvarchar](max) NULL,
	[ko_stra] [nvarchar](max) NULL,
	[ko_ugug] [nvarchar](max) NULL,
	[ug_mepl] [nvarchar](max) NULL,
	[pr_stug] [nvarchar](max) NULL,
	[ko_vntr] [nvarchar](max) NULL,
	[a4] [nvarchar](max) NULL,
	[dl_la] [nvarchar](max) NULL,
	[pl_ug] [nvarchar](max) NULL,
	[ko_otj] [nvarchar](max) NULL,
	[xar_ug] [nvarchar](max) NULL,
	[ves_ug] [nvarchar](max) NULL,
	[Bc] [nvarchar](max) NULL,
	[ko_razr] [nvarchar](max) NULL,
	[min_mopl] [nvarchar](max) NULL,
	[drlp] [nvarchar](max) NOT NULL,
	[srsp] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_zb] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[zb] ([PlowMachineId], [id_zaboy], [name_z], [mo_ugpl_1], [so_ugre], [max_mopl], [ko_sore], [ob_stug], [ug_esot], [vi_stlo], [ko_stra], [ko_ugug], [ug_mepl], [pr_stug], [ko_vntr], [a4], [dl_la], [pl_ug], [ko_otj], [xar_ug], [ves_ug], [Bc], [ko_razr], [min_mopl], [drlp], [srsp]) VALUES (N'7c51939d-f048-4ae8-8d9a-c1160ab471a0', NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>1.3</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>230</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.65</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.4</double>', NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>0.872665</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.067</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.6</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.4</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.872665</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>27.4</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.85</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>55</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>200</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.35</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.493000000715256</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.6</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.5</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.03</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.01</double>')
/****** Object:  Table [dbo].[transf]    Script Date: 06/10/2009 22:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transf](
	[PlowMachineId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[id_transf] [nvarchar](max) NULL,
	[tip_mo] [nvarchar](max) NULL,
	[tok_vto] [nvarchar](max) NULL,
	[lin_napr] [nvarchar](max) NULL,
	[nom_mo] [nvarchar](max) NULL,
	[koef_tr] [nvarchar](max) NULL,
	[nom_lin_napr] [nvarchar](max) NULL,
	[mo_hh] [nvarchar](max) NULL,
	[poter_kz] [nvarchar](max) NULL,
	[pad_kz] [nvarchar](max) NULL,
	[u2fn] [nvarchar](max) NULL,
	[i2n] [nvarchar](max) NULL,
	[i1n] [nvarchar](max) NULL,
	[ind_f] [nvarchar](max) NULL,
	[tip_moschnost] [nvarchar](max) NULL,
	[faz_napr_vtor] [nvarchar](max) NULL,
	[koef_paden_napr_obmot_trans] [nvarchar](max) NULL,
	[koef_otn_tok_vipr] [nvarchar](max) NULL,
	[nom_mosch_trans] [nvarchar](max) NULL,
	[nom_lin_napr_2obm_trans] [nvarchar](max) NULL,
	[lin_napr_1obm_trans] [nvarchar](max) NULL,
	[napr_faz_1obm_trans] [nvarchar](max) NULL,
	[mosch_hol_hod] [nvarchar](max) NULL,
	[poter_kor_zam] [nvarchar](max) NULL,
	[chisl_faz_trans] [nvarchar](max) NULL,
	[paden_napr_kor_zam] [nvarchar](max) NULL,
	[poter_obm_dros] [nvarchar](max) NULL,
	[tip_moschn_trans] [nvarchar](max) NULL,
	[faz_napr_2obm_trans] [nvarchar](max) NULL,
	[deyst_tok_2obm_trans] [nvarchar](max) NULL,
	[lin_napr_2obm_trans] [nvarchar](max) NULL,
	[nomin_faz_napr_2obm_trans] [nvarchar](max) NULL,
	[nomin_tok_2obm_trans] [nvarchar](max) NULL,
	[nom_tok_1obm_trans] [nvarchar](max) NULL,
	[koef_transf] [nvarchar](max) NULL,
	[aktiv_sopr_trans] [nvarchar](max) NULL,
	[induk_sopr_trans] [nvarchar](max) NULL,
	[indukt_faz_trans_skor] [nvarchar](max) NULL,
	[chisl_faz_vipr] [nvarchar](max) NULL,
 CONSTRAINT [PK_transf] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[transf] ([PlowMachineId], [id_transf], [tip_mo], [tok_vto], [lin_napr], [nom_mo], [koef_tr], [nom_lin_napr], [mo_hh], [poter_kz], [pad_kz], [u2fn], [i2n], [i1n], [ind_f], [tip_moschnost], [faz_napr_vtor], [koef_paden_napr_obmot_trans], [koef_otn_tok_vipr], [nom_mosch_trans], [nom_lin_napr_2obm_trans], [lin_napr_1obm_trans], [napr_faz_1obm_trans], [mosch_hol_hod], [poter_kor_zam], [chisl_faz_trans], [paden_napr_kor_zam], [poter_obm_dros], [tip_moschn_trans], [faz_napr_2obm_trans], [deyst_tok_2obm_trans], [lin_napr_2obm_trans], [nomin_faz_napr_2obm_trans], [nomin_tok_2obm_trans], [nom_tok_1obm_trans], [koef_transf], [aktiv_sopr_trans], [induk_sopr_trans], [indukt_faz_trans_skor], [chisl_faz_vipr]) VALUES (N'7c51939d-f048-4ae8-8d9a-c1160ab471a0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>1.1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.817</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>100</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>400</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>6000</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>3468</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>940</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1150</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>3</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>3.5</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>100</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>93.9154</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>248.0016</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>125.818</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>429.5514</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>230.9401</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>144.3376</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>9.6225</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>15</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0184</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.056</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0002</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>6</double>')
/****** Object:  Table [dbo].[Su]    Script Date: 06/10/2009 22:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Su](
	[PlowMachineId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[dlin_su] [nvarchar](max) NULL,
	[sila_pod1] [nvarchar](max) NULL,
	[vrem_podg] [nvarchar](max) NULL,
	[prod_smen] [nvarchar](max) NULL,
	[teor_pr1] [nvarchar](max) NULL,
	[koef_nepr1] [nvarchar](max) NULL,
	[teh_pr1] [nvarchar](max) NULL,
	[koef_nepr_ex1] [nvarchar](max) NULL,
	[ex_pr1] [nvarchar](max) NULL,
	[sm_pr1] [nvarchar](max) NULL,
	[sut_pr_21] [nvarchar](max) NULL,
	[sut_pr_31] [nvarchar](max) NULL,
	[kol_smen1] [nvarchar](max) NULL,
	[kol_sut_21] [nvarchar](max) NULL,
	[kol_sut_31] [nvarchar](max) NULL,
	[teor_pr_act1] [nvarchar](max) NULL,
	[ko_rej] [nvarchar](max) NULL,
	[time_mine_work] [nvarchar](max) NULL,
	[time_ex_tex] [nvarchar](max) NULL,
	[cikl_pro] [nvarchar](max) NULL,
	[vis_str] [nvarchar](max) NULL,
	[rezh_r_su] [nvarchar](max) NULL,
	[skor_reg] [nvarchar](max) NULL,
	[pogr_reg] [nvarchar](max) NULL,
	[komp_one_two] [nvarchar](max) NULL,
	[shema_chelnokovaya] [nvarchar](max) NULL,
	[number_regim] [nvarchar](max) NULL,
	[с(1)] [nvarchar](max) NULL,
	[с(2)] [nvarchar](max) NULL,
	[lysu] [nvarchar](max) NOT NULL,
	[hysu] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Su] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Su] ([PlowMachineId], [dlin_su], [sila_pod1], [vrem_podg], [prod_smen], [teor_pr1], [koef_nepr1], [teh_pr1], [koef_nepr_ex1], [ex_pr1], [sm_pr1], [sut_pr_21], [sut_pr_31], [kol_smen1], [kol_sut_21], [kol_sut_31], [teor_pr_act1], [ko_rej], [time_mine_work], [time_ex_tex], [cikl_pro], [vis_str], [rezh_r_su], [skor_reg], [pogr_reg], [komp_one_two], [shema_chelnokovaya], [number_regim], [с(1)], [с(2)], [lysu], [hysu]) VALUES (N'7c51939d-f048-4ae8-8d9a-c1160ab471a0', N'<?xml version="1.0" encoding="utf-16"?>
<double>120</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>-1651.4234483125424</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.5</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>6</double>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>4</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>2100</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1500</double>', NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>0.5</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.05</double>')
/****** Object:  Table [dbo].[sg]    Script Date: 06/10/2009 22:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sg](
	[PlowMachineId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[id_sg] [nvarchar](max) NULL,
	[step_rez_t2] [nvarchar](max) NULL,
	[step_rez_t3] [nvarchar](max) NULL,
	[depth_rez1] [nvarchar](max) NULL,
	[height_pogruz] [nvarchar](max) NULL,
	[excess_rez_nad_str] [nvarchar](max) NULL,
	[width_rej_kr_b] [nvarchar](max) NULL,
	[width_rej_kr_b1] [nvarchar](max) NULL,
	[arc_ustan_rez_b2] [nvarchar](max) NULL,
	[ko_lin_nij_l] [nvarchar](max) NULL,
	[ko_lin_nij_k] [nvarchar](max) NULL,
	[ko_lin_nij_hr] [nvarchar](max) NULL,
	[arc_ustan_rez_b3] [nvarchar](max) NULL,
	[ko_variaciy_u6] [nvarchar](max) NULL,
	[ko_variaciy_u7] [nvarchar](max) NULL,
	[ko_variaciy_u8] [nvarchar](max) NULL,
	[k01] [nvarchar](max) NULL,
	[k02] [nvarchar](max) NULL,
	[k03] [nvarchar](max) NULL,
	[k04] [nvarchar](max) NULL,
	[k05] [nvarchar](max) NULL,
	[k06] [nvarchar](max) NULL,
	[k07] [nvarchar](max) NULL,
	[k08] [nvarchar](max) NULL,
	[k09] [nvarchar](max) NULL,
	[avg_proek_plow] [nvarchar](max) NULL,
	[d4] [nvarchar](max) NULL,
	[d5] [nvarchar](max) NULL,
	[d6] [nvarchar](max) NULL,
	[d7] [nvarchar](max) NULL,
	[l4] [nvarchar](max) NULL,
	[l5] [nvarchar](max) NULL,
	[l6] [nvarchar](max) NULL,
	[l7] [nvarchar](max) NULL,
	[r4] [nvarchar](max) NULL,
	[r5] [nvarchar](max) NULL,
	[r6] [nvarchar](max) NULL,
	[r7] [nvarchar](max) NULL,
	[rac_step_rasstanov_t1] [nvarchar](max) NULL,
	[rac_step_rasstanov_t11] [nvarchar](max) NULL,
	[avg_sil_rez_lin_1] [nvarchar](max) NULL,
	[avg_sil_rez_verx_1] [nvarchar](max) NULL,
	[avg_sil_rez_nij_1] [nvarchar](max) NULL,
	[avg_sil_rez_oper_1] [nvarchar](max) NULL,
	[bok_sil_lin_1] [nvarchar](max) NULL,
	[bok_sil_verx_1] [nvarchar](max) NULL,
	[bok_sil_nij_1] [nvarchar](max) NULL,
	[obw_sil_rez_1] [nvarchar](max) NULL,
	[obw_otj_sil_rez_1] [nvarchar](max) NULL,
	[obw_bok_sil_rez_1] [nvarchar](max) NULL,
	[d3_1] [nvarchar](max) NULL,
	[r3_1] [nvarchar](max) NULL,
	[d2_1] [nvarchar](max) NULL,
	[l2_1] [nvarchar](max) NULL,
	[l1_1] [nvarchar](max) NULL,
	[koef_var_z4] [nvarchar](max) NULL,
	[koef_var_z5] [nvarchar](max) NULL,
	[koef_var_otj_y4] [nvarchar](max) NULL,
	[koef_var_otj_y5] [nvarchar](max) NULL,
	[width_pogr_pov] [nvarchar](max) NULL,
	[arc_pogr_nije] [nvarchar](max) NULL,
	[arc_pogr_vishe] [nvarchar](max) NULL,
	[ko_tr_pogr] [nvarchar](max) NULL,
	[y1] [nvarchar](max) NULL,
	[y3] [nvarchar](max) NULL,
	[y7] [nvarchar](max) NULL,
	[y8] [nvarchar](max) NULL,
	[z2] [nvarchar](max) NULL,
	[z3] [nvarchar](max) NULL,
	[x1] [nvarchar](max) NULL,
	[x2] [nvarchar](max) NULL,
	[x3] [nvarchar](max) NULL,
	[ras_centr] [nvarchar](max) NULL,
	[sil_tyaj] [nvarchar](max) NULL,
	[ko_tr_m1] [nvarchar](max) NULL,
	[ko_tr_m2] [nvarchar](max) NULL,
	[ko_tr_m3] [nvarchar](max) NULL,
	[ko_tr_m4] [nvarchar](max) NULL,
	[ko_zapas] [nvarchar](max) NULL,
	[k61] [nvarchar](max) NULL,
	[k7] [nvarchar](max) NULL,
	[k9] [nvarchar](max) NULL,
	[ko_vl_sko] [nvarchar](max) NULL,
	[ko_variaciy_u4] [nvarchar](max) NULL,
	[ko_variaciy_u2] [nvarchar](max) NULL,
	[ko_izn] [nvarchar](max) NULL,
	[qty_rez] [nvarchar](max) NULL,
	[y9] [nvarchar](max) NULL,
	[k0] [nvarchar](max) NULL,
	[rez_sil_pogr1] [nvarchar](max) NULL,
	[sko_str] [nvarchar](max) NULL,
	[ko_got] [nvarchar](max) NULL,
	[g_resh] [nvarchar](max) NULL,
	[arc_pogr_pov] [nvarchar](max) NULL,
	[ras_p_tr_opor] [nvarchar](max) NULL,
	[arc_naknap_p] [nvarchar](max) NULL,
	[k_sopr_st_nakl] [nvarchar](max) NULL,
	[ko_skor] [nvarchar](max) NULL,
	[sko_str_max] [nvarchar](max) NULL,
	[koef_h_str] [nvarchar](max) NULL,
	[a2_pol] [nvarchar](max) NULL,
	[a1_pol] [nvarchar](max) NULL,
	[a0_pol] [nvarchar](max) NULL,
	[max_depth_rez] [nvarchar](max) NULL,
	[c_sg_konv] [nvarchar](max) NULL,
	[h_smax] [nvarchar](max) NULL,
	[h_smin] [nvarchar](max) NULL,
	[tpu_tzrtcso] [nvarchar](max) NULL,
	[ktpsr_y] [nvarchar](max) NULL,
	[diam_to] [nvarchar](max) NULL,
	[t_rez_sil_z] [nvarchar](max) NULL,
	[t_rez_otshs_x] [nvarchar](max) NULL,
	[t_rez_bok_y] [nvarchar](max) NULL,
	[t_prilst_y] [nvarchar](max) NULL,
	[kvssds_ugd] [nvarchar](max) NULL,
	[diam_pgd] [nvarchar](max) NULL,
	[kvnersrs_ntuc] [nvarchar](max) NULL,
	[kvrsr_oissurdl] [nvarchar](max) NULL,
	[kof_vl_dlstust] [nvarchar](max) NULL,
	[sil_tr1] [nvarchar](max) NULL,
	[tpslt] [nvarchar](max) NOT NULL,
	[dslc] [nvarchar](max) NOT NULL,
	[vshc] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_sg] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[sg] ([PlowMachineId], [id_sg], [step_rez_t2], [step_rez_t3], [depth_rez1], [height_pogruz], [excess_rez_nad_str], [width_rej_kr_b], [width_rej_kr_b1], [arc_ustan_rez_b2], [ko_lin_nij_l], [ko_lin_nij_k], [ko_lin_nij_hr], [arc_ustan_rez_b3], [ko_variaciy_u6], [ko_variaciy_u7], [ko_variaciy_u8], [k01], [k02], [k03], [k04], [k05], [k06], [k07], [k08], [k09], [avg_proek_plow], [d4], [d5], [d6], [d7], [l4], [l5], [l6], [l7], [r4], [r5], [r6], [r7], [rac_step_rasstanov_t1], [rac_step_rasstanov_t11], [avg_sil_rez_lin_1], [avg_sil_rez_verx_1], [avg_sil_rez_nij_1], [avg_sil_rez_oper_1], [bok_sil_lin_1], [bok_sil_verx_1], [bok_sil_nij_1], [obw_sil_rez_1], [obw_otj_sil_rez_1], [obw_bok_sil_rez_1], [d3_1], [r3_1], [d2_1], [l2_1], [l1_1], [koef_var_z4], [koef_var_z5], [koef_var_otj_y4], [koef_var_otj_y5], [width_pogr_pov], [arc_pogr_nije], [arc_pogr_vishe], [ko_tr_pogr], [y1], [y3], [y7], [y8], [z2], [z3], [x1], [x2], [x3], [ras_centr], [sil_tyaj], [ko_tr_m1], [ko_tr_m2], [ko_tr_m3], [ko_tr_m4], [ko_zapas], [k61], [k7], [k9], [ko_vl_sko], [ko_variaciy_u4], [ko_variaciy_u2], [ko_izn], [qty_rez], [y9], [k0], [rez_sil_pogr1], [sko_str], [ko_got], [g_resh], [arc_pogr_pov], [ras_p_tr_opor], [arc_naknap_p], [k_sopr_st_nakl], [ko_skor], [sko_str_max], [koef_h_str], [a2_pol], [a1_pol], [a0_pol], [max_depth_rez], [c_sg_konv], [h_smax], [h_smin], [tpu_tzrtcso], [ktpsr_y], [diam_to], [t_rez_sil_z], [t_rez_otshs_x], [t_rez_bok_y], [t_prilst_y], [kvssds_ugd], [diam_pgd], [kvnersrs_ntuc], [kvrsr_oissurdl], [kof_vl_dlstust], [sil_tr1], [tpslt], [dslc], [vshc]) VALUES (N'7c51939d-f048-4ae8-8d9a-c1160ab471a0', NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>0.1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.05</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.03</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.265</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.04</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.022</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.032</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>4</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>2</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>2</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>25</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.6</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.05</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.2</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.95</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0001</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.4</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.595</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.015</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.24</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.363</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.363</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.475</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.085</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.481</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.481</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.506</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.559</double>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>4</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>14.45</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>55.21</double>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>0.381</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.959931</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.309</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.2</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>319</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.06</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>83</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.12</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.4</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.96</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.4</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>115</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.015</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.89</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>11.48</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.2</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.3</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.35</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.2</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.25</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.95</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.95</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.95</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>9</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.17</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.5104</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.12</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>123.201</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>708.37446948609806</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.65</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.8</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>7</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>55</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.36</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>50</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.6</double>', NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>1.5</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.8</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0058</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>-0.032</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.089</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>0.52</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.305</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.12</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.25</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.06</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.43</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.03</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.48</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.28</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.9</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>8</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.7</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.22</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>-884.58339657189845</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.02</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.2</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.1</double>')
/****** Object:  Table [dbo].[PlowMachineBase]    Script Date: 06/10/2009 22:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlowMachineBase](
	[PlowMachineId] [uniqueidentifier] NOT NULL,
	[marka_strug] [nvarchar](max) NULL,
	[tip_su] [nvarchar](max) NULL,
	[min_proizv] [nvarchar](max) NULL,
	[max_proizv] [nvarchar](max) NULL,
	[sum_moj_dvig] [nvarchar](max) NULL,
	[min_skor] [nvarchar](max) NULL,
	[max_skor] [nvarchar](max) NULL,
	[min_tolj] [nvarchar](max) NULL,
	[max_tolj] [nvarchar](max) NULL,
	[min_moj_plast] [nvarchar](max) NULL,
	[max_moj_plast] [nvarchar](max) NULL,
	[sopr_urez] [nvarchar](max) NULL,
 CONSTRAINT [PK_PlowMachineBase] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PlowMachineBase] ([PlowMachineId], [marka_strug], [tip_su], [min_proizv], [max_proizv], [sum_moj_dvig], [min_skor], [max_skor], [min_tolj], [max_tolj], [min_moj_plast], [max_moj_plast], [sopr_urez]) VALUES (N'7c51939d-f048-4ae8-8d9a-c1160ab471a0', N'<?xml version="1.0" encoding="utf-16"?>
<string>1УСВ67</string>', N'<?xml version="1.0" encoding="utf-16"?>
<int>343</int>', N'<?xml version="1.0" encoding="utf-16"?>
<double>400</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>400</double>', N'<?xml version="1.0" encoding="utf-16"?>
<string>110*2</string>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.65</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.65</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.03</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.15</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.9</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>2</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>200</double>')
/****** Object:  Table [dbo].[MetadataFields]    Script Date: 06/10/2009 22:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MetadataFields](
	[FieldName] [varchar](254) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[ModuleName] [varchar](254) NOT NULL,
	[ClrType] [varchar](254) NOT NULL,
 CONSTRAINT [PK_MetadataFields] PRIMARY KEY CLUSTERED 
(
	[FieldName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Название поля' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MetadataFields', @level2type=N'COLUMN',@level2name=N'FieldName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Описание значений поля' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MetadataFields', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Поля модуля' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MetadataFields'
GO
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'a0_pol', N'Коэф полинома доп. толщины среза(для опр режР13)А0', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'a1_pol', N'Коэф полинома доп. толщины среза(для опр режР13)А1', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'a2_pol', N'Коэф полинома доп. толщины среза(для опр режР13)А2', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'a4', N'УголПриПересеченииПоверхЗабояИПоверхСтруга[град]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'a81', N'СредневзвешЗначАмплиСоставлУсилийЗаПроходПоЛав[кН]', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'aktiv_sopr_cep_vipremlen_tok', N'Активное сопротивление цепи выпрямленного тока', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'aktiv_sopr_sglaz_dros_poter_obmot', N'Активное сопротивление сглаживающего дросселя при потерях в обмотках', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'aktiv_sopr_sglazh_drosel', N'Активное сопротивление сглаживающего дросселя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'aktiv_sopr_trans', N'Активное сопротивления трансформатора', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'aktiv_sopr_yakor_cep_drosel', N'Активное сопротивление якорной цепи двигателя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'arc_chast1', N'УгловаяЧастотаВращенияГрузчика_1[1/с]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'arc_naklona_pogr', N'УголНаклонаПогрузПоверхСтруга[град]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'arc_naknap_p', N'угол, между наклонной направляющей и почвой, град.', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'arc_pogr_nije', N'УголНаклонаПоверхНижеВысотыПогрузки[град]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'arc_pogr_pov', N'угол наклона погрузочной поверхности струга, град', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'arc_pogr_vishe', N'УголНаклонаПоверхВышеВысотыПогрузки[град]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'arc_ustan_rez_b2', N'УголУстановкиРезцов_1[град]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'arc_ustan_rez_b3', N'УголУстановкиРезцов_2[град]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'arc_zaostr_konc_lop', N'УголЗаострКонцевЧастиЛопасти[град]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'avg_proek_plow', N'СредРасчетПроекцияПлощадки[кв.м.]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'avg_sil_rez_lin_1', N'СреднСилаРезНаЛинРезц_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'avg_sil_rez_nij_1', N'СреднСилаРезНаНижРезц_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'avg_sil_rez_oper_1', N'СреднСилаРезНаОперРезц_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'avg_sil_rez_verx_1', N'СреднСилаРезНаВерхРезц_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Bc', N'ВелОтодвКонвОтЗабояВТ-кеКонтактаЗаднейОпорыСтруга', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'bok_sil_lin_1', N'СреднБокСилаНаЛинРезце_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'bok_sil_nij_1', N'СреднБокСилаНаНижРезце_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'bok_sil_verx_1', N'СреднБокСилаНаВерхРезце_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'c_sg_konv', N'Соотношения скоростей струга и конвейера', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C1', N'En1 ЭДС тиристорного преобразователя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C10', N'фи1 Wс=приведённая к валу двигателя угл.скор', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C11', N'электромагнитный  момент двигателя основного', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'c111', N'c111', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C12', N'электромагнитный момент двигателя вспомогательного', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C13', N'приведённый упругий момент рабочей ветви', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C14', N'приведённый упругий момент рабочей ветви', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C17', N'напряжение управления тиристорным преобр', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C2', N'En2 ЭДС тиристорного преобразователя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C20', N'напряжение управления тиристорным преобр', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C3', N'фи1 угловая координата перемещения привода', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'c33', N'c33', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C4', N'фи2 угловая координата перемещения привода', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C5', N'фи с угловая координата перемещения привода', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C6', N'Iz1 ток якорной цепи 1,А', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C7', N'Iz2 ток якорной цепи 1,А', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C8', N'фи1 W1=приведённая к валу двигателя угл.скор', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C9', N'фи1 W2=приведённая к валу двигателя угл.скор', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Cd1', N'коэф ЭДС электродвигателя', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Cd2', N'коэф ЭДС электродвигателя', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'chisl_faz_trans', N'Число фаз трансформатора', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'chisl_faz_vipr', N'Число фаз выпрямителя', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'chisl_paral_vent', N'Число параллельно соединенных вентилей', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'chislo_par_polus', N'Число пар полюсов', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'cikl_pro', N'ПроизводительностьЦикла[т/ч]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'd2_1', N'КоордТочекОтжимСил[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'd3_1', N'КоордТочекОтжимСил[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'd4', N'КоордТочекПриложСилРез_1[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'd5', N'КоордТочекПриложСилРез_2[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'd6', N'КоордТочекПриложСилРез_3[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'd7', N'КоордТочекПриложСилРез_4[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'davl_rzhgl_psz1', N'ДавлениеРабочейЖидкости1', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'depth_rez1', N'ГлубинаРезания_1[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'deyst_tok_2obm_trans', N'Действующее значение тока вторичной обмотки трансформатора', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'diam_pgd', N'диаметр поршня гидравлического домкрата, см', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'diam_to', N'диаметр трубчатой опоры,м', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'dl_la', N'ДлинаЛавы[м]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'dlin_su', N'ДлинаСтруговойУстановки[м]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'dlp_is_konv', N'Длина переднего отрезка линии изгиба конвейера', N'Konv', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'dlz_is_konv', N'ДлинЗаднего отрезка линии изгиба конвейера', N'Konv', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'dp', N'шаг приращения времени', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'drlp', N'длина резца', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'dslc', N'длина струга', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'eds_dvig', N'Коэффициент ЭДС двигателя', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'eds_preobr_nom_tok_nagr', N'ЭДС преобразователя при номинальном токе нагрузки', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ekvivalent_sopr_cep_preobr', N'Эквивалентное сопротивление цепи преобразователя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ekvivalent_sopr_preobr', N'Эквивалентное сопротивление преобразователя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'elmag_post_vrem_cep_vipreml_tok', N'Электромагнитная постоянная времени цепи выпрямленного тока', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'elmeh_post_vremen_privod', N'Электромеханическая постоянная времени привода', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'emkost_cep_obr_svyaz_tok', N'Емкость цепи обратной связи по току', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'En1', N'En1 ЭДС тиристорного преобразователя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'En2', N'En2 ЭДС тиристорного преобразователя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'eps', N'заданная точность вычислений', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ex_pr1', N'ЭксплуатационнаяПроизводительность_1[т/ч]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'excess_rez_nad_str', N'ПревышРезцаНадСтругом[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'faz_napr_2obm_trans', N'Фазное напряжение вторичной обмотки трансформатора', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'faz_napr_vtor', N'НоминалФазнНапряжениеВторОбмоткиТрансформатора[В]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'g_resh', N'СилаТяжОдногоСУглемРештака[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'h_smax', N'max высота струга,м', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'h_smin', N'min высота струга, м', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'height_lop', N'ВысотаЛопастиГрузчика[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'height_pogruz', N'ВысотаПогрузки[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'height_skos', N'ВысотаСкосаЛопастиГруз[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'hod_gid', N'ХодГидродомкрата[м]', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'hysu', N'высота плиты СУ', N'su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'I1', N'приведённый к угловой скорости вала прив и стр', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'i1n', N'НоминальныйТокПервичОбмоткиТрансф[Ом]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'I2', N'приведённый к угловой скорости вала двигателя прив', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'i2n', N'НоминальноеЗначениеТокаВторичОбмоткиТрансф[А]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Ic', N'приведённый к угловой скорости вала двигателя стр', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_cep', NULL, N'cep', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_ed', NULL, N'ed', N'System.Int32')
GO
print 'Processed 100 total records'
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_epriv', NULL, N'ep', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_gruz', NULL, N'gruzchik', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_konv', NULL, N'Konv', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_krep', NULL, N'krep', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_sg', NULL, N'sg', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_transf', NULL, N'transf', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_zaboy', NULL, N'zb', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ind_f', N'ИндуктивностьФазыТрансформатора[Гн]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'induk_cep_viprelen_tok_nepreriv_tok_dvigatel', N'Индуктивность цепи выпрямленного тока из условия обеспечения непрерывного тока двигателя при мин. токе нагрузки', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'induk_sopr_trans', N'Индуктивное сопротивления трансформатора', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'indukt_cep_vipremlen_tok', N'Индуктивность цепи выпрямленного тока', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'indukt_faz_trans_skor', N'Индуктивность фазы трансформатора скорости', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'indukt_sglazh_drosel', N'Индуктивность сглаживающего дросселя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Indukt_yakor_cep_dvigat', N'Индуктивность якорной цепи двигателя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Iz1', N'ток якорной цепи 1,А', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Iz2', N'ток якорной цепи 1,А', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k_sopr_st_nakl', N'коэф сопр-я движ струга по наклонной напр-й', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k0', N'Коэффициент 0', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k01', N'Коэффициент_1', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k02', N'Коэффициент_2', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k03', N'Коэффициент_3', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k04', N'Коэффициент_4', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k05', N'Коэффициент_5', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k06', N'Коэффициент_6', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k07', N'Коэффициент_7', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k08', N'Коэффициент_8', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k09', N'Коэффициент_9', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k61', N'Коэффициент_1', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k7', N'Коэффициент', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k9', N'Коэффициент', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Kd1', N'', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Kd3', N'', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Kn1', N'Коэффициент усилия тиристорного преобразователя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Kn2', N'Коэффициент усилия тиристорного преобразователя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_got', N'КоэффициентГотовности', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_izn', N'КоэфВлиянияИзносаРезцов', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_lin_nij_hr', N'Кол-воЛин_и_НижРезцов_3[шт]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_lin_nij_k', N'Кол-воЛин_и_НижРезцов_2[шт]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_lin_nij_l', N'Кол-воЛин_и_НижРезцов_1[шт]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_otj', N'Коэф_УчитывОтжимУгля[м]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_razr', N'Коэф разрахленности угля', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_rej', N'КоэфВлиянияРежимаРаботы', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_skor', N'Коэф. Скоростного режима', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_sore', N'КоэфСопротивленияРезанию', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_stra', N'Коэф_СтепеньРазрушУгля', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_tr_m1', N'КоэффициентТрения_1', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_tr_m2', N'КоэффициентТрения_2', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_tr_m3', N'КоэффициентТрения_3', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_tr_m4', N'КоэффициентТрения_4', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_tr_pogr', N'КоэфТренияУгляПоПоверхнСтруга', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_ugug', N'КоэфТренияУгляПоУглю', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_variaciy_u2', N'КоэффициентВариации', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_variaciy_u4', N'КоэфВариацииСилыРезания', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_variaciy_u6', N'КоэффициентВариаций_1', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_variaciy_u7', N'КоэффициентВариаций_2', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_variaciy_u8', N'КоэффициентВариаций_3', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_vl_sko', N'КоэфВлиянияСредСкоростиСтругаНаУсилияВЦепи', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_vntr', N'КоэфВнутреннегоТренияУгля', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_zap', N'коэф заполнения конвейера', N'Konv', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_zapas', N'КоэффициентЗапаса', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ko_zapol', N'КоэффициентЗаполнения', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Koc', N'', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_h_str', N'коэф.высоты струга', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_izmen_sopr_peregrev', N'Коэффициент учитывающий изменение сопротивления при перегреве ', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_kol', N'КоэфУчитывающКол-воРештаков', N'Konv', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_kompens_obm', N'Коэффициент учитывающий наличие компенсационной обмотки ', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_korekt_svyaz_proizvod_deform_obr_vetv', N'Коэффициент корректирующих связей по производным деформации обратной ветви цепи ', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_korekt_svyaz_proizvod_deform_rab_vetv', N'Коэффициент корректирующих связей по производным деформации рабочей ветви цепи', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_nepr_ex1', N'КоэфНепрерывностиРаботыПриЭксплуатации_1', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_nepr1', N'КоэфТехническиВозможнойНепрерывностиРаботы_1', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_nerav1', N'КоэфВлиянияНеравн-тиСилыРезанияНаНеравнТягУсилия1', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_obr_svyaz_skor_ispoln_organ', N'Коэффициент обратной связи по скорости исполнительного органа', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_obr_svyaz_tok', N'Коэффициент обратной связи по току', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_otn_max_obr_napr_eds', N'Коэффициент, характеризующий отношение между макс обратном напряжении на вентиле и ЭДС ', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_otn_moschn_id_vipr', N'Коэффициент, характеризующий отношение мощностей', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_otn_tok_vipr', N'Коэффициент характеризующий отношение токов в выпрямителе', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_paden_napr_obmot_trans', N'Коэффициент учитывающий падение напряжения в вентилях и обмотках трансформатора', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_pered_isp', N'Коэффициент передачи исполнительного органа (шунта)', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_pered_shunt', N'Коэффициент передачи шунта', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_pered_zamkn_kont_toka', N'Коэффициент передачи замкнутого контура тока', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_pered_zven_skor', N'Коэффициент передачи звена скорости электродвигателя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_pered_zven_tok_yakor', N'Коэффициент передачи звена тока якоря', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_tr', NULL, N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_transf', N'Коэффициент трансформации', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_usilen_datch_tok', N'Коэффициент усиления датчика тока ', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_usilen_regul_skor', N'Коэффициент усиления регулятора скорости', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_usilen_regul_tok', N'Коэффициент усиления регулятора тока ', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_usilen_tiris_preobr', N'Коэффициент усиления тиристорного преобразователя ', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_var_otj_y4', N'КоэфВариацииОтжимСил_1', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_var_otj_y5', N'КоэфВариацииОтжимСил_2', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_var_z4', N'КоэфВариацииРавнодСил_1', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_var_z5', N'КоэфВариацииРавнодСил_2', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_zapas_napr', N'Коэффициент запаса по напряжению', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_zapas_tok', N'Коэффициент запаса по току', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_zhestk_obr_vetv', N'Коэффициент жесткости обратной ветви цепи', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_zhestk_rab_vetv', N'Коэффициент жесткости рабочей ветви цепи', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kof_otn_napr_id_vipr', N'Коэффициент, характеризующий отношение напряжений в идеальном выпрямителе', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kof_otn_tok_id_vipr', N'Коэффициент, характеризующий отношение токов в идеальном выпрямителе', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kof_vl_dlstust', N'коэффициент влияния длины струговой установки', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kof_vlmasstr', N'коэффициент влияния массы струга', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kof_vlzhstrc', N'Коэффициент влияния жесткости струговой цепи', N'cep', N'System.Double')
GO
print 'Processed 200 total records'
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kof_vnskmeops', N'КоэфВарНизкочСоставлКрутМомЭлектродвОснПривСтруга', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kof_vnskmevp', N'КоэфВарНизкочСоставлКрутМомЭлектродвВспоПривСтруга', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kof_zrsrsmces', N'КоэфХаракНаибЗначРезСилРезВМомСколаСтружки', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kol_smen1', N'КоличествоЦикловВСмену_1[ц/см]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kol_sut_21', N'Кол-воЦикловВСуткиПриДвухсменнойРаботе_1[ц/сут.2]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kol_sut_31', N'Кол-воЦикловВСуткиПриТрехсменнойРаботе_1[ц/сут.3]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'komp_one_two', NULL, N'Su', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Kpc', NULL, N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kpd_pri_re', N'КПД приводных редукторов', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kpd_pri_zv', N'КПД приводных звездочек', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kpd_privreduk', N'КПД ПриводныхРедукторов', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kpd_privzvezd', N'КПД ПриводныхЗвездочек', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kpd_soe_mu', N'КПД соединительнх муфт', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kpd_soedmuft', N'КПД СоединительныхМуфт', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'krug_chast_pit_set', N'Круговая частота питающей сети ', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ktpsr_y', N'коорд т-ки приложения силы резания по оси y'''',м', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kvnersrs_ntuc', N'КоэфВлНеравнСилыРезанияНаСтругеНаНеравнТягУсилЦепи', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kvrsr_oissurdl', N'КоэфВарРезСилыРезОбуслИзмСрСопрУгляРезДлЛавы', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kvssds_ugd', N'КоэфВлСрСкорДвижСтругаНаУсилиеГидравлДомкратом1Уч', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'L1', N'индуктивность цепи выпрямленного тока, Гн', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'l1_1', N'КоордТочекОтжимСил[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'L2', N'индуктивность цепи выпрямленного тока, Гн', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'l2_1', N'КоордТочекОтжимСил[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'l4', N'КоордТочекПриложСилРез_5[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'l5', N'КоордТочекПриложСилРез_6[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'l6', N'КоордТочекПриложСилРез_7[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'l7', N'КоордТочекПриложСилРез_8[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'length_konc_lop', N'ДлинаКонцевЧастиЛопастиГруз[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'length_sred_lop', N'ДлинаСредЧастиЛопастиГруз[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'lin_napr', N'ЛинНапряжениеВторичОбмотки[В]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'lin_napr_1obm_trans', N'Линейное напряжение первичной обмотки', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'lin_napr_2obm_trans', N'Линейное напряжение вторичной обмотки трансформатора', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'lysu', N'длина СУ', N'su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'marka_strug', N'марка струга', N'PlowMachineBase', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_depth_rez', N'макс. Толщина среза,м', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_moj_plast', N'Максимальная мощность пласта', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_mopl', N'Max_МощностьПласта[м]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_napr_vhod_sifu', N'Максимальное напряжение на входе СИФУ преобразователя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_obr_napr_ventil', N'Максимальное обратное напряжение на вентиле', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_priv_ugl_skor_strug', N'Максимальная приведенная угловая скорость струга', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_proizv', N'Максимальная производительность', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_skor', N'Максимальная скорость движения струга', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_tok_nagr', N'Максимальный (Пусковой) ток нагрузки', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_tolj', N'Максимальная толщина стружки', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Mc', N'Mc приведённый к валу двигателя момент сопрот', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'min_moj_plast', N'Минимальная мощность пласта', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'min_mopl', N'мощность пласта минимальная, м', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'min_proizv', N'Минимальная производительность', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'min_skor', N'Минимальная скорость движения струга', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'min_tok_nagr', N'Минимальный ток нагрузки', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'min_tolj', N'Минимальная толщина стружки', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'mo_hh', N'МощностьХолостогоХода[Вт]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'mo_ugpl_1', N'Мощность угольного пласта(средн) м', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'mom_in_strug', N'Момент инерции струга', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'mom_in_val_dvig_1priv', N'Момент инерции вала двигателя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'mom_in_val_dvig_2priv', N'Момент инерции вала двигателя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'mosch_hol_hod', N'Мощность холостого хода', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'My1', N'приведённый упругий момент рабочей ветви', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'My3', N'приведённый упругий момент обратной ветви', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'n', N'число уравнений системы дифференциальных уравнений', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nach_znach_eds_preobr', N'Начальное значение ЭДС преобразователя', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'name_z', NULL, N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'napr_faz_1obm_trans', N'Напряжение фазы первичной обмотки трансформатора', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'napr_zamk_kont_tok', N'Напряжение замкнутого контура тока', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_lin_napr', N'НоминалЛинейнНапряжВторичОбмотки[В]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_lin_napr_2obm_trans', N'Номинальное линейное напряжение вторичной обмотки сети трансформатора', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_mo', N'НоминМощностьТрансформата[кВ*А]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_mosch_trans', N'Номинальная мощность трансформатора', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_moschn', N'Номинальная мощность', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_napr', N'Номинальное напряжение', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_rot', N'НоминалЧастотаВращенияРотора[1/мин]', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_skor', N'Номинальная скорость (частота) вращения', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_tok', N'Номинальный ток', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_tok_1obm_trans', N'Номинальный ток первичной обмотки трансформатора', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_tok_reakt', N'Номинальный ток реактора', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_tok_shunt', N'Номинальный ток шунта', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_ugl_skor_dvig', N'Номинальная угловая скорость двигателя ', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nomin_faz_napr_2obm_trans', N'Номинальное фазное напряжение вторичной обмотки трансформатора', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nomin_tok_2obm_trans', N'Номинальное значение тока вторичной обмотки трансформатора', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'number_regim', NULL, N'Su', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ob_stug', N'ОбъемШтабеляУгляНаЛопастнПогрузУст-веСтруга[куб.м]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'obw_bok_sil_rez_1', N'РавнодейстБокСилРезан_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'obw_otj_sil_rez_1', N'РавнодейстОтжимСилРез_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'obw_sil_rez_1', N'РавнодействующСилРезан_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'p', N'текущее значение времени', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'pad_kz', N'ПадениеНапряженияВРежиме к.з.[%]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'paden_napr_kor_zam', N'Падение напряжения в режиме к.з.', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'paden_napr_nom_tok_shunt', N'Падения напряжения при номинальном токе через шунт', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'per_ch_red', N'ПередаточноеЧислоРедуктора', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'pl_ug', N'Плотность угля, т/м^3', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'plow_sech', N'ПлощадьСеченияЛопастиГрузчика[кв.м.]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'plow1', N'ПлощадьСеченияПотокаУгля_1[кв.м.]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'pogr_reg', NULL, N'Su', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'pogr_spos_kons1', N'ПогрузСпос-стьГрузчикаПоКонструкПар-рам_1[кв.м/с]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'pogr_spos_rej1', N'ПогрузочнаяСпос-стьГрузчикаПоЕгоРежимнымПар-рам_1', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'post_vremen_koleb_mass_strug', N'Постоянная времени колебаний массы струга', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'post_vremen_koleb_mass_vspomog_priv', N'Постоянная времени колебаний массы вспомогательного привода', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'post_vremen_kont_toka', N'Постоянная времени контура тока', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'post_vremen_regul_tok', N'Постоянная времени регулятора тока ', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'post_vremen_shunt', N'Постоянная времени исполнительного органа (шунта)', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'post_vremen_tir_preobr', N'Постоянная времени тиристорного преобразователя', N'ep', N'System.Double')
GO
print 'Processed 300 total records'
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'poter_kor_zam', N'Потери короткого замыкания', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'poter_kz', N'ПотериКороткогоЗамыкания[Вт]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'poter_obm_dros', N'Потери в обмотках дросселя', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'pr_stug', N'ПрочностьШтабеляУгляНаСдвиг[кН кв.м.]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'prod_smen', N'ПродолжительностьСмены[ч]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'proiz_konv', N'Производ. Конвейера, т/мин', N'Konv', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'qty_rez', N'ЧислоРезцов[шт.]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'r_nij_lop', N'РадиусНижЧастиЛопастиГруз[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'r_nij_osn_korp', N'РадиусНижОсн-яКорпусаГруз[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'r_verh_lop', N'РадиусВерЧастиЛопастиГруз[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'r_verh_osn_lop', N'РадиусВерхОсн-яЛопастиГруз[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'r_verx_osn_korp', N'РадиусВерхОсн-яКорпусаГруз[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'r3_1', N'КоордТочекОтжимСил[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'r4', N'КоордТочекПриложСилРез_9[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'r5', N'КоордТочекПриложСилРез_10[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'r6', N'КоордТочекПриложСилРез_11[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'r7', N'КоордТочекПриложСилРез_12[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'rac_step_rasstanov_t1', N'РасчШагиРасстановРезцов_1[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'rac_step_rasstanov_t11', N'РасчШагиРасстановРезцов_7[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'rad_priv_zv', N'РадиусПриводнойЗвездочки[м]', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ras_centr', N'РасстояниеМежЦентрамиОпорСтругаНаКонвеер[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ras_p_tr_opor', N'РасстОтПочвыДоЦентраВерхТрубчОпорыНакл-йНапр-й, м', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'rez_ko_var1', N'РезультирующийКоэфВариацииТяговУсилийВЦепиСтруга_1', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'rez_sil_pogr1', N'РезультирующаяСилаПогрузкиУгляСтругом_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'rezh_r_su', N'РежимРаботыСУ', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Rz1', N'активное сопротивление цепи выпрямленного тока', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Rz2', N'активное сопротивление цепи выпрямленного тока', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N's_sech_konv', N'Допустимая площадь поперечного сечения грузопотока', N'Konv', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'shag_ust', N'ШагУстановкиГидродомкратов[м]', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'shema_chelnokovaya', NULL, N'Su', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sil_tr1', N'СилаТренияВОпорахСтруга_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sil_tyaj', N'СилаТяжестиСтруга[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sila_pod1', N'СилаПодачиСтругаНаЗабой_1[кН]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sila_prstrcep', N'сила протягивания струговых цепей, Н', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sko_dv', N'СкоростьДвиженияЦепиСУ[м/с]', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sko_konv_max', N'max скорость конвейера м/с', N'Konv', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sko_str', N'Скорость движения струга', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sko_str_max', N'max скорость струга м/с', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sko_ug', N'СкоростьДвиженияУгля[м/с]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'skor_reg', NULL, N'Su', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sm_pr1', N'СменнаяПроизводительность_1[т/см]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'so_ugre', N'Сопротивляемость угля резанию, кгс/см', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sootn_mom_inerc_strug_priv', N'Соотношение моментов инерции струга и приводов', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sopr_cep_obr_svyaz', N'Сопротивление в цепи обратной связи', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sopr_dop_polus', N'Сопротивление дополнительных полюсов', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sopr_kont_regul_skor_datch_skor', N'Сопротивление в контуре регулирования скорости в цепи датчика ', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sopr_kont_regul_skor_vhod_regul_toka', N'Сопротивление в контуре регулирования скорости на входе регулятора тока', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sopr_reist_obt_svyaz_tok', N'Сопротивление резистора обратной связи по току ', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sopr_rezist_cep_datch_tok', N'Сопротивление резистора в цепи датчика тока', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sopr_rezist_vhod_regul_tok', N'Сопротивление резистора на входе регулятора тока', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sopr_urez', N'Сопротивляемость угля резанию', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sopr_yakor_cep', N'Сопротивление якорной цепи двигателя', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sr_tyag1', N'СреднееЗначениеТяговыхУсилийВЦепиСтруга_1[кН]', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sred_znach_tok_ventil_max_tok_nagr', N'Среднее значение тока через вентиль при максимальном токе нагрузки', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'srsp', N'сторона резца', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'srvzznam', N'СрзначАмплитВысокочастСостовлТягУсВЦепиСтруга', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'step_rez_t2', N'ШагРезания_1[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'step_rez_t3', N'ШагРезания_2[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'su_mosh_va1', N'СуммарМощностьНаВалахЭлектродвиг-ейПривода_1[кВт]', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sum_moj_dvig', N'Суммарная мощность электродвигателей', N'PlowMachineBase', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sum_power_priv1', N'сум мощн  привода струга_1, Вт', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sut_pr_21', N'СуточнаяПроизводительнПриДвухсменРаботе_1[т/сут.2]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sut_pr_31', N'СуточнаяПроизводительнПриТрехсменРаботе_1[т/сут.3]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'T', N'время', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N't_prilst_y', N'коорд т прилож сил тяжести струга по оси у,', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N't_rez_bok_y', N'коорд т прилож результ-й отж-х бок сил по оси у, м', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N't_rez_otshs_x', N'коорд т прилож результ-й отжим-х сил по оси x, м', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N't_rez_sil_z', N'коорд т прилож результ-й сил резания по оси z, м', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'teh_pr1', N'ТехническаяПроизводительность_1[т/ч]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'teor_pr', N'ТеоретическаяПроизв-стьГрузчика[Т/Ч]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'teor_pr_act1', N'Теоретич. Производительность струговой устан', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'teor_pr_pogr1', N'ТеорПроиз-тьПогрузочногоУстройства1[Т/Ч]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'teor_pr1', N'ТеоретическаяПроизв-стьСУ_1[Т/Ч]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'time_ex_tex', N'ЗатратыВремНаЭкспл-ТехОперац[мин]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'time_mine_work', N'ЗатратыВремНаГорн-ЭксплОпер[мин]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_ed', NULL, N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_kn', NULL, N'Konv', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_krep', NULL, N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_mo', NULL, N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_moschn_trans', N'Типовая мощность трансформатора', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_moschnost', N'ТиповаяМощностьТрансформатора[кВА]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_privod', NULL, N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_su', N'Марка струговой установки', N'PlowMachineBase', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_tsep', NULL, N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Tmod4', N'Усилие погрузки грузчиком', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Tn1', N'постоянная времени преобразователя, с', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Tn2', N'постоянная времени преобразователя, с', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tok_vto', N'ТокВторичнойОбмоткиТранформатора[кг*м2]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tpslt', N'Текущее положение струга', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tpu_tzrtcso', N'ТочкаПриложУсилияВТочЗакрРабВетвиТягЦепиНаСтруге', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Trt', N'', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Tz', N'', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'u2fn', N'НоминальноеФазовоеНапряжениеВторичОбмоткиТрансф[В]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ug_esot', N'УголЕстествОткосаРазрушУгля[град]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ug_mepl', N'УголМежПлос-тьюСдвигПризмыВыжимаИПлоскПласта[град]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'us_gdpsz_resh1', N'УсилНаШтокахГидрДомкрПодСтругаЧерРештак1', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'us_pro', N'УсилиеПротягивания1метраЦепи[кН/м]', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Uy1', N'', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Uzc', N'', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'v_konv', N'Скорость конвейера м/мин', N'Konv', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ves_ug', N'УдельныйВесУгля[кн/м.куб]', N'zb', N'System.Double')
GO
print 'Processed 400 total records'
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vi_stlo', N'ВысотаШтабеляУгляНадЛопаст[м]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vis_pogr', N'ВысотаПогрузки[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vis_str', N'ВысотаСтруга[м]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vre_rev_pri', N'ЗатратыВремНаРеверсПривода[с]', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vrem_peredv', N'ВремяПередвижения[с]', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vrem_perem', N'ВремяПеремещРабочегоПоЛаве[с]', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vrem_pod', N'ВремяПодтяг-яСекцииККонтейн[с]', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vrem_podg', N'ВремяПодгот-ЗаключОпераций[ч]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vrem_raz', N'ВремяРазгрузкиСекцииКрепи[с]', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vshc', N'высота струга', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'W1', N'', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'W2', N'', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'W3', N'', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'width_pogr_pov', N'ШиринаПогрузочнойПоверхности[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'width_rej_kr_b', N'ШиринаРежКромокРезцов_1[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'width_rej_kr_b1', N'ШиринаРежКромокРезцов_2[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'x1', N'Коорд-тыТочекПриложДействующСил_8', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'x2', N'Коорд-тыТочекПриложДействующСил_9', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'x3', N'Коорд-тыТочекПриложДействующСил_10', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'xar_ug', N'ХарактеристикаУглей', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Xk', N'Конечное значение времени', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Xn', N'начальное значение времени', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'y1', N'Коорд-тыТочекПриложДействующСил_1', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'y3', N'Коорд-тыТочекПриложДействующСил_2', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'y7', N'Коорд-тыТочекПриложДействующСил_3', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'y8', N'Коорд-тыТочекПриложДействующСил_4', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'y9', N'Коорд-тыТочекПриложДействующСил_5', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'z2', N'Коорд-тыТочекПриложДействующСил_6', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'z3', N'Коорд-тыТочекПриложДействующСил_7', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'zad_napr', N'Значение задающего напряжения ', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'с(1)', NULL, N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'с(2)', N'приведенный коэф жескости обр ветви цепи', N'Su', N'System.Double')
/****** Object:  Table [dbo].[krep]    Script Date: 06/10/2009 22:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[krep](
	[PlowMachineId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[id_krep] [nvarchar](max) NULL,
	[tip_krep] [nvarchar](max) NULL,
	[vrem_raz] [nvarchar](max) NULL,
	[vrem_pod] [nvarchar](max) NULL,
	[shag_ust] [nvarchar](max) NULL,
	[vrem_peredv] [nvarchar](max) NULL,
	[vrem_perem] [nvarchar](max) NULL,
	[hod_gid] [nvarchar](max) NULL,
	[us_gdpsz_resh1] [nvarchar](max) NULL,
	[davl_rzhgl_psz1] [nvarchar](max) NULL,
 CONSTRAINT [PK_krep] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[krep] ([PlowMachineId], [id_krep], [tip_krep], [vrem_raz], [vrem_pod], [shag_ust], [vrem_peredv], [vrem_perem], [hod_gid], [us_gdpsz_resh1], [davl_rzhgl_psz1]) VALUES (N'7c51939d-f048-4ae8-8d9a-c1160ab471a0', NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>10</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>25</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>4.05</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>30</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>35</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.8</double>', NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>-8.66320887015503</double>')
/****** Object:  Table [dbo].[Konv]    Script Date: 06/10/2009 22:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Konv](
	[PlowMachineId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[id_konv] [nvarchar](max) NULL,
	[tip_kn] [nvarchar](max) NULL,
	[koef_kol] [nvarchar](max) NULL,
	[dlp_is_konv] [nvarchar](max) NULL,
	[dlz_is_konv] [nvarchar](max) NULL,
	[s_sech_konv] [nvarchar](max) NULL,
	[sko_konv_max] [nvarchar](max) NULL,
	[proiz_konv] [nvarchar](max) NULL,
	[ko_zap] [nvarchar](max) NULL,
	[v_konv] [nvarchar](max) NULL,
 CONSTRAINT [PK_Konv] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Konv] ([PlowMachineId], [id_konv], [tip_kn], [koef_kol], [dlp_is_konv], [dlz_is_konv], [s_sech_konv], [sko_konv_max], [proiz_konv], [ko_zap], [v_konv]) VALUES (N'7c51939d-f048-4ae8-8d9a-c1160ab471a0', NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>2.5</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>6.4</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>7.9000009536743</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.5</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.17</double>', NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', NULL)
/****** Object:  Table [dbo].[gruzchik]    Script Date: 06/10/2009 22:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gruzchik](
	[PlowMachineId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[id_gruz] [nvarchar](max) NULL,
	[ko_zapol] [nvarchar](max) NULL,
	[r_nij_osn_korp] [nvarchar](max) NULL,
	[r_verx_osn_korp] [nvarchar](max) NULL,
	[r_nij_lop] [nvarchar](max) NULL,
	[r_verh_lop] [nvarchar](max) NULL,
	[height_lop] [nvarchar](max) NULL,
	[length_sred_lop] [nvarchar](max) NULL,
	[length_konc_lop] [nvarchar](max) NULL,
	[arc_zaostr_konc_lop] [nvarchar](max) NULL,
	[arc_naklona_pogr] [nvarchar](max) NULL,
	[r_verh_osn_lop] [nvarchar](max) NULL,
	[height_skos] [nvarchar](max) NULL,
	[arc_chast1] [nvarchar](max) NULL,
	[teor_pr] [nvarchar](max) NULL,
	[sko_ug] [nvarchar](max) NULL,
	[teor_pr_pogr1] [nvarchar](max) NULL,
	[plow1] [nvarchar](max) NULL,
	[pogr_spos_kons1] [nvarchar](max) NULL,
	[pogr_spos_rej1] [nvarchar](max) NULL,
	[plow_sech] [nvarchar](max) NULL,
	[vis_pogr] [nvarchar](max) NULL,
	[Tmod4] [nvarchar](max) NULL,
 CONSTRAINT [PK_gruzchik] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[gruzchik] ([PlowMachineId], [id_gruz], [ko_zapol], [r_nij_osn_korp], [r_verx_osn_korp], [r_nij_lop], [r_verh_lop], [height_lop], [length_sred_lop], [length_konc_lop], [arc_zaostr_konc_lop], [arc_naklona_pogr], [r_verh_osn_lop], [height_skos], [arc_chast1], [teor_pr], [sko_ug], [teor_pr_pogr1], [plow1], [pogr_spos_kons1], [pogr_spos_rej1], [plow_sech], [vis_pogr], [Tmod4]) VALUES (N'7c51939d-f048-4ae8-8d9a-c1160ab471a0', NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>1.1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.245</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.182</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.455</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.31</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.25</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.045</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.145</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>60</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>30</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>200</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>384</double>', NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', NULL, NULL, NULL, NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>')
/****** Object:  Table [dbo].[ep]    Script Date: 06/10/2009 22:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ep](
	[PlowMachineId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[id_epriv] [nvarchar](max) NULL,
	[tip_privod] [nvarchar](max) NULL,
	[rad_priv_zv] [nvarchar](max) NULL,
	[per_ch_red] [nvarchar](max) NULL,
	[su_mosh_va1] [nvarchar](max) NULL,
	[vre_rev_pri] [nvarchar](max) NULL,
	[kof_vnskmeops] [nvarchar](max) NULL,
	[kof_vnskmevp] [nvarchar](max) NULL,
	[kpd_soedmuft] [nvarchar](max) NULL,
	[kpd_privreduk] [nvarchar](max) NULL,
	[kpd_privzvezd] [nvarchar](max) NULL,
	[sum_power_priv1] [nvarchar](max) NULL,
	[C1] [nvarchar](max) NULL,
	[C2] [nvarchar](max) NULL,
	[C3] [nvarchar](max) NULL,
	[C4] [nvarchar](max) NULL,
	[C5] [nvarchar](max) NULL,
	[C6] [nvarchar](max) NULL,
	[C7] [nvarchar](max) NULL,
	[C8] [nvarchar](max) NULL,
	[C9] [nvarchar](max) NULL,
	[C10] [nvarchar](max) NULL,
	[Mc] [nvarchar](max) NULL,
	[Tn1] [nvarchar](max) NULL,
	[Tn2] [nvarchar](max) NULL,
	[Kn1] [nvarchar](max) NULL,
	[Kn2] [nvarchar](max) NULL,
	[C17] [nvarchar](max) NULL,
	[C20] [nvarchar](max) NULL,
	[L1] [nvarchar](max) NULL,
	[L2] [nvarchar](max) NULL,
	[Rz1] [nvarchar](max) NULL,
	[Rz2] [nvarchar](max) NULL,
	[I1] [nvarchar](max) NULL,
	[I2] [nvarchar](max) NULL,
	[Ic] [nvarchar](max) NULL,
	[C12] [nvarchar](max) NULL,
	[C13] [nvarchar](max) NULL,
	[C14] [nvarchar](max) NULL,
	[Kd1] [nvarchar](max) NULL,
	[Kd3] [nvarchar](max) NULL,
	[Trt] [nvarchar](max) NULL,
	[Tz] [nvarchar](max) NULL,
	[Uzc] [nvarchar](max) NULL,
	[Koc] [nvarchar](max) NULL,
	[Kpc] [nvarchar](max) NULL,
	[Xn] [nvarchar](max) NULL,
	[Xk] [nvarchar](max) NULL,
	[dp] [nvarchar](max) NULL,
	[n] [nvarchar](max) NULL,
	[eps] [nvarchar](max) NULL,
	[p] [nvarchar](max) NULL,
	[T] [nvarchar](max) NULL,
	[En1] [nvarchar](max) NULL,
	[En2] [nvarchar](max) NULL,
	[Iz1] [nvarchar](max) NULL,
	[Iz2] [nvarchar](max) NULL,
	[W1] [nvarchar](max) NULL,
	[W2] [nvarchar](max) NULL,
	[W3] [nvarchar](max) NULL,
	[My1] [nvarchar](max) NULL,
	[My3] [nvarchar](max) NULL,
	[Uy1] [nvarchar](max) NULL,
	[mom_in_val_dvig_1priv] [nvarchar](max) NULL,
	[mom_in_val_dvig_2priv] [nvarchar](max) NULL,
	[mom_in_strug] [nvarchar](max) NULL,
	[koef_zhestk_rab_vetv] [nvarchar](max) NULL,
	[koef_zhestk_obr_vetv] [nvarchar](max) NULL,
	[koef_otn_moschn_id_vipr] [nvarchar](max) NULL,
	[koef_zapas_napr] [nvarchar](max) NULL,
	[kof_otn_tok_id_vipr] [nvarchar](max) NULL,
	[kof_otn_napr_id_vipr] [nvarchar](max) NULL,
	[chisl_faz_vipr] [nvarchar](max) NULL,
	[post_vremen_tir_preobr] [nvarchar](max) NULL,
	[max_priv_ugl_skor_strug] [nvarchar](max) NULL,
	[nom_tok_reakt] [nvarchar](max) NULL,
	[max_napr_vhod_sifu] [nvarchar](max) NULL,
	[nom_tok_shunt] [nvarchar](max) NULL,
	[paden_napr_nom_tok_shunt] [nvarchar](max) NULL,
	[napr_zamk_kont_tok] [nvarchar](max) NULL,
	[emkost_cep_obr_svyaz_tok] [nvarchar](max) NULL,
	[sopr_cep_obr_svyaz] [nvarchar](max) NULL,
	[koef_zapas_tok] [nvarchar](max) NULL,
	[chisl_paral_vent] [nvarchar](max) NULL,
	[koef_otn_max_obr_napr_eds] [nvarchar](max) NULL,
	[koef_kompens_obm] [nvarchar](max) NULL,
	[nom_ugl_skor_dvig] [nvarchar](max) NULL,
	[zad_napr] [nvarchar](max) NULL,
	[krug_chast_pit_set] [nvarchar](max) NULL,
	[koef_izmen_sopr_peregrev] [nvarchar](max) NULL,
	[sootn_mom_inerc_strug_priv] [nvarchar](max) NULL,
	[aktiv_sopr_sglaz_dros_poter_obmot] [nvarchar](max) NULL,
	[ekvivalent_sopr_preobr] [nvarchar](max) NULL,
	[eds_preobr_nom_tok_nagr] [nvarchar](max) NULL,
	[sred_znach_tok_ventil_max_tok_nagr] [nvarchar](max) NULL,
	[max_obr_napr_ventil] [nvarchar](max) NULL,
	[induk_cep_viprelen_tok_nepreriv_tok_dvigatel] [nvarchar](max) NULL,
	[Indukt_yakor_cep_dvigat] [nvarchar](max) NULL,
	[indukt_sglazh_drosel] [nvarchar](max) NULL,
	[aktiv_sopr_sglazh_drosel] [nvarchar](max) NULL,
	[aktiv_sopr_yakor_cep_drosel] [nvarchar](max) NULL,
	[ekvivalent_sopr_cep_preobr] [nvarchar](max) NULL,
	[aktiv_sopr_cep_vipremlen_tok] [nvarchar](max) NULL,
	[indukt_cep_vipremlen_tok] [nvarchar](max) NULL,
	[elmag_post_vrem_cep_vipreml_tok] [nvarchar](max) NULL,
	[elmeh_post_vremen_privod] [nvarchar](max) NULL,
	[nach_znach_eds_preobr] [nvarchar](max) NULL,
	[koef_usilen_tiris_preobr] [nvarchar](max) NULL,
	[koef_pered_zven_tok_yakor] [nvarchar](max) NULL,
	[koef_pered_zven_skor] [nvarchar](max) NULL,
	[koef_pered_shunt] [nvarchar](max) NULL,
	[post_vremen_shunt] [nvarchar](max) NULL,
	[post_vremen_koleb_mass_vspomog_priv] [nvarchar](max) NULL,
	[post_vremen_koleb_mass_strug] [nvarchar](max) NULL,
	[koef_pered_zamkn_kont_toka] [nvarchar](max) NULL,
	[post_vremen_kont_toka] [nvarchar](max) NULL,
	[koef_obr_svyaz_tok] [nvarchar](max) NULL,
	[koef_usilen_datch_tok] [nvarchar](max) NULL,
	[koef_usilen_regul_tok] [nvarchar](max) NULL,
	[post_vremen_regul_tok] [nvarchar](max) NULL,
	[sopr_reist_obt_svyaz_tok] [nvarchar](max) NULL,
	[sopr_rezist_cep_datch_tok] [nvarchar](max) NULL,
	[sopr_rezist_vhod_regul_tok] [nvarchar](max) NULL,
	[koef_korekt_svyaz_proizvod_deform_rab_vetv] [nvarchar](max) NULL,
	[koef_korekt_svyaz_proizvod_deform_obr_vetv] [nvarchar](max) NULL,
	[koef_obr_svyaz_skor_ispoln_organ] [nvarchar](max) NULL,
	[koef_usilen_regul_skor] [nvarchar](max) NULL,
	[sopr_kont_regul_skor_vhod_regul_toka] [nvarchar](max) NULL,
	[sopr_kont_regul_skor_datch_skor] [nvarchar](max) NULL,
	[koef_pered_isp] [nvarchar](max) NULL,
	[c111] [nvarchar](max) NULL,
	[c33] [nvarchar](max) NULL,
	[kpd_soe_mu] [nvarchar](max) NULL,
	[kpd_pri_re] [nvarchar](max) NULL,
	[kpd_pri_zv] [nvarchar](max) NULL,
 CONSTRAINT [PK_ep] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ep] ([PlowMachineId], [id_epriv], [tip_privod], [rad_priv_zv], [per_ch_red], [su_mosh_va1], [vre_rev_pri], [kof_vnskmeops], [kof_vnskmevp], [kpd_soedmuft], [kpd_privreduk], [kpd_privzvezd], [sum_power_priv1], [C1], [C2], [C3], [C4], [C5], [C6], [C7], [C8], [C9], [C10], [Mc], [Tn1], [Tn2], [Kn1], [Kn2], [C17], [C20], [L1], [L2], [Rz1], [Rz2], [I1], [I2], [Ic], [C12], [C13], [C14], [Kd1], [Kd3], [Trt], [Tz], [Uzc], [Koc], [Kpc], [Xn], [Xk], [dp], [n], [eps], [p], [T], [En1], [En2], [Iz1], [Iz2], [W1], [W2], [W3], [My1], [My3], [Uy1], [mom_in_val_dvig_1priv], [mom_in_val_dvig_2priv], [mom_in_strug], [koef_zhestk_rab_vetv], [koef_zhestk_obr_vetv], [koef_otn_moschn_id_vipr], [koef_zapas_napr], [kof_otn_tok_id_vipr], [kof_otn_napr_id_vipr], [chisl_faz_vipr], [post_vremen_tir_preobr], [max_priv_ugl_skor_strug], [nom_tok_reakt], [max_napr_vhod_sifu], [nom_tok_shunt], [paden_napr_nom_tok_shunt], [napr_zamk_kont_tok], [emkost_cep_obr_svyaz_tok], [sopr_cep_obr_svyaz], [koef_zapas_tok], [chisl_paral_vent], [koef_otn_max_obr_napr_eds], [koef_kompens_obm], [nom_ugl_skor_dvig], [zad_napr], [krug_chast_pit_set], [koef_izmen_sopr_peregrev], [sootn_mom_inerc_strug_priv], [aktiv_sopr_sglaz_dros_poter_obmot], [ekvivalent_sopr_preobr], [eds_preobr_nom_tok_nagr], [sred_znach_tok_ventil_max_tok_nagr], [max_obr_napr_ventil], [induk_cep_viprelen_tok_nepreriv_tok_dvigatel], [Indukt_yakor_cep_dvigat], [indukt_sglazh_drosel], [aktiv_sopr_sglazh_drosel], [aktiv_sopr_yakor_cep_drosel], [ekvivalent_sopr_cep_preobr], [aktiv_sopr_cep_vipremlen_tok], [indukt_cep_vipremlen_tok], [elmag_post_vrem_cep_vipreml_tok], [elmeh_post_vremen_privod], [nach_znach_eds_preobr], [koef_usilen_tiris_preobr], [koef_pered_zven_tok_yakor], [koef_pered_zven_skor], [koef_pered_shunt], [post_vremen_shunt], [post_vremen_koleb_mass_vspomog_priv], [post_vremen_koleb_mass_strug], [koef_pered_zamkn_kont_toka], [post_vremen_kont_toka], [koef_obr_svyaz_tok], [koef_usilen_datch_tok], [koef_usilen_regul_tok], [post_vremen_regul_tok], [sopr_reist_obt_svyaz_tok], [sopr_rezist_cep_datch_tok], [sopr_rezist_vhod_regul_tok], [koef_korekt_svyaz_proizvod_deform_rab_vetv], [koef_korekt_svyaz_proizvod_deform_obr_vetv], [koef_obr_svyaz_skor_ispoln_organ], [koef_usilen_regul_skor], [sopr_kont_regul_skor_vhod_regul_toka], [sopr_kont_regul_skor_datch_skor], [koef_pered_isp], [c111], [c33], [kpd_soe_mu], [kpd_pri_re], [kpd_pri_zv]) VALUES (N'7c51939d-f048-4ae8-8d9a-c1160ab471a0', NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>0.175</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>32.8</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>-5984.5905666377821</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>5</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.231</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.077</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.96</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.9</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.91</double>', NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>440</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>400</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.01</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.01</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>54.15</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>54.15</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>10</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>10</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.010856</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.010856</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.1721</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.1721</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>3.824</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>3.824</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.316</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.725</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.01464</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0612</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0631</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>2.8</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0678</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>8</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.005</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>14</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>3.824</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>3.824</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.316</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>71.39</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>35.7</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.05</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.2</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.427</double>', NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>0.01</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>132.6</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>250</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>10</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>500</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.75</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>9</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1E-05</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>500</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.05</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.6</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>125.6</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>9</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>314</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.24</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.0826</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0061</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0719</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>450.0664</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>140</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>567.8855</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0115</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0111</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0016</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0802</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0919</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.1721</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0115</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0666</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0565</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>580.8</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>58.08</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>5.8095</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0504</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0148</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0047</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.3273</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0665</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>46.6667</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.02</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0214</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>14.2857</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.1446</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>6660.5991</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>14460.7316</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>14460.7316</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.7216</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.1467</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0679</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.3396</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>373.2399</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>373.2399</double>', NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>71.39</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>35.7</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.96</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.9</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.91</double>')
/****** Object:  Table [dbo].[ed]    Script Date: 06/10/2009 22:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ed](
	[PlowMachineId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[id_ed] [nvarchar](max) NULL,
	[tip_ed] [nvarchar](max) NULL,
	[nom_rot] [nvarchar](max) NULL,
	[C11] [nvarchar](max) NULL,
	[Cd1] [nvarchar](max) NULL,
	[Cd2] [nvarchar](max) NULL,
	[nom_moschn] [nvarchar](max) NULL,
	[nom_tok] [nvarchar](max) NULL,
	[nom_napr] [nvarchar](max) NULL,
	[nom_skor] [nvarchar](max) NULL,
	[sopr_yakor_cep] [nvarchar](max) NULL,
	[sopr_dop_polus] [nvarchar](max) NULL,
	[chislo_par_polus] [nvarchar](max) NULL,
	[max_tok_nagr] [nvarchar](max) NULL,
	[min_tok_nagr] [nvarchar](max) NULL,
	[eds_dvig] [nvarchar](max) NULL,
 CONSTRAINT [PK_ed] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ed] ([PlowMachineId], [id_ed], [tip_ed], [nom_rot], [C11], [Cd1], [Cd2], [nom_moschn], [nom_tok], [nom_napr], [nom_skor], [sopr_yakor_cep], [sopr_dop_polus], [chislo_par_polus], [max_tok_nagr], [min_tok_nagr], [eds_dvig]) VALUES (N'7c51939d-f048-4ae8-8d9a-c1160ab471a0', NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>1475</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>3.42</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>3.42</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>56000</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>140</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>440</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1200</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.0487</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.016</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>2</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>420</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>14</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>3.4138</double>')
/****** Object:  Table [dbo].[cep]    Script Date: 06/10/2009 22:28:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cep](
	[PlowMachineId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[id_cep] [nvarchar](max) NULL,
	[tip_tsep] [nvarchar](max) NULL,
	[sko_dv] [nvarchar](max) NULL,
	[us_pro] [nvarchar](max) NULL,
	[a81] [nvarchar](max) NULL,
	[koef_nerav1] [nvarchar](max) NULL,
	[sr_tyag1] [nvarchar](max) NULL,
	[rez_ko_var1] [nvarchar](max) NULL,
	[srvzznam] [nvarchar](max) NULL,
	[kof_vlzhstrc] [nvarchar](max) NULL,
	[kof_vlmasstr] [nvarchar](max) NULL,
	[kof_zrsrsmces] [nvarchar](max) NULL,
	[sila_prstrcep] [nvarchar](max) NULL,
 CONSTRAINT [PK_cep] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cep] ([PlowMachineId], [id_cep], [tip_tsep], [sko_dv], [us_pro], [a81], [koef_nerav1], [sr_tyag1], [rez_ko_var1], [srvzznam], [kof_vlzhstrc], [kof_vlmasstr], [kof_zrsrsmces], [sila_prstrcep]) VALUES (N'7c51939d-f048-4ae8-8d9a-c1160ab471a0', NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>0.65</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>22.52</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>33</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.41</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>-166.80412708580039</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>24.068471299353266</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>31</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.98</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>0.95</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1.146</double>', NULL)
/****** Object:  Default [DF_PlowMachines_PlowMachineId]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[PlowMachines] ADD  CONSTRAINT [DF_PlowMachines_PlowMachineId]  DEFAULT (newid()) FOR [PlowMachineId]
GO
/****** Object:  Default [DF_PlowMachines_IsPrototype]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[PlowMachines] ADD  CONSTRAINT [DF_PlowMachines_IsPrototype]  DEFAULT ((0)) FOR [IsPrototype]
GO
/****** Object:  Default [DF_zb_drlp]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[zb] ADD  CONSTRAINT [DF_zb_drlp]  DEFAULT ('<?xml version="1.0" encoding="utf-16"?>  <double>0.03</double>') FOR [drlp]
GO
/****** Object:  Default [DF_zb_srsp]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[zb] ADD  CONSTRAINT [DF_zb_srsp]  DEFAULT ('<?xml version="1.0" encoding="utf-16"?>  <double>0.01</double>') FOR [srsp]
GO
/****** Object:  Default [DF_Su_lysu]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[Su] ADD  CONSTRAINT [DF_Su_lysu]  DEFAULT ('<?xml version="1.0" encoding="utf-16"?>  <double>0.5</double>') FOR [lysu]
GO
/****** Object:  Default [DF_Su_hysu]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[Su] ADD  CONSTRAINT [DF_Su_hysu]  DEFAULT ('<?xml version="1.0" encoding="utf-16"?>  <double>0.05</double>') FOR [hysu]
GO
/****** Object:  Default [DF_sg_tpslt]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[sg] ADD  CONSTRAINT [DF_sg_tpslt]  DEFAULT ('<?xml version="1.0" encoding="utf-16"?>  <double>0.02</double>') FOR [tpslt]
GO
/****** Object:  Default [DF_sg_dslc]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[sg] ADD  CONSTRAINT [DF_sg_dslc]  DEFAULT ('<?xml version="1.0" encoding="utf-16"?>  <double>0.2</double>') FOR [dslc]
GO
/****** Object:  Default [DF_sg_vshc]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[sg] ADD  CONSTRAINT [DF_sg_vshc]  DEFAULT ('<?xml version="1.0" encoding="utf-16"?>  <double>0.1</double>') FOR [vshc]
GO
/****** Object:  ForeignKey [FK_PlowMachines_PlowMachines]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[PlowMachines]  WITH CHECK ADD  CONSTRAINT [FK_PlowMachines_PlowMachines] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
GO
ALTER TABLE [dbo].[PlowMachines] CHECK CONSTRAINT [FK_PlowMachines_PlowMachines]
GO
/****** Object:  ForeignKey [FK_zb_PlowMachine]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[zb]  WITH CHECK ADD  CONSTRAINT [FK_zb_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[zb] CHECK CONSTRAINT [FK_zb_PlowMachine]
GO
/****** Object:  ForeignKey [FK_transf_PlowMachine]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[transf]  WITH CHECK ADD  CONSTRAINT [FK_transf_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[transf] CHECK CONSTRAINT [FK_transf_PlowMachine]
GO
/****** Object:  ForeignKey [FK_Su_PlowMachine]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[Su]  WITH CHECK ADD  CONSTRAINT [FK_Su_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Su] CHECK CONSTRAINT [FK_Su_PlowMachine]
GO
/****** Object:  ForeignKey [FK_sg_PlowMachine]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[sg]  WITH CHECK ADD  CONSTRAINT [FK_sg_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sg] CHECK CONSTRAINT [FK_sg_PlowMachine]
GO
/****** Object:  ForeignKey [FK_PlowMachineBase_PlowMachines]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[PlowMachineBase]  WITH CHECK ADD  CONSTRAINT [FK_PlowMachineBase_PlowMachines] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlowMachineBase] CHECK CONSTRAINT [FK_PlowMachineBase_PlowMachines]
GO
/****** Object:  ForeignKey [FK_MetadataFields_MetadataModules]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[MetadataFields]  WITH CHECK ADD  CONSTRAINT [FK_MetadataFields_MetadataModules] FOREIGN KEY([ModuleName])
REFERENCES [dbo].[MetadataModules] ([ModuleName])
GO
ALTER TABLE [dbo].[MetadataFields] CHECK CONSTRAINT [FK_MetadataFields_MetadataModules]
GO
/****** Object:  ForeignKey [FK_krep_PlowMachine]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[krep]  WITH CHECK ADD  CONSTRAINT [FK_krep_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[krep] CHECK CONSTRAINT [FK_krep_PlowMachine]
GO
/****** Object:  ForeignKey [FK_Konv_PlowMachine]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[Konv]  WITH CHECK ADD  CONSTRAINT [FK_Konv_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Konv] CHECK CONSTRAINT [FK_Konv_PlowMachine]
GO
/****** Object:  ForeignKey [FK_gruzchik_PlowMachine]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[gruzchik]  WITH CHECK ADD  CONSTRAINT [FK_gruzchik_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[gruzchik] CHECK CONSTRAINT [FK_gruzchik_PlowMachine]
GO
/****** Object:  ForeignKey [FK_ep_PlowMachine]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[ep]  WITH CHECK ADD  CONSTRAINT [FK_ep_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ep] CHECK CONSTRAINT [FK_ep_PlowMachine]
GO
/****** Object:  ForeignKey [FK_ed_PlowMachine]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[ed]  WITH CHECK ADD  CONSTRAINT [FK_ed_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ed] CHECK CONSTRAINT [FK_ed_PlowMachine]
GO
/****** Object:  ForeignKey [FK_cep_PlowMachine]    Script Date: 06/10/2009 22:28:01 ******/
ALTER TABLE [dbo].[cep]  WITH CHECK ADD  CONSTRAINT [FK_cep_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cep] CHECK CONSTRAINT [FK_cep_PlowMachine]
GO
