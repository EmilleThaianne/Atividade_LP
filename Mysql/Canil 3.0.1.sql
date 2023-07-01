-- Camilo Fondado, Emille Thaianne e Davi Cunha
-- 3° TI A, lista de banco de dados

-- CRIANDO DATABASE
DROP DATABASE IF EXISTS CanilCanil;
CREATE DATABASE CanilCanil;

-- ATIVAR A DATABASE PARA SER USADA
USE CanilCanil;

-- DELETAR AS TABELAS CASO JAH EXISTA
/*
DROP TABLE Cao
DROP TABLE Raca
DROP TABLE Treinador
DROP TABLE Vacina
DROP TABLE Competicao
DROP TABLE Cliente
DROP TABLE Cao_Treinador
DROP TABLE Mencao
DROP TABLE Cao_Vacina
DROP TABLE Cao_Competicao
*/

-----------------------------------------------------------------------------------------------------------------------------------------------

-- CRIANDO A TABELA CAO
CREATE TABLE Cao 
(
	NumPedigre int AUTO_INCREMENT primary key,
	NomeCao varchar(50) NOT NULL,
	Sobrenome varchar(50) NOT NULL,
	Cor_Conjunto_Cores varchar(50) NOT NULL,
	DataNascimento varchar(50) NOT NULL,
	CodRaca int NOT NULL,
	CodCliente int NOT NULL,
	CodPai int,
	CodMae int
)AUTO_INCREMENT=1;

-- CRIANDO A TABELA RACA
CREATE TABLE Raca 
(
	CodRaca int AUTO_INCREMENT NOT NULL primary key,
	NomeRaca varchar(50) NOT NULL,
	Tamanho int NOT NULL,
	PesoMedio decimal(5,2) NOT NULL,
	ValorVenda int NOT NULL,
	ObsGerais varchar(50) NOT NULL
)AUTO_INCREMENT=1;

-- CRIANDO A TABELA TREINADOR
CREATE TABLE Treinador 
(
	CodTreinador int AUTO_INCREMENT NOT NULL primary key,
	NomeTreinador varchar(50) NOT NULL,
	EnderecoTreinador varchar(50) NOT NULL,
	TelefoneTreinador varchar(25) NOT NULL
)AUTO_INCREMENT=1;

-- CRIANDO A TABELA VACINA
CREATE TABLE Vacina 
(
	CodVacina int AUTO_INCREMENT NOT NULL primary key,
	TipoVacina varchar(50) NOT NULL,
	DescVacina varchar(50) NOT NULL
)AUTO_INCREMENT=1;

-- CRIANDO A TABELA COMPETICAO
CREATE TABLE Competicao 
(
	CodCompeticao int AUTO_INCREMENT NOT NULL primary key,
	DescCompeticao varchar(50) NOT NULL,
	DataCompeticao date NOT NULL 
)AUTO_INCREMENT=1;


-- CRIANDO A TABELA CLIENTE
CREATE TABLE Cliente 
(
	CodCliente int AUTO_INCREMENT NOT NULL primary key,
	TipoDocumento varchar(25) NOT NULL,
	NumDocumento char(11) NOT NULL,
	NomeCliente varchar(50) NOT NULL,
	EnderecoCliente varchar(50) NOT NULL,
	TelefoneCliente varchar(25) NOT NULL
)AUTO_INCREMENT=1;

-- Criando tabela Mencao
CREATE TABLE Mencao
(
	CodMencao int AUTO_INCREMENT NOT NULL primary key,
	DescMencao varchar(25) NOT NULL
)AUTO_INCREMENT=1;

-----------------------------------------------------------------------------------------------------------------------------------------------

-- Adicionando Chaves Extrangeiras a tabela 
ALTER TABLE Cao
	add
		foreign key (CodRaca) references Raca(CodRaca);
ALTER TABLE Cao
	add        
		foreign key (CodCliente) references Cliente(CodCliente);
        
ALTER TABLE Cao
	add        
		foreign key (CodPai) references Cao(NumPedigre);
ALTER TABLE Cao
	add        
		foreign key (CodMae) references Cao(NumPedigre);

