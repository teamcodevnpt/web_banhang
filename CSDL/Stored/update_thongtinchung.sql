create procedure update_thongtinchung
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
	if exists (select * from THONGTINCHUNG where ID = 1)
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