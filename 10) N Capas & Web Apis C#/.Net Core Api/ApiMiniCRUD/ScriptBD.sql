USE [PersonasDB]
GO
/****** Object:  StoredProcedure [dbo].[Ins_Personas]    Script Date: 15/11/2018 11:21:58 ******/
DROP PROCEDURE [dbo].[Ins_Personas]
GO
/****** Object:  StoredProcedure [dbo].[Cons_Personas]    Script Date: 15/11/2018 11:21:58 ******/
DROP PROCEDURE [dbo].[Cons_Personas]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 15/11/2018 11:21:58 ******/
DROP TABLE [dbo].[Personas]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 15/11/2018 11:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[Cedula] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](50) NOT NULL,
	[Direccion] [nvarchar](50) NOT NULL,
	[Correo] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Personas] ([Cedula], [Nombre], [Telefono], [Direccion], [Correo]) VALUES (N'1', N'Hugo', N'1111-1111', N'Hidraulica', N'x@x.com')
/****** Object:  StoredProcedure [dbo].[Cons_Personas]    Script Date: 15/11/2018 11:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cons_Personas] AS
Select * From Personas

GO
/****** Object:  StoredProcedure [dbo].[Ins_Personas]    Script Date: 15/11/2018 11:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[Ins_Personas]
	(@Cedula 	[nvarchar](50),
	 @Nombre 	[nvarchar](50),
	 @Telefono 	[nvarchar](50),
	 @Direccion 	[nvarchar](50),
	 @Correo 	[nvarchar](50))

AS INSERT INTO Personas
	
VALUES 
	( @Cedula,
	 @Nombre,
	 @Telefono,
	 @Direccion,
	 @Correo)

GO
