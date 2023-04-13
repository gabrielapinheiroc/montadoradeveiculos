-- Tabela de funcionários --
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

-- Tbalea de máquinas de montgem --
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
-- Tabela de máquinas de controle de qualidade --
CREATE TABLE tb_maquina_controle_qualidade OF tp_maquina_controle_qualidade (
    codigo_identificacao PRIMARY KEY,
    nome_modelo          NOT NULL,
    fabricante           NOT NULL,
    data_fabricacao      NOT NULL,
    parametros_teste   NOT NULL,
    limites_tolerancia NOT NULL
);
/

-- Tabelas de revendedoras --
CREATE TABLE tb_revendedora OF tp_revendedora (
    cnpj PRIMARY KEY
) NESTED TABLE lista_telefone STORE AS telefones_revendedora;
/

-- Tabela de produção --
CREATE TABLE tb_producao OF tp_producao;
/

-- Tabela de veículos --
CREATE TABLE tb_veiculo OF tp_veiculo (
    n_chassi PRIMARY KEY,
    modelo NOT NULL,
    cor NOT NULL,
    ano NOT NULL,
    custo_producao NOT NULL
);
/

-- Tabela de peças --
CREATE TABLE tb_peca OF tp_peca (
    id PRIMARY KEY,
    categoria NOT NULL,
    maquina_inspetora WITH ROWID REFERENCES tb_maquina_controle_qualidade,
    veiculo_recebedor WITH ROWID REFERENCES tb_veiculo,
    data_inspecao_ NOT NULL
);
/

-- Tabela de hstórico de manutenção --
CREATE TABLE tb_historico_manutencao OF tp_historico_manutencao (
    maquina WITH ROWID REFERENCES tb_maquina_controle_qualidade,
    data_ NOT NULL,
    valor NOT NULL
);
/

-- Tabela de venda --
CREATE TABLE tb_venda OF tp_venda;
/