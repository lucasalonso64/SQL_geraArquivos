USE [FORACESSO]
GO
/****** Object:  StoredProcedure [dbo].[ExportaArquivos]    Script Date: 16/07/2019 16:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Lucas>
-- Create date: <07/02/2019>
-- Description:	<Procedure que faz a exportação dos arquivos>
-- =============================================
ALTER Procedure [dbo].[ExportaArquivos 
	
AS
BEGIN
	exec xp_cmdshell  'bcp FORACESSO.dbo.Vw_lista out  \\servidor\HOME\DAF\COMUM\Lista\arquivo.txt  -S DB02\DB02 -c -U usuario -P senha -t'
END
