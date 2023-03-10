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

//-//

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


