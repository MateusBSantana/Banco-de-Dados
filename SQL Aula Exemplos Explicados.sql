/*
1) Um exemplo de uma instrução SELECT que usa todas 
as cláusulas recém-listadas. Mostre as colunas id_funcionario, primeiro_nome 
e limite de crédito da tabela funcionarios do banco de dados sqlfun. 
Mostre apenas os funcionários que têm um limite de crédito superior a R$ 20,00. 
Classifique as linhas do resultado pelo sobrenome do funcionário.
*/
SELECT id_funcionario, primeiro_nome, limite_credito
FROM funcionarios WHERE limite_credito > 20;

/*
2) Selecione a coluna id_funcionario como numero_funcionario e a
coluna numero_telefone. Crie também duas novas colunas: avaliacao
e nota. Dê a cada funcionário uma avaliação de "Funcionario Excelente" e uma
nota 10.
*/

SELECT id_funcionario numero_funcionario, 
 numero_telefone,
 primeiro_nome,
 'Funcionario Excelente' AS avaliacao, 
 10 AS nota
FROM funcionarios;

/*
3) Obtenha toda a tabela funcionarios, todas as colunas e todas as linhas. 
Exiba todas as colunas na mesma ordem da tabela.
*/

SELECT * FROM funcionarios;

/*
4) Se uma cláusula where for adicionada à instrução select, a tabela de 
resultados poderá conter apenas algumas das linhas da tabela inicial.
*/

SELECT * FROM funcionarios
WHERE id_gerente IS NULL;

/*
5) Se um ORDER BY for adicionada à instrução SELECT, as linhas da tabela
de resultados poderão ser classificadas em uma ordem diferente. Por exemplo,
você pode classificá-los por data_contratacao. Quando não há ordem definida,
o computador pode listar as linhas em qualquer ordem. Para controlar a  ordem
e garantir que as linhas sejam classificadas pelo valor na coluna primeiro_nome,
é necessário escrever:
*/

SELECT * FROM funcionarios
ORDER BY primeiro_nome;

/*
6) Lista de todos os valores diferentes na coluna id_gerente da tabela funcionarios
*/

SELECT DISTINCT id_gerente
FROM funcionarios;

/*
7) SELECT DISTINCT pode ser usado com uma cláusula WHERE para limitar o número de 
linhas na tabela de resultados. A cláusula where é processada primeiro, o que
remove algumas linhas da tabela inicial. Em seguida, a cláusula distinta de 
seleção é processada. Aqui está um exemplo:
*/

SELECT DISTINCT id_gerente
FROM funcionarios
WHERE id_funcionario IN (201, 208, 210);

/*
8) SELECT DISTINCT pode ser usado com uma ordem por cláusula para classificar 
as linhas da tabela de resultados em ordem crescente ou decrescente.
*/

SELECT DISTINCT id_gerente
FROM funcionarios
ORDER BY id_gerente DESC;

/*
9) Se o DISTINCT for removido da instrução SELECT, os resultados serão a 
coluna id_gerente da tabela inicial. O valor 201 aparecerá três vezes.
Nenhum valor duplicado será removido, nem ocorrerá qualquer classificação.
As linhas podem aparecer na mesma ordem que na tabela inicial ou podem
aparecer em alguma ordem completamente diferente.
*/

SELECT id_gerente
FROM funcionarios;

/*
10)Lista de todos os valores diferentes nas colunas id_gerente e 
limite_credito da tabela funcionarios.
A tabela resultante terá id_gerente repetidos pois possui diferentes valores
em limite de crédito, tornando a linha única
*/

SELECT DISTINCT id_gerente,
 limite_credito
FROM funcionarios;

/*
11) Para todos os funcionários que se reportam ao funcionário 203, Martha Woods, 
liste as seguintes informações:
id_funcionario, primeiro_nome, sobrenome, id_gerente, data_contratacao
*/

SELECT id_funcionario, 
       primeiro_nome,
       sobrenome,
       id_gerente,
       data_contratacao
FROM funcionarios
WHERE id_gerente = 203;

/*
12) Para todos os funcionários cujo primeiro nome é Henry,
liste as mesmas colunas que antes.
*/

SELECT id_funcionario,
       primeiro_nome,
       sobrenome,
       id_gerente,
       data_contratacao
FROM funcionarios
WHERE primeiro_nome = 'HENRY';

/*
13) Para todos os funcionários cujo primeiro nome é Paula, liste as mesmas colunas de antes. 
Altere o nome da coluna primeiro_nome para nome.
*/

SELECT id_funcionario,
       primeiro_nome nome,
       sobrenome,
       id_gerente,
       data_contratacao
FROM funcionarios
WHERE primeiro_nome = 'PAULA';

/*
14) Liste todos os funcionários que possuem um limite de crédito 
inferior a $17,50. Mostre as colunas:
primeiro_nome, primeiro_nome, limite_credito, sobrenome, limite_credito
*/

SELECT id_funcionario,
       primeiro_nome,
       sobrenome,
       limite_credito
FROM funcionarios
WHERE limite_credito < 17.50;

