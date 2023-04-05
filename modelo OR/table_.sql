--ok
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
-- ok
CREATE TABLE tb_maquina_montagem OF tp_maquina_montagem (
    codigo_identificacao PRIMARY KEY,
    nome_modelo          NOT NULL,
    fabricante           NOT NULL,
    data_fabricacao      NOT NULL,
    --linha_montagem NOT NULL,
    num_linha      NOT NULL,
    capacidade     NOT NULL

);
/
-- ok
CREATE TABLE tb_maquina_controle_qualidade OF tp_maquina_controle_qualidade (
    codigo_identificacao PRIMARY KEY,
    nome_modelo          NOT NULL,
    fabricante           NOT NULL,
    data_fabricacao      NOT NULL,
    parametros_teste   NOT NULL,
    limites_tolerancia NOT NULL
);
/

CREATE TABLE tb_revendedora OF tp_revendedora (
    cnpj PRIMARY KEY,
    telefone NOT NULL
);
/

CREATE TABLE tb_producao OF tp_producao;
/

CREATE TABLE tb_veiculo OF tp_veiculo (
    n_chassi PRIMARY KEY,
    modelo NOT NULL,
    cor NOT NULL,
    ano NOT NULL,
    custo_producao NOT NULL
);
/

CREATE TABLE tb_peca OF tp_peca (
    id PRIMARY KEY,
    categoria NOT NULL,
    maquina_inspetora WITH ROWID REFERENCES tb_maquina_controle_qualidade,
    veiculo_recebedor WITH ROWID REFERENCES tb_veiculo,
    data_inspecao_ NOT NULL
);
/