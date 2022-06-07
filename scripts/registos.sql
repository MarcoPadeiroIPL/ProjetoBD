/*
TeSP_PSI_2122_CDBD
Escola de condução 'IPLDrive'
Marco António Fragoso Padeiro, estudante n.º 2211868
Tomás Martins Moura, estudante n.º 2211866
*/
-- Para comandos de inserção de dados na base de dados

INSERT INTO instituicoes (localizacao, nome, abreviatura, telefone, email) 
VALUES ('Leiria', 'Escola Superior de Educação e Ciências Sociais','ESECS', '244829400','esecs@ipleiria.pt'),
('Leiria', 'Escola Superior de Tecnologia e Gestão','ESTG', '244820300','estg@ipleiria.pt'),
('Caldas da Rainha', 'Escola Superior de Artes e Design','ESAD.CR', '262830900','esad@ipleiria.pt'),
('Peniche', 'Escola Superior de Turismo e Tecnologia do Mar','ESTM', '262783607','estm@ipleiria.pt'),
('Leiria', 'Escola Superior de Saude de Leiria','ESSLei', '244845300','esslei@ipleiria.pt'));

INSERT INTO pessoas (codPostal, localidade, rua, dtaNasc, telefone, genero, NIF, email, pNome, apelido)
VALUES ('2460-612', 'Alcobaça', 'Rua de Leiria', '24-09-1990', '918221123', 'Feminino', '312332457', 'ab2000@hotmail.com', 'Maria', 'Fonseca'),
('2460-023', 'Alcobaça', 'Rua Joaquim das Dores', '04-12-1970', '91777589', 'Masculino', '332210022', 'joaopedro2002@gmail.com', 'João', 'Pedro'),
('2400-123', 'Leiria', 'Rua Joaquim Mones', '29-02-1978', '919191919', 'Feminino', '311313313', 'albertinamaia@gmail.com', 'Albertina', 'Maia'),
('2400-144', 'Leiria', 'Rua Alberto da fonte', '30-05-1984', '911111119', 'Masculino', '312322157', 'franciscoaha@hotmail.com', 'Francisco', 'Palha'),
('2400-078', 'Leiria', 'Rua Júlio Diniz', '01-02-1974', '910000019', 'Masculino', '109901109', 'lmsilva78@gmail.com', 'Luís', 'Silva'),
('2400-108', 'Leiria', 'Rua António Vieira', '16-04-2002', '926408246', 'Masculino', '939393939', 'rodrigonçalve5@hotmail.com', 'Rodrigo', 'Gonçalves'),
('2400-666', 'Leiria', 'Rua Bartolomeu Dias', '16-06-2001', '916916916', 'Feminino', '619916169', 'sofcasilhas@gmail.com', 'Sofia', 'Casilhas'),
('2400-004', 'Leiria', 'Rua Maria Joana', '10-10-2000', '910101019', 'Feminino', '100100100', 'fidalgo10@gmail.com', 'Joana', 'Fidalgo'),
('2520-205', 'Peniche', 'Rua José o Pescador', '05-05-2001', '915519915', 'Masculino', '105105105', 'danielmoreira@hotmail.com', 'Daniel', 'Moreira'),
('2520-202', 'Peniche', 'Rua Mateus Gouveia', '02-02-2002', '912021201', 'Feminino', '212000212', 'carolinasous02@sapo.pt', 'Carolina', 'Sousa'),
('2500-055', 'Caldas da Rainha', 'Rua Maria Assunção', '15-01-2001', '915555519', 'Feminino', '501105501', 'ritamarquz@gmail.com', 'Rita', 'Marquês');

INSERT INTO instrutores (id_pessoa,posicaoEmp, salario,id_instituicao)
VALUES ('3','Funcionario', '943,30€', '2'),
('2','Funcionario', '835,14€', '5'),
('1','Funcionario', '789,40€', '1'),
('4','Chefe', '1608,75€', '3'),
('5','Funcionario', '743,80€', '4');

INSERT INTO alunos (id_pessoa, estadoPag, estadoCod, id_instrutor)
VALUES ('6', 'pagou', 'passou', '2'),
('7', 'pagou', 'chumbou', '3'),
('8', 'pagou', 'passou', '2'),
('9', 'por pagar', 'passou', '1'),
('10', 'pagou', 'por fazer', '4'),
('11', 'pagou', 'passou', '5');

INSERT INTO marcas (nome)
VALUES ('Renault'),('Citroen'),('Peugeot'),('Audi'),('Opel'),
('Toyota'),('Yamaha'),('Suzuki'),('Kawasaki'),('mercedes'),('Volvo'),



