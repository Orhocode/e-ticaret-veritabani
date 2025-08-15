CREATE DATABASE E_T�CARET


--Kullanicilar Tablosu  Olu�turma
CREATE TABLE Kullanicilar(
KullaniciID INT PRIMARY KEY IDENTITY(1,1),
Ad varchar(20) NOT NULL,
Soyad varchar(20) NOT NULL,
Email varchar(100) UNIQUE NOT NULL,
Cinsiyet varchar(1),
Sifre nvarchar(50) NOT NULL,
TelNo nvarchar(100),
DogumTarihi datetime,
KayitTarihi datetime DEFAULT GETDATE(),
);


--Roller Tablosu Olu�turma
CREATE TABLE Roller(
RolID INT PRIMARY KEY IDENTITY(1,1),
RolAd  varchar(30),
);

--KullaniciRol Tablosu Olu�turma
CREATE TABLE KullaniciRol(
KullaniciID INT,
RolID INT,
PRIMARY KEY (KullaniciID, RolID),
FOREIGN KEY (KullaniciID) REFERENCES Kullanicilar(KullaniciID),
 FOREIGN KEY (RolID) REFERENCES Roller(RolID)
);

--Musteriler Tablosu Olu�turma
CREATE TABLE Musteriler(
MusteriID INT PRIMARY KEY IDENTITY (1,1),
Ad varchar(20) NOT NULL,
Soyad varchar(20) NOT NULL,
Email varchar(100) UNIQUE NOT NULL,
Cinsiyet varchar(1),
TelNo nvarchar(50) NOT NULL,
Sifre nvarchar(50) NOT NULL
);

 --Ulkeler Tablosu Olu�turma
CREATE TABLE Ulkeler(
UlkeID INT PRIMARY KEY IDENTITY (1,1),
UlkeAd varchar(30) NOT NULL,
);


--Iller Tablosu Olu�turma
CREATE TABLE Iller(
IlID INT PRIMARY KEY IDENTITY (1,1),
IlAd varchar(30) NOT NULL,
UlkeID INT,
CONSTRAINT "FK_Il_Ulke" FOREIGN KEY (UlkeID) REFERENCES Ulkeler(UlkeID)
);

--Ilceler Tablosu Olu�turma
CREATE TABLE Ilceler(
IlceID INT PRIMARY KEY IDENTITY (1,1),
IlceAd varchar(30) NOT NULL,
IlID INT,
 FOREIGN KEY (IlID) REFERENCES Iller(IlID)
);

--Adresler Tablosu Olu�turma
CREATE TABLE Adresler(
AdresID INT PRIMARY KEY IDENTITY (1,1),
UlkeID INT FOREIGN KEY REFERENCES Ulkeler(UlkeID),
IlID INT FOREIGN KEY REFERENCES Iller(IlID),
IlceID INT FOREIGN KEY REFERENCES Ilceler(IlceID),
Ac�kAdres varchar(200)
);

--MusteriAdres Tablosu Olu�turma
CREATE TABLE MusteriAdres(
M_AdresID INT PRIMARY KEY IDENTITY (1,1),
MusteriID INT,
AdresID INT,
 FOREIGN KEY (MusteriID) REFERENCES Musteriler (MusteriID),
 FOREIGN KEY (AdresID) REFERENCES Adresler (AdresID),
);

--Siparisler Tablosu
CREATE TABLE Siparisler(
SiparisID  INT PRIMARY KEY IDENTITY (1,1),
MusteriID INT NOT NULL,
S�parisTarihi datetime DEFAULT GETDATE(),
ToplamTutar FLOAT NOT NULL,
Durum nvarchar(50) DEFAULT 'Beklemede',
 FOREIGN KEY (MusteriID) REFERENCES Musteriler(MusteriID)
);

--Sepet Tablosunu Olu�turduktan Sonra
ALTER TABLE Siparisler ADD SepetID INT;
ALTER TABLE Siparisler
ADD FOREIGN KEY (SepetID) REFERENCES Sepet(SepetID);

--MusteriPuanlari Tablosu Olu�turma
CREATE TABLE MusteriPuanlari(
PuanID INT PRIMARY KEY IDENTITY (1,1),
MusteriID INT NOT NULL,
SiparisID INT NOT NULL,
IslemTipi nvarchar(30) CHECK( IslemTipi IN('Kazan�','Harcama')),
PuanDegeri INT NOT NULL,
Aciklama varchar(200),
 FOREIGN KEY (MusteriID) REFERENCES Musteriler(MusteriID),
 FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID)
);

--Markalar Tablosu Olu�turma
CREATE TABLE Markalar(
MarkaID INT PRIMARY KEY IDENTITY (1,1),
MarkaAdi nvarchar(100) NOT NULL UNIQUE
);

