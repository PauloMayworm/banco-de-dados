CREATE TABLE setor(codigo_setor SERIAL PRIMARY KEY, nome varchar(20) NOT NULL UNIQUE);

CREATE TABLE empregado(matricula int  PRIMARY KEY, nome VARCHAR(40) NOT NULL,
					 email VARCHAR(30) UNIQUE, codigo_setor int, 
					 FOREIGN KEY (codigo_setor) REFERENCES setor(codigo_setor) ON UPDATE CASCADE ON DELETE NO ACTION);
					 
INSERT INTO setor (nome) VALUES ('RH');
INSERT INTO setor (nome) VALUES('CPD');
INSERT INTO setor (nome) VALUES('COMPRAS');

INSERT INTO empregado (matricula, nome, email, codigo_setor) VALUES(123,'JOÃO DA SILVA','joao@gmail.com',1);
INSERT INTO empregado (matricula, nome, email, codigo_setor) VALUES(1234,'ANA DA SILVA','ana@gmail.com',2);
UPDATE setor SET codigo_setor=100 WHERE codigo_setor=1;
DELETE FROM setor WHERE codigo_setor=100;

SELECT * FROM setor;
SELECT * FROM empregado;

CREATE TABLE agencia(numero_banco int PRIMARY KEY,
					 numero_agencia int NOT NULL,
					 nome VARCHAR(40) NOT NULL);


CREATE TABLE conta(numero_conta int PRIMARY KEY,
				  saldo NUMERIC,
				  titular VARCHAR(40) NOT NULL,
				  numero_banco int,
				  FOREIGN KEY (numero_banco) REFERENCES agencia(numero_banco) ON UPDATE CASCADE ON DELETE CASCADE);
				  
INSERT INTO agencia (numero_banco,numero_agencia, nome) VALUES (4545,123,'ITAU');
INSERT INTO agencia (numero_banco,numero_agencia, nome) VALUES (9999,456,'BRADESCO');
INSERT INTO agencia (numero_banco,numero_agencia, nome) VALUES (8888,789,'NUBANK');

INSERT INTO conta(numero_conta, saldo, titular, numero_banco) VALUES (123, 321,'gabriel',4545);
INSERT INTO conta(numero_conta, saldo, titular, numero_banco) VALUES (1234, 3221,'ana',9999);

DELETE FROM agencia WHERE numero_banco = 4545;

SELECT * FROM conta;
SELECT * FROM conta;
SELECT * FROM agencia  ORDER BY numero_banco DESC LIMIT 3;
SELECT * FROM agencia;


INSERT INTO agencia (numero_banco,numero_agencia, nome) VALUES (45451,123,'BANCO DO BRASIL');
INSERT INTO agencia (numero_banco,numero_agencia, nome) VALUES (99992,456,'CAIXA');
INSERT INTO agencia (numero_banco,numero_agencia, nome) VALUES (88848,789,'SANTANDER');


SELECT * FROM agencia WHERE nome ILIKE 'R%'
select * from conta;
select * from agencia where saldo between 320 and 600;

--join
SELECT c.titular,c.saldo,c.numero_conta, a.nome FROM conta AS c, agencia AS a
WHERE c.numero_banco = a.numero_banco ORDER BY a.nome DESC;

INSERT INTO conta (numero_conta, saldo, titular,numero_banco) VALUES (202020,1000,'ANTÔNIO',8888);
INSERT INTO conta (numero_conta, saldo, titular,numero_banco) VALUES (202021,2000,'JORGE',9999);

BEGIN;
	UPDATE conta SET saldo=saldo-100 WHERE numero_conta=202020;
	UPDATE conta SET saldo=saldo+100 WHERE numero_conta=202021;
ROLLBACK;

BEGIN;
	UPDATE conta SET saldo=saldo-100 WHERE numero_conta=202020;
	UPDATE conta SET saldo=saldo+100 WHERE numero_conta=202021;
COMMIT;
SELECT * FROM conta;

SELECT COUNT (*) fROM conta;
INSERT INTO conta (numero_conta, titular,numero_banco) VALUES (202023,'MARIA',8888);

SELECT ROUND(AVG(saldo),2) AS MEDIA FROM conta;
