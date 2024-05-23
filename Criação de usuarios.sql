USE loja;

DROP TABLE produtos;

CREATE TABLE produtos (
	id_produto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(40),
    quant INT,
    valor FLOAT,
    data_fabri DATE,
    PRIMARY KEY (id_produto)
);

INSERT INTO produtos (nome, quant, valor, data_fabri)
	VALUES("Alicate", 3, 5.0, '2023-05-03'),
		  ("Panela", 15, 45.85, '2024-01-03'),
          ("Luva", 50, 25.20, '2023-12-03');
          
CREATE TABLE usuarios(
	id_usuario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(40),
    senha VARCHAR(20),
    PRIMARY KEY (id_usuario)
);

CREATE USER 'Senai'@'localhost' IDENTIFIED BY 'senha123';

GRANT SELECT, INSERT ON loja.produtos TO 'Senai'@'localhost';

FLUSH PRIVILEGES;

REVOKE INSERT ON loja.produtos FROM "Senai"@"localhost";


          