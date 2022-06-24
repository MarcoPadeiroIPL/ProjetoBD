/*
TeSP_PSI_2122_CDBD
Escola de condução 'IPLDrive'
Marco António Fragoso Padeiro, estudante n.º 2211868
Tomás Martins Moura, estudante n.º 2211866
*/
-- Para os comandos para a criação de vistas que imponham limitações no acesso aos dados e para atribuir privilegios

-- @block Criação de um utilizador para controlar a base de dados
DELETE FROM mysql.user WHERE User = 'designer';
CREATE USER 'designer'@'localhost' IDENTIFIED BY 'designer123';
GRANT ALL ON E8.* TO 'designer'@'localhost';

-- @block Criação de um utilizador que vai ser como o aluno
DELETE FROM mysql.user WHERE User = 'aluno';
CREATE USER 'aluno'@'localhost' IDENTIFIED BY 'aluno123';
GRANT SELECT ON E8.VER_NUMERO_AULAS, E8.VER_FUTUROS_EXAMES TO 'aluno'@'localhost';

-- @block Vista para o aluno conseguir ver quantas aulas ja tem
CREATE OR REPLACE VIEW VER_NUMERO_AULAS AS
SELECT a.id_pessoa, p.pNome, p.apelido, COUNT(*) AS Numero_Aulas
FROM aulas aa INNER JOIN alunos a ON aa.id_aluno=a.id_pessoa INNER JOIN pessoas p ON p.id=a.id_pessoa
GROUP BY a.id_pessoa;

-- @block Teste vista VER_NUMERO_AULAS 
SELECT * FROM VER_NUMERO_AULAS;

-- @block Vista para ver os exames marcados
CREATE OR REPLACE VIEW VER_FUTURAS_AULAS AS
SELECT a.id_pessoa, p.pNome, p.apelido, aa.dtaInicio, aa.dtaFim, mm.nome AS "Marca", m.nome AS "Modelo", v.matricula
FROM aulas aa INNER JOIN alunos a ON aa.id_aluno=a.id_pessoa INNER JOIN pessoas p ON p.id=a.id_pessoa INNER JOIN veiculos v ON v.id=aa.id_veiculo INNER JOIN modelos m ON m.id=v.id_modelo INNER JOIN marcas mm ON m.id_marca=mm.id
WHERE aa.dtaInicio > NOW();

-- @block Teste vista VER_FUTURUAS_AULAS 
SELECT * FROM VER_FUTURAS_AULAS;

-- @block Vista para ver os exames marcados
CREATE OR REPLACE VIEW VER_FUTUROS_EXAMES AS
SELECT a.id_pessoa, p.pNome, p.apelido, e.dtaInicio, e.dtaFim, mm.nome AS "Marca", m.nome AS "Modelo", v.matricula
FROM exames e INNER JOIN alunos a ON e.id_aluno=a.id_pessoa INNER JOIN pessoas p ON p.id=a.id_pessoa INNER JOIN veiculos v ON v.id=e.id_veiculo INNER JOIN modelos m ON m.id=v.id_modelo INNER JOIN marcas mm ON m.id_marca=mm.id
WHERE e.estado = "por fazer";

-- @block Teste vista VER_NUMERO_AULAS 
SELECT * FROM VER_FUTUROS_EXAMES;