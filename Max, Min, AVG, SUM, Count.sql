-- Seleionando a DATABASE A SER USADA
USE loja_db;

-- Mostrando conteúdo tabela produtos
SELECT * FROM produtos;
SELECT * FROM venda_produto;
SELECT * FROM categoria_produto;

-- Descrevendo estrutura produtos
DESCRIBE produtos;

-- Selecionado maior preço de produtos
SELECT MAX(preco) Maior_Preco
FROM produtos;

-- Selecionando menor preço de produtos
SELECT MIN(preco) Menor_Preco
FROM produtos;

SELECT COUNT(id) total
FROM produtos;

-- Mostrando todos registros de venda
SELECT * FROM venda_produto;

-- Mostrar a média
SELECT AVG(valor) Media_venda 
FROM venda_produto;

-- Soma o valor dos produtos
SELECT SUM(preco) Soma_vendas
FROM produtos;

-- MOSTRAR PRODUTOS VENDIDOS
SELECT produtos.nome, venda_produto.valor, venda_produto.data 
FROM produtos AS m INNER JOIN venda_produto ON 
venda_produto.id_produto = produtos.id;

/* AS servia para abreviar os atributos
SELECT p.nome, vp.valor, vp.data 
FROM produtos AS p INNER JOIN venda_produto AS vp ON 
vp.id_produto = p.id;*/ 

SELECT * FROM categoria_produto;

SELECT p.nome, p.preco, c.nome categoria FROM
produtos AS p INNER JOIN categoria_produto AS c
ON p.id_categoria = c.id;

-- Pegando o valor maximo de cada categoria
SELECT MAX(p.preco) Maior, c.nome categoria
FROM produtos as p INNER JOIN categoria_produto
As c ON p.id_categoria = c.id 
-- GROUP BY Faz o agrupamneto das informações iguais
GROUP BY c.id; 

-- Pegando o menor valor de cada categoria-
SELECT MIN(p.preco) Menor, c.nome categoria
FROM produtos as p INNER JOIN categoria_produto
As c ON p.id_categoria = c.id 
-- GROUP BY Faz o agrupamneto das informações iguais
GROUP BY c.id; 

-- Contando os produtos de cada categoria
SELECT COUNT(p.id) quantidade, c.nome categoria
FROM produtos as p INNER JOIN categoria_produto
As c ON p.id_categoria = c.id 
-- GROUP BY Faz o agrupamneto das informações iguais
GROUP BY c.id; 

