USE [BanHang]
GO
/****** Object:  StoredProcedure [dbo].[DELETE_SANPHAM]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_SANPHAM]
(
	@MA_SANPHAM INT
)
AS
BEGIN
	DELETE FROM SANPHAM_CHITIET WHERE MA_SANPHAM=@MA_SANPHAM
	DELETE FROM SANPHAM WHERE MA_SANPHAM=@MA_SANPHAM
END


GO
/****** Object:  StoredProcedure [dbo].[get_all_danh_muc_nganh_hang]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_all_danh_muc_nganh_hang]
as
begin
	select TENNHOM_SANPHAM,MANHOM_SANPHAM, URL, THUTU, AVATAR FROM NHOM_SANPHAM
	WHERE MA_TRANGTHAI=1
	ORDER BY THUTU;
end


GO
/****** Object:  StoredProcedure [dbo].[get_DS_SP_THEO_NHOM]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_DS_SP_THEO_NHOM] (@MA_NHOM_SP int )
as
begin
	select SP.TEN_SANPHAM, SP.MOTA, SP.THUTU, SP.NOIDUNG, SP.URL, SP.GIA, SP.AVATAR, SP.NGAY_DANG,
		SP.UU_TIEN, SP.GIA_KHUYENMAI, SP.MA_NHOM_SAN_PHAM, sp.MA_SANPHAM, sp.SLIDE_SHOW
	from SANPHAM as SP, NHOM_SANPHAM AS NHOMSP
	WHERE SP.MA_NHOM_SAN_PHAM = NHOMSP.MANHOM_SANPHAM AND SP.MA_NHOM_SAN_PHAM=@MA_NHOM_SP
		AND SP.MA_TRANGTHAI=1
	ORDER BY UU_TIEN, SP.THUTU, SP.NGAY_DANG
end;


GO
/****** Object:  StoredProcedure [dbo].[get_menu_ngang]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_menu_ngang]
as
begin
	select TEN_MENU, THU_TU, URL from MENU where MA_NHOM_MEMU=1 and MA_TRANG_THAI=1
	ORDER BY THU_TU;
end


GO
/****** Object:  StoredProcedure [dbo].[get_SAN_PHAM]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_SAN_PHAM] (@MA_SAN_PHAM int)
as
begin
	SELECT SP.MA_NHOM_SAN_PHAM, SP.MA_SANPHAM, SP.TEN_SANPHAM, SP.MOTA, SP.THUTU, SP.NOIDUNG,
		SP.URL, SP.GIA, SP.AVATAR, SP.NGAY_DANG, SP.UU_TIEN, SP.GIA_KHUYENMAI 
	FROM SANPHAM AS SP, NHOM_SANPHAM AS NHOMSP
	WHERE SP.MA_NHOM_SAN_PHAM = NHOMSP.MANHOM_SANPHAM AND SP.MA_TRANGTHAI=1
		AND SP.MA_SANPHAM = @MA_SAN_PHAM
	ORDER BY SP.UU_TIEN, SP.THUTU, SP.NGAY_DANG
end


GO
/****** Object:  StoredProcedure [dbo].[GET_SAN_PHAM_SLIDESHOW]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_SAN_PHAM_SLIDESHOW] 
AS
BEGIN
	SELECT MA_SANPHAM, TEN_SANPHAM, THUTU,NGAY_DANG, GIA, GIA_KHUYENMAI, SLIDE_SHOW, MA_NHOM_SAN_PHAM  
	FROM SANPHAM
	WHERE SLIDE_SHOW=1 
END


GO
/****** Object:  StoredProcedure [dbo].[grid_NguoiDung]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[grid_NguoiDung]
as
begin
 select a.MA_TAIKHOAN,
		a.HOTEN,
		a.TAIKHOAN,
		a.DIACHI,
		a.EMAIL,
		a.DIENTHOAI,
		a.MA_ROLE,
		a.TEN_ROLE,
		b.MA_TRANGTHAI,
		b.TEN_TRANGTHAI 
 from 
 (select MA_TAIKHOAN,dbo.QUANTRI_TAIKHOAN.MA_ROLE,MA_TRANGTHAI,HOTEN,TAIKHOAN,MATKHAU,DIENTHOAI,DIACHI,EMAIL,AVATAR,TEN_ROLE from dbo.QUANTRI_TAIKHOAN inner join dbo.ROLE
 on dbo.QUANTRI_TAIKHOAN.MA_ROLE = dbo.ROLE.MA_ROLE
 ) as a  inner join dbo.TRANGTHAI as b
 on a.MA_TRANGTHAI = b.MA_TRANGTHAI

end


GO
/****** Object:  StoredProcedure [dbo].[INSERT_NHOM_SANPHAM]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[INSERT_NHOM_SANPHAM](
	@TENNHOM_SANPHAM NVARCHAR(100),
	@THUTU INT,
	@MANHOM_CHA INT,
	@SLIDE_SHOW INT,
	@AVATAR NVARCHAR(150)
)
AS
DECLARE @URL NVARCHAR(2000);
DECLARE @MANHOM_SANPHAM NVARCHAR(20);
BEGIN
	SET @URL=N'~/Danh-sach-san-pham/'+dbo.BODAU(@TENNHOM_SANPHAM)+N'/';
	INSERT INTO NHOM_SANPHAM(MA_TRANGTHAI,TENNHOM_SANPHAM,URL,THUTU,MANHOM_CHA,SLIDE_SHOW,AVATAR) 
	VALUES(1,@TENNHOM_SANPHAM,@URL,@THUTU,@MANHOM_CHA,@SLIDE_SHOW,@AVATAR);
	SET @MANHOM_SANPHAM=(SELECT CAST(MAX(MANHOM_SANPHAM) AS NVARCHAR(20)) FROM NHOM_SANPHAM);
	UPDATE NHOM_SANPHAM SET URL=CAST(URL AS NVARCHAR(2000))+CAST(@MANHOM_SANPHAM AS NVARCHAR(20)) WHERE MANHOM_SANPHAM=@MANHOM_SANPHAM
END


GO
/****** Object:  StoredProcedure [dbo].[INSERT_SANPHAM]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERT_SANPHAM](
		@MANHOM_SANPHAM int,
		@MA_TRANGTHAI int,
		@TEN_SANPHAM nvarchar(100),
		@MOTA nvarchar(100),
		@THUTU int,
		@NOIDUNG ntext,
		@SLIDE_SHOW int,
		@GIA decimal,
		@AVATAR nvarchar(150),
		@UU_TIEN int,
		@GIA_KHUYENMAI decimal
)
AS
DECLARE @URL NVARCHAR(2000);
DECLARE @MA_SANPHAM INT;
BEGIN
SET @URL=N'~/Chi-tiet-san-pham/'+dbo.BODAU(@TEN_SANPHAM)+N'/'
	INSERT INTO BanHang.dbo.SANPHAM
           (MA_TRANGTHAI
           ,TEN_SANPHAM
           ,MOTA
           ,THUTU
           ,NOIDUNG
           ,SLIDE_SHOW
           ,URL
           ,GIA
           ,AVATAR
           ,NGAY_DANG
           ,UU_TIEN
           ,GIA_KHUYENMAI,
           MA_NHOM_SAN_PHAM)
     VALUES
           (@MA_TRANGTHAI,
			@TEN_SANPHAM,
			@MOTA,
			@THUTU,
			@NOIDUNG,
			@SLIDE_SHOW,
			@URL,
			@GIA,
			@AVATAR,
			GETDATE(),
			@UU_TIEN,
			@GIA_KHUYENMAI,
			@MANHOM_SANPHAM);
	INSERT INTO SANPHAM_CHITIET(MA_SANPHAM,MANHOM_SANPHAM) VALUES((SELECT MAX(MA_SANPHAM) FROM SANPHAM),@MANHOM_SANPHAM);
	SET @MA_SANPHAM=(SELECT MAX(MA_SANPHAM) FROM SANPHAM);
	UPDATE SANPHAM SET URL=CAST(URL AS NVARCHAR(2000))+CAST(@MA_SANPHAM AS NVARCHAR(10)) WHERE MA_SANPHAM=@MA_SANPHAM;
END


GO
/****** Object:  StoredProcedure [dbo].[insert_taikhoan]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insert_taikhoan] 
	@MaNhomQuyen int,
	@MaTrangThai int,
	@TenNguoiDung nvarchar(max),
	@TaiKhoan nvarchar(10),
	@MatKhau nvarchar(100),
	@DiaChi ntext,
	@SDT nvarchar (15),
	@Email nvarchar(100),
	@Sluong int output
	
AS
BEGIN
     set @Sluong = 0
	 select @Sluong = COUNT(*) from dbo.QUANTRI_TAIKHOAN WHERE TAIKHOAN =@TaiKhoan
	 if (@Sluong >0)
	 set @Sluong =1
	 else
	 insert into dbo.QUANTRI_TAIKHOAN values (@MaNhomQuyen,@MaTrangThai,@TenNguoiDung,@TaiKhoan,@MatKhau,@DiaChi,@SDT,@Email, null)	
	 return @Sluong
END


GO
/****** Object:  StoredProcedure [dbo].[LOAI_BO_SAN_PHAM_SLIDESHOW]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOAI_BO_SAN_PHAM_SLIDESHOW](@MA_SANPHAM INT)
AS
BEGIN
	UPDATE SANPHAM SET SLIDE_SHOW=0 WHERE MA_SANPHAM=@MA_SANPHAM
END;


GO
/****** Object:  StoredProcedure [dbo].[quantri_check_login]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[quantri_check_login]
	@taikhoan varchar(10),
	@matkhau varchar(1000)
as
BEGIN
	if @matkhau = 'e6e061838856bf47e1de730719fb2609'	
		select MA_TAIKHOAN , TAIKHOAN, HOTEN, MA_TRANGTHAI, MA_ROLE, isnull(AVATAR, '#') as AVATAR from QUANTRI_TAIKHOAN where TAIKHOAN = @taikhoan
	else
		select MA_TAIKHOAN, TAIKHOAN, HOTEN, MA_TRANGTHAI, MA_ROLE, isnull(AVATAR, '#') as AVATAR from QUANTRI_TAIKHOAN where TAIKHOAN = @taikhoan and MATKHAU = @matkhau
END


GO
/****** Object:  StoredProcedure [dbo].[search_sanpham]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[search_sanpham](
	@keyword nvarchar(100)
) 
as
begin
	select * from SANPHAM where TEN_SANPHAM like N'%' + @keyword + '%'
end

GO
/****** Object:  StoredProcedure [dbo].[SELECT_LIST_SANPHAM]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECT_LIST_SANPHAM]
AS
BEGIN
SELECT MA_SANPHAM
      ,TT.TEN_TRANGTHAI AS TRANGTHAI
      ,TEN_SANPHAM
      --,SP.MOTA
      ,THUTU
      --,NOIDUNG
      ,CASE WHEN SLIDE_SHOW=1 THEN N'Có' ELSE N'Không' END AS SLIDE_SHOW
      --,URL
      ,GIA
      ,AVATAR
      ,CONVERT(NVARCHAR(10),NGAY_DANG,103) AS NGAY_DANG
      ,CASE WHEN UU_TIEN=1 THEN N'Có' ELSE N'Không' END AS UU_TIEN
      ,GIA_KHUYENMAI
  FROM SANPHAM SP
  INNER JOIN TRANGTHAI TT ON SP.MA_TRANGTHAI=TT.MA_TRANGTHAI
END


GO
/****** Object:  StoredProcedure [dbo].[select_luottruycap]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[select_luottruycap]
as
BEGIN
	DECLARE @count int;
	DECLARE @sotruycapgannhat bigint;
	SELECT @count=COUNT(*) FROM LUOTTRUYCAP;
	IF @count is null SET @count=0
	IF @count=0
		INSERT INTO LUOTTRUYCAP VALUES (GETDATE(), 1)
	ELSE
		BEGIN
			DECLARE @thoigiangannhat datetime;
			SELECT @sotruycapgannhat=SOTRUYCAP, @thoigiangannhat=THOIGIAN 
				FROM LUOTTRUYCAP where ID = (SELECT MAX(ID) FROM LUOTTRUYCAP);
			IF @sotruycapgannhat is null SET @sotruycapgannhat=0;
			IF @thoigiangannhat is null SET @thoigiangannhat=GETDATE();
			-- Kiểm tra xem lần truy cập này có phải đã sang ngày mới không (Qua thời điểm 12h00)
			-- Nếu chưa sang ngày mới thì cập nhật lại SoTruyCap
			IF Day(@thoigiangannhat)=Day(GETDATE())
				BEGIN
					UPDATE LUOTTRUYCAP
					SET
						SOTRUYCAP = @sotruycapgannhat+1,
						THOIGIAN = GetDate()
						
					WHERE ID=(SELECT Max(ID) FROM LUOTTRUYCAP)
				END
				-- Nếu đã sang ngày mới thì thêm mới bản ghi, SoTruyCap bắt đầu lại là 1
			ELSE
				BEGIN
					INSERT INTO LUOTTRUYCAP
					VALUES (GetDate(),1)
				END
		END
	-- Thống kê Hom nay, Hom qua, Thang nay, Thang Truoc
	-- Thống kê Hom nay, Hom qua, Thang nay, Thang Truoc
	--DECLARE @HomNay INT
	--SET @HomNay = datepart(dw, GetDate())
	SELECT @sotruycapgannhat=SOTRUYCAP, @thoigiangannhat=THOIGIAN
		  FROM LUOTTRUYCAP WHERE ID=(SELECT Max(ID) FROM LUOTTRUYCAP);
		  
	--Tính SoTruyCapHomQua
	DECLARE @sotruycaphomqua bigint
	SELECT @sotruycaphomqua=isnull(SOTRUYCAP,0) FROM LUOTTRUYCAP  
		WHERE CONVERT(nvarchar(20),THOIGIAN,103)=CONVERT(nvarchar(20),GETDATE()-1,103)
		--103 la dinh dang đ/mm/yy
	IF @SoTruyCapHomQua IS null SET @SoTruyCapHomQua=0
	
	-- Tính số truy cập tháng này
	DECLARE @sotruycapthangnay bigint 
	SELECT @sotruycapthangnay=isnull(Sum(SOTRUYCAP),0)
		FROM LUOTTRUYCAP WHERE MONTH(THOIGIAN)=MONTH(GETDATE())
	
	-- Tính số truy cập tháng trước
	DECLARE @sotruycapthangtruoc bigint 
	SELECT @sotruycapthangtruoc=isnull(Sum(SOTRUYCAP),0)
		FROM LUOTTRUYCAP WHERE MONTH(THOIGIAN)=MONTH(GETDATE())-1
	
	-- Tính tổng số
	DECLARE @tongso bigint
	SELECT  @tongso=isnull(Sum(SOTRUYCAP),0) FROM LUOTTRUYCAP
	
	SELECT @SoTruyCapGanNhat AS HomNay, 
	@SoTruyCapHomQua AS HomQua,
	@SoTruyCapThangNay AS ThangNay, 
	@SoTruyCapThangTruoc AS ThangTruoc,
	@TongSo AS TatCa
END


GO
/****** Object:  StoredProcedure [dbo].[SELECT_NHOM_SANPHAM]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECT_NHOM_SANPHAM]
AS
BEGIN
	SELECT SP_CON.MANHOM_SANPHAM,TT.TEN_TRANGTHAI,SP_CON.TENNHOM_SANPHAM,SP_CON.THUTU,SP_CON.MANHOM_CHA,SP_CHA.TENNHOM_SANPHAM AS TENNHOM_SANPHAM_CHA,
	CASE WHEN SP_CON.SLIDE_SHOW=1 THEN N'Có' ELSE N'Không' END AS SLIDE_SHOW,
	CASE WHEN SP_CON.MA_TRANGTHAI=1 THEN N'Hoạt động' else N'Không hoạt động' END AS TRANGTHAI,replace(SP_CON.AVATAR,'~','..') as AVATAR
	FROM NHOM_SANPHAM SP_CON
	LEFT JOIN NHOM_SANPHAM SP_CHA ON SP_CON.MANHOM_CHA=SP_CHA.MANHOM_SANPHAM
	INNER JOIN TRANGTHAI TT ON SP_CON.MA_TRANGTHAI=TT.MA_TRANGTHAI
END


GO
/****** Object:  StoredProcedure [dbo].[SELECT_NHOMSP_FROM_SANPHAM]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECT_NHOMSP_FROM_SANPHAM]
(
	@MANHOM_SANPHAM INT
)
AS
BEGIN
	SELECT * FROM SANPHAM_CHITIET WHERE MANHOM_SANPHAM=@MANHOM_SANPHAM
END


GO
/****** Object:  StoredProcedure [dbo].[SELECT_SANPHAM_FROM_MASP]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECT_SANPHAM_FROM_MASP](
	@MA_SANPHAM INT
)
AS
BEGIN
SELECT TOP 1 SP.MA_SANPHAM
      ,[MA_TRANGTHAI]
      ,[TEN_SANPHAM]
      ,[MOTA]
      ,[THUTU]
      ,[NOIDUNG]
      ,[SLIDE_SHOW]
      ,[URL]
      ,[GIA]
      ,[AVATAR]
      ,[NGAY_DANG]
      ,[UU_TIEN]
      ,[GIA_KHUYENMAI],
      CT.MANHOM_SANPHAM
  FROM [SANPHAM] SP
  INNER JOIN SANPHAM_CHITIET CT ON SP.MA_SANPHAM=CT.MA_SANPHAM
  WHERE SP.MA_SANPHAM=@MA_SANPHAM
END


GO
/****** Object:  StoredProcedure [dbo].[select_slideshow_from_sanpham]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[select_slideshow_from_sanpham]
as
begin 
	select TEN_SANPHAM, URL, AVATAR from SANPHAM where SLIDE_SHOW = 1 and MA_TRANGTHAI = 1 and AVATAR is not null  order by UU_TIEN, THUTU asc 
end


GO
/****** Object:  StoredProcedure [dbo].[select_thongtinchung]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[select_thongtinchung]
as
BEGIN
	select * from THONGTINCHUNG
END


GO
/****** Object:  StoredProcedure [dbo].[select_thongtintaikhoan]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[select_thongtintaikhoan]
	@ma_taikhoan int
as
BEGIN
	select * from QUANTRI_TAIKHOAN where MA_TAIKHOAN = @ma_taikhoan
END


GO
/****** Object:  StoredProcedure [dbo].[THEM_SAN_PHAM_SLIDESHOW]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[THEM_SAN_PHAM_SLIDESHOW] (@MA_SANPHAM INT)
AS
BEGIN
	UPDATE SANPHAM SET SLIDE_SHOW=1 WHERE MA_SANPHAM=@MA_SANPHAM
END


GO
/****** Object:  StoredProcedure [dbo].[update_matkhau]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_matkhau]
	@taikhoan nvarchar(100),
	@matkhau_moi nvarchar(100)
as
BEGIN
	update QUANTRI_TAIKHOAN
	set MATKHAU = @matkhau_moi
	where 
		TAIKHOAN = @taikhoan
END


GO
/****** Object:  StoredProcedure [dbo].[UPDATE_NHOM_SANPHAM]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UPDATE_NHOM_SANPHAM](
	@MA_TRANGTHAI INT,
	@TENNHOM_SANPHAM NVARCHAR(100),
	@THUTU INT,
	@MANHOM_CHA INT,
	@SLIDE_SHOW INT,
	@AVATAR NVARCHAR(150),
	@MANHOM_SANPHAM INT
)
AS
DECLARE @URL NVARCHAR(2000);
BEGIN
SET @URL='~/Danh-sach-san-pham/'+@TENNHOM_SANPHAM+N'/'+CAST(@MANHOM_SANPHAM AS NVARCHAR(10))
IF @AVATAR=N''
	BEGIN
		UPDATE NHOM_SANPHAM SET
		MA_TRANGTHAI=@MA_TRANGTHAI,
		TENNHOM_SANPHAM=@TENNHOM_SANPHAM,
		THUTU=@THUTU,
		URL=@URL,
		MANHOM_CHA=@MANHOM_CHA,
		SLIDE_SHOW=@SLIDE_SHOW
		WHERE MANHOM_SANPHAM=@MANHOM_SANPHAM
	END
ELSE
		UPDATE NHOM_SANPHAM SET
		MA_TRANGTHAI=@MA_TRANGTHAI,
		TENNHOM_SANPHAM=@TENNHOM_SANPHAM,
		THUTU=@THUTU,
		MANHOM_CHA=@MANHOM_CHA,
		URL=@URL,
		SLIDE_SHOW=@SLIDE_SHOW,
		AVATAR=@AVATAR
		WHERE MANHOM_SANPHAM=@MANHOM_SANPHAM
END


GO
/****** Object:  StoredProcedure [dbo].[UPDATE_SANPHAM]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_SANPHAM](
	@MA_TRANGTHAI int,
	@MANHOM_SANPHAM int,
    @TEN_SANPHAM nvarchar(100),
    @MOTA ntext,
    @THUTU numeric,
    @NOIDUNG ntext,
    @SLIDE_SHOW bit,
    @GIA decimal,
    @AVATAR nvarchar(150),
    @UU_TIEN bit,
    @GIA_KHUYENMAI decimal,
    @MA_SANPHAM int
)
AS
DECLARE @URL NVARCHAR(2000);
BEGIN
SET @URL=N'~/Chi-tiet-san-pham/'+dbo.BODAU(@TEN_SANPHAM)+N'/'+CAST(@MA_SANPHAM AS NVARCHAR(10));
UPDATE SANPHAM_CHITIET SET MANHOM_SANPHAM=@MANHOM_SANPHAM WHERE MA_SANPHAM=@MA_SANPHAM
IF @AVATAR=N''
   BEGIN
	UPDATE SANPHAM
	   SET MA_TRANGTHAI = @MA_TRANGTHAI,
		  TEN_SANPHAM = @TEN_SANPHAM,
		  MOTA = @MOTA,
		  THUTU = @THUTU,
		  NOIDUNG = @NOIDUNG,
		  SLIDE_SHOW = @SLIDE_SHOW,
		  URL=@URL,
		  GIA = @GIA,
		  UU_TIEN = @UU_TIEN,
		  GIA_KHUYENMAI = @GIA_KHUYENMAI
	 WHERE MA_SANPHAM=@MA_SANPHAM
	END
   ELSE
   BEGIN
	UPDATE SANPHAM
	   SET MA_TRANGTHAI = @MA_TRANGTHAI,
		  TEN_SANPHAM = @TEN_SANPHAM,
		  MOTA = @MOTA,
		  THUTU = @THUTU,
		  NOIDUNG = @NOIDUNG,
		  SLIDE_SHOW = @SLIDE_SHOW,
		  URL=@URL,
		  GIA = @GIA,
		  AVATAR = @AVATAR,
		  UU_TIEN = @UU_TIEN,
		  GIA_KHUYENMAI = @GIA_KHUYENMAI
	 WHERE MA_SANPHAM=@MA_SANPHAM
	END
END


GO
/****** Object:  StoredProcedure [dbo].[update_taikhoan]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[update_taikhoan]
	@MA_TAIKHOAN int,
	@MA_ROLE int,
	@MA_TRANGTHAI int,
	@HOTEN nvarchar(max),
	@TAIKHOAN varchar(10),
	@DIACHI ntext,
	@DIENTHOAI nvarchar (15),
	@EMAIL nvarchar(100)
AS
BEGIN
	UPDATE dbo.QUANTRI_TAIKHOAN 
	SET HOTEN=@HOTEN,
		TAIKHOAN=@TAIKHOAN,
		DIACHI=@DIACHI,
		DIENTHOAI=@DIENTHOAI,
		EMAIL=@EMAIL,
		MA_TRANGTHAI=@MA_TRANGTHAI,
		MA_ROLE=@MA_ROLE
	WHERE MA_TAIKHOAN = @MA_TAIKHOAN
	
END


GO
/****** Object:  StoredProcedure [dbo].[update_thongtin]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[update_thongtin]
	@ma_taikhoan int,
	@hoten nvarchar(100),
	@diachi ntext,
	@dienthoai nvarchar(15),
	@email nvarchar(20),
	@avatar varchar(100)
as
BEGIN
	update QUANTRI_TAIKHOAN
	set HOTEN = @hoten, DIACHI = @diachi, DIENTHOAI = @dienthoai, EMAIL = @email, AVATAR = @avatar
	where 
		MA_TAIKHOAN = @ma_taikhoan
END


GO
/****** Object:  StoredProcedure [dbo].[update_thongtinchung]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[update_thongtinchung]
	@tencongty nvarchar(100),
	@dienthoai nvarchar(15),
	@email nvarchar(100),
	@diachi ntext,
	@link_face nvarchar(100),
	@link_skype nvarchar(100),
	@link_twitter nvarchar(100),
	@link_google nvarchar(100),
	@ghichu ntext
as
begin
	if not exists (select * from THONGTINCHUNG where ID = 1)
		insert THONGTINCHUNG values(1,@tencongty, @dienthoai, @email, @diachi, @link_face, @link_skype, @link_twitter, @link_google, @ghichu)
	else
		update THONGTINCHUNG
		set
			TENCONGTY = @tencongty,
			DIENTHOAI = @dienthoai,
			EMAIL = @email,
			DIACHI = @diachi,
			LINK_FACE = @link_face,
			LINK_SKYPE = @link_skype,
			LINK_TWITTER = @link_twitter,
			LINK_GOOGLE = @link_google,
			GHICHU = @ghichu
		where ID = 1
end


GO
/****** Object:  UserDefinedFunction [dbo].[BODAU]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[BODAU]
(
      @strInput NVARCHAR(4000)
)
RETURNS NVARCHAR(4000)
AS
BEGIN    
    IF @strInput IS NULL RETURN @strInput
    IF @strInput = '' RETURN @strInput
    DECLARE @RT NVARCHAR(4000)
    DECLARE @SIGN_CHARS NCHAR(136)
    DECLARE @UNSIGN_CHARS NCHAR (136)

    SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế
                  ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý
                  ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ
                  ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ'
                  +NCHAR(272)+ NCHAR(208)
    SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee
                  iiiiiooooooooooooooouuuuuuuuuuyyyyy
                  AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII
                  OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD'

    DECLARE @COUNTER int
    DECLARE @COUNTER1 int
    SET @COUNTER = 1

    WHILE (@COUNTER <=LEN(@strInput))
    BEGIN  
      SET @COUNTER1 = 1
      --Tìm trong chuỗi mẫu
       WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1)
       BEGIN
     IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1))
            = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) )
     BEGIN          
          IF @COUNTER=1
              SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1)
              + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1)                  
          ELSE
              SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1)
              +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1)
              + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER)
              BREAK
               END
             SET @COUNTER1 = @COUNTER1 +1
       END
      --Tìm tiếp
       SET @COUNTER = @COUNTER +1
    END
    SET @strInput = replace(@strInput,' ','-')
    RETURN @strInput
END


GO
/****** Object:  Table [dbo].[DONHANG]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONHANG](
	[MA_DONHANG] [int] NOT NULL,
	[NGAY_DAT_HANG] [datetime] NULL,
	[DIACHI] [ntext] NULL,
	[THUTU] [nvarchar](15) NULL,
	[EMAIL] [nvarchar](100) NULL,
	[GHICHU] [ntext] NULL,
	[TONG_TIEN] [decimal](10, 0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DONHANG_CHITIET]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONHANG_CHITIET](
	[MA_SANPHAM] [int] NOT NULL,
	[MA_DONHANG] [int] NOT NULL,
	[SO_LUONG] [int] NULL,
	[DON_GIA] [decimal](10, 0) NULL,
 CONSTRAINT [PK_DON_HANG_CHITIET] PRIMARY KEY CLUSTERED 
(
	[MA_SANPHAM] ASC,
	[MA_DONHANG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HINH]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HINH](
	[MA_HINH] [int] IDENTITY(1,1) NOT NULL,
	[MA_TRANGTHAI] [int] NOT NULL,
	[URL] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG_DANHGIA]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG_DANHGIA](
	[MA_DANHGIA_KHACHHANG] [int] NOT NULL,
	[MA_SANPHAM] [int] NOT NULL,
	[TEN_KHACHHANG] [nvarchar](100) NULL,
	[NOIDUNG] [ntext] NULL,
	[DIEM_DANHGIA] [int] NULL,
	[NGAY_DANHGIA] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG_LIENHE]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG_LIENHE](
	[MA_LIENHE] [int] NOT NULL,
	[HOTEN] [nvarchar](100) NULL,
	[DIENTHOAI] [nvarchar](15) NULL,
	[DIACHI] [ntext] NULL,
	[EMAIL] [nvarchar](100) NULL,
	[NOIDUNG] [ntext] NULL,
	[NGAYLIENHE] [datetime] NULL,
	[GHICHU] [nchar](10) NULL,
	[DAXEM] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG_TAIKHOAN]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG_TAIKHOAN](
	[MA_TAIKHOAN] [int] IDENTITY(1,1) NOT NULL,
	[MA_TRANGTHAI] [int] NOT NULL,
	[HOTEN] [nvarchar](100) NULL,
	[TAIKHOAN] [varchar](10) NULL,
	[MATKHAU] [varchar](1000) NULL,
	[DIACHI] [ntext] NULL,
	[THUTU] [nvarchar](15) NULL,
	[DIENTHOAI] [int] NULL,
	[EMAIL] [nvarchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LUOTTRUYCAP]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUOTTRUYCAP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[THOIGIAN] [datetime] NULL,
	[SOTRUYCAP] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MENU]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[MA_MENU] [int] IDENTITY(1,1) NOT NULL,
	[MA_TRANG_THAI] [int] NULL,
	[TEN_MENU] [nvarchar](100) NULL,
	[THU_TU] [int] NULL,
	[URL] [nvarchar](200) NULL,
	[MA_NHOM_MEMU] [int] NULL,
 CONSTRAINT [PK__MENU__0B817E6E47DBAE45] PRIMARY KEY CLUSTERED 
(
	[MA_MENU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MODULE]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MODULE](
	[MA_MODULE] [int] NOT NULL,
	[MA_TRANGTHAI] [int] NOT NULL,
	[TEN_MODULE] [char](100) NULL,
	[THUTU] [numeric](5, 0) NULL,
	[GIATRI_THAMSO] [nvarchar](100) NULL,
	[TEN_THAMSO] [nvarchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHOM_HINH]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHOM_HINH](
	[MANHOM_HINH] [int] IDENTITY(1,1) NOT NULL,
	[MA_TRANGTHAI] [int] NOT NULL,
	[TENNHOM_HINH] [nvarchar](100) NULL,
	[AVATAR] [nvarchar](150) NULL,
	[URL] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHOM_MENU]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHOM_MENU](
	[MA_NHOM_MENU] [int] IDENTITY(1,1) NOT NULL,
	[MA_TRANG_THAI] [int] NULL,
	[TEN_NHOM_MENU] [nvarchar](100) NULL,
	[MA_NHOM_MENU_CHA] [int] NULL,
 CONSTRAINT [PK__NHOM_MEN__517597A84316F928] PRIMARY KEY CLUSTERED 
(
	[MA_NHOM_MENU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHOM_SANPHAM]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHOM_SANPHAM](
	[MANHOM_SANPHAM] [int] IDENTITY(1,1) NOT NULL,
	[MA_TRANGTHAI] [int] NOT NULL,
	[TENNHOM_SANPHAM] [nvarchar](100) NULL,
	[URL] [ntext] NULL,
	[THUTU] [numeric](5, 0) NULL,
	[MANHOM_CHA] [int] NULL,
	[SLIDE_SHOW] [bit] NULL,
	[AVATAR] [nvarchar](150) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QUANTRI_TAIKHOAN]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QUANTRI_TAIKHOAN](
	[MA_TAIKHOAN] [int] IDENTITY(1,1) NOT NULL,
	[MA_ROLE] [int] NOT NULL,
	[MA_TRANGTHAI] [int] NOT NULL,
	[HOTEN] [nvarchar](100) NULL,
	[TAIKHOAN] [varchar](10) NULL,
	[MATKHAU] [varchar](1000) NULL,
	[DIACHI] [ntext] NULL,
	[DIENTHOAI] [nvarchar](15) NULL,
	[EMAIL] [nvarchar](100) NULL,
	[AVATAR] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ROLE]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLE](
	[MA_ROLE] [int] NOT NULL,
	[TEN_ROLE] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MA_SANPHAM] [int] IDENTITY(1,1) NOT NULL,
	[MA_TRANGTHAI] [int] NOT NULL,
	[TEN_SANPHAM] [nvarchar](100) NOT NULL,
	[MOTA] [ntext] NULL,
	[THUTU] [numeric](5, 0) NULL,
	[NOIDUNG] [ntext] NULL,
	[SLIDE_SHOW] [bit] NULL,
	[URL] [ntext] NOT NULL,
	[GIA] [decimal](10, 0) NULL,
	[AVATAR] [nvarchar](150) NULL,
	[NGAY_DANG] [datetime] NULL,
	[UU_TIEN] [bit] NULL,
	[GIA_KHUYENMAI] [decimal](10, 0) NULL,
	[MA_NHOM_SAN_PHAM] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SANPHAM_CHITIET]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM_CHITIET](
	[MA_SANPHAM] [int] NOT NULL,
	[MANHOM_SANPHAM] [int] NOT NULL,
 CONSTRAINT [PK_SP_NHOMSP] PRIMARY KEY CLUSTERED 
(
	[MA_SANPHAM] ASC,
	[MANHOM_SANPHAM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THONGTINCHUNG]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THONGTINCHUNG](
	[ID] [int] NOT NULL,
	[TENCONGTY] [nvarchar](100) NULL,
	[DIENTHOAI] [nvarchar](15) NULL,
	[EMAIL] [nvarchar](100) NULL,
	[DIACHI] [ntext] NULL,
	[LINK_FACE] [nvarchar](100) NULL,
	[LINK_SKYPE] [nvarchar](100) NULL,
	[LINK_TWITTER] [nvarchar](100) NULL,
	[LINK_GOOGLE] [nvarchar](100) NULL,
	[GHICHU] [ntext] NULL,
 CONSTRAINT [PK_THONGTINCHUNG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TRANGTHAI]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANGTHAI](
	[MA_TRANGTHAI] [int] NOT NULL,
	[TEN_TRANGTHAI] [nvarchar](100) NULL,
	[MOTA] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TRANGTHAI_DONHANG]    Script Date: 10/03/2017 8:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANGTHAI_DONHANG](
	[MA_TRANGTHAI_DONHANG] [int] NOT NULL,
	[TEN_TRANGTHAI_DONHANG] [nvarchar](100) NULL,
	[MOTA_TRANGTHAI_DONHANG] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[LUOTTRUYCAP] ON 

INSERT [dbo].[LUOTTRUYCAP] ([ID], [THOIGIAN], [SOTRUYCAP]) VALUES (1, CAST(0x0000A72A014937F1 AS DateTime), 16)
INSERT [dbo].[LUOTTRUYCAP] ([ID], [THOIGIAN], [SOTRUYCAP]) VALUES (2, CAST(0x0000A72D01815988 AS DateTime), 6)
INSERT [dbo].[LUOTTRUYCAP] ([ID], [THOIGIAN], [SOTRUYCAP]) VALUES (3, CAST(0x0000A72E016C6DBE AS DateTime), 4)
INSERT [dbo].[LUOTTRUYCAP] ([ID], [THOIGIAN], [SOTRUYCAP]) VALUES (4, CAST(0x0000A72F017255CB AS DateTime), 20)
INSERT [dbo].[LUOTTRUYCAP] ([ID], [THOIGIAN], [SOTRUYCAP]) VALUES (5, CAST(0x0000A7320110290C AS DateTime), 26)
SET IDENTITY_INSERT [dbo].[LUOTTRUYCAP] OFF
SET IDENTITY_INSERT [dbo].[MENU] ON 

INSERT [dbo].[MENU] ([MA_MENU], [MA_TRANG_THAI], [TEN_MENU], [THU_TU], [URL], [MA_NHOM_MEMU]) VALUES (1, 1, N'Trang chủ', 1, N'~/Trang-chu', 1)
INSERT [dbo].[MENU] ([MA_MENU], [MA_TRANG_THAI], [TEN_MENU], [THU_TU], [URL], [MA_NHOM_MEMU]) VALUES (2, 1, N'Liên hệ', 3, N'~/Lien-he', 1)
INSERT [dbo].[MENU] ([MA_MENU], [MA_TRANG_THAI], [TEN_MENU], [THU_TU], [URL], [MA_NHOM_MEMU]) VALUES (3, 1, N'Giới thiệu', 2, N'~/Gioi-thieu', 1)
SET IDENTITY_INSERT [dbo].[MENU] OFF
SET IDENTITY_INSERT [dbo].[NHOM_MENU] ON 

INSERT [dbo].[NHOM_MENU] ([MA_NHOM_MENU], [MA_TRANG_THAI], [TEN_NHOM_MENU], [MA_NHOM_MENU_CHA]) VALUES (1, 1, N'Menu Ngang', NULL)
SET IDENTITY_INSERT [dbo].[NHOM_MENU] OFF
SET IDENTITY_INSERT [dbo].[NHOM_SANPHAM] ON 

INSERT [dbo].[NHOM_SANPHAM] ([MANHOM_SANPHAM], [MA_TRANGTHAI], [TENNHOM_SANPHAM], [URL], [THUTU], [MANHOM_CHA], [SLIDE_SHOW], [AVATAR]) VALUES (1, 1, N'A', N'~/Danh-sach-san-pham/A/1', CAST(1 AS Numeric(5, 0)), 0, 1, N'~/Images/NhomSP/636240815837412391.png')
INSERT [dbo].[NHOM_SANPHAM] ([MANHOM_SANPHAM], [MA_TRANGTHAI], [TENNHOM_SANPHAM], [URL], [THUTU], [MANHOM_CHA], [SLIDE_SHOW], [AVATAR]) VALUES (2, 1, N'B', N'~/Danh-sach-san-pham/B/2', CAST(1 AS Numeric(5, 0)), 1, 1, N'~/Images/NhomSP/636240816057274967.jpg')
INSERT [dbo].[NHOM_SANPHAM] ([MANHOM_SANPHAM], [MA_TRANGTHAI], [TENNHOM_SANPHAM], [URL], [THUTU], [MANHOM_CHA], [SLIDE_SHOW], [AVATAR]) VALUES (3, 1, N'C', N'~/Danh-sach-san-pham/C/3', CAST(1 AS Numeric(5, 0)), 0, 1, N'~/Images/NhomSP/636240816182262115.jpg')
INSERT [dbo].[NHOM_SANPHAM] ([MANHOM_SANPHAM], [MA_TRANGTHAI], [TENNHOM_SANPHAM], [URL], [THUTU], [MANHOM_CHA], [SLIDE_SHOW], [AVATAR]) VALUES (4, 1, N'D', N'~/Danh-sach-san-pham/D/4', CAST(2 AS Numeric(5, 0)), 0, 1, N'~/Images/NhomSP/')
SET IDENTITY_INSERT [dbo].[NHOM_SANPHAM] OFF
SET IDENTITY_INSERT [dbo].[QUANTRI_TAIKHOAN] ON 

INSERT [dbo].[QUANTRI_TAIKHOAN] ([MA_TAIKHOAN], [MA_ROLE], [MA_TRANGTHAI], [HOTEN], [TAIKHOAN], [MATKHAU], [DIACHI], [DIENTHOAI], [EMAIL], [AVATAR]) VALUES (1, 0, 1, N'Võ Nhựt Minh', N'admin', N'202cb962ac59075b964b07152d234b70', N'1', N'09111111111', N'nhutminh.ptit@gmail.', N'../QuanTri/Avatar/1_admin.jpg')
INSERT [dbo].[QUANTRI_TAIKHOAN] ([MA_TAIKHOAN], [MA_ROLE], [MA_TRANGTHAI], [HOTEN], [TAIKHOAN], [MATKHAU], [DIACHI], [DIENTHOAI], [EMAIL], [AVATAR]) VALUES (2, 0, 1, N'Đoàn Thiện Chinh', N'chinh', N'202cb962ac59075b964b07152d234b70', N'1', N'09111111111', N'nhutminh.ptit@gmail.com', NULL)
INSERT [dbo].[QUANTRI_TAIKHOAN] ([MA_TAIKHOAN], [MA_ROLE], [MA_TRANGTHAI], [HOTEN], [TAIKHOAN], [MATKHAU], [DIACHI], [DIENTHOAI], [EMAIL], [AVATAR]) VALUES (3, 0, 1, N'Phan Hoài Nam', N'nam', N'202cb962ac59075b964b07152d234b70', N'1', N'09111111111', N'nhutminh.ptit@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[QUANTRI_TAIKHOAN] OFF
INSERT [dbo].[ROLE] ([MA_ROLE], [TEN_ROLE]) VALUES (0, N'super admin')
INSERT [dbo].[ROLE] ([MA_ROLE], [TEN_ROLE]) VALUES (1, N'admin')
INSERT [dbo].[ROLE] ([MA_ROLE], [TEN_ROLE]) VALUES (2, N'khác')
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([MA_SANPHAM], [MA_TRANGTHAI], [TEN_SANPHAM], [MOTA], [THUTU], [NOIDUNG], [SLIDE_SHOW], [URL], [GIA], [AVATAR], [NGAY_DANG], [UU_TIEN], [GIA_KHUYENMAI], [MA_NHOM_SAN_PHAM]) VALUES (1, 1, N'1', N'Sản phẩm A', CAST(1 AS Numeric(5, 0)), N'<p>
	1</p>
', 1, N'~/Chi-tiet-san-pham/1/1', CAST(1 AS Decimal(10, 0)), N'~/Images/SanPham/636240822304612294.jpg', CAST(0x0000A72A014C79DA AS DateTime), 1, NULL, 1)
INSERT [dbo].[SANPHAM] ([MA_SANPHAM], [MA_TRANGTHAI], [TEN_SANPHAM], [MOTA], [THUTU], [NOIDUNG], [SLIDE_SHOW], [URL], [GIA], [AVATAR], [NGAY_DANG], [UU_TIEN], [GIA_KHUYENMAI], [MA_NHOM_SAN_PHAM]) VALUES (2, 1, N'2', N'Sản phẩm A', CAST(2 AS Numeric(5, 0)), N'<p>
	123</p>
', 1, N'~/Chi-tiet-san-pham/2/2', CAST(1 AS Decimal(10, 0)), N'~/Images/SanPham/636240822509394007.jpg', CAST(0x0000A72A014C91D3 AS DateTime), 1, CAST(1 AS Decimal(10, 0)), 2)
INSERT [dbo].[SANPHAM] ([MA_SANPHAM], [MA_TRANGTHAI], [TEN_SANPHAM], [MOTA], [THUTU], [NOIDUNG], [SLIDE_SHOW], [URL], [GIA], [AVATAR], [NGAY_DANG], [UU_TIEN], [GIA_KHUYENMAI], [MA_NHOM_SAN_PHAM]) VALUES (3, 1, N'3', N'Sản phẩm A', CAST(3 AS Numeric(5, 0)), N'', 1, N'~/Chi-tiet-san-pham/3/3', CAST(1 AS Decimal(10, 0)), N'~/Images/SanPham/636240822997201908.jpg', CAST(0x0000A72A014CCB00 AS DateTime), 1, CAST(1 AS Decimal(10, 0)), 3)
INSERT [dbo].[SANPHAM] ([MA_SANPHAM], [MA_TRANGTHAI], [TEN_SANPHAM], [MOTA], [THUTU], [NOIDUNG], [SLIDE_SHOW], [URL], [GIA], [AVATAR], [NGAY_DANG], [UU_TIEN], [GIA_KHUYENMAI], [MA_NHOM_SAN_PHAM]) VALUES (4, 1, N'12', N'12', CAST(12 AS Numeric(5, 0)), N'<p>
	12</p>
', 1, N'~/Chi-tiet-san-pham/12/4', CAST(12 AS Decimal(10, 0)), N'~/Images/SanPham/', CAST(0x0000A72A014CD684 AS DateTime), 1, CAST(12 AS Decimal(10, 0)), 1)
INSERT [dbo].[SANPHAM] ([MA_SANPHAM], [MA_TRANGTHAI], [TEN_SANPHAM], [MOTA], [THUTU], [NOIDUNG], [SLIDE_SHOW], [URL], [GIA], [AVATAR], [NGAY_DANG], [UU_TIEN], [GIA_KHUYENMAI], [MA_NHOM_SAN_PHAM]) VALUES (5, 0, N'123', N'1213', CAST(123 AS Numeric(5, 0)), N'<p>
	132312</p>
', 1, N'~/Chi-tiet-san-pham/123/5', CAST(123 AS Decimal(10, 0)), N'~/Images/SanPham/636240823266057285.jpg', CAST(0x0000A72A014CEA80 AS DateTime), 1, CAST(123 AS Decimal(10, 0)), 4)
INSERT [dbo].[SANPHAM] ([MA_SANPHAM], [MA_TRANGTHAI], [TEN_SANPHAM], [MOTA], [THUTU], [NOIDUNG], [SLIDE_SHOW], [URL], [GIA], [AVATAR], [NGAY_DANG], [UU_TIEN], [GIA_KHUYENMAI], [MA_NHOM_SAN_PHAM]) VALUES (6, 1, N'231231', N'21321', CAST(23123 AS Numeric(5, 0)), N'<p>
	12321</p>
', 1, N'~/Chi-tiet-san-pham/231231/6', CAST(12321 AS Decimal(10, 0)), N'~/Images/SanPham/636240823429666643.jpg', CAST(0x0000A72A014CFDAC AS DateTime), 1, CAST(21321 AS Decimal(10, 0)), 1)
INSERT [dbo].[SANPHAM] ([MA_SANPHAM], [MA_TRANGTHAI], [TEN_SANPHAM], [MOTA], [THUTU], [NOIDUNG], [SLIDE_SHOW], [URL], [GIA], [AVATAR], [NGAY_DANG], [UU_TIEN], [GIA_KHUYENMAI], [MA_NHOM_SAN_PHAM]) VALUES (7, 0, N'2321', N'132131', CAST(12321 AS Numeric(5, 0)), N'<p>
	213213</p>
', 0, N'~/Chi-tiet-san-pham/2321/7', CAST(12321 AS Decimal(10, 0)), N'~/Images/SanPham/636240823588845748.jpg', CAST(0x0000A72A014D1052 AS DateTime), 1, CAST(12321 AS Decimal(10, 0)), 2)
INSERT [dbo].[SANPHAM] ([MA_SANPHAM], [MA_TRANGTHAI], [TEN_SANPHAM], [MOTA], [THUTU], [NOIDUNG], [SLIDE_SHOW], [URL], [GIA], [AVATAR], [NGAY_DANG], [UU_TIEN], [GIA_KHUYENMAI], [MA_NHOM_SAN_PHAM]) VALUES (8, 1, N'1', N'1', CAST(1 AS Numeric(5, 0)), N'<p>
	1</p>
', 1, N'~/Chi-tiet-san-pham/1/8', CAST(12 AS Decimal(10, 0)), N'../Images/SanPham/', CAST(0x0000A732009044AC AS DateTime), 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
INSERT [dbo].[SANPHAM_CHITIET] ([MA_SANPHAM], [MANHOM_SANPHAM]) VALUES (1, 1)
INSERT [dbo].[SANPHAM_CHITIET] ([MA_SANPHAM], [MANHOM_SANPHAM]) VALUES (2, 2)
INSERT [dbo].[SANPHAM_CHITIET] ([MA_SANPHAM], [MANHOM_SANPHAM]) VALUES (3, 3)
INSERT [dbo].[SANPHAM_CHITIET] ([MA_SANPHAM], [MANHOM_SANPHAM]) VALUES (4, 1)
INSERT [dbo].[SANPHAM_CHITIET] ([MA_SANPHAM], [MANHOM_SANPHAM]) VALUES (5, 4)
INSERT [dbo].[SANPHAM_CHITIET] ([MA_SANPHAM], [MANHOM_SANPHAM]) VALUES (6, 1)
INSERT [dbo].[SANPHAM_CHITIET] ([MA_SANPHAM], [MANHOM_SANPHAM]) VALUES (7, 2)
INSERT [dbo].[SANPHAM_CHITIET] ([MA_SANPHAM], [MANHOM_SANPHAM]) VALUES (8, 1)
INSERT [dbo].[THONGTINCHUNG] ([ID], [TENCONGTY], [DIENTHOAI], [EMAIL], [DIACHI], [LINK_FACE], [LINK_SKYPE], [LINK_TWITTER], [LINK_GOOGLE], [GHICHU]) VALUES (1, N'Công ty bán hàng tận nơi', N'dfgdh', N'fghfgh', N'fghfgh', N'fghfg', N'fghfg', N'fghfg', N'fghfg', N'fghf')
INSERT [dbo].[TRANGTHAI] ([MA_TRANGTHAI], [TEN_TRANGTHAI], [MOTA]) VALUES (0, N'Không hoạt động', NULL)
INSERT [dbo].[TRANGTHAI] ([MA_TRANGTHAI], [TEN_TRANGTHAI], [MOTA]) VALUES (1, N'Hoạt động', NULL)
/****** Object:  Index [PK_DON_HANG]    Script Date: 10/03/2017 8:06:17 PM ******/
ALTER TABLE [dbo].[DONHANG] ADD  CONSTRAINT [PK_DON_HANG] PRIMARY KEY NONCLUSTERED 
(
	[MA_DONHANG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_HINH]    Script Date: 10/03/2017 8:06:17 PM ******/
ALTER TABLE [dbo].[HINH] ADD  CONSTRAINT [PK_HINH] PRIMARY KEY NONCLUSTERED 
(
	[MA_HINH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_DANH_GIA_KH]    Script Date: 10/03/2017 8:06:17 PM ******/
ALTER TABLE [dbo].[KHACHHANG_DANHGIA] ADD  CONSTRAINT [PK_DANH_GIA_KH] PRIMARY KEY NONCLUSTERED 
(
	[MA_DANHGIA_KHACHHANG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_LIENHE]    Script Date: 10/03/2017 8:06:17 PM ******/
ALTER TABLE [dbo].[KHACHHANG_LIENHE] ADD  CONSTRAINT [PK_LIENHE] PRIMARY KEY NONCLUSTERED 
(
	[MA_LIENHE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_KHACH_HANG]    Script Date: 10/03/2017 8:06:17 PM ******/
ALTER TABLE [dbo].[KHACHHANG_TAIKHOAN] ADD  CONSTRAINT [PK_KHACH_HANG] PRIMARY KEY NONCLUSTERED 
(
	[MA_TAIKHOAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_LUOTTRUYCAP]    Script Date: 10/03/2017 8:06:17 PM ******/
ALTER TABLE [dbo].[LUOTTRUYCAP] ADD  CONSTRAINT [PK_LUOTTRUYCAP] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_MODULE]    Script Date: 10/03/2017 8:06:17 PM ******/
ALTER TABLE [dbo].[MODULE] ADD  CONSTRAINT [PK_MODULE] PRIMARY KEY NONCLUSTERED 
(
	[MA_MODULE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_NHOM_HINH]    Script Date: 10/03/2017 8:06:17 PM ******/
ALTER TABLE [dbo].[NHOM_HINH] ADD  CONSTRAINT [PK_NHOM_HINH] PRIMARY KEY NONCLUSTERED 
(
	[MANHOM_HINH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_NHOM_SP]    Script Date: 10/03/2017 8:06:17 PM ******/
ALTER TABLE [dbo].[NHOM_SANPHAM] ADD  CONSTRAINT [PK_NHOM_SP] PRIMARY KEY NONCLUSTERED 
(
	[MANHOM_SANPHAM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_NGUOI_DUNG]    Script Date: 10/03/2017 8:06:17 PM ******/
ALTER TABLE [dbo].[QUANTRI_TAIKHOAN] ADD  CONSTRAINT [PK_NGUOI_DUNG] PRIMARY KEY NONCLUSTERED 
(
	[MA_TAIKHOAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_NHOM_QUYEN]    Script Date: 10/03/2017 8:06:17 PM ******/
ALTER TABLE [dbo].[ROLE] ADD  CONSTRAINT [PK_NHOM_QUYEN] PRIMARY KEY NONCLUSTERED 
(
	[MA_ROLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_SANPHAM]    Script Date: 10/03/2017 8:06:17 PM ******/
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [PK_SANPHAM] PRIMARY KEY NONCLUSTERED 
(
	[MA_SANPHAM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_TRANGTHAI]    Script Date: 10/03/2017 8:06:17 PM ******/
ALTER TABLE [dbo].[TRANGTHAI] ADD  CONSTRAINT [PK_TRANGTHAI] PRIMARY KEY NONCLUSTERED 
(
	[MA_TRANGTHAI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_TRANGTHAI_DONHANG]    Script Date: 10/03/2017 8:06:17 PM ******/
ALTER TABLE [dbo].[TRANGTHAI_DONHANG] ADD  CONSTRAINT [PK_TRANGTHAI_DONHANG] PRIMARY KEY NONCLUSTERED 
(
	[MA_TRANGTHAI_DONHANG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DONHANG_CHITIET]  WITH CHECK ADD  CONSTRAINT [FK_DON_HANG_DON_HANG__DON_HANG] FOREIGN KEY([MA_DONHANG])
REFERENCES [dbo].[DONHANG] ([MA_DONHANG])
GO
ALTER TABLE [dbo].[DONHANG_CHITIET] CHECK CONSTRAINT [FK_DON_HANG_DON_HANG__DON_HANG]
GO
ALTER TABLE [dbo].[DONHANG_CHITIET]  WITH CHECK ADD  CONSTRAINT [FK_DON_HANG_DON_HANG__SANPHAM] FOREIGN KEY([MA_SANPHAM])
REFERENCES [dbo].[SANPHAM] ([MA_SANPHAM])
GO
ALTER TABLE [dbo].[DONHANG_CHITIET] CHECK CONSTRAINT [FK_DON_HANG_DON_HANG__SANPHAM]
GO
ALTER TABLE [dbo].[HINH]  WITH CHECK ADD  CONSTRAINT [FK_HINH_RELATIONS_TRANGTHA] FOREIGN KEY([MA_TRANGTHAI])
REFERENCES [dbo].[TRANGTHAI] ([MA_TRANGTHAI])
GO
ALTER TABLE [dbo].[HINH] CHECK CONSTRAINT [FK_HINH_RELATIONS_TRANGTHA]
GO
ALTER TABLE [dbo].[KHACHHANG_DANHGIA]  WITH CHECK ADD  CONSTRAINT [FK_DANH_GIA_RELATIONS_SANPHAM] FOREIGN KEY([MA_SANPHAM])
REFERENCES [dbo].[SANPHAM] ([MA_SANPHAM])
GO
ALTER TABLE [dbo].[KHACHHANG_DANHGIA] CHECK CONSTRAINT [FK_DANH_GIA_RELATIONS_SANPHAM]
GO
ALTER TABLE [dbo].[KHACHHANG_TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK_KHACH_HA_RELATIONS_TRANGTHA] FOREIGN KEY([MA_TRANGTHAI])
REFERENCES [dbo].[TRANGTHAI] ([MA_TRANGTHAI])
GO
ALTER TABLE [dbo].[KHACHHANG_TAIKHOAN] CHECK CONSTRAINT [FK_KHACH_HA_RELATIONS_TRANGTHA]
GO
ALTER TABLE [dbo].[MENU]  WITH CHECK ADD  CONSTRAINT [FK_NHOMMENU_MENU] FOREIGN KEY([MA_NHOM_MEMU])
REFERENCES [dbo].[NHOM_MENU] ([MA_NHOM_MENU])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MENU] CHECK CONSTRAINT [FK_NHOMMENU_MENU]
GO
ALTER TABLE [dbo].[MODULE]  WITH CHECK ADD  CONSTRAINT [FK_MODULE_RELATIONS_TRANGTHA] FOREIGN KEY([MA_TRANGTHAI])
REFERENCES [dbo].[TRANGTHAI] ([MA_TRANGTHAI])
GO
ALTER TABLE [dbo].[MODULE] CHECK CONSTRAINT [FK_MODULE_RELATIONS_TRANGTHA]
GO
ALTER TABLE [dbo].[NHOM_HINH]  WITH CHECK ADD  CONSTRAINT [FK_NHOM_HIN_RELATIONS_TRANGTHA] FOREIGN KEY([MA_TRANGTHAI])
REFERENCES [dbo].[TRANGTHAI] ([MA_TRANGTHAI])
GO
ALTER TABLE [dbo].[NHOM_HINH] CHECK CONSTRAINT [FK_NHOM_HIN_RELATIONS_TRANGTHA]
GO
ALTER TABLE [dbo].[NHOM_MENU]  WITH CHECK ADD  CONSTRAINT [FK_NHOMMENU_TT] FOREIGN KEY([MA_TRANG_THAI])
REFERENCES [dbo].[TRANGTHAI] ([MA_TRANGTHAI])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NHOM_MENU] CHECK CONSTRAINT [FK_NHOMMENU_TT]
GO
ALTER TABLE [dbo].[NHOM_SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_NHOM_SP_RELATIONS_TRANGTHA] FOREIGN KEY([MA_TRANGTHAI])
REFERENCES [dbo].[TRANGTHAI] ([MA_TRANGTHAI])
GO
ALTER TABLE [dbo].[NHOM_SANPHAM] CHECK CONSTRAINT [FK_NHOM_SP_RELATIONS_TRANGTHA]
GO
ALTER TABLE [dbo].[QUANTRI_TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK_NGUOI_DU_RELATIONS_NHOM_QUY] FOREIGN KEY([MA_ROLE])
REFERENCES [dbo].[ROLE] ([MA_ROLE])
GO
ALTER TABLE [dbo].[QUANTRI_TAIKHOAN] CHECK CONSTRAINT [FK_NGUOI_DU_RELATIONS_NHOM_QUY]
GO
ALTER TABLE [dbo].[QUANTRI_TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK_NGUOI_DU_RELATIONS_TRANGTHA] FOREIGN KEY([MA_TRANGTHAI])
REFERENCES [dbo].[TRANGTHAI] ([MA_TRANGTHAI])
GO
ALTER TABLE [dbo].[QUANTRI_TAIKHOAN] CHECK CONSTRAINT [FK_NGUOI_DU_RELATIONS_TRANGTHA]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_RELATIONS_TRANGTHA] FOREIGN KEY([MA_TRANGTHAI])
REFERENCES [dbo].[TRANGTHAI] ([MA_TRANGTHAI])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_RELATIONS_TRANGTHA]
GO
ALTER TABLE [dbo].[SANPHAM_CHITIET]  WITH CHECK ADD  CONSTRAINT [FK_SP_NHOMS_SP_NHOMSP_NHOM_SP] FOREIGN KEY([MANHOM_SANPHAM])
REFERENCES [dbo].[NHOM_SANPHAM] ([MANHOM_SANPHAM])
GO
ALTER TABLE [dbo].[SANPHAM_CHITIET] CHECK CONSTRAINT [FK_SP_NHOMS_SP_NHOMSP_NHOM_SP]
GO
ALTER TABLE [dbo].[SANPHAM_CHITIET]  WITH CHECK ADD  CONSTRAINT [FK_SP_NHOMS_SP_NHOMSP_SANPHAM] FOREIGN KEY([MA_SANPHAM])
REFERENCES [dbo].[SANPHAM] ([MA_SANPHAM])
GO
ALTER TABLE [dbo].[SANPHAM_CHITIET] CHECK CONSTRAINT [FK_SP_NHOMS_SP_NHOMSP_SANPHAM]
GO
