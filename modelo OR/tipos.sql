--FUNCIONÁRIO----------------------------------------------------------------------------------------------------

-- Telefone funcionario --
CREATE OR REPLACE TYPE tp_telefone_funcionario AS OBJECT (
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
    sobrenome     VARCHAR2(50)
);
/
*/

-- Funcionario --
CREATE OR REPLACE TYPE tp_funcionario AS OBJECT (
    cpf           VARCHAR2(11),
  --nome          tp_nome_funcionario,
    primeiro_nome VARCHAR2(50),
<<<<<<< HEAD
    sobrenome     VARCHAR2(50),
    salario       NUMBER(9, 2),
    funcao        VARCHAR2(30),
    telefone      tp_telefone_funcionario_array,
=======
    sobrenome VARCHAR2(50),
    salario NUMBER(9, 2),
    funcao VARCHAR2(30),
    telefone tp_telefone_funcionario_array
>>>>>>> af473678b2376b18438fc89c647fd5afac8fa48c

    -- Metodos --
    CONSTRUCTOR FUNCTION tp_funcionario(c  VARCHAR2(11),
                                        pn VARCHAR2(50),
                                        sn VARCHAR2(50),
                                        s  NUMBER(9, 2),
                                        f  VARCHAR2(30),
                                        sv VARCHAR2(11), --supervisor?
                                        t  tp_telefone_funcionario_array) RETURN SELF AS RESULT,

    MEMBER FUNCTION bonus_salario(percentual NUMBER) RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY tp_funcionario AS
    CONSTRUCTOR FUNCTION tp_funcionario(c  VARCHAR2(11),
                                        pn VARCHAR2(50),
                                        sn VARCHAR2(50),
                                        s  NUMBER(9, 2),
                                        f  VARCHAR2(30),
                                        sv VARCHAR2(11), --
                                        t  tp_telefone_funcionario_array) RETURN SELF AS RESULT IS
    BEGIN
        cpf           := c;
        primeiro_nome := pn;
        sobrenome     := sn;
        salario       := s;
        funcao        := f;
        supervisor    := sv; --supervisor?
        telefone      := t;
        RETURN;
    END;

    MEMBER FUNCTION bonus_salario(percentual NUMBER) RETURN NUMBER IS
        bonus NUMBER;
    BEGIN
        bonus := percentual / 100;
        RETURN salario * (1 + bonus);
    END;
END;
/

ALTER TYPE tp_funcionario ADD ATTRIBUTE (supervisor REF tp_funcionario) CASCADE;

--MAQUINA----------------------------------------------------------------------------------------------------

/*
-- Modelo maquina --
CREATE OR REPLACE TYPE tp_modelo_maquina AS OBJECT (
    nome_modelo VARCHAR2(30),
    fabricante  VARCHAR2(40)
);
/
*/

-- Maquina --
CREATE OR REPLACE TYPE tp_maquina AS OBJECT (
    codigo_identificacao VARCHAR2(10),
  --modelo               tp_modelo_maquina,
    nome_modelo          VARCHAR2(30),
    fabricante           VARCHAR2(40),
    data_fabricacao      DATE,

    -- Metodos --
    MEMBER PROCEDURE exibir_informacoes(SELF tp_maquina)
) NOT FINAL NOT INSTANTIABLE;
/

--MAQUINA MONTAGEM----------------------------------------------------------------------------------------------------

/*
-- Linha montagem --
CREATE OR REPLACE TYPE tp_linha_montagem AS OBJECT (
    num_linha  INTEGER,
    capacidade INTEGER
);
/
*/

-- Maquina Montagem --
CREATE OR REPLACE TYPE tp_maquina_montagem UNDER tp_maquina (
  --linha_montagem tp_linha_montagem
    num_linha      INTEGER,
    capacidade     INTEGER,

    -- Metodos --
    CONSTRUCTOR FUNCTION tp_maquina_montagem(ci VARCHAR2(10),
                                             nm VARCHAR2(30),
                                             f  VARCHAR2(40),
                                             df DATE,
                                             nl INTEGER,
                                             c  INTEGER) RETURN SELF AS RESULT,

    OVERRIDING MEMBER PROCEDURE exibir_informacoes(SELF tp_maquina_montagem)
);
/

CREATE OR REPLACE TYPE BODY tp_maquina_montagem AS
    CONSTRUCTOR FUNCTION tp_maquina_montagem(ci VARCHAR2(10),
                                             m  VARCHAR2(30),
                                             f  VARCHAR2(40),
                                             df DATE,
                                             nl INTEGER,
                                             c  INTEGER) RETURN SELF AS RESULT
    BEGIN
        codigo_identificacao := ci;
        modelo               := nm;
        fabricante           := f;
        data_fabricacao      := df;
        num_linha            := nl;
        capacidade           := c;
        RETURN;
    END;

    OVERRIDING MEMBER PROCEDURE exibir_informacoes(SELF tp_maquina_montagem) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Maquina:         ' || codigo_identificacao);
        DBMS_OUTPUT.PUT_LINE('Tipo:            Montagem');
        DBMS_OUTPUT.PUT_LINE('Modelo:          ' || modelo);
        DBMS_OUTPUT.PUT_LINE('Fabricante:      ' || fabricante);
        DBMS_OUTPUT.PUT_LINE('Data Fabricacao: ' || data_fabricacao);
        DBMS_OUTPUT.PUT_LINE('Linha Montagem:  ' || num_linha);
        DBMS_OUTPUT.PUT_LINE('Capacidade:      ' || capacidade);
    END;
END;
/

--MAQUINA CONTROLE QUALIDADE----------------------------------------------------------------------------------------------------

-- Maquina controle_qualidade --
CREATE OR REPLACE TYPE tp_maquina_controle_qualidade UNDER tp_maquina (
    parametros_teste   VARCHAR(1),
    limites_tolerancia VARCHAR(1),

    -- Metodos --
    CONSTRUCTOR FUNCTION tp_maquina_controle_qualidade(ci VARCHAR2(10),
                                                       m  VARCHAR2(30),
                                                       f  VARCHAR2(40),
                                                       df DATE,
                                                       pt VARCHAR2(1),
                                                       lt VARCHAR2(1)) RETURN SELF AS RESULT,

    OVERRIDING MEMBER PROCEDURE exibir_informacoes(SELF tp_maquina_controle_qualidade)
);
/

CREATE OR REPLACE TYPE BODY tp_maquina_controle_qualidade AS
    CONSTRUCTOR FUNCTION tp_maquina_controle_qualidade(ci VARCHAR2(10),
                                                       m  VARCHAR2(30),
                                                       f  VARCHAR2(40),
                                                       df DATE,
                                                       pt VARCHAR2(1),
                                                       lt VARCHAR2(1)) RETURN SELF AS RESULT
    BEGIN
        codigo_identificacao := ci;
        modelo               := m;
        fabricante           := f;
        data_fabricacao      := df;
        parametros_teste     := pt;
        limites_tolerancia   := lt;
        RETURN;
    END;

    OVERRIDING MEMBER PROCEDURE exibir_informacoes(SELF tp_maquina_controle_qualidade) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Maquina:            ' || codigo_identificacao);
        DBMS_OUTPUT.PUT_LINE('Tipo:               Controle Qualidade');
        DBMS_OUTPUT.PUT_LINE('Modelo:             ' || modelo);
        DBMS_OUTPUT.PUT_LINE('Data Fabricacao:    ' || data_fabricacao);
        DBMS_OUTPUT.PUT_LINE('Parametros Teste:   ' || parametros_teste);
        DBMS_OUTPUT.PUT_LINE('Limites Tolerancia: ' || limites_tolerancia);
    END;
END;
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
    n_chassi       VARCHAR2(17),
  --custo_veiculo  tp_custo_veiculo,
    modelo         VARCHAR2(30),
    cor            VARCHAR2(15),
    ano            INTEGER,
    custo_producao NUMBER(14, 2),

    -- Metodos --
    CONSTRUCTOR FUNCTION tp_veiculo(nc VARCHAR2(17),
                                    m  VARCHAR2(30),
                                    c  VARCHAR2(15),
                                    a  INTEGER,
                                    cp NUMBER(14, 2)) RETURN SELF AS RESULT
);
/

