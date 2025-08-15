--Kullanicilar Tablosu Veri Ekleme
INSERT INTO Kullanicilar (Ad,Soyad,Email,Cinsiyet,Sifre,TelNo,DogumTarihi)VALUES
('Furkan','Demir','FD@examlpe.com','E','2240','555-001-002','20020114'),
('Necla','Çalýþkan','NC@examlpe.com','E','5940','555-145-542','19950421'),
('Emir','Hafýz','EH@examlpe.com','E','5540','555-801-002','20000624'),
('Selen','Yýldýz','SY@examlpe.com','K','5990','555-451-486','19980624'),
('Ahmet','Kalkan','AK@examlpe.com','E','8979','555-455-194','19820812'),
('Eslem','Kýr','EK@examlpe.com','K','4564','555-457-245','19950218');

--Roller Tablosuna Veri Ekleme
INSERT INTO Roller VALUES 
('Admin'),('Satici'),('Analist');

--KullaniciRol Tablosuna Veri Ekeleme
INSERT INTO KullaniciRol (KullaniciID, RolID) VALUES 
(1,1),(2,1),(3,2),(4,2),(5,3),(6,3) ;

--Musteriler Tablosu Veri Ekleme
INSERT INTO Musteriler(Ad,Soyad,Email,Cinsiyet,TelNo,Sifre)VALUES
('Orhan','Taþkýran','OT@example.com','E','555-852-545','55xx'),
('Demir','Altýn','DA@example.com','E','555-652-554','52Ax'),
('Sedef','Kesikli','SK@example.com','K','555-626-656','66xx'),
('Yaðmur','Reçel','YRR@example.com','K','555-412-846','85yx'),
('Kemal','Art','KA@example.com','E','555-562-845','42xx'),
('Ali','Gül','AGG@example.com','E','555-454-455','955x'),
('Edanur','Taþkýran','ET@example.com','K','555-855-445','57xx'),
('Kerim','Taþ','KT@example.com','E','555-455-885','75xx'),
('Elif','Ýsmet','EÝ@example.com','K','555-885-445','16xx'),
('Selim','Can','SC@example.com','E','555-159-785','45Kx');

--Ulkeler Tablosuna Veri Ekleme
INSERT INTO Ulkeler (UlkeAd)VALUES
('TÜRKÝYE');

--Iller Tablosuna Veri Ekleme
INSERT INTO Iller (IlAd,UlkeID)VALUES
('Ýstanbul',1),
('Ankara',1),
('Ýzmir',1),
('Kocaeli',1),
('Bursa',1),
('Muðla',1),
('Gaziantep',1),
('Antalya',1),
('Sinop',1),
('Edirne',1),
('Manisa',1),
('Kars',1);

--Ilceler Tablosuna Veri Ekleme
INSERT INTO Ilceler (IlceAd, IlID) VALUES 
('Kadýköy', 1), ('Beþiktaþ', 1),      
('Çankaya', 2), ('Keçiören', 2),
('Konak', 3), ('Bornova', 3),
('Ýzmit', 4), ('Gebze', 4),
('Osmangazi', 5), ('Yýldýrým', 5),
('Bodrum', 6), ('Menteþe', 6),
('Þahinbey', 7), ('Þehitkamil', 7),
('Muratpaþa', 8), ('Kepez', 8),
('Boyabat', 9), ('Gerze', 9),
('Merkez', 10), ('Keþan', 10),
('Yunusemre', 11), ('Þehzadeler', 11),
('Merkez', 12), ('Susuz', 12);

--Adresler Tablosu Veri Ekleme
INSERT INTO Adresler (UlkeID, IlID, IlceID, AcýkAdres) VALUES
(1, 1, 1, 'Ýstanbul Kadýköy Mahallesi No:10'),
(1, 1, 2, 'Ýstanbul Beþiktaþ Sokak 25'),
(1, 2, 3, 'Ankara Çankaya Caddesi 1'),
(1, 3, 5, 'Ýzmir Bornova Mahallesi 20/4'),
(1, 4, 6, 'Kocaeli Gebze OSB 3'),
(1, 5, 7, 'Bursa Yýldýrým Mahallesi'),
(1, 6, 9, 'Muðla Bodrum Marina'),
(1, 7, 11, 'Gaziantep Þahinbey Merkez'),
(1, 8, 13, 'Antalya Kepez Mah. No:22'),
(1, 9, 15, 'Sinop Boyabat Köyü'),
(1, 10, 17, 'Edirne Merkez Cumhuriyet Mahallesi'),
(1, 10, 18, 'Edirne Keþan Atatürk Caddesi'),
(1, 11, 19, 'Manisa Yunusemre 45. Sokak No:3'),
(1, 11, 20, 'Manisa Þehzadeler Sanayi Sitesi'),
(1, 12, 21, 'Kars Merkez Kazým Karabekir Mah.'),
(1, 12, 22, 'Kars Susuz Köyü Altý'),
(1, 5, 8, 'Bursa Osmangazi Meydan Mahallesi'),
(1, 3, 4, 'Ýzmir Konak Gazi Bulvarý'),
(1, 6, 10, 'Muðla Menteþe Merkez Mahallesi'),
(1, 2, 4, 'Ankara Keçiören Yayla Mahallesi');

