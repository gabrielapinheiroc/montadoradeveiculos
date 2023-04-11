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

-- Funcionario --
CREATE OR REPLACE TYPE tp_funcionario AS OBJECT (
    cpf           VARCHAR2(11),
    primeiro_nome VARCHAR2(50),
    sobrenome     VARCHAR2(50),
    salario       NUMBER(9, 2),
    funcao        VARCHAR2(30),
    telefone      tp_telefone_funcionario_array,

    -- METODOS --
    CONSTRUCTOR FUNCTION tp_funcionario(c  VARCHAR2,
                                        pn VARCHAR2,
                                        sn VARCHAR2,
                                        s  NUMBER,
                                        f  VARCHAR2,
                                        t  tp_telefone_funcionario_array) RETURN SELF AS RESULT,

    MEMBER FUNCTION get_salario_liquido(percentual NUMBER) RETURN NUMBER, --Retorna salário bruto menos descontos

    MAP MEMBER FUNCTION get_salario_anual RETURN NUMBER
);
/

-- Body Funcionarios --
CREATE OR REPLACE TYPE BODY tp_funcionario AS
    CONSTRUCTOR FUNCTION tp_funcionario(c  VARCHAR2,
                                        pn VARCHAR2,
                                        sn VARCHAR2,
                                        s  NUMBER,
                                        f  VARCHAR2,
                                        t  tp_telefone_funcionario_array) RETURN SELF AS RESULT IS
    BEGIN
        cpf           := c;
        primeiro_nome := pn;
        sobrenome     := sn;
        salario       := s;
        funcao        := f;
        telefone      := t;
        RETURN;
    END;

    MEMBER FUNCTION get_salario_liquido(percentual NUMBER) RETURN NUMBER IS
        desconto NUMBER;
    BEGIN
        desconto := percentual / 100;
        RETURN salario * (1 - bonus);
    END;

    MAP MEMBER FUNCTION get_salario_anual RETURN NUMBER IS
    BEGIN
        RETURN salario * 12;
    END;
END;
/

-- Autorrelacionamento em Funcionario --
ALTER TYPE tp_funcionario ADD ATTRIBUTE (supervisor REF tp_funcionario);
/

--MAQUINA----------------------------------------------------------------------------------------------------

-- Maquina --
CREATE OR REPLACE TYPE tp_maquina AS OBJECT (
    codigo_identificacao VARCHAR2(10),
    nome_modelo          VARCHAR2(30),
    fabricante           VARCHAR2(40),
    data_fabricacao      DATE,

    -- METODOS --
    FINAL MEMBER FUNCTION get_codigo_identificacao RETURN VARCHAR2, --Retorna o código de identificação da máquina

    ORDER MEMBER FUNCTION mesmo_fabricante(m tp_maquina) RETURN INTEGER,

    MEMBER PROCEDURE exibir_informacoes(SELF tp_maquina) --Printa informações da máquina
) NOT FINAL NOT INSTANTIABLE;
/

-- Body Maquina --
CREATE OR REPLACE TYPE BODY tp_maquina AS
    FINAL MEMBER FUNCTION get_codigo_identificacao RETURN VARCHAR2 IS 
    BEGIN 
        RETURN codigo_identificacao; 
    END; 

    ORDER MEMBER FUNCTION mesmo_fabricante(m tp_maquina) RETURN INTEGER IS
    BEGIN
        IF fabricante == m.fabricante THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END;
 
    MEMBER PROCEDURE exibir_informacoes(SELF tp_maquina) IS 
    BEGIN 
        DBMS_OUTPUT.PUT_LINE('Código Identificação: ' || get_codigo_identificacao); 
        DBMS_OUTPUT.PUT_LINE('Nome Modelo:          ' || nome_modelo); 
        DBMS_OUTPUT.PUT_LINE('Fabricante:           ' || fabricante); 
        DBMS_OUTPUT.PUT_LINE('Data Fabricação:      ' || TO_CHAR(data_fabricacao, 'DD-MON-YYYY')); 
    END; 
END;
/

--MAQUINA MONTAGEM----------------------------------------------------------------------------------------------------

