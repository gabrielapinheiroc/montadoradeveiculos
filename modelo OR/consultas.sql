--- TESTE FUNÇÕES --
-- consultar o salário líquido e o saláro bruto anual de um funcionário
DECLARE
    f tp_funcionario;
	salario_liquido NUMBER;
	salario_anual NUMBER;
BEGIN
	SELECT VALUE(F) INTO f FROM tb_funcionario F WHERE F.CPF = '11111111111';
    salario_liquido := f.get_salario_liquido(25);
	salario_anual := f.get_salario_anual();
	dbms_output.put_line('Salario Líquido: ' || salario_liquido);
	dbms_output.put_line('Salario Anual: ' ||salario_anual);
END;
/

-- consultar as informação de uma máquina de montagem de acordo com o seu cód
DECLARE
    m tp_maquina_montagem ;
BEGIN
   SELECT VALUE(M) INTO m FROM tb_maquina_montagem M WHERE M.codigo_identificacao ='M001' ;
    m.exibir_informacoes();
END;
/

-- consultar código de identificação de máquina de controle de qualidade
-- e verificar se os fabricantes de 2 máquinas de controle de qualidade são o mesmo
DECLARE
    m1 tp_maquina_controle_qualidade;
	m2 tp_maquina_controle_qualidade;
	m3 tp_maquina_controle_qualidade;
	cod VARCHAR2(4);
	bool_fab1 NUMBER;
    bool_fab2 NUMBER;
BEGIN
	SELECT VALUE(M) INTO m1 FROM tb_maquina_controle_qualidade M WHERE M.codigo_identificacao = 'M001'; --fabricante = X
	SELECT VALUE(M) INTO m2 FROM tb_maquina_controle_qualidade M WHERE M.codigo_identificacao = 'M002'; --fabricante = Y
	SELECT VALUE(M) INTO m3 FROM tb_maquina_controle_qualidade M WHERE M.codigo_identificacao = 'M003'; --fabricante = X
    cod := m1.get_codigo_identificacao();
	bool_fab1 := m1.mesmo_fabricante(m2);
	bool_fab2 := m1.mesmo_fabricante(m3);
	dbms_output.put_line('Código de Indentificação: ' || cod);
	dbms_output.put_line('Booleana comparação fabricantes m1 e m2: ' ||bool_fab1);
	dbms_output.put_line('Booleana comparação fabricantes m1 e m3: ' ||bool_fab2);
END;
/

-- consultar as informação de um histórico de manutenção
DECLARE
    h tp_historico_manutencao;
BEGIN
    SELECT VALUE(H) INTO h FROM tb_historico_manutencao H WHERE H.maquina.codigo_identificacao = 'M001';
    h.exibir_informacoes();
END;
/

-- consultar os cnpj e telefones dos cnpj começados com 0, (CONSULTA À NESTED TABLE )
SELECT R.cnpj, T.telefone
FROM tb_revendedora R, TABLE(R.lista_telefone) T
WHERE R.cnpj LIKE '0%'
/

-- consultar os telefones de um funcionário (consulta à VARRAY)
SELECT T.telefone FROM tb_funcionario F, table(F.telefone) T WHERE F.CPF = '22222222222';
/

-- consultar informações de uma peça (consulta com SELECT DEREF)
SELECT DEREF(P.maquina_inspetora).codigo_identificacao as cod_maquina, P.categoria as categoria_peca, DEREF(P.veiculo_recebedor).n_chassi as chassi_veiculo, P.data_inspecao_ 
    FROM tb_peca P
    WHERE P.id = 3
/

-- consultar informações de um veículo
SELECT *
    FROM tb_veiculo V
    WHERE V.n_chassi = 'ABCD1234567891234'
/

-- consultar informações das máquinas de controle de qualidade em que o valor 
-- de sua manutenção é superior à média dos valores de todas as manutenções
SELECT *
    FROM tb_maquina_controle_qualidade M
	WHERE codigo_identificacao IN (SELECT DEREF(H.maquina).codigo_identificacao as cod 
                                  FROM tb_historico_manutencao H
                                  WHERE H.valor > (SELECT AVG(valor)
                                                   FROM tb_historico_manutencao))
/

--Consulta quais máquinas inspecionaram as peças de um carro e quando--
SELECT categoria, DEREF (p.maquina_inspetora).codigo_identificacao AS Maquina_Inspetora, data_inspecao_
FROM tb_peca p
WHERE DEREF(p.veiculo_recebedor).n_chassi = 'EFGH2345678912345'
/

--Consulta o número de máquinas que participaram da inspeção das peças de um carro--
SELECT DEREF(p.veiculo_recebedor).n_chassi AS Numero_Chassi, DEREF(p.veiculo_recebedor).modelo AS Modelo, DEREF(p.veiculo_recebedor).ano AS Ano_do_Modelo , COUNT(*) AS N_de_Maquina_Inspetoras
FROM tb_peca p
WHERE DEREF(p.veiculo_recebedor).n_chassi = 'EFGH2345678912345'
GROUP BY DEREF(p.veiculo_recebedor).n_chassi, DEREF(p.veiculo_recebedor).modelo, DEREF(p.veiculo_recebedor).ano
/

-- consultar os dados de todos os veículos vendidos por
--funcionários em que o cpf começa com 3
SELECT DEREF(V.veiculo).n_chassi as n_chassi, 
       DEREF(V.veiculo).modelo as modelo, 
       DEREF(V.veiculo).cor as cor, 
       DEREF(V.veiculo).ano as ano, 
       DEREF(V.veiculo).custo_producao as custo_producao
FROM tb_venda V
WHERE DEREF(V.funcionario).cpf LIKE '3%'
/