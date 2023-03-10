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
UPDATE Maquina SET data_fabricacao_maquina = '04-APR-2022'
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