--MusteriAdres Tablosu Veri Ekleme
INSERT INTO MusteriAdres (MusteriID, AdresID) VALUES
(1, 1), (1, 2),(1, 11),
(2, 3),(2, 12),
(3, 4),(3, 13),
(4, 5),(4, 14),
(5, 6),(5, 15),
(6, 7),(6, 16),
(7, 8),(7, 17),
(8, 9),(8, 18),
(9, 10),(9, 19),
(10, 2),(10, 20);

--Siparisler Tablosu Veri Ekleme
INSERT INTO Siparisler (MusteriID, SepetID, ToplamTutar)
VALUES
(1, 1, 115997.00),
(2, 2, 154997.00),
(3, 3, 23999.00),
(4, 4, 89997.00),
(5, 5, 37998.00),
(6, 6,41999.00),
(7, 7, 71996.00),
(8, 8, 20999.00),
(9, 9, 27998.00),
(10, 10, 2199.00);

--Markalar Tablosuna Veri Ekleme
INSERT INTO Markalar (MarkaAdi) VALUES
('Apple'),
('Samsung'),
('Lenovo'),
('Asus'),
('HP'),
('Xiaomi'),
('LG'),
('Sony'),
('Dell'),
('Casper');

--Kategoriler Tablosuna Veri Ekleme
INSERT INTO Kategoriler (KategoriAd) VALUES
('Telefon'),
('Bilgisayar'),
('Tablet'),
('Aksesuar'),
('Televizyon'),
('Kulaklýk'),
('Yazýcý'),
('Kamera'),
('Akýllý Saat'),
('Oyun Konsolu');

--Urunler Tablosu Veri Ekleme
INSERT INTO Urunler (UrunAd, Aciklama, Fiyat, KategoriID, MarkaID) VALUES
-- Telefonlar
('iPhone 14', 'Apple iPhone 14 128GB Akýllý Telefon', 52999.99, 1, 1),
('Galaxy S23', 'Samsung Galaxy S23 256GB', 44999.00, 1, 2),
('Redmi Note 12', 'Xiaomi Redmi Note 12 128GB', 9999.99, 1, 6),
-- Bilgisayarlar
('MacBook Air M2', 'Apple MacBook Air M2 13"', 64999.50, 2, 1),
('ThinkPad E15', 'Lenovo ThinkPad E15 15.6"', 23999.90, 2, 3),
('Asus TUF Gaming', 'Asus TUF F15 i7 16GB 1TB SSD', 29999.99, 2, 4),
('HP Pavilion', 'HP Pavilion 14 i5 8GB', 18999.00, 2, 5),
('Dell XPS 13', 'Dell XPS 13 Intel Evo', 41999.00, 2, 9),
-- Tabletler
('iPad 10', 'Apple iPad 10. nesil 64GB', 17999.00, 3, 1),
('Galaxy Tab S8', 'Samsung Galaxy Tab S8', 20999.90, 3, 2),
('Xiaomi Pad 6', 'Xiaomi Pad 6 128GB', 13999.99, 3, 6),
-- Aksesuarlar
('Magic Mouse', 'Apple Magic Mouse 2', 2199.00, 4, 1),
('Galaxy Buds2', 'Samsung Galaxy Buds2 Pro', 2799.00, 4, 2),
('HP Mouse', 'HP Kablosuz Mouse 200', 499.00, 4, 5),
-- Televizyonlar
('LG OLED55', 'LG OLED  4K Smart TV', 35999.00, 5, 7),
('Sony Bravia', 'Sony Bravia  4K Android TV', 27999.00, 5, 8),
-- Kulaklýk
('AirPods Pro', 'Apple AirPods Pro 2. Nesil', 5499.00, 6, 1),
('JBL Tune 500', 'JBL Kablolu Kulaküstü Kulaklýk', 799.00, 6, 10),
-- Yazýcý
('HP DeskJet 2710e', 'HP Kablosuz Çok Fonksiyonlu Yazýcý', 1899.00, 7, 5),
-- Kamera
('Sony Alpha A7 IV', 'Sony A7 ', 79999.00, 8, 8),
-- Akýllý Saat
('Apple Watch SE', 'Apple Watch SE 44mm GPS', 8499.00, 9, 1),
('Galaxy Watch 5', 'Samsung Galaxy Watch 5 44mm', 6399.00, 9, 2),
-- Oyun Konsolu
('PlayStation 5', 'Sony PlayStation 5 ', 24999.00, 10, 8),
('Xbox Series X', 'Microsoft Xbox Series X 1TB', 22000.00, 10, 10),
('Nintendo Switch', 'Nintendo Switch  64GB', 13999.00, 10, 10);

