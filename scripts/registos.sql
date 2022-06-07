/*
TeSP_PSI_2122_CDBD
Escola de condução 'IPLDrive'
Marco António Fragoso Padeiro, estudante n.º 2211868
Tomás Martins Moura, estudante n.º 2211866
*/
-- Para comandos de inserção de dados na base de dados


INSERT INTO instituicoes (localizacao, nome, abreviatura, telefone, email) 
VALUES 
('Leiria', 'Escola Superior de Educação e Ciências Sociais','ESECS', '244829400','esecs@ipleiria.pt'),
('Leiria', 'Escola Superior de Tecnologia e Gestão','ESTG', '244820300','estg@ipleiria.pt'),
('Caldas da Rainha', 'Escola Superior de Artes e Design','ESAD.CR', '262830900','esad@ipleiria.pt'),
('Peniche', 'Escola Superior de Turismo e Tecnologia do Mar','ESTM', '262783607','estm@ipleiria.pt'),
('Leiria', 'Escola Superior de Saude de Leiria','ESSLei', '244845300','esslei@ipleiria.pt');

INSERT INTO pessoas (id, codPostal, localidade, rua, dtaNasc, telefone, genero, NIF, email, pNome, apelido)
VALUES 
(1, '2460-612', 'Alcobaça', 'Rua de Leiria', '1990-09-24', '918221123', 'Feminino', '312332457', 'ab2000@hotmail.com', 'Maria', 'Fonseca'),
(2, '2460-023', 'Alcobaça', 'Rua Joaquim das Dores', '1970-12-04', '91777589', 'Masculino', '332210022', 'joaopedro2002@gmail.com', 'João', 'Pedro'),
(3, '2400-123', 'Leiria', 'Rua Joaquim Mones', '1978-02-28', '919191919', 'Feminino', '311313313', 'albertinamaia@gmail.com', 'Albertina', 'Maia'),
(4, '2400-144', 'Leiria', 'Rua Alberto da fonte', '1984-05-30', '911111119', 'Masculino', '312322157', 'franciscoaha@hotmail.com', 'Francisco', 'Palha'),
(5, '2400-078', 'Leiria', 'Rua Júlio Diniz', '1974-02-01', '910000019', 'Masculino', '109901109', 'lmsilva78@gmail.com', 'Luís', 'Silva'),
(6, '2400-108', 'Leiria', 'Rua António Vieira', '2002-04-16', '926408246', 'Masculino', '939393939', 'rodrigonçalve5@hotmail.com', 'Rodrigo', 'Gonçalves'),
(7, '2400-666', 'Leiria', 'Rua Bartolomeu Dias', '2001-06-16', '916916916', 'Feminino', '619916169', 'sofcasilhas@gmail.com', 'Sofia', 'Casilhas'),
(8, '2400-004', 'Leiria', 'Rua Maria Joana', '2000-10-10', '910101019', 'Feminino', '100100100', 'fidalgo10@gmail.com', 'Joana', 'Fidalgo'),
(9, '2520-205', 'Peniche', 'Rua José o Pescador', '2001-05-05', '915519915', 'Masculino', '105105105', 'danielmoreira@hotmail.com', 'Daniel', 'Moreira'),
(10, '2520-202', 'Peniche', 'Rua Mateus Gouveia', '2002-02-02', '912021201', 'Feminino', '212000212', 'carolinasous02@sapo.pt', 'Carolina', 'Sousa'),
(11, '2500-055', 'Caldas da Rainha', 'Rua Maria Assunção', '2001-01-15', '915555519', 'Feminino', '501105501', 'ritamarquz@gmail.com', 'Rita', 'Marquês');

INSERT INTO categorias (nome) VALUES
('AM'), ('A1'), ('A2'), ('A'), ('B1'), ('B'), ('C1'), ('C'), ('D1'), ('D'), ('BE'), ('C1E'), ('CE'), ('D1E'), ('DE'), ('T');

