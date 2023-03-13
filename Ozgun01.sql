CREATE TABLE musteriler10
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
	);
INSERT INTO musteriler10 VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler10 VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler10 VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler10 VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler10 VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler10 VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler10 VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler10 VALUES (20, 'Eddie', 'Apple');

select * from musteriler10;
select * from musteriler10 where musteri_isim='Adem' or urun_id=40;
select *from musteriler10 where urun_isim in ('Orange','Palm') ;
select * from musteriler10 where urun_id>10 and urun_id<30; 
select * from musteriler10 WHERE urun_id BETWEEN 11 AND 21 ;
select * from musteriler10 where urun_id not between 9 and 19;


drop table if exists personel;
DROP TABLE calisanlar cascade;
truncate table calisanlar;
DELETE FROM maas;

CREATE TABLE calisanlar2 (
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
	maas int,
isyeri VARCHAR(20) );

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko'); 
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko'); 
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin'); 
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin'); 
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');


CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select *from calisanlar2;
select *from markalar;
-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve
--bu markada calisanlarin isimlerini ve maaşlarini listeleyin.
select isyeri,isim,maas from calisanlar2 where isyeri in (select marka_isim from markalar where calisan_sayisi>15000)
-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.
select isim,maas,sehir, from calisanlar2 where isyeri in (select marka_isim from markalar where marka_id>101);
-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
select marka_id,calisan_sayisi from markalar where marka_isim in(select isyeri from calisanlar2 where sehir='Ankara');
-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id,marka_isim,(select count (sehir) from calisanlar2 where marka_isim=isyeri )as sehir_sayisi from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim,calisan_sayisi,(select sum(maas) from calisanlar2 WHERE marka_isim = isyeri) as toplam_maas from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait
--calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yazin

select marka_isim,calisan_sayisi,(select max(maas)from calisanlar2 where marka_isim=isyeri)as max_maas ,(select min(maas)from calisanlar2 where marka_isim=isyeri)as min_maas from markalar;


CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda'); 
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda'); 
INSERT INTO mart VALUES (40, 'John', 'Hyundai'); 
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan
(
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda'); 
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota'); 
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo'); 
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select *from nisan;
select *from mart;
--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin URUN_ID’lerini listeleyen ve aynı zamanda
--bu ürünleri MART ayında alan MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
SELECT urun_id,musteri_isim FROM mart
WHERE exists (select urun_id FROM nisan WHERE mart.urun_id=nisan.urun_id)
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan where exists(select urun_isim from mart where nisan.urun_isim=mart.urun_isim);

--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri 
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan where not exists(select urun_isim from mart where nisan.urun_isim=mart.urun_isim);

			--Tablodaki Data Nasil Update Edilir (UPDATE SET)?*******************
			
CREATE TABLE tedarikciler
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50), 
irtibat_ismi VARCHAR(50) );
	
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade );

INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can'); 
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka'); 
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak'); 
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from tedarikciler;

select * from urunler;
-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
update tedarikciler
set firma_ismi ='Vestel' where vergi_no=102;

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.

update tedarikciler 
set firma_ismi='Casper',irtibat_ismi='Ali Veli' where vergi_no=101;
-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
update urunler 
set urun_isim='Telefon' where urun_isim='Phone';
-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
update urunler
set urun_id=urun_id+1 where urun_id>1004;

-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz
update urunler 
set urun_id=urun_id+ted_vergino ;
-- urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda 
--irtibat_ismi 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
update urunler
set urun_isim=(select firma_ismi from tedarikciler where irtibat_ismi='Adam Eve') where musteri_isim='Ali Bak';


create table personel
(
	id int,
	
isim varchar(30),
soyisim varchar(30),
email varchar(50),
ise_baslama_tar date,
is_unvani varchar(20),
	
maas int
);

