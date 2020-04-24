USE [master]
GO
/****** Object:  Database [CHUNGKHOAN]    Script Date: 24/04/2020 2:01:43 CH ******/
CREATE DATABASE [CHUNGKHOAN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CHUNGKHOAN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.LETHITHU\MSSQL\DATA\CHUNGKHOAN.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CHUNGKHOAN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.LETHITHU\MSSQL\DATA\CHUNGKHOAN_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CHUNGKHOAN] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CHUNGKHOAN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ARITHABORT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CHUNGKHOAN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CHUNGKHOAN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CHUNGKHOAN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CHUNGKHOAN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET RECOVERY FULL 
GO
ALTER DATABASE [CHUNGKHOAN] SET  MULTI_USER 
GO
ALTER DATABASE [CHUNGKHOAN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CHUNGKHOAN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CHUNGKHOAN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CHUNGKHOAN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CHUNGKHOAN] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CHUNGKHOAN', N'ON'
GO
USE [CHUNGKHOAN]
GO
/****** Object:  Table [dbo].[GIATRUCTUYEN]    Script Date: 24/04/2020 2:01:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GIATRUCTUYEN](
	[MACP] [char](7) NOT NULL,
	[GIADUMUA1] [float] NOT NULL,
	[SLDUMUA1] [int] NOT NULL,
	[GIADUMUA2] [float] NOT NULL,
	[SLDUMUA2] [int] NOT NULL,
	[GIAKHOP] [float] NOT NULL,
	[SLKHOP] [int] NOT NULL,
	[GIADUBAN1] [float] NOT NULL,
	[SLDUBAN1] [int] NOT NULL,
	[GIADUBAN2] [float] NOT NULL,
	[SLDUBAN2] [int] NOT NULL,
	[NGAYGIAODICH] [datetime] NOT NULL,
 CONSTRAINT [PK_GIATRUCTUYEN] PRIMARY KEY CLUSTERED 
(
	[MACP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LENHDAT]    Script Date: 24/04/2020 2:01:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LENHDAT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MACP] [char](7) NOT NULL,
	[NGAYDAT] [datetime] NOT NULL,
	[LOAIGD] [nchar](1) NOT NULL,
	[LOAILENH] [nchar](10) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[GIADAT] [float] NOT NULL,
	[TRANGTHAILENH] [nvarchar](30) NULL,
 CONSTRAINT [PK_LENHDAT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LENHKHOP]    Script Date: 24/04/2020 2:01:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LENHKHOP](
	[IDKHOP] [int] IDENTITY(1,1) NOT NULL,
	[NGAYKHOP] [datetime] NOT NULL,
	[SOLUONGKHOP] [int] NOT NULL,
	[GIAKHOP] [float] NOT NULL,
	[IDLENHDAT] [int] NOT NULL,
 CONSTRAINT [PK_LENHKHOP] PRIMARY KEY CLUSTERED 
(
	[IDKHOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[GIATRUCTUYEN] ([MACP], [GIADUMUA1], [SLDUMUA1], [GIADUMUA2], [SLDUMUA2], [GIAKHOP], [SLKHOP], [GIADUBAN1], [SLDUBAN1], [GIADUBAN2], [SLDUBAN2], [NGAYGIAODICH]) VALUES (N'ARG    ', 9000, 500, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-04-24 08:01:05.957' AS DateTime))
INSERT [dbo].[GIATRUCTUYEN] ([MACP], [GIADUMUA1], [SLDUMUA1], [GIADUMUA2], [SLDUMUA2], [GIAKHOP], [SLKHOP], [GIADUBAN1], [SLDUBAN1], [GIADUBAN2], [SLDUBAN2], [NGAYGIAODICH]) VALUES (N'BID    ', 20000, 1000, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-04-24 11:42:40.490' AS DateTime))
INSERT [dbo].[GIATRUCTUYEN] ([MACP], [GIADUMUA1], [SLDUMUA1], [GIADUMUA2], [SLDUMUA2], [GIAKHOP], [SLKHOP], [GIADUBAN1], [SLDUBAN1], [GIADUBAN2], [SLDUBAN2], [NGAYGIAODICH]) VALUES (N'TCB    ', 10000, 500, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-04-24 12:49:54.717' AS DateTime))
SET IDENTITY_INSERT [dbo].[LENHDAT] ON 

INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (118, N'ACB    ', CAST(N'2020-04-23 00:00:00.000' AS DateTime), N'M', N'LO        ', 1000, 10000, NULL)
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (123, N'ACB    ', CAST(N'2020-04-23 00:00:00.000' AS DateTime), N'B', N'LO        ', 1000, 11000, NULL)
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (124, N'AGR    ', CAST(N'2020-04-23 00:00:00.000' AS DateTime), N'M', N'LO        ', 1000, 11000, NULL)
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (125, N'ARG    ', CAST(N'2020-04-24 00:00:00.000' AS DateTime), N'M', N'LO        ', 500, 9000, NULL)
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (126, N'BID    ', CAST(N'2020-04-24 11:42:40.477' AS DateTime), N'M', N'LO        ', 1000, 20000, N'Chờ khớp')
INSERT [dbo].[LENHDAT] ([ID], [MACP], [NGAYDAT], [LOAIGD], [LOAILENH], [SOLUONG], [GIADAT], [TRANGTHAILENH]) VALUES (127, N'TCB    ', CAST(N'2020-04-24 12:49:54.693' AS DateTime), N'M', N'LO        ', 500, 10000, N'Chờ khớp')
SET IDENTITY_INSERT [dbo].[LENHDAT] OFF
SET IDENTITY_INSERT [dbo].[LENHKHOP] ON 

INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (4, CAST(N'2020-04-01 21:50:11.103' AS DateTime), 1000, 10500, 3)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (5, CAST(N'2020-04-01 21:50:11.103' AS DateTime), 1000, 10000, 1)
INSERT [dbo].[LENHKHOP] ([IDKHOP], [NGAYKHOP], [SOLUONGKHOP], [GIAKHOP], [IDLENHDAT]) VALUES (6, CAST(N'2020-04-01 21:50:11.110' AS DateTime), 700, 9500, 4)
SET IDENTITY_INSERT [dbo].[LENHKHOP] OFF
/****** Object:  Index [IX_LENHDAT]    Script Date: 24/04/2020 2:01:43 CH ******/
CREATE NONCLUSTERED INDEX [IX_LENHDAT] ON [dbo].[LENHDAT]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CursorLoaiGD]    Script Date: 24/04/2020 2:01:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CursorLoaiGD]
  @OutCrsr CURSOR VARYING OUTPUT, 
  @macp NVARCHAR( 10), @Ngay NVARCHAR( 50),  @LoaiGD CHAR 
