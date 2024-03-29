
CREATE DATABASE mateus_db; --Criação de banco de dados
USE mateus_db; -- Usar banco de dados

CREATE TABLE departamentos(
	departamento_cod CHAR(2) NOT NULL,  --Criação de tabelas
	nome VARCHAR(20),
	PRIMARY KEY (departamento_cod)  --Chave PRIMARIA
);

INSERT INTO departamentos (departamento_cod,nome)
	VALUE("fn", "financeiro");                         --Inserindo informações 
INSERT INTO departamentos (departamento_cod,nome)
	VALUE("vd", "vendas");

CREATE TABLE funcionarios(
	funcionario_id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(40) NOT NULL,
	departamento CHAR(2) NOT NULL,
	PRIMARY KEY (funcionario_id),
	FOREIGN KEY (departamento) REFERENCES departamentos(departamento_cod)  --Chave estrangeira
);

ALTER TABLE departamentos
	ADD COLUMN gerente INT NULL UNIQUE;  --Alteração de colunas 
	
INSERT INTO funcionarios(nome, departamento)
	VALUE("Ramon", "vd");
INSERT INTO funcionarios(nome, departamento)
	VALUE("Lahra", "vd");

--ALTER TABLE departamentos CHANGE COLUMN gerente gerente INT NULL UNIQUE; Muda uma coluna

ALTER TABLE departamentos 
	ADD CONSTRAINT fk_gerente  --Regra para coluna (impor restições)
	FOREIGN KEY(gerente)
	REFERENCES funcionarios(funcionario_id); --Referenciar outra tabela

DESCRIBE departamentos; --Mostra quais são os tipos das informaçãs que podem ser inseridas na tabela
SELECT * FROM funcionarios; --Descreve as informações que estão na tabela 

UPDATE departamentos SET gerente=2   --Atualiza a tabela
	WHERE departamento_cod="vd";  --Procura onde esta a informação que precisa ser atualizada

INSERT INTO departamentos (departamento_cod,nome)
	VALUE("tc", "Tecnologia");

INSERT INTO funcionarios(nome, departamento)
	VALUE("Mateus", "tc");
	
UPDATE departamentos SET gerente=3   --Atualiza a tabela
	WHERE departamento_cod="tc";
	 


SELECT departamentos.nome Departamento, funcionarios.nome Gerentes  --Seleção das respectivas informações 
	FROM funcionarios INNER JOIN departamentos ON funcionarios.funcionario_id=departamentoS.gerente; --Junção de duas tabelas

    