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
 