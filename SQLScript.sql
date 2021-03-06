USE [TASK]
GO
/****** Object:  User [my]    Script Date: 23.07.2020 23:42:38 ******/
CREATE USER [my] FOR LOGIN [my] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [my]
GO
/****** Object:  UserDefinedFunction [dbo].[func_base64_encode]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[func_base64_encode]
(
	@param nvarchar(4000)
)
RETURNS nvarchar(max)
AS
BEGIN

DECLARE @val nvarchar(MAX)

SELECT @val = CAST(N'' AS XML).value(
          'xs:base64Binary(xs:hexBinary(sql:column("bin")))'
        , 'VARCHAR(MAX)')
FROM (
    SELECT CAST(@param AS VARBINARY(MAX)) AS bin
) AS bin_sql_server_temp;

RETURN @val

END


GO
/****** Object:  UserDefinedFunction [dbo].[func_md5]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[func_md5]
(
	@param nvarchar(4000)
)
RETURNS nvarchar(32)
BEGIN
	RETURN CONVERT(NVARCHAR(32), HASHBYTES('MD5', @param), 2)
END
 


GO
/****** Object:  UserDefinedFunction [dbo].[func_md5_encrypt]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[func_md5_encrypt]
(
	@param nvarchar(4000)
)
RETURNS nvarchar(32)
AS
BEGIN
	--RETURN dbo.func_md5(('vgt' + dbo.func_md5(@param)))
      RETURN	 convert(nvarchar(32),DecryptByPassPhrase('key', @param ))
END
 


GO
/****** Object:  UserDefinedFunction [dbo].[func_md5_salted]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[func_md5_salted]
(
	@param nvarchar(4000)
)
RETURNS nvarchar(32)
AS
BEGIN
	RETURN dbo.func_md5(('vgt' + dbo.func_md5(@param)))
     -- RETURN	EncryptByPassPhrase('key', @param )
END
 


GO
/****** Object:  UserDefinedFunction [dbo].[func_seo_link_olusturma]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[func_seo_link_olusturma]
( 
 @slugsonrasimetin NVARCHAR(1000)
)
RETURNS NVARCHAR(1000)
AS
BEGIN
SET  @slugsonrasimetin = LOWER(@slugsonrasimetin) 
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,' ','-')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,' ','-')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'_','-')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'ç','c')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'Ç','c')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'ş','s')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'Ş','s')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'İ','i')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'I','i')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'Ö','o')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'ö','o')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'Ü','u')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'ü','u')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'Ğ','g')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'ğ','g')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'+','')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'&','')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'?','')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'%','yuzde-')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'''','-')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'!','')
SET  @slugsonrasimetin = REPLACE(@slugsonrasimetin COLLATE Latin1_General_Bin,'--','-')
Return (SELECT @slugsonrasimetin )
END


GO
/****** Object:  Table [dbo].[TBL_KULLANICI]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_KULLANICI](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[refKullaniciGrup] [bigint] NOT NULL,
	[AdSoyad] [nvarchar](200) NOT NULL,
	[Eposta] [nvarchar](255) NOT NULL,
	[Telefon] [nvarchar](12) NULL,
	[Parola] [nvarchar](50) NOT NULL,
	[Aktif] [bit] NOT NULL,
	[Silinmis] [bit] NOT NULL,
	[RecordTime] [datetime] NULL,
 CONSTRAINT [PK_TBL_KULLANICI] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_KULLANICI_GRUP]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_KULLANICI_GRUP](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](250) NOT NULL,
	[LoginRedirectUrl] [nvarchar](500) NULL,
	[Silinemez] [bit] NOT NULL,
	[RecordTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TBL_KULLANICI_GRUP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_KULLANICI]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_KULLANICI]
AS
SELECT        k.Id, k.refKullaniciGrup, kg.Ad AS KullaniciGrupAd, k.AdSoyad, k.Eposta, k.Aktif, k.Telefon, kg.LoginRedirectUrl
FROM            dbo.TBL_KULLANICI AS k LEFT OUTER JOIN
                         dbo.TBL_KULLANICI_GRUP AS kg ON k.refKullaniciGrup = kg.Id
WHERE        (k.Silinmis = 0)
GO
/****** Object:  Table [dbo].[TBL_GOREV]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_GOREV](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[refKullanici] [bigint] NULL,
	[Baslangic] [datetime] NULL,
	[Bitis] [datetime] NULL,
	[GorevAd] [nvarchar](500) NULL,
	[refDurum] [int] NULL,
	[Not] [nvarchar](500) NULL,
 CONSTRAINT [PK_TBL_GOREV] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_GOREV_DURUM]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_GOREV_DURUM](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Durum] [nvarchar](150) NULL,
	[Renk] [nvarchar](50) NULL,
 CONSTRAINT [PK_TBL_GOREV_DURUM] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_KULLANICI_GIRIS]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_KULLANICI_GIRIS](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[refKullanici] [bigint] NOT NULL,
	[Token] [nvarchar](100) NOT NULL,
	[TokenExpireTime] [datetime] NOT NULL,
	[IpAddress] [nvarchar](32) NULL,
	[Port] [nvarchar](10) NULL,
	[Platform] [nvarchar](50) NOT NULL,
	[PlatformToken] [nvarchar](1000) NULL,
	[DeviceId] [nvarchar](255) NULL,
	[UserAgent] [nvarchar](2000) NULL,
	[RecordTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TBL_KULLANICI_GIRIS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_KULLANICI_GIRIS_LOG]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_KULLANICI_GIRIS_LOG](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[Id] [bigint] NOT NULL,
	[refKullanici] [bigint] NOT NULL,
	[Token] [nvarchar](100) NOT NULL,
	[TokenExpireTime] [datetime] NOT NULL,
	[IpAddress] [nvarchar](32) NULL,
	[Port] [nvarchar](10) NULL,
	[Platform] [nvarchar](50) NOT NULL,
	[PlatformToken] [nvarchar](1000) NULL,
	[DeviceId] [nvarchar](255) NULL,
	[UserAgent] [nvarchar](2000) NULL,
	[RecordTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TBL_KULLANICI_GIRIS_LOG] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_KULLANICI_GRUP_YETKI]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_KULLANICI_GRUP_YETKI](
	[refKullaniciGrup] [bigint] NOT NULL,
	[refYetki] [bigint] NOT NULL,
 CONSTRAINT [PK_TBL_KULLANICI_GRUP_YETKI] PRIMARY KEY CLUSTERED 
(
	[refKullaniciGrup] ASC,
	[refYetki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_YETKI]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_YETKI](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Label] [nvarchar](200) NULL,
	[Platform] [nvarchar](50) NOT NULL,
	[Controller] [nvarchar](100) NOT NULL,
	[Action] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TBL_YETKI] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_GOREV] ON 

INSERT [dbo].[TBL_GOREV] ([Id], [refKullanici], [Baslangic], [Bitis], [GorevAd], [refDurum], [Not]) VALUES (1, 1, CAST(N'2020-07-21T09:00:00.000' AS DateTime), CAST(N'2020-07-21T10:00:00.000' AS DateTime), N'A Projesi (Analiz Toplantısı)', 1, N'asd')
INSERT [dbo].[TBL_GOREV] ([Id], [refKullanici], [Baslangic], [Bitis], [GorevAd], [refDurum], [Not]) VALUES (2, 2, CAST(N'2020-07-22T09:00:00.000' AS DateTime), CAST(N'2020-07-22T10:00:00.000' AS DateTime), N'A Projesi (Analiz Toplantısı)', 2, N'asd')
INSERT [dbo].[TBL_GOREV] ([Id], [refKullanici], [Baslangic], [Bitis], [GorevAd], [refDurum], [Not]) VALUES (5, 5, CAST(N'2020-07-25T09:00:00.000' AS DateTime), CAST(N'2020-07-25T10:00:00.000' AS DateTime), N'A Projesi (Analiz Toplantısı)', 1, N'asd')
INSERT [dbo].[TBL_GOREV] ([Id], [refKullanici], [Baslangic], [Bitis], [GorevAd], [refDurum], [Not]) VALUES (7, 2, CAST(N'2020-07-24T22:24:00.000' AS DateTime), CAST(N'2020-07-25T23:24:00.000' AS DateTime), N'C Projesi Test işlemleri', 2, NULL)
INSERT [dbo].[TBL_GOREV] ([Id], [refKullanici], [Baslangic], [Bitis], [GorevAd], [refDurum], [Not]) VALUES (8, 3, CAST(N'2020-07-23T22:24:00.000' AS DateTime), CAST(N'2020-07-25T23:24:00.000' AS DateTime), N'B Projesi Test işlemleri', 1, NULL)
SET IDENTITY_INSERT [dbo].[TBL_GOREV] OFF
SET IDENTITY_INSERT [dbo].[TBL_GOREV_DURUM] ON 

INSERT [dbo].[TBL_GOREV_DURUM] ([Id], [Durum], [Renk]) VALUES (1, N'Bekliyor', N'gray')
INSERT [dbo].[TBL_GOREV_DURUM] ([Id], [Durum], [Renk]) VALUES (2, N'Başladı', N'blue')
INSERT [dbo].[TBL_GOREV_DURUM] ([Id], [Durum], [Renk]) VALUES (3, N'Bitti', N'green')
SET IDENTITY_INSERT [dbo].[TBL_GOREV_DURUM] OFF
SET IDENTITY_INSERT [dbo].[TBL_KULLANICI] ON 

INSERT [dbo].[TBL_KULLANICI] ([Id], [refKullaniciGrup], [AdSoyad], [Eposta], [Telefon], [Parola], [Aktif], [Silinmis], [RecordTime]) VALUES (1, 1, N'Personel 1', N'Personel1@gmail.com', NULL, N'20E2725CCA35AFB04F62BE53A0854FAC', 1, 0, CAST(N'2020-04-17T11:51:25.897' AS DateTime))
INSERT [dbo].[TBL_KULLANICI] ([Id], [refKullaniciGrup], [AdSoyad], [Eposta], [Telefon], [Parola], [Aktif], [Silinmis], [RecordTime]) VALUES (2, 1, N'Personel 2', N'Personel2@gmail.com', NULL, N'20E2725CCA35AFB04F62BE53A0854FAC', 1, 0, CAST(N'2020-04-17T11:51:25.897' AS DateTime))
INSERT [dbo].[TBL_KULLANICI] ([Id], [refKullaniciGrup], [AdSoyad], [Eposta], [Telefon], [Parola], [Aktif], [Silinmis], [RecordTime]) VALUES (3, 1, N'Personel 3', N'Personel3@gmail.com', NULL, N'20E2725CCA35AFB04F62BE53A0854FAC', 1, 0, CAST(N'2020-04-17T11:51:25.897' AS DateTime))
INSERT [dbo].[TBL_KULLANICI] ([Id], [refKullaniciGrup], [AdSoyad], [Eposta], [Telefon], [Parola], [Aktif], [Silinmis], [RecordTime]) VALUES (4, 1, N'Personel 4', N'Personel4@gmail.com', NULL, N'20E2725CCA35AFB04F62BE53A0854FAC', 1, 0, CAST(N'2020-04-17T11:51:25.897' AS DateTime))
INSERT [dbo].[TBL_KULLANICI] ([Id], [refKullaniciGrup], [AdSoyad], [Eposta], [Telefon], [Parola], [Aktif], [Silinmis], [RecordTime]) VALUES (5, 1, N'Personel 5', N'Personel5@gmail.com', NULL, N'20E2725CCA35AFB04F62BE53A0854FAC', 1, 0, CAST(N'2020-04-17T11:51:25.897' AS DateTime))
SET IDENTITY_INSERT [dbo].[TBL_KULLANICI] OFF
SET IDENTITY_INSERT [dbo].[TBL_KULLANICI_GIRIS] ON 

INSERT [dbo].[TBL_KULLANICI_GIRIS] ([Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (20371, 1, N'QQAyADgARgBEADYAMwAxAEIANAA2ADEANAA4ADYAQQBCADcANwA5AEUAMQAxADMARABDAEMAMQAzADAAQQAxADEAMgAwADIAMAAw', CAST(N'2020-08-22T23:40:19.180' AS DateTime), N'::1', N'64508', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T23:40:19.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[TBL_KULLANICI_GIRIS] OFF
SET IDENTITY_INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ON 

INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (1, 10330, 1, N'MwA3AEYAMAAzADUANwAwADAAQQBGAEYANAA2ADgANAA5ADAANwBEADAAQwBGAEMANAAwADgAOQBBADgANAA1ADEAMgAwADIAMAAw', CAST(N'2020-08-21T12:46:12.313' AS DateTime), N'::1', N'63730', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-22T12:46:12.317' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (2, 10331, 1, N'NgA1ADEARABEAEIANAA5AEMAQQBGADQANAA3AEYANwBCAEMARQBEAEEARgBBAEEANQAwAEEAOQBCAEYAOAA4ADEAMgAwADIAMAAw', CAST(N'2020-08-21T12:49:19.427' AS DateTime), N'::1', N'63765', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-22T12:49:19.427' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (3, 10332, 1, N'QgBEADEANABBADcAOAAzADIAQwBFADgANAAwADUARQBBADkARAAyADYANwA2ADkAMwA1AEUAOQA0AEQAMQBEADEAMgAwADIAMAAw', CAST(N'2020-08-21T12:50:17.937' AS DateTime), N'::1', N'63778', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-22T12:50:17.937' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10002, 20331, 1, N'MQBEADcANwBFADMAMQA5ADAAMAA4AEMANAA2AEIARABBAEEAMQBGADAARAA0AEUAQQBBADcANgAyADUANABDADEAMgAwADIAMAAw', CAST(N'2020-08-21T18:36:43.777' AS DateTime), N'::1', N'52068', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-22T18:36:43.777' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10003, 20332, 1, N'RgBEAEMAMABGADQAQwAyAEIARAA4AEUANAAzAEMAMgBBAEMANwAzAEIAOQBFADQARQAzADAAOQA0AEEARgBDADEAMgAwADIAMAAw', CAST(N'2020-08-21T18:40:33.243' AS DateTime), N'::1', N'52140', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-22T18:40:33.243' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10004, 20333, 1, N'RABEADcAMABGAEQAQwA3ADUARQAzADkANAAzAEQAMAA5AEEANAA2ADYARAA3AEIAOAA5ADMAMQA2ADAAOQA0ADEAMgAwADIAMAAw', CAST(N'2020-08-22T10:40:01.893' AS DateTime), N'::1', N'55213', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T10:40:01.893' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10005, 20334, 1, N'RQBCAEQANgA5AEIAQwBFAEUAQQBFAEYANAA3AEMAMgA4ADYAQgAxAEIAMAA3ADMARgA4ADgANwBCADYARQA1ADEAMgAwADIAMAAw', CAST(N'2020-08-22T10:47:06.997' AS DateTime), N'::1', N'55353', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T10:47:06.997' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10006, 20335, 1, N'RQA0ADcAMAA1ADMAMQA5ADEAOAAzAEIANABFAEIARAA4AEUANgBDADIAOABCADgAOQA2AEIAQQBDAEUAQgBBADEAMgAwADIAMAAw', CAST(N'2020-08-22T10:56:26.653' AS DateTime), N'::1', N'55353', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T10:56:26.653' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10007, 20336, 1, N'NwBFADUANAA1ADQAMwA4ADUAMABBADcANABCADAANwA4ADUARgA5ADIAOQBFAEYAQQAwADMANQBEAEEANAA0ADEAMgAwADIAMAAw', CAST(N'2020-08-22T10:57:26.697' AS DateTime), N'::1', N'55412', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T10:57:26.697' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10008, 20337, 1, N'OAAxADUAQwAyADYAMgBEAEYAMgBGADcANAA1ADcAMABBADIAQgBBADcAMwBFAEEANgA3AEMANQAyADcARgBFADEAMgAwADIAMAAw', CAST(N'2020-08-22T10:58:54.650' AS DateTime), N'::1', N'55412', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T10:58:54.653' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10009, 20338, 1, N'MwBBADcAMQAyADcAMQBBADYAOQA2ADMANAA2AEEANgA4AEIAQgAwADQAQQBFADkAQQA5AEQARAA0AEYARQBGADEAMgAwADIAMAAw', CAST(N'2020-08-22T11:01:48.390' AS DateTime), N'::1', N'55441', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T11:01:48.390' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10010, 20339, 1, N'MQA1AEUANwA3AEYAQQAzADEAQgAzADcANAA1AEQANABCADYARABEADkAQgA3ADIARAA3ADQAOAA1ADQAMAA4ADEAMgAwADIAMAAw', CAST(N'2020-08-22T11:06:45.577' AS DateTime), N'::1', N'55441', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T11:06:45.577' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10011, 20340, 1, N'MgBFADEAQQAwADQAOAAyADUAQwAwADUANAA1AEIAOQBBADIARQAwAEQAQwAzADcARAAzAEEAQgBFADgANgA1ADEAMgAwADIAMAAw', CAST(N'2020-08-22T11:13:39.477' AS DateTime), N'::1', N'55506', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T11:13:39.477' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10012, 20341, 1, N'MABCADIAQwBGADAAMwAyADMANQA4AEUANAA1ADgANwBCADgARABEAEYANwBCADIAQgAyADUARABFADYANgA1ADEAMgAwADIAMAAw', CAST(N'2020-08-22T11:34:29.920' AS DateTime), N'::1', N'55931', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T11:34:29.920' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10013, 20342, 1, N'MgBBADUAQwBDADUAMgAyADUAQQBGAEIANAA1AEYARQBBAEIANAA2ADAANwBDADQANgAyADgAMQA2AEEANAA0ADEAMgAwADIAMAAw', CAST(N'2020-08-22T11:37:09.433' AS DateTime), N'::1', N'55993', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T11:37:09.433' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10014, 20343, 1, N'MQBCAEIAOQBBADAAQgBEADUAOQA1AEUANAAyADYAMAA5AEUARgBFADcARgBBADcAMQAxADMAQQAxADUAOQA0ADEAMgAwADIAMAAw', CAST(N'2020-08-22T11:42:23.443' AS DateTime), N'::1', N'56114', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T11:42:23.443' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10015, 20344, 1, N'MQA3AEYAOAA2ADIAMAA2ADIARAA0AEEANAAyAEUAMwBCADgANAA1ADcAMgBGADYAQwBEADEANgAwADQAMAA2ADEAMgAwADIAMAAw', CAST(N'2020-08-22T11:45:45.330' AS DateTime), N'::1', N'56137', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T11:45:45.330' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10016, 20345, 1, N'RQBCAEYAMwA1ADEAMgBGAEEANQBEADAANAA4ADgAMgBCAEQAQgAwAEIAOAAzAEMAQwAzAEQANAAwAEUANQBBADEAMgAwADIAMAAw', CAST(N'2020-08-22T19:02:45.033' AS DateTime), N'::1', N'56919', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T19:02:45.033' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10017, 20346, 1, N'QQAzADgAMgAwADEARQA2ADMAMwA5ADcANABFADYANgA5AEYANgBEADUAMABCADgANwA5ADEAQQBCADkANABFADEAMgAwADIAMAAw', CAST(N'2020-08-22T19:43:00.177' AS DateTime), N'::1', N'58279', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T19:43:00.177' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10018, 20347, 1, N'QwAwADcAMQA3ADkANQBFADcANgAzAEMANAA5ADkAQgBBADkAOAA5ADUAOQA5ADcANAAwAEEAOQBCAEIARAA0ADEAMgAwADIAMAAw', CAST(N'2020-08-22T20:30:52.750' AS DateTime), N'::1', N'59656', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T20:30:52.750' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10019, 20348, 1, N'NgAwAEQAQQBBADEANQAwAEQARAA3AEEANABGADQAMAA4AEYAQwBBAEQARgA2ADcAQQBDAEUANgA4AEUANAAyADEAMgAwADIAMAAw', CAST(N'2020-08-22T20:48:48.653' AS DateTime), N'::1', N'60020', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T20:48:48.653' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10020, 20349, 1, N'QQAxADcANgA1AEMAMgBFADAAOQA3ADMANABDAEUAOQA4ADQANQA0AEYANgAwADUAQgA2ADYAMQBCADMAMgA3ADEAMgAwADIAMAAw', CAST(N'2020-08-22T20:52:44.070' AS DateTime), N'::1', N'60147', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T20:52:44.073' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10021, 20350, 1, N'QgA0ADcAOAA5ADgAMwBFADUANgBDADEANAA5ADYAQwA5ADMANwBDADIARgAzADkAMAA2ADkAOQAzADQAMAA2ADEAMgAwADIAMAAw', CAST(N'2020-08-22T20:52:53.137' AS DateTime), N'::1', N'60147', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T20:52:53.137' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10022, 20351, 1, N'QwA1ADAAOQBFADkANgAzADEAMABEADcANABGADkARgBCAEQAQgAzADkARQAzADMAOAA3AEUAQwBFAEIAMAA2ADEAMgAwADIAMAAw', CAST(N'2020-08-22T21:31:07.287' AS DateTime), N'::1', N'61677', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T21:31:07.287' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10023, 20352, 1, N'RgAyAEMANwAwADMARABGAEIANwA2ADUANAA4ADAAQgA5ADgAMQBBADAARgAzADUAQQA1ADUANAA4AEQANAA4ADEAMgAwADIAMAAw', CAST(N'2020-08-22T21:39:28.507' AS DateTime), N'::1', N'62053', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T21:39:28.510' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10024, 20353, 1, N'MQAzADYAQgBFAEUAQwA0ADIAMgAyADIANAA3AEUAMwBCADMAOQAzADEANQBCAEMANQAwADUAOAA2ADQAQwAzADEAMgAwADIAMAAw', CAST(N'2020-08-22T22:13:19.367' AS DateTime), N'::1', N'62949', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T22:13:19.367' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10025, 20354, 1, N'QQA0ADAARAA0ADAAQQAwADIAQgA1AEYANAA5AEUAQgBCAEEAMAA4ADEAOQAwADUAMABCAEUAQwA4ADkANAA1ADEAMgAwADIAMAAw', CAST(N'2020-08-22T22:13:19.467' AS DateTime), N'::1', N'62949', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T22:13:19.470' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10026, 20355, 1, N'NwA5ADUANQBFADAARABFAEEARgAzAEQANAA4AEYAMQA4AEYAMwA2ADUANwA4ADIAQgAzAEYANwAwADAANwA1ADEAMgAwADIAMAAw', CAST(N'2020-08-22T22:16:34.810' AS DateTime), N'::1', N'62968', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T22:16:34.810' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10027, 20356, 1, N'OQA5ADQANAAyADIAQgBGADIAQQAxADUANAAzAEQAOQBCAEUAMAA1ADIANAAxADUAMABCAEIANQBEADQAQQBGADEAMgAwADIAMAAw', CAST(N'2020-08-22T22:20:41.870' AS DateTime), N'::1', N'62968', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T22:20:41.870' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10028, 20357, 1, N'NAA4AEEARQA3AEYANwA5AEEAOABDADkANAA4ADkANgBCADYAMwAzAEEAMQA3AEMAQgBEADUAMgA1ADIANQBEADEAMgAwADIAMAAw', CAST(N'2020-08-22T22:53:20.767' AS DateTime), N'::1', N'63669', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T22:53:20.767' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10029, 20358, 1, N'MQBGADIANABGADQARgA0AEUAMAA0AEMANAAyADMANABBADkAMQA1AEIAOABGAEQAQgBEAEUANgBBADkANwA4ADEAMgAwADIAMAAw', CAST(N'2020-08-22T22:53:22.783' AS DateTime), N'::1', N'63669', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T22:53:22.783' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10030, 20359, 1, N'MwA0ADgAOQAzADMANwA0AEEANgBGADIANAA4AEQANwBBADYANABCADUANgBGAEUARAA2ADkAMwA1ADgAMAAxADEAMgAwADIAMAAw', CAST(N'2020-08-22T23:02:24.310' AS DateTime), N'::1', N'63816', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T23:02:24.313' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10031, 20360, 1, N'RgAwADkAQwA1ADIAMgAyADQANQA2ADgANABBAEIANgBBADIAMwAzADcARQAyAEQAQgBBADYANgA1AEYAQwAzADEAMgAwADIAMAAw', CAST(N'2020-08-22T23:05:47.423' AS DateTime), N'::1', N'63881', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T23:05:47.423' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10032, 20361, 1, N'QQA1ADEAQwA4AEQAMgAxADAANABFADAANAAxADAARABBADcANQBFADIAMAAzADIAOQBDAEEAMwAwAEQAMgAwADEAMgAwADIAMAAw', CAST(N'2020-08-22T23:13:07.033' AS DateTime), N'::1', N'64060', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T23:13:07.033' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10033, 20362, 1, N'NgA1ADUANQBEADYANgA0ADYANwA3AEUANAA0AEQAMQA4ADMAMgAwADIARgA4ADYAMwAwADkAOQBCAEMAOQA4ADEAMgAwADIAMAAw', CAST(N'2020-08-22T23:25:34.280' AS DateTime), N'::1', N'64222', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T23:25:34.280' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10034, 20363, 1, N'RgAwADEANQBDADQAMABFADUARQA4ADMANABFADEAMgBCAEUANAA4ADEANwA5ADUARgBCAEIAMABCADkAMgBCADEAMgAwADIAMAAw', CAST(N'2020-08-22T23:25:34.280' AS DateTime), N'::1', N'64222', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T23:25:34.280' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10035, 20364, 1, N'NgA2ADUARgAxAEIAQwA1ADUAMgBEAEMANAAxAEIAMAA5ADYARQAwAEQAMwA2ADUAQwA2ADUAOQBCAEUAMgA5ADEAMgAwADIAMAAw', CAST(N'2020-08-22T23:25:36.650' AS DateTime), N'::1', N'64222', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T23:25:36.650' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10036, 20365, 1, N'RgA1ADAAMgBBAEYAMABEADQAMAA2AEMANAA1AEYAMQBBADYARgBCADgANQA0ADMAMAA4ADMAMAAzAEYANQBBADEAMgAwADIAMAAw', CAST(N'2020-08-22T23:28:23.837' AS DateTime), N'::1', N'64250', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T23:28:23.837' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10037, 20366, 1, N'MgAwADUANwA3ADEARQA0ADgARABEADQANAAyADQAOQA4AEUARAA5ADYAQgBGADEAMwAzAEYAMAAzADcANAAxADEAMgAwADIAMAAw', CAST(N'2020-08-22T23:28:23.837' AS DateTime), N'::1', N'64250', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T23:28:23.837' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10038, 20367, 1, N'RgBBADMANQA3AEQANwAxADMAMwBEADgANAA0ADIAMQA5AEQANwAzADAAQwBCAEQAMgAxADQARAA2ADkANABCADEAMgAwADIAMAAw', CAST(N'2020-08-22T23:37:05.070' AS DateTime), N'::1', N'64459', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T23:37:05.070' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10039, 20368, 1, N'NQAyADQAQgA1AEYAMwAzADQANAA0ADQANABBAEMAOQA5ADgANwA4AEYAMQA3ADgAQgBCAEIANgA2AEIAMgAzADEAMgAwADIAMAAw', CAST(N'2020-08-22T23:38:13.257' AS DateTime), N'::1', N'64469', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T23:38:13.257' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10040, 20369, 1, N'MgBGAEIAOAA5ADMAQwBGADUAOQBCADQANABBADMAQgA5AEMARAA3ADEARgA3ADUANgBEADQAMQAwADAAMgBCADEAMgAwADIAMAAw', CAST(N'2020-08-22T23:38:13.257' AS DateTime), N'::1', N'64469', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T23:38:13.257' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10041, 20370, 1, N'OQBBADQARgA1ADAARgA0AEMARQAzADYANABCADYAMwA5ADkAOQBCADUANAAxADAANAA5ADQARQA0ADIANQA1ADEAMgAwADIAMAAw', CAST(N'2020-08-22T23:38:16.170' AS DateTime), N'::1', N'64469', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T23:38:16.170' AS DateTime))
INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] ([LogId], [Id], [refKullanici], [Token], [TokenExpireTime], [IpAddress], [Port], [Platform], [PlatformToken], [DeviceId], [UserAgent], [RecordTime]) VALUES (10042, 20371, 1, N'QQAyADgARgBEADYAMwAxAEIANAA2ADEANAA4ADYAQQBCADcANwA5AEUAMQAxADMARABDAEMAMQAzADAAQQAxADEAMgAwADIAMAAw', CAST(N'2020-08-22T23:40:19.180' AS DateTime), N'::1', N'64508', N'WEB', NULL, NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', CAST(N'2020-07-23T23:40:19.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[TBL_KULLANICI_GIRIS_LOG] OFF
SET IDENTITY_INSERT [dbo].[TBL_KULLANICI_GRUP] ON 

INSERT [dbo].[TBL_KULLANICI_GRUP] ([Id], [Ad], [LoginRedirectUrl], [Silinemez], [RecordTime]) VALUES (1, N'Admin', N'/Home/Index', 0, CAST(N'2020-04-17T11:52:31.630' AS DateTime))
SET IDENTITY_INSERT [dbo].[TBL_KULLANICI_GRUP] OFF
INSERT [dbo].[TBL_KULLANICI_GRUP_YETKI] ([refKullaniciGrup], [refYetki]) VALUES (1, 1)
SET IDENTITY_INSERT [dbo].[TBL_YETKI] ON 

INSERT [dbo].[TBL_YETKI] ([Id], [Label], [Platform], [Controller], [Action]) VALUES (1, N'Tüm Sayfalar', N'WEB', N'*', N'*')
SET IDENTITY_INSERT [dbo].[TBL_YETKI] OFF
ALTER TABLE [dbo].[TBL_KULLANICI] ADD  CONSTRAINT [DF_TBL_KULLANICI_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[TBL_KULLANICI] ADD  CONSTRAINT [DF_TBL_KULLANICI_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
ALTER TABLE [dbo].[TBL_KULLANICI_GIRIS] ADD  CONSTRAINT [DF_KULLANICI_GIRIS_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
ALTER TABLE [dbo].[TBL_KULLANICI_GIRIS_LOG] ADD  CONSTRAINT [DF_TBL_KULLANICI_GIRIS_LOG_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
ALTER TABLE [dbo].[TBL_KULLANICI_GRUP] ADD  CONSTRAINT [DF_TBL_KULLANICI_GRUP_Silinemez]  DEFAULT ((0)) FOR [Silinemez]
GO
ALTER TABLE [dbo].[TBL_KULLANICI_GRUP] ADD  CONSTRAINT [DF_GRUP_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  StoredProcedure [dbo].[sp_diagnostic_error]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_diagnostic_error] 
	@kod nvarchar(10),
	@modul nvarchar(20),
	@metot nvarchar(200) = NULL,
	@aciklama nvarchar(2000) = NULL,
	@aciklamaExternal nvarchar(4000) = NULL,
	@refId nvarchar(50) = NULL,
	@refIdExternal nvarchar(50) = NULL
AS
BEGIN
SET XACT_ABORT ON

BEGIN TRANSACTION

INSERT INTO TBL_DIAGNOSTIC_ERROR (Modul, refId, refIdExternal, Kod, Metot, Aciklama, AciklamaExternal)
	SELECT @modul, @refId, @refIdExternal, @kod, @metot, @aciklama, @aciklamaExternal 

COMMIT TRANSACTION

END


GO
/****** Object:  StoredProcedure [dbo].[sp_diagnostic_error_list]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_diagnostic_error_list]
	@refKullanici bigint
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
 

--BEGIN TRANSACTION
 
--SELECT *  FROM TBL_DIAGNOSTIC_ERROR ORDER BY Id DESC

--COMMIT TRANSACTION

DECLARE @lastCheckTime datetime
SELECT  @lastCheckTime = RecordTime FROM TBL_DIAGNOSTIC_ERROR_LAST_CHECKTIME WHERE refKullanici = @refKullanici

BEGIN TRANSACTION

DELETE FROM TBL_DIAGNOSTIC_ERROR_LAST_CHECKTIME WHERE refKullanici = @refKullanici
INSERT INTO TBL_DIAGNOSTIC_ERROR_LAST_CHECKTIME (refKullanici) VALUES (@refKullanici)

SELECT TOP 1000 *, (CASE WHEN RecordTime > ISNULL(@lastCheckTime, '2018-01-01') THEN 1 ELSE 0 END) as Gorulmus 
	FROM TBL_DIAGNOSTIC_ERROR 
	WHERE Kod != 'ERR0007'
	  AND Kod != 'ERR1000'
	ORDER BY Id DESC

COMMIT TRANSACTION

END


GO
/****** Object:  StoredProcedure [dbo].[sp_diagnostic_system_status]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_diagnostic_system_status]
	@refKullanici bigint
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT 'ThreadAGVIsEmriYonlendir' as Ad, 5 as Interval INTO #THREADS
INSERT INTO #THREADS (Ad, Interval) VALUES 
	('ThreadAGVInformations', 5), 
	('ThreadAGVIsEmriFromGAM', 5)
	
	
DECLARE @lastCheckTime datetime--, @lastCheckTimeOtoOdeme datetime
SELECT  @lastCheckTime = RecordTime FROM TBL_DIAGNOSTIC_ERROR_LAST_CHECKTIME WHERE refKullanici = @refKullanici
--SELECT  @lastCheckTimeOtoOdeme = RecordTime FROM TBL_MUSTERI_OTOMATIK_ODEME_FAILED_LAST_CHECKTIME WHERE refKullanici = @refKullanici

SELECT t.Ad, l.RecordTime as SonCalismaZamani, DATEDIFF(MINUTE, ISNULL(l.RecordTime, 0), GETDATE()) as ZamanFark,
	(CASE WHEN DATEDIFF(MINUTE, ISNULL(l.RecordTime, 0), GETDATE()) > t.Interval THEN 0 ELSE 1 END) as Durum 
	INTO #HEALTH
	FROM #THREADS t LEFT JOIN TBL_SERVICE_RUNTIME_LOG l ON t.Ad = l.Ad

DECLARE @hataSayisi int, @aracSayisi int, @otoOdemeSayisi int

SELECT @hataSayisi = COUNT(*) FROM TBL_DIAGNOSTIC_ERROR WHERE (@lastCheckTime IS NULL OR RecordTime > @lastCheckTime) AND Kod != 'ERR0007' AND Kod != 'ERR1000'
--SELECT @aracSayisi = COUNT(*) FROM TBL_ARAC_UNUTULMUS
--SELECT @otoOdemeSayisi = COUNT(*) FROM TBL_MUSTERI_OTOMATIK_ODEME_FAILED_LOG WHERE (@lastCheckTime IS NULL OR RecordTime > @lastCheckTimeOtoOdeme)

SELECT COUNT(*) as ArizaSayisi, 
	  @hataSayisi as HataSayisi--, 
	--  @aracSayisi as UnutulmusAracSayisi, 
	 -- @otoOdemeSayisi as BasarisizOtomatikOdemeSayisi 
	  FROM #HEALTH WHERE Durum = 0

SELECT * FROM #HEALTH

END

GO
/****** Object:  StoredProcedure [dbo].[sp_gorev_detay]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_gorev_detay]
	@Id bigint

AS
BEGIN

SELECT        TBL_GOREV.Id, TBL_GOREV.refKullanici, TBL_GOREV.Baslangic, TBL_GOREV.Bitis, TBL_GOREV.GorevAd, TBL_GOREV.refDurum, TBL_GOREV_DURUM.Durum, TBL_GOREV_DURUM.Renk, TBL_GOREV.[Not]
FROM            TBL_GOREV INNER JOIN
                         TBL_GOREV_DURUM ON TBL_GOREV.refDurum = TBL_GOREV_DURUM.Id
WHERE        TBL_GOREV.Id =@Id

END










GO
/****** Object:  StoredProcedure [dbo].[sp_gorev_durum_listesi]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_gorev_durum_listesi]

AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT *
	FROM TBL_GOREV_DURUM


END

GO
/****** Object:  StoredProcedure [dbo].[sp_gorev_guncelle]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_gorev_guncelle]
	@id bigint,
	@refKullanici bigint,
	@baslangic datetime,
	@bitis datetime,
	@gorevAd nvarchar(500),
	@refDurum int,
	@Not nvarchar(500)
AS
BEGIN
SET XACT_ABORT ON

BEGIN TRANSACTION

UPDATE  TBL_GOREV SET refKullanici =@refKullanici, Baslangic =@baslangic, Bitis =@bitis, GorevAd =@gorevAd, refDurum =@refDurum, [Not] =@Not
WHERE Id = @id

COMMIT TRANSACTION

SELECT 'SUCCEED' as Result

END










GO
/****** Object:  StoredProcedure [dbo].[sp_gorev_listesi]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_gorev_listesi]
	
AS
BEGIN
SET XACT_ABORT ON

		SELECT  TBL_GOREV.refKullanici as Id, TBL_KULLANICI.AdSoyad
		FROM	TBL_GOREV LEFT OUTER JOIN
				TBL_KULLANICI ON TBL_GOREV.refKullanici = TBL_KULLANICI.Id
		GROUP BY TBL_GOREV.refKullanici, TBL_KULLANICI.AdSoyad

		SELECT	TBL_GOREV.Id, TBL_GOREV.refKullanici, TBL_GOREV.Baslangic, TBL_GOREV.Bitis, TBL_GOREV.GorevAd, TBL_GOREV.refDurum, TBL_GOREV_DURUM.Durum, TBL_GOREV_DURUM.Renk, TBL_GOREV.[Not]
		FROM	TBL_GOREV INNER JOIN
				TBL_GOREV_DURUM ON TBL_GOREV.refDurum = TBL_GOREV_DURUM.Id


END
 


GO
/****** Object:  StoredProcedure [dbo].[sp_gorev_olustur]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_gorev_olustur]
	@refKullanici bigint,
	@baslangic datetime,
	@bitis datetime,
	@gorevAd nvarchar(500),
	@refDurum int,
	@Not nvarchar(500)
AS
BEGIN
SET XACT_ABORT ON

BEGIN TRANSACTION

INSERT  INTO TBL_GOREV(refKullanici, Baslangic, Bitis, GorevAd, refDurum, [Not])
VALUES			(@refKullanici,@baslangic,@bitis,@gorevAd,@refDurum,@Not)

COMMIT TRANSACTION

SELECT 'SUCCEED' as Result

END










GO
/****** Object:  StoredProcedure [dbo].[sp_gorev_sil]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_gorev_sil]
	@refId bigint
AS
BEGIN
SET XACT_ABORT ON


BEGIN TRANSACTION

DELETE FROM TBL_GOREV WHERE Id=@refId

COMMIT TRANSACTION

SELECT 'SUCCEED' as Result

END










GO
/****** Object:  StoredProcedure [dbo].[sp_kullanici_detay]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_kullanici_detay]
	@refKullanici bigint,
	@kullaniciId bigint
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT TOP 1 *
	FROM V_KULLANICI
	WHERE Id = @kullaniciId

END
 


GO
/****** Object:  StoredProcedure [dbo].[sp_kullanici_giris]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_kullanici_giris]
	@eposta nvarchar(255),
	@parola nvarchar(32),
	@ipAddress nvarchar(32) = NULL,
	@port nvarchar(10) = NULL,
	@userAgent nvarchar(2000) = NULL,
	@platform nvarchar(50) = NULL,
	@platformToken nvarchar(1000) = NULL,
	@deviceId nvarchar(255) = NULL
AS
BEGIN
SET XACT_ABORT ON

DECLARE @tokenGecerlilikSuresi   int = 30 -- Token gecerlilik suresi (gun)
DECLARE @birdenCokOturumaIzinVer bit = 0  -- Aynı anda birden cok oturum acilabilir mi?

DECLARE @refKullanici bigint

SELECT @refKullanici = Id 
	FROM TBL_KULLANICI 
	WHERE Eposta = @eposta 
	  AND Parola = dbo.func_md5_salted(@parola)
	  AND Aktif = 1
	  AND Silinmis = 0

IF @refKullanici IS NULL OR @refKullanici <= 0
	BEGIN
	SELECT 'WRONG_EMAIL_OR_PASS' as Result
	RETURN
	END

DECLARE @token nvarchar(100), @tokenExpireTime datetime

-- Oturum anahtari (token) olustur
SELECT  @token = dbo.func_base64_encode(REPLACE(NEWID(), '-', '') + CAST(1 as varchar) + REPLACE(CONVERT(varchar(8), GETDATE(), 112)+CONVERT(VARCHAR(8), GETDATE(), 114), ':',''))

-- Tokenin gecerlilik suresi
SELECT  @tokenExpireTime = DATEADD(DAY, @tokenGecerlilikSuresi, GETDATE())

BEGIN TRANSACTION

IF @birdenCokOturumaIzinVer = 0
	BEGIN
	DELETE FROM TBL_KULLANICI_GIRIS WHERE refKullanici = @refKullanici AND [Platform] = @platform 
	END

INSERT INTO TBL_KULLANICI_GIRIS (refKullanici, Token, TokenExpireTime, IpAddress, Port, [Platform], PlatformToken, DeviceId, UserAgent)
	VALUES (@refKullanici, @token, @tokenExpireTime, @ipAddress, @port, @platform, @platformToken, @deviceId, @userAgent)

DECLARE @refGiris bigint = SCOPE_IDENTITY()

INSERT INTO TBL_KULLANICI_GIRIS_LOG (Id, refKullanici, Token, TokenExpireTime, IpAddress, Port, [Platform], PlatformToken, UserAgent)
	VALUES (@refGiris, @refKullanici, @token, @tokenExpireTime, @ipAddress, @port, @platform, @platformToken, @userAgent)

COMMIT TRANSACTION

SELECT TOP 1 *, 'SUCCEED' as Result, @token as Token
	FROM V_KULLANICI
	WHERE Id = @refKullanici
	  AND Aktif = 1

SELECT y.Id, y.Action, y.Controller, y.Label, y.[Platform]
	FROM TBL_KULLANICI k
		RIGHT OUTER JOIN TBL_KULLANICI_GRUP_YETKI gy ON k.refKullaniciGrup = gy.refKullaniciGrup
		RIGHT OUTER JOIN TBL_YETKI y ON gy.refYetki = y.Id
	WHERE k.Id = @refKullanici AND y.[Platform]=@platform

END
 


GO
/****** Object:  StoredProcedure [dbo].[sp_kullanici_grup_detay]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_kullanici_grup_detay]
	@refKullanici bigint,
	@kullaniciGrupId bigint
AS
BEGIN

SELECT Id, Ad, LoginRedirectUrl, Silinemez, RecordTime
	FROM TBL_KULLANICI_GRUP 
	WHERE Id = @kullaniciGrupId

SELECT y.Id, y.[Action], y.Controller, y.Platform, y.Label
	FROM TBL_KULLANICI_GRUP_YETKI gy, TBL_YETKI y
	WHERE gy.refKullaniciGrup = @kullaniciGrupId
	  AND gy.refYetki = y.Id

END










GO
/****** Object:  StoredProcedure [dbo].[sp_kullanici_grup_guncelle]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_kullanici_grup_guncelle]
	@refKullanici bigint,
	@refKullaniciGrup bigint,
	@ad nvarchar(250),
	@loginRedirectUrl nvarchar(500),
	@silinemez bit,
	@xml ntext
AS
BEGIN
SET XACT_ABORT ON

IF EXISTS (SELECT TOP 1 * FROM TBL_KULLANICI_GRUP WHERE Id != @refKullaniciGrup AND Ad = @ad)
	BEGIN
	SELECT 'ALREADY_EXISTS' as Result
	RETURN
	END

DECLARE @ixml int

--Create an internal representation of the XML document.
EXEC sp_xml_preparedocument @ixml OUTPUT, @xml

/*
<ROOT>
	<R id="bigint" />
</ROOT>
*/

