--Son 30 g�nde en �ok sat�lan 10 �r�n� listeleyin.

SELECT 
TOP 10
	U.UrunAd,
	COUNT(SD.UrunID) SATISSAYISI
FROM SiparisDetay SD
INNER JOIN Siparisler S ON S.SiparisID=SD.SiparisID
INNER JOIN Urunler U ON U.UrunID=SD.UrunID
WHERE
	S.S�parisTarihi >= DATEADD(DAY, -30, GETDATE())
GROUP BY U.UrunAd
ORDER BY SATISSAYISI DESC;

--M��teri bazl� toplam harcama raporu ��kar�n.

SELECT	
	M.Ad+' '+M.Soyad AS ADSOYAD,
	S.ToplamTutar 
FROM Siparisler S 
INNER JOIN Musteriler M ON M.MusteriID=S.MusteriID

--Kategorilere g�re stok miktar� ve sat�� adeti kar��la�t�rmas�.

SELECT 
	K.KategoriAd ,
	SUM(US.StokAdet)STOKSAYISI,
	COUNT(SD.UrunID)SATISADET
FROM UrunStok US 
INNER JOIN Urunler U ON U.UrunID=US.UrunID
INNER JOIN Kategoriler K ON K.KategoriID=U.KategoriID
INNER JOIN SiparisDetay SD ON SD.UrunID=U.UrunID
GROUP BY K.KategoriAd

--Kargo �irketlerine g�re ortalama teslim s�resi.

SELECT 
	KS.SirketAd,
	AVG(DATEDIFF(DAY,KT.GonderimTarihi,KT.TeslimTarihi))AS TESLIMSURESI
FROM KargoTakip KT
INNER JOIN KargoSirketleri KS ON KS.SirketID=KT.SirketID
GROUP BY KS.SirketAd

--En y�ksek puanl� yorumlar ve o �r�nlerin bilgileri.

SELECT 
	U.UrunAd,
	UY.Puan 
FROM UrunYorumlari UY 
INNER JOIN Urunler U ON U.UrunID=UY.UrunID
GROUP BY U.UrunAd,UY.Puan
ORDER BY UY.Puan DESC

--Sisteme son 7 g�n i�inde giri� yapan kullan�c�lar.

SELECT 
	*
FROM Kayitlar
WHERE IslemTarihi >= DATEADD(DAY, -, GETDATE()) 
	AND
	Islem LIKE '%Giri�%'
ORDER BY IslemTarihi  DESC

 