--Etiketler Tablosu Veri Ekleme
INSERT INTO Etiketler (EtiketAdi) VALUES 
('Ýndirimli'),
('Yeni Ürün'),
('Çok Satan'),
('Stokta Yok'),
('Sýnýrlý Stok'),
('Organik'),
('Ücretsiz Kargo'),
('Kampanyalý'),
('Popüler'),
('Haftanýn Ürünü');

--UrunEtiketleri Tablosu Veri Ekleme
INSERT INTO UrunEtiketleri (UrunID, EtiketID) VALUES
(1, 2), (1, 3), (1, 9),
(2, 1), (2, 3), (2, 7),
(3, 1), (3, 5),
(4, 2), (4, 7), (4, 10),
(5, 3), (5, 9),
(6, 5), (6, 8),
(7, 1), (7, 4),
(8, 2), (8, 10),
(9, 2), (9, 9),
(10, 3), (10, 7),
(11, 1), (11, 8),
(12, 2), (12, 7),
(13, 7),
(14, 1), (14, 3),
(15, 3), (15, 9),
(16, 3), (16, 7),
(17, 1), (17, 4),
(18, 6), (18, 7),
(19, 9), (19, 10),
(20, 2),
(21, 3), (21, 9),
(22, 8), (22, 4),
(23, 1), (23, 5),
(24, 9), (24, 10),
(25, 3), (25, 8);

--UrunYorumlari Tablosu Veri Ekleme
INSERT INTO UrunYorumlari(UrunID,MusteriID,Puan,YorumMetni)VALUES
(2,2,4,'Paketleme güzel'),
(3,1,5,'Paketleme güzel'),
(2,4,5,'Çok kullanýþlý'),
(5,3,5,'Paketleme güzel'),
(6,4,3,'Göründüðü gibi deðil'),
(7,5,5,'Paketleme güzeldi.Kargo elime çabuk oluþtu');

--Resimler Tablosu Veri Ekleme
INSERT INTO Resimler (ResimURL) VALUES
('https://example.com/images/iphone14.jpg'),
('https://example.com/images/galaxy_s23.jpg'),
('https://example.com/images/redmi_note12.jpg'),
('https://example.com/images/macbook_air.jpg'),
('https://example.com/images/thinkpad_e15.jpg'),
('https://example.com/images/asus_tuf.jpg'),
('https://example.com/images/hp_pavilion.jpg'),
('https://example.com/images/dell_xps13.jpg'),
('https://example.com/images/ipad10.jpg'),
('https://example.com/images/tab_s8.jpg'),
('https://example.com/images/xiaomi_pad6.jpg'),
('https://example.com/images/magic_mouse.jpg'),
('https://example.com/images/galaxy_buds.jpg'),
('https://example.com/images/hp_mouse.jpg'),
('https://example.com/images/lg_oled.jpg'),
('https://example.com/images/sony_bravia.jpg'),
('https://example.com/images/airpods_pro.jpg'),
('https://example.com/images/jbl_tune.jpg'),
('https://example.com/images/hp_deskjet.jpg'),
('https://example.com/images/sony_a7.jpg'),
('https://example.com/images/apple_watch.jpg'),
('https://example.com/images/galaxy_watch.jpg'),
('https://example.com/images/ps5.jpg'),
('https://example.com/images/xbox_seriesx.jpg'),
('https://example.com/images/nintendo_switch.jpg');

--UrunResim Tablosu Veri Ekleme
INSERT INTO UrunResim (UrunID, ResimID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25);

--Magazalar Tablosu Veri Ekleme
INSERT INTO Magazalar (MagazaAdi, Konum) VALUES
('TeknoCity Ýstanbul', 'Ýstanbul, Kadýköy'),
('Elektronix Ankara', 'Ankara, Çankaya'),
('MegaStore Ýzmir', 'Ýzmir, Konak'),
('Bursa Teknoloji', 'Bursa, Osmangazi'),
('E-Tek Muðla', 'Muðla, Bodrum');

