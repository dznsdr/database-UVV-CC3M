CREATE DATABASE "UVV-CC3M";

USE "UVV-CC3M";

CREATE TABLE empresa (
    empresa_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nome_fantasia VARCHAR(150) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    tipo_empresa TINYINT NOT NULL,
    cnpj_cpf VARCHAR(20) NOT NULL,
    logradouro VARCHAR(60) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    bairro VARCHAR(40) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(40) NOT NULL,
    cep CHAR(8) NOT NULL,
    pais VARCHAR(30) NOT NULL
);

CREATE TABLE banco (
    banco_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nome_agencia VARCHAR(50) NOT NULL,
    saldo_conta DECIMAL(15,2) NOT NULL
);

CREATE TABLE conta_pagar (
    conta_pagar_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    valor_conta_pag DECIMAL(15,2) NOT NULL,
    data_pagamento_pag DATE NOT NULL,
    data_vencimento_pag DATE NOT NULL,
    empresa_id INT NOT NULL,
    banco_id INT NOT NULL,
    CONSTRAINT fk_conta_pagar_empresa FOREIGN KEY (empresa_id) REFERENCES empresa(empresa_id),
    CONSTRAINT fk_conta_pagar_banco FOREIGN KEY (banco_id) REFERENCES banco(banco_id)
);

CREATE TABLE conta_receber (
    conta_receber_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    valor_conta_rec DECIMAL(15,2) NOT NULL,
    data_pagamento_rec DATE NOT NULL,
    data_vencimento_rec DATE NOT NULL,
    empresa_id INT NOT NULL,
    banco_id INT NOT NULL,
    CONSTRAINT fk_conta_receber_empresa FOREIGN KEY (empresa_id) REFERENCES empresa(empresa_id),
    CONSTRAINT fk_conta_receber_banco FOREIGN KEY (banco_id) REFERENCES banco(banco_id)
);