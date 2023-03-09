SELECT F.primeiro_nome, F.cpf_funcionario FROM Funcionario F
WHERE F.salario > (SELECT AVG(Salario) FROM Funcionario);


SELECT
    cpf_funcionario,
    n_chassi
FROM
    Vender
WHERE
    cpf_funcionario IN (SELECT F.cpf FROM Funcionario F WHERE F.supervisor = '00000000001');

