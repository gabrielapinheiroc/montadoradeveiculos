--17
SELECT F.primeiro_nome, F.cpf_funcionario FROM Funcionario F
WHERE F.salario > (SELECT AVG(Salario) FROM Funcionario);

--18
SELECT
    cpf_funcionario,
    n_chassi
FROM
    Vender
WHERE
    cpf_funcionario IN (SELECT F.cpf FROM Funcionario F WHERE F.supervisor = '00000000001');

-- 20
SELECT
    LM.capacidade
FROM
    Linha_montagem LM
WHERE
    LM.num_linha = ALL (SELECT MM.linha_montagem FROM Maquina_montagem MM WHERE MM.codigo_identificacao = '0000000001');

