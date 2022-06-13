/*
TeSP_PSI_2122_CDBD
Escola de condução 'IPLDrive'
Marco António Fragoso Padeiro, estudante n.º 2211868
Tomás Martins Moura, estudante n.º 2211866
*/
-- Para consultas importantes para ajudar a gerir o sistema

-- @block Quero saber o numero de aulas que um aluno tem
SELECT COUNT(*) AS Numero_Aulas
FROM aulas
WHERE id_aluno=6 AND dtaInicio < CURDATE(); 

-- @block Quero saber o numero de alunos que cada instrutor tem
SELECT i.id_pessoa, i.pNome, i.apelido,COUNT(*) AS Numero_alunos
FROM alunos a INNER JOIN instrutores i ON a.id_instrutor=i.id_pessoa 
GROUP BY id_instrutor;

