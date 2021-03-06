USE [master]
GO
CREATE DATABASE [Rent-a-car]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Rent-a-car', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Rent-a-car.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Rent-a-car_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Rent-a-car_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Rent-a-car] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Rent-a-car].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Rent-a-car] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Rent-a-car] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Rent-a-car] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Rent-a-car] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Rent-a-car] SET ARITHABORT OFF 
GO
ALTER DATABASE [Rent-a-car] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Rent-a-car] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Rent-a-car] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Rent-a-car] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Rent-a-car] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Rent-a-car] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Rent-a-car] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Rent-a-car] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Rent-a-car] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Rent-a-car] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Rent-a-car] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Rent-a-car] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Rent-a-car] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Rent-a-car] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Rent-a-car] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Rent-a-car] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Rent-a-car] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Rent-a-car] SET RECOVERY FULL 
GO
ALTER DATABASE [Rent-a-car] SET  MULTI_USER 
GO
ALTER DATABASE [Rent-a-car] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Rent-a-car] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Rent-a-car] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Rent-a-car] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Rent-a-car] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Rent-a-car', N'ON'
GO
ALTER DATABASE [Rent-a-car] SET QUERY_STORE = OFF
GO
USE [Rent-a-car]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klijent](
	[klijent_id] [bigint] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NULL,
	[prezime] [nvarchar](50) NULL,
	[sifra_korisnika] [nvarchar](50) NULL,
	[telefon] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[grad] [nvarchar](50) NULL,
	[opstina] [nvarchar](50) NULL,
	[broj_vozacke_dozvole] [nvarchar](50) NULL,
	[datum_isteka_vozacke_dozvole] [date] NULL,
 CONSTRAINT [PK_Korisnik] PRIMARY KEY CLUSTERED 
(
	[klijent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategorija_klijent](
	[kategorija_klijent_id] [bigint] IDENTITY(1,1) NOT NULL,
	[naziv_kategorija_klijent] [nvarchar](50) NULL,
	[opis_popusta] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kategorija_klijent] PRIMARY KEY CLUSTERED 
(
	[kategorija_klijent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vozilo](
	[vozilo_id] [bigint] IDENTITY(1,1) NOT NULL,
	[marka_vozila] [nvarchar](50) NULL,
	[tip_vozila] [nvarchar](50) NULL,
	[boja] [nvarchar](50) NULL,
	[datum_kupovine_vozila] [nvarchar](50) NULL,
 CONSTRAINT [PK_Vozilo] PRIMARY KEY CLUSTERED 
(
	[vozilo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategorija_vozilo](
	[kategorija_vozilo_id] [bigint] IDENTITY(1,1) NOT NULL,
	[naziv_kategorija_vozilo] [nchar](10) NULL,
 CONSTRAINT [PK_Kategorija_vozilo] PRIMARY KEY CLUSTERED 
(
	[kategorija_vozilo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vozilo_kategorija_vozila](
	[vozilo_kategorija_vozilo_id] [bigint] IDENTITY(1,1) NOT NULL,
	[vozilo_id] [bigint] NULL,
	[kategorija_vozilo_id] [bigint] NULL,
 CONSTRAINT [PK_vozilo_kategorija_vozila] PRIMARY KEY CLUSTERED 
(
	[vozilo_kategorija_vozilo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Iznajmljivanje_vozila](
	[iznajmljivanje_vozila_id] [bigint] IDENTITY(1,1) NOT NULL,
	[klijent_id] [bigint] NULL,
	[vozilo_id] [bigint] NULL,
	[status_iznajmljivanja_vozila_id] [bigint] NULL,
	[datum_vreme_preuzimanja_vozila] [date] NULL,
	[datum_vreme_vracanja_vozila] [datetime] NULL,
	[kategorija_klijent_id] [bigint] NULL,
	[status_naplate_id] [bigint] NULL,
 CONSTRAINT [PK_Iznajmljivanje_vozila] PRIMARY KEY CLUSTERED 
(
	[iznajmljivanje_vozila_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status naplate](
	[status_naplate_id] [bigint] IDENTITY(1,1) NOT NULL,
	[naziv_statusa_naplate] [nvarchar](50) NULL,
	[opis_naplate] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status naplate] PRIMARY KEY CLUSTERED 
(
	[status_naplate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status_iznajmljivanja_vozila](
	[Status_iznajmljivanja_vozila_id] [bigint] IDENTITY(1,1) NOT NULL,
	[naziv_status_iznajmljivanja_vozila] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status_iznajmljivanja_vozila] PRIMARY KEY CLUSTERED 
(
	[Status_iznajmljivanja_vozila_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Klijent.ime, dbo.Klijent.grad, dbo.Kategorija_klijent.naziv_kategorija_klijent, dbo.Kategorija_klijent.opis_popusta, dbo.Iznajmljivanje_vozila.datum_vreme_preuzimanja_vozila, 
                         dbo.Iznajmljivanje_vozila.datum_vreme_vracanja_vozila, dbo.Status_iznajmljivanja_vozila.naziv_status_iznajmljivanja_vozila, dbo.[Status naplate].naziv_statusa_naplate, dbo.[Status naplate].opis_naplate, 
                         dbo.Vozilo.marka_vozila, dbo.Vozilo.tip_vozila, dbo.Kategorija_vozilo.naziv_kategorija_vozilo
FROM            dbo.Iznajmljivanje_vozila INNER JOIN
                         dbo.Kategorija_klijent ON dbo.Iznajmljivanje_vozila.kategorija_klijent_id = dbo.Kategorija_klijent.kategorija_klijent_id INNER JOIN
                         dbo.[Status naplate] ON dbo.Iznajmljivanje_vozila.status_naplate_id = dbo.[Status naplate].status_naplate_id INNER JOIN
                         dbo.Status_iznajmljivanja_vozila ON dbo.Iznajmljivanje_vozila.status_iznajmljivanja_vozila_id = dbo.Status_iznajmljivanja_vozila.Status_iznajmljivanja_vozila_id INNER JOIN
                         dbo.Vozilo ON dbo.Iznajmljivanje_vozila.vozilo_id = dbo.Vozilo.vozilo_id INNER JOIN
                         dbo.Vozilo_kategorija_vozila ON dbo.Vozilo.vozilo_id = dbo.Vozilo_kategorija_vozila.vozilo_id INNER JOIN
                         dbo.Kategorija_vozilo ON dbo.Vozilo_kategorija_vozila.kategorija_vozilo_id = dbo.Kategorija_vozilo.kategorija_vozilo_id RIGHT OUTER JOIN
                         dbo.Klijent ON dbo.Iznajmljivanje_vozila.klijent_id = dbo.Klijent.klijent_id
GO
SET IDENTITY_INSERT [dbo].[Iznajmljivanje_vozila] ON 

INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (1, 2, 2, 3, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-09T12:00:00.000' AS DateTime), 1, 3)
INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (2, 5, 3, 3, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-09T18:00:00.000' AS DateTime), 4, 3)
INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (3, 6, 1, 3, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-09T14:30:00.000' AS DateTime), 3, 3)
INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (4, 7, 13, 3, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-09T16:50:00.000' AS DateTime), 3, 3)
INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (5, 3, 5, 3, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-09T08:00:00.000' AS DateTime), 1, 3)
INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (6, 10, 6, 3, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-09T05:50:00.000' AS DateTime), 4, 3)
INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (7, 11, 10, 1, CAST(N'2019-02-20' AS Date), NULL, 4, 1)
INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (8, 15, 7, 2, CAST(N'2018-12-31' AS Date), CAST(N'2019-01-07T10:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (9, 16, 12, 3, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-09T10:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (10, 4, 8, 3, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-09T22:00:00.000' AS DateTime), 1, 3)
INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (11, 9, 4, 3, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-09T23:30:00.000' AS DateTime), 4, 3)
INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (12, 8, 9, 3, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-09T16:40:00.000' AS DateTime), 4, 3)
INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (13, 13, 14, 3, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-09T12:00:00.000' AS DateTime), 4, 3)
INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (14, 17, 11, 3, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-09T18:30:00.000' AS DateTime), 4, 3)
INSERT [dbo].[Iznajmljivanje_vozila] ([iznajmljivanje_vozila_id], [klijent_id], [vozilo_id], [status_iznajmljivanja_vozila_id], [datum_vreme_preuzimanja_vozila], [datum_vreme_vracanja_vozila], [kategorija_klijent_id], [status_naplate_id]) VALUES (15, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Iznajmljivanje_vozila] OFF
SET IDENTITY_INSERT [dbo].[Kategorija_klijent] ON 

INSERT [dbo].[Kategorija_klijent] ([kategorija_klijent_id], [naziv_kategorija_klijent], [opis_popusta]) VALUES (1, N'VIP', N'30%')
INSERT [dbo].[Kategorija_klijent] ([kategorija_klijent_id], [naziv_kategorija_klijent], [opis_popusta]) VALUES (2, N'Loyality', N'5%')
INSERT [dbo].[Kategorija_klijent] ([kategorija_klijent_id], [naziv_kategorija_klijent], [opis_popusta]) VALUES (3, N'Flotno iznajmljivanje', N'35%')
INSERT [dbo].[Kategorija_klijent] ([kategorija_klijent_id], [naziv_kategorija_klijent], [opis_popusta]) VALUES (4, N'Regularni_klijenti', NULL)
SET IDENTITY_INSERT [dbo].[Kategorija_klijent] OFF
SET IDENTITY_INSERT [dbo].[Kategorija_vozilo] ON 

INSERT [dbo].[Kategorija_vozilo] ([kategorija_vozilo_id], [naziv_kategorija_vozilo]) VALUES (1, N'putnicko  ')
INSERT [dbo].[Kategorija_vozilo] ([kategorija_vozilo_id], [naziv_kategorija_vozilo]) VALUES (2, N'terensko  ')
INSERT [dbo].[Kategorija_vozilo] ([kategorija_vozilo_id], [naziv_kategorija_vozilo]) VALUES (3, N'lux       ')
INSERT [dbo].[Kategorija_vozilo] ([kategorija_vozilo_id], [naziv_kategorija_vozilo]) VALUES (4, N'mini_bus  ')
INSERT [dbo].[Kategorija_vozilo] ([kategorija_vozilo_id], [naziv_kategorija_vozilo]) VALUES (5, N'cabrio    ')
SET IDENTITY_INSERT [dbo].[Kategorija_vozilo] OFF
SET IDENTITY_INSERT [dbo].[Klijent] ON 

INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (1, N'Maja', N'Ognjanovic', N'10001', N'12345', N'maja@gmail.com', N'Beograd', N'Rakovica', N'12556', CAST(N'2028-02-12' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (2, N'Ivana', N'Ivkovic', N'00001', N'45687', N'ivana@gmail.com', N'Zrenjanin', NULL, N'16525', CAST(N'2019-07-24' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (3, N'Marko', N'Isailovic', N'10003', N'68975', N'marko@gmail.com', N'Beograd', N'Cukarica', N'25495', CAST(N'2020-06-24' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (4, N'Milica', N'Jovanovic', N'10004', N'95874', N'milica@gmail.com', N'Beograd', N'Novi Beograd', N'16588', CAST(N'2019-04-06' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (5, N'Ninoslav', N'Arsic', N'20001', N'89654', N'ninoslav@gmail.com', N'Novi Sad', N'Novo Naselje', N'16599', CAST(N'2022-05-26' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (6, N'Jelena', N'Lampar', N'00002', N'95687', N'jelena@gmail.com', N'Subotica', N'Backi_Vinogradi', N'12889', CAST(N'2019-02-05' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (7, N'Aleksandar', N'Gak', N'00003', N'85697', N'gak@gmail.com', N'Sremski Karlovci', NULL, N'12899', CAST(N'2023-01-09' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (8, N'Dejan', N'Cvijetanovic', N'00004', N'45896', N'dejan@gmail.com', N'Loznica', NULL, N'54835', CAST(N'2024-05-20' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (9, N'Mile', N'Beslic', N'00005', N'89547', N'mile@gmail.com', N'Kragujevac', NULL, N'75615', CAST(N'2022-08-20' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (10, N'Djordje', N'Djo', N'00006', N'58946', N'djo@gmail.com', N'Uzice', NULL, N'42581', CAST(N'2019-05-05' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (11, N'Sofija', NULL, N'10011', N'45891', N'sofija@gmail.com', N'Beograd', N'Karaburma', N'54783', CAST(N'2025-07-07' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (12, N'Nenad', N'Kojic', N'10012', N'56897', N'nenad@gmail.com', N'Beograd', N'Bezanija', N'12542', CAST(N'2023-09-05' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (13, N'Nemanja', N'Grmusa', N'00007', N'89675', N'grmusa@gmail.com', N'Novi Sad', N'Petrovaradin', N'54762', CAST(N'2020-12-26' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (14, N'Ljiljana', NULL, N'10014', N'85764', N'ljiljana@gmail.com', N'Beograd', N'Savski_Venac', N'45812', CAST(N'2019-11-24' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (15, N'Ceca', NULL, N'20002', N'56872', N'ceca@gmail.com', N'Novi Sad', N'Futog', N'54753', CAST(N'2024-10-06' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (16, N'Djordje', N'Ivanovic', N'30001', N'23894', N'djordje@gmail.com', N'Pozarevac', NULL, N'21455', CAST(N'2020-03-22' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (17, N'Nena', N'Nikolic', N'30002', N'55589', N'nena@gmail.com', N'Pozarevac', NULL, N'25475', CAST(N'2019-04-05' AS Date))
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Klijent] ([klijent_id], [ime], [prezime], [sifra_korisnika], [telefon], [email], [grad], [opstina], [broj_vozacke_dozvole], [datum_isteka_vozacke_dozvole]) VALUES (19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Klijent] OFF
SET IDENTITY_INSERT [dbo].[Status naplate] ON 

INSERT [dbo].[Status naplate] ([status_naplate_id], [naziv_statusa_naplate], [opis_naplate]) VALUES (1, N'fakturisano', N'100%')
INSERT [dbo].[Status naplate] ([status_naplate_id], [naziv_statusa_naplate], [opis_naplate]) VALUES (2, N'depozit ', N'30%')
INSERT [dbo].[Status naplate] ([status_naplate_id], [naziv_statusa_naplate], [opis_naplate]) VALUES (3, N'depozit ', N'50%')
SET IDENTITY_INSERT [dbo].[Status naplate] OFF
SET IDENTITY_INSERT [dbo].[Status_iznajmljivanja_vozila] ON 

INSERT [dbo].[Status_iznajmljivanja_vozila] ([Status_iznajmljivanja_vozila_id], [naziv_status_iznajmljivanja_vozila]) VALUES (1, N'slobodno')
INSERT [dbo].[Status_iznajmljivanja_vozila] ([Status_iznajmljivanja_vozila_id], [naziv_status_iznajmljivanja_vozila]) VALUES (2, N'rezervisano')
INSERT [dbo].[Status_iznajmljivanja_vozila] ([Status_iznajmljivanja_vozila_id], [naziv_status_iznajmljivanja_vozila]) VALUES (3, N'iznajmljeno')
SET IDENTITY_INSERT [dbo].[Status_iznajmljivanja_vozila] OFF
SET IDENTITY_INSERT [dbo].[Vozilo] ON 

INSERT [dbo].[Vozilo] ([vozilo_id], [marka_vozila], [tip_vozila], [boja], [datum_kupovine_vozila]) VALUES (1, N'Toyota', N'Yaris', N'crvena akril', N'2018-01-01')
INSERT [dbo].[Vozilo] ([vozilo_id], [marka_vozila], [tip_vozila], [boja], [datum_kupovine_vozila]) VALUES (2, N'Toyota', N'Corolla', N'zelena metalik', N'2018-01-01')
INSERT [dbo].[Vozilo] ([vozilo_id], [marka_vozila], [tip_vozila], [boja], [datum_kupovine_vozila]) VALUES (3, N'Toyota', N'Avensis', N'siva metalik', N'2018-01-01')
INSERT [dbo].[Vozilo] ([vozilo_id], [marka_vozila], [tip_vozila], [boja], [datum_kupovine_vozila]) VALUES (4, N'Marcedes', N'A 180CDI', N'bela akril', N'2018-02-3')
INSERT [dbo].[Vozilo] ([vozilo_id], [marka_vozila], [tip_vozila], [boja], [datum_kupovine_vozila]) VALUES (5, N'Mercedes', N'C 220 CDI 4M', N'srebrna metalik', N'2018-02-3')
INSERT [dbo].[Vozilo] ([vozilo_id], [marka_vozila], [tip_vozila], [boja], [datum_kupovine_vozila]) VALUES (6, N'Mercedes', N'E 300 CDI 4M', N'selenit srebrna metalik', N'2018-02-3')
INSERT [dbo].[Vozilo] ([vozilo_id], [marka_vozila], [tip_vozila], [boja], [datum_kupovine_vozila]) VALUES (7, N'Mercedes', N'GLC 250 D', N'crna metalik', N'2018-02-3')
INSERT [dbo].[Vozilo] ([vozilo_id], [marka_vozila], [tip_vozila], [boja], [datum_kupovine_vozila]) VALUES (8, N'BMW', N'X3 20d', N'crna metalik', N'2018-03-5')
INSERT [dbo].[Vozilo] ([vozilo_id], [marka_vozila], [tip_vozila], [boja], [datum_kupovine_vozila]) VALUES (9, N'BMW', N'318 d M sport', N'plava metalik', N'2018-03-5')
INSERT [dbo].[Vozilo] ([vozilo_id], [marka_vozila], [tip_vozila], [boja], [datum_kupovine_vozila]) VALUES (10, N'BMW', N'520 d M sport', N'crna metalik', N'2018-03-5')
INSERT [dbo].[Vozilo] ([vozilo_id], [marka_vozila], [tip_vozila], [boja], [datum_kupovine_vozila]) VALUES (11, N'Porsche', N'Panamera 4s', N'crna metalik', N'2018-03-3')
INSERT [dbo].[Vozilo] ([vozilo_id], [marka_vozila], [tip_vozila], [boja], [datum_kupovine_vozila]) VALUES (12, N'Audi', N'A6 TDI', N'teget metalik', N'2018-01-4')
INSERT [dbo].[Vozilo] ([vozilo_id], [marka_vozila], [tip_vozila], [boja], [datum_kupovine_vozila]) VALUES (13, N'Mini', N'One Cabrio', N'bordo metalik', N'2018-01-2')
INSERT [dbo].[Vozilo] ([vozilo_id], [marka_vozila], [tip_vozila], [boja], [datum_kupovine_vozila]) VALUES (14, N'Mercedes', N'V klasa 220CDI', N'srebrna metalik', N'2018-02-12')
SET IDENTITY_INSERT [dbo].[Vozilo] OFF
SET IDENTITY_INSERT [dbo].[Vozilo_kategorija_vozila] ON 

INSERT [dbo].[Vozilo_kategorija_vozila] ([vozilo_kategorija_vozilo_id], [vozilo_id], [kategorija_vozilo_id]) VALUES (1, 1, 1)
INSERT [dbo].[Vozilo_kategorija_vozila] ([vozilo_kategorija_vozilo_id], [vozilo_id], [kategorija_vozilo_id]) VALUES (2, 2, 1)
INSERT [dbo].[Vozilo_kategorija_vozila] ([vozilo_kategorija_vozilo_id], [vozilo_id], [kategorija_vozilo_id]) VALUES (3, 3, 1)
INSERT [dbo].[Vozilo_kategorija_vozila] ([vozilo_kategorija_vozilo_id], [vozilo_id], [kategorija_vozilo_id]) VALUES (4, 4, 1)
INSERT [dbo].[Vozilo_kategorija_vozila] ([vozilo_kategorija_vozilo_id], [vozilo_id], [kategorija_vozilo_id]) VALUES (5, 5, 1)
INSERT [dbo].[Vozilo_kategorija_vozila] ([vozilo_kategorija_vozilo_id], [vozilo_id], [kategorija_vozilo_id]) VALUES (6, 6, 1)
INSERT [dbo].[Vozilo_kategorija_vozila] ([vozilo_kategorija_vozilo_id], [vozilo_id], [kategorija_vozilo_id]) VALUES (7, 7, 2)
INSERT [dbo].[Vozilo_kategorija_vozila] ([vozilo_kategorija_vozilo_id], [vozilo_id], [kategorija_vozilo_id]) VALUES (8, 8, 2)
INSERT [dbo].[Vozilo_kategorija_vozila] ([vozilo_kategorija_vozilo_id], [vozilo_id], [kategorija_vozilo_id]) VALUES (9, 9, 1)
INSERT [dbo].[Vozilo_kategorija_vozila] ([vozilo_kategorija_vozilo_id], [vozilo_id], [kategorija_vozilo_id]) VALUES (10, 10, 1)
INSERT [dbo].[Vozilo_kategorija_vozila] ([vozilo_kategorija_vozilo_id], [vozilo_id], [kategorija_vozilo_id]) VALUES (11, 11, 3)
INSERT [dbo].[Vozilo_kategorija_vozila] ([vozilo_kategorija_vozilo_id], [vozilo_id], [kategorija_vozilo_id]) VALUES (12, 12, 1)
INSERT [dbo].[Vozilo_kategorija_vozila] ([vozilo_kategorija_vozilo_id], [vozilo_id], [kategorija_vozilo_id]) VALUES (13, 13, 5)
INSERT [dbo].[Vozilo_kategorija_vozila] ([vozilo_kategorija_vozilo_id], [vozilo_id], [kategorija_vozilo_id]) VALUES (14, 14, 4)
SET IDENTITY_INSERT [dbo].[Vozilo_kategorija_vozila] OFF
ALTER TABLE [dbo].[Iznajmljivanje_vozila]  WITH CHECK ADD  CONSTRAINT [FK_Iznajmljivanje_vozila_Kategorija_klijent] FOREIGN KEY([kategorija_klijent_id])
REFERENCES [dbo].[Kategorija_klijent] ([kategorija_klijent_id])
GO
ALTER TABLE [dbo].[Iznajmljivanje_vozila] CHECK CONSTRAINT [FK_Iznajmljivanje_vozila_Kategorija_klijent]
GO
ALTER TABLE [dbo].[Iznajmljivanje_vozila]  WITH CHECK ADD  CONSTRAINT [FK_Iznajmljivanje_vozila_Klijent] FOREIGN KEY([klijent_id])
REFERENCES [dbo].[Klijent] ([klijent_id])
GO
ALTER TABLE [dbo].[Iznajmljivanje_vozila] CHECK CONSTRAINT [FK_Iznajmljivanje_vozila_Klijent]
GO
ALTER TABLE [dbo].[Iznajmljivanje_vozila]  WITH CHECK ADD  CONSTRAINT [FK_Iznajmljivanje_vozila_Status naplate] FOREIGN KEY([status_naplate_id])
REFERENCES [dbo].[Status naplate] ([status_naplate_id])
GO
ALTER TABLE [dbo].[Iznajmljivanje_vozila] CHECK CONSTRAINT [FK_Iznajmljivanje_vozila_Status naplate]
GO
ALTER TABLE [dbo].[Iznajmljivanje_vozila]  WITH CHECK ADD  CONSTRAINT [FK_Iznajmljivanje_vozila_Status_iznajmljivanja_vozila] FOREIGN KEY([status_iznajmljivanja_vozila_id])
REFERENCES [dbo].[Status_iznajmljivanja_vozila] ([Status_iznajmljivanja_vozila_id])
GO
ALTER TABLE [dbo].[Iznajmljivanje_vozila] CHECK CONSTRAINT [FK_Iznajmljivanje_vozila_Status_iznajmljivanja_vozila]
GO
ALTER TABLE [dbo].[Iznajmljivanje_vozila]  WITH CHECK ADD  CONSTRAINT [FK_Iznajmljivanje_vozila_Vozilo] FOREIGN KEY([vozilo_id])
REFERENCES [dbo].[Vozilo] ([vozilo_id])
GO
ALTER TABLE [dbo].[Iznajmljivanje_vozila] CHECK CONSTRAINT [FK_Iznajmljivanje_vozila_Vozilo]
GO
ALTER TABLE [dbo].[Vozilo_kategorija_vozila]  WITH CHECK ADD  CONSTRAINT [FK_Vozilo_kategorija_vozila_Kategorija_vozilo] FOREIGN KEY([kategorija_vozilo_id])
REFERENCES [dbo].[Kategorija_vozilo] ([kategorija_vozilo_id])
GO
ALTER TABLE [dbo].[Vozilo_kategorija_vozila] CHECK CONSTRAINT [FK_Vozilo_kategorija_vozila_Kategorija_vozilo]
GO
ALTER TABLE [dbo].[Vozilo_kategorija_vozila]  WITH CHECK ADD  CONSTRAINT [FK_Vozilo_kategorija_vozila_Vozilo] FOREIGN KEY([vozilo_id])
REFERENCES [dbo].[Vozilo] ([vozilo_id])
GO
ALTER TABLE [dbo].[Vozilo_kategorija_vozila] CHECK CONSTRAINT [FK_Vozilo_kategorija_vozila_Vozilo]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[55] 4[1] 2[4] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Iznajmljivanje_vozila"
            Begin Extent = 
               Top = 203
               Left = 305
               Bottom = 333
               Right = 572
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Kategorija_klijent"
            Begin Extent = 
               Top = 0
               Left = 440
               Bottom = 113
               Right = 650
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Status naplate"
            Begin Extent = 
               Top = 248
               Left = 803
               Bottom = 361
               Right = 1005
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Status_iznajmljivanja_vozila"
            Begin Extent = 
               Top = 108
               Left = 757
               Bottom = 216
               Right = 1021
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vozilo"
            Begin Extent = 
               Top = 427
               Left = 58
               Bottom = 604
               Right = 271
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vozilo_kategorija_vozila"
            Begin Extent = 
               Top = 456
               Left = 411
               Bottom = 577
               Right = 639
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kategorija_vozilo"
            Begin Extent = 
               Top = 492
               Left = 805
               Bottom ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 625
               Right = 1014
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Klijent"
            Begin Extent = 
               Top = 0
               Left = 0
               Bottom = 234
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2145
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2625
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [Rent-a-car] SET  READ_WRITE 
GO
