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

-- Modelo_maquina
INSERT INTO
    Modelo_maquina (nome_modelo, fabricante)
VALUES
    ('Modelo A', 'Kuka Robotics');

INSERT INTO
    Modelo_maquina (nome_modelo, fabricante)
VALUES
    ('Modelo B', 'ABB Group');

INSERT INTO
    Modelo_maquina (nome_modelo, fabricante)
VALUES
    ('Modelo C', 'ABB Group');

INSERT INTO
    Modelo_maquina (nome_modelo, fabricante)
VALUES
    ('Modelo D', 'Yaskawa Electric Corporation');

INSERT INTO
    Modelo_maquina (nome_modelo, fabricante)
VALUES
    ('Modelo E', 'Yaskawa Electric Corporation');

INSERT INTO
    Modelo_maquina (nome_modelo, fabricante)
VALUES
    ('Modelo F', 'Kawasaki Heavy Industries Ltd.');

INSERT INTO
    Modelo_maquina (nome_modelo, fabricante)
VALUES
    ('Modelo G', 'Mitsubishi Electric Corporation');

INSERT INTO
    Modelo_maquina (nome_modelo, fabricante)
VALUES
    ('Modelo H', 'Mitsubishi Electric Corporation');

INSERT INTO
    Modelo_maquina (nome_modelo, fabricante)
VALUES
    ('Modelo I', 'Unirversal Robots A/S');

INSERT INTO
    Modelo_maquina (nome_modelo, fabricante)
VALUES
    ('Modelo J', 'Universal Robots A/S');

-- Maquina
INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('0000000001', 'Modelo A', '20-FEB-2018');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('0000000002', 'Modelo B', '01-APR-2018');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('0000000003', 'Modelo C', '16-JUL-2018');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('0000000004', 'Modelo D', '12-OCT-2018');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('0000000005', 'Modelo E', '30-JAN-2018');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('0000000006', 'Modelo F', '08-AUG-2019');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('0000000007', 'Modelo G', '23-DEC-2019');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('0000000008', 'Modelo H', '12-MAY-2020');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('0000000009', 'Modelo I', '27-SEP-2020');

INSERT INTO
    Maquina (codigo_identificacao, modelo, data_fabricacao)
VALUES
    ('0000000010', 'Modelo J', '03-NOV-2020');

-- Linha_montagem
INSERT INTO
    Linha_montagem (num_linha, capacidade)
VALUES
    (1, 10);

INSERT INTO
    Linha_montagem (num_linha, capacidade)
VALUES
    (2, 11);

INSERT INTO
    Linha_montagem (num_linha, capacidade)
VALUES
    (3, 12);

INSERT INTO
    Linha_montagem (num_linha, capacidade)
VALUES
    (4, 13);

INSERT INTO
    Linha_montagem (num_linha, capacidade)
VALUES
    (5, 14);

INSERT INTO
    Linha_montagem (num_linha, capacidade)
VALUES
    (6, 15);

INSERT INTO
    Linha_montagem (num_linha, capacidade)
VALUES
    (7, 16);

INSERT INTO
    Linha_montagem (num_linha, capacidade)
VALUES
    (8, 17);

INSERT INTO
    Linha_montagem (num_linha, capacidade)
VALUES
    (9, 18);

-- Maquina_montagem
INSERT INTO
    Maquina_montagem (codigo_identificacao, linha_montagem)
VALUES
    ('0000000001', 5);

INSERT INTO
    Maquina_montagem (codigo_identificacao, linha_montagem)
VALUES
    ('0000000002', 4);

INSERT INTO
    Maquina_montagem (codigo_identificacao, linha_montagem)
VALUES
    ('0000000003', 6);

INSERT INTO
    Maquina_montagem (codigo_identificacao, linha_montagem)
VALUES
    ('0000000004', 5);

INSERT INTO
    Maquina_montagem (codigo_identificacao, linha_montagem)
VALUES
    ('0000000005', 9);

INSERT INTO
    Maquina_montagem (codigo_identificacao, linha_montagem)
VALUES
    ('0000000006', 5);

INSERT INTO
    Maquina_montagem (codigo_identificacao, linha_montagem)
VALUES
    ('0000000007', 3);

INSERT INTO
    Maquina_montagem (codigo_identificacao, linha_montagem)
VALUES
    ('0000000008', 8);

INSERT INTO
    Maquina_montagem (codigo_identificacao, linha_montagem)
VALUES
    ('0000000009', 6);

INSERT INTO
    Maquina_montagem (codigo_identificacao, linha_montagem)
VALUES
    ('0000000010', 7);

-- Maquina_controle_qualidade
INSERT INTO
    Maquina_controle_qualidade (
        codigo_identificacao,
        parametros_teste,
        limites_tolerancia
    )
VALUES
    ('0000000001', 'A', 'B');

