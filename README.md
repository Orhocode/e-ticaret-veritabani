# 🛒 E-Ticaret Veritabanı Projesi

Bu proje, **Microsoft SQL Server** üzerinde tasarlanmış kapsamlı bir e-ticaret veritabanı modelini içerir.  
Amacı, kullanıcı yönetimi, ürün katalogları, sipariş süreçleri, ödeme yöntemleri, kargo ve raporlama gibi temel e-ticaret bileşenlerini **SQL düzeyinde** modellemektir.

---

## 📂 Dosya Yapısı

```
📦 e-ticaret-veritabani
 ┣ 📄 01_create_tables.sql   # Tabloları oluşturma scripti
 ┣ 📄 02_insert_data.sql     # Örnek veri ekleme scripti
 ┣ 📄 03_trigger_and_update_sql # Dinamik işlemler için trigger ve update
 ┣ 📄 04_querry.sql # Örnek sorgular
 ┗ 📄 README.md   # Proje açıklaması
```

---

## 📋 Veritabanı Tabloları

| Tablo Adı            | Açıklama |
|----------------------|----------|
| **Kullanicilar**     | Kullanıcı bilgilerini saklar |
| **Roller**           | Kullanıcı rolleri (Admin, Satıcı vb.) |
| **KullaniciRol**     | Kullanıcı ile rol ilişkisini tutar |
| **Musteriler**       | Müşteri bilgilerini saklar |
| **Ulkeler / Iller / Ilceler** | Adres bilgilerini saklar |
| **Adresler**         | Adres kayıtlarını tutar |
| **MusteriAdres**     | Müşteri-adres ilişkilerini tutar |
| **Siparisler**       | Sipariş bilgilerini tutar |
| **Markalar**         | Ürün markalarını saklar |
| **Kategoriler**      | Ürün kategorilerini saklar |
| **Urunler**          | Ürün bilgilerini saklar |
| **Etiketler / UrunEtiketleri** | Ürün etiketlerini tutar |
| **UrunYorumlari**    | Kullanıcı yorumlarını saklar |
| **Resimler / UrunResim** | Ürün görsellerini tutar |
| **Magazalar**        | Mağaza bilgilerini saklar |
| **UrunStok**         | Mağaza bazlı stok bilgilerini saklar |
| **OdemeYontemleri / Odemeler** | Ödeme bilgilerini saklar |
| **Faturalar**        | Fatura bilgilerini saklar |
| **SiparisDetay**     | Sipariş ürün detaylarını saklar |
| **KargoSirketleri / KargoTakip** | Kargo bilgilerini saklar |
| **Raporlar**         | Raporlama bilgilerini saklar |
| **Kayitlar**         | Kullanıcı işlem kayıtlarını tutar |
| **SistemAyarlar**    | Sistem ayarlarını saklar |
| **Kampanyalar / KampanyaIcerik** | Kampanya bilgilerini saklar |
| **Diller / Ceviriler** | Çok dillilik desteği |
| **Sepet / SepetDetay** | Sepet bilgilerini saklar |

---

## ⚙️ Kurulum ve Kullanım

1. Bilgisayarınızda **Microsoft SQL Server** ve **SQL Server Management Studio (SSMS)** kurulu olmalıdır.
2. `01_create_tables.sql` dosyasını çalıştırarak veritabanı tablolarını oluşturun.
3. `02_insert_data.sql` dosyasını çalıştırarak örnek verileri ekleyin.
4. `03_trigger_and_update_sql` dosyasını çalıştırarak dinamik işlemleri yapın.
5. `04_querry.sql` dosyasını çalıştırarak örnek sorgulara erişin.



---

## 📌 Notlar

- Tablolar arası ilişkiler **Primary Key** ve **Foreign Key** kısıtlamaları ile tanımlanmıştır.
- Scriptler eğitim ve örnek amaçlıdır; gerçek projelerde geliştirme öncesi optimize edilmelidir.
- Veritabanı adı script içerisinde tanımlıdır, gerekirse kendi projenize göre değiştirebilirsiniz.

---

## 📜 Lisans

Bu proje **eğitim amaçlıdır**. Ticari kullanım için düzenlenmeden kullanılmamalıdır.
