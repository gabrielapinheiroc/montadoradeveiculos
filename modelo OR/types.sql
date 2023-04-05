--FUNCINÁRIO--
CREATE OR REPLACE TYPE tp_telefone_funcionario AS OBJECT(
    telefone VARCHAR2(13)
);
/

CREATE OR REPLACE TYPE tp_telefone_funcionario_array AS VARRAY(2) OF tp_telefone_funcionario;
-- funcionario tem 2 telefones (pessoal e residencial)
/

CREATE OR REPLACE TYPE tp_funcionario AS OBJECT(
    cpf VARCHAR2(11),
    primeiro_nome varchar2(50),
    sobrenome varchar2(50),
    salario number(9, 2),
    funcao varchar2(30),
    -- telefone tp_telefone_funcionario_array, --TEL DO TIPO ARRAY DE TELEFONES DE UM FUNCIONARIO
    supervisor REF tp_funcionario -- autorelacionamento, criar uma var do mesmo tipo. -- verificar como inserir
    
    -- faltam os métodos

)NOT FINAL NOT INSTANTIABLE ;
/
--REVENDEDORA--

CREATE OR REPLACE TYPE tp_telefone_revendedora AS OBJECT(
    telefone VARCHAR2(13)
);
/

CREATE OR REPLACE TYPE tp_telefone_revendedora_array AS VARRAY(4) OF tp_telefone_revendedora;
-- revendedora tem 4 telefones; 
/

CREATE OR REPLACE TYPE tp_revendedora AS OBJECT(
    telefone tp_telefone_revendedora_array,
    cpf VARCHAR2(14)

    -- faltam os métodos
);
/


--MAQUINA--

--PEÇA--

--VEÍCULO--

-- está com problemas
'''CREATE OR REPLACE TYPE tp_custo_veiculo  AS OBJECT (
    modelo VARCHAR2(30),
    cor VARCHAR2(15),
    ano INTEGER,
    custo_producao number(14, 2),
);

CREATE OR REPLACE TYPE tp_veiculo AS OBJECT(
    n_chassi VARCHAR2(17),
    modelo VARCHAR2(30), -- devo excluir?
    cor VARCHAR2(15), -- devo excluir?
    ano INTEGER, -- devo excluir? 
    custo tp_custo_veiculo --devo passar como uma var ou coloco modelo, cor e ano dentro do custo?
    --OU
    ''' 
    -- considerando que modelo, cor e ano estará atrelado ao custo
    n_chassi VARCHAR2(17),
    custo tp_custo_veiculo 
    '''
    -- faltam os métodos
);
/'''