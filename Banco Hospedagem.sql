DROP DATABASE IF EXISTS hospedagem; 
CREATE DATABASE hospedagem;

USE hospedagem;


CREATE TABLE hospedes(
	id_hospede INT AUTO_INCREMENT UNIQUE,
    nome_hospede VARCHAR(40),
    rg VARCHAR(7),
    cpf VARCHAR(11) UNIQUE,
    data_nascimento DATE,
    sexo CHAR(1),
    celular VARCHAR(13),
    email VARCHAR(40),
    CEP VARCHAR(9),
    Estado CHAR(2),
    cidade VARCHAR(20),
    bairro VARCHAR(40),
    rua VARCHAR(40),
    complemento VARCHAR(40),
    observacoes VARCHAR(60),
    PRIMARY KEY (id_hospede)
);

CREATE TABLE funcionarios(
	id_funcionario INT AUTO_INCREMENT UNIQUE,
    nome_funcionario VARCHAR(40),
    rg VARCHAR(7),
    cpf VARCHAR(11),
    data_nascimento DATE,
    sexo CHAR(1),
    celular VARCHAR(13),
    email VARCHAR(40),
    CEP VARCHAR(9),
    Estado CHAR(2),
    cidade VARCHAR(20),
    bairro VARCHAR(40),
    rua VARCHAR(40),
    complemento VARCHAR(40),
    cargo VARCHAR(20),
    data_admissao DATE,
    data_emissao_carteira DATE,
    banco VARCHAR(40),
    agencia INTEGER,
    conta INTEGER,
    status_funcionario VARCHAR(20),
    observecoes VARCHAR(60),
    PRIMARY KEY (id_funcionario)
);

CREATE TABLE usuarios(
	fk_funcionario INT,
    login VARCHAR(40),
    senha VARCHAR(8),
    FOREIGN KEY (fk_funcionario) REFERENCES funcionarios(id_funcionario)
);
    

CREATE TABLE acomodacoes(
	id_acomodacao INT AUTO_INCREMENT UNIQUE,
    tipo_quarto VARCHAR(20),
    capacidade INTEGER,
    nome_acomodacao VARCHAR(40),
    comodidade_wifi BOOLEAN,
    comodidade_arcondicionado BOOLEAN,
    comodidade_tv BOOLEAN,
    comodidade_frigobar BOOLEAN,
    comodidade_acessibiidade BOOLEAN,
    decricao VARCHAR(40),
    bloqueio_acomodacao BOOLEAN,
    periodo_bloqueio_inicio DATE,
    periodo_bloqueio_fim DATE,
    motivo_bloqueio VARCHAR(200),
    PRIMARY KEY (id_acomodacao)
);

CREATE TABLE reservas(
	id_reserva INT AUTO_INCREMENT UNIQUE,
    fk_hospede INT,
    fk_acomodacao INT,
	data_checkin DATE,
    data_checkon DATE,
    valor_diaria FLOAT,
    numero_adulto INTEGER,
    numero_crianca INTEGER,
    obeservacoes VARCHAR(200),
    FOREIGN KEY (fk_hospede) REFERENCES hospedes(id_hospede),
    FOREIGN KEY (fk_acomodacao) REFERENCES acomodacoes(id_acomodacao)
);

SELECT * FROM hospedes;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