-- Criando tabela Relacionamento Cao Treinador
CREATE TABLE Cao_Treinador
(
	NumPedigre int NOT NULL,
	CodTreinador int NOT NULL,
	CodMencao int NOT NULL,
	Data_treino date,
	Primary Key(NumPedigre,CodTreinador, Data_treino)
);
-- Adicionando Chaves Extrangeiras a tabela Cao_Treinador
ALTER TABLE Cao_Treinador
	add
		foreign key (NumPedigre) references Cao(NumPedigre);
ALTER TABLE Cao_Treinador
	add        
		foreign key (CodTreinador) references Treinador(CodTreinador);
ALTER TABLE Cao_Treinador
	add        
		foreign key (CodMencao) references Mencao(CodMencao);

-- Criando tabela Relacionamento Cao X Vacina
CREATE TABLE Cao_Vacina
(
	NumPedigre int NOT NULL,
	CodVacina int NOT NULL,
	DataAplicacao varchar(50) NOT NULL,
	Primary Key(NumPedigre,CodVacina,DataAplicacao)
);
-- Adicionando Chaves Extrangeiras a tabela Cao_Treinador
ALTER TABLE Cao_Vacina
	add
		foreign key (NumPedigre) references Cao(NumPedigre);
ALTER TABLE Cao_Vacina
	add        
		foreign key (CodVacina) references Vacina(CodVacina);
		
-- Criando tabela Relacionamento Cao X Competicao
CREATE TABLE Cao_Competicao
(
	NumPedigre int NOT NULL,
	CodCompeticao int NOT NULL,
	Colocacao int NOT NULL,
	Primary Key(NumPedigre,CodCompeticao)
);
-- Adicionando Chaves Extrangeiras a tabela Cao_Competicao
ALTER TABLE Cao_Competicao
	add
		foreign key (NumPedigre) references Cao(NumPedigre);
ALTER TABLE Cao_Competicao
	add
		foreign key (CodCompeticao) references Competicao(CodCompeticao);
        
-- COMECANDO OS INSERTS NA TABELA RACA
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Rottweiler',119,20.45,778,'Nenhuma');
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Pastor Alemão',46,21.21,1315,'Nenhuma');
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Pastor Belga ',41,20.63,541,'Nenhuma');
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Pequinês',35,23.09,1447,'Nenhuma');
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Pitbull ',37,18.26,706,'Nenhuma');
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Boxer ',128,22.79,1498,'Nenhuma');
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Bulldog ',36,18.44,1161,'Nenhuma');
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Labrador Retriever',50,15.33,716,'Nenhuma');
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Chihuahua',16,19.62,843,'Nenhuma');
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Dálmata ',93,16.02,761,'Nenhuma');
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('São Bernardo',96,23.05,1479,'Nenhuma');
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Husky Siberiano',83,17.43,836,'Nenhuma');
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Dobermann ',129,17.15,1245,'Nenhuma');
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Dogue Alemão',32,17.34,534,'Nenhuma');
INSERT INTO Raca (NomeRaca,Tamanho,PesoMedio,ValorVenda,ObsGerais) VALUES ('Cocker Spaniel',68,17.77,888,'Nenhuma');
-- MOSTRANDO OS VALORES INSERIDOS
-- SELECT * FROM Raca;

-- COMECANDO OS INSERTS NA TABELA CLIENTE
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('CPF','67086283715','Ana','Rua do Pau Bandeira','3631-7127');
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','90096496644','Isabela','Rua Tapaxanas','3632-2815');
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','51100256383','Larissa','Rua Rock Estrela','3631-8673');
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','16478181066','Carolina','Rua Somos Todos Iguais','3632-8750');
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('CPF','10385619148','Letícia','Rua das Variações Musicais','3631-9827');
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','49590155452','Valentina','Rua Neve da Bahia','3631-7741');
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('CPF','66154314052','Yasmin','Rua Maravilha Tristeza','3631-9281');
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','94513198066','Guilherme','Rua dos Pensamentos Poéticos','3632-5420');
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','75654959387','Gustavo','Rua Borboletas Psicodélicas','3632-2004');
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','11087520369','Lucas','Rua na Paz do seu Sorriso','3632-4562');
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','80510590352','João','Rua Viola Enluarada','3632-5014');
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','21685526788','Enzo','Rua Minie','3632-9674');
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','80644900140','Gabriel','Rua Reinado do Cavalo Marinho','3631-9875');
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('CPF','34318832418','Vinícius','Rua Final Feliz','3632-8263');
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) VALUES ('RG','23125165907','Rodrigo','Rua da Música Aquática','3631-3163');
-- MOSTRANDO OS VALORES INSERIDOS
-- SELECT * FROM Cliente;

