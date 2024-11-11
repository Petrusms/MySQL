/*Organiza por ordem alfabetica*/
select * from cursos order by nome;

/*Organiza por ordem alfabetica invertida*/
select * from cursos order by nome desc;

/*Para filtrar é so tirar o * e botar o nome da coluna que desejar*/
/*Filtra as colunas do curso para apenas nome, carga, ano*/
select nome,carga,ano from cursos;

/*Organiza ano em ordem crescente e dpois o nome por ordem alfabetica*/
select nome,carga,ano from cursos order by ano,nome;

/*Filtrar linhas e organiza em ordem alfabetica*/
select nome, descrição, carga from cursos
where ano = '2016'
order by nome;
/*Outro exemplos com outros operadores*/
select nome, descrição, ano, carga from cursos
where ano <= 2015
order by nome, ano;

select nome, descrição, ano, carga from cursos
where ano !=/*ou <>*/ 2015
order by nome, ano;

/* Between é uma faixa/intervalo de valores*/
select nome, ano from cursos
where ano between 2010 and 2018
order by ano desc, ano asc;

/*O in é para valores especificos*/
select nome, descrição, ano from cursos
where ano in (2014, 2018)
order by ano desc, ano asc;

select * from cursos
where carga > 25 or totalaulas <= 30
order by nome;

/*Selecionas todos os cursos que inicia com a letra P*/
select * from cursos
where nome like 'P%';

/*Outros exemplos*/
select * from cursos
where nome like '%a%';

select * from cursos
where nome not like '%a%';

/*Pode tambem usar _ só que tem que ter um caracter depois*/
select * from cursos
where nome like 'a_%';

/*Para listar algo usa distinct*/
select distinct nacionalidade from gafanhotos;

/*Mostra/Contabiliza a quantidade que tem dentro de cursos em nome*/
select count(nome) from cursos;

/*Mostra a maior e menor carga dentro de cursos em carga ou de outros atributos*/
select max(carga) from cursos;
select max(totalaulas) from cursos;
select min(carga) from cursos;

/*Sum soma todas as cargas dentro de cursos em carga ou de outros atributos*/
select sum(carga) from cursos;
select sum(totalaulas) from cursos;

/*AVG faz a media desses atributos*/
select avg(carga) from cursos;
select avg(totalaulas) from cursos;

/*Exercicio 1*/
select * from gafanhotos
where nascimento between 1984/01/02 and 1999/08/01;

select * from gafanhotos
where nascimento in ('1999/08/01');

/*Exercicio 2*/
select * from gafanhotos
where sexo = 'M';

select * from gafanhotos;
select * from cursos;
