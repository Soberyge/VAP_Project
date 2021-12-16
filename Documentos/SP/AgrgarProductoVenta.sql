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
CREATE PROCEDURE AgrgarProductoVenta 
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
