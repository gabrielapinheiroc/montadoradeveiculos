ALTER TABLE Funcionario
ADD Email varchar2(255);

DECLARE
    TYPE Tabela_precos IS TABLE OF Historico_manutencao.valor%TYPE
    INDEX BY BINARY_INTEGER;
    Precos_manutencao Tabela_precos;
BEGIN
    Precos_manutencao(1) := 8000;
    Precos_manutencao(2) := 12000;
    Precos_manutencao(3) := 16000;
    Precos_manutencao(4) := 20000;
    Precos_manutencao(5) := 24000;
    Precos_manutencao(6) := 28000;

    dbms_output.put_line(Precos_manutencao(1));
    dbms_output.put_line(Precos_manutencao(2));
    dbms_output.put_line(Precos_manutencao(3));
    dbms_output.put_line(Precos_manutencao(4));
    dbms_output.put_line(Precos_manutencao(5));
    dbms_output.put_line(Precos_manutencao(6));
END;

CREATE INDEX Funcionario_Email ON Funcionario (Email);

INSERT INTO
    Funcionario (
        cpf,
        primeiro_nome,
        sobrenome,
        salario,
        funcao,
        supervisor,
        email
    )
VALUES
    (
        '10000000002',
        'Mariana',
        'Carvalho',
        7000,
        'Gerente de Assuntos Obscuros',
        '00000000001',
        'mariana.carvalho@msn.com'
    );

UPDATE Funcionario
SET
    Email = 'ceo@montadora.com'
WHERE
    funcao = 'CEO';

DELETE FROM Funcionario
WHERE
    funcao = 'Gerente de Assuntos Obscuros';

SELECT
    modelo,
    custo_producao
FROM
    Custo_veiculo
WHERE
    custo_producao > 30000;

SELECT
    modelo,
    custo_producao
FROM
    Custo_veiculo
WHERE
    custo_producao BETWEEN 15000 AND 30000;

SELECT
    cpf_funcionario,
    n_chassi
FROM
    Vender
WHERE
    cpf_funcionario IN ('00000000001', '00000000002', '00000000004');

SELECT
    primeiro_nome,
    cpf,
    funcao
FROM
    Funcionario
WHERE
    funcao LIKE 'Head de %';

SELECT
    primeiro_nome,
    cpf,
    funcao
FROM
    Funcionario
WHERE
    email IS NOT NULL;

SELECT
    f.primeiro_nome,
    t.num_telefone
FROM
    Funcionario f
    INNER JOIN Telefone_funcionario t ON f.cpf = t.cpf_funcionario;

SELECT
    MAX(capacidade)
FROM
    Linha_montagem;

SELECT
    MIN(ano)
FROM
    Veiculo;

SELECT
    AVG(custo_producao)
FROM
    Custo_veiculo;

SELECT
    COUNT(*)
FROM
    Peca;

SELECT
    v.n_chassi,
    c.custo_producao
FROM
    Veiculo v
    LEFT JOIN Custo_veiculo c ON v.modelo = c.modelo;

CREATE VIEW
    funcionarios_cargo_gerencia AS
SELECT
    *
FROM
    Funcionario
WHERE
    funcao LIKE 'Gerente de %';

SELECT
    codigo_identificacao
FROM
    Maquina_controle_qualidade
UNION
SELECT
    codigo_identificacao
FROM
    Maquina_montagem;

SELECT
    COUNT(*),
    supervisor
FROM
    Funcionario
GROUP BY
    supervisor
HAVING
    COUNT(*) > 1
ORDER BY
    COUNT(*) DESC;

SELECT
    cpf
FROM
    Funcionario
WHERE
    cpf = ANY (
        SELECT
            cpf_funcionario
        FROM
            Vender
        WHERE
            cnpj_revendedora = '00000000000003'
    );

SELECT
    F.primeiro_nome,
    F.cpf
FROM
    Funcionario F
WHERE
    F.salario > (
        SELECT
            AVG(Salario)
        FROM
            Funcionario
    );

SELECT
    cpf_funcionario,
    n_chassi
FROM
    Vender
WHERE
    cpf_funcionario IN (
        SELECT
            F.cpf
        FROM
            Funcionario F
        WHERE
            F.supervisor = '00000000001'
    );

SELECT
    LM.capacidade
FROM
    Linha_montagem LM
WHERE
    LM.num_linha = ALL (
        SELECT
            MM.linha_montagem
        FROM
            Maquina_montagem MM
        WHERE
            MM.codigo_identificacao = '0000000001'
    );

--17
SELECT F.primeiro_nome, F.cpf FROM Funcionario F
WHERE F.salario > (SELECT AVG(Salario) FROM Funcionario);

--18
SELECT
    cpf_funcionario,
    n_chassi
FROM
    Vender
WHERE
    cpf_funcionario IN (SELECT F.cpf FROM Funcionario F WHERE F.supervisor = '00000000001');

