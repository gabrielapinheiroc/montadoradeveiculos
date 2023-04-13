--tb_funcionario----------------------------------------------------------------------------------------------------

INSERT INTO tb_funcionario VALUES (
    '11111111111',
    'João',
    'Silva',
    3000.00,
    'Gerente',
    tp_telefone_funcionario_array(
        tp_telefone_funcionario('111111111'),
        tp_telefone_funcionario('222222222')),
    NULL
);
/

INSERT INTO tb_funcionario VALUES (
    '22222222222',
    'Maria',
    'Santos',
    4000.00,
    'Vendedor',
    tp_telefone_funcionario_array(
        tp_telefone_funcionario('333333333'),
        tp_telefone_funcionario('444444444')),
    (SELECT REF (f) FROM tb_funcionario f WHERE f.cpf = '11111111111')
);
/

INSERT INTO tb_funcionario VALUES (
    '33333333333',
    'Pedro',
    'Ferreira',
    2500.00,
    'Auxiliar',
    tp_telefone_funcionario_array(
        tp_telefone_funcionario('555555555'),
        tp_telefone_funcionario('666666666')),
    (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '22222222222')
);
/

--tb_maquina_montagem----------------------------------------------------------------------------------------------------

INSERT INTO tb_maquina_montagem VALUES (
    'M001',
    'Modelo 1',
    'Fabricante A',
    TO_DATE('2022-03-25', 'YYYY-MM-DD'),
    1,
    10
);
/

INSERT INTO tb_maquina_montagem VALUES (
    'M002',
    'Modelo 2',
    'Fabricante B',
    TO_DATE('2022-02-15', 'YYYY-MM-DD'),
    2,
    12
);
/

INSERT INTO tb_maquina_montagem VALUES (
    'M003',
    'Modelo 3',
    'Fabricante C',
    TO_DATE('2022-01-10', 'YYYY-MM-DD'),
    3,
    15
);
/

--tb_maquina_controle_qualidade----------------------------------------------------------------------------------------------------

INSERT INTO tb_maquina_controle_qualidade VALUES (
    'M001',
    'Modelo A',
    'Fabricante X',
    TO_DATE('2022-01-01', 'YYYY-MM-DD'),
    'P',
    'L'
);
/

INSERT INTO tb_maquina_controle_qualidade VALUES (
    'M002',
    'Modelo B',
    'Fabricante Y',
    TO_DATE('2021-12-31', 'YYYY-MM-DD'),
    'Q',
    'M'
);
/

--tb_revendedora----------------------------------------------------------------------------------------------------

INSERT INTO tb_revendedora VALUES (
    '01234567890123',
    tp_lista_telefone_revendedora(
        tp_telefone_revendedora('555-1234'),
        tp_telefone_revendedora('555-5678')
    )
);
/

INSERT INTO tb_revendedora VALUES (
    '12345678901234',
    tp_lista_telefone_revendedora(
        tp_telefone_revendedora('666-2345'),
        tp_telefone_revendedora('666-6789')
    )
);
/

--tb_veiculo----------------------------------------------------------------------------------------------------

INSERT INTO tb_veiculo VALUES (
    'ABCD1234567891234',
    'Gol',
    'Prata',
    2010,
    20000.00
);
/

INSERT INTO tb_veiculo VALUES ('EFGH2345678912345',
    'Palio',
    'Branco',
    2015,
    25000.00
);
/

INSERT INTO tb_veiculo VALUES (
    'IJKL3456789123456',
    'Uno',
    'Preto',
    2012,
    22000.00
);
/

--tb_peca----------------------------------------------------------------------------------------------------

INSERT INTO tb_peca VALUES (
    1,
    'A',
    (SELECT REF(mq) FROM tb_maquina_controle_qualidade mq WHERE codigo_identificacao = '001'),
    (SELECT REF(v) FROM tb_veiculo v WHERE n_chassi = '12345678901234567'),
    TO_DATE('2022-03-20', 'YYYY-MM-DD')
);
/

INSERT INTO tb_peca VALUES (
    2,
    'B',
    (SELECT REF(mq) FROM tb_maquina_controle_qualidade mq WHERE codigo_identificacao = '002'),
    (SELECT REF(v) FROM tb_veiculo v WHERE n_chassi = '23456789012345678'),
    TO_DATE('2022-03-21', 'YYYY-MM-DD')
);
/

INSERT INTO tb_peca VALUES (
    3,
    'C',
    (SELECT REF(mq) FROM tb_maquina_controle_qualidade mq WHERE codigo_identificacao = '003'),
    (SELECT REF(v) FROM tb_veiculo v WHERE n_chassi = '34567890123456789'),
    TO_DATE('2022-03-22', 'YYYY-MM-DD')
);
/

--tb_historico_manutencao----------------------------------------------------------------------------------------------------

INSERT INTO tb_historico_manutencao VALUES (
    (SELECT REF (m) FROM tb_maquina_controle_qualidade m WHERE m.codigo_identificacao = 'M001'),
    TO_DATE('2021-08-01', 'YYYY-MM-DD'),
    500.00
);
/

INSERT INTO tb_historico_manutencao VALUES (
    (SELECT REF (m) FROM tb_maquina_controle_qualidade m WHERE m.codigo_identificacao = 'M002'),
    TO_DATE('2022-03-28', 'YYYY-MM-DD'),
    1000.00
);
/