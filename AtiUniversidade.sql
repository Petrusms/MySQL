drop database universidade;
create database universidade;
use universidade;

create table professor(
	cod_pro int primary key,
    nome varchar(40) not null,
    area varchar(50) not null,
	cpf char(11),
	datanasc date not null
);

create table disciplina(
	cod_disc int primary key,
    nome varchar(25) not null,
    CH time not null
);

create table ministra(
	cod_pro int not null,
    cod_disc int not null,
    primary key(cod_pro, cod_dic),
    foreign key(cod_pro) references professor(cod_pro),
    foreign key(cod_disc) references disciplina(cod_disc)
);

show databases;