-- 20
SELECT
    LM.capacidade
FROM
    Linha_montagem LM
WHERE
    LM.num_linha = ALL (SELECT MM.linha_montagem FROM Maquina_montagem MM WHERE MM.codigo_identificacao = '0000000001');

DECLARE
    v_salario_mes NUMBER(10,2) := 0;
    v_salario_hora NUMBER(10,2) := 8;
BEGIN
    FOR day IN 1..30 LOOP
        v_salario_mes := v_salario_mes + v_salario_hora * 8;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Salário mensal: ' || v_salario_mes);
    UPDATE Funcionario SET salario = v_salario_mes WHERE cpf = '00000000001';
END;


DECLARE
    CURSOR c_funcionarios_salario
    IS
        SELECT
            salario
        FROM
            Funcionario;
BEGIN    
    FOR salario IN c_funcionarios_salario LOOP
        DBMS_OUTPUT.PUT_LINE('Salário: ' || salario.salario);
    END LOOP;
END;


DECLARE
    CURSOR c_funcionarios_salario_ordenado
    IS
        SELECT
            salario
        FROM
            Funcionario
        ORDER BY
            salario DESC;
    
    func_atual Funcionario.salario%TYPE;
begin
    OPEN c_funcionarios_salario_ordenado;
    FETCH c_funcionarios_salario_ordenado INTO func_atual;
    while c_funcionarios_salario_ordenado%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE('Salário: ' || func_atual);
        FETCH c_funcionarios_salario_ordenado INTO func_atual;
    end loop;
end;

DECLARE
    CURSOR c_funcionarios_salario_ordenado
    IS
        SELECT
            salario
        FROM
            Funcionario
        ORDER BY
            salario DESC;
    
    func_atual Funcionario.salario%TYPE;
    gasto_total NUMBER(10,2) := 0;

begin
    OPEN c_funcionarios_salario_ordenado;
loop
    FETCH c_funcionarios_salario_ordenado INTO func_atual;
    gasto_total := gasto_total + func_atual;
    exit when gasto_total > 20000;
end loop;
DBMS_OUTPUT.PUT_LINE('Precisamos demitir todos os funcionarios que ganham mais que ' || gasto_total);
    end;

DECLARE    
    nv_num_linha INTEGER := 2;
    nv_capacidade INTEGER;
    nv_nivelcapacidade VARCHAR2(255);
BEGIN
    SELECT capacidade INTO nv_capacidade FROM Linha_montagem WHERE num_linha = nv_num_linha;
    CASE nv_capacidade
        WHEN 10 THEN nv_nivelcapacidade := 'nivel A';
        WHEN 11 THEN nv_nivelcapacidade := 'nivel B';
        WHEN 12 THEN nv_nivelcapacidade := 'nivel C';
        WHEN 13 THEN nv_nivelcapacidade := 'nivel D';
        WHEN 14 THEN nv_nivelcapacidade := 'nivel E';
        WHEN 15 THEN nv_nivelcapacidade := 'nivel F';
        WHEN 16 THEN nv_nivelcapacidade := 'nivel G';
        WHEN 17 THEN nv_nivelcapacidade := 'nivel H';
        WHEN 18 THEN nv_nivelcapacidade := 'nivel I';
    END CASE;
        dbms_output.put_line(nv_nivelcapacidade);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Não foi possivel identificar a capacidade');
END;

DECLARE
    nv_telefone_revendedora Telefone_revendedora%ROWTYPE;
BEGIN
    nv_telefone_revendedora.cod_revendedora := '00000000000111';
    nv_telefone_revendedora.num_telefone := '(99)9456-9989';
    
    dbms_output.put_line(nv_telefone_revendedora.cod_revendedora);
    dbms_output.put_line(nv_telefone_revendedora.num_telefone);
END;

CREATE OR REPLACE PACKAGE funcionario_utils AS
    FUNCTION get_salario_mensal(p_salario_hora NUMBER) RETURN NUMBER;
    FUNCTION get_salario_anual(p_salario_hora NUMBER) RETURN NUMBER;
END funcionario_utils;

CREATE OR REPLACE PACKAGE BODY funcionario_utils AS
    FUNCTION get_salario_mensal(p_salario_hora NUMBER) RETURN NUMBER IS
        v_salario_mes NUMBER(10,2) := 0;
    BEGIN
        FOR day IN 1..30 LOOP
            v_salario_mes := v_salario_mes + p_salario_hora * 8;
        END LOOP;
        RETURN v_salario_mes;
    END;
    
    FUNCTION get_salario_anual(p_salario_hora NUMBER) RETURN NUMBER IS
        v_salario_anual NUMBER(10,2) := 0;
    BEGIN
        FOR month IN 1..12 LOOP
            v_salario_anual := v_salario_anual + get_salario_mensal(p_salario_hora);
        END LOOP;
        RETURN v_salario_anual;
    END;
END funcionario_utils;
