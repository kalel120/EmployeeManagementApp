USE [master]
GO
/****** Object:  Database [EmployeeManagementDB]    Script Date: 01-Feb-16 3:00:45 AM ******/
CREATE DATABASE [EmployeeManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EmployeeManagementDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EmployeeManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EmployeeManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EmployeeManagementDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EmployeeManagementDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 01-Feb-16 3:00:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 01-Feb-16 3:00:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Gender] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Depratment] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201601310654422_version1', N'HTMLHelperAnnotationApp.Migrations.Configuration', 0x1F8B0800000000000400CD58CD6EE33610BE17E83B083AB540D68C9D4B1BC8BBF0DA4937689C04ABECDE6971EC10A54895A452FBD9F6D047EA2B74A87F4BB623C7DDA0081058A3996F7E34FC66A47FBEFD1D7C58C7C27B066DB892637F3838F73D9091625CAEC67E6A97EF7EF13FBCFFF187E08AC56BEF6BA977E1F4D0529AB1FF646D724988899E20A66610F3482BA3967610A99850A6C8E8FCFC57321C1240081FB13C2FF89C4ACB63C82EF072AA6404894DA9982B06C21472BC1366A8DE1D8DC1243482B1FFE9717EFB0944027A22A5B2D46240932419E496BE37119C62542188A5EFD14AE5F28B81D06A25576182022A1E3709A0DE920A03452E97B57ADFB4CE472E2D521B9650516AAC8A8F041C5E1475226DF35755DBAFEA8895BCC28ADB8DCB3AABE6D8BF8A13A13680C9B79D5D4E85768A2F157B50429C797B14CFAA96C1CE727F67DE341536D53096905A4DC599F7902E048F7E87CDA3FA03E458A6423403C7D0F1DE9600450F5AA12FBBF90CCB229D1BE67B64DB8EB40D2BB3864D9EE88DB41723DFBB43E77421A0EA8B465142AB34FC061234B5C01EA8B5A0A5C380ACB21DEF2D5FEE7FE90D1B11CF97EFCDE9FA16E4CA3E8DFD111EA86BBE06560A8A00BE488EA7116DAC4E614780879D5EC5948B035EF1E7F7708B5562A0DFDEEF84310DC61C2CF377A9F30C12EC8A183BE1ED937EA0C6FCA5347B7BCF48DB4BAEE3B70A2020358775990D83B194E3E9DCA6B7D9477703D67607CDE1482898CE14016CA79B0387605B8C890D5647928F9A41CDA6BB42AE82AB271BC9475B3902C99E1918CC699260391B33B19078613E10A7EFC2E3A7439C6390C8EC181255B49527A43EBA82D65DD7000CAEB93676462D5D50F7C0A62CEEA8751EC59E3297EEDAD56E937F5DFCD2C2FDCEAD7A4EAC36665DD66BCCD41DE42C69A8626BCCCB8E69B6A75041F58EF13255228DE5BE1175C83A1F184DFB5CD21FA160FF264421EA8F51527913A494F547A988B9095309FBE33479B609D594F747AB89AB89554BFB237598B009D8B9D9C50D48ABFBDA2D4F3A3DDF5A75DA87E81009B5552AEF1519B548272808E0E5EDBCC308B98AEF61C19E39736C106E8C8578E01406E19F622A78F6D84A8539957C09C6E6DB200EECE1A8B5D4FF7F166C620C133DB7EC375F69B9ABEA8B4BEB9123BFB9C5CA67AAA327AA3B7BEC294B6A09FA534CD73F9FB8789E86D55A26F7647B7CBADD5DF1B438DBEBD769687B76BA63408FDBD3BA3B44BF25ECE00E96B3CED8670B8519E49136B6B757AE685D160C48F34B463003C3573584FBAE212172F45283963A3772A9CADA6376CD884A95D6A39983A50C8B34D1962F6964F176840D9AEDDA5FA948B31C17C06EE47D6A93D44E8C817821B6DE4C0372D87FB6876EC71CDC27EECAFC172960981C53807BF931E58255715FEFE8A23D10AE5F0A42C3A8F05D03E1569B0AE94EC99E4045F9F0383AD290F611B04110CCDCCB903EC36B62C3178A5B58D168530EB3FD202F3F88EDB207334E579AC6A6C0A8EDDDD739E23ECFBDFF17C0B51063D0130000, N'6.1.3-40302')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201601310659432_version2', N'HTMLHelperAnnotationApp.Migrations.Configuration', 0x1F8B0800000000000400CD58DB6EE336107D2FD07F10F4D4025933765EDA40DE85D74EBA41E3245865F79D96C60E518A54492AB5BF6D1FFA49FD850E7537653B72B209160182989A3973D1F0CC71FEFBF66FF0619D70EF119466528CFDE1E0D4F7404432666235F633B37CF79BFFE1FDCF3F051771B2F6BE567667D60E3D851EFB0FC6A4E784E8E80112AA07098B94D4726906914C088D25199D9EFE4E86430208E12396E7059F33615802F907FC38952282D46494CF650C5C97E7F824CC51BD1B9A804E690463FFD3FDFCFA13F014D4440869A8C18426693A283C7D6FC219C5AC42E04BDFA3B5C9F9170DA15152ACC2140F28BFDFA480764BCA3594B59C37E67DCB3A1DD9B248E35841459936323912707856F689B8EECFEAB65FF7113B79811D371B5B75DECDB17F91A45C6E008B77839D4FB9B2864F357B50419C787B0C4FEA91C1C9B23F27DE34E326533016901945F98977972D388BFE84CDBDFC0BC458649CB713C7D4F1D9D6011EDD2989B1CCE6332CCB72AE62DF23DB7EC475ACDD5A3E45A157C29C8D7CEF0683D305877A2E5A4D098D54F0070850D4407C478D01252C06E49DED447762D9DF55341C44BC5FBE37A7EB6B102BF330F64778A12ED91AE2EAA04CE08B60781BD1C7A80C76247838E84542193F1015FF7C8DB0D8A518D4DBC79DC4B102AD0FB6F955FA3C8314A722C14978FBA2EFA8D6FF4815BF76E4803414D22516A47043195E8E6D76997DB40F606D76B00C32724934BA4C60BBCE023804E31016BEDF269382E9070D99ED4AB94EAE592CA4D82CD506227B565030A7698AED6CADA4F2C40B8B7D347D171E4FCE49814122BD83A3EB6CEB48C83C7405CE530C8D995E32A5CD8C1ABAA0F6854DE3A463D679157BDA5C8573BBED726FD3FCCAC3FE5D78F55C182E66D3D64BACD4DEA3BC68A8736BADAB8E6B2E1328A76A07BB4F25CF12B16F431CF22EF8BAED5F9CF44728C9B70D511EF5C7A898B40D529DF547A979B10D531FF6C769D35C1BAA7DDE1FAD21AE365673DA450A883325EE6892CE6C3A8AC01DF64364E19AD4D16BD270C821282FEAD322B673730B13DFC3163DB2D8DEDA70A30D24036B3008FFE653CEF2F65606732AD812B4294413EEB5E1C8D1BE3F8E0E255AC7BCA7187D73E5C76C579FD47647EEE4B6D8138F54450F5475E4DE4BB45C05FA4B42D7BFBE509FBD0CCBD15C7BAA3DBEDCAEA47A599EAE4C3A06ED38E9D35DCBFD74CD41595310C4D88F17122B28326D09A267AA9E2E6105A4FDDD3C988166AB06C27E531710592668402B9B2BB19455D3B1BA76469589F34EE660688C4D9A28C3963432F838C259CAE5EB57CAB3BCC605C457E236336966265A43B2E05BDFB50272387E2EEDB6730E6E53FB497F8F12304D8625C0ADF898311ED7795FEE98A23D10765E4AEEC1AC50BE23DC6A5323DD48D113A86C1FDE1C7BBF85B9071C1004D3B722A48FF09CDC50A35FC38A469B6AEFEC0779FA456CB73D9831BA5234D12546E36FFFDF44EC3F9CDEFF0F74C6A9A4A2120000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Name], [Email], [Gender], [Address], [Depratment], [Password]) VALUES (1, N'Imran', N'imran47ddr5@gmail.com', N'Male', N'Mirpur-10, Dhaka', N'SR', N'1234')
INSERT [dbo].[Employees] ([Id], [Name], [Email], [Gender], [Address], [Depratment], [Password]) VALUES (3, N'Istiak', N'istiak47@gmail.com', N'Male', N'Dhaka', N'HR', N'345')
SET IDENTITY_INSERT [dbo].[Employees] OFF
USE [master]
GO
ALTER DATABASE [EmployeeManagementDB] SET  READ_WRITE 
GO
