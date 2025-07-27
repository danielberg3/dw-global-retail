drop table if exists item_vendas;
drop table if exists vendas;
drop table if exists produto_fornecedor;
drop table if exists produto;
drop table if exists categoria_produto;
drop table if exists cliente;
drop table if exists categoria_cliente;
drop table if exists vendedor;
drop table if exists lojas;
drop table if exists localidade;
drop table if exists promocoes;
drop table if exists fornecedores;

create table localidade (
    id_localidade int primary key,
    cidade varchar(100),
    estado varchar(50),
    regiao varchar(50)
);

create table categoria_cliente (
    id_categoria_cliente int primary key,
    nome_categoria_cliente varchar(100)
);

create table categoria_produto (
    id_categoria_produto int primary key,
    nome_categoria_produto varchar(100)
);

create table vendedor (
    id_vendedor int primary key,
    nome_vendedor varchar(255)
);

create table lojas (
    id_loja int primary key,
    nome_loja varchar(150),
    gerente_loja varchar(255),
    cidade varchar(100),
    estado varchar(50)
);

create table promocoes (
    id_promocao int primary key,
    nome_promocao varchar(150),
    tipo_desconto varchar(50), -- ex: percentual, valor fixo
    data_inicio varchar(50), -- como varchar para permitir formatos inválidos
    data_fim varchar(50)
);

create table fornecedores (
    id_fornecedor int primary key,
    nome_fornecedor varchar(255),
    pais_origem varchar(100)
);

create table cliente (
    id_cliente int primary key,
    nome_cliente varchar(255),
    idade int,
    genero varchar(50),
    id_categoria_cliente int,
    id_localidade int
);

create table produto (
    id_produto int primary key,
    nome_produto varchar(255),
    id_categoria_produto int
);

create table produto_fornecedor (
    id_produto int,
    id_fornecedor int,
    custo_compra_unitario decimal(10, 2),
    primary key (id_produto, id_fornecedor)
);

create table vendas (
    id_venda int primary key,
    data_venda varchar(50), 
    id_vendedor int,
    id_cliente int,
    id_loja int,
    valor_total decimal(10, 2)
);

create table item_vendas (
    id_venda int,
    id_produto int,
    qtd_vendida int,
    preco_venda decimal(10, 2),
    id_promocao_aplicada int,
    primary key (id_venda, id_produto)
);