--UrunStok Tablosu Veri Ekleme

INSERT INTO UrunStok (UrunID, MagazaID, StokAdet) VALUES
(1, 1, 15),
(2, 1, 10),
(4, 1, 5),
(7, 1, 8),
(10, 1, 12);

INSERT INTO UrunStok (UrunID, MagazaID, StokAdet) VALUES
(3, 2, 20),
(5, 2, 7),
(8, 2, 4),
(9, 2, 14),
(11, 2, 6);

INSERT INTO UrunStok (UrunID, MagazaID, StokAdet) VALUES
(6, 3, 9),
(12, 3, 11),
(13, 3, 15),
(14, 3, 10),
(17, 3, 2);

INSERT INTO UrunStok (UrunID, MagazaID, StokAdet) VALUES
(15, 4, 4),
(16, 4, 6),
(18, 4, 9),
(19, 4, 3),
(21, 4, 1);
INSERT INTO UrunStok (UrunID, MagazaID, StokAdet) VALUES
(20, 5, 10),
(22, 5, 5),
(23, 5, 7),
(24, 5, 8),
(25, 5, 2);

--OdemeYontemleri Tablosu Veri Ekleme
INSERT INTO OdemeYontemleri (YontemAdi) VALUES
('Kredi Kartý'),
('Banka Kartý'),
('Havale / EFT'),
('Kapýda Ödeme');


--Odemeler Tablosu Veri Ekleme
INSERT INTO Odemeler(SiparisID,YontemID) VALUES
(2,1),(3,4),(4,2),(5,3);

--Faturalar Tablosu Veri Ekleme
INSERT INTO Faturalar (SiparisID,FaturaNo,VergiOrani)VALUES
(2,'14489',20),
(3,'45619',20),
(4,'42678',20),
(5,'78578',20);


--SiparisDetay Tablosu Veri Ekleme
INSERT INTO SiparisDetay(SiparisID,UrunID,Adet,BirimFiyat)VALUES
(1,1,2,52999),(1,3,1,9999),
(2,4,1,64999),(2,2,2,44999),
(3,5,1,2399),
(4,6,3,29999),
(5,7,2,18999),
(6,8,1,41999),
(7,9,4,17999),
(8,10,1,20999),
(9,11,2,13999),
(10,12,1,2199);

--KargoSirketleri Tablosu Veri Ekleme
INSERT INTO KargoSirketleri (SirketAd) VALUES
('Yurtiçi Kargo'),
('MNG Kargo'),
('Aras Kargo'),
('Sürat Kargo');


--KargoTakip Veri Ekleme
INSERT INTO KargoTakip(SiparisID,SirketID,TakipNo,GonderimTarihi,Aciklama)
VALUES
(1,1,'123456', '2025-07-28 09:00:00','Yola Çýktý'),
(2,1,'124896', '2025-07-28 09:00:00','Yola Çýktý'),
(3,2,'168625', '2025-07-28 09:00:00','Yola Çýktý'),
(4,3,'268456', '2025-07-28 09:00:00','Yola Çýktý'),
(5,4,'124526', '2025-07-28 09:00:00','Yola Çýktý'),
(6,1,'123326', '2025-07-29 09:00:00','Yola Çýktý'),
(7,3,'497512', '2025-07-29 10:00:00','Yola Çýktý'),
(8,4,'117856', '2025-07-29 11:00:00','Yola Çýktý'),
(9,2,'169752', '2025-07-30 09:00:00','Yola Çýktý'),
(10,1,'544156', '2025-07-30 10:00:00','Yola Çýktý');

--Raporlar Tablosu Veri Ekleme
INSERT INTO Raporlar (RaporAd, KullaniciID, RaporTuru, Dosya, Aciklama) VALUES
('Aylýk Satýþ Raporu - Temmuz', 1, 'Satýþ', 'satistemmuz.pdf', 'Temmuz ayýna ait satýþ verileri.'),
('Stok Durumu - Haftalýk', 2, 'Stok', 'stokhaftalik.pdf', 'Haftalýk stok durumu ve eksik ürünler.'),
('Ürün Performansý 2025 Q2', 5, 'Ürün Performansý', 'raporlar/urun_q2.pdf', '2. çeyrekte en çok satan ürünler.'),
('Kargo Süreleri Analizi', 6, 'Kargo', 'kargo_sureleri.pdf', 'Teslimat süreleri.'),
('Müþteri Memnuniyeti Anketi', 2, 'Anket', 'musterianket2025.pdf', 'Müþterilerden alýnan geri bildirimler.'),
('Günlük Sipariþ Raporu - 30 Temmuz', 1, 'Sipariþ', 'siparis30temmuz.pdf', '30 Temmuz sipariþ hareketleri.'),
('Ýade Oranlarý Analizi', 6, 'Ýade', 'iadeoranlari.pdf', 'Ürün bazlý iade oranlarý.');


