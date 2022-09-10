create table marca (cod_marca serial primary key, nome varchar(30));
insert into marca (nome) values('Hyunday');
insert into marca (nome) values('Ford');
insert into marca (nome) values('Renault');
insert into marca (nome) values('Nissan');
insert into marca (nome) values('Kia');
insert into marca (nome) values('Fiat');
insert into marca (nome) values('VW');

create table modelo (cod_modelo serial primary key, descricao varchar(40),
preco numeric, cod_marca int,
foreign key (cod_marca) references marca(cod_marca) on update cascade on delete cascade);

insert into modelo (descricao,preco,cod_marca) values('Gol',30000,7);
insert into modelo (descricao,preco,cod_marca) values('HB20',32000,1);
insert into modelo (descricao,preco,cod_marca) values('HB20S',45000,1);
insert into modelo (descricao,preco,cod_marca) values('Cerato',35600,5);
insert into modelo (descricao,preco,cod_marca) values('Ka',23500,2);
insert into modelo (descricao,preco,cod_marca) values('EcoEsporte',55000,2);
insert into modelo (descricao,preco,cod_marca) values('Siena',40000,6);
select * from modelo;

select mo.descricao,mo.preco,ma.nome from modelo mo, marca ma
where mo.cod_marca = ma.cod_marca;

select round(avg(preco),2) media from modelo;
--modelos que estão com o preço acima
select m.descricao, m.preco from modelo m 
where preco>(select  ROUND(AVG(preco),2) Media from modelo);
--modelos que estão com o preço abaixo
select m.descricao, m.preco from modelo m 
where preco<(select  ROUND(AVG(preco),2) Media from modelo);
-- fazer agrupamento por cod_marca e exibir o carro com menor valor
select cod_marca, min (preco) from modelo group by cod_marca;
-- todos os modelos com preço acima de 25000
select cod_marca, min (preco) from modelo group by cod_marca
having min (preco) > 25000;

select * from marca;
select * from modelo;

--retornar todos as marcas que não tem modelos cadastrados
select * from marca where exists( 
select * from modelo where modelo.cod_marca = marca.cod_marca);

