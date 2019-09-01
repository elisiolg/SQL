

create table Postal(Codigo Numeric(4) Primary key,
						Localidade Char(39) Not Null);

create table Pessoa(Id Numeric primary key,
					Nome char(30) not null,
					Idade Integer not null check (Idade Between 0 and 150),
					Salario Numeric (10,2) not null constraint SALARIO_POSITIVO CHECK (Salario>0),
					Telefone Char(12) null,
					Cod_postal Numeric(4),
					foreign key (Cod_postal) references postal(Codigo) );


 Create table Mensagem (Id_msg numeric Primary Key,
						Mensagem Char(30) not null);

--drop table Mensagem;

Create table Comissao (Id Numeric not Null, 
					  Id_Msg Numeric not null,			
					  Valor numeric not null );

insert into Comissao values (14, 10, 10500), (25,10,2500),
(14,100,3750),(14,70,400),(37,40,20),(37, 30, 14230),(37,10,5500),
(14,60,2600),(25,30,370),(42,20,20), (37,50,120),(42,30, 170),(49,20,2300);


INSERT INTO Postal VALUES (1000,'LISBOA');
INSERT INTO Postal VALUES (1100,'LISBOA');
INSERT INTO Postal VALUES (1200,'LISBOA');
INSERT INTO Postal VALUES (1500,'LISBOA');
INSERT INTO Postal VALUES (2000,'SANTAREM');
INSERT INTO Postal VALUES (2300,'TOMAR');
INSERT INTO Postal VALUES (3000,'COIMBRA');
INSERT INTO Postal VALUES (4000,'PORTO');
INSERT INTO Postal VALUES (9000,'FUNCHAL');


INSERT INTO Pessoa VALUES (5,'Célia Morais',26,'170000.00','123456','1100');
INSERT INTO Pessoa VALUES (14,'Nascimento Augusto',35,'220000.00','456123','2300');
INSERT INTO Pessoa VALUES (25,'Paulo Viegas',32,'95000.00','NULL','1500');
INSERT INTO Pessoa VALUES (32,'Florinda Simões',35,'147000.00','NULL','4000');
INSERT INTO Pessoa VALUES (37,'Isabel Espada',28,'86000.00','NULL','1100');
INSERT INTO Pessoa VALUES (42,'António Dias',43,'74000.00','789654','1500');
INSERT INTO Pessoa VALUES (49,'José António',17,'210000.00','NULL','1500');

--INSERT INTO Comissao VALUES (14,10,10500);
--INSERT INTO Comissao VALUES (25,10,2500);
--INSERT INTO Comissao VALUES (14,100,3750);
--INSERT INTO Comissao VALUES (14,70,400);
--INSERT INTO Comissao VALUES (37,40,20);
--INSERT INTO Comissao VALUES (37,30,14230);
--INSERT INTO Comissao VALUES (37,10,5500);
--INSERT INTO Comissao VALUES (14,60,2600);
--INSERT INTO Comissao VALUES (25,30,370);
--INSERT INTO Comissao VALUES (42,20,20);
--INSERT INTO Comissao VALUES (37,50,120);
--INSERT INTO Comissao VALUES (42,30,170);
--INSERT INTO Comissao VALUES (49,20,2300);



INSERT INTO Mensagem VALUES (70,'Combustíveis');
INSERT INTO Mensagem VALUES (10,'Comissão de Vendas');
INSERT INTO Mensagem VALUES (50,'Deslocações');
INSERT INTO Mensagem VALUES (30,'Fretes Empresas');
INSERT INTO Mensagem VALUES (20,'Fretes Individuais');
INSERT INTO Mensagem VALUES (100,'Ofertas');
INSERT INTO Mensagem VALUES (60,'Refeições');
INSERT INTO Mensagem VALUES (90,'Telefonemas');
INSERT INTO Mensagem VALUES (80,'Transportes');
INSERT INTO Mensagem VALUES (40,'Vendas Extras');


--1) Todos os registos da tabela postal


select *
from Postal



--2) Seleccior o Id, Nome e Salário de todas as pessoas com
--idade para votar

select id, nome, salario
from pessoa
where idade >= 18;


--3) Seleccionar todas as pessoas com idade igual a 35
select id , nome, salario
from pessoa
where idade = 35;

--4) 
select Mensagem
from Mensagem
where id_msg <> 20;

--5) listar todas as localidade sem repetições
select distinct localidade
from postal


--6)

select id_msg, mensagem from mensagem
union
select codigo, localidade from postal


--7)
select * from postal where codigo <= 5000
intersect 
select * from postal where codigo >=3000

--8)
select * from postal where codigo <= 5000
except 
select * from postal where codigo between 2000 and 3000

select * from postal where codigo <= 5000
except 
select * from postal where (codigo>= 2000 and codigo<=3000)


--9)
select count(*) as Total
from pessoa

--10)  
select count(*) as Total
from pessoa 
where Telefone is null


--11)
select count(telefone)
from Pessoa

--12)
select sum(valor)
from Comissao

--13)
select avg(salario)
from Pessoa
where idade>30

--14)
select id, sum(valor) as Toatl
from comissao 
group by id

--15)
select id, sum(valor) as Total
from comissao 
group by id
having sum(valor) > 1000


--16)

select *
from Pessoa
where cod_postal = (select max(cod_postal) from Pessoa);


--17)
select *
from Pessoa
where salario = (select max(salario) from Pessoa);

--18)

select nome, salario
from Pessoa p     
where salario < (select sum(valor) from Comissao c where p.id = c.id)*15; 








