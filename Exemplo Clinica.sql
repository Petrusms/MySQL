drop database clinica;
create database clinica;
use clinica;

create table medico(
	codmed int primary key,
	nomemed varchar(40) not null,
	datanasc date not null,
	cpf char(11),
	cidade varchar(30) not null,
	especialidade varchar(50) not null
);

create table paciente(
	codpac int primary key,
	nomepac varchar(40) not null,
	datanasc date not null,
	cpf char(11),
	cidade varchar(30) not null
);

create table consulta(
	codmed int not null,
    codpac int not null,
    data_consulta date not null,
    hora time not null,
    primary key(codmed, codpac),
    foreign key(codmed) references medico(codmed),
    foreign key(codpac) references paciente(codpac)
);
use clinica;
show databases;

insert into medico
values(1,'João','1984/06/28','10000100000','Florianopolis','Ortopedia');
insert into medico
values(2,'Maria','1970/07/13','11100100000','Blumenau','Traumotologia');
insert into medico
values(3,'Pedro','1956/11/25','10001101000','Porto Velho','Pediatria');
insert into medico
values(4,'Carlos','1985/02/07','1111010000','Joinville','Ortopedia');
insert into medico
values(5,'Marcia','1945/08/15','1011010000','Fortaleza','Neurologia');
insert into medico
values(6,'Luciana','1975/04/25','010010111','Rio Branco','Ortopedia');

describe medico;
select *from medico;

insert into paciente
values(1,'Ana','1978/09/13','2201005000','Florianopolis');
insert into paciente
values(2,'Paulo','1940/03/17','2201005001','Porto Velho');
insert into paciente
values(3,'Lucia','1957/06/24','2201005002','Blumenau');
insert into paciente
values(4,'Carlos','2001/10/08','2201005003','Joinville');
insert into paciente
values(5,'Luiz','2000/08/14','2201005004','Fortaleza');
insert into paciente
values(6,'Mauricio','1980/01/01','2201005005','Rio Branco');

describe paciente;
select *from paciente;

insert consulta
values(1,1,'2021/05/12','14:00');
insert consulta
values(1,6,'2021/05/23','15:00');
insert consulta
values(2,2,'2021/11/12','13:00');
insert consulta
values(3,3,'2021/05/12','11:00');
insert consulta
values(4,4,'2021/05/13','10:00');
insert consulta
values(5,5,'2021/05/23','10:30');
insert consulta
values(6,4,'2021/05/23','10:00');
insert consulta
values(6,6,'2021/05/23','10:40');

describe consulta;
select *from consulta;

