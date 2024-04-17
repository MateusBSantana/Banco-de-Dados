/*1) Liste todos os alimentos da tabela comidas onde o preco seja menor que 10 ou
maior que 20*/

SELECT * FROM comidas;
SELECT * FROM funcionarios;
SELECT * FROM vendas;

SELECT * FROM comidas WHERE preco < 10 OR preco > 20;

/*2) Liste todos os alimentos da tabela comidas onde o aumento_preco não seja null*/

SELECT * FROM comidas WHERE aumento_preco IS NOT NULL;

/*3) Liste todos os alimentos da tabela funcionarios onde o os sobrenomes
começam com H até P*/

SELECT * FROM funcionarios WHERE sobrenome >= 'H' AND sobrenome <= 'P';

/*4) Pesquise os itens que foram vendidos sem desconto. As colunas presentes no
resultado da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT.*/

SELECT id_nf, id_item, cod_prod, valor_unit FROM vendas WHERE desconto IS NULL;

/*5) Pesquise os itens que foram vendidos com desconto. As colunas presentes no
resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT E O VALOR
VENDIDO. OBS: O valor vendido é igual ao VALOR_UNIT -
(VALOR_UNIT*DESCONTO).*/

SELECT id_nf, id_item, cod_prod, valor_unit, valor_unit - (valor_unit * desconto) valor_vendido FROM vendas WHERE desconto IS NOT NULL;

/*6) Altere o valor do desconto (para zero) de todos os registros onde este campo é
nulo.*/
SELECT * FROM vendas;    

UPDATE vendas SET desconto = 0 
	WHERE desconto IS NULL;

/*7) Pesquise os itens que foram vendidos. As colunas presentes no resultado da
consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL,
DESCONTO, VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula:
QUANTIDADE * VALOR_UNIT. O VALOR_VENDIDO é igual a VALOR_UNIT -
(VALOR_UNIT*DESCONTO/100).*/

SELECT id_nf, id_item, cod_prod, valor_unit,  QUANTIDADE * VALOR_UNIT valor_total, valor_unit - (valor_unit * desconto) valor_vendido FROM vendas;








