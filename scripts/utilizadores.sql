/*
TeSP_PSI_2122_CDBD
Escola de condução 'IPLDrive'
Marco António Fragoso Padeiro, estudante n.º 2211868
Tomás Martins Moura, estudante n.º 2211866
*/
-- Para os comandos para a criação de vistas que imponham limitações no acesso aos dados e para atribuir privilegios

-- @block Criação de um utilizador para controlar a base de dados
CREATE USER 'designer'@'localhost' IDENTIFIED BY 'designer123';
GRANT ALL PRIVILEGES ON E8.* TO 'designer'@'localhost';

-- @block Criação de um utilizador que vai ser como o aluno
CREATE USER 'aluno'@'localhost' IDENTIFIED BY 'aluno123';
GRANT SELECT PRIVILEGES ON E8.aulas, E8.exames TO 'aluno'@'localhost';