--tb_funcionario----------------------------------------------------------------------------------------------------

INSERT INTO tb_funcionario VALUES (
    '11111111111',
    'João',
    'Silva',
    8000.00,
    'Gerente',
    tp_telefone_funcionario_array(
        tp_telefone_funcionario('(11)111111111'),
        tp_telefone_funcionario('(22)222222222')),
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
        tp_telefone_funcionario('(33)333333333'),
        tp_telefone_funcionario('(44)444444444')),
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
        tp_telefone_funcionario('(55)555555555'),
        tp_telefone_funcionario('(66)666666666')),
    (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '22222222222')
);
/

INSERT INTO tb_funcionario VALUES (
    '44444444444',
    'Ruy',
    'Silva',
    5500.00,
    'Operador de Maquina',
    tp_telefone_funcionario_array(
        tp_telefone_funcionario('(77)777777777'),
        tp_telefone_funcionario('(88)888888888')),
    (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '22222222222')
);
/

--tb_maquina_montagem----------------------------------------------------------------------------------------------------

INSERT INTO tb_maquina_montagem VALUES (
    'M100',
    'Modelo 1',
    'Fabricante A',
    TO_DATE('2022-03-25', 'YYYY-MM-DD'),
    1,
    10
);
/

INSERT INTO tb_maquina_montagem VALUES (
    'M200',
    'Modelo 2',
    'Fabricante B',
    TO_DATE('2022-02-15', 'YYYY-MM-DD'),
    2,
    12
);
/

