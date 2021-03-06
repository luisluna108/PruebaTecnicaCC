USE [master]
GO
/****** Object:  Database [PruebaTecnicaCC]    Script Date: 2/3/2021 18:54:35 ******/
CREATE DATABASE [PruebaTecnicaCC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PruebaTecnicaCC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PruebaTecnicaCC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PruebaTecnicaCC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PruebaTecnicaCC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PruebaTecnicaCC] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PruebaTecnicaCC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PruebaTecnicaCC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET ARITHABORT OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PruebaTecnicaCC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PruebaTecnicaCC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PruebaTecnicaCC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PruebaTecnicaCC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PruebaTecnicaCC] SET  MULTI_USER 
GO
ALTER DATABASE [PruebaTecnicaCC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PruebaTecnicaCC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PruebaTecnicaCC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PruebaTecnicaCC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PruebaTecnicaCC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PruebaTecnicaCC] SET QUERY_STORE = OFF
GO
USE [PruebaTecnicaCC]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 2/3/2021 18:54:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[FechaNacimiento] [datetime] NULL,
	[Genero] [bit] NULL,
	[IdMateria] [int] NULL,
 CONSTRAINT [PK_Alumnos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 2/3/2021 18:54:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[FechaInscripcion] [date] NULL,
	[FinalCurso] [date] NULL,
	[DuracionCurso] [int] NULL,
 CONSTRAINT [PK_Materias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumnos] ON 
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (1, N'Juan', N'Perez', CAST(N'2000-08-10T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (2, N'Juana', N'Lopez', CAST(N'2000-02-12T00:00:00.000' AS DateTime), 1, 2)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (3, N'Juana', N'Lopez', CAST(N'2000-02-12T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (4, N'Rex', N'Luna', CAST(N'2012-10-10T00:00:00.000' AS DateTime), 1, 2)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (5, N'Azlam', N'Luna', CAST(N'2021-02-24T00:00:00.000' AS DateTime), 1, 2)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (6, N'Cheu', N'Rodriguez', CAST(N'2021-02-01T00:00:00.000' AS DateTime), 1, 2)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (7, N'Chepe', N'Cuarto', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (8, N'Monica', N'Linares', CAST(N'2021-02-02T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (9, N'Toño', N'Consuegro', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (10, N'Toña', N'Canales', CAST(N'2021-02-02T00:00:00.000' AS DateTime), 1, 2)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (11, N'Luis', N'Luna', CAST(N'2021-02-10T00:00:00.000' AS DateTime), 1, 2)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (12, N'Toti', N'Chuky', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (13, N'Chela', N'Gracx', CAST(N'2021-02-10T00:00:00.000' AS DateTime), 0, 2)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (14, N'Chela', N'Gracx', CAST(N'2021-02-10T00:00:00.000' AS DateTime), 0, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (15, N'Lans', N'Rodro', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (16, N'Luis', N'Luna', CAST(N'2021-02-03T00:00:00.000' AS DateTime), 1, 2)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (17, N'Azlam', N'Rod', CAST(N'2010-01-10T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (22, N'Toni', N'Kross', CAST(N'2021-02-15T00:00:00.000' AS DateTime), 1, 3)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (23, N'Jennifer', N'Lopez', CAST(N'1997-01-28T00:00:00.000' AS DateTime), 1, 3)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (24, N'Jennifer', N'Lopez', CAST(N'1996-01-30T00:00:00.000' AS DateTime), 0, 3)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (25, N'Monica', N'Linares', CAST(N'1994-04-01T00:00:00.000' AS DateTime), 0, 3)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (26, N'Toñita', N'Perez', CAST(N'2018-07-11T00:00:00.000' AS DateTime), 1, 3)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (27, N'James', N'Rodriguez', CAST(N'2013-01-30T00:00:00.000' AS DateTime), 1, 3)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (28, N'Cristiano', N'Ronaldo', CAST(N'2011-02-01T00:00:00.000' AS DateTime), 1, 3)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (29, N'Luis', N'Luna', CAST(N'1996-10-10T00:00:00.000' AS DateTime), 1, 3)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (30, N'Eu', N'Luna', CAST(N'2021-02-02T00:00:00.000' AS DateTime), 0, 4)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (31, N'Luis', N'Luna', CAST(N'2021-02-04T00:00:00.000' AS DateTime), 1, 5)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (32, N'Xabi', N'Alonso', CAST(N'2021-02-02T00:00:00.000' AS DateTime), 1, 6)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (33, N'Andres', N'Iniesta', CAST(N'2021-02-03T00:00:00.000' AS DateTime), 1, 3)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (34, N'Iker', N'Casillas', CAST(N'2021-02-03T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (35, N'Sergio', N'Ramos', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (36, N'Luis', N'Luna', CAST(N'2021-02-08T00:00:00.000' AS DateTime), 1, 4)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (37, N'Pedri', N'Dest', CAST(N'2021-02-03T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (38, N'Luka', N'Modric', CAST(N'2021-02-16T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (39, N'Antone', N'Griezmann', CAST(N'2021-02-01T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (40, N'Phillip', N'Coutihno', CAST(N'2021-02-16T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (41, N'Xabi', N'Hernandez', CAST(N'2021-02-03T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (42, N'Osuma', N'Dembele', CAST(N'2021-02-03T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (43, N'Carles', N'Puyol', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (44, N'David', N'Villa', CAST(N'2021-02-11T00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (45, N'Dani', N'Alves', CAST(N'2021-02-05T00:00:00.000' AS DateTime), 1, 6)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (46, N'Jordi', N'Alba', CAST(N'2021-02-02T00:00:00.000' AS DateTime), 1, 4)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (47, N'Rex', N'Luna', CAST(N'2021-02-24T00:00:00.000' AS DateTime), 1, 8)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (48, N'Luis', N'Luna', CAST(N'1996-08-10T00:00:00.000' AS DateTime), 1, 9)
GO
INSERT [dbo].[Alumnos] ([Id], [Nombre], [Apellido], [FechaNacimiento], [Genero], [IdMateria]) VALUES (49, N'Frank', N'De Jong', CAST(N'1991-02-27T00:00:00.000' AS DateTime), 1, 10)
GO
SET IDENTITY_INSERT [dbo].[Alumnos] OFF
GO
SET IDENTITY_INSERT [dbo].[Materias] ON 
GO
INSERT [dbo].[Materias] ([Id], [Nombre], [FechaInscripcion], [FinalCurso], [DuracionCurso]) VALUES (1, N'Ciencias Sociales', CAST(N'2021-02-12' AS Date), CAST(N'2022-01-12' AS Date), 11)
GO
INSERT [dbo].[Materias] ([Id], [Nombre], [FechaInscripcion], [FinalCurso], [DuracionCurso]) VALUES (2, N'Matematicas', CAST(N'2021-02-12' AS Date), CAST(N'2022-01-12' AS Date), 11)
GO
INSERT [dbo].[Materias] ([Id], [Nombre], [FechaInscripcion], [FinalCurso], [DuracionCurso]) VALUES (3, N'Fisica', CAST(N'2021-02-15' AS Date), CAST(N'2021-07-15' AS Date), 5)
GO
INSERT [dbo].[Materias] ([Id], [Nombre], [FechaInscripcion], [FinalCurso], [DuracionCurso]) VALUES (4, N'Informatica', CAST(N'2018-02-28' AS Date), CAST(N'2018-12-28' AS Date), 10)
GO
INSERT [dbo].[Materias] ([Id], [Nombre], [FechaInscripcion], [FinalCurso], [DuracionCurso]) VALUES (5, N'Lenguaje', CAST(N'2021-02-24' AS Date), CAST(N'2021-04-24' AS Date), 2)
GO
INSERT [dbo].[Materias] ([Id], [Nombre], [FechaInscripcion], [FinalCurso], [DuracionCurso]) VALUES (6, N'Info2', CAST(N'2021-02-17' AS Date), CAST(N'2021-03-17' AS Date), 1)
GO
INSERT [dbo].[Materias] ([Id], [Nombre], [FechaInscripcion], [FinalCurso], [DuracionCurso]) VALUES (7, N'Educacion Fisica', CAST(N'2021-02-10' AS Date), CAST(N'2021-03-10' AS Date), 1)
GO
INSERT [dbo].[Materias] ([Id], [Nombre], [FechaInscripcion], [FinalCurso], [DuracionCurso]) VALUES (8, N'Quimica', CAST(N'2021-02-24' AS Date), CAST(N'2021-04-24' AS Date), 2)
GO
INSERT [dbo].[Materias] ([Id], [Nombre], [FechaInscripcion], [FinalCurso], [DuracionCurso]) VALUES (9, N'Metodos Experimentales', CAST(N'2021-02-24' AS Date), CAST(N'2021-03-24' AS Date), 1)
GO
INSERT [dbo].[Materias] ([Id], [Nombre], [FechaInscripcion], [FinalCurso], [DuracionCurso]) VALUES (10, N'Cultura', CAST(N'2021-06-10' AS Date), CAST(N'2022-01-10' AS Date), 7)
GO
SET IDENTITY_INSERT [dbo].[Materias] OFF
GO
ALTER TABLE [dbo].[Alumnos]  WITH CHECK ADD  CONSTRAINT [FK_Alumnos_Materias1] FOREIGN KEY([IdMateria])
REFERENCES [dbo].[Materias] ([Id])
GO
ALTER TABLE [dbo].[Alumnos] CHECK CONSTRAINT [FK_Alumnos_Materias1]
GO
/****** Object:  StoredProcedure [dbo].[SP_Create_Alumno]    Script Date: 2/3/2021 18:54:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Create_Alumno]
	-- Add the parameters for the stored procedure here
	@Nombre varchar(50),
	@Apellido varchar(50),
	@FechaNacimiento datetime,
	@Genero bit,
	@IdMateria int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	INSERT INTO Alumnos (Nombre, Apellido, FechaNacimiento, Genero, IdMateria) 
				 VALUES (@Nombre, @Apellido, @FechaNacimiento, @Genero, @IdMateria)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Create_Materia]    Script Date: 2/3/2021 18:54:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Create_Materia]
	-- Add the parameters for the stored procedure here
	@Nombre varchar(50),
	@FechaInscripcion date,
	@DuracionCurso int,
	@FinalCurso date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	INSERT INTO Materias(Nombre, FechaInscripcion, DuracionCurso, FinalCurso) 
				 VALUES (@Nombre, @FechaInscripcion, @DuracionCurso, @FinalCurso)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Alumnos]    Script Date: 2/3/2021 18:54:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Select_Alumnos]
	-- Add the parameters for the stored procedure here
	@FilterNP varchar(50),
	@FilterIdMateria int,
	@FilterIdAlumno int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF(@FilterNP = '' AND @FilterIdMateria = 0 AND @FilterIdAlumno = 0)
		BEGIN
			SELECT *
			FROM Alumnos
			ORDER BY Nombre;
		END
	IF(@FilterNP != '' AND @FilterIdMateria = 0 AND @FilterIdAlumno = 0)
		BEGIN
			SELECT *
			FROM Alumnos
			WHERE Nombre LIKE '%' + @FilterNP + '%' OR Apellido LIKE '%' + @FilterNP + '%' 
			ORDER BY Nombre;
		END
	IF(@FilterNP = '' AND @FilterIdMateria > 0 AND @FilterIdAlumno = 0)
		BEGIN
			SELECT *
			FROM Alumnos
			WHERE IdMateria = @FilterIdMateria 
			ORDER BY Nombre;
		END
	IF(@FilterNP != '' AND @FilterIdMateria > 0 AND @FilterIdAlumno = 0)
		BEGIN
			SELECT *
			FROM Alumnos
			WHERE (Nombre LIKE '%' + @FilterNP + '%' OR Apellido LIKE '%' + @FilterNP + '%') AND IdMateria = @FilterIdMateria 
			ORDER BY Nombre;
		END
	IF(@FilterNP = '' AND @FilterIdMateria = 0 AND @FilterIdAlumno > 0)
		SELECT Alumnos.Nombre as NombreAlumno, Alumnos.Apellido as ApellidoAlumno, Alumnos.FechaNacimiento, Alumnos.Genero, Alumnos.IdMateria, Materias.Nombre as NombreMateria
		FROM Alumnos
		INNER JOIN Materias ON Alumnos.IdMateria = Materias.Id
		WHERE Alumnos.Id = @FilterIdAlumno 
		ORDER BY Alumnos.Nombre;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Select_Materias]    Script Date: 2/3/2021 18:54:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Select_Materias] 
	-- Add the parameters for the stored procedure here
	@FilterN varchar(50),
	@FilterId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF(@FilterN = '' AND @FilterId = 0)
		BEGIN
			SELECT * FROM Materias
			ORDER BY Nombre
		END
	IF(@FilterN != '' AND @FilterId = 0)
		BEGIN
			SELECT * FROM Materias WHERE Nombre LIKE '%' + @FilterN + '%'
			ORDER BY Nombre
		END
	IF(@FilterN = '' AND @FilterId > 0)
		BEGIN
			SELECT * FROM Materias WHERE Id = @FilterId
			ORDER BY Nombre
		END
	IF(@FilterN != '' AND @FilterId > 0)
		BEGIN
			SELECT * FROM Materias WHERE Id = @FilterId AND Nombre LIKE '%' + @FilterN + '%'
			ORDER BY Nombre
		END
END
GO
USE [master]
GO
ALTER DATABASE [PruebaTecnicaCC] SET  READ_WRITE 
GO
