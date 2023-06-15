drop database if exists Empresa;
create database Empresa;
use Empresa;

create table Pessoa (
codigo int auto_increment primary key,
nome varchar (100),
data_nascimento date 
);

insert into Pessoa values (1,'Emille Thaianne','2003-05-19');
insert into Pessoa values (2,'Islan Santos', '2002-10-23');
insert into Pessoa values (3,'Sofia Nogueira','2015-06-10');

select * from Pessoa;

SELECT codigo, nome, DATE_FORMAT(Data_nascimento,'%d/%m/%Y') AS Data_nascimento FROM pessoa;