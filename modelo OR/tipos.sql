--FUNCIONÁRIO----------------------------------------------------------------------------------------------------

-- Telefone funcionario --
CREATE OR REPLACE TYPE tp_telefone_funcionario AS OBJECT(
    telefone VARCHAR2(13)
);
/

-- Telefone funcionario VARRAY --
CREATE OR REPLACE TYPE tp_telefone_funcionario_array AS VARRAY(2) OF tp_telefone_funcionario;
-- funcionario tem 2 telefones (pessoal e trabalho)
/

/*
-- Nome funcionario --
CREATE OR REPLACE TYPE tp_nome_funcionario AS OBJECT(
    primeiro_nome VARCHAR2(50),
    sobrenome VARCHAR2(50)
);
/
*/

-- Funcionario --
CREATE OR REPLACE TYPE tp_funcionario AS OBJECT (
    cpf VARCHAR2(11),
    --nome tp_nome_funcionario,
    primeiro_nome VARCHAR2(50),
    sobrenome VARCHAR2(50),
    salario NUMBER(9, 2),
    funcao VARCHAR2(30),
    telefone tp_telefone_funcionario_array

    -- Metodos --
);
/

ALTER TYPE tp_funcionario ADD ATTRIBUTE (supervisor REF tp_funcionario) CASCADE;

--MAQUINA----------------------------------------------------------------------------------------------------

/*
-- Modelo maquina --
CREATE OR REPLACE TYPE tp_modelo_maquina AS OBJECT (
    nome_modelo VARCHAR2(30),
    fabricante VARCHAR2(40)
);
/
*/

-- Maquina --
CREATE OR REPLACE TYPE tp_maquina AS OBJECT (
    codigo_identificacao VARCHAR2(10),
    --modelo tp_modelo_maquina,
    nome_modelo VARCHAR2(30),
    fabricante VARCHAR2(40),
    data_fabricacao DATE

    -- Metodos --
) NOT FINAL NOT INSTANTIABLE;
/

--MAQUINA MONTAGEM----------------------------------------------------------------------------------------------------

/*
-- Linha montagem --
CREATE OR REPLACE TYPE tp_linha_montagem AS OBJECT (
    num_linha INTEGER,
    capacidade INTEGER
);
/
*/

-- Maquina Montagem --
CREATE OR REPLACE TYPE tp_maquina_montagem UNDER tp_maquina (
    --linha_montagem tp_linha_montagem
    num_linha INTEGER,
    capacidade INTEGER

    -- Metodos --
);
/

--MAQUINA CONTROLE QUALIDADE----------------------------------------------------------------------------------------------------

-- Maquina controle_qualidade --
CREATE OR REPLACE TYPE tp_maquina_controle_qualidade UNDER tp_maquina (
    parametros_teste VARCHAR(1),
    limites_tolerancia VARCHAR(1)

    -- Metodos --
);
/

--VEICULO----------------------------------------------------------------------------------------------------

/*
-- Custo veiculo --
CREATE OR REPLACE TYPE tp_custo_veiculo AS OBJECT (
    modelo VARCHAR2(30),
    cor VARCHAR2(15),
    ano INTEGER,
    custo_producao NUMBER(14, 2)
);
/
*/

-- Veiculo --
CREATE OR REPLACE TYPE tp_veiculo AS OBJECT (
    n_chassi VARCHAR2(17),
    --custo_veiculo tp_custo_veiculo,
    modelo VARCHAR2(30),
    cor VARCHAR2(15),
    ano INTEGER,
    custo_producao NUMBER(14, 2)

    -- Metodos --
);
/

--REVENDEDORA----------------------------------------------------------------------------------------------------

-- Telefone revendedora --
CREATE OR REPLACE TYPE tp_telefone_revendedora AS OBJECT (
    telefone VARCHAR2(13)
);
/

-- Telefone revendedora VARRAY --
CREATE OR REPLACE TYPE tp_telefone_revendedora_array AS VARRAY(4) OF tp_telefone_revendedora;
-- revendedora tem 4 telefones
/

-- Revendedora --
CREATE OR REPLACE TYPE tp_revendedora AS OBJECT (
    cnpj VARCHAR2(14),
    telefone tp_telefone_revendedora_array

    -- Metodos --
);
/

--PECA----------------------------------------------------------------------------------------------------

-- Peca --
CREATE OR REPLACE TYPE tp_peca AS OBJECT (
    id INTEGER,
    categoria VARCHAR(1),
    maquina_inspetora REF tp_maquina_controle_qualidade,
    veiculo_recebedor REF tp_veiculo,
    data_inspecao_ DATE

    -- Metodos --
);
/

--HISTORICO MANUTENCAO----------------------------------------------------------------------------------------------------

-- Historico_manutencao -- (Verificar se a referência de uma entidade fraca é assim msm)
CREATE OR REPLACE TYPE tp_historico_manutencao AS OBJECT (
    maquina REF tp_maquina,
    data_ DATE,
    valor NUMBER(9, 2)

    -- Metodos --
);
/

--VENDA----------------------------------------------------------------------------------------------------

-- Venda -- (Relacionamento ternário)
CREATE OR REPLACE TYPE tp_venda AS OBJECT (
    revendedora REF tp_revendedora,
    funcionario REF tp_funcionario,
    veiculo REF tp_veiculo
) NOT FINAL;

--PRODUZIR----------------------------------------------------------------------------------------------------

-- Produzir -- (Entidade associativa)
CREATE OR REPLACE TYPE tp_producao AS OBJECT (
    maquina_montagem REF tp_maquina_montagem,
    veiculo REF tp_veiculo,
    funcionario REF tp_funcionario
);