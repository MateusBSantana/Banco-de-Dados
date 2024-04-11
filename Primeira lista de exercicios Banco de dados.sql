-- EX1
-- 1) Liste todos os alimentos da tabela comidas
SELECT * FROM comidas;

-- EX2
/*2) Liste a descrição e o preço de todos os alimentos da tabela comidas. Mude o
nome da coluna de descricao para comida e o nome da coluna de preco para
custo.*/
SELECT descricao COMIDA, preco CUSTO FROM comidas; 

-- EX3
-- 3) Liste todos os id_fornecedor únicos de comidas
SELECT id_fornecedor FROM comidas;
SELECT codigo_depto FROM funcionarios;

-- EX4
-- 4) Selecione valores distintos das colunas A e B da tabela sec0207.
SELECT DISTINCT A, B FROM sec0207;

-- EX5
/*5) Selecione da tabela funcionarios as colunas primeiro_nome e sobrenome onde
o primeiro nome seja ‘NANCY’*/
SELECT primeiro_nome, sobrenome FROM funcionarios WHERE primeiro_nome = "nancy";

-- EXE6 
/*6) Liste o primeiro_nome e o sobrenome da tabela funcionarios com
id_funcionario maior ou igual a 205*/
SELECT id_funcionario, primeiro_nome, sobrenome FROM funcionarios WHERE id_funcionario >= 205;

-- EXE7
/*7) Liste o primeiro_nome e o sobrenome da tabela funcionarios com
id_funcionario diferente de 205*/
SELECT id_funcionario, primeiro_nome, sobrenome FROM funcionarios WHERE id_funcionario != 205;

-- EXE8
/*8) Liste o primeiro nome, sobrenome e código do departamento dos funcionários
que têm códigos de departamento ‘VEN’, ‘EXP’ e 'CON'. Faça isso usando uma
condição 'IN'*/
SELECT primeiro_nome, sobrenome, codigo_depto FROM funcionarios WHERE codigo_depto IN ("VEN", "EXP" , "CON");

-- EXE 9
/*9) Liste o id_funcionario, o primeiro_nome e o sobrenome dos funcionários que
têm um ID de funcionário entre 201 e 205.*/
SELECT id_funcionario, primeiro_nome, sobrenome FROM funcionarios WHERE id_funcionario BETWEEN 201 AND 205;

-- EXE10
/*10) Liste o id_funcionario, o primeiro_nome e o sobrenome dos funcionários que
têm um id_funcionario que contém o número 1*/
SELECT id_funcionario, primeiro_nome, sobrenome FROM funcionarios WHERE id_funcionario LIKE '%1%';

-- EXE11
-- 11) Liste todos os funcionários onde o id_gerente é NULL
SELECT * FROM funcionarios WHERE id_gerente IS NULL;

-- EXE12
/*12) Liste a coluna do nome_departamento da tabela departamentos. Essa coluna
deve se chamar departamento. Organize as linhas em ordem ascendente.*/
SELECT * FROM departamentos;
SELECT nome_departamento Departamento FROM departamentos ORDER BY nome_departamento ASC;

-- EXE13
/*13) A tabela sec0218 tem duas colunas chamadas A e B. Cada coluna contém os
números 1, 2 e 3. A tabela tem nove linhas mostrando todas as combinações
possíveis de valores. Liste todas as colunas desta tabela.*/
SELECT A, B FROM sec0218 ORDER BY A ASC;
SELECT A, B FROM sec0218 ORDER BY B ASC;

-- EXE14
/*14) A tabela sec0219 possui três colunas denominadas A, B e C. Cada coluna contém
os números 1, 2 e 3. Existem 27 linhas, uma para cada combinação de valores.
Liste todas as colunas desta tabela. Ordene as linhas primeiro pela coluna A, em
segundo lugar pela coluna B em ordem inversa, e em terceiro lugar pela coluna C
também em ordem inversa.*/
SELECT A, B, C FROM sec0219 ORDER BY A ASC, B DESC, C DESC;