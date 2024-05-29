DROP DATABASE dev_media;

CREATE DATABASE dev_media;

USE dev_media;

CREATE TABLE produto (
	id INT(11) NOT NULL AUTO_INCREMENT,
	status_produto CHAR(1) NOT NULL DEFAULT 'A',
	descricao VARCHAR(50) NULL DEFAULT NULL,
	estoque_minimo INT(11) NULL DEFAULT NULL,
	estoque_maximo INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
);

INSERT INTO produto(status_produto, descricao,  estoque_minimo, estoque_maximo)
	VALUES("A", "Papel a4", 40, 50),
		  ("A", "Caneta Bic Azul", 10, 40),
          ("A", "Tesoura de ponta", 25, 50);
	
CREATE TABLE entrada_produto (
	id INT(11) NOT NULL AUTO_INCREMENT,
	id_produto INT(11) NULL DEFAULT NULL,
	qtde INT(11) NULL DEFAULT NULL,
	valor_unitario DECIMAL(9,2) NULL DEFAULT '0.00',
	data_entrada DATE NULL DEFAULT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);
          
CREATE TABLE estoque (
	id INT(11) NOT NULL AUTO_INCREMENT,
	id_produto INT(11) NULL DEFAULT NULL,
	qtde INT(11) NULL DEFAULT NULL,
	valor_unitario DECIMAL(9,2) NULL DEFAULT '0.00',
	PRIMARY KEY (id),
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);

CREATE TABLE saida_produto (
	id INT(11) NOT NULL AUTO_INCREMENT,
	id_produto INT(11) NULL DEFAULT NULL,
	qtde INT(11) NULL DEFAULT NULL,
	data_saida DATE NULL DEFAULT NULL,
	valor_unitario DECIMAL(9,2) NULL DEFAULT '0.00',
	PRIMARY KEY (`id`),
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);

DELIMITER //
CREATE PROCEDURE SP_AtualizaEstoque( id_prod int, qtde_comprada int, valor_unit decimal(9,2))
BEGIN
    declare contador int(11);

    SELECT count(*) into contador FROM estoque WHERE id_produto = id_prod;

    IF contador > 0 THEN
        UPDATE estoque SET qtde=qtde + qtde_comprada, valor_unitario= valor_unit
        WHERE id_produto = id_prod;
    ELSE
        INSERT INTO estoque (id_produto, qtde, valor_unitario) values (id_prod, qtde_comprada, valor_unit);
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER TRG_EntradaProduto_AI AFTER INSERT ON entrada_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde, new.valor_unitario);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER TRG_EntradaProduto_AU AFTER UPDATE ON entrada_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde - old.qtde, new.valor_unitario);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER TRG_EntradaProduto_AD AFTER DELETE ON entrada_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (old.id_produto, old.qtde * -1, old.valor_unitario);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER TRG_SaidaProduto_AI AFTER INSERT ON saida_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde * -1, new.valor_unitario);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER TRG_SaidaProduto_AU AFTER UPDATE ON saida_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, old.qtde - new.qtde, new.valor_unitario);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER TRG_SaidaProduto_AD AFTER DELETE ON saida_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (old.id_produto, old.qtde, old.valor_unitario);
END //
DELIMITER ;

SELECT * FROM produto;
SELECT * FROM entrada_produto;
SELECT * FROM estoque;
SELECT * FROM saida_produto;


INSERT INTO entrada_produto(id_produto, qtde, valor_unitario, data_entrada)
	VALUES(1, 10, 20.50, '2024-05-20'),
		  (2, 20, 2.85,  '2024-05-01'),
          (3, 5, 6.40,  '2024-05-02');
          
INSERT INTO saida_produto(id_produto, qtde, data_saida, valor_unitario)
	VALUE(1, 2, '2024-05-23', 30.80);
    
INSERT INTO entrada_produto(id_produto, qtde, valor_unitario, data_entrada)
	VALUE(1, 3, 20.50, '2024-05-18');

INSERT INTO saida_produto(id_produto, qtde, data_saida, valor_unitario)
	VALUE(3, 1, '2024-05-23', 8.30);

INSERT INTO saida_produto(id_produto, qtde, data_saida, valor_unitario)
	VALUE(3, 2, '2024-05-23', 8.30);





