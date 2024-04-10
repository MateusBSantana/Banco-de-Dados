USE sqlfun;

-- Mostrar tabelas
SHOW TABLES;
SELECT * FROM  l_foods;

SELECT COUNT(menu_item) total FROM  l_foods;

-- Na tabela "l_foods" list a "description" e "price" 
-- De todos os alimentos e coloque o nome 
-- "description" como "descrição" e "price" como  custo

SELECT description descricao, price custo FROM l_foods;

SELECT * FROM l_employees;

-- Distinct seleciona os valores unicos dentro du uma coluna "Tiras as linhas repetidas"
SELECT DISTINCT manager_id FROM l_employees;

-- Mostrando todos valores das colunas manager_id
SELECT manager_id FROM l_employees;

-- Ordenadno de forma ascedente 
SELECT * FROM l_employees ORDER BY FIRST_NAME asc;

-- Ordenando de forma decrescente
SELECT * FROM l_employees ORDER BY FIRST_NAME desc;

-- Seleciona linhas que contenham valores nulos
SELECT * FROM l_employees WHERE manager_id IS NULL;

-- Seleciona linhas que não contenham valores nuos
SELECT * FROM l_employees WHERE manager_id IS NOT NULL;

SELECT * FROM l_suppliers;

-- Faz a junção das tabelas em qestão e fazendo a funçao DISTINCT
SELECT DISTINCT s.supplier_id, s.supplier_name FROM l_foods AS f
INNER JOIN l_suppliers AS s
ON f.supplier_id = s.supplier_id;

SELECT * FROM l_departments;
SELECT * FROM l_employees;

SELECT s.supplier_id, s.supplier_name
FROM l_suppliers AS s 
LEFT JOIN l_foods AS f
ON s.supplier_id = f.supplier_id
WHERE f.supplier_id IS NULL;

SELECT e.first_name Nome, e.last_name Ultimo_Nome , d.department_name Departamento  
FROM l_employees AS e INNER JOIN l_departments AS d
ON e.dept_code = d.dept_code;