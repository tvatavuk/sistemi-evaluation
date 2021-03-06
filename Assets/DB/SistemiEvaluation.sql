USE [master]
GO
/****** Object:  Database [SistemiEvaluation]    Script Date: 13.2.2017. 7:10:47 ******/
CREATE DATABASE [SistemiEvaluation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemiEvaluation', FILENAME = N'd:\Materijali\Sistemi\Evaluation\Dev\Data\SistemiEvaluation.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SistemiEvaluation_log', FILENAME = N'd:\Materijali\Sistemi\Evaluation\Dev\Data\SistemiEvaluation_log.ldf' , SIZE = 1856KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SistemiEvaluation] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemiEvaluation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemiEvaluation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemiEvaluation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemiEvaluation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SistemiEvaluation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemiEvaluation] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SistemiEvaluation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET RECOVERY FULL 
GO
ALTER DATABASE [SistemiEvaluation] SET  MULTI_USER 
GO
ALTER DATABASE [SistemiEvaluation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemiEvaluation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemiEvaluation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemiEvaluation] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SistemiEvaluation] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SistemiEvaluation', N'ON'
GO
ALTER DATABASE [SistemiEvaluation] SET QUERY_STORE = OFF
GO
USE [SistemiEvaluation]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SistemiEvaluation]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 13.2.2017. 7:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 13.2.2017. 7:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 13.2.2017. 7:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 13.2.2017. 7:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 13.2.2017. 7:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 13.2.2017. 7:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 13.2.2017. 7:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 13.2.2017. 7:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 13.2.2017. 7:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 13.2.2017. 7:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[LinkText] [nvarchar](max) NOT NULL,
	[LinkUrl] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170209132012_PrvaMigracija', N'1.1.0-rtm-22752')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170209133009_ContentAndSlider', N'1.1.0-rtm-22752')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170210085259_ContentChange', N'1.1.0-rtm-22752')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170211193909_ImagePropUnutarCOntentaDOdan', N'1.1.0-rtm-22752')
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([Id], [Description], [Title], [Image]) VALUES (1, N'<p>…is at the core of many of our web implementations. It is one of the best CMS solutions on the Microsoft platform since 2003. Key characteristics of DNN CMS are security, scalability, modularity and simplicity in everyday use. All of those are tested and proved in numerous projects we delivered so far.</p>', N'DNN CMS', N'/images/logo-dnn-platform.png')
INSERT [dbo].[Content] ([Id], [Description], [Title], [Image]) VALUES (2, N'<p>We used DNN CMS application for developing several news portals for the biggest local newspaper publishing company Slobodna Dalmacija.  All of these portals are built on single DNN installation and share same custom developed modules. Each portal is integrated with internal editorial system used for publishing daily newspaper editions. This integration enables journalists to write their articles in internal editorial system and submit it directly to the internet news portals. Developing this project, we used Origami grid responsive flexbox based grid system which is originally developed for Financial Times news portal. This grid system gives us better performance, scalability and efficiency then other widely used responsive systems, mostly because it is written in Sass/Scss.<br><a href="http//www.slobodnadalmacija.hr" title="Slobodna Dalmacija news portal" target="_blank">www.slobodnadalmacija.hr</a>, <a href="http://www.dubrovacki.hr" title="Dubrovnik news portal " target="_blank">www.dubrovacki.hr</a>, <a href="http://www.zadarski.hr" title="Zadar news portal" target="_blank">www.zadarski.hr</a>, <a href="http://www.sibenski.hr" title="Sibenik news portal" target="_blank">www.sibenski.hr</a></p>', N'News portal solution and integration with editorial system for Slobodna Dalmacija.', N'/images/reference-slobodna-dalmacija.jpg')
INSERT [dbo].[Content] ([Id], [Description], [Title], [Image]) VALUES (3, N'<p>Our clients Mazda Central and South East Europe and Mazda Croatia requested a challenging project which consisted of three main parts:</p>
<ul>
<li>building dealer websites for all Mazda dealers in Croatia, Serbia, Bosnia, Montenegro and Greece markets,</li>
<li>developing web scrape tool for gathering website content from Mazda Europe central CMS (EpiServer) and importing gathered content in dealer websites built with DNN CMS,</li>
<li>developing replication engine for propagating content on all dealer websites in DNN CMS application.</li>
</ul>
<p>Final result enables Mazda CSEE automated content delivery to local dealer''s websites and replication from one CMS (EpiServer) used for Mazda Europe market central web sites, to individual dealer''s websites developed in DNN CMS.</p>
<p><a title="Mazda Serbia central dealer website" href="http://www.mazda-rs.com" target="_blank">www.mazda-rs.com</a>, <a title="Mazda Bosnia central website" href="http://www.mazda.ba" target="_blank">www.mazda.ba</a> , <a title="Mazda Greece central website" href="http://www.mazda-gr.com" target="_blank">www.mazda-gr.com</a> , <a title="Mazda Croatia dealer Habulin" href="http://habulin.mazda.hr" target="_blank">habulin.mazda.hr</a>, <a title="Mazda Croatia dealer Jurkovic" href="http://jurkovic.mazda.hr" target="_blank">jurkovic.mazda.hr</a> ,</p>
', N'Central solution for Mazda dealer''s websites', N'/images/reference-mazda.jpg')
INSERT [dbo].[Content] ([Id], [Description], [Title], [Image]) VALUES (4, N'<p>Scope of the project was development of three websites:</p>
<ul>
<li><a title="Croatian national theater Split web site" href="http://www.hnk-split.hr" target="_blank">www.hnk-split.hr</a> - main portal for Croatian national theater Split</li>
<li><a title="Split Summer festival web site" href="http://www.splitsko-ljeto.hr" target="_blank">www.splitsko-ljeto.hr</a> - the website of Split Summer Festival (annual event)</li>
<li>marulicevidani.hnk-split.hr - the website of Days of Marulic (annual event)</li>
</ul>
<p>All sites are implemented in a single instance of DNN CMS application. That enables easy connectivity and content sharing between sites. The backbone of solution is the central module for theatre''s articles and events. All articles and events are entered into the central module, and then displayed on various portals depending on the type of article or event.</p>
', N'Responsive website for Croatian national theater Split', N'/images/reference-hnk-split.jpg')
INSERT [dbo].[Content] ([Id], [Description], [Title], [Image]) VALUES (5, N'<p>We are located in Split, Croatia (Europe). Office address: Velebitska 27 / second floor.</p>', N'Our location', N'/images/2017-02-12_11-07-35-_Blog_retrospektiva_2016.jpg')
INSERT [dbo].[Content] ([Id], [Description], [Title], [Image]) VALUES (8, N'<p>Through three departments Sistemi.hr covers a wide array of services. The mutual interaction between the departments enables us to offer our clients various projects on a "turnkey" principle.</p>
<p>Services we provide to our clients are:</p>
<ul>
<li>Development of mobile and web applications</li>
<li>Web sites and web shop development in various scenarios and cases</li>
<li>User interface and user experience (UI/UX) design and consultancy</li>
<li>Hosting and system administration</li>
</ul>
<p>Used technologies:</p>
<ul>
<li>HTML5, CSS3</li>
<li>CSS frameworks:
<ul>
<li><a href="http://getbootstrap.com/">Bootstrap 3</a></li>
<li><a href="https://v4-alpha.getbootstrap.com/">Bootstrap 4</a></li>
<li><a href="https://github.com/Financial-Times/o-grid">Origami grid</a></li>
</ul>
</li>
<li>CSS Preprocessors:
<ul>
<li><a href="http://sass-lang.com/">Sass/Scss</a></li>
<li><a href="http://lesscss.org/">Less</a></li>
</ul>
</li>
<li>JavaScript frameworks:
<ul>
<li><a href="https://angular.io/">Angular</a></li>
<li><a href="https://jquery.com/">jQuery</a></li>
<li><a href="https://jquerymobile.com/">jQuery mobile</a></li>
<li><a href="http://www.telerik.com/kendo-ui">KendoUI</a></li>
</ul>
</li>
<li>Hybrid mobile application development:
<ul>
<li><a href="http://phonegap.com/">Adobe PhoneGap</a></li>
<li><a href="https://cordova.apache.org/">Apache Cordova</a></li>
<li><a href="http://www.telerik.com/platform/appbuilder">Telerik AppBuilder</a></li>
</ul>
</li>
<li>Backend development:
<ul>
<li><a href="https://en.wikipedia.org/wiki/ASP.NET_Core">ASP.NET Core</a></li>
<li><a href="https://en.wikipedia.org/wiki/ASP.NET_MVC">ASP.NET MVC</a></li>
<li><a href="https://www.asp.net/web-api">ASP.NET Web API</a></li>
<li><a href="https://www.asp.net/web-forms">ASP.NET Web Forms</a></li>
</ul>
</li>
<li>CMS &amp; webs hop solutions:
<ul>
<li><a href="http://www.dnnsoftware.com">DNN Platform CMS</a></li>
<li><a href="http://www.nopcommerce.com/">nopCommerce</a></li>
</ul>
</li>
</ul>', N'Services', NULL)
INSERT [dbo].[Content] ([Id], [Description], [Title], [Image]) VALUES (9, N'<div style="text-align:center;">
<p>Main phone: <br />  <a href="tel:+38521555888"><strong>+385 21 555 888</strong></a></p>
<p>Fax:<br /> <a href="fax:+38521555880"><strong>+385 21 555 880</strong></a></p>
<p>Address:<br /> <strong>Velebitska 27 (second floor), 21000 Split, Croatia</strong></p>
<p>E-mail:<br /> <a href="mailto:info@sistemi.hr"><strong>info@sistemi.hr</strong></a></p>
<p>Web:<br /> <a title="Sistemi.hr website" href="http://www.sistemi.hr" target="_blank"><strong>www.sistemi.hr</strong></a></p>
<p>Facebook:<br /> <a title="Sistemi.hr Facebook page" href="http://www.facebook.com/sistemihr" target="_blank"><strong>www.facebook.com/sistemihr</strong></a></p>
<p>Twitter:<br /> <a title="Sistemi.hr Twitter page" href="https://twitter.com/sistemihr" target="_blank"><strong>twitter.com/sistemihr</strong></a></p>
<p>LinkedIn:<br /> <a title="Sistemi.hr LinkedIn page" href="http://www.linkedin.com/company/netmedia-sistemi" target="_blank"><strong>www.linkedin.com/company/netmedia-sistemi</strong></a></p>
</div>', N'Contact', NULL)
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([Id], [Description], [Image], [LinkText], [LinkUrl], [Title]) VALUES (2, N'<p>Between our company''s departments, we combine a wide array of knowledge in the area of web, mobile and network technologies. With this knowledge, we provide complete service of IT solutions at one place.</p>', N'/images/slide-services.jpg', N'More', N'https://www.sistemi.hr/usluge', N'At your service…')
INSERT [dbo].[Slider] ([Id], [Description], [Image], [LinkText], [LinkUrl], [Title]) VALUES (3, N'<p>Years of successful work (since 1996), attention to detail and care about the client''s wishes, have enabled us to achieve extensive and diverse clients list we have today.</p>', N'/images/slide-projects.jpg', N'More', N'https://www.sistemi.hr/projekti', N'Our projects…')
INSERT [dbo].[Slider] ([Id], [Description], [Image], [LinkText], [LinkUrl], [Title]) VALUES (6, N'<p>We are a company specializing in the development of: mobile applications, interface design, website and web shop solutions.</p>
', N'/images/slide-aboutus.jpg', N'More', N'https://www.sistemi.hr/o-nama', N'To go where no man has gone before …')
SET IDENTITY_INSERT [dbo].[Slider] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 13.2.2017. 7:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 13.2.2017. 7:10:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 13.2.2017. 7:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 13.2.2017. 7:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 13.2.2017. 7:10:48 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 13.2.2017. 7:10:48 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 13.2.2017. 7:10:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [SistemiEvaluation] SET  READ_WRITE 
GO