--Kayitlar Tablosu Veri Ekleme
INSERT INTO Kayitlar (KullaniciID, Islem, IslemTarihi, IPAdres) VALUES
(1, 'Giriþ yaptý', GETDATE(), '192.168.1.10'),
(3, 'Ürün ekledi', GETDATE(), '192.168.1.11'),
(3, 'Þifre deðiþtirdi', GETDATE(), '192.168.1.12'),
(1, 'Çýkýþ yaptý', GETDATE(), '192.168.1.10'),
(4, 'Adres bilgisi güncelledi', GETDATE(), '192.168.1.15');


--SistemAyarlar Tablosu Veri Ekleme
INSERT INTO SistemAyarlar (AyarAdi, AyarDegeri, Aciklama, GuncellemeTarihi)
VALUES
('VergiOrani', '20.00', 'KDV oraný', GETDATE()),
('VarsayilanKur', 'TRY', 'Sitede kullanýlan para birimi', GETDATE()),
('MaxIndirimOrani', '50', 'Maksimum indirim yüzdesi', GETDATE()),
('SiteBaslik', 'E-Ticaret Platformu', 'Site baþlýðý', GETDATE());


--Kampanyalar Tablosu Veri Ekleme
INSERT INTO Kampanyalar (KampanyaAdi,Aciklama,IndirimTuru,IndirimDegeri,BaslangicTarihi,BitisTarihi,MinimumSepetTutari)VALUES
('Hoþ Geldin Ýndirimi','Tüm ürünlerde geçerli %20 indirim','%',20,'2025-07-01','2025-08-01',200),
('Yaz Ýndirimi','Tüm ürünlerde geçerli 50 TL indirim','TL',50,'2025-07-01','2025-08-01',200),
('Kara Cuma Ýndirimi','Tüm ürünlerde geçerli %25 indirim','%',25,'2025-07-12','2025-08-01',200);


--KampanyaIcerik Tablosu Veri Ekleme
INSERT INTO KampanyaÝcerik (KampanyaID,KapsamTipi,KapsamID)VALUES
(1,'Ürün',1),
(1,'Ürün',2),
(1,'Ürün',3),
(1,'Ürün',4),
(1,'Ürün',5),
(1,'Ürün',6),
(1,'Ürün',7),
(1,'Ürün',8),
(2,'Ürün',1),
(2,'Ürün',11),
(2,'Ürün',13),
(2,'Ürün',14),
(2,'Ürün',15);


--Diller Tablosu Veri Ekleme
INSERT INTO Diller(DilKodu,DilAdi) VALUES
('tr','Türkçe'),
('en','Ýngilizce');

--Ceviriler Tablosu Veri Ekleme
INSERT INTO Ceviriler (TabloAdi,KayitID,KolonAdi,DilID,Deger)
VALUES
('Ulkeler', 1, 'UlkeAd', 2, 'Turkey')


--Sepet Tablosu Veri Ekleme
INSERT INTO Sepet(KullaniciID, OlusturmaTarihi)
VALUES 
(1, GETDATE()),
(2, GETDATE()),
(3, GETDATE()),
(4, GETDATE()),
(5, GETDATE()),
(6, GETDATE()),
(7, GETDATE()),
(8, GETDATE()),
(9, GETDATE()),
(10, GETDATE());

--SepetDetay Tablosu Veri Ekleme
INSERT INTO SepetDetay (SepetID, UrunID, Adet, BirimFiyat)
VALUES 
(1, 1, 2, 52999),
(1, 3, 1,9999),
(2, 4, 1, 64999),
(2, 2, 2, 44999),
(3, 5, 1,23999),
(4, 6, 3, 29999),
(5, 7, 2, 18999),
(6, 8, 1, 41999),
(7, 9, 4,17999),
(8, 10, 1, 20999),
(9, 11, 2,13999),
(10, 12, 1,2199),
(11, 13, 2, 2799),
(12, 14, 3, 499),
(13, 15, 1, 35999),
(14, 16, 1, 27999),
(15, 17, 2, 5499);