INSERT INTO tb_maquina_montagem VALUES (
    'M300',
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

INSERT INTO tb_maquina_controle_qualidade VALUES (
    'M003',
    'Modelo C',
    'Fabricante X',
    TO_DATE('2020-10-01', 'YYYY-MM-DD'),
    'P',
    'L'
);
/

--tb_revendedora----------------------------------------------------------------------------------------------------

INSERT INTO tb_revendedora VALUES (
    '01234567890123',
    tp_lista_telefone_revendedora(
        tp_telefone_revendedora('(81)995551234'),
        tp_telefone_revendedora('(11)985555678')
    )
);
/

INSERT INTO tb_revendedora VALUES (
    '12345678901234',
    tp_lista_telefone_revendedora(
        tp_telefone_revendedora('(11)946662345'),
        tp_telefone_revendedora('(82)986666789')
    )
);
/

INSERT INTO tb_revendedora VALUES (
    '09876543210000',
    tp_lista_telefone_revendedora(
        tp_telefone_revendedora('(83)965551234'),
        tp_telefone_revendedora('(67)985555678')
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

INSERT INTO tb_veiculo VALUES (
    'MNOP4567891234567',
    'Fiesta',
    'Azul',
    2018,
    28000.00
);
/

INSERT INTO tb_veiculo VALUES (
    'QRST5678912345678',
    'Civic',
    'Vermelho',
    2017,
    35000.00
);
/

INSERT INTO tb_veiculo VALUES (
    'UVWX6789123456789',
    'Corolla',
    'Prata',
    2019,
    40000.00
);
/

INSERT INTO tb_veiculo VALUES (
    'YZAB7891234567890',
    'Renegade',
    'Verde',
    2016,
    30000.00
);
/

--tb_peca----------------------------------------------------------------------------------------------------
-- (consulta com SELECT REF)

INSERT INTO tb_peca VALUES (
    1,
    'A',
    (SELECT REF(mq) FROM tb_maquina_controle_qualidade mq WHERE codigo_identificacao = 'M001'),
    (SELECT REF(v) FROM tb_veiculo v WHERE n_chassi = 'IJKL3456789123456'),
    TO_DATE('2022-03-20', 'YYYY-MM-DD')
);
/

INSERT INTO tb_peca VALUES (
    2,
    'B',
    (SELECT REF(mq) FROM tb_maquina_controle_qualidade mq WHERE codigo_identificacao = 'M002'),
    (SELECT REF(v) FROM tb_veiculo v WHERE n_chassi = 'EFGH2345678912345'),
    TO_DATE('2022-03-21', 'YYYY-MM-DD')
);
/

INSERT INTO tb_peca VALUES (
    3,
    'C',
    (SELECT REF(mq) FROM tb_maquina_controle_qualidade mq WHERE codigo_identificacao = 'M003'),
    (SELECT REF(v) FROM tb_veiculo v WHERE n_chassi = 'ABCD1234567891234'),
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

--tb_venda----------------------------------------------------------------------------------------------------

INSERT INTO tb_venda VALUES (
    (SELECT REF(R) FROM tb_revendedora R WHERE R.cnpj = '01234567890123'),
    (SELECT REF(F) FROM tb_funcionario F WHERE F.CPF = '22222222222'),
    (SELECT REF(V) FROM tb_veiculo V WHERE V.n_chassi = 'ABCD1234567891234')
);

INSERT INTO tb_venda VALUES (
    (SELECT REF(R) FROM tb_revendedora R WHERE R.cnpj = '09876543210000'),
    (SELECT REF(F) FROM tb_funcionario F WHERE F.CPF = '22222222222'),
    (SELECT REF(V) FROM tb_veiculo V WHERE V.n_chassi = 'EFGH2345678912345')
);

INSERT INTO tb_venda VALUES (
    (SELECT REF(R) FROM tb_revendedora R WHERE R.cnpj = '01234567890123'),
    (SELECT REF(F) FROM tb_funcionario F WHERE F.CPF = '33333333333'),
    (SELECT REF(V) FROM tb_veiculo V WHERE V.n_chassi = 'IJKL3456789123456')
);

INSERT INTO tb_venda VALUES (
    (SELECT REF(R) FROM tb_revendedora R WHERE R.cnpj = '01234567890123'),
    (SELECT REF(F) FROM tb_funcionario F WHERE F.CPF = '33333333333'),
    (SELECT REF(V) FROM tb_veiculo V WHERE V.n_chassi = 'MNOP4567891234567')
);

INSERT INTO tb_venda VALUES (
    (SELECT REF(R) FROM tb_revendedora R WHERE R.cnpj = '09876543210000'),
    (SELECT REF(F) FROM tb_funcionario F WHERE F.CPF = '22222222222'),
    (SELECT REF(V) FROM tb_veiculo V WHERE V.n_chassi = 'QRST5678912345678')
);

INSERT INTO tb_venda VALUES (
    (SELECT REF(R) FROM tb_revendedora R WHERE R.cnpj = '09876543210000'),
    (SELECT REF(F) FROM tb_funcionario F WHERE F.CPF = '33333333333'),
    (SELECT REF(V) FROM tb_veiculo V WHERE V.n_chassi = 'UVWX6789123456789')
);

INSERT INTO tb_venda VALUES (
    (SELECT REF(R) FROM tb_revendedora R WHERE R.cnpj = '09876543210000'),
    (SELECT REF(F) FROM tb_funcionario F WHERE F.CPF = '33333333333'),
    (SELECT REF(V) FROM tb_veiculo V WHERE V.n_chassi = 'YZAB7891234567890')
);

--tb_producao----------------------------------------------------------------------------------------------------

INSERT INTO tb_producao VALUES (
    (SELECT REF(M) FROM tb_maquina_montagem M WHERE M.codigo_identificacao = 'M100'),
    (SELECT REF(V) FROM tb_veiculo V WHERE V.n_chassi = 'YZAB7891234567890'),
    (SELECT REF(F) FROM tb_funcionario F WHERE F.CPF = '33333333333')
);

INSERT INTO tb_producao VALUES (
    (SELECT REF(M) FROM tb_maquina_montagem M WHERE M.codigo_identificacao = 'M100'),
    (SELECT REF(V) FROM tb_veiculo V WHERE V.n_chassi = 'UVWX6789123456789'),
    (SELECT REF(F) FROM tb_funcionario F WHERE F.CPF = '44444444444')
);

INSERT INTO tb_producao VALUES (
    (SELECT REF(M) FROM tb_maquina_montagem M WHERE M.codigo_identificacao = 'M200'),
    (SELECT REF(V) FROM tb_veiculo V WHERE V.n_chassi = 'QRST5678912345678'),
    (SELECT REF(F) FROM tb_funcionario F WHERE F.CPF = '44444444444')
);

INSERT INTO tb_producao VALUES (
    (SELECT REF(M) FROM tb_maquina_montagem M WHERE M.codigo_identificacao = 'M200'),
    (SELECT REF(V) FROM tb_veiculo V WHERE V.n_chassi = 'MNOP4567891234567'),
    NULL
);

INSERT INTO tb_producao VALUES (
    (SELECT REF(M) FROM tb_maquina_montagem M WHERE M.codigo_identificacao = 'M200'),
    (SELECT REF(V) FROM tb_veiculo V WHERE V.n_chassi = 'IJKL3456789123456'),
    NULL
);

INSERT INTO tb_producao VALUES (
    (SELECT REF(M) FROM tb_maquina_montagem M WHERE M.codigo_identificacao = 'M200'),
    (SELECT REF(V) FROM tb_veiculo V WHERE V.n_chassi = 'EFGH2345678912345'),
    (SELECT REF(F) FROM tb_funcionario F WHERE F.CPF = '33333333333')
);

INSERT INTO tb_producao VALUES (
    (SELECT REF(M) FROM tb_maquina_montagem M WHERE M.codigo_identificacao = 'M200'),
    (SELECT REF(V) FROM tb_veiculo V WHERE V.n_chassi = 'ABCD1234567891234'),
    (SELECT REF(F) FROM tb_funcionario F WHERE F.CPF = '44444444444')
);