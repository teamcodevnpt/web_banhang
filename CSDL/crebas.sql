/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     13-Feb-17 9:12:27 PM                         */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DANH_GIA_KH') and o.name = 'FK_DANH_GIA_RELATIONS_SANPHAM')
alter table DANH_GIA_KH
   drop constraint FK_DANH_GIA_RELATIONS_SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DON_HANG_CHITIET') and o.name = 'FK_DON_HANG_DON_HANG__SANPHAM')
alter table DON_HANG_CHITIET
   drop constraint FK_DON_HANG_DON_HANG__SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DON_HANG_CHITIET') and o.name = 'FK_DON_HANG_DON_HANG__DON_HANG')
alter table DON_HANG_CHITIET
   drop constraint FK_DON_HANG_DON_HANG__DON_HANG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HINH') and o.name = 'FK_HINH_RELATIONS_TRANGTHA')
alter table HINH
   drop constraint FK_HINH_RELATIONS_TRANGTHA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KHACH_HANG') and o.name = 'FK_KHACH_HA_RELATIONS_TRANGTHA')
alter table KHACH_HANG
   drop constraint FK_KHACH_HA_RELATIONS_TRANGTHA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MODULE') and o.name = 'FK_MODULE_RELATIONS_TRANGTHA')
alter table MODULE
   drop constraint FK_MODULE_RELATIONS_TRANGTHA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NGUOI_DUNG') and o.name = 'FK_NGUOI_DU_RELATIONS_NHOM_QUY')
alter table NGUOI_DUNG
   drop constraint FK_NGUOI_DU_RELATIONS_NHOM_QUY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NGUOI_DUNG') and o.name = 'FK_NGUOI_DU_RELATIONS_TRANGTHA')
alter table NGUOI_DUNG
   drop constraint FK_NGUOI_DU_RELATIONS_TRANGTHA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NHOM_HINH') and o.name = 'FK_NHOM_HIN_RELATIONS_TRANGTHA')
alter table NHOM_HINH
   drop constraint FK_NHOM_HIN_RELATIONS_TRANGTHA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NHOM_SP') and o.name = 'FK_NHOM_SP_RELATIONS_TRANGTHA')
alter table NHOM_SP
   drop constraint FK_NHOM_SP_RELATIONS_TRANGTHA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SANPHAM') and o.name = 'FK_SANPHAM_RELATIONS_TRANGTHA')
alter table SANPHAM
   drop constraint FK_SANPHAM_RELATIONS_TRANGTHA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SP_NHOMSP') and o.name = 'FK_SP_NHOMS_SP_NHOMSP_SANPHAM')
alter table SP_NHOMSP
   drop constraint FK_SP_NHOMS_SP_NHOMSP_SANPHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SP_NHOMSP') and o.name = 'FK_SP_NHOMS_SP_NHOMSP_NHOM_SP')
