/*1)C-INSERT*/
/*2)d-UPDATE*/
/*3)a-CREATE TABLE*/
/*4)a-Somente registros específicos com condição de exclusão*/
/*5)c-Remove todos os registros, mas mantém a estrutura da tabela*/
/*6)b-ALTER TABLE*/
/*7)c-ALTER TABLE*/
/*8)b-DROP TABLE*/
/*9)a-SELECT * FROM clientes*/
/*10)a-Adicionar um novo registro com valores para as colunas especificadas.*/
/*11)c-TRUNCATE*/
/*12)a-ALTER TABLE*/
/*13)a-ALTER TABLE pedidos RENAME TO pedidos_venda*/
/*14)a-CREATE DATABASE*/
/*15)a-ALTER TABLE tabela DROP COLUMN coluna*/
/*16)a-WHERE*/
/*17)c-UPDATE*/
/*18)a-INSERT DEFAULT*/
/*19)c-Alterar a estrutura adicionando regras.*/
/*20)a-SELECT DISTINCT coluna FROM tabela*/
/*21)e-INSERT INTO SELECT*/
/*22)d-SELECT Funcionarios.nome FROM Funcionarios JOIN Dependentes
ON Funcionarios.id = Dependentes.funcionario_id WHERE
Funcionarios.salario > 3000 AND Funcionarios.cidade =
'Bragança' AND Funcionarios.estado = 'SP';*/
/*23)a-SQL*/
/*24)d-VARCHAR (tamanho): sequência de caracteres de tamanho variável.
Os espaços não ocupados pelo texto não são armazenados, são
ignorados, com capacidade para armazenar de 1 a 255 caracteres.*/
/*25)a-drop table questoes.*/
/*26)*/

create database Empresa;
use Empresa;

create table Funcionarios (
Codigo int primary key, 
PrimeiroNome varchar(20), 
SegundoNome varchar(20), 
UltimoNome varchar(20), 
DataNasci date not null,
CPF char(11) not null, 
RG char(9 not null,
Endereco varchar(50) not null, 
CEP char(8) not null, 
Cidade varchar(30), 
Fone varchar(15) not null, 
CodigoDepartamento int,
foreign key(CodigoDepartamento)
references Departamentos(Codigo),
Funcao varchar(20) not null, 
Salario decimal(10,2) not null
);

create table Departamentos (
Codigo int primary key, 
Nome varchar(20), 
Localizacao varchar(50) not null, 
CodigoFuncionarioGerente int,
foreign key(CodigoFuncionarioGerente)
references Funcionarios(Codigo)
);

/* a) Listar nome e sobrenome ordenado por sobrenome */
SELECT PrimeiroNome, UltimoNome FROM Funcionarios  ORDER BY UltimoNome;

/* b) Listar todos os campos de funcionários ordenados por cidade */
SELECT * FROM Funcionarios ORDER BY Cidade;

/* c) Liste os funcionários que têm salário superior a R$ 1.000,00 ordenados pelo nome completo */
SELECT PrimeiroNome, SegundoNome, UltimoNome, Salario FROM Funcionarios 
WHERE Salario > 1000 
ORDER BY PrimeiroNome, SegundoNome, UltimoNome;

/* d) Liste a data de nascimento e o primeiro nome dos funcionários ordenados do mais novo para o mais velho */
SELECT DataNasci, PrimeiroNome FROM Funcionarios ORDER BY DataNasci DESC;

/* e) Liste os funcionários como uma listagem telefônica */
SELECT CONCAT(PrimeiroNome, ' ', SegundoNome, ' - ', Fone) AS ListagemTelefonica 
FROM Funcionarios;

/* f) Liste o total da folha de pagamento */
SELECT SUM(Salario) AS TotalFolhaPagamento 
FROM Funcionarios;

/* g) Liste o nome, o nome do departamento e a função de todos os funcionários */
SELECT PrimeiroNome, UltimoNome, Nome AS NomeDepartamento, Funcao 
FROM Funcionarios 
JOIN Departamentos  ON CodigoDepartamento = Codigo;

/* h) Liste todos departamentos com seus respectivos gerentes */
SELECT Nome AS NomeDepartamento, PrimeiroNome AS GerentePrimeiroNome, UltimoNome AS GerenteUltimoNome
FROM Departamentos 
JOIN Funcionarios  ON GerenteId = Codigo;

/* i) Liste o valor da folha de pagamento de cada departamento (nome) */
SELECT Nome AS NomeDepartamento, SUM(Salario) AS TotalFolhaPagamento
FROM Departamentos 
JOIN Funcionarios  ON Codigo = CodigoDepartamento
GROUP BY Nome;

/* j) Liste os departamentos dos funcionários que têm a função de supervisor */
SELECT DISTINCT Nome AS NomeDepartamento
FROM Funcionarios 
JOIN Departamentos  ON CodigoDepartamento = Codigo
WHERE Funcao = 'Supervisor';

/* k) Liste a quantidade de funcionários desta empresa */
SELECT COUNT(*) AS QuantidadeFuncionarios 
FROM Funcionarios;

/* l) Liste o salário médio pago pela empresa */
SELECT AVG(Salario) AS SalarioMedio 
FROM Funcionarios;

/* m) Liste os nomes dos funcionários que moram em Recife e que exerçam a função de Telefonista */
SELECT PrimeiroNome, UltimoNome 
FROM Funcionarios 
WHERE Cidade = 'Recife' AND Funcao = 'Telefonista';

/* n) Liste o nome do departamento e do funcionário ordenados por departamento e funcionário */
SELECT Nome AS NomeDepartamento, CONCAT(PrimeiroNome, ' ', UltimoNome) AS NomeFuncionario
FROM Departamentos 
JOIN Funcionarios ON Codigo = CodigoDepartamento
ORDER BY Nome, NomeFuncionario;

/* o) Liste o nome completo de todos os funcionários que não tenham segundo nome */
SELECT CONCAT(PrimeiroNome, ' ', UltimoNome) AS NomeCompleto 
FROM Funcionarios 
WHERE SegundoNome IS NULL OR SegundoNome = '';  

/* p) Liste o menor salário pago pela empresa em cada departamento */
SELECT CodigoDepartamento, MIN(Salario) AS MenorSalario
FROM Funcionarios
GROUP BY CodigoDepartamento;

