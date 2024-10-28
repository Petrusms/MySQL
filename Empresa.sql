create database Empresa;
use Empresa;

create table Departamento (
	codigo_dept int primary key,
    descricao varchar(100) not null
);
create table Funcionario (
	codigo_func int primary key,
	nome varchar(100) not null,
    endereco varchar(50),
    telefone varchar(15),
    cod_departamento int,
    foreign key(cod_departamento)
    references Departamento(codigo_dept)
);
create table Dependentes (
	codigo_depen int primary key,
    cod_func int,
    nome varchar(100) not null,
    data_nasc date,
    foreign key(cod_func)
    references Funcionario(codigo_func)
);

desc Departamento;
desc Funcionario;
desc Dependentes;

alter table Dependentes
add column profissao varchar(50);

alter table Funcionario
add column data_nasc date;

alter table Departamento
modify column descricao char(50);

alter table Dependentes
add column teste varchar(100);

alter table Dependentes
drop column teste;

insert into Departamento values
(1, 'Recursos Humanos'),
(2, 'Tecnologia da Informação'),
(3, 'Financeira');

insert into Funcionario values
(1, 'João Silva','Rua A 123','99999-1111',1,'1985-01-15'),
(2, 'Maria Oliveira','Rua B 456','99999-2222',2,'1990-05-22'),
(3, 'Carlos Souza','Rua C 789','99999-3333',3,'1978-09-10');

insert into Dependentes values
(1,1,'Ana Silva','2010-02-20'),
(2,2,'Pedro Oliveira','2012-08-14'),
(3,3,'Lucas Souza','2015-11-30');
