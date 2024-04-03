SHOW TABLES;

DESCRIBE win_projects;
DESCRIBE project;

SELECT * FROM win_projects;
SELECT * FROM project;

-- Comando que mostra a junção das informação que são iguais nas duas tabelas
SELECT p.project_code, p.project_name, p.project_budget 
FROM project as p INNER JOIN  win_projects as w 
ON p.project_name = w.project_name;

-- Faz a junção das informações nome e gerente que são iguais nas duas tabelas
SELECT project.project_name, project.project_manager
FROM project INNER JOIN  win_projects
ON project.project_name = win_projects.project_name;

-- Comando que faz a junção de todas as informações da tabela 
SELECT *
FROM project as p INNER JOIN  win_projects as w 
ON p.project_name = w.project_name;

-- Comando que mostra toda informação na primerira "Esquerda" tabela e mostra e também o que estiver igual a outra tabela
SELECT project.project_name, win_projects.project_name
FROM project LEFT JOIN  win_projects 
ON project.project_name = win_projects.project_name;

-- Comando que mostra toda informação na segunda "Direira" tabela e mostra e também o que estiver igual a outra tabela
SELECT project.project_name, win_projects.project_name
FROM project RIGHT JOIN  win_projects 
ON project.project_name = win_projects.project_name;

CREATE TABLE edital_comentarios (
	project_code VARCHAR(5) NOT NULL,
    comentarios  VARCHAR(200) NOT NULL
);

INSERT INTO edital_comentarios (project_code, comentarios) VALUES
	('PC010', 'Aprovado com ressalvas'),
    ('PC011', 'Negado'),
    ('PC012', 'Aprovado');

SELECT * FROM edital_comentarios;

SELECT edital_comentarios.project_code, project.project_name,  edital_comentarios.comentarios
FROM edital_comentarios INNER JOIN project
ON edital_comentarios.project_code = project.project_code;

-- Comando para mostra as informações que não aparecem nas duas tabelas
SELECT edital_comentarios.project_code, project.project_name,  edital_comentarios.comentarios
FROM edital_comentarios RIGHT JOIN project
ON edital_comentarios.project_code = project.project_code
WHERE edital_comentarios.project_code is NULL;






 