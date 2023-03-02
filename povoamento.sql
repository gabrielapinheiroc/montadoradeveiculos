-- Funcionarios

INSERT INTO Funcionario (
    cpf,
    primeiro_nome,
    sobrenome,
    salario,
    funcao
)
VALUES (
    '00000000001',
    'João',
    'Silva',
    90000,
    'CEO'
);

INSERT INTO Funcionario (
    cpf,
    primeiro_nome,
    sobrenome,
    salario,
    funcao,
    supervisor
)
VALUES (
    '00000000002',
    'Maria',
    'Oliveira',
    50000,
    'Head de Vendas',
    '00000000001'
);

INSERT INTO Funcionario (
    cpf,
    primeiro_nome,
    sobrenome,
    salario,
    funcao,
    supervisor
)
VALUES (
    '00000000003',
    'José',
    'Kleiton',
    50000,
    'Head de Fabricação',
    '00000000001'
);

INSERT INTO Funcionario (
    cpf,
    primeiro_nome,
    sobrenome,
    salario,
    funcao,
    supervisor
)
VALUES (
    '00000000004',
    'Joana',
    'Vieira',
    5000,
    'Gerente de Vendas',
    '00000000002'
);

INSERT INTO Funcionario (
    cpf,
    primeiro_nome,
    sobrenome,
    salario,
    funcao,
    supervisor
)
VALUES (
    '00000000005',
    'João',
    'Viana',
    2000,
    'Vendedor',
    '00000000004'
);

INSERT INTO Funcionario (
    cpf,
    primeiro_nome,
    sobrenome,
    salario,
    funcao,
    supervisor
)
VALUES (
    '00000000006',
    'Joana',
    'Silva',
    5000,
    'Gerente de Fabricação',
    '00000000003'
);

INSERT INTO Funcionario (
    cpf,
    primeiro_nome,
    sobrenome,
    salario,
    funcao,
    supervisor
)
VALUES (
    '00000000007',
    'Joana',
    'Oliveira',
    2000,
    'Operador',
    '00000000006'
);