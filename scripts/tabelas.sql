/*
TeSP_PSI_2122_CDBD
Escola de condução 'IPLDrive'
Marco António Fragoso Padeiro, estudante n.º 2211868
Tomás Martins Moura, estudante n.º 2211866
*/
-- Para comandos para a criação da base de dados e tabelas (nome base de dados = codigo de equipa do projeto)

-- @block Criação da Base de Dados
DROP DATABASE IF EXISTS E8;
CREATE DATABASE E8;
USE E8;

-- @block Criação da tabela 'instituicoes'
CREATE TABLE instituicoes(
    id                  INT             AUTO_INCREMENT,
    localizacao         VARCHAR(100),
    nome                VARCHAR(100),
    abreviatura         VARCHAR(10),
    telefone            VARCHAR(9)      UNIQUE,
    email               VARCHAR(255)    UNIQUE,
    CONSTRAINT pk_instituicoes_id PRIMARY KEY(id)
) ENGINE = InnoDB;

-- @block Criação da tabela 'pessoas'
CREATE TABLE pessoas(
    id              INT             AUTO_INCREMENT,
    codPostal       VARCHAR(8),
    localidade      VARCHAR(100),
    rua             VARCHAR(100),
    categoria       ,
    dtaNasc         DATE,
    telefone        VARCHAR(9)      UNIQUE,
    genero          enum('Masculino', 'Feminino', 'Outro'),
    NIF             VARCHAR(9)      UNIQUE,
    email           VARCHAR(255)    UNIQUE,
    pNome           VARCHAR(30),
    apelido         VARCHAR(30),
    CONSTRAINT pk_pessoas_id PRIMARY KEY (id)   
) ENGINE = InnoDB;

-- @block Criação da tabela 'instrutores'
CREATE TABLE instrutores(
    id_pessoa      INT,
    posicaoEmp     enum('Chefe', 'Funcionario')     NOT NULL,
    salario        DECIMAL(8,2),
    id_instituicao INT NOT NULL,
    CONSTRAINT pk_instrutores_id PRIMARY KEY(id_pessoa),
    CONSTRAINT fk_pessoas_id FOREIGN KEY(id_pessoa) REFERENCES pessoas(id),
    CONSTRAINT fk_instituicoes_id FOREIGN KEY(id_instituicao) REFERENCES instituicoes(id)
) ENGINE = InnoDB;
(
-- @block Criação da tabela 'alunos'
CREATE TABLE alunos(
    id_pessoa      INT,
    estadoPag      enum('por pagar', 'pagou'),
    estadoCod      enum('passou', 'chumbou', 'por fazer'),
    id_instrutor   INT,
    CONSTRAINT pk_alunos_id PRIMARY KEY(id_pessoa),
    CONSTRAINT fk_pessoas_id FOREIGN KEY(id_pessoa) REFERENCES pessoas(id),
    CONSTRAINT fk_instrutores_id FOREIGN KEY(id_instrutor) REFERENCES instrutores(id_pessoa)
) ENGINE = InnoDB;

-- @block Criação da tabela 'marcas'
CREATE TABLE marcas(
    id      INT         AUTO_INCREMENT,
    nome    VARCHAR(50)     NOT NULL,
    CONSTRAINT pk_marcas_id PRIMARY KEY(id),
) ENGINE = InnoDB;

-- @block Criação da tabela 'modelos'
CREATE TABLE modelos(
    id          INT             AUTO_INCREMENT,
    nome        VARCHAR(50)     NOT NULL,
    id_marca    INT             NOT NULL,
    CONSTRAINT pk_modelos_id PRIMARY KEY(id),
    CONSTRAINT fk_marcas_id FOREIGN KEY(id_marca) REFERENCES marcas(id),
) ENGINE = InnoDB;

-- @block Criação da tabela 'veiculos'
CREATE TABLE veiculos(
    id          INT            AUTO_INCREMENT,
    seguro      BOOLEAN        DEFAULT false,
    avaria      BOOLEAN        DEFAULT false,
    nKilometros INT,
    combustivel enum('Gasóleo', 'Gasolina', 'Gás', 'Elétrico', 'Outro'),
    consumo     DECIMAL,
    anoVeiculo  VARCHAR(4),
    matricula   VARCHAR(8),
    categoria   ,
    proximaManutencao DATETIME NOT NULL, 
    ultimaManutencao DATETIME, 
    id_instituicao INT NOT NULL,
    id_modelo INT NOT NULL
) ENGINE = InnoDB;