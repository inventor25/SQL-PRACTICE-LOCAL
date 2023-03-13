--************ORDER BY CLAUSE
drop table insanlar
CREATE TABLE insanlar (
ssn char(9),
isim varchar(50),
adres varchar(50) );
INSERT INTO insanlar VALUES(123456789,'Ali Can','Istanbul');
INSERT INTO insanlar VALUES(123456790,'Veli Cem','Ankara');
INSERT INTO insanlar VALUES(345678901,'Mine Bulut','Izmir');
INSERT INTO insanlar VALUES(345678902,'Mine Yasa','Isparta');
INSERT INTO insanlar (ssn, adres) VALUES(456789012,'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123,'Denizli');
update insanlar
set adres='Izmir'
where ssn='345678902'
SELECT *
FROM insanlar

--adrese göre sıralayın
select * from insanlar 
ORDER  BY adres;

--Soru: isimi mine olanları id ye göre sırala

select * from insanlar3 
where adres='Izmir'
order by isim

drop table insanlar3
Create table insanlar3 
(
	id int,
isim varchar(20),
soyisim varchar(20),
mevki varchar(30),
adres varchar(30),
ise_giris_tar date,
maas int
	);
DELETE FROM insanlar3
WHERE id=12348
INSERT INTO insanlar3 VALUES(12345,'Ahmet','OZ','QA','Istanbul','10-04-10',5000);
INSERT INTO insanlar3 VALUES(12346,'Mehmet','OZ','QA','Istanbul','11-03-07',4760);
INSERT INTO insanlar3 VALUES(12348,'Ali','CAN','QA','Istanbul','12-01-09',4500);
INSERT INTO insanlar3 VALUES(12349,'Burak','KAYA','DEV','Ankara','10-06-12',6000);
INSERT INTO insanlar3 VALUES(12340,'Burak','KADA','DEV','Ankara','06-03-11',6000);
INSERT INTO insanlar3 VALUES(12350,'Veli','YILDIZ','DEV','Izmir','11-06-08',7000);
INSERT INTO insanlar3 VALUES(12360,'Ferhat','YAVAS','QA','Izmir','10-06-09',6700);
INSERT INTO insanlar3 VALUES(12361,'Faris','MANGA','DEV','Bursa','09-04-07',8000);
INSERT INTO insanlar3 VALUES(12362,'Jon','BLACK','QA','Bursa','01-03-02',5000);
INSERT INTO insanlar3 VALUES(12363,'Tom','JERY','QA','Kocaeli','4-03-07',5500);
INSERT INTO insanlar3 VALUES(12364,'Meltem','ASLAN','QA','Erzurum','12-05-08',5500);
INSERT INTO insanlar3 VALUES(12365,'Meltem','KOCA','DEV','Erzurum','11-05-08',5600);
INSERT INTO insanlar3 VALUES(12366,'Esma','KAS','DEV','Erzurum','10-03-12',8600);
INSERT INTO insanlar3 VALUES(12367,'Elif','KARA','QA','Istanbul','09-01-12',null);
INSERT INTO insanlar3 VALUES(12367,'Canan','FILO','DEV','Istanbul','11-01-12',null);

--soru1: Tom'un soyadını HANKS yapan sorgu  
update insanlar3
set soyisim='HANKS'
WHERE id=12363;
select * from insanlar3;

--soru2 maas'ı null olanları getiren sorgu
select * from insanlar3 where maas!=null;  --- ekrana null maas olanlar yazılmadı*******
SELECT * FROM insanlar3 where maas is null

--soru3 adres'i istanbul olanları ekrana yazdırın
select * from insanlar3 where adres='Istanbul'; 

--soru4 adresi Ankara ve maası 4000 den fazla olanları ekrana yazdırın
select * from insanlar3 where maas>4000 and  adres='Ankara';
select * from insanlar3 where adres IN('Ankara') and maas>4000;
select adres='Ankara' from insanlar3 where maas>4000--*****boolen yazdırdı

--soru5 soyisimi oz olanlar yada qa olanları yazdırın maası null olmasın
select * from insanlar3 where soyisim='OZ' or mevki='QA' AND maas is NOT null
 --soru6 ismi canan olan insanın maas'nı girilmedi olarak değiştirin
 update insanlar3
 set maas='girilmedi' where isim='Canan' ---- değistirmez çünkü integer değer

update insanlar3
 set maas=null where isim='Canan'--- 
 
 --soru7 maas'ı 5000 ile 8500 arasında olanları yazdırın
 
 select * from insanlar3 
 where maas>5000 and maas<8900;
 
 select * from insanlar3 where maas between 5000 and 8900; -- between ile cözüm
 
  --soru8 maas'ı 4000 ile 7500 dısında olanları yazdırın
 select * from insanlar3 where maas not between 5000 and 7500;
 
 --soru9 adreslerden en yüksek maas'ı  yazdırın
 SELECT adres, MAX (maas) AS en_fazla_maas
FROM insanlar3 GROUP BY adres ;

--soru10 adreslerden en yüksek maas ve en düsük maas'ı yazdırın

 SELECT adres,MIN (maas) AS en_az_maas, MAX (maas) AS en_fazla_maas
FROM insanlar3 GROUP BY adres;

--soru11 tabloyu isimlere göre sıralayın
select *from insanlar3
order by isim

--soru11 tabloyu isimlere göre naturel soyisimlere göre ters sıralayın
select *from insanlar3
order by isim asc , soyisim desc

select *from insanlar3
order by isim asc ,3 desc -- soyisim yerine sutun sırası yazıldı aynı sonuc verildi

--soru12 İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
select isim,soyisim
from insanlar3
order by length(soyisim) --ilk önce soyisimleri küçükten büyüğe sıraladı sonra soyisimleri sıralananlara baktı isimleri kısa olanı üste yazdı

--soru13 isim ve soy isimleri tek sütunda yazdırın
select CONCAT (isim ,' ', soyisim) as isim_soyisim from insanlar3 ;

--soru14 adres ve tarihi bir sutunda olacak sekilde ve soy isim uzunluğuna göre sıralama yapınız
select concat (adres,' ',ise_giris_tar) as adres_tarih from insanlar3 order by length(isim) 
Drop table insanlar3;

