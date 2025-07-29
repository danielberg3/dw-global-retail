CREATE TABLE dm_loja (
    id_loja INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    gerente VARCHAR(255),
    estado VARCHAR(100),
    cidade VARCHAR(100)
);

CREATE TABLE dm_promocao (
    id_promocao INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(100),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE dm_fornecedor (
    id_fornecedor INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    pais VARCHAR(100)
);

CREATE TABLE dm_produto (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    categoria VARCHAR(100)
);

CREATE TABLE dm_cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    idade INTEGER,
    genero VARCHAR(50),
    categoria VARCHAR(100)
);

CREATE TABLE dm_vendedor (
    id_vendedor INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE dm_cidade (
    id_cidade INT PRIMARY KEY,
    cidade VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE dm_estado (
    id_estado INT PRIMARY KEY,
    estado VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE dm_regiao (
    id_regiao INT PRIMARY KEY,
    regiao VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE fato_vendas (
    id_pedido INT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_loja INTEGER NOT NULL,
    id_promocao INTEGER,
    id_produto INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    id_vendedor INTEGER NOT NULL,
    id_cidade_cliente INTEGER,
    id_estado_cliente INTEGER,
    id_regiao_cliente INTEGER,
    data_venda DATE,
    quantidade_produtos INTEGER,
    preco_venda DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (id_loja) REFERENCES dm_loja(id_loja),
    FOREIGN KEY (id_promocao) REFERENCES dm_promocao(id_promocao),
    FOREIGN KEY (id_produto) REFERENCES dm_produto(id_produto),
    FOREIGN KEY (id_cliente) REFERENCES dm_cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES dm_vendedor(id_vendedor),
    FOREIGN KEY (id_cidade_cliente) REFERENCES dm_cidade(id_cidade),
    FOREIGN KEY (id_estado_cliente) REFERENCES dm_estado(id_estado),
    FOREIGN KEY (id_regiao_cliente) REFERENCES dm_regiao(id_regiao)
);

CREATE TABLE fato_fornecimento (
    id_produto INT NOT NULL,
    id_fornecedor INT NOT NULL,
    custo_compra_unitario DECIMAL(10, 2),

    PRIMARY KEY (id_produto, id_fornecedor),
    FOREIGN KEY (id_produto) REFERENCES dm_produto(id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES dm_fornecedor(id_fornecedor)
);