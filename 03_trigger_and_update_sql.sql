--Siparis Olu�turulunca Sepet Durumunu Tamamland� Yapan TRIGGER
GO
CREATE TRIGGER Siparis_Eklendi_
ON Siparisler
AFTER INSERT
AS
BEGIN
    UPDATE S
    SET S.Durum = 'Tamamland�'
    FROM dbo.Sepet S
    INNER JOIN inserted I ON S.SepetID = I.SepetID;
END
GO

--Tamamland� Durumundaki Siparisler �cin Musteriye Puan Kazand�ran TRIGGER
GO
CREATE TRIGGER KazanilanPuan
ON Siparisler
After Update AS
BEGIN 
	INSERT INTO MusteriPuanlari(MusteriID,SiparisID,IslemTipi,PuanDegeri,Aciklama)
	SELECT  I.MusteriID,I.SiparisID,'Kazan�',        CAST(I.ToplamTutar / 1000 AS INT),'Sipari�ten kazan�lan puan'  FROM inserted I 
	where I.Durum='Tamamland�' AND I.SiparisID NOT IN 
	(SELECT SiparisID FROM MusteriPuanlari WHERE IslemTipi = 'Kazan�');
END
GO

--Siparis Durum Guncelleme
UPDATE  Siparisler SET Durum='Tamamland�' WHERE SiparisID=1
UPDATE  Siparisler SET Durum='Tamamland�' WHERE SiparisID=2
UPDATE  Siparisler SET Durum='Tamamland�' WHERE SiparisID=3
UPDATE  Siparisler SET Durum='Tamamland�' WHERE SiparisID=4
UPDATE  Siparisler SET Durum='Tamamland�' WHERE SiparisID=5


-- Odemeler Tablosuna Siparis Tablosundan Dinamik SiparisTutarini Ceken TRIGGER
GO
CREATE TRIGGER trg_Odeme_TutarSiparis
ON Odemeler
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO Odemeler (SiparisID, YontemID, OdemeTutari, Tarihi, Durumu)
	SELECT 
	i.SiparisID,
	i.YontemID,
	s.ToplamTutar,
	ISNULL(i.Tarihi, GETDATE()),      
	ISNULL(i.Durumu, 'Beklemede')    
	FROM inserted i
	JOIN Siparisler s ON i.SiparisID = s.SiparisID;
END;
GO

--Odemeler Tablosu Durum Guncelleme
update Odemeler set Durumu='�deme Yapildi' where OdemeID=5

--Faturalar Tablosuna Dinamik Olarak Tutar �ekip Vergi Oran�n�yla Birlikte Ekleyen TRIGGER
GO
CREATE TRIGGER Fatura_TutarHesapla
ON FATURALAR
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO FATURALAR (SiparisID, FaturaNo, VergiOrani, Tutar)
	SELECT 
	i.SiparisID,
	i.FaturaNo,
	i.VergiOrani,
	CAST(s.ToplamTutar / (1 + i.VergiOrani / 100.0) AS DECIMAL(10,2))
	FROM inserted i
	JOIN Siparisler s ON i.SiparisID = s.SiparisID;
END;
GO

--KargoTakip Tablosunda Durum K�sm� Teslim Edildi Olunca Dinamik Teslim Tarihi Ekleyen TRIGGER
GO
CREATE TRIGGER TeslimTarihi_Guncelleme
ON KargoTakip
AFTER UPDATE,INSERT AS
BEGIN
	UPDATE KT SET KT.TeslimTarihi=GETDATE()  FROM KargoTakip KT INNER JOIN inserted I ON I.TakipID=KT.TakipID
	WHERE I.Durum='Teslim Edildi' 
END
GO

--KargoTakip Durum G�ncelleme
UPDATE KargoTakip SET Durum='Teslim Edildi' WHERE TakipID=5


--Sepet Tutar�n� Dinamik Olarak G�ncelleyen TRIGGER
GO
CREATE TRIGGER SepetDetayGuncelleme
ON SepetDetay
AFTER INSERT
AS
BEGIN
    UPDATE S
    SET S.ToplamTutar = S.ToplamTutar + T.Toplam
    FROM Sepet S
    INNER JOIN (
        SELECT SepetID, SUM(Adet * BirimFiyat) AS Toplam
        FROM inserted
        GROUP BY SepetID
    ) T ON S.SepetID = T.SepetID;
END
GO