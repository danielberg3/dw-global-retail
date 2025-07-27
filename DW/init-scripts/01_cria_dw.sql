CREATE TABLE dm_loja (
    id PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    gerente VARCHAR(255)
);

CREATE TABLE dm_promocao (
    id PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(100),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE dm_fornecedor (
    id PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    pais VARCHAR(100)
);

CREATE TABLE dm_produto (
    id PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    categoria VARCHAR(100),
    preco_fornecimento DECIMAL(10, 2)
);

CREATE TABLE dm_cliente (
    id PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    idade INTEGER,
    genero VARCHAR(50),
    categoria VARCHAR(100)
);

CREATE TABLE dm_vendedor (
    id PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE dm_cidade (
    id PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE dm_estado (
    id PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE dm_regiao (
    id PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE fato_vendas (
    id_pedido PRIMARY KEY,
    id_loja INTEGER NOT NULL,
    id_cidade_loja INTEGER NOT NULL,
    id_estado_loja INTEGER NOT NULL,
    id_promocao INTEGER,
    id_fornecedor INTEGER,
    id_produto INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    id_vendedor INTEGER NOT NULL,
    id_cidade_cliente INTEGER,
    id_estado_cliente INTEGER,
    id_regiao_cliente INTEGER,
    data_venda DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    quantidade_produtos INTEGER NOT NULL,

    -- Chaves Estrangeiras
    FOREIGN KEY (id_loja) REFERENCES dm_loja(id),
    FOREIGN KEY (id_cidade_loja) REFERENCES dm_cidade(id),
    FOREIGN KEY (id_estado_loja) REFERENCES dm_estado(id),
    FOREIGN KEY (id_promocao) REFERENCES dm_promocao(id),
    FOREIGN KEY (id_fornecedor) REFERENCES dm_fornecedor(id),
    FOREIGN KEY (id_produto) REFERENCES dm_produto(id),
    FOREIGN KEY (id_cliente) REFERENCES dm_cliente(id),
    FOREIGN KEY (id_vendedor) REFERENCES dm_vendedor(id),
    FOREIGN KEY (id_cidade_cliente) REFERENCES dm_cidade(id),
    FOREIGN KEY (id_estado_cliente) REFERENCES dm_estado(id),
    FOREIGN KEY (id_regiao_cliente) REFERENCES dm_regiao(id)
);