USE [BanHang]
GO
/****** Object:  StoredProcedure [dbo].[quantri_check_login]    Script Date: 22/02/2017 3:15:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE select_thongtinchung
as
BEGIN
	select * from THONGTINCHUNG
END
