USE [VAP_Project]
GO
/****** Object:  StoredProcedure [dbo].[AgrgarProductoVenta]    Script Date: 14/12/2021 11:48:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[AgrgarProductoVenta] 
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


select MAX(id_pedido) from pedido

Select pedido.id_pedido as 'ID',
cliente.txt_nombre_cliente as 'Cliente'

from pedido

select * from pedido where pedido.id_cliente = 1;
Select * from producto_seleccionado 
Select * from variantes_producto
select * from producto
select *from cliente
select pedido.id_pedido,  pedido.d_fecha_pedido, pedido.dec_total_pedido, pedido.txt_estado_pedido,
	    variantes_producto.txt_color_prenda, variantes_producto.txt_talla_prenda, 
		producto.txt_tipo_prenda, producto.txt_concepto_prenda, producto.txt_marca_prenda ,producto.dec_precio_prenda
from producto_seleccionado
join pedido on producto_seleccionado.id_pedido = pedido.id_pedido
join variantes_producto on producto_seleccionado.txt_id_variante = variantes_producto.txt_id_variane
join producto on variantes_producto.id_prenda = producto.id_prenda
where pedido.id_cliente = 1;