INSERT INTO modelos (nome, id_marca)
VALUES ('megane', '1'), ('clio', '1'), ('C1', '2'), ('DS3', '2'), ('208', '3'), ('308', '3'),
('A1', '4'),('A4', '4'),('Corsa', '5'),('Adam', '5'),('Supra', 6),('ybr', 7),('r1',7),('Burgman',8),
('gsxr',8),('kdx',9),('h2r',9),('Axor',10),('FM FURGONE',11);

INSERT INTO veiculos (seguro, avaria, nKilometros, combustivel, consumo, anoVeiculo, matricula, proximaManutencao, ultimaManutencao, id_instituicao,id_modelo)
VALUES ('sim', 'nao', '130000', 'Gasóleo', '7.9', '2015', 'HI-AD-21', '03-04-2023', '03-04-2021', '1', '1'),
('sim', 'nao', '130000', 'Gasóleo', '6.7', '2015', 'AS-FF-99', '04-02-2023', '04-02-2021', '2', '1'),
('sim', 'nao', '280000', 'Gasolina', '10.2', '2015', 'HA-FS-32', '15-02-2023', '15-02-2021', '2', '2'),
('nao', 'sim', '80000', 'Elétrico', '0.0', '2021', 'GA-AS-51', '31-04-2025', '03-04-2021', '3', '2'),
('sim', 'nao', '100000', 'Gasóleo', '7.5', '2014', 'GS-XD-52', '21-12-2022', '21-12-2020', '3', '3'),
('sim', 'sim', '160000', 'Gás', '9.2', '2001', 'HI-AD-53', '12-11-2022', '12-11-2021', '4', '3'),
('nao', 'nao', '130000', 'Gasolina', '5.4', '2018', 'HI-AD-62', '01-03-2024', '01-03-2022', '4', '4'),
('sim', 'nao', '130000', 'Gasolina', '7.2', '2002', 'HI-AD-12', '12-08-2022', '12-08-2021', '2', '4'),
('sim', 'nao', '130000', 'Gasóleo', '6.9', '2003', 'GI-12-HH', '31-10-2022', '31-10-2021', '1', '5'),
('nao', 'nao', '130000', 'Gasóleo', '8.2', '2009', 'GG-41-LL', '30-01-2023', '30-01-2022', '4', '5'),
('sim', 'nao', '160000', 'Gasolina', '30.8', '1998', 'WW-51-AQ', '21-09-2022', '21-09-2021', '5', '6'),
('sim', 'sim', '3000', 'Gasolina', '2.1', '1990', 'HA-52-BA', '16-04-2023', '16-04-2022', '5', '7'),
('sim', 'sim', '6500', 'Gasolina', '19.2', '2016', 'HA-11-31', '05-02-2023', '05-02-2022', '2', '7'),
('sim', 'nao', '5300', 'Gasolina', '4.3', '1993', 'TE-77-BE', '18-03-2023', '18-03-2022', '3', '8'),
('sim', 'nao', '5100', 'Gasolina', '20.4', '2017', 'HA-45-TT', '27-03-2023', '27-03-2022', '3', '8'),
('sim', 'nao', '5000', 'Gasolina', '4.6', '1998', 'YW-22-AA', '17-07-2022', '17-07-2021', '2', '9'),
('sim', 'nao', '5890', 'Gasolina', '25.9', '2018', 'WA-YT-12', '24-08-2022', '24-08-2021', '4', '9'),
('nao', 'nao', '90000', 'Gasóleo', '18.5', '2003', 'HI-AD-21', '20-01-2023', '20-01-2022', '4', '10'),
('sim', 'nao', '50000', 'Gasóleo', '19.2', '1998', 'HI-AD-21', '10-11-2022', '10-11-2021', '5', '11');


INSERT INTO aulas (dtaInicio, dtaFim, id_aluno, id_instrutor, id_veiculo, id_instituicao)
VALUES ('19-03-2022 10:00:50', '19-03-2022 10:40:50', '6', '2', '1'),
('21-06-2020 9:03:24', '21-06-2020 9:40:00:', '8', '7', '3'),
('09-09-2021 11:30:08', '09-06-2021 12:15:40:', '9', '18', '5'),
('10-11-2019 8:30:56', '10-11-2019 9:11:25:', '10', '7', '2'),
('03-02-2022 9:15:07', '03-02-2022 10:00:06:', '7', '7', '4');

INSERT INTO exames (dtaInicio, dtaFim, id_aluno, id_instrutor, id_veiculo, id_instituicao)
VALUES ('01-12-2021 10:01:03', '01-12-2021 10:45:21', '7', '1', '5'),
('12-02-2020 9:03:24', '12-02-2020 9:45:22:', '9', '8', '2'),
('29-02-2021 11:06:21', '29-02-2021 11:52:00:', '10', '16', '1'),
('17-07-2019 8:34:11', '17-07-2019 9:10:00', '8', '5', '4'),
('31-03-2022 9:20:019', '31-03-2022 10:02:53', '6', '2', '3');








