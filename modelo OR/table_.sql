CREATE TABLE tb_funcionario OF tp_funcionario (
    CPF PRIMARY KEY,
    primeiro_nome NOT NULL,
    sobrenome     NOT NULL,
    salario       NOT NULL,
    funcao        NOT NULL,
    telefone      NOT NULL,
    supervisor SCOPE IS tb_funcionario
);
/

CREATE TABLE tb_maquina_montagem OF tp_maquina_montagem (
    codigo_identificacao PRIMARY KEY,
    modelo               NOT NULL,
    nome_modelo          NOT NULL,
    fabricante           NOT NULL,
    data_fabricacao      NOT NULL,
    linha_montagem NOT NULL,
    num_linha      NOT NULL,
    capacidade     NOT NULL,
);
/

CREATE TABLE tb_controle_qualidade OF tp_controle_qualidade (
    codigo_identificacao PRIMARY KEY,
    modelo               NOT NULL,
    nome_modelo          NOT NULL,
    fabricante           NOT NULL,
    data_fabricacao      NOT NULL,
    parametros_teste   NOT NULL,
    limites_tolerancia NOT NULL,
);
/

