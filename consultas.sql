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

-- @block Quero saber o numero de alunos que um instrutor tem
SELECT i.id_pessoa, p.pNome, p.apelido, COUNT(*) as Numero_alunos
FROM alunos a INNER JOIN instrutores i ON a.id_instrutor=i.id_pessoa INNER JOIN pessoas p ON i.id_pessoa=p.id
GROUP BY id_instrutor
ORDER BY Numero_alunos DESC;

-- @block Quero saber os instrutores que têm um salario superior ao salario medio
SELECT i.id_pessoa, p.pNome, p.apelido,i.posicaoEmp, i.salario
FROM instrutores i INNER JOIN pessoas p ON i.id_pessoa=p.id
WHERE i.salario > (SELECT avg(salario) from instrutores);

-- @block Quero saber o salario minimo, maximo e a media de cada instituição
SELECT ii.id, ii.nome, ii.abreviatura, MIN(i.salario), MAX(i.salario), ROUND(AVG(i.salario),2)
FROM instrutores i INNER JOIN instituicoes ii ON i.id_instituicao=ii.id
GROUP BY ii.id;

-- @block Quero saber o numero medio de aulas que os alunos que passaram no exame tiveram
SELECT AVG(S.Num_Aulas), MAX(S.Num_Aulas), MIN(S.Num_Aulas)
FROM (SELECT COUNT(*) as Num_Aulas
    FROM aulas aa INNER JOIN alunos a ON aa.id_aluno=a.id_pessoa INNER JOIN exames e ON e.id_aluno=a.id_pessoa
    WHERE e.estado = "passou"
    GROUP BY a.id_pessoa) S;

-- @block Quero saber o numero de aulas que cada veiculo teve
SELECT v.id as ID_VEICULO, mm.nome as MARCA, m.nome as MODELO, COUNT(*) as numAulas
FROM veiculos v INNER JOIN aulas aa ON aa.id_veiculo=v.id INNER JOIN modelos m ON m.id=v.id_modelo INNER JOIN marcas mm ON mm.id=m.id_marca
GROUP BY ID_VEICULO
ORDER BY numAulas DESC;

-- @block Quero saber a taxa de sucesso dos alunos de cada instrutor
SELECT COUNT(*)
from exames e INNER JOIN alunos a ON e.id_aluno=a.id_pessoa INNER JOIN instrutores i ON a.id_instrutor=i.id_pessoa
WHERE e.estado="passou"
GROUP BY a.id_instrutor;

-- @block Quero saber a taxa de sucesso dos alunos de cada instrutor
SELECT COUNT(*)
from exames e INNER JOIN alunos a ON e.id_aluno=a.id_pessoa INNER JOIN instrutores i ON a.id_instrutor=i.id_pessoa
WHERE e.estado="chumbou"
GROUP BY a.id_instrutor;

-- @block QUERO MORRER
/*SELECT S.PASSOU,  T.CHUMBOU AS Total
FROM 
(SELECT COUNT(*) as PASSOU
from exames e INNER JOIN alunos a ON e.id_aluno=a.id_pessoa INNER JOIN instrutores i ON a.id_instrutor=i.id_pessoa
WHERE e.estado="passou"
GROUP BY a.id_instrutor) S,
(SELECT COUNT(*) as CHUMBOU
from exames e INNER JOIN alunos a ON e.id_aluno=a.id_pessoa INNER JOIN instrutores i ON a.id_instrutor=i.id_pessoa
WHERE e.estado="chumbou"
GROUP BY a.id_instrutor) T;*/
