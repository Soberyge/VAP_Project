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
CREATE PROCEDURE CreaVentaNueva
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