SELECT [Id] as [Id]
	INTO #YETKI
	FROM OPENXML (@ixml, '/ROOT/R', 1)
	WITH ([Id] bigint '@id');

--Remove internal representation
EXEC sp_xml_removedocument @ixml;

BEGIN TRANSACTION

UPDATE TBL_KULLANICI_GRUP SET Ad = @ad, LoginRedirectUrl = @loginRedirectUrl ,Silinemez = @silinemez WHERE Id = @refKullaniciGrup

DELETE FROM TBL_KULLANICI_GRUP_YETKI WHERE refKullaniciGrup = @refKullaniciGrup

INSERT INTO TBL_KULLANICI_GRUP_YETKI (refKullaniciGrup, refYetki)
	SELECT @refKullaniciGrup, Id
		FROM #YETKI

COMMIT TRANSACTION

SELECT 'SUCCEED' as Result

END










GO
/****** Object:  StoredProcedure [dbo].[sp_kullanici_grup_listesi]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_kullanici_grup_listesi] 
	@refKullanici bigint
AS
BEGIN

SELECT Id, Ad, LoginRedirectUrl, RecordTime, Silinemez
	FROM TBL_KULLANICI_GRUP 

END










GO
/****** Object:  StoredProcedure [dbo].[sp_kullanici_grup_olustur]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_kullanici_grup_olustur]
	@refKullanici bigint,
	@ad nvarchar(250),
	@loginRedirectUrl nvarchar(500),
	@silinemez bit,
	@xml ntext
AS
BEGIN
SET XACT_ABORT ON

IF EXISTS (SELECT TOP 1 * FROM TBL_KULLANICI_GRUP WHERE Ad = @ad)
	BEGIN
	SELECT 'ALREADY_EXISTS' as Result
	RETURN
	END

DECLARE @ixml int

--Create an internal representation of the XML document.
EXEC sp_xml_preparedocument @ixml OUTPUT, @xml

/*
<ROOT>
	<R id="bigint" />
</ROOT>
*/

