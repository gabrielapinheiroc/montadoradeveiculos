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
    supervisor REF tp_funcionario -- autorelacionamento, criar uma var do mesmo tipo.

)NOT FINAL NOT INSTANTIABLE ;
/
--REVENDEDORA--


--MAQUINA--

--PEÇA--

--VEÍCULO--