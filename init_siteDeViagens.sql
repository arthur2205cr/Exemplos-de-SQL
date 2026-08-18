
DROP DATABASE IF EXISTS site_viagem_db;
CREATE DATABASE site_viagem_db;
USE site_viagem_db;


CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE destino (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cidade VARCHAR(150) NOT NULL,
    estado VARCHAR(100),
    pais VARCHAR(100) NOT NULL,
    continente VARCHAR(100) NOT NULL
);

CREATE TABLE pacote_viagem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_destino INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_ida DATE NOT NULL,
    data_volta DATE NOT NULL,
    duracao INT NOT NULL,
    local_saida VARCHAR(150) NOT NULL,
    limite_pessoas_por_compra INT NOT NULL,
    FOREIGN KEY (id_destino) REFERENCES destino(id) ON DELETE CASCADE
);

CREATE TABLE compra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_pacote_viagem INT NOT NULL,
    quantidade_pessoas INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON DELETE CASCADE,
    FOREIGN KEY (id_pacote_viagem) REFERENCES pacote_viagem(id) ON DELETE CASCADE
);

INSERT INTO cliente (nome, email, data_cadastro) VALUES
('Arthur Castro', 25, 'arthur@email.com', '2026-01-15'),
('Mariana Silva', 31, 'mariana@email.com', '2026-02-03'),
('Joao Oliveira', 42, 'joao@email.com', '2026-02-18'),
('Beatriz Santos', 27, 'beatriz@email.com', '2026-03-10'),
('Carlos Mendes', 36, 'carlos@email.com', '2026-03-22');

INSERT INTO destino (cidade, estado, pais, continente, local_saida) VALUES
('Paris', NULL, 'Franca', 'Europa', 'Belo Horizonte'),
('Buenos Aires', NULL, 'Argentina', 'America do Sul', 'Sao Paulo'),
('Roma', NULL, 'Italia', 'Europa', 'Rio de Janeiro'),
('Cancun', 'Quintana Roo', 'Mexico', 'America do Norte', 'Belo Horizonte'),
('Lisboa', NULL, 'Portugal', 'Europa', 'Sao Paulo');

INSERT INTO pacote_viagem (nome, id_destino, valor, data_ida, data_volta, duracao) VALUES
('Paris Economico', 1, 4500.00, '2026-09-10', '2026-09-17', 7),
('Buenos Aires Gastronomico', 2, 2800.00, '2026-10-05', '2026-10-10', 5),
('Roma Historica', 3, 5200.00, '2026-11-12', '2026-11-20', 8),
('Cancun All Inclusive', 4, 6800.00, '2026-12-01', '2026-12-08', 7),
('Lisboa Cultural', 5, 3900.00, '2027-01-15', '2027-01-22', 7);

INSERT INTO compra (id_cliente, id_pacote_viagem, quantidade_pessoas) VALUES
(1, 1, 2),
(2, 3, 1),
(3, 2, 4),
(4, 5, 2),
(5, 4, 3),
(1, 5, 1),
(2, 1, 2);