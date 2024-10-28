use clinica;
desc medico;
select * from medico;
select * from paciente;
select * from consulta;

alter table medico add crm int; 
alter table medico drop crm;
alter table medico change cidade cidadeNasc varchar(20);
alter table medico modify cpf varchar(20);

update medico
set especialidade = "Dermatologia"
where nomemed = "Pedro";

delete from consulta where codpac = 3;
delete from paciente where nomepac = "Lucia";