INSERT INTO instrutores (id_pessoa,posicaoEmp, salario,id_instituicao)
VALUES (3,'Funcionario', 943.30, 2),
(2,'Funcionario', 835.14, 5),
(1,'Funcionario', 789.40, 1),
(4,'Chefe', 1608.75, 3),
(5,'Funcionario', 743.80, 4);

INSERT INTO categoriasInstrutores(id_instrutor, id_categoria) VALUES
(3, 14), (3, 15), (3,4), (3,16),
(2, 5), (2, 6), (2,4), (2,8),
(1, 2), (1, 1), (1,10), (1,9),
(4, 1), (4, 2), (4,3), (4,4),
(5, 6), (5, 5), (5,7), (5,8);

INSERT INTO alunos (id_pessoa, estadoPag, estadoCod, id_instrutor, id_categoria)
VALUES (6, 'pagou', 'passou', 2, 4),
(7, 'pagou', 'chumbou', 3, 6),
(8, 'pagou', 'passou', 2, 6),
(9, 'por pagar', 'por fazer', 1, 6),
(10, 'pagou', 'por fazer', 4, 10),
(11, 'pagou', 'passou', 5, 6);

INSERT INTO marcas (nome)
VALUES 
('Renault'),('Citroen'),('Peugeot'),('Audi'),('Opel'),
('Toyota'),('Yamaha'),('Suzuki'),('Kawasaki'),('mercedes'),('Volvo');

INSERT INTO modelos (nome, id_marca)
VALUES ('megane', 1), ('clio', 1), ('C1', 2), ('DS3', 2), ('208', 3), ('308', 3),
('A1', 4),('A4', 4),('Corsa', 5),('Adam', 5),('Supra', 6),('ybr', 7),('r1',7),('Burgman',8),
('gsxr',8),('kdx',9),('h2r',9),('Axor',10),('FM FURGONE',11);

INSERT INTO veiculos (seguro, avaria, nKilometros, combustivel, consumo, anoVeiculo, matricula, proximaManutencao, ultimaManutencao, id_instituicao,id_modelo, id_categoria)
VALUES 
(TRUE, FALSE, 130000, 'Gasóleo', 7.9, 2015, 'HI-AD-21', '2023-04-03', '2021-04-03', 1, 1, 6),
(TRUE, FALSE, 130000, 'Gasóleo', 6.7, 2015, 'AS-FF-99', '2023-02-04', '2021-02-04', 2, 1, 6),
(FALSE, FALSE, 280000, 'Gasolina', 10.2, 2015, 'HA-FS-32', '2023-02-15', '2021-02-15', 2, 2, 6),
(FALSE, TRUE, 80000, 'Elétrico', 0.0, 2021, 'GA-AS-51', '2025-04-30', '2021-04-03', 3, 2, 6),
(TRUE, FALSE, 100000, 'Gasóleo', 7.5, 2014, 'GS-XD-52', '2022-12-21', '2020-12-21', 3, 3, 6),
(TRUE, TRUE, 160000, 'Gás', 9.2, 2001, 'HI-AD-53', '2022-11-12', '2021-11-12', 4, 3, 6),
(FALSE, FALSE, 130000, 'Gasolina', 5.4, 2018, 'HI-AD-62', '2024-03-01', '2022-03-01', 4, 4, 6),
(TRUE, FALSE, 130000, 'Gasolina', 7.2, 2002, 'HI-AD-12', '2022-08-12', '2021-08-12', 2, 4, 6),
(TRUE, FALSE, 130000, 'Gasóleo', 6.9, 2003, 'GI-12-HH', '2022-10-31', '2021-10-31', 1, 5, 6),
(FALSE, FALSE, 130000, 'Gasóleo', 8.2, 2009, 'GG-41-LL', '2023-01-30', '2022-01-30', 4, 5, 6),
(TRUE, FALSE, 160000, 'Gasolina', 30.8, 1998, 'WW-51-AQ', '2022-09-21', '2021-09-21', 5, 6, 6),
(TRUE, TRUE, 3000, 'Gasolina', 2.1, 1990, 'HA-52-BA', '2023-04-16', '2022-04-16', 5, 7, 6),
(TRUE, TRUE, 6500, 'Gasolina', 19.2, 2016, 'HA-11-31', '2023-02-05', '2022-02-05', 2, 7, 6),
(TRUE, FALSE, 5300, 'Gasolina', 4.3, 1993, 'TE-77-BE', '2023-03-18', '2022-03-18', 3, 8, 6),
(TRUE, FALSE, 5100, 'Gasolina', 20.4, 2017, 'HA-45-TT', '2023-03-27', '2022-03-27', 3, 8, 6),
(TRUE, FALSE, 5000, 'Gasolina', 4.6, 1998, 'YW-22-AA', '2022-07-17', '2021-07-17', 2, 9, 6),
(TRUE, FALSE, 5890, 'Gasolina', 25.9, 2018, 'WA-YT-12', '2022-08-24', '2021-08-24', 4, 10, 3),
(FALSE, FALSE, 90000, 'Gasóleo', 18.5, 2003, 'HI-AD-21', '2023-01-20', '2022-01-20', 4, 10, 3),
(TRUE, FALSE, 50000, 'Gasóleo', 19.2, 1998, 'HI-AD-21', '2022-11-10', '2021-11-10', 5, 11, 4);


