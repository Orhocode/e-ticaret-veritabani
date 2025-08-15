--Siparis Oluþturulunca Sepet Durumunu Tamamlandý Yapan TRIGGER
GO
CREATE TRIGGER Siparis_Eklendi_
ON Siparisler
AFTER INSERT
AS
BEGIN
    UPDATE S
    SET S.Durum = 'Tamamlandý'
    FROM dbo.Sepet S
    INNER JOIN inserted I ON S.SepetID = I.SepetID;
END
GO

--Tamamlandý Durumundaki Siparisler Ýcin Musteriye Puan Kazandýran TRIGGER
GO
CREATE TRIGGER KazanilanPuan
ON Siparisler
After Update AS
BEGIN 
	INSERT INTO MusteriPuanlari(MusteriID,SiparisID,IslemTipi,PuanDegeri,Aciklama)
	SELECT  I.MusteriID,I.SiparisID,'Kazanç',        CAST(I.ToplamTutar / 1000 AS INT),'Sipariþten kazanýlan puan'  FROM inserted I 
	where I.Durum='Tamamlandý' AND I.SiparisID NOT IN 
	(SELECT SiparisID FROM MusteriPuanlari WHERE IslemTipi = 'Kazanç');
END
GO

--Siparis Durum Guncelleme
UPDATE  Siparisler SET Durum='Tamamlandý' WHERE SiparisID=1
UPDATE  Siparisler SET Durum='Tamamlandý' WHERE SiparisID=2
UPDATE  Siparisler SET Durum='Tamamlandý' WHERE SiparisID=3
UPDATE  Siparisler SET Durum='Tamamlandý' WHERE SiparisID=4
UPDATE  Siparisler SET Durum='Tamamlandý' WHERE SiparisID=5


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
update Odemeler set Durumu='Ödeme Yapildi' where OdemeID=5

--Faturalar Tablosuna Dinamik Olarak Tutar Çekip Vergi Oranýnýyla Birlikte Ekleyen TRIGGER
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

--KargoTakip Tablosunda Durum Kýsmý Teslim Edildi Olunca Dinamik Teslim Tarihi Ekleyen TRIGGER
GO
CREATE TRIGGER TeslimTarihi_Guncelleme
ON KargoTakip
AFTER UPDATE,INSERT AS
BEGIN
	UPDATE KT SET KT.TeslimTarihi=GETDATE()  FROM KargoTakip KT INNER JOIN inserted I ON I.TakipID=KT.TakipID
	WHERE I.Durum='Teslim Edildi' 
END
GO

--KargoTakip Durum Güncelleme
UPDATE KargoTakip SET Durum='Teslim Edildi' WHERE TakipID=5


--Sepet Tutarýný Dinamik Olarak Güncelleyen TRIGGER
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