/*
15)Mostre outra maneira de escrever essa consulta, utilizando o sinal de maior ou 
igual a (>=) e negando a condição com um 'not' booleano.
*/

SELECT id_funcionario,
       primeiro_nome,
       sobrenome,
       limite_credito
FROM funcionarios
WHERE NOT (limite_credito >= 17.50);

/*
16) Liste todos os funcionários que não se reportam ao funcionário 203, Martha Woods. 
Mostre as seguintes colunas:
id_funcionario, primeiro_nome, sobrenome, id_gerente
*/

SELECT id_funcionario,
       primeiro_nome,
       sobrenome,
       id_gerente
FROM funcionarios
WHERE NOT (id_gerente = 203);

/*
17) Liste todos os funcionários que se reportam aos funcionários 202 ou 203, 
Jim Kern ou Martha Woods. Mostre as seguintes colunas:
id_funcionario,primeiro_nome, sobrenome id_gerente
*/

SELECT id_funcionario,
       primeiro_nome,
       sobrenome,
       id_gerente
FROM funcionarios
WHERE id_gerente IN (202, 203);

/* 18) Outra forma de fazer a mesma coisa
*/

SELECT id_funcionario,
       primeiro_nome,
       sobrenome,
       id_gerente
FROM funcionarios
WHERE id_gerente = 202
 OR id_gerente = 203;

/*
19) Liste todos os funcionários que têm um valor nulo na coluna id_gerente. 
Mostre as seguintes colunas:
id_funcionario, primeiro_nome, sobrenome, id_gerente
*/
 
 SELECT id_funcionario,
       primeiro_nome,
       sobrenome,
       id_gerente
FROM funcionarios
WHERE id_gerente IS NULL;

/*
20) Selecione a tabela funcionários e ordene por nome
altere a coluna para primeiro_nome para nome
*/

SELECT primeiro_nome nome,
       sobrenome
FROM funcionarios
ORDER BY nome;

/*
21) Ordenando pelo sobrenome usando o indice da coluna
*/

SELECT primeiro_nome nome,
       sobrenome
FROM funcionarios
ORDER BY 2;

/*
22) Liste os códigos dos departamentos e os sobrenomes de todos os 
funcionários, exceto o funcionário 209. Ordene as linhas da tabela de 
resultados em ordem ascendente por ambas as colunas.
*/

SELECT codigo_depto,
       primeiro_nome nome
FROM funcionarios
WHERE NOT (id_funcionario = 209)
ORDER BY codigo_depto, nome;

/*
23) Liste os códigos dos departamentos e os sobrenomes de todos os 
funcionários, exceto o funcionário 209. Ordene as linhas da tabela de 
resultados em ordem ascendente em codigo_depto e decrescente em nome.
*/

SELECT codigo_depto,
       primeiro_nome nome
FROM funcionarios
WHERE NOT (id_funcionario = 209)
ORDER BY codigo_depto, nome DESC;

/*
24) Liste todos os funcionários que não se reportam ao funcionário 203, Martha Woods. 
Inclua linhas com um valor nulo na coluna id_gerente. Mostre as seguintes colunas: 
id_funcionario, primeiro_nome, sobrenome e id_gerente.
*/

SELECT id_funcionario,
       primeiro_nome,
       sobrenome,
       id_gerente
FROM funcionarios
WHERE NOT (id_gerente = 203)
 OR id_gerente IS NULL;
 
 /*
25 - 26 A consulta SQL especificada trará uma lista de funcionários da tabela funcionarios 
com as seguintes condições aplicadas:
Departamento: Exclui funcionários que estão nos departamentos 'CON' ou 'MKT'.
Sobrenome: Exclui funcionários cujos sobrenomes começam com qualquer letra entre 'J' e 'N'. 
Final do Sobrenome: Exclui funcionários cujos sobrenomes terminam com a letra 'S'.
Gerente Atribuído: Inclui apenas funcionários que têm um gerente atribuído. 
A consulta selecionará os 
id_funcionario, primeiro_nome, sobrenome e id_gerente
 */
 
SELECT id_funcionario,
       primeiro_nome,
       sobrenome,
       id_gerente
FROM funcionarios
WHERE NOT codigo_depto IN ('CON', 'MKT')
AND NOT sobrenome BETWEEN 'J' AND 'N'
AND NOT (sobrenome LIKE '%S')
AND id_gerente IS NOT NULL;


SELECT id_funcionario,
       primeiro_nome,
       sobrenome
FROM funcionarios
WHERE (id_gerente IS NULL
       AND primeiro_nome = 'SUSAN'
       AND limite_credito = 30.00)
   OR (NOT (data_contratacao IS NULL)
       AND limite_credito BETWEEN 10.00 AND 50.00
       AND sobrenome IN ('SMITH', 'JACOBS', 'PATRICK')
       AND NOT (codigo_depto = 'EXP'))
   OR (limite_credito > 22.00
       AND data_contratacao IS NULL)
   OR (id_funcionario > 700
       AND codigo_depto IN ('VEN', 'MKT')
       AND id_gerente = 400);