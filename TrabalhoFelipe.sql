CREATE DATABASE suco;

USE suco;

CREATE TABLE Fornecedor (
nome VARCHAR(50), 
telefone VARCHAR(20),
endereco VARCHAR(100),
primary key(nome) );

CREATE TABLE Estoque (
IDSuco INT auto_increment,
quantidade INT,
nome VARCHAR(50),
primary key(IDSuco),
foreign key (nome) REFERENCES Fornecedor(nome) );

CREATE TABLE Vendedor (
IDMatricula INT auto_increment,
dataAdmissao DATE,
nome VARCHAR(50),
percentualComissao DOUBLE,
primary key(IDMatricula) );

CREATE TABLE Cliente (
CPF VARCHAR(11),
nome VARCHAR(50),
endereco VARCHAR(100),
sexo BIT(1),
dataNascimento DATE,
primary key(CPF) );

CREATE TABLE Produto (
IDProduto INT auto_increment,
tamanho INT,
sabor VARCHAR(20),
preco DOUBLE, 
nome VARCHAR(50),
IDMatricula INT,
CPF VARCHAR(11),
primary key (IDProduto),
foreign key(IDMatricula) REFERENCES Vendedor(IDMatricula),
foreign key(CPF) REFERENCES Cliente(CPF) ); 

CREATE TABLE Armazena (
IDArmazena INT auto_increment,
IDSuco INT,
IDProduto INT,
primary key(IDArmazena),
foreign key(IDSuco) REFERENCES Estoque(IDSuco),
foreign key(IDProduto) REFERENCES Produto(IDProduto) );

CREATE TABLE Promocao (
IDPromocao INT auto_increment,
descricao VARCHAR(50),
dataLimite DATE,
descontoAplicado DOUBLE,
IDMatricula INT,
primary key(IDPromocao),
foreign key(IDMatricula) REFERENCES Vendedor(IDMatricula) );

CREATE TABLE Aplica (
IDAplica INT auto_increment,
IDProduto INT,
IDPromocao INT,
primary key (IDAplica),
foreign key(IDProduto) REFERENCES Produto(IDProduto),
foreign key(IDPromocao) REFERENCES Promocao(IDPromocao) );

CREATE TABLE Pagamento (
IDPagamento INT auto_increment,
valor DOUBLE, 
forma VARCHAR(20),
dataPagamento DATE,
CPF VARCHAR(11),
primary key(IDPagamento),
foreign key(CPF) REFERENCES Cliente(CPF));

CREATE TABLE Entrega (
IDEntrega INT auto_increment,
dataEntrega DATE,
hora TIME, 
endereco VARCHAR(100),
CPF VARCHAR(11),
IDPagamento INT,
primary key(IDEntrega),
foreign key(CPF) REFERENCES Cliente(CPF),
foreign key(IDPagamento) REFERENCES Pagamento(IDPagamento) );

CREATE TABLE Comentario (
IDComentario INT auto_increment,
texto VARCHAR(100),
dataComentario DATE,
CPF VARCHAR(11),
primary key(IDComentario),
foreign key(CPF) REFERENCES Cliente(CPF) );

CREATE TABLE Pedido (
IDPedido INT auto_increment,
dataPedido DATE,
valor DOUBLE,
estado VARCHAR(20),
IDPagamento INT,
primary key(IDPedido),
foreign key(IDPagamento) REFERENCES Pagamento(IDPagamento) );

CREATE TABLE Adiciona (
IDAdiciona INT auto_increment,
IDProduto INT,
IDPedido INT,
primary key(IDAdiciona),
foreign key(IDProduto) REFERENCES Produto(IDProduto),
foreign key(IDPedido) REFERENCES Pedido(IDPedido) );

CREATE TABLE Leva (
IDLeva INT auto_increment,
IDEntrega INT,
IDPedido INT,
primary key(IDLeva),
foreign key(IDEntrega) REFERENCES Entrega(IDEntrega),
foreign key(IDPedido) REFERENCES Pedido(IDPedido) );