--Kategoriler Tablosu Olu�turma
CREATE TABLE Kategoriler(
KategoriID INT PRIMARY KEY IDENTITY (1,1),
KategoriAd nvarchar(100) NOT NULL
);

--Urunler Tablosu Olu�turma
CREATE TABLE Urunler(
UrunID INT PRIMARY KEY IDENTITY (1,1),
UrunAd varchar(30) NOT NULL,
Aciklama nvarchar(200),
Fiyat float NOT NULL,
KategoriID INT NOT NULL,
MarkaID INT NOT NULL,
 FOREIGN KEY (KategoriID) REFERENCES Kategoriler(KategoriID),
FOREIGN KEY (MarkaID) REFeRENCES Markalar(MarkaID)
);

--Etiketler Tablosu Olu�turma
CREATE TABLE Etiketler(
EtiketID INT PRIMARY KEY IDENTITY (1,1),
EtiketAdi nvarchar(50) NOT NULL UNIQUE
);

--UrunEtiketleri Tablosu Olu�turma
CREATE TABLE UrunEtiketleri(
UrunID INT NOT NULL,
EtiketID INT NOT NULL,
PRIMARY KEY (UrunID,EtiketID),
FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID),
FOREIGN KEY (EtiketID) REFERENCES Etiketler(EtiketID)
);

--UrunYorumlari Tablosu Olu�turma
CREATE TABLE UrunYorumlari(
YorumID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
UrunID INT NOT NULL,
MusteriID INT NOT NULL,
Puan INT NOT NULL CHECK (Puan BETWEEN 1 AND 5),
YorumMetni nvarchar(500),
YorumTarihi datetime DEFAULT GETDATE()
FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID),
FOREIGN KEY (MusteriID) REFERENCES Musteriler(MusteriID)
);

--Resimler Tablosu Olu�turma
CREATE TABLE Resimler(
ResimID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
ResimURL nvarchar(500),
);

--UrunResim Tablosu Olu�turma
CREATE TABLE UrunResim(
ResimID INT NOT NULL,
UrunID INT NOT NULL,
PRIMARY KEY (UrunID,ResimID),
FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID),
FOREIGN KEY (ResimID) REFERENCES Resimler(ResimID)
);

--Magazalar Tablosu Olu�turma
CREATE TABLE Magazalar(
MagazaID INT PRIMARY KEY IDENTITY (1,1),
MagazaAdi varchar(100),
Konum NVARCHAR(500)
);

--UrunStok Tablosu Olu�turma
CREATE TABLE UrunStok(
StokID INT PRIMARY KEY IDENTITY (1,1),
UrunID INT NOT NULL,
MagazaID INT NOT NULL,
StokAdet INT,
FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID),
FOREIGN KEY (MagazaID) REFERENCES Magazalar(MagazaID)
);

--OdemeYontemleri Tablosu Olu�turma
CREATE TABLE OdemeYontemleri(
YontemID INT PRIMARY KEY IDENTITY (1,1),
YontemAdi varchar(100) NOT NULL
);

--Odemeler Tablosu Olu�turma
CREATE TABLE Odemeler(
OdemeID INT PRIMARY KEY IDENTITY (1,1),
SiparisID INT NOT NULL,
YontemID INT NOT NULL,
OdemeTutari FLOAT NOT NULL,
Tarihi DATETIME DEFAULT GETDATE(),
Durumu varchar(50) DEFAULT 'Beklemede'
FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID),
FOREIGN KEY (YontemID) REFERENCES OdemeYontemleri(YontemID)
);

 --Faturalar Tablosu Olu�turma
CREATE TABLE Faturalar(
FaturaID INT PRIMARY KEY IDENTITY (1,1),
SiparisID INT NOT NULL,
FaturaNo nvarchar(100) UNIQUE NOT NULL,
VergiOrani float NOT NULL,
Tutar float NOT NULL,
FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID),
);

--SiparisDetay Tablosu Olu�turma
CREATE TABLE SiparisDetay(
DetayID INT PRIMARY KEY IDENTITY(1,1),
SiparisID INT NOT NULL,
UrunID INT NOT NULL,
Adet INT NOT NULL,
BirimFiyat FLOAT NOT NULL,
ToplamFiyat AS (Adet * BirimFiyat) PERSISTED,
FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID),
FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID)
);

--KargoSirketleri Tablosu Olu�turma
CREATE TABLE KargoSirketleri(
SirketID INT PRIMARY KEY IDENTITY (1,1),
SirketAd varchar(100)
);

