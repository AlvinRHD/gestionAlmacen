USE [master]
GO
/****** Object:  Database [Gestion_Eventos]    Script Date: 07/04/2024 17:35:40 ******/
CREATE DATABASE [Gestion_Eventos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gestion_Eventos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.U20210358\MSSQL\DATA\Gestion_Eventos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gestion_Eventos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.U20210358\MSSQL\DATA\Gestion_Eventos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Gestion_Eventos] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gestion_Eventos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gestion_Eventos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gestion_Eventos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gestion_Eventos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Gestion_Eventos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gestion_Eventos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET RECOVERY FULL 
GO
ALTER DATABASE [Gestion_Eventos] SET  MULTI_USER 
GO
ALTER DATABASE [Gestion_Eventos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gestion_Eventos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gestion_Eventos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gestion_Eventos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gestion_Eventos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Gestion_Eventos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Gestion_Eventos', N'ON'
GO
ALTER DATABASE [Gestion_Eventos] SET QUERY_STORE = ON
GO
ALTER DATABASE [Gestion_Eventos] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Gestion_Eventos]
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 07/04/2024 17:35:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evento](
	[Id_Evento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Evento] [varchar](100) NOT NULL,
	[Descripcion_Evento] [varchar](100) NOT NULL,
	[Duracion_Evento] [time](7) NOT NULL,
	[Fk_Lugar] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invitado]    Script Date: 07/04/2024 17:35:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invitado](
	[Id_Invitado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Invitado] [varchar](100) NOT NULL,
	[Telefono] [varchar](100) NOT NULL,
	[Asistencia] [varchar](100) NOT NULL,
	[Fk_Evento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Invitado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lugar]    Script Date: 07/04/2024 17:35:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lugar](
	[Id_Lugar] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Lugar] [varchar](100) NOT NULL,
	[Direccion_Lugar] [varchar](100) NOT NULL,
	[Capacidad_Lugar] [int] NOT NULL,
	[Disponible_Lugar] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Lugar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 07/04/2024 17:35:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[Id_Reserva] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_Reserva] [date] NOT NULL,
	[Fk_Lugar] [int] NOT NULL,
	[Fk_Evento] [int] NOT NULL,
	[Fk_Invitado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Evento] ON 

INSERT [dbo].[Evento] ([Id_Evento], [Nombre_Evento], [Descripcion_Evento], [Duracion_Evento], [Fk_Lugar]) VALUES (1, N'Concierto en Vivo', N'Concierto de música en vivo', CAST(N'19:00:00' AS Time), 1)
INSERT [dbo].[Evento] ([Id_Evento], [Nombre_Evento], [Descripcion_Evento], [Duracion_Evento], [Fk_Lugar]) VALUES (2, N'Conferencia de Tecnología', N'Conferencia sobre las últimas tecnologías', CAST(N'10:00:00' AS Time), 2)
INSERT [dbo].[Evento] ([Id_Evento], [Nombre_Evento], [Descripcion_Evento], [Duracion_Evento], [Fk_Lugar]) VALUES (3, N'Fiesta de Cumpleaños', N'Celebración de cumpleaños', CAST(N'20:00:00' AS Time), 3)
INSERT [dbo].[Evento] ([Id_Evento], [Nombre_Evento], [Descripcion_Evento], [Duracion_Evento], [Fk_Lugar]) VALUES (10, N'Conferencia de Tecnología', N'Conferencia sobre las últimas tecnologías', CAST(N'02:00:00' AS Time), 2)
INSERT [dbo].[Evento] ([Id_Evento], [Nombre_Evento], [Descripcion_Evento], [Duracion_Evento], [Fk_Lugar]) VALUES (11, N'Fiesta de Cumpleaños', N'Celebración de cumpleaños', CAST(N'04:00:00' AS Time), 3)
SET IDENTITY_INSERT [dbo].[Evento] OFF
GO
SET IDENTITY_INSERT [dbo].[Invitado] ON 

INSERT [dbo].[Invitado] ([Id_Invitado], [Nombre_Invitado], [Telefono], [Asistencia], [Fk_Evento]) VALUES (1, N'toto', N'454545', N'si', 1)
INSERT [dbo].[Invitado] ([Id_Invitado], [Nombre_Invitado], [Telefono], [Asistencia], [Fk_Evento]) VALUES (2, N'María González', N'987654321', N'Confirmada', 2)
INSERT [dbo].[Invitado] ([Id_Invitado], [Nombre_Invitado], [Telefono], [Asistencia], [Fk_Evento]) VALUES (3, N'Carlos Martínez', N'555555555', N'Confirmada', 3)
INSERT [dbo].[Invitado] ([Id_Invitado], [Nombre_Invitado], [Telefono], [Asistencia], [Fk_Evento]) VALUES (4, N'Leo', N'43423', N'presente', 10)
SET IDENTITY_INSERT [dbo].[Invitado] OFF
GO
SET IDENTITY_INSERT [dbo].[Lugar] ON 

INSERT [dbo].[Lugar] ([Id_Lugar], [Nombre_Lugar], [Direccion_Lugar], [Capacidad_Lugar], [Disponible_Lugar]) VALUES (1, N'Casa de Rene', N'Calle bolivar', 24, 0)
INSERT [dbo].[Lugar] ([Id_Lugar], [Nombre_Lugar], [Direccion_Lugar], [Capacidad_Lugar], [Disponible_Lugar]) VALUES (2, N'Sala de Conferencias', N'Avenida Central 456', 50, 0)
INSERT [dbo].[Lugar] ([Id_Lugar], [Nombre_Lugar], [Direccion_Lugar], [Capacidad_Lugar], [Disponible_Lugar]) VALUES (3, N'Terraza', N'Paseo del Sol 789', 80, 1)
SET IDENTITY_INSERT [dbo].[Lugar] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserva] ON 

INSERT [dbo].[Reserva] ([Id_Reserva], [Fecha_Reserva], [Fk_Lugar], [Fk_Evento], [Fk_Invitado]) VALUES (3, CAST(N'2024-03-15' AS Date), 1, 1, 1)
INSERT [dbo].[Reserva] ([Id_Reserva], [Fecha_Reserva], [Fk_Lugar], [Fk_Evento], [Fk_Invitado]) VALUES (4, CAST(N'2024-04-20' AS Date), 2, 2, 2)
INSERT [dbo].[Reserva] ([Id_Reserva], [Fecha_Reserva], [Fk_Lugar], [Fk_Evento], [Fk_Invitado]) VALUES (5, CAST(N'2024-05-10' AS Date), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Reserva] OFF
GO
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD FOREIGN KEY([Fk_Lugar])
REFERENCES [dbo].[Lugar] ([Id_Lugar])
GO
ALTER TABLE [dbo].[Invitado]  WITH CHECK ADD FOREIGN KEY([Fk_Evento])
REFERENCES [dbo].[Evento] ([Id_Evento])
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD FOREIGN KEY([Fk_Evento])
REFERENCES [dbo].[Evento] ([Id_Evento])
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD FOREIGN KEY([Fk_Invitado])
REFERENCES [dbo].[Invitado] ([Id_Invitado])
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD FOREIGN KEY([Fk_Lugar])
REFERENCES [dbo].[Lugar] ([Id_Lugar])
GO
USE [master]
GO
ALTER DATABASE [Gestion_Eventos] SET  READ_WRITE 
GO