alter table SP_NHOMSP
   drop constraint FK_SP_NHOMS_SP_NHOMSP_NHOM_SP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DANH_GIA_KH')
            and   name  = 'RELATIONSHIP_9_FK'
            and   indid > 0
            and   indid < 255)
   drop index DANH_GIA_KH.RELATIONSHIP_9_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DANH_GIA_KH')
            and   type = 'U')
   drop table DANH_GIA_KH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DON_HANG')
            and   type = 'U')
   drop table DON_HANG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DON_HANG_CHITIET')
            and   name  = 'DON_HANG_CHITIET2_FK'
            and   indid > 0
            and   indid < 255)
   drop index DON_HANG_CHITIET.DON_HANG_CHITIET2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DON_HANG_CHITIET')
            and   name  = 'DON_HANG_CHITIET_FK'
            and   indid > 0
            and   indid < 255)
   drop index DON_HANG_CHITIET.DON_HANG_CHITIET_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DON_HANG_CHITIET')
            and   type = 'U')
   drop table DON_HANG_CHITIET
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('HINH')
            and   name  = 'RELATIONSHIP_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index HINH.RELATIONSHIP_4_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HINH')
            and   type = 'U')
   drop table HINH
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KHACH_HANG')
            and   name  = 'RELATIONSHIP_6_FK'
            and   indid > 0
            and   indid < 255)
   drop index KHACH_HANG.RELATIONSHIP_6_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHACH_HANG')
            and   type = 'U')
   drop table KHACH_HANG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LIENHE')
            and   type = 'U')
   drop table LIENHE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LUOTTRUYCAP')
            and   type = 'U')
   drop table LUOTTRUYCAP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MODULE')
            and   name  = 'RELATIONSHIP_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index MODULE.RELATIONSHIP_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MODULE')
            and   type = 'U')
   drop table MODULE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NGUOI_DUNG')
            and   name  = 'RELATIONSHIP_8_FK'
            and   indid > 0
            and   indid < 255)
   drop index NGUOI_DUNG.RELATIONSHIP_8_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NGUOI_DUNG')
            and   name  = 'RELATIONSHIP_7_FK'
            and   indid > 0
            and   indid < 255)
   drop index NGUOI_DUNG.RELATIONSHIP_7_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NGUOI_DUNG')
            and   type = 'U')
   drop table NGUOI_DUNG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NHOM_HINH')
            and   name  = 'RELATIONSHIP_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index NHOM_HINH.RELATIONSHIP_2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHOM_HINH')
            and   type = 'U')
   drop table NHOM_HINH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHOM_QUYEN')
            and   type = 'U')
   drop table NHOM_QUYEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NHOM_SP')
            and   name  = 'RELATIONSHIP_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index NHOM_SP.RELATIONSHIP_5_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHOM_SP')
            and   type = 'U')
   drop table NHOM_SP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SANPHAM')
            and   name  = 'RELATIONSHIP_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index SANPHAM.RELATIONSHIP_3_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SANPHAM')
            and   type = 'U')
   drop table SANPHAM
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SP_NHOMSP')
            and   name  = 'SP_NHOMSP2_FK'
            and   indid > 0
            and   indid < 255)
   drop index SP_NHOMSP.SP_NHOMSP2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SP_NHOMSP')
            and   name  = 'SP_NHOMSP_FK'
            and   indid > 0
            and   indid < 255)
   drop index SP_NHOMSP.SP_NHOMSP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SP_NHOMSP')
            and   type = 'U')
   drop table SP_NHOMSP
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THONGTIN_CTY')
            and   type = 'U')
   drop table THONGTIN_CTY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TRANGTHAI')
            and   type = 'U')
   drop table TRANGTHAI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TRANGTHAI_DONHANG')
            and   type = 'U')
   drop table TRANGTHAI_DONHANG
go

