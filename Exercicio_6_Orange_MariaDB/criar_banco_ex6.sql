-- =============================================================
-- Exercicio 6 - Orange + MariaDB
-- Lista de Exercicios: Power BI e Orange Data Mining
--
-- OBS PARA O PROFESSOR: nao foi criado um banco de dados real para
-- esta atividade (a investigacao no Orange foi feita a partir dos CSVs
-- clientes_ex6.csv, produtos_ex6.csv e vendas_ex6.csv desta mesma pasta,
-- que contem exatamente os mesmos dados/erros deste script). Caso queira
-- conferir tudo em um banco MariaDB/MySQL do zero, basta executar este
-- arquivo (ex.: `mysql -u usuario -p < criar_banco_ex6.sql`) que ele cria
-- o banco, as tabelas e insere todos os registros, ja incluindo de forma
-- proposital os problemas de qualidade pedidos no exercicio (dados vazios,
-- valores invalidos, duplicidades e inconsistencias).
-- =============================================================

CREATE DATABASE IF NOT EXISTS atv_orange_mariadb;
USE atv_orange_mariadb;

DROP TABLE IF EXISTS vendas;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome       VARCHAR(100),
    idade      INT,
    cidade     VARCHAR(100),
    estado     VARCHAR(2)
);

CREATE TABLE produtos (
    id_produto   INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    categoria    VARCHAR(50),
    preco        DECIMAL(10,2)
);