AS
SET DATEFORMAT DMY 
IF (@LoaiGD='M') 
  SET @OutCrsr=CURSOR KEYSET FOR 
  SELECT ID, NGAYDAT, SOLUONG, GIADAT FROM LENHDAT 
  WHERE MACP=@macp 
    AND DAY(NGAYDAT)=DAY(@Ngay)AND MONTH(NGAYDAT)= MONTH(@Ngay) AND YEAR(NGAYDAT)=YEAR(@Ngay)  
    AND LOAIGD=@LoaiGD AND SOLUONG >0  
    ORDER BY GIADAT DESC, NGAYDAT 
ELSE
  SET @OutCrsr=CURSOR KEYSET FOR 
  SELECT ID, NGAYDAT, SOLUONG, GIADAT FROM LENHDAT 
  WHERE MACP=@macp 
    AND DAY(NGAYDAT)=DAY(@Ngay)AND MONTH(NGAYDAT)= MONTH(@Ngay) AND YEAR(NGAYDAT)=YEAR(@Ngay)  
    AND LOAIGD=@LoaiGD AND SOLUONG >0  
    ORDER BY GIADAT, NGAYDAT 
OPEN @OutCrsr

GO
/****** Object:  StoredProcedure [dbo].[SP_clear_GiaTrucTuyen]    Script Date: 24/04/2020 2:01:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_clear_GiaTrucTuyen]
AS
BEGIN
	DELETE FROM GIATRUCTUYEN WHERE cast(NGAYGIAODICH as Date) != cast(getdate() as Date)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_KHOPLENH_LO]    Script Date: 24/04/2020 2:01:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_KHOPLENH_LO]
	@macp NVARCHAR(10), @Ngay NVARCHAR(50), @LoaiGD CHAR(1),
	@soluongMB INT, @giadatMB FLOAT 
AS
SET DATEFORMAT DMY
DECLARE @CrsrVar CURSOR, @ngaydat NVARCHAR(50), @soluong INT,@giadat FLOAT, @soluongkhop INT, @giakhop FLOAT, @ID INT, @tongsoluongkhop INT
SET @tongsoluongkhop = 0
IF(@LoaiGD = 'B')
	EXEC CursorLoaiGD @CrsrVar OUTPUT, @macp, @Ngay, 'M'
ELSE
	EXEC CursorLoaiGD @CrsrVar OUTPUT, @macp, @Ngay, 'B'

FETCH NEXT FROM @CrsrVar INTO @ID, @ngaydat, @soluong, @giadat
--SELECT @ID, @ngaydat, @soluong, @giadat
WHILE(@@FETCH_STATUS <>-1 AND @soluongMB > 0)
BEGIN
	IF(@LoaiGD = 'B')
		IF(@giadatMB <= @giadat)
		BEGIN
			IF (@soluongMB >= @soluong)
			BEGIN 
				SET @soluongkhop = @soluong
				SET @giakhop = @giadat
				SET @soluongMB = @soluongMB - @soluong
				UPDATE dbo.LENHDAT
					SET SOLUONG = 0 ,TRANGTHAILENH = N'Khớp hết'
					WHERE CURRENT OF @CrsrVar
			END
			ELSE
			BEGIN
				SET @soluongkhop = @soluongMB
				SET @giakhop = @giadat

				UPDATE dbo.LENHDAT 
					SET SOLUONG = SOLUONG - @soluongMB,TRANGTHAILENH = N'Khớp lệnh 1 phần'
					WHERE CURRENT OF @CrsrVar 
					SET @soluongMB = 0
			END
			--SELECT @soluongkhop, @giakhop
			SET @tongsoluongkhop = @tongsoluongkhop + @soluongkhop
			--Cập nhật table lệnh khớp
			INSERT INTO LENHKHOP(NGAYKHOP, SOLUONGKHOP, GIAKHOP, IDLENHDAT)
				VALUES (GETDATE(),@soluongkhop, @giakhop, @ID)
		END
		ELSE
			GOTO THOAT
	-- Còn Trường hợp lệnh gởi vào là lệnh mua
	ELSE
		IF(@giadatMB >= @giadat)
		BEGIN
			IF(@soluongMB >= @soluong)
			BEGIN
				SET @soluongkhop = @soluong
				SET @giakhop = @giadat
				SET @soluongMB = @soluongMB - @soluong
				UPDATE dbo.LENHDAT 
					SET SOLUONG = 0, TRANGTHAILENH =N'Khớp hết'
					WHERE CURRENT OF @CrsrVar
			END
			ELSE
			BEGIN
				SET @soluongkhop = @soluongMB
				SET @giakhop = @giadat
				UPDATE dbo.LENHDAT
					SET SOLUONG = SOLUONG - @soluongMB, TRANGTHAILENH = N'Khớp lệnh 1 phần'
					WHERE CURRENT OF @CrsrVar
					SET @soluongMB = 0
			END
			--SELECT @soluongkhop, @giakhop
			SET @tongsoluongkhop = @tongsoluongkhop + @soluongkhop
			--Cập nhật bảng LENHKHOP
			INSERT INTO LENHKHOP(NGAYKHOP, SOLUONGKHOP, GIAKHOP, IDLENHDAT)
				VALUES (GETDATE(),@soluongkhop, @giakhop, @ID)	
		END
		ELSE
			GOTO THOAT
	FETCH NEXT FROM @CrsrVar INTO @ID, @ngaydat, @soluong, @giadat
END
THOAT:
--Cập nhật table LENHDAT nếu số lượng mua bán > 0
	IF(@soluongMB > 0)
	BEGIN
		INSERT INTO LENHDAT(MACP, NGAYDAT, LOAIGD, LOAILENH, SOLUONG, GIADAT, TRANGTHAILENH)
			VALUES(@macp, GETDATE(), @LoaiGD, N'LO', @soluongMB, @giadatMB, N'Chờ khớp')
	END
		SELECT @tongsoluongkhop AS "Số lượng khớp"
		CLOSE @CrsrVar 
		DEALLOCATE @CrsrVar
GO
/****** Object:  StoredProcedure [dbo].[SP_update_GiaTrucTuyen]    Script Date: 24/04/2020 2:01:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_update_GiaTrucTuyen]
@maCP CHAR(7)
AS
BEGIN
	DECLARE @count1 int, -- top 2 lệnh M
			@count2 int -- top 2 lệnh B
	-- TÌM VÀ XÓA MÃ ĐÓ TỪ BẢNG GIÁ
	-- DELETE FROM GIATRUCTUYEN WHERE MACP = @maCP
	-- INSERT MÃ ĐÓ VÀO BẢNG GIÁ
	-- INSERT INTO GIATRUCTUYEN(MACP,GIADUMUA1,SLDUMUA1,GIADUMUA2,SLDUMUA2,GIAKHOP,SLKHOP,GIADUBAN1,SLDUBAN1,GIADUBAN2,SLDUBAN2,NGAYGIAODICH) 
	-- VALUES (@maCP, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, GETDATE());
	-- select top 2 lệnh mua
	CREATE TABLE #topM ( gia FLOAT, soluong int);

	INSERT INTO  #topM SELECT top 2 GIADAT, sum(SOLUONG) FROM LENHDAT 
	WHERE MACP = @maCP AND LOAIGD = 'M' AND SOLUONG != 0 AND cast(NGAYDAT as Date) = cast(getdate() as Date)
	GROUP BY GIADAT
	ORDER BY GIADAT DESC
	SET @count1 = (SELECT COUNT(*) FROM #topM)
	IF( @count1 =  0) -- update 2 kl = 0
		UPDATE GIATRUCTUYEN
		SET GIADUMUA1 = 0, SLDUMUA1 = 0, GIADUMUA2 = 0, SLDUMUA2 = 0
		WHERE MACP = @maCP
	ELSE IF(@count1 = 1)
		UPDATE GIATRUCTUYEN
		SET GIADUMUA1 = (SELECT TOP 1 gia FROM #topM), SLDUMUA1 = (SELECT TOP 1 soluong FROM #topM), GIADUMUA2 = 0, SLDUMUA2 = 0
		WHERE MACP = @maCP
	ELSE 
		UPDATE GIATRUCTUYEN
		SET GIADUMUA1 = (SELECT TOP 1 gia FROM #topM), SLDUMUA1 = (SELECT TOP 1 soluong FROM #topM),
		GIADUMUA2 = (SELECT TOP 1 gia FROM #topM ORDER BY gia ASC), SLDUMUA2 = (SELECT TOP 1 soluong FROM #topM ORDER BY gia ASC)
		WHERE MACP = @maCP

	-- select top 2 lệnh bán
	CREATE TABLE #topB ( gia FLOAT, soluong int);

	INSERT INTO  #topB SELECT top 2 GIADAT, sum(SOLUONG) FROM LENHDAT 
	WHERE MACP = @maCP AND LOAIGD = 'B' AND SOLUONG != 0 AND cast(NGAYDAT as Date) = cast(getdate() as Date)
	GROUP BY GIADAT
	ORDER BY GIADAT DESC

	SET @count2 = (SELECT COUNT(*) FROM #topB)
	IF( @count2 =  0) -- update 2 kl = 0
		UPDATE GIATRUCTUYEN
		SET GIADUBAN1 = 0, SLDUBAN1 = 0, GIADUBAN2 = 0, SLDUBAN2 = 0
		WHERE MACP = @maCP
	ELSE IF(@count2 = 1)
		UPDATE GIATRUCTUYEN
		SET GIADUBAN1 = (SELECT TOP 1 gia FROM #topB), SLDUBAN1 = (SELECT TOP 1 soluong FROM #topB), GIADUBAN2 = 0, SLDUBAN2 = 0
		WHERE MACP = @maCP
	ELSE 
		UPDATE GIATRUCTUYEN
		SET GIADUBAN1 = (SELECT TOP 1 gia FROM #topB), SLDUBAN1 = (SELECT TOP 1 soluong FROM #topB),
		GIADUBAN2 = (SELECT TOP 1 gia FROM #topB ORDER BY gia ASC), SLDUBAN2 = (SELECT TOP 1 soluong FROM #topB ORDER BY gia ASC)
		WHERE MACP = @maCP
END










GO
/****** Object:  Trigger [dbo].[TR_AfterDelete_GiaTrucTuyen]    Script Date: 24/04/2020 2:01:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER  [dbo].[TR_AfterDelete_GiaTrucTuyen] 
   ON  [dbo].[LENHDAT] 
   AFTER DELETE 
AS 
DECLARE @maCP CHAR(7)

BEGIN
	EXEC SP_clear_GiaTrucTuyen
	SET @maCP = (SELECT MACP FROM deleted)

	IF(cast((SELECT NGAYDAT FROM deleted) as Date) = cast(getdate() as Date ))
		BEGIN
			-- kiem tra coi ma con ton tai khong
			IF  EXISTS( SELECT TOP 1 MACP from LENHDAT where MACP= @macp )
				EXEC SP_update_GiaTrucTuyen @maCP = @maCP;
			ELSE -- DELETE ROW
				DELETE FROM GIATRUCTUYEN WHERE MACP = @maCP
		END
		
END
GO
/****** Object:  Trigger [dbo].[TR_AfterInsert_GiaTrucTuyen]    Script Date: 24/04/2020 2:01:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER  [dbo].[TR_AfterInsert_GiaTrucTuyen] 
   ON  [dbo].[LENHDAT] 
   AFTER INSERT 
AS 
DECLARE @loaiGD NCHAR(1), @maCP CHAR(7)
BEGIN
	EXEC SP_clear_GiaTrucTuyen
	SET @maCP = (SELECT MACP FROM inserted)
	SET @loaiGD = (SELECT LOAIGD FROM inserted)
	IF(cast((SELECT NGAYDAT FROM inserted) as Date) = cast(getdate() as Date ))
		BEGIN
			IF NOT EXISTS( SELECT TOP 1 MACP from GIATRUCTUYEN where MACP=@maCP)
				-- INSERT INTO GIATRUCTUYEN
				IF(@loaiGD = 'M')
					BEGIN
						INSERT INTO GIATRUCTUYEN(MACP,GIADUMUA1,SLDUMUA1,GIADUMUA2,SLDUMUA2,GIAKHOP,SLKHOP,GIADUBAN1,SLDUBAN1,GIADUBAN2,SLDUBAN2,NGAYGIAODICH) 
						VALUES (@maCP, (SELECT GIADAT FROM inserted), (SELECT SOLUONG FROM inserted), 0, 0, 0, 0, 0, 0, 0, 0, GETDATE());
					END
				ELSE 
					BEGIN
						INSERT INTO GIATRUCTUYEN(MACP,GIADUMUA1,SLDUMUA1,GIADUMUA2,SLDUMUA2,GIAKHOP,SLKHOP,GIADUBAN1,SLDUBAN1,GIADUBAN2,SLDUBAN2,NGAYGIAODICH) 
						VALUES (@maCP,0, 0, 0, 0, 0, 0, (SELECT GIADAT FROM inserted), (SELECT SOLUONG FROM inserted), 0, 0,  GETDATE());
					END
			
			ELSE ---- update theo maCP
				EXEC SP_update_GiaTrucTuyen @maCP = @maCP;
		END
	
END


GO
/****** Object:  Trigger [dbo].[TR_AfterUpdate_GiaTrucTuyen]    Script Date: 24/04/2020 2:01:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER  [dbo].[TR_AfterUpdate_GiaTrucTuyen] 
   ON  [dbo].[LENHDAT]    AFTER  UPDATE
AS 
DECLARE  @maCP_X CHAR(7), -- mã cp bị xóa,
		 @maCP_I CHAR(7),
		 @loaiGD  NCHAR(1) -- mã cp thêm vào
BEGIN
	EXEC SP_clear_GiaTrucTuyen
	SET @maCP_X = (SELECT MACP FROM deleted)
	SET @maCP_I = (SELECT MACP FROM inserted)
	-- IF(cast((SELECT NGAYDAT FROM deleted) as Date) = cast(getdate() as Date ) AND cast((SELECT NGAYDAT FROM inserted) as Date) = cast(getdate() as Date ))
		-- BEGIN
			IF (UPDATE(SOLUONG) OR UPDATE(GIADAT) OR UPDATE(LOAIGD))
				BEGIN
				  EXEC SP_update_GiaTrucTuyen @maCP = @maCP_X;
				END
			ELSE IF(UPDATE(MACP))
				BEGIN
					-- Xóa mã cũ @maCP X
					IF  EXISTS( SELECT TOP 1 MACP from LENHDAT where MACP= @maCP_X )
						EXEC SP_update_GiaTrucTuyen @maCP = @maCP_X;
					ELSE -- DELETE ROW
						DELETE FROM GIATRUCTUYEN WHERE MACP = @maCP_X

					-- thêm mã mới @maCP I
					IF NOT EXISTS( SELECT TOP 1 MACP from GIATRUCTUYEN where MACP=@maCP_I )
					-- INSERT INTO GIATRUCTUYEN
						IF(@loaiGD = 'M')
							BEGIN
								INSERT INTO GIATRUCTUYEN(MACP,GIADUMUA1,SLDUMUA1,GIADUMUA2,SLDUMUA2,GIAKHOP,SLKHOP,GIADUBAN1,SLDUBAN1,GIADUBAN2,SLDUBAN2,NGAYGIAODICH) 
								VALUES (@maCP_I, (SELECT GIADAT FROM inserted), (SELECT SOLUONG FROM inserted), 0, 0, 0, 0, 0, 0, 0, 0, GETDATE());
							END
						ELSE 
							BEGIN
								INSERT INTO GIATRUCTUYEN(MACP,GIADUMUA1,SLDUMUA1,GIADUMUA2,SLDUMUA2,GIAKHOP,SLKHOP,GIADUBAN1,SLDUBAN1,GIADUBAN2,SLDUBAN2,NGAYGIAODICH) 
								VALUES (@maCP_I,0, 0, 0, 0, 0, 0, (SELECT GIADAT FROM inserted), (SELECT SOLUONG FROM inserted), 0, 0,  GETDATE());
							END
					ELSE ---- update theo maCP
						EXEC SP_update_GiaTrucTuyen @maCP = @maCP_I;
				END
				-- còn trường hợp update ngày đặt bên LENHDAT
		-- END
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã cổ phiếu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GIATRUCTUYEN', @level2type=N'COLUMN',@level2name=N'MACP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gía dư mua lớn nhất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GIATRUCTUYEN', @level2type=N'COLUMN',@level2name=N'GIADUMUA1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tổng số lượng của dư mua lớn nhất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GIATRUCTUYEN', @level2type=N'COLUMN',@level2name=N'SLDUMUA1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gía dư mua lớn thứ 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GIATRUCTUYEN', @level2type=N'COLUMN',@level2name=N'GIADUMUA2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tổng số lượng của dư mua lớn thứ 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GIATRUCTUYEN', @level2type=N'COLUMN',@level2name=N'SLDUMUA2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gía khớp mới nhất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GIATRUCTUYEN', @level2type=N'COLUMN',@level2name=N'GIAKHOP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng khớp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GIATRUCTUYEN', @level2type=N'COLUMN',@level2name=N'SLKHOP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gía dư bán lớn nhất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GIATRUCTUYEN', @level2type=N'COLUMN',@level2name=N'GIADUBAN1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tổng số lượng của dư bán lớn nhất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GIATRUCTUYEN', @level2type=N'COLUMN',@level2name=N'SLDUBAN1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gía dư bán lớn thứ 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GIATRUCTUYEN', @level2type=N'COLUMN',@level2name=N'GIADUBAN2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tổng số lượng của dư bán lớn thứ 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GIATRUCTUYEN', @level2type=N'COLUMN',@level2name=N'SLDUBAN2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày kết thúc giao dịch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GIATRUCTUYEN', @level2type=N'COLUMN',@level2name=N'NGAYGIAODICH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã số lệnh đặt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LENHDAT', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã cổ phiếu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LENHDAT', @level2type=N'COLUMN',@level2name=N'MACP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại giao dịch:
     M: Lệnh mua
     B:  Lệnh bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LENHDAT', @level2type=N'COLUMN',@level2name=N'LOAIGD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại lệnh:
  LO: khớp liên tục
  ATO, ATC: khớp lệnh định kì' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LENHDAT', @level2type=N'COLUMN',@level2name=N'LOAILENH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng đặt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LENHDAT', @level2type=N'COLUMN',@level2name=N'SOLUONG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gía đặt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LENHDAT', @level2type=N'COLUMN',@level2name=N'GIADAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Trạng thái lệnh:
    Chờ khớp
    Khớp lệnh 1 phần
    Khớp hết
    Đã hủy
    Chưa khớp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LENHDAT', @level2type=N'COLUMN',@level2name=N'TRANGTHAILENH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã số lệnh khớp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LENHKHOP', @level2type=N'COLUMN',@level2name=N'IDKHOP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã số lệnh đặt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LENHKHOP', @level2type=N'COLUMN',@level2name=N'IDLENHDAT'
GO
USE [master]
GO
ALTER DATABASE [CHUNGKHOAN] SET  READ_WRITE 
GO