/*==============================================================*/
/* Table: DANH_GIA_KH                                           */
/*==============================================================*/
create table DANH_GIA_KH (
   MA_DANHGIA_KH        int                  not null,
   MA_SP                int                  not null,
   TEN_KH               nvarchar(100)         null,
   NOIDUNG              ntext                 null,
   DIEM_DANHGIA         int                  null,
   NGAY_DANHGIA         datetime             null,
   constraint PK_DANH_GIA_KH primary key nonclustered (MA_DANHGIA_KH)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_9_FK on DANH_GIA_KH (
MA_SP ASC
)
go

/*==============================================================*/
/* Table: DON_HANG                                              */
/*==============================================================*/
create table DON_HANG (
   MA_DON_HANG          int                  not null,
   NGAY_DAT_HANG        datetime             null,
   DIACHI               ntext                 null,
   SDT                  nvarchar(15)          null,
   EMAIL                nvarchar(100)         null,
   GHICHU               ntext                 null,
   TONG_TIEN            decimal(10)          null,
   constraint PK_DON_HANG primary key nonclustered (MA_DON_HANG)
)
go

/*==============================================================*/
/* Table: DON_HANG_CHITIET                                      */
/*==============================================================*/
create table DON_HANG_CHITIET (
   MA_SP                int                  not null,
   MA_DON_HANG          int                  not null,
   SO_LUONG             int                  null,
   DON_GIA              decimal(10)          null,
   constraint PK_DON_HANG_CHITIET primary key (MA_SP, MA_DON_HANG)
)
go

/*==============================================================*/
/* Index: DON_HANG_CHITIET_FK                                   */
/*==============================================================*/
create index DON_HANG_CHITIET_FK on DON_HANG_CHITIET (
MA_SP ASC
)
go

/*==============================================================*/
/* Index: DON_HANG_CHITIET2_FK                                  */
/*==============================================================*/
create index DON_HANG_CHITIET2_FK on DON_HANG_CHITIET (
MA_DON_HANG ASC
)
go

/*==============================================================*/
/* Table: HINH                                                  */
/*==============================================================*/
create table HINH (
   MA_HINH              int                  not null,
   MA_TT                int                  not null,
   URL                  ntext                 null,
   constraint PK_HINH primary key nonclustered (MA_HINH)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on HINH (
MA_TT ASC
)
go

/*==============================================================*/
/* Table: KHACH_HANG                                            */
/*==============================================================*/
create table KHACH_HANG (
   MA_KH                int                  not null,
   MA_TT                int                  not null,
   TEN_KH               nvarchar(100)         null,
   TAIKHOAN             nvarchar(100)         null,
   MATKHAU              nvarchar(100)         null,
   DIACHI               ntext                 null,
   SDT                  nvarchar(15)          null,
   EMAIL                nvarchar(100)         null,
   constraint PK_KHACH_HANG primary key nonclustered (MA_KH)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on KHACH_HANG (
MA_TT ASC
)
go

/*==============================================================*/
/* Table: LIENHE                                                */
/*==============================================================*/
create table LIENHE (
   MA_LIENHE            int                  not null,
   TEN_NGUOIGUI         nvarchar(100)         null,
   SDT                  nvarchar(15)          null,
   DIACHI               ntext                 null,
   EMAIL                nvarchar(100)         null,
   NOIDUNG              ntext                 null,
   NGAY_GUI             datetime             null,
   DA_XEM               bit                  null,
   constraint PK_LIENHE primary key nonclustered (MA_LIENHE)
)
go

/*==============================================================*/
/* Table: LUOTTRUYCAP                                           */
/*==============================================================*/
create table LUOTTRUYCAP (
   ID                   int                  not null,
   THOIGIAN             datetime             null,
   SOTRUYCAP            smallint             null,
   constraint PK_LUOTTRUYCAP primary key nonclustered (ID)
)
go

/*==============================================================*/
/* Table: MODULE                                                */
/*==============================================================*/
create table MODULE (
   MA_MODULE            int                  not null,
   MA_TT                int                  not null,
   TEN_MODULE           char(100)            null,
   STT                  numeric(5)           null,
   GIATRI_THAMSO        nvarchar(100)         null,
   TEN_THAMSO           nvarchar(100)         null,
   constraint PK_MODULE primary key nonclustered (MA_MODULE)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on MODULE (
MA_TT ASC
)
go

/*==============================================================*/
/* Table: NGUOI_DUNG                                            */
/*==============================================================*/
create table NGUOI_DUNG (
   MA_ND                int                  not null,
   MA_NHOM_QUYEN        int                  not null,
   MA_TT                int                  not null,
   TEN_ND               nvarchar(100)         null,
   TAIKHOAN             nvarchar(100)         null,
   MATKHAU              nvarchar(100)         null,
   DIACHI               ntext                 null,
   SDT                  nvarchar(15)          null,
   EMAIL                nvarchar(100)         null,
   constraint PK_NGUOI_DUNG primary key nonclustered (MA_ND)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on NGUOI_DUNG (
MA_NHOM_QUYEN ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on NGUOI_DUNG (
MA_TT ASC
)
go

/*==============================================================*/
/* Table: NHOM_HINH                                             */
/*==============================================================*/
create table NHOM_HINH (
   MANHOM_HINH          int                  not null,
   MA_TT                int                  not null,
   TENNHOM_HINH         nvarchar(100)         null,
   ANH_DD               nvarchar(150)         null,
   URL                  ntext                 null,
   constraint PK_NHOM_HINH primary key nonclustered (MANHOM_HINH)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on NHOM_HINH (
MA_TT ASC
)
go

/*==============================================================*/
/* Table: NHOM_QUYEN                                            */
/*==============================================================*/
create table NHOM_QUYEN (
   MA_NHOM_QUYEN        int                  not null,
   TEN_NHOM_QUYEN       nvarchar(100)         null,
   constraint PK_NHOM_QUYEN primary key nonclustered (MA_NHOM_QUYEN)
)
go

/*==============================================================*/
/* Table: NHOM_SP                                               */
/*==============================================================*/
create table NHOM_SP (
   MANHOM_SP            int                  not null,
   MA_TT                int                  not null,
   TENNHOM_HINH         nvarchar(100)         null,
   URL                  ntext                 null,
   STT                  numeric(5)           null,
   MANHOM_CHA           int                  null,
   SLIDE_SHOW           bit                  null,
   ANH_DD               nvarchar(150)         null,
   constraint PK_NHOM_SP primary key nonclustered (MANHOM_SP)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on NHOM_SP (
MA_TT ASC
)
go

/*==============================================================*/
/* Table: SANPHAM                                               */
/*==============================================================*/
create table SANPHAM (
   MA_SP                int                  not null,
   MA_TT                int                  not null,
   TEN_SP               nvarchar(100)         not null,
   MOTA                 ntext                 null,
   TRANGTHAI            bit                  not null,
   STT                  numeric(5)           null,
   NOIDUNG              ntext                 null,
   SLIDE_SHOW           bit                  null,
   URL                  ntext                 not null,
   GIA                  decimal(10)          null,
   ANH_DD               nvarchar(150)         null,
   NGAY_DANG            datetime             null,
   UU_TIEN              bit                  null,
   GIA_KM               decimal(10)          null,
   constraint PK_SANPHAM primary key nonclustered (MA_SP)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on SANPHAM (
MA_TT ASC
)
go

/*==============================================================*/
/* Table: SP_NHOMSP                                             */
/*==============================================================*/
create table SP_NHOMSP (
   MA_SP                int                  not null,
   MANHOM_SP            int                  not null,
   constraint PK_SP_NHOMSP primary key (MA_SP, MANHOM_SP)
)
go

/*==============================================================*/
/* Index: SP_NHOMSP_FK                                          */
/*==============================================================*/
create index SP_NHOMSP_FK on SP_NHOMSP (
MA_SP ASC
)
go

/*==============================================================*/
/* Index: SP_NHOMSP2_FK                                         */
/*==============================================================*/
create index SP_NHOMSP2_FK on SP_NHOMSP (
MANHOM_SP ASC
)
go

/*==============================================================*/
/* Table: THONGTIN_CTY                                          */
/*==============================================================*/
create table THONGTIN_CTY (
   TEN_CTY              nvarchar(100)         null,
   SDT                  nvarchar(15)          null,
   EMAIL                nvarchar(100)         null,
   DIACHI               ntext                 null,
   LINK_FACE            nvarchar(100)         null,
   LINK_SKYPE           nvarchar(100)         null,
   LINK_TWITTER         nvarchar(100)         null,
   LINK_GOOGLE          nvarchar(100)         null,
   GHICHU               ntext                 null
)
go

/*==============================================================*/
/* Table: TRANGTHAI                                             */
/*==============================================================*/
create table TRANGTHAI (
   MA_TT                int                  not null,
   TEN_TT               nvarchar(100)         null,
   MOTA_TT              ntext                 null,
   constraint PK_TRANGTHAI primary key nonclustered (MA_TT)
)
go

/*==============================================================*/
/* Table: TRANGTHAI_DONHANG                                     */
/*==============================================================*/
create table TRANGTHAI_DONHANG (
   MA_TRANGTHAI_DONHANG int                  not null,
   TEN_TRANGTHAI_DONHANG nvarchar(100)         null,
   MOTA_TRANGTHAI_DONHANG ntext                 null,
   constraint PK_TRANGTHAI_DONHANG primary key nonclustered (MA_TRANGTHAI_DONHANG)
)
go

alter table DANH_GIA_KH
   add constraint FK_DANH_GIA_RELATIONS_SANPHAM foreign key (MA_SP)
      references SANPHAM (MA_SP)
go

alter table DON_HANG_CHITIET
   add constraint FK_DON_HANG_DON_HANG__SANPHAM foreign key (MA_SP)
      references SANPHAM (MA_SP)
go

alter table DON_HANG_CHITIET
   add constraint FK_DON_HANG_DON_HANG__DON_HANG foreign key (MA_DON_HANG)
      references DON_HANG (MA_DON_HANG)
go

alter table HINH
   add constraint FK_HINH_RELATIONS_TRANGTHA foreign key (MA_TT)
      references TRANGTHAI (MA_TT)
go

alter table KHACH_HANG
   add constraint FK_KHACH_HA_RELATIONS_TRANGTHA foreign key (MA_TT)
      references TRANGTHAI (MA_TT)
go

alter table MODULE
   add constraint FK_MODULE_RELATIONS_TRANGTHA foreign key (MA_TT)
      references TRANGTHAI (MA_TT)
go

alter table NGUOI_DUNG
   add constraint FK_NGUOI_DU_RELATIONS_NHOM_QUY foreign key (MA_NHOM_QUYEN)
      references NHOM_QUYEN (MA_NHOM_QUYEN)
go

alter table NGUOI_DUNG
   add constraint FK_NGUOI_DU_RELATIONS_TRANGTHA foreign key (MA_TT)
      references TRANGTHAI (MA_TT)
go

alter table NHOM_HINH
   add constraint FK_NHOM_HIN_RELATIONS_TRANGTHA foreign key (MA_TT)
      references TRANGTHAI (MA_TT)
go

alter table NHOM_SP
   add constraint FK_NHOM_SP_RELATIONS_TRANGTHA foreign key (MA_TT)
      references TRANGTHAI (MA_TT)
go

alter table SANPHAM
   add constraint FK_SANPHAM_RELATIONS_TRANGTHA foreign key (MA_TT)
      references TRANGTHAI (MA_TT)
go

alter table SP_NHOMSP
   add constraint FK_SP_NHOMS_SP_NHOMSP_SANPHAM foreign key (MA_SP)
      references SANPHAM (MA_SP)
go

alter table SP_NHOMSP
   add constraint FK_SP_NHOMS_SP_NHOMSP_NHOM_SP foreign key (MANHOM_SP)
      references NHOM_SP (MANHOM_SP)
go

