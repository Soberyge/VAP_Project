USE [VAP_Project]
GO
/****** Object:  StoredProcedure [dbo].[CrearCliente]    Script Date: 14/12/2021 07:14:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[CrearCliente]
	-- Add the parameters for the stored procedure here
	
	@nombre_cliente VARCHAR(20),
	@apellidos_cliente VARCHAR(40),
	@celular_cliente BIGINT,
	@correo_cliente VARCHAR(45),
	@contraseña_cliente VARCHAR(MAX)

AS
BEGIN
	
	SET NOCOUNT ON;
	 
	declare @pss VARBINARY(MAX)
	set @pss = (ENCRYPTBYPASSPHRASE('encryp',@contraseña_cliente))
	
	IF NOT EXISTS (select cliente.txt_correo_cliente from cliente where cliente.txt_correo_cliente = @correo_cliente)
	BEGIN
		INSERT INTO cliente
		([txt_nombre_cliente],
		[txt_apellidos_cliente],
		[int_celular_cliente],
		[txt_correo_cliente],
		[txt_contraseña_cliente])
		values
		(@nombre_cliente, 
		@apellidos_cliente,
		@celular_cliente,
		@correo_cliente, 
		@pss);
		select*from cliente
	END
END
