-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE CrearProducto
	
	@txt_tipo_prenda VARCHAR(8),
	@txt_concepto_prenda VARCHAR(45),
	@txt_marca_prenda VARCHAR(20),
	@dec_precio_prenda DECIMAL(6,2),
	@img_blanco_prenda IMAGE,
	@img_negro_prenda IMAGE,
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