--KargoTakip Tablosu Olu�turma
CREATE TABLE KargoTakip(
TakipID INT PRIMARY KEY IDENTITY (1,1),
SiparisID INT NOT NULL,
SirketID INT NOT NULL,
TakipNo INT UNIQUE NOT NULL,
Durum nvarchar(50) DEFAULT 'Beklemede',
GonderimTarihi DATETIME NULL,
TeslimTarihi DATETIME NULL,
GuncellemeTarihi DATETIME DEFAULT GETDATE(),
Aciklama nvarchar(300),
FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID),
FOREIGN KEY (SirketID) REFERENCES KargoSirketleri(SirketID)
);

--Raporlar Tablosu Olu�turma
CREATE TABLE Raporlar(
RaporID INT PRIMARY KEY IDENTITY(1,1),
RaporAd varchar(50) NOT NULL,
KullaniciID INT NOT NULL,
RaporTuru varchar(50),
Tarih DATETIME DEFAULT GETDATE(),
Dosya nvarchar(200),
Aciklama nvarchar(400),
FOREIGN KEY (KullaniciID) REFERENCES Kullanicilar(KullaniciID)
);

--Kayitlar Tablosu Olu�turma
CREATE TABLE Kayitlar(
KayitID INT PRIMARY KEY IDENTITY (1,1),
KullaniciID INT NOT NULL,
Islem varchar(150) NOT NULL,
IslemTarihi DATETIME DEFAULT GETDATE(),
IPAdres NVARCHAR(50) NULL,
FOREIGN KEY (KullaniciID) REFERENCES Kullanicilar(KullaniciID)
);

--SistemAyarlar Tablosu Olu�turma
CREATE TABLE SistemAyarlar (
AyarID INT IDENTITY(1,1) PRIMARY KEY,
AyarAdi NVARCHAR(100) NOT NULL,  
AyarDegeri NVARCHAR(255) NOT NULL,
Aciklama NVARCHAR(255) NULL,
GuncellemeTarihi DATETIME DEFAULT GETDATE()
);

--Kampanyalar Tablosu Olu�turma
CREATE TABLE Kampanyalar (
KampanyaID INT IDENTITY(1,1) PRIMARY KEY,
KampanyaAdi NVARCHAR(100) NOT NULL,
Aciklama NVARCHAR(255) NULL,
IndirimTuru NVARCHAR(10) NOT NULL,   
IndirimDegeri DECIMAL(10,2) NOT NULL, 
BaslangicTarihi DATETIME NOT NULL,
BitisTarihi DATETIME NOT NULL,
MinimumSepetTutari DECIMAL(10,2) NULL, 
);

--Kampanya�cerik Tablosu Olu�turma
CREATE TABLE Kampanya�cerik (
ID INT IDENTITY (1,1) PRIMARY KEY ,
KampanyaID INT FOREIGN KEY REFERENCES Kampanyalar(KampanyaID),
KapsamTipi NVARCHAR(20) NOT NULL,  
KapsamID INT NULL                
);

--Diller Tablosu Olu�turma
CREATE TABLE Diller (
DilID INT  PRIMARY KEY IDENTITY (1,1),
DilKodu NVARCHAR(10) NOT NULL, -- tr, en
DilAdi NVARCHAR(50) NOT NULL   -- T�rk�e, English
);

--Ceviriler Tablosu Olu�turma
CREATE TABLE Ceviriler (
CeviriID INT  PRIMARY KEY IDENTITY (1,1),
TabloAdi NVARCHAR(50) NOT NULL,   -- �rn: Urunler
KayitID INT NOT NULL,             -- �rn: UrunID
KolonAdi NVARCHAR(50) NOT NULL,   -- �rn: UrunAdi
DilID INT FOREIGN KEY REFERENCES Diller(DilID),
Deger NVARCHAR(255) NOT NULL
);

--Sepet Tablosu Olu�turma
CREATE TABLE Sepet(
SepetID INT PRIMARY KEY IDENTITY (1,1),
KullaniciID INT NOT NULL FOREIGN KEY REFERENCES Musteriler(MusteriID),
OlusturmaTarihi DATETIME DEFAULT GETDATE(),
ToplamTutar DECIMAL(10,2) DEFAULT 0,
Durum NVARCHAR(20) DEFAULT 'Aktif'
);

--SepetDetay Tablosu Olu�turma
CREATE TABLE SepetDetay(
DetayID INT PRIMARY KEY IDENTITY (1,1),
SepetID INT NOT NULL FOREIGN KEY REFERENCES Sepet(SepetID),
UrunID INT NOT NULL FOREIGN KEY REFERENCES Urunler(UrunID),
Adet INT NOT NULL,
BirimFiyat FLOAT NOT NULL,  
AraToplam AS (Adet * BirimFiyat) PERSISTED
);

