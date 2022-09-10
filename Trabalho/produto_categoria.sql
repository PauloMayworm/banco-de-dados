CREATE TABLE producao.categoria (codigo_categoria serial PRIMARY KEY, descricao VARCHAR(30));

CREATE TABLE producao.produto(codigo_produto serial PRIMARY KEY, nome VARCHAR(40) NOT NULL UNIQUE,
					descricao TEXT, preco NUMERIC CHECK(preco > 0) NOT NULL,
					quantidade_estoque SMALLINT DEFAULT 0,
					codigo_categoria int, FOREIGN KEY (codigo_categoria) REFERENCES producao.categoria (codigo_categoria));
					
INSERT INTO producao.categoria (descricao) VALUES('Remédio');					
INSERT INTO producao.categoria (descricao) VALUES('Alimentos');
INSERT INTO producao.PRODUTO (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Arroz','Tio João',7.5,40,2);
INSERT INTO producao.PRODUTO (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Feijão','Carreteiro',8.5,30,2);
INSERT INTO producao.PRODUTO (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Feijão Fradinho','Granfino',8.5,30,2);
INSERT INTO producao.PRODUTO (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Macarrão','Adria',6.65,10,2);
INSERT INTO producao.PRODUTO (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Farinha de Trigo','Boa Sorte',2.5,8,2);
INSERT INTO producao.PRODUTO (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Sal','Cisne',2.5,100,2);
INSERT INTO producao.PRODUTO (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Atum','Gomes da Costa',6.8,42,2);
INSERT INTO producao.PRODUTO (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Leite Condensado','Nestle',5.9,40,2);
INSERT INTO producao.PRODUTO (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Creme de Leite','Pirancajuba',2.8,15,2);
INSERT INTO producao.PRODUTO (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Arroz Integral','Carreteiro',7.5,4,2);
INSERT INTO producao.PRODUTO (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Neosoro','EMS',17.5,4,1);

SELECT * FROM producao.PRODUTO;

SELECT descricao, SUM(quantidade_estoque)FROM producao.PRODUTO GROUP BY descricao ORDER BY descricao;

SELECT descricao, COUNT(quantidade_estoque)FROM producao.PRODUTO GROUP BY descricao 
HAVING descricao='Carreteiro' ORDER BY descricao;

INSERT INTO producao.categoria (descricao) VALUES('Roupas');					
INSERT INTO producao.categoria (descricao) VALUES('Eletrônicos');
INSERT INTO producao.produto (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Creme de Leite Fresco','Itambé',2.8,25,null);
INSERT INTO producao.produto (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Arroz Arbóreo','Princesa',6.5,44,null);
INSERT INTO producao.produto (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Colírio','EMS',22.5,30,null);

--JOIN
SELECT p.nome,p.descricao,p.preco,c.descricao FROM producao.categoria AS c, producao.produto AS p
WHERE p.codigo_categoria = c.codigo_categoria;

SELECT p.nome,p.descricao,p.preco,c.descricao FROM producao.categoria AS c LEFT JOIN producao.produto p 
on c. codigo_categoria = p.codigo_categoria;

SELECT p.nome,p.descricao,p.preco,c.descricao FROM producao.categoria AS c RIGHT JOIN producao.produto p 
on c. codigo_categoria = p.codigo_categoria;

SELECT p.nome,p.descricao,p.preco,c.descricao FROM producao.categoria AS c INNER JOIN producao.produto p 
on c. codigo_categoria = p.codigo_categoria;

SELECT p.nome,p.descricao,p.preco,c.descricao FROM producao.categoria AS c FULL JOIN producao.produto p 
on c. codigo_categoria = p.codigo_categoria;

CREATE VIEW producao.view_listar_produtos AS SELECT * FROM producao.produto;

CREATE VIEW producao.view_full_join AS SELECT p.nome,p.preco,c.descricao FROM producao.categoria c FULL JOIN producao.produto p
on c.codigo_categoria = p.codigo_categoria;

SELECT * FROM producao.view_full_join;

