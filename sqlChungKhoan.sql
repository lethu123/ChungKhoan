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



-- trigger LENHDAT --------------

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


--- SP UPDATE GIATRUCTUYEN

CREATE PROCEDURE [dbo].[SP_update_GiaTrucTuyen]
@maCP CHAR(7)
AS
BEGIN
	DECLARE @count1 int, -- top 2 lệnh M
			@count2 int -- top 2 lệnh B
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


CREATE PROCEDURE  [dbo].[SP_clear_GiaTrucTuyen]
AS
BEGIN
	DELETE FROM GIATRUCTUYEN WHERE cast(NGAYGIAODICH as Date) != cast(getdate() as Date)
END