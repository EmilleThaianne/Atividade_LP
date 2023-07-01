DROP DATABASE IF EXISTS Produto;
CREATE DATABASE Produto;
USE Produto;

CREATE TABLE tb_produto (
cod_produto INT AUTO_INCREMENT PRIMARY KEY,
nome_produto VARCHAR(50) NOT NULL,
qtd_estoque INT NOT NULL
);

CREATE TABLE tb_venda (
cod_venda INT AUTO_INCREMENT PRIMARY KEY,
cod_vendedor INT NOT NULL,
data_venda date
);

CREATE TABLE tb_item_venda (
cod_venda INT NOT NULL,
cod_produto INT NOT NULL,
qtd_vendida INT NOT NULL,
PRIMARY KEY (cod_venda, cod_produto)
);

ALTER TABLE tb_item_venda
ADD CONSTRAINT pk_tb_item_venda_cod_venda
FOREIGN KEY (cod_venda) REFERENCES tb_venda(cod_venda);

ALTER TABLE tb_item_venda
ADD CONSTRAINT pk_tb_item_venda_cod_produto
FOREIGN KEY (cod_produto) REFERENCES tb_produto(cod_produto);

INSERT INTO tb_produto () VALUES ();