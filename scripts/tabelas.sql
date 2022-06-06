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
    id INT AUTO_INCREMENT,
    localizacao VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    abreviatura VARCHAR(10) NOT NULL,
    telefone VARCHAR(9) NOT NULL,
    email VARCHAR(255) NOT NULL,
    CONSTRAINT pk_instituicoes_id PRIMARY KEY(id),
    CONSTRAINT uc_instituicoes UNIQUE (telefone, email)
) ENGINE = InnoDB;

-- @block Criação da tabela 'pessoas'
CREATE TABLE pessoas(
    id INT AUTO_INCREMENT NOT NULL,
    codPostal VARCHAR(8) NOT NULL,
    localidade VARCHAR(100) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    categoria       ,
    dtaNasc DATE NOT NULL,
    telefone VARCHAR(9),
    genero enum('Masculino', 'Feminino', 'Outro') NOT NULL,
    NIF VARCHAR(9) NOT NULL,
    email VARCHAR(255),
    pNome VARCHAR(30) NOT NULL,
    apelido VARCHAR(30) NOT NULL,
    CONSTRAINT pk_pessoas_id PRIMARY KEY (id),
    CONSTRAINT uc_instituicoes UNIQUE (NIF, telefone, email)
) ENGINE = InnoDB;

-- @block Criação da tabela 'instrutores'
CREATE TABLE instrutores(
    id_pessoa INT NOT NULL,
    posicaoEmp enum('Chefe', 'Funcionario') NOT NULL,
    salario DECIMAL(8,2) NOT NULL,
    id_instituicao INT NOT NULL,
    CONSTRAINT pk_instrutores_id PRIMARY KEY(id_pessoa),
    CONSTRAINT fk_pessoas_id FOREIGN KEY(id_pessoa) REFERENCES pessoas(id),
    CONSTRAINT fk_instituicoes_id FOREIGN KEY(id_instituicao) REFERENCES instituicoes(id)
) ENGINE = InnoDB;

-- @block Criação da tabela 'alunos'
CREATE TABLE alunos(
    id_pessoa INT NOT NULL,
    estadoPag enum('por pagar', 'pagou') NOT NULL DEFAULT 'por pagar',
    estadoCod enum('passou', 'chumbou', 'por fazer') NOT NULL DEFAULT 'por fazer',
    id_instrutor INT NOT NULL,
    CONSTRAINT pk_alunos_id PRIMARY KEY(id_pessoa),
    CONSTRAINT fk_pessoas_id FOREIGN KEY(id_pessoa) REFERENCES pessoas(id),
    CONSTRAINT fk_instrutores_id FOREIGN KEY(id_instrutor) REFERENCES instrutores(id_pessoa)
) ENGINE = InnoDB;

-- @block Criação da tabela 'marcas'
CREATE TABLE marcas(
    id INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    CONSTRAINT pk_marcas_id PRIMARY KEY(id),
) ENGINE = InnoDB;

-- @block Criação da tabela 'modelos'
CREATE TABLE modelos(
    id INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    id_marca INT NOT NULL,
    CONSTRAINT pk_modelos_id PRIMARY KEY(id),
    CONSTRAINT fk_marcas_id FOREIGN KEY(id_marca) REFERENCES marcas(id),
) ENGINE = InnoDB;

-- @block Criação da tabela 'veiculos'
CREATE TABLE veiculos(
    id INT AUTO_INCREMENT,
    seguro BOOLEAN NOT NULL DEFAULT false,
    avaria BOOLEAN NOT NULL DEFAULT false,
    nKilometros INT NOT NULL,
    combustivel enum('Gasóleo', 'Gasolina', 'Gás', 'Elétrico', 'Outro') NOT NULL,
    consumo DECIMAL NOT NULL,
    anoVeiculo VARCHAR(4) NOT NULL,
    matricula VARCHAR(8) NOT NULL,
    categoria   ,
    proximaManutencao DATETIME NOT NULL, 
    ultimaManutencao DATETIME, 
    id_instituicao INT NOT NULL,
    id_modelo INT NOT NULL,
    CONSTRAINT pk_veiculos_id PRIMARY KEY(id),
    CONSTRAINT fk_modelos_id FOREIGN KEY(id_modelo) REFERENCES modelos(id)
) ENGINE = InnoDB;

-- @block Criação da tabela 'aulas'
CREATE TABLE aulas(
    id INT AUTO_INCREMENT,
    dtaInicio DATETIME NOT NULL,
    dtaFim DATETIME NOT NULL,
    categoria NOT NULL,
    id_aluno INT NOT NULL,
    id_instrutor INT NOT NULL,
    id_veiculo INT NOT NULL,
    id_instituicao INT NOT NULL,
    CONSTRAINT pk_aulas_id PRIMARY KEY(id),
    CONSTRAINT fk_alunos_id FOREIGN KEY(id_aluno) REFERENCES alunos(id),
    CONSTRAINT fk_instrutores_id FOREIGN KEY(id_instrutor) REFERENCES instrutores(id),
    CONSTRAINT fk_veiculos_id FOREIGN KEY(id_veiculo) REFERENCES veiculos(id),
    CONSTRAINT fk_instituicoes_id FOREIGN KEY(id_instituicao) REFERENCES instituicoes(id)
) ENGINE = InnoDB;

CREATE TABLE exames(
    id INT AUTO_INCREMENT,
    dtaInicio DATETIME NOT NULL,
    dtaFim DATETIME NOT NULL,
    categoria NOT NULL,
    id_aluno INT NOT NULL,
    id_instrutor INT NOT NULL,
    id_veiculo INT NOT NULL,
    id_instituicao INT NOT NULL,
    CONSTRAINT pk_exames_id PRIMARY KEY(id),
    CONSTRAINT fk_alunos_id FOREIGN KEY(id_aluno) REFERENCES alunos(id),
    CONSTRAINT fk_instrutores_id FOREIGN KEY(id_instrutor) REFERENCES instrutores(id),
    CONSTRAINT fk_veiculos_id FOREIGN KEY(id_veiculo) REFERENCES veiculos(id),
    CONSTRAINT fk_instituicoes_id FOREIGN KEY(id_instituicao) REFERENCES instituicoes(id)
) ENGINE = InnoDB;