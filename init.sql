DROP DATABASE IF EXISTS loja_db;
CREATE DATABASE loja_db;
USE loja_db;

CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(150) NOT NULL,
    modelo VARCHAR(150) NOT NULL,
    marca VARCHAR(150) NOT NULL,
    especificacoes VARCHAR(150) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    data_pedido DATE NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produto(id) ON DELETE CASCADE
);

INSERT INTO cliente (nome, email, data_cadastro) VALUES
('Ana Silva', 'ana.silva@email.com', '2026-01-15'),
('Bruno Costa', 'bruno.costa@email.com', '2026-02-10'),
('Carlos Souza', 'carlos.souza@email.com', '2026-03-01');

INSERT INTO produto (tipo, modelo, marca, preco, estoque, especificacoes) VALUES
('Periferico', 'Mouse Gamer G305', 'Logitech', 49.90, 15, 'Sem fio, 12000 DPI, 6 botões'),
('Periferico', 'Monitor" ', 'LG', 890.90, 8, 'LED, 19.5 polegadas, 1366x768'),
('Processador', 'Ryzen 5 5600', 'AMD', 799.90, 10, '6 núcleos, 12 threads, 3.5GHz'),
('Placa de Video', 'RTX 4060', 'NVIDIA', 1899.90, 5, '8GB GDDR6, PCIe 4.0');

-- Inserindo Pedidos
INSERT INTO pedido (id_cliente, id_produto, data_pedido, quantidade) VALUES
(1, 1, '2026-03-05', 1),
(1, 2, '2026-03-05', 2),
(2, 3, '2026-03-06', 1),
(1, 4, '2026-03-07', 1);