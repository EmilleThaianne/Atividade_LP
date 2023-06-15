drop database if exists Pessoa;
create database Pessoa;
use Pessoa;

create table pessoa(
codigo int auto_increment primary key,
nome varchar(100) not null,
data_nascimento date not null
);

insert into pessoa(codigo,nome,data_nascimento) values (1,'Emille','2003-05-19');

select *from pessoa;

SELECT * FROM Empresa.Pessoa;
CREATE USER 'ET'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON * . * TO 'ET'@'localhost';
FLUSH PRIVILEGES;