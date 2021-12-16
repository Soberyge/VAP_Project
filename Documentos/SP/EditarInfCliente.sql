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
CREATE PROCEDURE EditarInfCliente
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
