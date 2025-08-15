--Son 30 günde en çok satýlan 10 ürünü listeleyin.

SELECT 
TOP 10
	U.UrunAd,
	COUNT(SD.UrunID) SATISSAYISI
FROM SiparisDetay SD
INNER JOIN Siparisler S ON S.SiparisID=SD.SiparisID
INNER JOIN Urunler U ON U.UrunID=SD.UrunID
WHERE
	S.SýparisTarihi >= DATEADD(DAY, -30, GETDATE())
GROUP BY U.UrunAd
ORDER BY SATISSAYISI DESC;

--Müþteri bazlý toplam harcama raporu çýkarýn.

SELECT	
	M.Ad+' '+M.Soyad AS ADSOYAD,
	S.ToplamTutar 
FROM Siparisler S 
INNER JOIN Musteriler M ON M.MusteriID=S.MusteriID

--Kategorilere göre stok miktarý ve satýþ adeti karþýlaþtýrmasý.

SELECT 
	K.KategoriAd ,
	SUM(US.StokAdet)STOKSAYISI,
	COUNT(SD.UrunID)SATISADET
FROM UrunStok US 
INNER JOIN Urunler U ON U.UrunID=US.UrunID
INNER JOIN Kategoriler K ON K.KategoriID=U.KategoriID
INNER JOIN SiparisDetay SD ON SD.UrunID=U.UrunID
GROUP BY K.KategoriAd

--Kargo þirketlerine göre ortalama teslim süresi.

SELECT 
	KS.SirketAd,
	AVG(DATEDIFF(DAY,KT.GonderimTarihi,KT.TeslimTarihi))AS TESLIMSURESI
FROM KargoTakip KT
INNER JOIN KargoSirketleri KS ON KS.SirketID=KT.SirketID
GROUP BY KS.SirketAd

--En yüksek puanlý yorumlar ve o ürünlerin bilgileri.

SELECT 
	U.UrunAd,
	UY.Puan 
FROM UrunYorumlari UY 
INNER JOIN Urunler U ON U.UrunID=UY.UrunID
GROUP BY U.UrunAd,UY.Puan
ORDER BY UY.Puan DESC

--Sisteme son 7 gün içinde giriþ yapan kullanýcýlar.

SELECT 
	*
FROM Kayitlar
WHERE IslemTarihi >= DATEADD(DAY, -, GETDATE()) 
	AND
	Islem LIKE '%Giriþ%'
ORDER BY IslemTarihi  DESC

 