CREATE OR REPLACE TYPE BODY tp_veiculo AS
    CONSTRUCTOR FUNCTION tp_veiculo(nc VARCHAR2(17),
                                    m  VARCHAR2(30),
                                    c  VARCHAR2(15),
                                    a  INTEGER,
                                    cp NUMBER(14, 2)) RETURN SELF AS RESULT
    BEGIN
        n_chassi       := nc;
        modelo         := m;
        cor            := c;
        ano            := a;
        custo_producao := cp;
        RETURN;
    END;
END;
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
    cnpj     VARCHAR2(14),
    telefone tp_telefone_revendedora_array,

    -- Metodos --
    CONSTRUCTOR FUNCTION tp_revendedora(c VARCHAR2(14)
                                        t tp_telefone_revendedora_array) RETURN SELF AS RESULT
);
/

CREATE OR REPLACE TYPE BODY tp_revendedora AS
    CONSTRUCTOR FUNCTION tp_revendedora(c VARCHAR2(14)
                                        t tp_telefone_revendedora_array) RETURN SELF AS RESULT
    BEGIN
        cnpj     := c;
        telefone := t;
        RETURN;
    END;
END;
/

--PECA----------------------------------------------------------------------------------------------------

-- Peca --
CREATE OR REPLACE TYPE tp_peca AS OBJECT (
    id                    INTEGER,
    categoria             VARCHAR(1),
    maquina_inspetora REF tp_maquina_controle_qualidade,
    veiculo_recebedor REF tp_veiculo,
    data_inspecao_        DATE,

    -- Metodos --
    CONSTRUCTOR FUNCTION tp_peca(i      INTEGER,
                                 c      VARCHAR2(1),
                                 mi REF tp_maquina_controle_qualidade,
                                 vr REF tp_veiculo,
                                 di     DATE) RETURN SELF AS RESULT
);
/

