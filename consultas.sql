ALTER TABLE Funcionario
ADD Email varchar2(255);

CREATE INDEX Funcionario_Email ON Funcionario (Email);

INSERT INTO
    Funcionario (
        cpf,
        primeiro_nome,
        sobrenome,
        salario,
        funcao,
        supervisor,
        email
    )
VALUES
    (
        '10000000002',
        'Mariana',
        'Carvalho',
        7000,
        'Gerente de Assuntos Obscuros',
        '00000000001',
        'mariana.carvalho@msn.com'
    );

UPDATE Funcionario
SET
    Email = 'ceo@montadora.com'
WHERE
    funcao = 'CEO';

DELETE FROM Funcionario
WHERE
    funcao = 'Gerente de Assuntos Obscuros';

SELECT
    modelo,
    custo_producao
FROM
    Custo_veiculo
WHERE
    custo_producao > 30000;

SELECT
    modelo,
    custo_producao
FROM
    Custo_veiculo
WHERE
    custo_producao BETWEEN 15000 AND 30000;

SELECT
    cpf_funcionario,
    n_chassi
FROM
    Vender
WHERE
    cpf_funcionario IN ('00000000001', '00000000002', '00000000004');

SELECT
    primeiro_nome,
    cpf,
    funcao
FROM
    Funcionario
WHERE
    funcao LIKE 'Head de %';

SELECT
    primeiro_nome,
    cpf,
    funcao
FROM
    Funcionario
WHERE
    email IS NOT NULL;

SELECT
    f.primeiro_nome,
    t.num_telefone
FROM
    Funcionario f
    INNER JOIN Telefone_funcionario t ON f.cpf = t.cpf_funcionario;

SELECT
    MAX(capacidade)
FROM
    Linha_montagem;

SELECT
    MIN(ano)
FROM
    Veiculo;

SELECT
    AVG(custo_producao)
FROM
    Custo_veiculo;

SELECT
    COUNT(*)
FROM
    Peca;