-- Maquina Montagem --
CREATE OR REPLACE TYPE tp_maquina_montagem UNDER tp_maquina (
    num_linha      INTEGER,
    capacidade     INTEGER,

    -- METODOS --
    CONSTRUCTOR FUNCTION tp_maquina_montagem(ci VARCHAR2,
                                             nm VARCHAR2,
                                             f  VARCHAR2,
                                             df DATE,
                                             nl INTEGER,
                                             c  INTEGER) RETURN SELF AS RESULT,

    OVERRIDING MEMBER PROCEDURE exibir_informacoes(SELF tp_maquina_montagem) --Printa as informações da máquina dde montagem
);
/

-- Body Maquina Montagem --
CREATE OR REPLACE TYPE BODY tp_maquina_montagem AS
    CONSTRUCTOR FUNCTION tp_maquina_montagem(ci VARCHAR2,
                                             nm VARCHAR2,
                                             f  VARCHAR2,
                                             df DATE,
                                             nl INTEGER,
                                             c  INTEGER) RETURN SELF AS RESULT IS
    BEGIN
        codigo_identificacao := ci;
        nome_modelo          := nm;
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
        DBMS_OUTPUT.PUT_LINE('Modelo:          ' || nome_modelo);
        DBMS_OUTPUT.PUT_LINE('Fabricante:      ' || fabricante);
        DBMS_OUTPUT.PUT_LINE('Data Fabricacao: ' || data_fabricacao);
        DBMS_OUTPUT.PUT_LINE('Linha Montagem:  ' || num_linha);
        DBMS_OUTPUT.PUT_LINE('Capacidade:      ' || capacidade);
    END;
END;
/

--MAQUINA CONTROLE QUALIDADE----------------------------------------------------------------------------------------------------

-- Maquina Controle Qualidade --
CREATE OR REPLACE TYPE tp_maquina_controle_qualidade UNDER tp_maquina (
    parametros_teste   VARCHAR(1),
    limites_tolerancia VARCHAR(1),

    -- METODOS --
    CONSTRUCTOR FUNCTION tp_maquina_controle_qualidade(ci VARCHAR2,
                                                       nm  VARCHAR2,
                                                       f  VARCHAR2,
                                                       df DATE,
                                                       pt VARCHAR2,
                                                       lt VARCHAR2) RETURN SELF AS RESULT,

    OVERRIDING MEMBER PROCEDURE exibir_informacoes(SELF tp_maquina_controle_qualidade) --Printa informações da maquina de controle de qualidade
);
/

-- Body Máquina Controle Qualidade --
CREATE OR REPLACE TYPE BODY tp_maquina_controle_qualidade AS
    CONSTRUCTOR FUNCTION tp_maquina_controle_qualidade(ci VARCHAR2,
                                                       nm VARCHAR2,
                                                       f  VARCHAR2,
                                                       df DATE,
                                                       pt VARCHAR2,
                                                       lt VARCHAR2) RETURN SELF AS RESULT IS
    BEGIN
        codigo_identificacao := ci;
        nome_modelo          := nm;
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
        DBMS_OUTPUT.PUT_LINE('Modelo:             ' || nome_modelo);
        DBMS_OUTPUT.PUT_LINE('Data Fabricacao:    ' || data_fabricacao);
        DBMS_OUTPUT.PUT_LINE('Parametros Teste:   ' || parametros_teste);
        DBMS_OUTPUT.PUT_LINE('Limites Tolerancia: ' || limites_tolerancia);
    END;
END;
/

--VEICULO----------------------------------------------------------------------------------------------------

-- Veiculo --
CREATE OR REPLACE TYPE tp_veiculo AS OBJECT (
    n_chassi       VARCHAR2(17),
    modelo         VARCHAR2(30),
    cor            VARCHAR2(15),
    ano            INTEGER,
    custo_producao NUMBER(14, 2),

    -- METODOS --
    CONSTRUCTOR FUNCTION tp_veiculo(nc VARCHAR2,
                                    m  VARCHAR2,
                                    c  VARCHAR2,
                                    a  INTEGER,
                                    cp NUMBER) RETURN SELF AS RESULT
);
/

-- Body Veiculo --
CREATE OR REPLACE TYPE BODY tp_veiculo AS
    CONSTRUCTOR FUNCTION tp_veiculo(nc VARCHAR2,
                                    m  VARCHAR2,
                                    c  VARCHAR2,
                                    a  INTEGER,
                                    cp NUMBER) RETURN SELF AS RESULT IS
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

