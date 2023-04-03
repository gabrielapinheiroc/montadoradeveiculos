--FUNCINÁRIO--
CREATE OR REPLACE TYPE tp_telefone_funcionario AS OBJECT(
    telefone varchar2(13)
);
/

CREATE OR REPLACE TYPE tp_telefone_funcionario AS VARRAY(2) OF tp_telefone_funcionario;
-- funcionario tem 2 telefones (pessoal e residencial)
/
--REVENDEDORA--

--MAQUINA--

--PEÇA--

--VEÍCULO--