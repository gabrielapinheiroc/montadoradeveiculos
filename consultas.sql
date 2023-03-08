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