INSERT INTO aulas (dtaInicio, dtaFim, id_aluno, id_veiculo)
VALUES 
('2022-01-19 10:10:50', '2022-01-19 10:40:50', 6, 19),                   -- Categoria A - ID 4             
('2022-01-20 11:04:50', '2022-01-20 11:34:34', 6, 19),                   -- Categoria A - ID 4             
('2022-01-25 19:14:50', '2022-01-25 19:44:50', 6, 19),                   -- Categoria A - ID 4             
('2022-01-31 10:23:12', '2022-01-31 10:53:12', 6, 19),                   -- Categoria A - ID 4             
('2022-02-14 12:41:21', '2022-02-14 13:11:21', 6, 19),                   -- Categoria A - ID 4             
('2022-02-21 15:32:01', '2022-02-21 16:02:01', 6, 19),                   -- Categoria A - ID 4             
('2022-02-27 09:13:56', '2022-02-19 09:43:56', 6, 19),                   -- Categoria A - ID 4             
('2022-03-04 17:59:42', '2022-03-04 18:29:42', 6, 19),                   -- Categoria A - ID 4             
('2022-03-07 14:12:57', '2022-03-07 14:42:57', 6, 19),                   -- Categoria A - ID 4             
('2022-03-12 19:28:31', '2022-03-12 19:58:31', 6, 19),                   -- Categoria A - ID 4             
('2022-03-19 17:37:20', '2022-03-19 18:07:20', 6, 19),                   -- Categoria A - ID 4             

('2020-06-21 09:03:24', '2020-06-21 09:33:24', 8, 3),                    -- Categoria B - ID 6
('2020-06-24 12:07:34', '2020-06-24 12:37:34', 8, 3),                    -- Categoria B - ID 6
('2020-06-29 11:58:49', '2020-06-29 12:28:49', 8, 3),                    -- Categoria B - ID 6
('2020-07-01 18:53:55', '2020-07-01 19:23:55', 8, 3),                    -- Categoria B - ID 6
('2020-07-05 15:02:18', '2020-07-05 15:32:18', 8, 3),                    -- Categoria B - ID 6
('2020-07-09 14:19:37', '2020-07-09 14:49:37', 8, 3),                    -- Categoria B - ID 6
('2020-07-12 09:13:11', '2020-07-12 09:43:11', 8, 3),                    -- Categoria B - ID 6
('2020-07-21 11:03:29', '2020-07-21 11:33:29', 8, 3),                    -- Categoria B - ID 6
('2020-07-30 10:24:10', '2020-07-30 10:54:10', 8, 3),                    -- Categoria B - ID 6
('2020-08-09 17:39:52', '2020-08-09 18:09:52', 8, 3),                    -- Categoria B - ID 6
('2020-08-14 13:53:45', '2020-08-14 14:23:45', 8, 3),                    -- Categoria B - ID 6
('2020-08-17 16:29:24', '2020-08-17 16:59:24', 8, 3),                    -- Categoria B - ID 6

