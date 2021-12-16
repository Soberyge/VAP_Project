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
CREATE PROCEDURE CrearVariante
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
