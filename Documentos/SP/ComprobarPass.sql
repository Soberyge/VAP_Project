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
CREATE PROCEDURE ComprobarPass
	-- Add the parameters for the stored procedure here
	@correo varchar(40) 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @llave nvarchar(128)
	SET @llave = 'encryp';  
	


	select *, Pass=CONVERT(varchar(max), 
	DECRYPTBYPASSPHRASE(@llave ,cliente.txt_contraseña_cliente)) 
	from cliente 
	where txt_correo_cliente = @correo 
    
END
GO