('2017-04-17 09:51:54', '2017-04-17 10:21:54', 11, 7),                    -- Categoria B - ID 6
('2017-04-19 10:49:49', '2017-04-17 11:19:49', 11, 7),                    -- Categoria B - ID 6
('2017-04-24 10:52:19', '2017-04-24 11:22:19', 11, 7),                    -- Categoria B - ID 6
('2017-04-27 11:53:07', '2017-04-27 12:23:07', 11, 7),                    -- Categoria B - ID 6
('2017-04-28 10:30:23', '2017-04-28 11:00:23', 11, 7),                    -- Categoria B - ID 6
('2017-05-01 11:21:44', '2017-05-01 11:51:44', 11, 7),                    -- Categoria B - ID 6
('2017-05-09 09:13:12', '2017-05-09 09:43:12', 11, 7),                    -- Categoria B - ID 6
('2017-05-11 12:19:20', '2017-05-11 12:49:20', 11, 7),                    -- Categoria B - ID 6
('2017-05-17 18:04:29', '2017-05-17 18:34:29', 11, 7),                    -- Categoria B - ID 6
('2017-05-24 19:03:28', '2017-05-24 19:33:28', 11, 7),                    -- Categoria B - ID 6
('2017-05-28 17:38:45', '2017-05-28 18:08:45', 11, 7),                    -- Categoria B - ID 6
('2017-05-31 16:45:52', '2017-05-31 17:15:52', 11, 7),                    -- Categoria B - ID 6
('2017-06-04 09:41:11', '2017-06-04 10:11:11', 11, 7),                    -- Categoria B - ID 6
('2017-06-10 11:54:14', '2017-06-10 12:24:14', 11, 7),                    -- Categoria B - ID 6
('2017-06-12 14:22:34', '2017-06-12 14:52:34', 11, 7),                    -- Categoria B - ID 6
('2017-06-13 13:29:32', '2017-06-13 14:59:32', 11, 7),                    -- Categoria B - ID 6
('2017-06-17 09:14:10', '2017-06-17 09:44:10', 11, 7),                    -- Categoria B - ID 6
('2017-06-18 09:20:59', '2017-06-18 09:50:59', 11, 7);                    -- Categoria B - ID 6


INSERT INTO exames (dtaInicio, dtaFim, estado, id_aluno, id_veiculo)
VALUES 
('2022-09-01 10:01:03', '2021-12-01 10:45:21', 'por fazer', 7, 9),          -- Categoria B - ID 6
('2022-08-12 09:03:24', '2020-02-12 09:45:22', 'por fazer', 9, 7),          -- Categoria B - ID 6
('2022-12-11 11:06:21', '2021-02-28 11:52:00', 'por fazer', 10, 18),       -- Categoria D - ID 10
('2020-08-28 08:34:11', '2020-08-28 09:10:00', 'passou',8, 3),          -- Categoria B - ID 6
('2022-03-31 09:20:59', '2022-03-31 10:02:53', 'passou',6, 19),      -- Categoria A - ID 4
('2017-07-11 09:20:39', '2017-07-11 10:02:53', 'passou', 11, 19),      -- Categoria A - ID 4
('2017-06-23 11:32:11', '2017-06-23 12:12:53', 'chumbou', 11, 19);      -- Categoria A - ID 4








