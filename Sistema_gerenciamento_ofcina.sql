DROP DATABASE oficina_db;

CREATE DATABASE oficina_db;

USE oficina_db;


CREATE TABLE cliente (
    id_cliente INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(15),
    sobrenome VARCHAR(15),
    endereco VARCHAR(40),
    telefone_cliente VARCHAR(10),
    email_cliente VARCHAR(40)
);


CREATE TABLE veiculo (
    id_veiculo INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_dono INTEGER,
    marca VARCHAR(10),
    modelo VARCHAR(10),
    ano_fabricacao INTEGER,
    placa VARCHAR(7),
    numero_chassi VARCHAR(17),
    cor VARCHAR(10),
    FOREIGN KEY (id_dono) REFERENCES cliente(id_cliente)
);

CREATE TABLE servico (
	id_servico INTEGER PRIMARY KEY AUTO_INCREMENT,
    desc_servico VARCHAR (100),
    preco FLOAT,
    data_inicio DATE,
    data_conclusao DATE,
    id_veiculo INTEGER,
	FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

CREATE TABLE estoque (
	id_peca INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome_peca VARCHAR(15),
    descricao VARCHAR(100),
    preco_peca FLOAT,
    qtd_estoque INTEGER
);

CREATE TABLE funcionario(
	id_funcionario INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(15),
    sobrenome_funcionario VARCHAR(15),
    cargo VARCHAR(20),
    data_contratacao DATE,
    salario DECIMAL(9, 2)
);

CREATE TABLE peca_usada(
	id_peca_usada INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
	id_peca INTEGER,
	id_servico INTEGER,
    qtd_peca INTEGER,
	FOREIGN KEY (id_peca) REFERENCES estoque(id_peca),
	FOREIGN KEY (id_servico) REFERENCES servico(id_servico)
);

SHOW TABLES;

INSERT INTO cliente(nome_cliente, sobrenome, endereco, telefone_cliente, email_cliente)
	VALUES("Vitor", "Souza", "Serra", "1111-1111", "vitor@gmail.com"),
    ("Andressa", "Silva", "Laranjeiras", "2222-2222", "andressa@gmail.com"),
    ("Gustavo", "Santana", "Cariacica", "3333-3333", "gugu@gmail.com");
    
INSERT INTO veiculo(id_dono, marca, modelo, ano_fabricacao, placa, numero_chassi, cor)
	VALUES(1, "Ford", "Fiesta", 2015, "lop14p4", "asdfg4158965","Vermelho"),
    (2, "Toyata", "Corolla", 2020, "qlr84o6", "asdfgh1589877","Preto"),
    (3, "Ford", "Kar", 2018, "prt23a5", "asdfhj158745","Branco");
    
INSERT INTO servico(desc_servico, preco, data_inicio, data_conclusao, id_veiculo)
	VALUES("Troca de parachoque", 200.00, '2024-03-05',  '2024-04-05', 1),
    ("Troca de pneu", 300.52, '2024-03-01',  '2024-03-03', 2),
     ("Troca de Olio", 75.40, '2024-05-01',  '2024-05-03', 2);

INSERT INTO estoque(nome_peca, descricao, preco_peca, qtd_estoque)
	VALUES("Retrovisor", "Da marca popopie, cinza", 70.00, 10),
    ("Para-choque", "Da marca olx, brnco", 100.00, 3),
    ("Portas", "Da marca Ford, Branco", 120.00, 5);

INSERT INTO funcionario(nome_funcionario, sobrenome_funcionario, cargo, data_contratacao, salario)
	VALUES("Valdineide", "Schunck", "Mecanico", '2024-04-30', 100.00),
    ("Ramon", "Nomar", "Gerente", '2010-10-02', 110.00),
    ("Chirs", "Veloso", "Diretor Geral", '2023-12-28', 200.00);
    
INSERT INTO peca_usada(id_peca, id_servico, qtd_peca)
	 VALUES(1, 1, 3),
	 (2, 2, 5),
	 (3, 3, 1);
 
 -- Primeira View
 CREATE VIEW historico_servico AS SELECT v.marca, v.modelo, s.data_inicio, s.data_conclusao, s.preco
 FROM servico JOIN  veiculo ON v.id_veiculo = s.id_veiculo;
 
 -- Segunda View
CREATE VIEW receita_cliente AS SELECT veiculo.id_veiculo, c.id_cliente, c.nome_cliente, c.sobrenome, s.id_servico, s.desc_servico, s.preco
 FROM servico s JOIN veiculo ON s.id_veiculo = veiculo.id_veiculo JOIN cliente c ON veiculo.id_dono = c.id_cliente;
 
 -- Terceira View
 CREATE VIEW estoque_peca AS SELECT e.id_peca, e.nome_peca, e.descricao, e.preco_peca, e.qtd_estoque FROM estoque e;
 
SELECT * FROM historico_servico;
SELECT * FROM receita_cliente;
SELECT * FROM estoque_peca;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    