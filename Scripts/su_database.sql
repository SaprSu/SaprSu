USE [master]
GO
/****** Object:  Database [ASPM2003_SU_Database]    Script Date: 01/12/2009 11:59:56 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'ASPM2003_SU_Database')
BEGIN
CREATE DATABASE [ASPM2003_SU_Database] ON  PRIMARY 
( NAME = N'ASPM2003_SU_Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\ASPM2003_SU_Database.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ASPM2003_SU_Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\ASPM2003_SU_Database_log.LDF' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
END
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'ASPM2003_SU_Database', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASPM2003_SU_Database].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [ASPM2003_SU_Database] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET ARITHABORT OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ASPM2003_SU_Database] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ASPM2003_SU_Database] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ASPM2003_SU_Database] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET  DISABLE_BROKER
GO
ALTER DATABASE [ASPM2003_SU_Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ASPM2003_SU_Database] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ASPM2003_SU_Database] SET  READ_WRITE
GO
ALTER DATABASE [ASPM2003_SU_Database] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ASPM2003_SU_Database] SET  MULTI_USER
GO
ALTER DATABASE [ASPM2003_SU_Database] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ASPM2003_SU_Database] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASPM2003_SU_Database', N'ON'
GO
USE [ASPM2003_SU_Database]
GO
/****** Object:  Table [dbo].[PlowMachines]    Script Date: 01/12/2009 12:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlowMachines]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PlowMachines', N'COLUMN',N'PlowMachineId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Идентификатор' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlowMachines', @level2type=N'COLUMN',@level2name=N'PlowMachineId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PlowMachines', N'COLUMN',N'Name'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Название' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlowMachines', @level2type=N'COLUMN',@level2name=N'Name'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PlowMachines', N'COLUMN',N'IsPrototype'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Является прототипом' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlowMachines', @level2type=N'COLUMN',@level2name=N'IsPrototype'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PlowMachines', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Стуговые установки' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlowMachines'
GO
INSERT [dbo].[PlowMachines] ([PlowMachineId], [Name], [IsPrototype], [CreatedOn], [ModifidedOn]) VALUES (N'f809912d-4afb-4cb1-9265-05eeb633424b', N'', 0, CAST(0x00009B7C00C34BBD AS DateTime), CAST(0x00009B7C00C34BBD AS DateTime))
INSERT [dbo].[PlowMachines] ([PlowMachineId], [Name], [IsPrototype], [CreatedOn], [ModifidedOn]) VALUES (N'c959ca88-44a4-4762-91d2-86eaeca91901', N'Test', 0, CAST(0x00009B7C00C4947D AS DateTime), CAST(0x00009B800139659A AS DateTime))
INSERT [dbo].[PlowMachines] ([PlowMachineId], [Name], [IsPrototype], [CreatedOn], [ModifidedOn]) VALUES (N'dab3fd2b-7704-43e8-badc-bf2c1b4c93a7', N'qqqqq', 0, CAST(0x00009B7501599729 AS DateTime), CAST(0x00009B7801808DEC AS DateTime))
INSERT [dbo].[PlowMachines] ([PlowMachineId], [Name], [IsPrototype], [CreatedOn], [ModifidedOn]) VALUES (N'98c11471-b2ed-4c8b-90de-f97f3d7337ca', N'Test2', 0, CAST(0x00009B800139B62B AS DateTime), CAST(0x00009B800139B62B AS DateTime))
/****** Object:  Table [dbo].[PlowMachineBase]    Script Date: 01/12/2009 12:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlowMachineBase]') AND type in (N'U'))
BEGIN
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
END
GO
INSERT [dbo].[PlowMachineBase] ([PlowMachineId], [marka_strug], [tip_su], [min_proizv], [max_proizv], [sum_moj_dvig], [min_skor], [max_skor], [min_tolj], [max_tolj], [min_moj_plast], [max_moj_plast], [sopr_urez]) VALUES (N'f809912d-4afb-4cb1-9265-05eeb633424b', N'<?xml version="1.0" encoding="utf-16"?>
<string>`</string>', NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>3</double>', NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>4</double>', NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>2</double>', NULL)
INSERT [dbo].[PlowMachineBase] ([PlowMachineId], [marka_strug], [tip_su], [min_proizv], [max_proizv], [sum_moj_dvig], [min_skor], [max_skor], [min_tolj], [max_tolj], [min_moj_plast], [max_moj_plast], [sopr_urez]) VALUES (N'c959ca88-44a4-4762-91d2-86eaeca91901', N'<?xml version="1.0" encoding="utf-16"?>
<string>1</string>', NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', NULL, NULL, NULL, NULL, NULL, N'<?xml version="1.0" encoding="utf-16"?>
<double>24</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>132</double>')
INSERT [dbo].[PlowMachineBase] ([PlowMachineId], [marka_strug], [tip_su], [min_proizv], [max_proizv], [sum_moj_dvig], [min_skor], [max_skor], [min_tolj], [max_tolj], [min_moj_plast], [max_moj_plast], [sopr_urez]) VALUES (N'dab3fd2b-7704-43e8-badc-bf2c1b4c93a7', N'<?xml version="1.0" encoding="utf-16"?>
<string>1</string>', N'<?xml version="1.0" encoding="utf-16"?>
<int>300</int>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<string>133</string>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>5</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>')
INSERT [dbo].[PlowMachineBase] ([PlowMachineId], [marka_strug], [tip_su], [min_proizv], [max_proizv], [sum_moj_dvig], [min_skor], [max_skor], [min_tolj], [max_tolj], [min_moj_plast], [max_moj_plast], [sopr_urez]) VALUES (N'98c11471-b2ed-4c8b-90de-f97f3d7337ca', N'<?xml version="1.0" encoding="utf-16"?>
<string>1</string>', N'<?xml version="1.0" encoding="utf-16"?>
<int>1</int>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<string>1</string>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>', N'<?xml version="1.0" encoding="utf-16"?>
<double>1</double>')
/****** Object:  Table [dbo].[MetadataModules]    Script Date: 01/12/2009 12:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MetadataModules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MetadataModules](
	[ModuleName] [varchar](254) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_MetadataModules_1] PRIMARY KEY CLUSTERED 
(
	[ModuleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MetadataModules', N'COLUMN',N'ModuleName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Название SQL таблицы' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MetadataModules', @level2type=N'COLUMN',@level2name=N'ModuleName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MetadataModules', N'COLUMN',N'Description'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Краткое описание функций модуля' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MetadataModules', @level2type=N'COLUMN',@level2name=N'Description'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MetadataModules', NULL,NULL))
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
/****** Object:  Table [dbo].[zb]    Script Date: 01/12/2009 12:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[zb]') AND type in (N'U'))
BEGIN
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
 CONSTRAINT [PK_zb] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[transf]    Script Date: 01/12/2009 12:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[transf]') AND type in (N'U'))
BEGIN
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
 CONSTRAINT [PK_transf] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Su]    Script Date: 01/12/2009 12:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Su]') AND type in (N'U'))
BEGIN
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
 CONSTRAINT [PK_Su] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sg]    Script Date: 01/12/2009 12:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sg]') AND type in (N'U'))
BEGIN
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
 CONSTRAINT [PK_sg] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MetadataFields]    Script Date: 01/12/2009 12:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MetadataFields]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MetadataFields', N'COLUMN',N'FieldName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Название поля' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MetadataFields', @level2type=N'COLUMN',@level2name=N'FieldName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MetadataFields', N'COLUMN',N'Description'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Описание значений поля' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MetadataFields', @level2type=N'COLUMN',@level2name=N'Description'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MetadataFields', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Поля модуля' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MetadataFields'
GO
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'a0_pol', NULL, N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'a1_pol', NULL, N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'a2_pol', NULL, N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'a4', N'УголПриПересеченииПоверхЗабояИПоверхСтруга[град]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'a81', N'СредневзвешЗначАмплиСоставлУсилийЗаПроходПоЛав[кН]', N'cep', N'System.Double')
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
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C1', N'En1 ЭДС тиристорного преобразователя', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C10', N'фи1 Wс=приведённая к валу двигателя угл.скор', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C11', N'электромагнитный  момент двигателя основного', N'ed', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C12', N'электромагнитный момент двигателя вспомогательного', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C13', N'приведённый упругий момент рабочей ветви', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C14', N'приведённый упругий момент рабочей ветви', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C17', N'напряжение управления тиристорным преобр', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C2', N'En2 ЭДС тиристорного преобразователя', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C20', N'напряжение управления тиристорным преобр', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C3', N'фи1 угловая координата перемещения привода', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C4', N'фи2 угловая координата перемещения привода', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C5', N'фи с угловая координата перемещения привода', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C6', N'Iz1 ток якорной цепи 1,А', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C7', N'Iz2 ток якорной цепи 1,А', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C8', N'фи1 W1=приведённая к валу двигателя угл.скор', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'C9', N'фи1 W2=приведённая к валу двигателя угл.скор', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Cd1', N'коэф ЭДС электродвигателя', N'ed', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Cd2', N'коэф ЭДС электродвигателя', N'ed', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'cikl_pro', N'ПроизводительностьЦикла[т/ч]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'd2_1', N'КоордТочекОтжимСил[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'd3_1', N'КоордТочекОтжимСил[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'd4', N'КоордТочекПриложСилРез_1[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'd5', N'КоордТочекПриложСилРез_2[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'd6', N'КоордТочекПриложСилРез_3[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'd7', N'КоордТочекПриложСилРез_4[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'davl_rzhgl_psz1', N'ДавлениеРабочейЖидкости1', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'depth_rez1', N'ГлубинаРезания_1[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'diam_pgd', N'диаметр поршня гидравлического домкрата, см', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'diam_to', N'диаметр трубчатой опоры,м', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'dl_la', N'ДлинаЛавы[м]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'dlin_su', N'ДлинаСтруговойУстановки[м]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'dlp_is_konv', N'Длина переднего отрезка линии изгиба конвейера', N'Konv', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'dlz_is_konv', N'ДлинЗаднего отрезка линии изгиба конвейера', N'Konv', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'dp', N'шаг приращения времени', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'En1', N'En1 ЭДС тиристорного преобразователя', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'En2', N'En2 ЭДС тиристорного преобразователя', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'eps', N'заданная точность вычислений', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ex_pr1', N'ЭксплуатационнаяПроизводительность_1[т/ч]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'excess_rez_nad_str', N'ПревышРезцаНадСтругом[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'faz_napr_vtor', N'НоминалФазнНапряжениеВторОбмоткиТрансформатора[В]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'g_resh', N'СилаТяжОдногоСУглемРештака[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'h_smax', N'max высота струга,м', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'h_smin', N'min высота струга, м', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'height_lop', N'ВысотаЛопастиГрузчика[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'height_pogruz', N'ВысотаПогрузки[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'height_skos', N'ВысотаСкосаЛопастиГруз[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'hod_gid', N'ХодГидродомкрата[м]', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'I1', N'приведённый к угловой скорости вала прив и стр', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'i1n', N'НоминальныйТокПервичОбмоткиТрансф[Ом]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'I2', N'приведённый к угловой скорости вала двигателя прив', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'i2n', N'НоминальноеЗначениеТокаВторичОбмоткиТрансф[А]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Ic', N'приведённый к угловой скорости вала двигателя стр', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_cep', NULL, N'cep', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_ed', NULL, N'ed', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_epriv', NULL, N'ep', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_gruz', NULL, N'gruzchik', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_konv', NULL, N'Konv', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_krep', NULL, N'krep', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_sg', NULL, N'sg', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_transf', NULL, N'transf', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'id_zaboy', NULL, N'zb', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ind_f', N'ИндуктивностьФазыТрансформатора[Гн]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Iz1', N'ток якорной цепи 1,А', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Iz2', N'ток якорной цепи 1,А', N'ep', N'System.String')
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
GO
print 'Processed 100 total records'
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'k9', N'Коэффициент', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Kd1', N'', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Kd3', N'', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Kn1', N'Коэффициент усилия тиристорного преобразователя', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Kn2', N'Коэффициент усилия тиристорного преобразователя', N'ep', N'System.String')
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
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Koc', N'', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_h_str', N'коэф.высоты струга', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_kol', N'КоэфУчитывающКол-воРештаков', N'Konv', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_nepr_ex1', N'КоэфНепрерывностиРаботыПриЭксплуатации_1', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_nepr1', N'КоэфТехническиВозможнойНепрерывностиРаботы_1', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_nerav1', N'КоэфВлиянияНеравн-тиСилыРезанияНаНеравнТягУсилия1', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_tr', NULL, N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_var_otj_y4', N'КоэфВариацииОтжимСил_1', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_var_otj_y5', N'КоэфВариацииОтжимСил_2', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_var_z4', N'КоэфВариацииРавнодСил_1', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'koef_var_z5', N'КоэфВариацииРавнодСил_2', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kof_vl_dlstust', N'коэффициент влияния длины струговой установки', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kof_vlmasstr', N'коэффициент влияния массы струга', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kof_vlzhstrc', N'Коэффициент влияния жесткости струговой цепи', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kof_vnskmeops', N'КоэфВарНизкочСоставлКрутМомЭлектродвОснПривСтруга', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kof_vnskmevp', N'КоэфВарНизкочСоставлКрутМомЭлектродвВспоПривСтруга', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kof_zrsrsmces', N'КоэфХаракНаибЗначРезСилРезВМомСколаСтружки', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kol_smen1', N'КоличествоЦикловВСмену_1[ц/см]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kol_sut_21', N'Кол-воЦикловВСуткиПриДвухсменнойРаботе_1[ц/сут.2]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kol_sut_31', N'Кол-воЦикловВСуткиПриТрехсменнойРаботе_1[ц/сут.3]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'komp_one_two', NULL, N'Su', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Kpc', NULL, N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kpd_privreduk', N'КПД ПриводныхРедукторов', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kpd_privzvezd', N'КПД ПриводныхЗвездочек', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kpd_soedmuft', N'КПД СоединительныхМуфт', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ktpsr_y', N'коорд т-ки приложения силы резания по оси y'''',м', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kvnersrs_ntuc', N'КоэфВлНеравнСилыРезанияНаСтругеНаНеравнТягУсилЦепи', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kvrsr_oissurdl', N'КоэфВарРезСилыРезОбуслИзмСрСопрУгляРезДлЛавы', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'kvssds_ugd', N'КоэфВлСрСкорДвижСтругаНаУсилиеГидравлДомкратом1Уч', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'L1', N'индуктивность цепи выпрямленного тока, Гн', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'l1_1', N'КоордТочекОтжимСил[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'L2', N'индуктивность цепи выпрямленного тока, Гн', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'l2_1', N'КоордТочекОтжимСил[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'l4', N'КоордТочекПриложСилРез_5[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'l5', N'КоордТочекПриложСилРез_6[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'l6', N'КоордТочекПриложСилРез_7[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'l7', N'КоордТочекПриложСилРез_8[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'length_konc_lop', N'ДлинаКонцевЧастиЛопастиГруз[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'length_sred_lop', N'ДлинаСредЧастиЛопастиГруз[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'lin_napr', N'ЛинНапряжениеВторичОбмотки[В]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'marka_strug', N'марка струга', N'PlowMachineBase', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_depth_rez', N'макс. Толщина среза,м', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_moj_plast', N'Максимальная мощность пласта', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_mopl', N'Max_МощностьПласта[м]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_proizv', N'Максимальная производительность', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_skor', N'Максимальная скорость движения струга', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'max_tolj', N'Максимальная толщина стружки', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Mc', N'Mc приведённый к валу двигателя момент сопрот', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'min_moj_plast', N'Минимальная мощность пласта', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'min_mopl', N'мощность пласта минимальная, м', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'min_proizv', N'Минимальная производительность', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'min_skor', N'Минимальная скорость движения струга', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'min_tolj', N'Минимальная толщина стружки', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'mo_hh', N'МощностьХолостогоХода[Вт]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'mo_ugpl_1', N'Мощность угольного пласта(средн) м', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'My1', N'приведённый упругий момент рабочей ветви', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'My3', N'приведённый упругий момент обратной ветви', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'n', N'число уравнений системы дифференциальных уравнений', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'name_z', NULL, N'zb', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_lin_napr', N'НоминалЛинейнНапряжВторичОбмотки[В]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_mo', N'НоминМощностьТрансформата[кВ*А]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'nom_rot', N'НоминалЧастотаВращенияРотора[1/мин]', N'ed', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'number_regim', NULL, N'Su', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ob_stug', N'ОбъемШтабеляУгляНаЛопастнПогрузУст-веСтруга[куб.м]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'obw_bok_sil_rez_1', N'РавнодейстБокСилРезан_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'obw_otj_sil_rez_1', N'РавнодейстОтжимСилРез_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'obw_sil_rez_1', N'РавнодействующСилРезан_1[кН]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'p', N'текущее значение времени', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'pad_kz', N'ПадениеНапряженияВРежиме к.з.[%]', N'transf', N'System.Double')
GO
print 'Processed 200 total records'
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'per_ch_red', N'ПередаточноеЧислоРедуктора', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'pl_ug', N'Плотность угля, т/м^3', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'plow_sech', N'ПлощадьСеченияЛопастиГрузчика[кв.м.]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'plow1', N'ПлощадьСеченияПотокаУгля_1[кв.м.]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'pogr_reg', NULL, N'Su', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'pogr_spos_kons1', N'ПогрузСпос-стьГрузчикаПоКонструкПар-рам_1[кв.м/с]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'pogr_spos_rej1', N'ПогрузочнаяСпос-стьГрузчикаПоЕгоРежимнымПар-рам_1', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'poter_kz', N'ПотериКороткогоЗамыкания[Вт]', N'transf', N'System.Double')
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
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Rz1', N'активное сопротивление цепи выпрямленного тока', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Rz2', N'активное сопротивление цепи выпрямленного тока', N'ep', N'System.String')
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
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sopr_urez', N'Сопротивляемость угля резанию', N'PlowMachineBase', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sr_tyag1', N'СреднееЗначениеТяговыхУсилийВЦепиСтруга_1[кН]', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'srvzznam', N'СрзначАмплитВысокочастСостовлТягУсВЦепиСтруга', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'step_rez_t2', N'ШагРезания_1[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'step_rez_t3', N'ШагРезания_2[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'su_mosh_va1', N'СуммарМощностьНаВалахЭлектродвиг-ейПривода_1[кВт]', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sum_moj_dvig', N'Суммарная мощность электродвигателей', N'PlowMachineBase', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sum_power_priv1', N'сум мощн  привода струга_1, Вт', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sut_pr_21', N'СуточнаяПроизводительнПриДвухсменРаботе_1[т/сут.2]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'sut_pr_31', N'СуточнаяПроизводительнПриТрехсменРаботе_1[т/сут.3]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'T', N'время', N'ep', N'System.String')
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
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_ed', NULL, N'ed', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_kn', NULL, N'Konv', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_krep', NULL, N'krep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_mo', NULL, N'transf', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_moschnost', N'ТиповаяМощностьТрансформатора[кВА]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_privod', NULL, N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_su', N'Марка струговой установки', N'PlowMachineBase', N'System.Int32')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tip_tsep', NULL, N'cep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Tmod4', N'Усилие погрузки грузчиком', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Tn1', N'постоянная времени преобразователя, с', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Tn2', N'постоянная времени преобразователя, с', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tok_vto', N'ТокВторичнойОбмоткиТранформатора[кг*м2]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'tpu_tzrtcso', N'ТочкаПриложУсилияВТочЗакрРабВетвиТягЦепиНаСтруге', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Trt', N'', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Tz', N'', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'u2fn', N'НоминальноеФазовоеНапряжениеВторичОбмоткиТрансф[В]', N'transf', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ug_esot', N'УголЕстествОткосаРазрушУгля[град]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ug_mepl', N'УголМежПлос-тьюСдвигПризмыВыжимаИПлоскПласта[град]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'us_gdpsz_resh1', N'УсилНаШтокахГидрДомкрПодСтругаЧерРештак1', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'us_pro', N'УсилиеПротягивания1метраЦепи[кН/м]', N'cep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Uy1', N'', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Uzc', N'', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'v_konv', N'Скорость конвейера м/мин', N'Konv', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'ves_ug', N'УдельныйВесУгля[кн/м.куб]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vi_stlo', N'ВысотаШтабеляУгляНадЛопаст[м]', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vis_pogr', N'ВысотаПогрузки[м]', N'gruzchik', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vis_str', N'ВысотаСтруга[м]', N'Su', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vre_rev_pri', N'ЗатратыВремНаРеверсПривода[с]', N'ep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vrem_peredv', N'ВремяПередвижения[с]', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vrem_perem', N'ВремяПеремещРабочегоПоЛаве[с]', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vrem_pod', N'ВремяПодтяг-яСекцииККонтейн[с]', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vrem_podg', N'ВремяПодгот-ЗаключОпераций[ч]', N'Su', N'System.Double')
GO
print 'Processed 300 total records'
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'vrem_raz', N'ВремяРазгрузкиСекцииКрепи[с]', N'krep', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'W1', N'', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'W2', N'', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'W3', N'', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'width_pogr_pov', N'ШиринаПогрузочнойПоверхности[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'width_rej_kr_b', N'ШиринаРежКромокРезцов_1[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'width_rej_kr_b1', N'ШиринаРежКромокРезцов_2[м]', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'x1', N'Коорд-тыТочекПриложДействующСил_8', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'x2', N'Коорд-тыТочекПриложДействующСил_9', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'x3', N'Коорд-тыТочекПриложДействующСил_10', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'xar_ug', N'ХарактеристикаУглей', N'zb', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Xk', N'Конечное значение времени', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'Xn', N'начальное значение времени', N'ep', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'y1', N'Коорд-тыТочекПриложДействующСил_1', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'y3', N'Коорд-тыТочекПриложДействующСил_2', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'y7', N'Коорд-тыТочекПриложДействующСил_3', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'y8', N'Коорд-тыТочекПриложДействующСил_4', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'y9', N'Коорд-тыТочекПриложДействующСил_5', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'z2', N'Коорд-тыТочекПриложДействующСил_6', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'z3', N'Коорд-тыТочекПриложДействующСил_7', N'sg', N'System.Double')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'с(1)', NULL, N'Su', N'System.String')
INSERT [dbo].[MetadataFields] ([FieldName], [Description], [ModuleName], [ClrType]) VALUES (N'с(2)', N'приведенный коэф жескости обр ветви цепи', N'Su', N'System.String')
/****** Object:  Table [dbo].[krep]    Script Date: 01/12/2009 12:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[krep]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Konv]    Script Date: 01/12/2009 12:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Konv]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[gruzchik]    Script Date: 01/12/2009 12:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gruzchik]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[ep]    Script Date: 01/12/2009 12:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ep]') AND type in (N'U'))
BEGIN
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
 CONSTRAINT [PK_ep] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ed]    Script Date: 01/12/2009 12:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ed]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ed](
	[PlowMachineId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[id_ed] [nvarchar](max) NULL,
	[tip_ed] [nvarchar](max) NULL,
	[nom_rot] [nvarchar](max) NULL,
	[C11] [nvarchar](max) NULL,
	[Cd1] [nvarchar](max) NULL,
	[Cd2] [nvarchar](max) NULL,
 CONSTRAINT [PK_ed] PRIMARY KEY CLUSTERED 
(
	[PlowMachineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[cep]    Script Date: 01/12/2009 12:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cep]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Default [DF_PlowMachines_PlowMachineId]    Script Date: 01/12/2009 12:00:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_PlowMachines_PlowMachineId]') AND parent_object_id = OBJECT_ID(N'[dbo].[PlowMachines]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PlowMachines_PlowMachineId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PlowMachines] ADD  CONSTRAINT [DF_PlowMachines_PlowMachineId]  DEFAULT (newid()) FOR [PlowMachineId]
END


End
GO
/****** Object:  Default [DF_PlowMachines_IsPrototype]    Script Date: 01/12/2009 12:00:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_PlowMachines_IsPrototype]') AND parent_object_id = OBJECT_ID(N'[dbo].[PlowMachines]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PlowMachines_IsPrototype]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PlowMachines] ADD  CONSTRAINT [DF_PlowMachines_IsPrototype]  DEFAULT ((0)) FOR [IsPrototype]
END


End
GO
/****** Object:  ForeignKey [FK_zb_PlowMachine]    Script Date: 01/12/2009 12:00:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_zb_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[zb]'))
ALTER TABLE [dbo].[zb]  WITH CHECK ADD  CONSTRAINT [FK_zb_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_zb_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[zb]'))
ALTER TABLE [dbo].[zb] CHECK CONSTRAINT [FK_zb_PlowMachine]
GO
/****** Object:  ForeignKey [FK_transf_PlowMachine]    Script Date: 01/12/2009 12:00:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_transf_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[transf]'))
ALTER TABLE [dbo].[transf]  WITH CHECK ADD  CONSTRAINT [FK_transf_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_transf_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[transf]'))
ALTER TABLE [dbo].[transf] CHECK CONSTRAINT [FK_transf_PlowMachine]
GO
/****** Object:  ForeignKey [FK_Su_PlowMachine]    Script Date: 01/12/2009 12:00:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Su_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[Su]'))
ALTER TABLE [dbo].[Su]  WITH CHECK ADD  CONSTRAINT [FK_Su_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Su_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[Su]'))
ALTER TABLE [dbo].[Su] CHECK CONSTRAINT [FK_Su_PlowMachine]
GO
/****** Object:  ForeignKey [FK_sg_PlowMachine]    Script Date: 01/12/2009 12:00:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sg_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[sg]'))
ALTER TABLE [dbo].[sg]  WITH CHECK ADD  CONSTRAINT [FK_sg_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sg_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[sg]'))
ALTER TABLE [dbo].[sg] CHECK CONSTRAINT [FK_sg_PlowMachine]
GO
/****** Object:  ForeignKey [FK_MetadataFields_MetadataModules]    Script Date: 01/12/2009 12:00:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MetadataFields_MetadataModules]') AND parent_object_id = OBJECT_ID(N'[dbo].[MetadataFields]'))
ALTER TABLE [dbo].[MetadataFields]  WITH CHECK ADD  CONSTRAINT [FK_MetadataFields_MetadataModules] FOREIGN KEY([ModuleName])
REFERENCES [dbo].[MetadataModules] ([ModuleName])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MetadataFields_MetadataModules]') AND parent_object_id = OBJECT_ID(N'[dbo].[MetadataFields]'))
ALTER TABLE [dbo].[MetadataFields] CHECK CONSTRAINT [FK_MetadataFields_MetadataModules]
GO
/****** Object:  ForeignKey [FK_krep_PlowMachine]    Script Date: 01/12/2009 12:00:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_krep_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[krep]'))
ALTER TABLE [dbo].[krep]  WITH CHECK ADD  CONSTRAINT [FK_krep_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_krep_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[krep]'))
ALTER TABLE [dbo].[krep] CHECK CONSTRAINT [FK_krep_PlowMachine]
GO
/****** Object:  ForeignKey [FK_Konv_PlowMachine]    Script Date: 01/12/2009 12:00:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Konv_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[Konv]'))
ALTER TABLE [dbo].[Konv]  WITH CHECK ADD  CONSTRAINT [FK_Konv_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Konv_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[Konv]'))
ALTER TABLE [dbo].[Konv] CHECK CONSTRAINT [FK_Konv_PlowMachine]
GO
/****** Object:  ForeignKey [FK_gruzchik_PlowMachine]    Script Date: 01/12/2009 12:00:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_gruzchik_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[gruzchik]'))
ALTER TABLE [dbo].[gruzchik]  WITH CHECK ADD  CONSTRAINT [FK_gruzchik_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_gruzchik_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[gruzchik]'))
ALTER TABLE [dbo].[gruzchik] CHECK CONSTRAINT [FK_gruzchik_PlowMachine]
GO
/****** Object:  ForeignKey [FK_ep_PlowMachine]    Script Date: 01/12/2009 12:00:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ep_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[ep]'))
ALTER TABLE [dbo].[ep]  WITH CHECK ADD  CONSTRAINT [FK_ep_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ep_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[ep]'))
ALTER TABLE [dbo].[ep] CHECK CONSTRAINT [FK_ep_PlowMachine]
GO
/****** Object:  ForeignKey [FK_ed_PlowMachine]    Script Date: 01/12/2009 12:00:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ed_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[ed]'))
ALTER TABLE [dbo].[ed]  WITH CHECK ADD  CONSTRAINT [FK_ed_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ed_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[ed]'))
ALTER TABLE [dbo].[ed] CHECK CONSTRAINT [FK_ed_PlowMachine]
GO
/****** Object:  ForeignKey [FK_cep_PlowMachine]    Script Date: 01/12/2009 12:00:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_cep_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[cep]'))
ALTER TABLE [dbo].[cep]  WITH CHECK ADD  CONSTRAINT [FK_cep_PlowMachine] FOREIGN KEY([PlowMachineId])
REFERENCES [dbo].[PlowMachines] ([PlowMachineId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_cep_PlowMachine]') AND parent_object_id = OBJECT_ID(N'[dbo].[cep]'))
ALTER TABLE [dbo].[cep] CHECK CONSTRAINT [FK_cep_PlowMachine]
GO
