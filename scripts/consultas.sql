/*
TeSP_PSI_2122_CDBD
Escola de condução 'IPLDrive'
Marco António Fragoso Padeiro, estudante n.º 2211868
Tomás Martins Moura, estudante n.º 2211866
*/
-- Para consultas importantes para ajudar a gerir o sistema

-- @block Quero saber o numero de aulas que um aluno tem
SELECT a.*, COUNT(*) as NumAulas
FROM alunos a INNER JOIN aulas aa ON aa.id_aluno=a.id_pessoa
WHERE dtaInicio < CURDATE()
GROUP BY a.id_pessoa
ORDER BY NumAulas DESC; 

-- @block Quero saber o numero de alunos que já pagou que cada instituicao tem um instrutor tem que ja pagou
SELECT ii.*, COUNT(*) as Numero_alunos
FROM alunos a INNER JOIN instrutores i ON a.id_instrutor=i.id_pessoa INNER JOIN instituicoes ii ON i.id_instituicao=ii.id
WHERE a.estadoPag = "pagou"
GROUP BY id_instrutor
ORDER BY Numero_alunos DESC;

-- @block Quero saber os instrutores que têm um salario superior ao salario medio
SELECT i.id_pessoa, p.pNome, p.apelido,i.posicaoEmp, i.salario
FROM instrutores i INNER JOIN pessoas p ON i.id_pessoa=p.id
WHERE i.salario > (SELECT avg(salario) from instrutores)
ORDER BY i.salario ASC;

-- @block Quero saber o salario minimo, maximo e a media de cada instituição
SELECT ii.id, ii.nome, ii.abreviatura, MIN(i.salario) AS "Salario minimo", MAX(i.salario) as "Salario maximo", ROUND(AVG(i.salario),2) as "Media"
FROM instrutores i INNER JOIN instituicoes ii ON i.id_instituicao=ii.id
GROUP BY ii.id
ORDER BY AVG(i.salario) ASC, MIN(i.salario) ASC, MAX(i.salario);

-- @block Quero saber o numero medio de aulas que os alunos que passaram no exame tiveram
SELECT AVG(S.Num_Aulas) AS "Num aulas media", MAX(S.Num_Aulas) as "Num aulas maximo", MIN(S.Num_Aulas) as "Num aulas minimo"
FROM (SELECT COUNT(*) as Num_Aulas
    FROM aulas aa INNER JOIN alunos a ON aa.id_aluno=a.id_pessoa INNER JOIN exames e ON e.id_aluno=a.id_pessoa
    WHERE e.estado = "passou"
    GROUP BY a.id_pessoa) S;

-- @block Quero saber quantas instituicoes têm mais de cinco alunos
SELECT S.*
FROM (SELECT ii.*, COUNT(*) AS NumAlunos
FROM instituicoes ii INNER JOIN instrutores i ON i.id_instituicao=ii.id INNER JOIN alunos a ON i.id_pessoa=a.id_instrutor
GROUP BY ii.id
ORDER BY ii.id ASC) S
WHERE NumAlunos>=5;

-- @block Quero saber o numero de aulas que cada veiculo teve
SELECT v.id as ID_VEICULO, mm.nome as MARCA, m.nome as MODELO, COUNT(*) as numAulas
FROM veiculos v INNER JOIN aulas aa ON aa.id_veiculo=v.id INNER JOIN modelos m ON m.id=v.id_modelo INNER JOIN marcas mm ON mm.id=m.id_marca
GROUP BY ID_VEICULO
ORDER BY numAulas DESC;

-- @block Quero saber quantos exames houve no ano XPTO
SELECT YEAR(e.dtaInicio) AS ANO, COUNT(*) as "Num exames"
FROM exames e
WHERE e.estado = "passou" OR e.estado = "chumbou"
GROUP BY YEAR(e.dtaInicio)
ORDER BY e.dtaInicio;

-- @block Quero saber quantos alunos é que cada instituição tem
SELECT ii.*, COUNT(*) AS NumAlunos
FROM instituicoes ii INNER JOIN instrutores i ON i.id_instituicao=ii.id INNER JOIN alunos a ON i.id_pessoa=a.id_instrutor
GROUP BY ii.id
ORDER BY ii.id ASC;

-- @block Quero saber o numero de alunos que ja pagaram por categoria
SELECT c.*, COUNT(*) as NumAlunos
FROM categorias c INNER JOIN alunos a ON a.id_categoria=c.id 
WHERE a.estadoPag = "pagou"
GROUP BY c.id
ORDER BY NumAlunos DESC;

-- @block Quero saber o numero de aulas que cada instrutor deu
SELECT i.id_pessoa, p.pNome, p.Apelido, COUNT(*) as NumAulas
FROM alunos a INNER JOIN aulas aa ON aa.id_aluno=a.id_pessoa INNER JOIN instrutores i ON i.id_pessoa=a.id_instrutor INNER JOIN pessoas p ON p.id=i.id_pessoa
WHERE a.estadoPag = "pagou"
GROUP BY i.id_pessoa 
ORDER BY NumAulas DESC;

-- @block Quero saber todos os carros que precisam de ir à manutenção este ano
SELECT v.*
FROM veiculos v INNER JOIN modelos m ON m.id=v.id_modelo INNER JOIN marcas mm ON mm.id=m.id_marca
WHERE YEAR(v.proximaManutencao) = YEAR(NOW()) AND v.proximaManutencao > NOW()
ORDER BY v.id;