INSERT INTO
    Maquina_controle_qualidade (
        codigo_identificacao,
        parametros_teste,
        limites_tolerancia
    )
VALUES
    ('0000000002', 'B', 'A');

-- Historico_manutencao
INSERT INTO
    Historico_manutencao (codigo_identificacao_maquina, data_)
VALUES
    ('0000000001', '27-05-2023');

INSERT INTO
    Historico_manutencao (codigo_identificacao_maquina, data_)
VALUES
    ('0000000002', '28-05-2023');

INSERT INTO
    Historico_manutencao (codigo_identificacao_maquina, data_)
VALUES
    ('0000000003', '28-06-2023');

INSERT INTO
    Historico_manutencao (codigo_identificacao_maquina, data_)
VALUES
    ('0000000004', '24-07-2023');

-- Telefone_funcionario
INSERT INTO
    Telefone_funcionario (cpf_funcionario, num_telefone)
VALUES
    ('00000000001', '(99)9999-9999');

INSERT INTO
    Telefone_funcionario (cpf_funcionario, num_telefone)
VALUES
    ('00000000002', '(99)9999-9998');

INSERT INTO
    Telefone_funcionario (cpf_funcionario, num_telefone)
VALUES
    ('00000000003', '(99)9999-9997');

INSERT INTO
    Telefone_funcionario (cpf_funcionario, num_telefone)
VALUES
    ('00000000004', '(99)9999-9996');

INSERT INTO
    Telefone_funcionario (cpf_funcionario, num_telefone)
VALUES
    ('00000000005', '(99)9999-9995');

INSERT INTO
    Telefone_funcionario (cpf_funcionario, num_telefone)
VALUES
    ('00000000006', '(99)9999-9994');

INSERT INTO
    Telefone_funcionario (cpf_funcionario, num_telefone)
VALUES
    ('00000000007', '(99)9999-9993');

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

-- Custo_veiculo
INSERT INTO
    Custo_veiculo (modelo, cor, ano, custo_producao)
VALUES
    ('KWID', 'PRETO', 2019, 20420);

INSERT INTO
    Custo_veiculo (modelo, cor, ano, custo_producao)
VALUES
    ('KWID', 'ROSA CHOQUE', 2018, 20720);

INSERT INTO
    Custo_veiculo (modelo, cor, ano, custo_producao)
VALUES
    ('OPALA', 'AZUL', 1980, 39550);

INSERT INTO
    Custo_veiculo (modelo, cor, ano, custo_producao)
VALUES
    ('OPALA', 'VERMELHO', 1980, 38600);

INSERT INTO
    Custo_veiculo (modelo, cor, ano, custo_producao)
VALUES
    ('ONIX', 'PRETO', 2019, 25500);

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

-- Peca
INSERT INTO
    Peca (
        id,
        categoria,
        maquina_inspetora,
        veiculo_recebedor,
        data_inspecao
    )
VALUES
    (
        Peca_seq.NEXTVAL,
        'A',
        '0000000001',
        '00000000000000001',
        '27-05-2023'
    );

INSERT INTO
    Peca (
        id,
        categoria,
        maquina_inspetora,
        veiculo_recebedor,
        data_inspecao
    )
VALUES
    (
        Peca_seq.NEXTVAL,
        'B',
        '0000000002',
        '00000000000000001',
        '27-05-2023'
    );

INSERT INTO
    Peca (
        id,
        categoria,
        maquina_inspetora,
        veiculo_recebedor,
        data_inspecao
    )
VALUES
    (
        Peca_seq.NEXTVAL,
        'C',
        '0000000002',
        '00000000000000003',
        '28-05-2023'
    );

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

-- Produzir
INSERT INTO
    Produzir (cod_maquina_montagem, n_chassi, cpf_funcionario)
VALUES
    (
        '0000000001',
        '00000000000000001', -- 'KWID' - 'Modelo A'
        '00000000007'
    );

INSERT INTO
    Produzir (cod_maquina_montagem, n_chassi, cpf_funcionario)
VALUES
    (
        '0000000001',
        '00000000000000002', -- 'KWID' - 'Modelo A'
        '00000000007'
    );

INSERT INTO
    Produzir (cod_maquina_montagem, n_chassi, cpf_funcionario)
VALUES
    (
        '0000000002',
        '00000000000000003', -- 'OPALA' - 'Modelo B'
        '00000000007'
    );

INSERT INTO
    Produzir (cod_maquina_montagem, n_chassi, cpf_funcionario)
VALUES
    (
        '0000000002',
        '00000000000000004', -- 'OPALA' - 'Modelo B'
        '00000000007'
    );

INSERT INTO
    Produzir (cod_maquina_montagem, n_chassi, cpf_funcionario)
VALUES
    (
        '0000000003',
        '00000000000000005', -- 'ONIX' -  'Modelo C'
        '00000000007'
    );