-- COMECANDO OS INSERTS NA TABELA CAO
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Nina','Afrodite','Tigrado',STR_TO_DATE('1-01-2012', '%d-%m-%Y'),1,12);
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Mel','Baixinha','Dourado', STR_TO_DATE('1-01-2012', '%d-%m-%Y'),1,15);
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Susi','Boneca','Despigmentado',STR_TO_DATE('1-01-2012', '%d-%m-%Y'),2,2);
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Princesa','Cacau','Tigrado',STR_TO_DATE('1-01-2012', '%d-%m-%Y'),2,5);
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Belinha','Baronesa','Preto',STR_TO_DATE('1-01-2012', '%d-%m-%Y'),3,10);
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Lola','Afrodite','Tricolor',STR_TO_DATE('1-01-2012', '%d-%m-%Y'),3,9);
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Pandora','Tigresa','Dourado',STR_TO_DATE('1-01-2012', '%d-%m-%Y'),4,13);
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente) VALUES ('Billy','Vilão','Dourado',STR_TO_DATE('1-01-2012', '%d-%m-%Y'),4,1);
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente,CodPai,CodMae) VALUES ('Thor','Rex','Tricolor',STR_TO_DATE('1-01-2012', '%d-%m-%Y'),1,7,1,2);
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente,CodPai,CodMae) VALUES ('Max','Falcão','Cinzento',STR_TO_DATE('1-01-2012', '%d-%m-%Y'),1,6,1,2);
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente,CodPai,CodMae) VALUES ('Bob','Byron','Albino',STR_TO_DATE('1-01-2012', '%d-%m-%Y'),2,7,3,4);
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente,CodPai,CodMae) VALUES ('Rex','Rabugento','Albino',STR_TO_DATE('1-01-2012', '%d-%m-%Y'),2,4,3,4);
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente,CodPai,CodMae) VALUES ('Marley','Duke','Chocolate',STR_TO_DATE('1-01-2012', '%d-%m-%Y'),3,5,5,6);
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente,CodPai,CodMae) VALUES ('Toby','Zeus','Albino',STR_TO_DATE('1-01-2012', '%d-%m-%Y'),3,10,5,6);
INSERT INTO Cao (NomeCao,Sobrenome,Cor_Conjunto_Cores,DataNascimento,CodRaca,CodCliente,CodPai,CodMae) VALUES ('Sansão','Monstro','Tricolor',STR_TO_DATE('1-01-2012', '%d-%m-%Y'),4,7,7,8);
-- MOSTRANDO OS VALORES INSERIDOS
-- SELECT * FROM Cao;

-- COMECANDO OS INSERTS NA TABELA Treinador
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Áquila','Phoc1','40028922');
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Witanauanh','Phoc2','40028923');
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Lucas','Phoc3','40028924');
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Leo','Phoc4','40028925');
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Marcelo','Phoc5','40028926');
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Deborah','Phoc6','40028927');
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Dynart','Phoc7','40028928');
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Felipe','Phoc8','40028929');
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Rainan','Phoc9','40028930');
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Abimael','Phoc10','40028931');
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Katarina','Phoc11','40028932');
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Darius','Phoc12','40028933');
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Lucio','Phoc13','40028934');
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Lulu','Phoc14','40028935');
INSERT INTO Treinador (NomeTreinador,EnderecoTreinador,TelefoneTreinador) VALUES ('Annie','Phoc15','40028936');
-- MOSTRANDO OS VALORES INSERIDOS
-- SELECT * FROM Treinador;

