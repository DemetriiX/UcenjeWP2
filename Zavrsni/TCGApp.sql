
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

insert into korisnici (username, ime, prezime, email, mjesto, drzava)
values ('šuškavac55', 'Šuško', 'Slović', 'ćedavidimo@gmail.com', 'Boguizanogu', 'Nigdjezemska');

insert into igre (naziv, izdavac)
values ('Digimon Card Game', 'Bandai Namco');

insert into kolekcije (naziv, godinaizdavanja, igra)
values ('EX-01', '2022', 1);

insert into korisnici_igre (korisnik, igra)
values (1,1)

insert into slicice (naziv, kolekcija, brojslicice, rijetkost, posebnoizdanje)
values ('MetalGarurumon', 1, 21, 'super rare', 0);

select * from korisnici;
select * from igre;
select * from kolekcije;
select * from korisnici_igre;
select * from slicice;
