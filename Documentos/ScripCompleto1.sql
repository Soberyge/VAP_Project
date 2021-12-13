USE [master]
GO
/****** Object:  Database [VAP_Project]    Script Date: 13/12/2021 01:47:28 a. m. ******/
CREATE DATABASE [VAP_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VAP_Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VAP_Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VAP_Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VAP_Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VAP_Project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VAP_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VAP_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VAP_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VAP_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VAP_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VAP_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [VAP_Project] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VAP_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VAP_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VAP_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VAP_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VAP_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VAP_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VAP_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VAP_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VAP_Project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VAP_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VAP_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VAP_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VAP_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VAP_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VAP_Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VAP_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VAP_Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VAP_Project] SET  MULTI_USER 
GO
ALTER DATABASE [VAP_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VAP_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VAP_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VAP_Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VAP_Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VAP_Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VAP_Project] SET QUERY_STORE = OFF
GO
USE [VAP_Project]
GO
/****** Object:  Table [dbo].[administrador]    Script Date: 13/12/2021 01:47:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrador](
	[id_administrador] [int] IDENTITY(1,1) NOT NULL,
	[txt_correo_admin] [varchar](45) NOT NULL,
	[txt_contraseña_admin] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_administrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 13/12/2021 01:47:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[txt_nombre_cliente] [varchar](20) NOT NULL,
	[txt_apellidos_cliente] [varchar](40) NOT NULL,
	[int_celular_cliente] [bigint] NOT NULL,
	[txt_correo_cliente] [varchar](45) NOT NULL,
	[txt_contraseña_cliente] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedido]    Script Date: 13/12/2021 01:47:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido](
	[id_pedido] [int] IDENTITY(1,1) NOT NULL,
	[d_fecha_pedido] [date] NOT NULL,
	[dec_total_pedido] [decimal](8, 2) NOT NULL,
	[txt_estado_pedido] [varchar](9) NOT NULL,
	[id_cliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 13/12/2021 01:47:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id_prenda] [int] IDENTITY(1,1) NOT NULL,
	[txt_tipo_prenda] [varchar](8) NOT NULL,
	[txt_concepto_prenda] [varchar](45) NOT NULL,
	[txt_marca_prenda] [varchar](20) NOT NULL,
	[dec_precio_prenda] [decimal](6, 2) NOT NULL,
	[img_blanco_prenda] [varchar](100) NOT NULL,
	[img_negro_prenda] [varchar](100) NOT NULL,
	[txt_estado_prenda] [varchar](13) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_prenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto_seleccionado]    Script Date: 13/12/2021 01:47:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto_seleccionado](
	[int_cantidad_subpedido] [int] NOT NULL,
	[txt_id_variante] [varchar](6) NOT NULL,
	[id_pedido] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[variantes_producto]    Script Date: 13/12/2021 01:47:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[variantes_producto](
	[txt_id_variane] [varchar](6) NOT NULL,
	[txt_color_prenda] [varchar](6) NOT NULL,
	[txt_talla_prenda] [varchar](2) NOT NULL,
	[int_cantidad_prenda] [int] NOT NULL,
	[id_prenda] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[txt_id_variane] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 13/12/2021 01:47:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[id_venta] [int] IDENTITY(1,1) NOT NULL,
	[id_pedido] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[pedido] ADD  DEFAULT ('pendiente') FOR [txt_estado_pedido]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT ('vigente') FOR [txt_estado_prenda]
GO
ALTER TABLE [dbo].[pedido]  WITH CHECK ADD  CONSTRAINT [fk_pedido_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[pedido] CHECK CONSTRAINT [fk_pedido_cliente]
GO
ALTER TABLE [dbo].[producto_seleccionado]  WITH CHECK ADD  CONSTRAINT [fk_pedido_completo] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[pedido] ([id_pedido])
GO
ALTER TABLE [dbo].[producto_seleccionado] CHECK CONSTRAINT [fk_pedido_completo]
GO
ALTER TABLE [dbo].[producto_seleccionado]  WITH CHECK ADD  CONSTRAINT [fk_producto_pedido] FOREIGN KEY([txt_id_variante])
REFERENCES [dbo].[variantes_producto] ([txt_id_variane])
GO
ALTER TABLE [dbo].[producto_seleccionado] CHECK CONSTRAINT [fk_producto_pedido]
GO
ALTER TABLE [dbo].[variantes_producto]  WITH CHECK ADD  CONSTRAINT [fk_variante_prenda] FOREIGN KEY([id_prenda])
REFERENCES [dbo].[producto] ([id_prenda])
GO
ALTER TABLE [dbo].[variantes_producto] CHECK CONSTRAINT [fk_variante_prenda]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [fk_venta_pedido] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[pedido] ([id_pedido])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [fk_venta_pedido]
GO
ALTER TABLE [dbo].[pedido]  WITH CHECK ADD CHECK  (([txt_estado_pedido]='cancelado' OR [txt_estado_pedido]='entregado' OR [txt_estado_pedido]='enviado' OR [txt_estado_pedido]='empacado' OR [txt_estado_pedido]='pendiente'))
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD CHECK  (([txt_estado_prenda]='descontinuado' OR [txt_estado_prenda]='vigente'))
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD CHECK  (([txt_tipo_prenda]='sudadera' OR [txt_tipo_prenda]='playera'))
GO
ALTER TABLE [dbo].[variantes_producto]  WITH CHECK ADD CHECK  (([txt_color_prenda]='blanco' OR [txt_color_prenda]='negro'))
GO
ALTER TABLE [dbo].[variantes_producto]  WITH CHECK ADD CHECK  (([txt_talla_prenda]='EG' OR [txt_talla_prenda]='G' OR [txt_talla_prenda]='M' OR [txt_talla_prenda]='CH'))
GO
/****** Object:  StoredProcedure [dbo].[AgrgarProductoVenta]    Script Date: 13/12/2021 01:47:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AgrgarProductoVenta] 
	-- Add the parameters for the stored procedure here
	@cantidad int,
	@idVariante VARCHAR(6)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Declare @venta int;
	set @venta = (select max(pedido.id_pedido) from pedido);

	insert into producto_seleccionado
	([int_cantidad_subpedido],[txt_id_variante],[id_pedido])
	values 
	(@cantidad, @idVariante,@venta);

	declare @cantExist int;
	set @cantExist =(select variantes_producto.int_cantidad_prenda 
	from variantes_producto
	where txt_id_variane = @idVariante);

	update variantes_producto set 
	int_cantidad_prenda =(@cantExist - @cantidad)
	where txt_id_variane = @idVariante

END
GO
/****** Object:  StoredProcedure [dbo].[CrearProducto]    Script Date: 13/12/2021 01:47:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CrearProducto]
	
	@txt_tipo_prenda VARCHAR(8),
	@txt_concepto_prenda VARCHAR(45),
	@txt_marca_prenda VARCHAR(20),
	@dec_precio_prenda DECIMAL(6,2),
	@img_blanco_prenda VARCHAR(100),
	@img_negro_prenda VARCHAR(100),
	@txt_estado_prenda VARCHAR(13)

AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT INTO producto
	([txt_tipo_prenda],
	[txt_concepto_prenda],
	[txt_marca_prenda],
	[dec_precio_prenda],
	[img_blanco_prenda],
	[img_negro_prenda],
	[txt_estado_prenda])
	VALUES 
	(@txt_tipo_prenda,
	@txt_concepto_prenda,
	@txt_marca_prenda,
	@dec_precio_prenda,
	@img_blanco_prenda,
	@img_negro_prenda,
	@txt_estado_prenda) 
   
END
GO
/****** Object:  StoredProcedure [dbo].[CrearVariante]    Script Date: 13/12/2021 01:47:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CrearVariante]
	-- Add the parameters for the stored procedure here
	@txt_color_prenda VARCHAR(6),
	@txt_talla_prenda VARCHAR(2),
	@int_cantidad_prenda INT,
	@idVariante  VARCHAR(6),
	@idprenda int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert variantes_producto 
	([txt_id_variane],[txt_color_prenda],[txt_talla_prenda],[int_cantidad_prenda],[id_prenda])
	values
	(@idVariante, @txt_color_prenda,@txt_talla_prenda,@int_cantidad_prenda,@idprenda)
END
GO
/****** Object:  StoredProcedure [dbo].[CreaVentaNueva]    Script Date: 13/12/2021 01:47:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreaVentaNueva]
	-- Add the parameters for the stored procedure here
	@fecha_pedido DATE,
    @total_pedido DECIMAL(8,2),
    @id_cliente int 


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into pedido 
	([d_fecha_pedido],[dec_total_pedido],[txt_estado_pedido],[id_cliente])
	values 
	(@fecha_pedido,@total_pedido,'pendiente', @id_cliente)
END
GO
/****** Object:  StoredProcedure [dbo].[EditarInfCliente]    Script Date: 13/12/2021 01:47:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EditarInfCliente]
	-- Add the parameters for the stored procedure here
	@idcliente int,
	@nomCliente VARCHAR(20),
	@ApeCliente VARCHAR(40),
	@celClietne bigint,
	@correoCliente VARCHAR(45)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Update cliente set 
   txt_nombre_cliente = @nomCliente,
   txt_apellidos_cliente = @ApeCliente,
   int_celular_cliente =  @celClietne,
   txt_correo_cliente = @correoCliente
   where id_cliente = @idcliente;
END
GO
USE [master]
GO
ALTER DATABASE [VAP_Project] SET  READ_WRITE 
GO