-- COMECANDO OS INSERTS NA TABELA Vacina
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hcv','seila');
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hiv','seila');
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Htlv','seila');
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Chagas','seila');
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite Z','seila');
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite Y','seila');
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite x','seila');
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite b','seila');
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite a','seila');
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite m','seila');
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite v','seila');
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite F','seila');
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite S','seila');
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite P','seila');
INSERT INTO Vacina (TipoVacina,DescVacina) VALUES ('Hepatite H','seila');
-- MOSTRANDO OS VALORES INSERIDOS
-- SELECT * FROM Vacina;

-- COMECANDO OS INSERTS NA TABELA Competicao
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Agility',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Flyball',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Canicross',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Dog Frisbee',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Correr',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Patinar',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Caminhar',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Pegar a bola',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Exposição de beleza',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Natação',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Canine Freestyle',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Game Dog',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Schutzhund',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Surf',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Competicao (DescCompeticao,DataCompeticao) VALUES ('Skateboarding Dog',STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
-- MOSTRANDO OS VALORES INSERIDOS
-- SELECT * FROM Competicao;

-- COMECANDO OS INSERTS NA TABELA Mencao
INSERT INTO Mencao (DescMencao) VALUES ('Fraco');
INSERT INTO Mencao (DescMencao) VALUES ('Regular');
INSERT INTO Mencao (DescMencao) VALUES ('Bom');
INSERT INTO Mencao (DescMencao) VALUES ('Ótimo');
-- MOSTRANDO OS VALORES INSERIDOS
-- SELECT * FROM Mencao;

-- COMECANDO OS INSERTS NA TABELA Cao_Treinador
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (10,11,3,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (7,4,1,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (6,2,1,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (14,13,2,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (7,9,3,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (9,7,4,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (15,13,1,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (6,5,4,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (13,12,3,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (12,13,2,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (2,13,2,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (3,9,2,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (1,7,4,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (11,3,1,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Treinador (NumPedigre,CodTreinador,CodMencao, Data_treino) VALUES (12,8,1,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
-- MOSTRANDO OS VALORES INSERIDOS
-- SELECT * FROM Cao_Treinador;

-- COMECANDO OS INSERTS NA TABELA Cao_Vacina
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (13,6,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (13,11,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (1,13,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (8,4,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
-- INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (7,14,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (15,2,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (8,3,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (2,4,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (14,6,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (11,13,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (13,10,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (7,14,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (9,7,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (14,15,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
INSERT INTO Cao_Vacina (NumPedigre,CodVacina,DataAplicacao) VALUES (2,14,STR_TO_DATE('1-01-2012', '%d-%m-%Y'));
-- MOSTRANDO OS VALORES INSERIDOS
-- SELECT * FROM Cao_Vacina;

-- COMECANDO OS INSERTS NA TABELA Cao_Competicao
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (15,1,4);
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (12,1,2);
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (13,3,2);
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (6,2,4);
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (11,2,1);
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (1,3,1);
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (2,9,2);
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (11,8,2);
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (3,2,2);
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (2,5,1);
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (9,8,1);
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (1,6,2);
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (11,7,1);
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (13,5,4);
INSERT INTO Cao_Competicao (NumPedigre,CodCompeticao,Colocacao) VALUES (6,3,3);
-- SELECT * FROM Cao_Competicao;

-- Junções:
-- HAVING
-- SELECT Cl.CodCliente, COUNT(Ca.NumPedigre) AS 'Qtde de cães' FROM Cliente Cl INNER JOIN Cao Ca ON Ca.CodCliente = Cl.CodCliente GROUP BY Cl.CodCliente HAVING COUNT(Ca.NumPedigre) > 1; -- Liste quantos clientes do Canil tem mais de um cão
SELECT C1.NumPedigre AS 'NumPedigre pai', C1.NomeCao AS 'Nome do pai', COUNT(C2.NumPedigre) AS 'Qtde de filhos' FROM Cao C1 INNER JOIN Cao C2 ON C1.NumPedigre = C2.CodPai GROUP BY C1.NumPedigre HAVING COUNT(C2.CodPai) > 1; -- Liste os cães machos que tem mais de um filho
-- SELECT C.CodRaca, R.NomeRaca, COUNT(C.NumPedigre) AS 'Qtde de cães' FROM Cao C INNER JOIN Raca R ON C.CodRaca = R.CodRaca GROUP BY C.CodRaca HAVING COUNT(C.NumPedigre) > 3; -- Liste as raças que tenham mais de três cães no canil

-- INNER JOIN
-- SELECT R.CodRaca, R.NomeRaca, C.NumPedigre, C.NomeCao FROM Raca R INNER JOIN Cao C ON R.CodRaca = C.CodRaca GROUP BY C.NumPedigre; -- Liste as raças com seus respectivos cães
-- SELECT R.CodRaca, R.NomeRaca, COUNT(C.NumPedigre) AS 'Qtde de cães' FROM Raca R INNER JOIN Cao C ON R.CodRaca = C.CodRaca GROUP BY R.CodRaca; -- Liste as raças e as quantidades de cães
-- SELECT R.CodRaca, R.NomeRaca, COUNT(C.NumPedigre) AS 'Qtde de cães' FROM Raca R INNER JOIN Cao C ON R.CodRaca = C.CodRaca GROUP BY R.CodRaca HAVING COUNT(C.NumPedigre) > 3; -- Liste as raças e as quantidades de cães, somente das raças que tiverem mais de 3 cães
-- SELECT C.NumPedigre, C.NomeCao, COUNT(CC.CodCompeticao) AS 'Qtde de competições' FROM Cao C INNER JOIN Cao_Competicao CC ON C.NumPedigre = CC.NumPedigre GROUP BY C.NumPedigre; -- Liste cada cão e o número de competições em que ele participou
-- SELECT C.NumPedigre, C.NomeCao, COUNT(CC.CodCompeticao) AS 'Qtde de competições' FROM Cao C INNER JOIN Cao_Competicao CC ON C.NumPedigre = CC.NumPedigre GROUP By C.NumPedigre HAVING COUNT(CC.NumPedigre) > 2; -- Liste cada cão e o número de competições em que ele participou, somente se forem mais de duas
SELECT T.CodTreinador, T.NomeTreinador, COUNT(C.NumPedigre) AS 'Qtde de cães treinados' FROM Treinador T INNER JOIN Cao_Treinador C ON T.CodTreinador = C.CodTreinador GROUP BY T.CodTreinador HAVING COUNT(C.NumPedigre) > 2; -- Liste todos os treinadores e o número de cães que eles treinaram, somente, se forem mais de dois cães
-- SELECT V.CodVacina, V.TipoVacina, COUNT(C.NumPedigre) AS 'Qtde de cães vacinados' FROM Vacina V INNER JOIN Cao_Vacina C ON V.CodVacina = C.CodVacina GROUP BY V.CodVacina HAVING COUNT(C.NumPedigre) > 3; -- Liste quantas vezes foi dada cada vacina, mas somente as que foram dadas mais de 3 vezes

-- LEFT OUTER JOIN 
-- SELECT Cl.CodCliente, Cl.NomeCLiente, COUNT(Ca.NumPedigre) AS 'Qtde de cães' FROM Cliente Cl LEFT OUTER JOIN Cao Ca ON Ca.CodCliente = Cl.CodCliente GROUP BY Cl.CodCliente; -- Liste quantos cães cada cliente tem, até os que tem zero cães
-- SELECT R.CodRaca, R.NomeRaca, COUNT(C.NumPedigre) AS 'Qtde de cães' FROM Raca R LEFT OUTER JOIN Cao C ON C.CodRaca = R.CodRaca GROUP BY R.CodRaca; -- Liste quantos cães cada raça tem, até as raças que não tem cães
-- SELECT T.CodTreinador, T.NomeTreinador, COUNT(C.NumPedigre) AS 'Qtde de treinos' FROM Treinador T LEFT OUTER JOIN Cao_Treinador C ON C.CodTreinador = T.CodTreinador GROUP BY T.CodTreinador; -- Liste o número de treinos que cada treinador fez, até os treinadores que tiveram zero treinos
SELECT V.CodVacina, V.TipoVacina, COUNT(C.NumPedigre) AS 'Qtde' FROM Vacina V LEFT OUTER JOIN Cao_Vacina C ON V.CodVacina = C.CodVacina GROUP BY V.CodVacina; -- Liste quantas vezes foi dada cada vacina, até as que não foram dadas

-- CROSS OUT JOIN
SELECT Cl.CodCliente, Cl.NomeCliente, Ca.NumPedigre, Ca.NomeCao FROM Cao Ca CROSS JOIN Cliente Cl ON Cl.CodCliente = Ca.CodCliente; -- Liste todos os possíveis cães e donos
-- SELECT R.CodRaca, R.NomeRaca, C.NumPedigre, C.NomeCao FROM Cao C CROSS JOIN Raca R ON C.CodRaca = R.CodRaca; -- Liste todas os possíveis cães e raças
-- SELECT C1.NumPedigre AS 'NumPedigre Pai', C1.NomeCao AS 'Nome Pai', C2.NumPedigre AS 'NumPedigre Filho', C2.NomeCao AS 'Nome Filho' FROM Cao C1 CROSS JOIN Cao C2 ON C2.CodPai = C1.NumPedigre; -- Liste todos os possíveis cães e pais
-- SELECT C1.NumPedigre AS 'NumPedigre Mãe', C1.NomeCao AS 'Nome Mãe', C2.NumPedigre AS 'NumPedigre Filho', C2.NomeCao AS 'Nome Filho' FROM Cao C1 CROSS JOIN Cao C2 ON C2.CodMae = C1.NumPedigre; -- Liste todos os possíveis cães e mães

-- Agrupamento:
-- SELECT C1.NumPedigre, C1.NomeCao, COUNT(C2.CodPai) AS 'Qtde de filhos' FROM Cao C1 INNER JOIN Cao C2 ON C1.NumPedigre = C2.CodPai GROUP BY C1.NumPedigre; -- Liste quantos filhos cada cão macho tem
-- SELECT C1.NumPedigre, C1.NomeCao, COUNT(C2.CodMae) AS 'Qtde de filhos' FROM Cao C1 INNER JOIN Cao C2 ON C1.NumPedigre = C2.CodMae GROUP BY C1.NumPedigre; -- Liste quantos filhos cada cão fêmea tem
SELECT Cl.CodCliente, Cl.NomeCliente, COUNT(Ca.NumPedigre) AS 'Qtde de cães' FROM Cliente Cl LEFT OUTER JOIN Cao Ca ON Ca.CodCliente = Cl.CodCliente GROUP BY Cl.CodCliente; -- Liste quantos cães cada cliente do Canil tem

-- SELECT Cl.CodCliente, Cl.NomeCliente, AVG(R.ValorVenda) AS 'Média do valor de venda dos cães' FROM Cao Ca LEFT OUTER JOIN Cliente Cl ON Cl.CodCliente = Ca.CodCliente LEFT OUTER JOIN Raca R ON R.CodRaca = Ca.CodRaca GROUP BY Cl.CodCliente; -- Liste qual a média do valor de venda dos cães de cada cliente

-- SELECT R.CodRaca, R.NomeRaca, COUNT(C.NumPedigre) AS 'Qtde de cães' FROM Raca R LEFT OUTER JOIN Cao C ON R.CodRaca = C.CodRaca GROUP BY R.CodRaca; -- Liste quantos cães de cada raça existem cadastrados no canil

-- SELECT R.CodRaca, R.NomeRaca, COUNT(Co.NumPedigre) AS 'Cães desta raça que participaram de competições' FROM Cao Ca INNER JOIN Cao_Competicao CO ON Co.NumPedigre = Ca.NumPedigre LEFT OUTER JOIN Raca R ON R.CodRaca = Ca.CodRaca GROUP BY R.CodRaca; -- Liste quantos cães de cada raça participaram das competições

-- SELECT V.CodVacina, V.TipoVacina, COUNT(C.NumPedigre) AS 'Qtde de vacinas aplicadas' FROM Cao_Vacina C INNER JOIN Vacina V ON V.CodVacina = C.CodVacina GROUP BY V.CodVacina; -- Liste as vacinas cadastradas que realmente foram aplicadas em cães e suas quantidades de aplicação
-- SELECT T.CodTreinador, T.NomeTreinador, COUNT(C.NumPedigre) AS 'Qtde de cães treinados' FROM Treinador T LEFT OUTER JOIN Cao_Treinador C ON T.CodTreinador = C.CodTreinador GROUP BY T.CodTreinador; -- Liste quantos cães cada treinador treinou

SELECT T.CodTreinador, T.NomeTreinador, COUNT(C.NumPedigre) AS 'Qtde de cães treinados', M.DescMencao FROM Cao_Treinador C INNER JOIN Mencao M ON M.CodMencao = C.CodMencao INNER JOIN Treinador T ON T.CodTreinador = C.CodTreinador GROUP BY T.CodTreinador, M.CodMencao; -- Liste quantos cães cada treinador treinou, agrupando também pelas menções que os cães receberam

-- SELECT C.NumPedigre, COUNT(V.CodVacina) AS 'Qtde de vacinas recebidas' FROM Cao C LEFT OUTER JOIN Cao_Vacina V ON V.NumPedigre = C.NumPedigre GROUP BY C.NumPedigre; -- Liste quantas vacinas cada cão tomou
SELECT M.CodMencao, M.DescMencao, COUNT(C.NumPedigre) AS 'Qtde de cães com esta menção' FROM Mencao M LEFT OUTER JOIN Cao_Treinador C ON C.CodMencao = M.CodMencao GROUP BY M.CodMencao; -- Liste o quantitativo para cada menção que foram dadas aos cães
-- SELECT R.CodRaca, R.NomeRaca, C.NumPedigre, C.NomeCao, R.PesoMedio FROM Cao C LEFT OUTER JOIN Raca R ON C.CodRaca = R.CodRaca GROUP BY C.NumPedigre; -- Liste o peso médio dos cães de cada raça

-- SELECT C.CodCliente, MAX(R.PesoMedio) AS 'Peso do maior cão' FROM Cao C INNER JOIN Raca R ON R.CodRaca = C.CodRaca GROUP BY C.CodCliente; -- Liste o cão de maior peso de cada cliente

-- SELECT Cl.CodCliente, Cl.NomeCliente, AVG(R.PesoMedio) AS 'Média do peso dos cães' FROM Cao Ca INNER JOIN Cliente Cl ON Cl.CodCliente = Ca.CodCliente INNER JOIN Raca R ON R.CodRaca = Ca.CodRaca GROUP BY Cl.CodCliente; -- Liste a média de peso dos cães de cada cliente

-- SELECT C.CodCliente, MAX(R.ValorVenda) AS 'Maior valor de venda' FROM Cao C INNER JOIN Raca R ON R.CodRaca = C.CodRaca GROUP BY C.CodCliente; -- Liste o cão de maior valor de venda de cada cliente
-- SELECT NumPedigre, MIN(Colocacao) AS 'Melhor colocação' FROM Cao_Competicao GROUP BY NumPedigre; -- Liste a melhor colocação de cada cão nas competiçõess
SELECT NumPedigre, MAX(Colocacao) AS 'Pior colocação' FROM Cao_Competicao GROUP BY NumPedigre; -- Liste a pior colocação de cada cão nas competições


-- Views:
-- 1º)
CREATE VIEW vw_resumo_treinador AS SELECT NomeTreinador, TelefoneTreinador FROM Treinador;
SELECT * from vw_resumo_treinador;

ALTER TABLE Treinador MODIFY EnderecoTreinador varchar(50) null;
INSERT INTO vw_resumo_treinador (NomeTreinador, TelefoneTreinador) VALUES ('João', '40028936'); 
SELECT * from vw_resumo_treinador;

ALTER VIEW vw_resumo_treinador AS SELECT CodTreinador, NomeTreinador, TelefoneTreinador FROM Treinador;
UPDATE vw_resumo_treinador SET TelefoneTreinador = '36234488' WHERE CodTreinador = 16;
SELECT * from vw_resumo_treinador;

-- 2°)
CREATE VIEW vw_resumo_cliente AS SELECT NomeCliente, TipoDocumento, NumDocumento, TelefoneCliente FROM Cliente;
SELECT * from vw_resumo_treinador;

ALTER TABLE Cliente MODIFY TelefoneCliente varchar(25) null;
INSERT INTO vw_resumo_cliente (NomeCliente, TipoDocumento, NumDocumento) VALUES ('José', 'RG', '23125165988'); 
SELECT * from vw_resumo_cliente;

ALTER VIEW vw_resumo_cliente AS SELECT CodCliente, NomeCliente, TipoDocumento, NumDocumento, TelefoneCliente FROM Cliente;
UPDATE vw_resumo_cliente SET TipoDocumento = 'CPF' WHERE CodCliente = 16;
UPDATE vw_resumo_cliente SET NumDocumento = '75654959499' WHERE CodCliente = 16;
SELECT * from vw_resumo_cliente;

-- 3°)
CREATE VIEW vw_quantos_caes AS SELECT Cl.CodCliente, Cl.NomeCliente, COUNT(Ca.NumPedigre) AS 'Qtde de cães' FROM Cliente Cl LEFT OUTER JOIN Cao Ca ON Ca.CodCliente = Cl.CodCliente GROUP BY Cl.CodCliente;
SELECT * from vw_quantos_caes;

UPDATE Cao SET CodCliente = 4 WHERE NumPedigre = 1;
SELECT * from vw_quantos_caes;


-- Stored Procedure 
-- 1) Listar
DELIMITER $$
CREATE PROCEDURE sp_LerTabelaCliente()
BEGIN
SELECT * FROM Cliente;
END; $$
DELIMITER ;
Drop procedure sp_LerTabelaCliente;

call sp_LerTabelaCliente();

-- 2) Consultar passando por parâmetro 

DELIMITER $$
CREATE PROCEDURE sp_ListaTabelaCliente_PorCodCliente(IN CodClienteEn int)
BEGIN
SELECT * FROM Cliente
WHERE CodCliente = CodClienteEn;
END; $$
DELIMITER ;
DROP PROCEDURE sp_ListaTabelaCliente_PorCodCliente;

CALL sp_ListaTabelaCliente_PorCodCliente(4);

-- 3) Inserir(inseção) por parâmetro
DELIMITER $$
CREATE PROCEDURE sp_InserindoCliente (IN TipoDocumentoEn VARCHAR (25),
IN NumDocumentoEn CHAR (11),
IN NomeClienteEn VARCHAR (50),
IN EnderecoClienteEn VARCHAR (50),
IN TelefoneClienteEn VARCHAR (25) )
BEGIN
INSERT INTO Cliente (TipoDocumento,NumDocumento,NomeCliente,EnderecoCliente,TelefoneCliente) 
VALUES (TipoDocumentoEn,NumDocumentoEn,NomeClienteEn,EnderecoClienteEn,TelefoneClienteEn);
END; $$
DELIMITER ;
DROP PROCEDURE sp_InserindoCliente;

CALL sp_InserindoCliente ("CPF",'92338147502',"Antonio Thiago Carlos Eduardo Campos","Rua Jardim das Laranjeiras",'3581-9682');

SELECT* FROM Cliente;

-- 4) Alterando com parâmetro 

DELIMITER $$
CREATE PROCEDURE sp_AlterandoCliente_PorCodCliente(IN CodClienteEn int, 
IN EnderecoClienteEn VARCHAR (50) )
BEGIN
UPDATE Cliente SET EnderecoCliente = EnderecoClienteEn WHERE CodCliente = CodClienteEn;
END; $$
DELIMITER ;
DROP PROCEDURE sp_AlterandoCliente_PorCodCliente;

CALL sp_AlterandoCliente_PorCodCliente(16,'Novo Endereço'); 


-- 5) Apagando com o parâmetro
DELIMITER $$
CREATE PROCEDURE sp_ApagarCliente_PorCodCliente (IN CodClienteEn int)
BEGIN
DELETE FROM Cliente
WHERE CodCliente = CodClienteEN;
END; $$
DELIMITER ;
DROP PROCEDURE sp_ApagarCliente_PorCodCliente;

CALL sp_ApagarCliente_PorCodCliente(16);
