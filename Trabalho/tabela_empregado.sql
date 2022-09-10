create table empregado (id_empregado serial primary key,
					   nome varchar(50)not null,
					   email varchar (40)not null unique,
					   cargo varchar (50),
					   salario numeric);
INSERT INTO empregado (nome,email,cargo,salario) 
values ('Adriana','ciclano@teste.com', 'Programador',5000);

INSERT INTO empregado (nome,email,cargo,salario)
values ('Antonio','silva@gmail.com', 'Analista de Sistemas',6500);

create table empregado_log (id_empregado_log serial primary key,
						id_empregado int,						
						nome varchar(50),
						email varchar(40),
						cargo varchar(50),
						salario numeric,
						data_modificacao timestamp,
						acao varchar(20));
						
create or replace FUNCTION empregado_log_fun()
returns trigger as $$
BEGIN
     insert into empregado_log(id_empregado, nome, salario, data_modificacao, acao)
          values(new.id_empregado, new.nome, new.salario, now(),'update');
return new;
end;
$$
language 'plpgsql';

create TRIGGER empregado_trigger_log
after UPDATE
on empregado
for each row
execute procedure empregado_log_fun();

update empregado set nome = 'Ana Luiza', salario=6800 where id_empregado=1;
						
select * from empregado;						

create or replace FUNCTION empregado_log_fun_delete()
returns trigger as $$
BEGIN
     insert into empregado_log(id_empregado, nome, salario, data_modificacao, acao)
          values(old.id_empregado, old.nome, old.salario, now(),'delete');
return new;
end;
$$
language 'plpgsql';

create TRIGGER empregado_trigger_log_delete
after DELETE
on empregado
for each row
execute procedure empregado_log_fun_delete();

delete from empregado where id_empregado =1;
select * from empregado_log;
