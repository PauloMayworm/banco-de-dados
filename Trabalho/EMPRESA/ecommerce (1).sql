/* TRABALHO_LOGICO: */

CREATE TABLE produto (
    codigo_produto serial PRIMARY KEY,
    nome_produto varchar(15) NOT NULL,
    descricao TEXT,
    quantidade_estoque int,
    data_fabricacao DATE,
    valor_unitario NUMERIC,
    codigo_categoria serial,
    FOREIGN KEY (codigo_categoria)
    REFERENCES categoria_produto (codigo_categoria)
    ON UPDATE CASCADE ON DELETE CASCADE,
    codigo_funcionario serial,
	FOREIGN KEY (codigo_funcionario)
	REFERENCES funcionario (codigo_funcionario)
    ON UPDATE CASCADE ON DELETE CASCADE	);

CREATE TABLE cliente (
    codigo_cliente serial PRIMARY KEY,
    nome_cliente varchar(30) NOT NULL,
    nome_usuario varchar(15) NOT NULL UNIQUE,
    email_cliente varchar(20) NOT NULL UNIQUE,
    cpf_cliente char(11) NOT NULL UNIQUE,
    data_nascimento_cliente DATE NOT NULL,
    pais varchar(20) NOT NULL,
    uf char(2) NOT NULL,
    cidade varchar(20) NOT NULL,
    bairro varchar(20) NOT NULL,
    rua varchar(20) NOT NULL,
    complemento varchar(20) NOT NULL
);

CREATE TABLE categoria_produto(
    codigo_categoria serial PRIMARY KEY,
    nome_categoria varchar(15) NOT NULL UNIQUE,
    descricao_categoria TEXT
);

CREATE TABLE pedido (
    codigo_pedido serial PRIMARY KEY,
    data_pedido DATE,
    status varchar(10),
    codigo_cliente serial,
	FOREIGN KEY (codigo_cliente)
    REFERENCES cliente (codigo_cliente)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE funcionario (
    codigo_funcionario serial PRIMARY KEY,
    cpf_funcionario char(11) NOT NULL UNIQUE,
    nome_funcionario varchar(30)
);

CREATE TABLE itens_pedido (
    codigo_produto_pedido serial PRIMARY KEY,
	quantidade int,
    valor_venda NUMERIC,
    desconto NUMERIC,
    codigo_pedido serial,
	FOREIGN KEY (codigo_pedido)
    REFERENCES pedido (codigo_pedido)
    ON UPDATE CASCADE ON DELETE CASCADE,
    codigo_produto serial,
	FOREIGN KEY (codigo_produto)
    REFERENCES produto (codigo_produto)
    ON UPDATE CASCADE ON DELETE CASCADE
);



ALTER TABLE categoria_produto
ALTER COLUMN nome_categoria TYPE varchar(30);

INSERT INTO categoria_produto (nome_categoria, descricao_categoria)
VALUES('Eletrodomésticos', 'Eletrodomésticos');

INSERT INTO categoria_produto (nome_categoria, descricao_categoria)
VALUES('Eletrônicos', 'Eletrônicos');

INSERT INTO categoria_produto (nome_categoria, descricao_categoria)
VALUES('Móveis', 'Móveis');

INSERT INTO categoria_produto (nome_categoria, descricao_categoria)
VALUES('Pet', 'Pet');

INSERT INTO categoria_produto (nome_categoria, descricao_categoria)
VALUES('Decoração', 'Decoração');





INSERT INTO funcionario (cpf_funcionario, nome_funcionario)
VALUES('11111111111', 'João');

INSERT INTO funcionario (cpf_funcionario, nome_funcionario)
VALUES('21111111111', 'Clarissa');

INSERT INTO funcionario (cpf_funcionario, nome_funcionario)
VALUES('31111111111', 'Gisele');

INSERT INTO funcionario (cpf_funcionario, nome_funcionario)
VALUES('41111111111', 'Paulo');

INSERT INTO funcionario (cpf_funcionario, nome_funcionario)
VALUES('51111111111', 'Lucas');

INSERT INTO funcionario (cpf_funcionario, nome_funcionario)
VALUES('61111111111', 'Pedro');


INSERT INTO produto (nome_produto, 
					 descricao, 
					 quantidade_estoque, 
					 data_fabricacao, 
					 valor_unitario, 
					 codigo_categoria, 
					 codigo_funcionario)

VALUES('Fogão', 
	   'Acende, serve para
	   cozinhar, a gás, 6 
	   bocas', 10, '20200513', 1500.0, 1, 1);








 