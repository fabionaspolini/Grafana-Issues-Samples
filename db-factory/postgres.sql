drop table if exists city;
drop table if exists state;
drop table if exists country;

create table country(id char(2) primary key , name varchar(40));
create table state(countryId char(2) references Country(id), id char(2), name varchar(40), primary key (countryId, id));
create table city(id serial primary key, countryId char(2), stateId char(2), name varchar(60), foundation_date date, foreign key (countryId, stateId) references state(countryId, id));

insert into country
values ('US', 'United States of America'),
       ('BR', 'Brasil');

insert into state
values ('US', 'AL', 'Alabama'),
       ('US', 'KS', 'Kansas'),
       ('US', 'TX', 'Texas'),
       ('BR', 'SP', 'São Paulo'),
       ('BR', 'RJ', 'Rio de Janeiro'),
       ('BR', 'SC', 'Santa Catarina');

insert into city (countryId, stateId, name, foundation_date)
values ('US', 'AL', 'Alpine', '2019-12-01'),
       ('US', 'AL', 'Bellwood', '2019-11-01'),
       ('US', 'AL', 'Billingsley', '2018-10-01'),
       ('US', 'KS', 'Arma', '2018-10-01'),
       ('US', 'KS', 'Aurora', '2017-02-01'),
       ('US', 'KS', 'Belpre', '2019-04-01'),
       ('US', 'TX', 'Adrian', '2019-12-01'),
       ('US', 'TX', 'Annona', '2019-10-01'),
       ('US', 'TX', 'Avery', '2020-10-01'),
       ('BR', 'SP', 'São Paulo', '2000-10-01'),
       ('BR', 'SP', 'Campinas', '2001-10-01'),
       ('BR', 'SP', 'Guarulhos', '2002-10-01'),
       ('BR', 'RJ', 'Rio de Janeiro', '2020-10-01'),
       ('BR', 'RJ', 'Rio Claro', '2000-10-01'),
       ('BR', 'RJ', 'Volta Redonda', '2004-10-01'),
       ('BR', 'SC', 'Criciúma', '2019-10-01'),
       ('BR', 'SC', 'Florianópolis', '2019-10-01'),
       ('BR', 'SC', 'Blumenau', '2019-10-01');