INSERT INTO personel VALUES (123456789,'Ali','Can','alican@gmail.com','10-APR-10','isci',5000);
INSERT INTO personel VALUES (123456788,'Veli','Can','velican@gmail.com','10-JAN-12','isci',5500);
INSERT INTO personel VALUES (123456788,'Ayse','Gul','aysegul@gmail.com','01-MAY-14','Muhasebeci',4500);

INSERT INTO personel VALUES (123456788,'Fatma','Yasa','fatmayasa@gmail.com','10-APR-09','Muhendis',7500);
INSERT INTO personel VALUES (123456788,'Fatma','Nur','fatmanur@gmail.com','11-JAN-08','Muhendis',6500);
INSERT INTO personel VALUES (123456789,'Ali','Kada','alikada@gmail.com','10-APR-20','Muhasebeci',6000);
SELECT * FROM PERSONEL; 

--Tablodan maasi 5000’den az veya unvani isci olanlarin isimlerini listeleyin

select * from personel where maas<5000 or is_unvani='isci';
--Iscilerin tum bilgilerini listeleyin
select* from personel where is_unvani='isci';
--Soyadi Can,Cem veya Gul olanlarin unvanlarini ve maaslarini listeleyin
select * from personel where soyisim IN ('Can','Cem','Gul');
update personel
set soyisim='Cem' where isim='Veli';
update personel
set email='velicem@gmail.com' where isim='Veli';
--Soyadi Can,Cem veya Gul olanlarin unvanlarini ve maaslarini listeleyin
select is_unvani,maas from personel where soyisim IN ('Can','Cem','Gul');
--Maasi 5000’den cok olanlarin emailve is baslama tarihlerini listeleyin
select email,ise_baslama_tar from personel where maas>5000;
--Maasi 5000’den cok veya 7000’den az olanlarin tum bilgilerini listeleyin
select * from personel where maas>5000 or maas<7000; 
--çalısan isim ve soyisimleri tek sutun yapın
select isim || ' '|| soyisim as isim_soyisim from personel; -- isim soy isimi arasında boşluk bırakarak birleştirdik


--				ORDER BY CLAUSE*********
select * from personel
order by isim;				-- isme göre sıralandı

select * from personel
order by ise_baslama_tar;  -- küçük yıldan büyük yıla doğru doğal sıralama yaptı

select * from personel
where isim='Ali'
order by soyisim;			-- ismi aynı olanları soyisime göre sıraladık 

select * from personel
where isim='Ali'
order by 3;	 				-- ismi aynı olanları soyisime göre sıraladık ama field numarası kullandık

select * from personel 
where maas>5000
order by maas desc ;		--maas'ı 5000'den büyük olanları ters sıraladık

select * from personel
order by isim asc,soyisim desc; ---isme göre natural soyisme göre ters sıralama yaptık

select * from personel 
order by length (email); 		--email length'ine göre sıralama yaptık

SELECT CONCAT (isim, ' ' , soyisim) AS isim_soyisim FROM personel
ORDER BY LENGTH(isim)+LENGTH(soyisim);	 --isim soyisim aynı sütun yaparak toplam length ine göre sıralama 

select isim || ' '|| soyisim as isim_soyisim from personel 
order by length(isim)+LENGTH(soyisim); -- isimsoyisim aynı stütun yaparak toplam legth ine göre sıralama

--				*******IS NULL CONDITION********
CREATE TABLE insanlar (
ssn char(9),
isim varchar(50),
adres varchar(50) );
INSERT INTO insanlar VALUES(123456789,'Ali Can','Istanbul');
INSERT INTO insanlar VALUES(123456790,'Veli Cem','Ankara');
INSERT INTO insanlar VALUES(345678901,'Mine Bulut','Izmir');
INSERT INTO insanlar (ssn, adres) VALUES(456789012,'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123,'Denizli');
SELECT *
FROM insanlar WHERE isim IS NULL;
SELECT *
FROM insanlar
WHERE isim IS NOT NULL;

UPDATE insanlar
SET isim = 'Isim Girilmemis' WHERE isim IS NULL;