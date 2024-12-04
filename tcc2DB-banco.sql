-- Recriando o banco de dados
DROP DATABASE IF EXISTS tcc2;
CREATE DATABASE tcc2;
USE tcc2;

-- Criando a tabela Usuario
CREATE TABLE Usuario (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

-- Criando a tabela Perfil
CREATE TABLE Perfil (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('ANIMAL', 'OBJETO', 'PESSOA') NOT NULL  -- Usando ENUM para mapear diretamente o tipo de perfil
);

-- Inserindo valores na tabela Perfil
INSERT INTO Perfil (tipo) VALUES ('ANIMAL');
INSERT INTO Perfil (tipo) VALUES ('OBJETO');
INSERT INTO Perfil (tipo) VALUES ('PESSOA');

-- Criando a tabela QRCode com o campo status, apelido, ID como VARCHAR e campo perfil_id
CREATE TABLE QRCode (
    id VARCHAR(255) PRIMARY KEY,  -- ID como VARCHAR
    apelido VARCHAR(255),
    status INT NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Campo data_criacao adicionado
    quantidade_leituras INT DEFAULT 0,                 -- Adicionando campo para quantidade de leituras
    ultima_leitura TIMESTAMP NULL,                     -- Adicionando campo para a última leitura
    usuario_id BIGINT,
    perfil_id BIGINT,  -- Alterado para BIGINT para alinhar com o tipo da chave primária da tabela Perfil
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (perfil_id) REFERENCES Perfil(id)
);

-- Criando a tabela Animal
CREATE TABLE Animal (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_responsavel VARCHAR(255),
    endereco_responsavel VARCHAR(255),
    telefone_responsavel VARCHAR(255),
    email_responsavel VARCHAR(255),
    nome_animal VARCHAR(255),
    tipo_animal VARCHAR(255),
    raca_animal VARCHAR(255),
    descricao_animal VARCHAR(255),
    foto_animal LONGBLOB,  -- Usado LONGBLOB para imagens grandes
    observacao_animal VARCHAR(255),
    qrcode_id VARCHAR(255),
    FOREIGN KEY (qrcode_id) REFERENCES QRCode(id),
    UNIQUE (qrcode_id)  -- Garantir que cada QRCode esteja associado a um único animal
);

-- Criando um índice para o campo qrcode_id
CREATE INDEX idx_animal_qrcode_id ON Animal(qrcode_id);

-- Criando a tabela Objeto
CREATE TABLE Objeto (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_responsavel VARCHAR(255),
    endereco_responsavel VARCHAR(255),
    telefone_responsavel VARCHAR(255),
    email_responsavel VARCHAR(255),
    nome_objeto VARCHAR(255),
    descricao_objeto VARCHAR(255),
    foto_objeto LONGBLOB,  -- Usado LONGBLOB para imagens grandes
    observacao_objeto VARCHAR(255),
    qrcode_id VARCHAR(255),
    FOREIGN KEY (qrcode_id) REFERENCES QRCode(id),
    UNIQUE (qrcode_id)  -- Garantir que cada QRCode esteja associado a um único objeto
);

-- Criando um índice para o campo qrcode_id
CREATE INDEX idx_objeto_qrcode_id ON Objeto(qrcode_id);

-- Criando a tabela Pessoa
CREATE TABLE Pessoa (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_responsavel VARCHAR(255),
    endereco_responsavel VARCHAR(255),
    telefone_responsavel VARCHAR(255),
    email_responsavel VARCHAR(255),
    nome_pessoa VARCHAR(255),
    patologia_pessoa VARCHAR(255),
    medicacao_pessoa VARCHAR(255),
    tipo_sanguineo_pessoa VARCHAR(255),
    foto_pessoa LONGBLOB,  -- Usado LONGBLOB para imagens grandes
    observacao_pessoa VARCHAR(255),
    qrcode_id VARCHAR(255),
    FOREIGN KEY (qrcode_id) REFERENCES QRCode(id),
    UNIQUE (qrcode_id)  -- Garantir que cada QRCode esteja associado a uma única pessoa
);

-- Criando um índice para o campo qrcode_id
CREATE INDEX idx_pessoa_qrcode_id ON Pessoa(qrcode_id);

-- Inserindo exemplos de QR Codes
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('C8nyHX7kdC', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('BdBrN70JFi', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('5CRsWJF5Jz', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('8qEQnXRKxf', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('BzXJ4t5G5r', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('FInCKQfVVC', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ehVqieb0Gu', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('gdEXY8YonW', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('xPDlh354c4', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ovLbwtr3eb', NULL, 0, NULL, NULL);




INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('IgmLNALAcF', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('sbQGfKdC1A', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('JYZ0P6XRJu', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('R59RdmjJuH', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('uF1x3BDXyZ', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Na5FVruZgH', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('8Q657xk20x', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('0VjYofurYF', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('hvkrbF6pWk', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('YrWoDlPNEo', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('OZ8rjwWOsW', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Adn2oOhAVH', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('dgtwBngN7Q', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('NIHBUB8TOj', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('B3rOIKxwDP', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('zsktNua7pV', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('xrp3QJYt9y', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('aKFmHQpZZa', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('0r8xiy1zPe', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('d5JIUV0OFw', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('uHZXpcgFjj', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('t5bTsy7SJG', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('CO3VMjFYpK', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('l3cKl6wvR2', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('GIV7Q18KDQ', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('7bsqwIVE7X', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('9paLqNxlIr', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('0jtVCDB8Gp', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('dDgN1tSqPc', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('hB7YP0Rqau', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('eHC2t87RGH', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('rXb7Ij0Qy9', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('bw0IB5xKSP', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('gtKaRg7JZL', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('VeRMfHq7DD', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('n7YQXJkwpj', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('LDXGzmAraB', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('IxCjlrzpOb', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('lwtyPuujjz', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('fDd3oBQsGx', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('3Ev5nER9fe', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ZvgX5MS1Kd', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('gJVaAIvraI', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('fbcRFLLLxP', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('rNUYXFv6N5', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Pn00nRsw0u', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('zWu0CePZw6', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('kDiDlYgIvs', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('nnAKO6CgY5', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('nZ2rkZ3liY', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('manHWGQmd8', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('MVNPokQH7S', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('IF7gkPaEVl', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('T9s2vjvFyP', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('SwianwuRW1', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('hFxBFC5kNb', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('yEclDJSgIJ', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ILSfNgtPfV', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('z6YpkhMqLY', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('AIhxFk3e9W', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('SWnYhRB7N3', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('mwGfmJgqXq', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('7fKsNma0DR', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('nT1DL4bxaJ', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('m2qUvqxtTS', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('O2bPVh3aTE', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('7ZP7v8FsEb', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('c1Jga2KCcl', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('yIg2C37PIL', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('9xSlKhYsFT', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('B9jJBGC6QT', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Mp47xOeXDh', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Tkw0nsbGVQ', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('oOv22wxEi9', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('KwH7fOmF5l', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('lW9navnUsy', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('0KCYMRAeOS', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('6tXBu5hDwj', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('8gO1Dqg0kS', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Ed3BEZibV6', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('WRri4eSrpn', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('sRryvxDt3h', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('RjirfRczBx', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('3IEsDu9xiG', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('U7KA1pI3Wv', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('l5f8nCkmFg', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('EAlplPJZY5', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('C81YodGmoS', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('w7crrp6Kdw', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('hx0fCv6GdB', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('hxLrpOoF9h', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('tAhAnzgLpG', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ygUUpGFk1s', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('FJxyLr953p', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('GcpYFLauDx', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('VE9rhWy2oN', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('5RCJyeN5e1', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('8GWQmIct7X', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('tvLJcUC8Bm', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('dZAt1TTGaL', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('XoKFc7m6xO', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('kh23BKgOUu', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('lPm6gEejjb', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ME3qjffXS2', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('sspWLMD3r3', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Ps0Hvv7qEY', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Pbeb2mpXmh', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('jvfmj5uN6z', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('rQrxHYW8HX', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('KRm1At42Fk', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('2qjpAuHRoL', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('wmri4A5DDE', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('zBSNOMHOhb', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ZLAQmsrdB4', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('dUNI88MFdF', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('nsiAygUjP0', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('WEtDCXLpTv', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('qo3zqLJPhx', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('MpGj1R5jcg', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('9xEiRUCvyq', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('rNWOqcHj3u', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('3tyevrmUzV', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('QJeD4qRA0L', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Oq9cVw9ETH', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Ue9RosbA28', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('UMvHpdpiGT', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('x6pWOdW3tM', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ezUlZ1D9sq', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('f0NGSOa9VE', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ZItUOUdMlx', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('5F4oAZTAFL', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ckpWYO1eyD', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('8VAiUTbPXz', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('sy5CJ2h3qy', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('7ryTsxrQ92', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('E9ipDYELKB', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('CaBEAU63HD', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('vaZdhJBNDN', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('unhGV2Md1R', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('6kKLpt76Bw', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('hr8TTyVcSH', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('5064keykW2', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('nTRAlkgO8U', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('J0n9EQIFcH', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('5zm5kyhlle', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('MWbCMzP6WI', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ZR2fK55KOJ', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('EX5I3zIXUR', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('L1qRVqtxOv', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('cFYWxOlBIJ', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('d2ITLmTpCe', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('c6bQU098ph', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('jwKkmg9toV', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('kjgan30bpU', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('NXQ8XFDCwc', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('9duvm7Zp7E', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('DlM3kyzN8Q', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ITcRMs9ien', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('fUjjL9AL1E', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('xvjqaebYD7', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('nlVSym55tp', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('RpeZ2S0DiT', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('x8X8ubgNAA', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('2aKIjqx1LV', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('RutXjQt4J7', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('0htTSfnyin', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('hcpNDyqE6z', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('8ptFkKJJaN', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('NstbTB1z2L', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('zc8LEmrdeB', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('oPf9e6YDuJ', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('lO8l9cv6Al', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('vD5Y1YtHOl', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('VtoGKlzy2R', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('7oSPEoLn6J', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('2Y5NIdV563', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('sbQTx6hB2k', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Cewdkz31Jd', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('2mApM2I63q', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('K2nbUY5kzF', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('KMXeGZPEfw', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('XBM5il9BFn', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('BqSOpW6VQu', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('lJIteQRb6W', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('GxuHKlKCCc', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('EgP2faVtKj', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('JvnZ0T2F0X', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('894sEX4JIS', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('cID1mISoAD', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('zxL1MxYDYD', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('CtiL8LAcaJ', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('KTjjrKyJvI', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('GNVeFaH6zu', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('TBbi7G1hR2', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('I51mh5CGpI', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('DTCXJxWddK', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('p8oKVHvehT', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('kmEOXw25wx', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('heMfjBCVSO', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Ss1m88F9ru', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('fSUS2tSkY3', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('w4OvyrP2iA', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('HQ478FJCkr', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('1BCXmVwQEm', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('q8QtNQuLqm', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('rFNhPy3zQp', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('cyd2vP6Ih2', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('lRn4tMsLwj', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('BJ1fWkDbTd', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('zkPe06YjoF', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('K9oZVrpffN', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('lqvTBGY21u', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('TDQyugCzsD', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('vRgPzs08by', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('dKI6R2NgYP', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('0g5JbTjcib', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('llps9NKlEF', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('1SIOXWa4n0', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('GPpXiY7OeQ', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('dOeJ5tvoOc', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('STow0jGKiq', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('GKwZYwwWtQ', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('kG1cZLCjBl', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('eQ0jrR9wkL', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('0YrAZLV9Qn', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('5EFeIZKuy8', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('j2qLj5hnut', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('93InxmOMsb', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('VXOVVMJMtl', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('4CmDUqEUOv', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('EcGzu4BJ71', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('UBJY1YwRfy', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('QRLOBZWNRC', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('6BmzGi90y0', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('DgnCOgHqsk', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('VvwwEVjcta', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('pkjG8SCE49', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Bv3196PcW5', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('N5kmfGAweI', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('TTcGvHFact', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('l8DkfL8ny8', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('qzF7WqfcB5', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('rTz4LWwZDN', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('uUElTltETI', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('VwrGjfOxZJ', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('6mPm09qdsz', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('fAZWjq9mrn', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('CMH4x7nCBD', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('xQfP0JRAuv', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('RW0IzXaqmk', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('1WB7Jh17zN', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('8P7K1KkOW8', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('CzmHmBc7kn', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Dwo8uO4Lw6', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Lx2n11bRUe', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('5XGJOUxwb2', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('qy7oCNOmkM', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('l2OqqN6K5h', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('EdzdHhQe2l', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('1SgxZZmSOv', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Fz4DzW8B5e', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('Kb5agcHXCZ', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ooIR0C9gv3', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('fNP04AwSnI', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('FpgaV3owGu', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('SZjJKZZK3N', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('jcUusAeSf2', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('UkZ2TMHge8', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ppsoS3SKov', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('zzrIrMSJFu', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('8X9rROzNW8', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('gIGejiOQAA', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('HZytbmRG38', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('9JwlPNq2Ip', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('zGKfDZvMLa', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('IPm2Ao9LoM', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('n9YxQt1s7G', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('tyBBDVbCb5', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('D68cg7wiPv', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('lQY5eUf9nA', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('X3FD1ouOZY', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('MH8gl9jy7y', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('y6Iy5NfP8A', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ZDer2rMsAz', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('3xgUyfO75w', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('WQgdywgIOU', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('DDawO7JQ0h', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('WkNlJF4AQr', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('l5S2TAn0lb', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('unxcGj6C0X', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('LtwOyN0gme', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('tQ8ERnbHBQ', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('4GYOJ4RZke', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('7Fht6wni7u', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('0l5NnCleVv', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('ipD2RYPni4', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('COKZGtH46s', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('q0G0bT6u4W', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('J9ev2iVPiD', NULL, 0, NULL, NULL);
INSERT INTO QRCode (id, apelido, status, usuario_id, perfil_id) VALUES ('wkUFsUaJnu', NULL, 0, NULL, NULL);






-- Consultas de exemplo

SELECT * FROM QRCode;
SELECT * FROM Animal;
SELECT * FROM Usuario;
SELECT * FROM Objeto;
SELECT * FROM Pessoa;
DESCRIBE Usuario;
SELECT * FROM Perfil;
