-- Printa os dados de um veículo a partir do número de chassi
CREATE OR REPLACE PROCEDURE get_dados_from_chassi (
    chassi_v IN Veiculo.n_chassi%TYPE
)
IS
    modelo_v Veiculo.modelo%TYPE;
    cor_v Veiculo.cor%TYPE;
    ano_v Veiculo.ano%TYPE;
BEGIN
    SELECT V.modelo, V.cor, V.ano INTO modelo_v, cor_v, ano_v
    FROM Veiculo V
    WHERE n_chassi = chassi_v;

    DBMS_OUTPUT.PUT_LINE('Modelo: ' || modelo_v || ' - Cor: ' || cor_v ||
                         ' - Ano: ' || ano_v);
END;
-- TESTANDO
DECLARE
BEGIN
    get_dados_from_chassi('00000000000000002');
END;

-- Trigger para impedir a atualização do salário de um funcionário para valor negativo
CREATE OR REPLACE TRIGGER salario_negativo
BEFORE UPDATE ON Funcionario
FOR EACH ROW
BEGIN
    IF :NEW.salario < 0 THEN
        RAISE_APPLICATION_ERROR(-20101, 'O salário de um funcionário precisa ser maior que zero');
    END IF;
END;
-- TESTANDO
UPDATE Funcionario SET salario = -1000
WHERE cpf = '00000000004';

-- Trigger para impedir que a data de fabricação de uma máquina seja alterada
CREATE OR REPLACE TRIGGER data_fabricacao_maquina
BEFORE UPDATE ON Maquina
FOR EACH ROW
BEGIN
    IF :NEW.data_fabricacao != :OLD.data_fabricacao THEN
        RAISE_APPLICATION_ERROR(-20001, 'A data de fabricação de uma máquina não pode ser alterada');
    END IF;
END;
--TESTANDO
UPDATE Maquina SET data_fabricacao = '04-APR-2022'
WHERE codigo_identificacao = '0000000001';

-- Trigger para impedir que o fabricante da tabela Modelo_maquina seja alterado
CREATE OR REPLACE TRIGGER fabricante_modelo_maquina
BEFORE UPDATE ON Modelo_maquina
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'O fabricante de uma máquina não pode ser alterado');
END;
--TESTANDO
UPDATE Modelo_maquina SET fabricante = 'Universal Robots A/S'
WHERE nome_modelo = 'Modelo G';

--//-//
-- quesitos 1, 3, 5, 6, 8, 13, (16?)
DECLARE
  TYPE veiculo_record IS RECORD (
    n_chassi VARCHAR2(17),
    modelo VARCHAR2(30),
    cor VARCHAR2(15),
    ano INTEGER
  );

  veiculo_info veiculo_record;
BEGIN
  veiculo_info.n_chassi := 'ABCDEFG123456789';
  veiculo_info.modelo := 'Fusca';
  veiculo_info.cor := 'Verde';
  veiculo_info.ano := 1972;

  DBMS_OUTPUT.PUT_LINE('Número do chassi: ' || veiculo_info.n_chassi);
  DBMS_OUTPUT.PUT_LINE('Modelo: ' || veiculo_info.modelo);
  DBMS_OUTPUT.PUT_LINE('Cor: ' || veiculo_info.cor);
  DBMS_OUTPUT.PUT_LINE('Ano: ' || veiculo_info.ano);
  
  INSERT INTO Custo_veiculo (modelo, cor, ano)
  VALUES (veiculo_info.modelo, veiculo_info.cor, veiculo_info.ano);

  INSERT INTO veiculo (n_chassi, modelo, cor, ano)
  VALUES (veiculo_info.n_chassi, veiculo_info.modelo, veiculo_info.cor, veiculo_info.ano);

  DBMS_OUTPUT.PUT_LINE('Veículo inserido com sucesso na tabela!');
END;



CREATE OR REPLACE FUNCTION pode_uber (n_chassi_veiculo IN veiculo.n_chassi%type) RETURN VARCHAR2 IS
    ano veiculo.ano%type;
    ano_atual veiculo.ano%type;
    diferenca_ano veiculo.ano%type;
BEGIN
   SELECT V.ano INTO ano FROM veiculo V WHERE n_chassi_veiculo = V.n_chassi;

    SELECT EXTRACT(YEAR FROM SYSDATE) INTO ano_atual FROM DUAL;

    diferenca_ano := ano_atual - ano;

    CASE
        WHEN diferenca_ano > 10 THEN
            RETURN 'Carro não permitido pela Uber...';
        WHEN diferenca_ano = 10 THEN
            RETURN 'Carro ainda permitido pela Uber, mas no último ano, recomendamos trocar.';
        ELSE
            RETURN 'Carro permitido pela Uber';
    END CASE;
END;


DECLARE
	aux VARCHAR2(255);
BEGIN
	aux := pode_uber('00000000000000001');
	dbms_output.put_line(aux);
END;
--//-//


