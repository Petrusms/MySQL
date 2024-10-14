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
values(5,'Marcia','1945/08/15','1011010000','Fortaleza','Ortopedia');
insert into medico
values(6,'Luciana','1975/04/25','010010111','Rio Branco','Ortopedia');

describe medico;
select *from medico;