SELECT [Id] as [Id]
	INTO #YETKI
	FROM OPENXML (@ixml, '/ROOT/R', 1)
	WITH ([Id] bigint '@id');

--Remove internal representation
EXEC sp_xml_removedocument @ixml;

BEGIN TRANSACTION

INSERT INTO TBL_KULLANICI_GRUP (Ad,LoginRedirectUrl, Silinemez) VALUES (@ad,@loginRedirectUrl, @silinemez)

DECLARE @refKullaniciGrup bigint = SCOPE_IDENTITY()

INSERT INTO TBL_KULLANICI_GRUP_YETKI (refKullaniciGrup, refYetki)
	SELECT @refKullaniciGrup, Id
		FROM #YETKI

COMMIT TRANSACTION

SELECT 'SUCCEED' as Result

END










GO
/****** Object:  StoredProcedure [dbo].[sp_kullanici_grup_sil]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_kullanici_grup_sil]
	@refKullanici bigint,
	@refKullaniciGrup bigint,
	@refKullaniciGrupHedef bigint = NULL
AS
BEGIN
SET XACT_ABORT ON

IF EXISTS (SELECT TOP 1 * FROM TBL_KULLANICI_GRUP WHERE Id = @refKullaniciGrup AND Silinemez = 1)
	BEGIN
	SELECT 'IN_USE' as Result
	RETURN
	END

BEGIN TRANSACTION

UPDATE TBL_KULLANICI SET refKullaniciGrup = @refKullaniciGrupHedef WHERE refKullaniciGrup = @refKullaniciGrup

DELETE FROM TBL_KULLANICI_GRUP WHERE Id = @refKullaniciGrup
DELETE FROM TBL_KULLANICI_GRUP_YETKI WHERE refKullaniciGrup = @refKullaniciGrup

COMMIT TRANSACTION	

SELECT 'SUCCEED' as Result

END










GO
/****** Object:  StoredProcedure [dbo].[sp_kullanici_guncelle]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_kullanici_guncelle]
	@refKullanici bigint,
	--@refId bigint,
	@kullaniciId bigint,
	@adSoyad nvarchar(250),
	@eposta nvarchar(250),
	@telefon nvarchar(250),
	@refKullaniciGrup bigint
AS
BEGIN
SET XACT_ABORT ON

BEGIN TRANSACTION

UPDATE TBL_KULLANICI 
	SET AdSoyad = @adSoyad, Eposta = @eposta, Telefon=@telefon, refKullaniciGrup = @refKullaniciGrup
	WHERE Id = @kullaniciId

COMMIT TRANSACTION

SELECT 'SUCCEED' as Result

END

--select * from TBL_KULLANICI
GO
/****** Object:  StoredProcedure [dbo].[sp_kullanici_listesi]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_kullanici_listesi]
	@refKullanici bigint
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT *
	FROM V_KULLANICI
	ORDER BY Id ASC

END










GO
/****** Object:  StoredProcedure [dbo].[sp_kullanici_olustur]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_kullanici_olustur]
	@refKullaniciGrup bigint,
	@adSoyad nvarchar(250), 
	@eposta nvarchar(255),
	@telefon nvarchar(12)= NULL,
	@parola nvarchar(32) 
AS
BEGIN
SET XACT_ABORT ON

IF EXISTS (SELECT TOP 1 * FROM TBL_KULLANICI WHERE Eposta = @eposta AND Silinmis = 0)
	BEGIN
	SELECT 'ALREADY_EXISTS' as Result
	RETURN
	END

BEGIN TRANSACTION

INSERT INTO [dbo].[TBL_KULLANICI]
           (
           [refKullaniciGrup]
           ,[AdSoyad]
           
           ,[Eposta]
           ,[Telefon]
           ,[Parola]
           ,[Aktif]
           ,[Silinmis]
           ,[RecordTime])
     VALUES
           (
           @refKullaniciGrup
           ,@adSoyad
           ,@eposta
           ,@telefon
           ,dbo.func_md5_salted(@parola)
           ,1
           ,0
           ,GETDATE())
		     
COMMIT TRANSACTION

SELECT 'SUCCEED' as Result

END


GO
/****** Object:  StoredProcedure [dbo].[sp_kullanici_parola_degistir]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_kullanici_parola_degistir]
	@refKullanici bigint,
	@kullaniciId bigint,
	--@eskiParola nvarchar(32),
	@yeniParola nvarchar(32)
AS
BEGIN
SET XACT_ABORT ON

/*
IF NOT EXISTS (SELECT TOP 1 * FROM TBL_KULLANICI WHERE Id = @kullaniciId AND Parola = dbo.func_md5_salted(@yeniParola))
	BEGIN
	SELECT 'WRONG_OLD_PASSWORD' as Result
	RETURN
	END
	*/

