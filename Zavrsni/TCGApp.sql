
use master;
go
drop database if exists tcgapp;
go
create database tcgapp;
go
alter database tcgapp collate Croatian_CI_AS;
go
use tcgapp;

create table korisnici(
sifra int not null primary key identity (1,1),
username varchar(30) not null,
ime varchar(30) not null,
prezime varchar(30) not null,
email varchar(100) not null,
mjesto varchar(50),
drzava varchar(50)
);

create table korisnici_igre(
korisnik int not null,
igra int not null
);

create table igre(
sifra int not null primary key identity (1,1),
naziv varchar(50) not null,
izdavac varchar(50)
);

create table kolekcije(
sifra int not null primary key identity (1,1),
naziv varchar(50) not null,
godinaizdavanja int,
igra int
);

create table slicice(
sifra int not null primary key identity (1,1),
naziv varchar(50) not null,
kolekcija int not null,
brojslicice int,
rijetkost varchar(10),
posebnoizdanje bit
);


alter table korisnici_igre add foreign key (korisnik) references korisnici(sifra);
alter table korisnici_igre add foreign key (igra) references igre(sifra);
alter table kolekcije add foreign key (igra) references igre(sifra);
alter table slicice add foreign key (kolekcija) references kolekcije(sifra);


-- Testiranje insert funkcije

insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('bpetra', 'Petra', 'Božić', 'bozic.petra35@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('dfarkas', 'Dominik', 'Farkaš', 'sinisartf13@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('nglavas', 'Natalija', 'Glavaš', 'natalija-glavas@hotmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('mjanic', 'Miroslav', 'Janić', 'miroslav.janic@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('fjanjesic', 'Filip', 'Janješić', 'filip.janjesic@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('njovic', 'Nataša', 'Jović', 'natasajovic238@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('lbaric', 'Luka', 'Barić', 'lukabaric15@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('akelava', 'Antonio', 'Kelava', 'kelava.antonio392@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('mkesinovic', 'Marijan', 'Kesinović', 'kesinovic957@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('ileninger', 'Ivan', 'Leninger', 'ileninger@live.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('amacanga', 'Antonio', 'Macanga', 'macanga.antonio@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('amiloloza', 'Antonio', 'Miloloža', 'milolozaantonio@yahoo.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('mpavkovic', 'Matija', 'Pavković', 'matijapavkovic74@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('kpeterfaj', 'Karlo', 'Peterfaj', 'karlo.peterfaj@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('aplecas', 'Adriana', 'Plećaš', 'adriana.plecas@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('isencic', 'Ivan', 'Senčić', 'ivan.sencic2000@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('zsuler', 'Zvonimir', 'Šuler', 'zvonimir.suler@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('mturcek', 'Mario', 'Turček', 'mario.turcek@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('dveseli', 'Domagoj', 'Veseli', 'dveseli555@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('kvukovic', 'Kristijan', 'Vuković', 'alanford700@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('ivukusic', 'Ivan', 'Vukušić', 'ivukusic27@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('rzaric', 'Roman', 'Žarić', 'roman.zaric@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('ipavlovic', 'Ivan', 'Pavlović', 'ipavlovic6437@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('azupanic', 'Andrea', 'Županić', 'andrea.zupanic10@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('tzupanic', 'Tomislav', 'Županić', 'tomislav.zupanic333@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('mpetak', 'Martina', 'Petak', 'petak.martina@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('mperak', 'Marko', 'Perak', 'markoperak469@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('bmokris', 'Bartol', 'Mokriš', 'bartol567@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('ljularic', 'Ljubomir', 'Jularić', 'ljubojularic93@gmail.com', null, 'Hrvatska');
insert into korisnici (username, ime, prezime, email, mjesto, drzava) values ('icelic', 'Ivor', 'Ćelić', 'ivorcelic@gmail.com', null, 'Hrvatska');

insert into igre (naziv, izdavac)
values ('Digimon Card Game', 'Bandai Namco');

insert into kolekcije (naziv, godinaizdavanja, igra) values ('EX-01', '2022', 1);
insert into kolekcije (naziv, godinaizdavanja, igra) values ('EX-02', '2022', 1);

insert into korisnici_igre (korisnik, igra) values (1,1);

insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('MetalGarurumon', 1, 21, 'super rare', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Gigimon', 2, 1, 'uncommon', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Gigimon', 2, 1, 'uncommon', 1);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Xiaomon', 2, 2, 'uncommon', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Viximon', 2, 3, 'uncommon', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Viximon', 2, 3, 'uncommon', 1);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Gummymon', 2, 4, 'uncommon', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Gummymon', 2, 4, 'uncommon', 1);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Hopmon', 2, 5, 'uncommon', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Yaamon', 2, 6, 'uncommon', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Yaamon', 2, 6, 'uncommon', 1);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Mother D-Reaper', 2, 7, 'rare', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Guilmon', 2, 8, 'rare', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Guilmon', 2, 8, 'rare', 1);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Growlmon', 2, 9, 'common', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('WarGrowlmon', 2, 10, 'uncommon', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Gallantmon', 2, 11, 'superrare', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Gallantmon', 2, 11, 'superrare', 1);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Megidramon', 2, 12, 'superrare', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Megidramon', 2, 12, 'superrare', 1);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Labramon', 2, 13, 'common', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('IceDevimon', 2, 14, 'common', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Seasarmon', 2, 15, 'common', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Gorillamon', 2, 16, 'common', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Leomon', 2, 17, 'superrare', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Leomon', 2, 17, 'superrare', 1);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('MarineAngemon', 2, 18, 'rare', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('MarineAngemon', 2, 18, 'rare', 1);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Renamon', 2, 19, 'rare', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Renamon', 2, 19, 'rare', 1);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Lopmon', 2, 20, 'common', 0);
insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje) values ('Kyubimon', 2, 21, 'common', 0);



select * from korisnici;
select * from igre;
select * from kolekcije;
select * from korisnici_igre;
select * from slicice;