CREATE OR REPLACE TYPE BODY tp_peca AS
    CONSTRUCTOR FUNCTION tp_peca(i      INTEGER,
                                 c      VARCHAR2(1),
                                 mi REF tp_maquina_controle_qualidade,
                                 vr REF tp_veiculo,
                                 di     DATE) RETURN SELF AS RESULT
    BEGIN
        id                := i;
        categoria         := c;
        maquina_inspetora := mi;
        veiculo_recebedor := vr;
        data_inspecao_    := di;
        RETURN;
    END;
END;
/

--HISTORICO MANUTENCAO----------------------------------------------------------------------------------------------------

-- Historico_manutencao -- (Verificar se a referência de uma entidade fraca é assim msm)
CREATE OR REPLACE TYPE tp_historico_manutencao AS OBJECT (
    maquina REF tp_maquina,
    data_       DATE,
    valor       NUMBER(9, 2),

    -- Metodos --
    CONSTRUCTOR FUNCTION tp_historico_manutencao(m REF tp_maquina,
                                                 d     DATE,
                                                 v     NUMBER(9, 2)) RETURN SELF AS RESULT,

    MEMBER PROCEDURE exibir_informacoes(SELF tp_historico_manutencao)
);
/

CREATE OR REPLACE TYPE BODY tp_historico_manutencao AS
    CONSTRUCTOR FUNCTION tp_historico_manutencao(m REF tp_maquina,
                                                 d     DATE,
                                                 v     NUMBER(9, 2)) RETURN SELF AS RESULT
    BEGIN
        maquina := m;
        data_   := d;
        valor   := v;
        RETURN;
    END;

    MEMBER PROCEDURE exibir_informacoes(SELF tp_historico_manutencao)
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Máquina: ' || DEREF(m).codigo_identificacao);
        DBMS_OUTPUT.PUT_LINE('Data:    ' || data_);
        DBMS_OUTPUT.PUT_LINE('Valor:   ' || valor);
    END;
END;
/

--VENDA----------------------------------------------------------------------------------------------------

-- Venda -- (Relacionamento ternário)
CREATE OR REPLACE TYPE tp_venda AS OBJECT (
    revendedora REF tp_revendedora,
    funcionario REF tp_funcionario,
    veiculo     REF tp_veiculo,

    CONSTRUCTOR FUNCTION tp_venda(r REF tp_revendedora,
                                  f REF tp_funcionario,
                                  v REF tp_veiculo) RETURN SELF AS RESULT
) NOT FINAL;
/

CREATE OR REPLACE TYPE BODY tp_venda AS
    CONSTRUCTOR FUNCTION tp_venda(r REF tp_revendedora,
                                  f REF tp_funcionario,
                                  v REF tp_veiculo) RETURN SELF AS RESULT
    BEGIN
        revendedora := r;
        funcionario := f;
        veiculo     := v;
        RETURN;
    END;
END;
/

--PRODUZIR----------------------------------------------------------------------------------------------------

-- Produzir -- (Entidade associativa)
CREATE OR REPLACE TYPE tp_producao AS OBJECT (
    maquina_montagem REF tp_maquina_montagem,
    veiculo          REF tp_veiculo,
    funcionario      REF tp_funcionario,

    CONSTRUCTOR FUNCTION tp_producao(mm REF tp_maquina_montagem,
                                     v  REF tp_veiculo,
                                     f  REF tp_funcionario) RETURN SELF AS RESULT
);
/

CREATE OR REPLACE TYPE BODY tp_produzir AS
    CONSTRUCTOR FUNCTION tp_produzir(mm REF tp_maquina_montagem,
                                     v  REF tp_veiculo,
                                     f  REF tp_funcionario) RETURN SELF AS RESULT
    BEGIN
        cod_maquina_montagem := mm;
        veiculo              := v;
        funcionario          := f;
        RETURN;
    END;
END;
/