-- Revendedora --
CREATE OR REPLACE TYPE tp_revendedora AS OBJECT (
    cnpj VARCHAR2(14)

    -- Metodos --
);
/

-- Telefone revendedora NESTED TABLE
CREATE OR REPLACE TYPE tp_lista_telefone_revendedora AS TABLE OF tp_telefone_revendedora;
/

-- Nested Table em revendedora --
ALTER TYPE tp_revendedora ADD ATTRIBUTE (lista_telefone tp_lista_telefone_revendedora);
/

--PECA----------------------------------------------------------------------------------------------------

-- Peça --
CREATE OR REPLACE TYPE tp_peca AS OBJECT (
    id                    INTEGER,
    categoria             VARCHAR(1),
    maquina_inspetora REF tp_maquina_controle_qualidade,
    veiculo_recebedor REF tp_veiculo,
    data_inspecao_        DATE,

    -- METODOS --
    CONSTRUCTOR FUNCTION tp_peca(i      INTEGER,
                                 c      VARCHAR2,
                                 mi REF tp_maquina_controle_qualidade,
                                 vr REF tp_veiculo,
                                 di     DATE) RETURN SELF AS RESULT
);
/

-- Body Peça --
CREATE OR REPLACE TYPE BODY tp_peca AS
    CONSTRUCTOR FUNCTION tp_peca(i      INTEGER,
                                 c      VARCHAR2,
                                 mi REF tp_maquina_controle_qualidade,
                                 vr REF tp_veiculo,
                                 di     DATE) RETURN SELF AS RESULT IS
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

-- Historico Manutenção --
CREATE OR REPLACE TYPE tp_historico_manutencao AS OBJECT (
    maquina REF tp_maquina,
    data_       DATE,
    valor       NUMBER(9, 2),

    -- METODOS --
    CONSTRUCTOR FUNCTION tp_historico_manutencao(m REF tp_maquina,
                                                 d     DATE,
                                                 v     NUMBER) RETURN SELF AS RESULT,

    MEMBER PROCEDURE exibir_informacoes(SELF tp_historico_manutencao)
);
/

-- Body Historico Manutenção --
CREATE OR REPLACE TYPE BODY tp_historico_manutencao AS
    CONSTRUCTOR FUNCTION tp_historico_manutencao(m REF tp_maquina,
                                                 d     DATE,
                                                 v     NUMBER) RETURN SELF AS RESULT IS
    BEGIN
        maquina := m;
        data_   := d;
        valor   := v;
        RETURN;
    END;

    MEMBER PROCEDURE exibir_informacoes(SELF tp_historico_manutencao) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Máquina: ' || DEREF(maquina).get_codigo_identificacao);
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

-- Body Venda --
CREATE OR REPLACE TYPE BODY tp_venda AS
    CONSTRUCTOR FUNCTION tp_venda(r REF tp_revendedora,
                                  f REF tp_funcionario,
                                  v REF tp_veiculo) RETURN SELF AS RESULT IS
    BEGIN
        revendedora := r;
        funcionario := f;
        veiculo     := v;
        RETURN;
    END;
END;
/

--PRODUZIR----------------------------------------------------------------------------------------------------

-- Produção -- (Entidade associativa)
CREATE OR REPLACE TYPE tp_producao AS OBJECT (
    maquina_montagem REF tp_maquina_montagem,
    veiculo          REF tp_veiculo,
    funcionario      REF tp_funcionario,

    CONSTRUCTOR FUNCTION tp_producao(mm REF tp_maquina_montagem,
                                     v  REF tp_veiculo,
                                     f  REF tp_funcionario) RETURN SELF AS RESULT
);
/

-- Body Produção --
CREATE OR REPLACE TYPE BODY tp_producao AS
    CONSTRUCTOR FUNCTION tp_producao(mm REF tp_maquina_montagem,
                                     v  REF tp_veiculo,
                                     f  REF tp_funcionario) RETURN SELF AS RESULT IS
    BEGIN
        maquina_montagem := mm;
        veiculo          := v;
        funcionario      := f;
        RETURN;
    END;
END;
/