BEGIN TRANSACTION

UPDATE TBL_KULLANICI SET Parola = dbo.func_md5_salted(@yeniParola)
	WHERE Id = @kullaniciId

DELETE FROM TBL_KULLANICI_GIRIS WHERE refKullanici = @kullaniciId

COMMIT TRANSACTION

SELECT 'SUCCEED' as Result

END
  


GO
/****** Object:  StoredProcedure [dbo].[sp_kullanici_parola_guncelle]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_kullanici_parola_guncelle]
	@token nvarchar(100),
	@parola nvarchar(150)
	 
AS
BEGIN
SET XACT_ABORT ON

IF NOT EXISTS (SELECT TOP 1 * FROM TBL_KULLANICI_GIRIS WHERE Token = @token )
	BEGIN
	SELECT 'KILLING_TOKEN' as Result
	RETURN
	END
 


BEGIN TRANSACTION

DECLARE @refKullaniciId bigint
 SELECT TOP 1 @refKullaniciId = k.Id
	FROM TBL_KULLANICI k INNER JOIN TBL_KULLANICI_GIRIS g ON  k.Id = g.refKullanici AND g.Token = @token
	 
 update TBL_KULLANICI set Parola=dbo.func_md5_salted(@parola) where Id=@refKullaniciId

COMMIT TRANSACTION

SELECT 'SUCCEED' as Result

END


GO
/****** Object:  StoredProcedure [dbo].[sp_kullanici_sil]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_kullanici_sil]
	@refKullanici bigint,
	@kullaniciId bigint
AS
BEGIN
SET XACT_ABORT ON

DECLARE @refSubeYetkili bigint

BEGIN TRANSACTION

UPDATE TBL_KULLANICI SET Silinmis = 1 WHERE Id = @kullaniciId

IF @@ROWCOUNT > 0
	BEGIN

	DELETE FROM TBL_KULLANICI_GIRIS WHERE refKullanici = @kullaniciId
	END

COMMIT TRANSACTION

SELECT 'SUCCEED' as Result

END










GO
/****** Object:  StoredProcedure [dbo].[sp_token_and_auth_control]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_token_and_auth_control]
	@token nvarchar(100),
	@controller nvarchar(100),
	@action nvarchar(100),
	@type nvarchar(50) = NULL,
	@refId bigint = NULL
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

DECLARE @refKullanici bigint, @refKullaniciGrup bigint, @grupAd nvarchar(50), @platform nvarchar(20)

SELECT  @refKullanici = k.Id, @refKullaniciGrup = k.refKullaniciGrup, @grupAd = gr.Ad, @platform = [Platform]
	FROM TBL_KULLANICI k 
		INNER JOIN TBL_KULLANICI_GRUP gr ON k.refKullaniciGrup = gr.Id
		INNER JOIN TBL_KULLANICI_GIRIS g ON g.Token = @token AND g.refKullanici = k.Id AND TokenExpireTime > GETDATE()
	WHERE k.Aktif = 1

IF @refKullanici IS NULL -- Token gecerli degil
	BEGIN
	SELECT 'INVALID_TOKEN' as Result
	RETURN
	END

IF NOT EXISTS (SELECT TOP 1 * 
	FROM TBL_KULLANICI_GRUP_YETKI gy INNER JOIN TBL_YETKI y ON gy.refKullaniciGrup = @refKullaniciGrup AND gy.refYetki = y.Id
	WHERE y.[Platform] = UPPER(@platform)
		AND (y.[Controller] = '*' OR LOWER(y.[Controller]) = LOWER(@controller))
		AND (y.[Action] = '*' OR LOWER(y.[Action]) = LOWER(@action))) -- Yetkisi yok
	BEGIN
	SELECT 'NOT_AUTHORIZED' as Result
	RETURN
	END



IF @type IS NULL OR @type = ''
	BEGIN
	SELECT 'SUCCEED' as Result
	RETURN
	END



SELECT 'SUCCEED' as Result

END


GO
/****** Object:  StoredProcedure [dbo].[sp_token_control]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_token_control]
	@token nvarchar(100)  
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

DECLARE @refKullanici bigint, @refKullaniciGrup bigint, @grupAd nvarchar(50), @platform nvarchar(20)

SELECT  @refKullanici = k.Id, @refKullaniciGrup = k.refKullaniciGrup, @grupAd = gr.Ad, @platform = [Platform]
	FROM TBL_KULLANICI k 
		INNER JOIN TBL_KULLANICI_GRUP gr ON k.refKullaniciGrup = gr.Id
		INNER JOIN TBL_KULLANICI_GIRIS g ON g.Token = @token AND g.refKullanici = k.Id AND TokenExpireTime > GETDATE()
	WHERE k.Aktif = 1

IF @refKullanici IS NULL -- Token gecerli degil
	BEGIN
	SELECT 'INVALID_TOKEN' as Result
	RETURN
	END

  

SELECT 'SUCCEED' as Result

END


GO
/****** Object:  StoredProcedure [dbo].[sp_yetki_listesi]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_yetki_listesi]
	@refKullanici bigint
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT Id, [Platform], [Controller], [Action], [Label]
	FROM TBL_YETKI
	ORDER BY [Platform], [Controller], [Action] ASC

END



GO
/****** Object:  StoredProcedure [dbo].[sp_yetki_olustur]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_yetki_olustur]
	@refKullanici bigint,
	@platform nvarchar(50),
	@controller nvarchar(100),
	@action nvarchar(100),
	@label nvarchar(200)
AS
BEGIN
SET XACT_ABORT ON

IF EXISTS (SELECT TOP 1 * FROM TBL_YETKI WHERE [Platform] = @platform AND Controller = @controller AND [Action] = @action)
	BEGIN
	SELECT 'ALREADY_EXISTS' as Result
	RETURN
	END

BEGIN TRANSACTION

INSERT INTO TBL_YETKI ([Platform], Controller, [Action], [Label])
	VALUES (@platform, @controller, @action, @label)

COMMIT TRANSACTION

SELECT 'SUCCEED' as Result

END










GO
/****** Object:  StoredProcedure [dbo].[sp_yetki_sil]    Script Date: 23.07.2020 23:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_yetki_sil]
	@refKullanici bigint,
	@refYetki bigint
AS
BEGIN
SET XACT_ABORT ON

BEGIN TRANSACTION

DELETE FROM TBL_KULLANICI_GRUP_YETKI WHERE refYetki = @refYetki
DELETE FROM TBL_YETKI WHERE Id = @refYetki

COMMIT TRANSACTION

SELECT 'SUCCEED' as Result

END










GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "k"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 214
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "kg"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 177
               Right = 420
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
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_KULLANICI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_KULLANICI'
GO
