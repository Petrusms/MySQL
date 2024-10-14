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

describe medico;
select *from medico;
