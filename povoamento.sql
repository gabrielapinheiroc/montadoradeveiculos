-- Funcionario
INSERT INTO
    Funcionario (cpf, primeiro_nome, sobrenome, salario, funcao)
VALUES
    ('00000000001', 'João', 'Silva', 90000, 'CEO');

INSERT INTO
    Funcionario (
        cpf,
        primeiro_nome,
        sobrenome,
        salario,
        funcao,
        supervisor
    )
VALUES
    (
        '00000000002',
        'Maria',
        'Oliveira',
        50000,
        'Head de Vendas',
        '00000000001'
    );

INSERT INTO
    Funcionario (
        cpf,
        primeiro_nome,
        sobrenome,
        salario,
        funcao,
        supervisor
    )
VALUES
    (
        '00000000003',
        'José',
        'Kleiton',
        50000,
        'Head de Fabricação',
        '00000000001'
    );

INSERT INTO
    Funcionario (
        cpf,
        primeiro_nome,
        sobrenome,
        salario,
        funcao,
        supervisor
    )
VALUES
    (
        '00000000004',
        'Joana',
        'Vieira',
        5000,
        'Gerente de Vendas',
        '00000000002'
    );

INSERT INTO
    Funcionario (
        cpf,
        primeiro_nome,
        sobrenome,
        salario,
        funcao,
        supervisor
    )
VALUES
    (
        '00000000005',
        'João',
        'Viana',
        2000,
        'Vendedor',
        '00000000004'
    );

INSERT INTO
    Funcionario (
        cpf,
        primeiro_nome,
        sobrenome,
        salario,
        funcao,
        supervisor
    )
VALUES
    (
        '00000000006',
        'Joana',
        'Silva',
        5000,
        'Gerente de Fabricação',
        '00000000003'
    );

INSERT INTO
    Funcionario (
        cpf,
        primeiro_nome,
        sobrenome,
        salario,
        funcao,
        supervisor
    )
VALUES
    (
        '00000000007',
        'Joana',
        'Oliveira',
        2000,
        'Operador',
        '00000000006'
    );

-- Maquina
INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('M000000001', 'Modelo A', '20-FEB-2018');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('M000000002', 'Modelo B', '01-APR-2018');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('M000000003', 'Modelo C', '16-JUL-2018');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('M000000004', 'Modelo D', '12-OCT-2018');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('M000000005', 'Modelo E', '30-JAN-2018');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('M000000006', 'Modelo F', '08-AUG-2019');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('M000000007', 'Modelo G', '23-DEC-2019');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('M000000008', 'Modelo H', '12-MAY-2020');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('M000000009', 'Modelo I', '27-SEP-2020');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('M000000010', 'Modelo J', '03-NOV-2020');

-- Maquina_controle_qualidade
INSERT INTO
    Maquina_controle_qualidade (
        codigo_identificacao,
        parametros_teste,
        limites_tolerancia
    )
VALUES
    ('M000000001', 'A', 'B');

INSERT INTO
    Maquina_controle_qualidade (
        codigo_identificacao,
        parametros_teste,
        limites_tolerancia
    )
VALUES
    ('M000000002', 'B', 'A');

-- Telefone_funcionario
INSERT INTO
    Telefone_funcionario (cpf_funcionario, num_telefone)
VALUES
    ('00000000001', '99999999999');

INSERT INTO
    Telefone_funcionario (cpf_funcionario, num_telefone)
VALUES
    ('00000000002', '99999999998');

INSERT INTO
    Telefone_funcionario (cpf_funcionario, num_telefone)
VALUES
    ('00000000003', '99999999997');

INSERT INTO
    Telefone_funcionario (cpf_funcionario, num_telefone)
VALUES
    ('00000000004', '99999999996');

INSERT INTO
    Telefone_funcionario (cpf_funcionario, num_telefone)
VALUES
    ('00000000005', '99999999995');

INSERT INTO
    Telefone_funcionario (cpf_funcionario, num_telefone)
VALUES
    ('00000000006', '99999999994');

INSERT INTO
    Telefone_funcionario (cpf_funcionario, num_telefone)
VALUES
    ('00000000007', '99999999993');

-- Revendedora
INSERT INTO
    Revendedora (cnpj)
VALUES
    ('00000000000001');

INSERT INTO
    Revendedora (cnpj)
VALUES
    ('00000000000002');

INSERT INTO
    Revendedora (cnpj)
VALUES
    ('00000000000003');

-- Veiculo
INSERT INTO
    Veiculo (n_chassi, modelo, cor, ano)
VALUES
    ('00000000000000001', 'KWID', 'PRETO', 2019);

INSERT INTO
    Veiculo (n_chassi, modelo, cor, ano)
VALUES
    ('00000000000000002', 'KWID', 'ROSA CHOQUE', 2018);

INSERT INTO
    Veiculo (n_chassi, modelo, cor, ano)
VALUES
    ('00000000000000003', 'OPALA', 'AZUL', 1980);

INSERT INTO
    Veiculo (n_chassi, modelo, cor, ano)
VALUES
    ('00000000000000004', 'OPALA', 'VERMELHO', 1980);

INSERT INTO
    Veiculo (n_chassi, modelo, cor, ano)
VALUES
    ('00000000000000005', 'ONIX', 'PRETO', 2019);

-- Telefone_revendedora
INSERT INTO
    Telefone_revendedora (cod_revendedora, num_telefone)
VALUES
    ('00000000000001', '99999999999');

INSERT INTO
    Telefone_revendedora (cod_revendedora, num_telefone)
VALUES
    ('00000000000002', '99999999998');

INSERT INTO
    Telefone_revendedora (cod_revendedora, num_telefone)
VALUES
    ('00000000000003', '99999999997');

-- Vender
INSERT INTO
    Vender (cnpj_revendedora, cpf_funcionario, n_chassi)
VALUES
    (
        '00000000000001',
        '00000000002',
        '00000000000000001'
    );

INSERT INTO
    Vender (cnpj_revendedora, cpf_funcionario, n_chassi)
VALUES
    (
        '00000000000002',
        '00000000004',
        '00000000000000002'
    );

INSERT INTO
    Vender (cnpj_revendedora, cpf_funcionario, n_chassi)
VALUES
    (
        '00000000000003',
        '00000000005',
        '00000000000000003'
    );