CREATE TABLE vendas (
    id_venda     INT PRIMARY KEY,
    id_cliente   INT,
    id_produto   INT,
    quantidade   INT,
    data_venda   DATE,
    valor_total  DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Observacao: FOREIGN KEY para clientes/produtos duplicados aponta para
-- o registro copiado (id novo), o que e proposital: a duplicidade esta nos
-- dados de clientes/produtos, nao na integridade referencial das vendas.

-- --------------------------------------------------------------
-- CLIENTES (contem dados vazios, invalidos e duplicados)
-- --------------------------------------------------------------
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (1, 'Katia Ribeiro', 50, 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (2, 'Hugo Cardoso', 57, 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (3, 'Nelson Monteiro', 53, 'Brasilia', 'DF');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (4, 'Yasmin Monteiro', 46, 'Recife', 'PE');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (5, 'Ana Cardoso', 23, 'Curitiba', 'PR');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (6, 'Joao Santos', 46, 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (7, 'Vinicius Rocha', NULL, 'Sao Paulo', 'SP');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (8, 'Gabriela Carvalho', 34, 'Salvador', 'BA');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (9, 'Lucas Carvalho', 65, 'Salvador', 'BA');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (10, 'Ursula Oliveira', 64, NULL, 'DF');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (11, 'Carla Alves', 52, 'Salvador', 'BA');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (12, 'Joao Martins', NULL, 'Porto Alegre', 'RS');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (13, 'Joao Silva', 72, 'Manaus', 'AM');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (14, 'Lucas Martins', 45, 'Salvador', 'BA');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (15, 'Mariana Monteiro', 53, 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (16, 'Diego Gomes', 50, 'Recife', 'PE');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (17, 'Pedro Carvalho', -8, 'Manaus', 'AM');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (18, 'Nelson Monteiro', 48, NULL, 'RS');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (19, 'Queila Silva', 210, 'Brasilia', 'DF');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (20, 'Yasmin Pereira', 70, 'Curitiba', 'PR');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (21, 'Wesley Ribeiro', 74, 'Sao Paulo', 'SP');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (22, 'Wesley Cardoso', 45, 'Rio de Janeiro', 'RJ');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (23, 'Elaine Rocha', 74, 'Recife', 'PE');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (24, 'Diego Martins', 61, 'Curitiba', 'PR');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (25, 'Wesley Alves', 34, NULL, 'PE');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (26, 'Mariana Lima', 53, 'Brasilia', 'DF');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (27, 'Wesley Rocha', 69, 'Brasilia', 'XX');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (28, 'Nelson Rodrigues', 36, 'Fortaleza', 'CE');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (29, 'Ana Souza', 27, 'Porto Alegre', 'RS');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (30, 'Olivia Ribeiro', NULL, 'Manaus', 'AM');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (31, 'Wesley Rocha', 69, 'Brasilia', 'XX');
INSERT INTO clientes (id_cliente, nome, idade, cidade, estado) VALUES (32, 'Diego Gomes', 50, 'Recife', 'PE');

-- --------------------------------------------------------------
-- PRODUTOS (contem dado vazio e valor invalido)
-- --------------------------------------------------------------
INSERT INTO produtos (id_produto, nome_produto, categoria, preco) VALUES (1, 'Fone de Ouvido', 'Eletronicos', 649.25);
INSERT INTO produtos (id_produto, nome_produto, categoria, preco) VALUES (2, 'Camiseta Basica', 'Vestuario', 452.9);
INSERT INTO produtos (id_produto, nome_produto, categoria, preco) VALUES (3, 'Cafe Premium', NULL, 727.2);
INSERT INTO produtos (id_produto, nome_produto, categoria, preco) VALUES (4, 'Livro Ficcao', 'Livros', 667.65);
INSERT INTO produtos (id_produto, nome_produto, categoria, preco) VALUES (5, 'Vaso Decorativo', 'Casa e Jardim', 263.58);
INSERT INTO produtos (id_produto, nome_produto, categoria, preco) VALUES (6, 'Mouse sem Fio', 'Eletronicos', 734.7);
INSERT INTO produtos (id_produto, nome_produto, categoria, preco) VALUES (7, 'Calca Jeans', 'Vestuario', 92.22);
INSERT INTO produtos (id_produto, nome_produto, categoria, preco) VALUES (8, 'Chocolate Meio Amargo', 'Alimentos', -50.0);
INSERT INTO produtos (id_produto, nome_produto, categoria, preco) VALUES (9, 'Livro Tecnico', 'Livros', 631.29);
INSERT INTO produtos (id_produto, nome_produto, categoria, preco) VALUES (10, 'Jogo de Panelas', 'Casa e Jardim', 419.41);

-- --------------------------------------------------------------
-- VENDAS (contem dados vazios, invalidos, inconsistentes e duplicados)
-- --------------------------------------------------------------
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (1, 28, 8, 1, '2026-11-09', 0.0);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (2, 32, 6, 1, '2026-04-24', 734.7);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (3, 27, 3, NULL, '2026-01-03', 2908.8);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (4, 1, 8, 5, '2026-09-27', 0.0);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (5, 6, 10, 2, '2026-04-04', 838.82);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (6, 3, 9, 3, '2026-11-25', 1893.87);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (7, 23, 3, 1, '2026-06-22', 727.2);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (8, 32, 3, 5, '2026-04-16', 3636.0);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (9, 9, 10, 5, '2026-05-03', 2097.05);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (10, 27, 3, 2, '2026-10-10', 1454.4);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (11, 27, 7, 2, '2026-09-26', 184.44);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (12, 13, 7, 1, '2026-02-13', 92.22);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (13, 5, 1, 3, '2026-11-12', 1947.75);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (14, 2, 1, 5, '2026-08-11', 3246.25);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (15, 20, 8, 3, '2026-02-16', 0.0);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (16, 30, 10, 5, '2026-03-05', 2097.05);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (17, 14, 7, 5, '2026-06-15', 461.1);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (18, 15, 2, 5, '2026-07-02', 2264.5);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (19, 13, 3, 1, '2026-11-18', 727.2);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (20, 4, 8, 2, '2026-08-23', 0.0);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (21, 2, 3, 5, '2026-04-26', 3636.0);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (22, 9, 3, 2, '2026-07-09', 1454.4);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (23, 28, 9, 4, '2026-02-13', 2525.16);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (24, 20, 3, 3, '2026-03-09', 2181.6);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (25, 30, 8, 4, '2026-05-15', 0.0);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (26, 12, 6, 5, '2026-08-15', 4251.41);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (27, 8, 9, NULL, '2026-05-27', 3156.45);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (28, 7, 4, 2, '2026-01-03', 1335.3);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (29, 30, 6, 4, '2026-09-26', 2938.8);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (30, 12, 1, 3, '2026-03-12', 1947.75);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (31, 14, 2, 5, '2026-12-09', 2264.5);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (32, 14, 10, 3, '2026-10-09', 1258.23);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (33, 9, 2, 3, '2026-02-14', 1358.7);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (34, 11, 2, 1, '2026-06-24', 452.9);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (35, 12, 2, NULL, '2026-06-09', 2264.5);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (36, 5, 5, 3, '2026-03-09', 790.74);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (37, 17, 2, 1, '2026-07-28', 452.9);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (38, 17, 7, 1, '2026-01-04', 92.22);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (39, 16, 1, -1, '2026-02-04', 1947.75);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (40, 23, 6, 4, '2026-10-21', 2938.8);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (41, 3, 7, 3, '2026-10-07', 276.66);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (42, 30, 7, NULL, '2026-11-12', 92.22);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (43, 17, 7, 3, '2026-06-02', 276.66);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (44, 28, 1, 3, '2026-12-11', 1947.75);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (45, 19, 2, 3, '2026-07-11', 1358.7);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (46, 2, 9, 3, '2026-04-18', 1893.87);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (47, 4, 2, 2, '2026-10-04', 905.8);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (48, 8, 1, 2, '2026-09-12', 1298.5);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (49, 20, 1, 4, '2026-10-05', 2597.0);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (50, 23, 7, 4, '2026-07-08', 368.88);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (51, 27, 4, 2, '2026-03-18', 1335.3);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (52, 2, 9, 5, '2026-07-09', 3156.45);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (53, 10, 4, 1, '2026-01-09', 667.65);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (54, 31, 7, 3, '2026-06-05', 276.66);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (55, 6, 3, 5, '2026-01-21', 3636.0);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (56, 17, 6, 5, '2026-12-11', 3673.5);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (57, 4, 1, 2, '2026-08-02', 1298.5);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (58, 15, 9, 2, '2026-12-28', 1262.58);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (59, 26, 6, 2, '2026-09-27', 1469.4);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (60, 18, 6, 2, '2026-06-12', 1469.4);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (61, 30, 8, 5, '2026-08-26', 0.0);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (62, 20, 4, 2, '2026-11-14', 1335.3);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (63, 10, 8, -5, '2026-06-27', 0.0);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (64, 27, 1, 2, '2026-02-10', 1298.5);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (65, 24, 9, 3, '2026-03-23', 1893.87);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (66, 7, 1, 5, '2026-04-28', 3246.25);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (67, 20, 10, 1, '2026-07-13', 419.41);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (68, 11, 9, 1, '2026-02-05', 631.29);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (69, 25, 6, 5, '2026-05-10', 3673.5);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (70, 3, 10, -3, '2026-03-10', 838.82);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (71, 19, 9, 3, '2026-06-05', 1893.87);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (72, 25, 4, 1, '2026-10-21', 667.65);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (73, 31, 7, 3, '2026-09-06', 276.66);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (74, 2, 3, 3, '2026-09-05', 2181.6);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (75, 11, 1, 1, '2026-09-22', 649.25);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (76, 1, 6, 1, '2026-06-10', 1720.86);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (77, 14, 9, 2, '2026-10-20', 1262.58);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (78, 16, 3, 1, '2026-06-16', 727.2);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (79, 7, 2, 4, '2026-05-20', 2696.07);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (80, 20, 2, 3, '2026-08-16', 1358.7);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (81, 8, 9, 5, '2026-04-27', 3156.45);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (82, 23, 8, 5, '2026-06-03', 0.0);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (83, 5, 2, 4, '2026-05-09', 1811.6);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (84, 15, 3, 3, '2026-07-17', 2181.6);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (85, 22, 6, 4, '2026-07-11', 2938.8);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (86, 12, 4, 4, '2026-04-28', 2670.6);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (87, 23, 6, 4, '2026-10-13', 2938.8);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (88, 14, 3, 4, '2026-12-19', 2908.8);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (89, 9, 7, 3, '2026-06-27', 276.66);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (90, 8, 6, 3, '2026-08-09', 2204.1);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (91, 10, 9, 3, '2026-04-11', 1893.87);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (92, 10, 9, 1, '2026-05-10', 631.29);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (93, 30, 7, 4, '2026-01-18', 368.88);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (94, 22, 7, 3, '2026-02-22', 276.66);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (95, 32, 9, 5, '2026-04-14', 3156.45);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (96, 23, 6, 1, '2026-07-24', 1725.99);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (97, 12, 1, 3, '2026-09-23', 1947.75);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (98, 17, 3, 3, '2026-10-21', 2181.6);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (99, 27, 8, 4, '2026-06-01', 0.0);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (100, 3, 4, NULL, '2026-11-28', 667.65);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (101, 7, 1, 5, '2026-04-28', 3246.25);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (102, 30, 6, 4, '2026-09-26', 2938.8);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (103, 22, 6, 4, '2026-07-11', 2938.8);
INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, valor_total) VALUES (104, 22, 7, 3, '2026-02-22', 276.66);
