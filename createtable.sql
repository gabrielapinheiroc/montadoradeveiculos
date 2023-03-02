-- OK
CREATE TABLE Funcionario (
    cpf VARCHAR2(11) NOT NULL, 
    primeiro_nome varchar2(50),
    sobrenome varchar2(50),
    salario number(9,2), 
    funcao varchar2(30),
    supervisor VARCHAR2(11), --cpf

    CONSTRAINT funcionario_pkey PRIMARY KEY (cpf), 

    CONSTRAINT funcionario_fkey FOREIGN KEY (supervisor) REFERENCES Funcionario(cpf)

);

 -- OK
CREATE TABLE Maquina (
    codigo_identificacao VARCHAR2(10) NOT NULL,
    modelo VARCHAR2(30), -- nomedomodelo
    data_fabricacao date,

    CONSTRAINT maquina_pkey PRIMARY KEY (codigo_identificacao)
);

 -- NEW - 02270
CREATE TABLE Modelo_maquina (

    nome_modelo VARCHAR2(30) NOT NULL, -- nomedomodelo
    fabricante VARCHAR2(14), -- cnpjfabricante

    CONSTRAINT modelo_maquina_pkey PRIMARY KEY (nome_modelo),

    CONSTRAINT modelo_maquina_fkey FOREIGN KEY (nome_modelo) REFERENCES Maquina(modelo)

);

-- OK
CREATE TABLE Maquina_montagem (
    codigo_identificacao VARCHAR2(10) NOT NULL, 
    linha_montagem INTEGER, -- linhas: 1 a 9
    CHECK (linha_montagem  >= 1 AND linha_montagem  <= 9), -- linhas: 1 a 9

    CONSTRAINT maquina_montagem_pkey PRIMARY KEY (codigo_identificacao),

    CONSTRAINT maquina_montagem_fkey FOREIGN KEY (codigo_identificacao) REFERENCES Maquina(codigo_identificacao)
);

-- NEW - 02270
CREATE TABLE Linha_montagem (
    num_linha INTEGER,    
    CHECK (num_linha >= 1 AND num_linha <= 9), -- linhas: 1 a 9
    capacidade INTEGER, --Cap de car/h

    CONSTRAINT linha_montagem_pkey PRIMARY KEY (num_linha),

    CONSTRAINT linha_montagem_fkey FOREIGN KEY (num_linha) REFERENCES Maquina_montagem(linha_montagem)
);

-- OK
CREATE TABLE Maquina_controle_qualidade (
    codigo_identificacao VARCHAR2(10) NOT NULL, 
    parametros_teste VARCHAR2(1),  -- template -- A, B or C
    limites_tolerancia VARCHAR2(1),  -- template -- A, B or C
    
    CONSTRAINT maquina_controle_qualidade_pkey PRIMARY KEY (codigo_identificacao),

    CONSTRAINT maquina_controle_qualidade_fkey FOREIGN KEY (codigo_identificacao) REFERENCES Maquina(codigo_identificacao)
);

-- OK
CREATE TABLE Veiculo (
    n_chassi VARCHAR2(17) NOT NULL,
    modelo VARCHAR2(30), 
    cor VARCHAR2(15), 
    ano INTEGER,

    CONSTRAINT veiculo_pkey PRIMARY KEY (n_chassi)

);

-- NEW - 02270
CREATE TABLE Custo_veiculo( 
    modelo VARCHAR2(30), 
    cor VARCHAR2(15), 
    ano INTEGER, 
    custo_producao number(14,2),

    CONSTRAINT custo_veiculo_pkey PRIMARY KEY (modelo, cor, ano),

    CONSTRAINT custo_veiculo_fkey FOREIGN KEY (modelo, cor, ano) REFERENCES Veiculo(modelo, cor, ano)
    --CONSTRAINT custo_veiculo_fkey1 FOREIGN KEY (modelo) REFERENCES Veiculo(modelo),
    --CONSTRAINT custo_veiculo_fkey2 FOREIGN KEY (cor) REFERENCES Veiculo(cor),
    --CONSTRAINT custo_veiculo_fkey3 FOREIGN KEY (ano) REFERENCES Veiculo(ano)
);

-- OK
CREATE TABLE Revendedora (
    cnpj VARCHAR2(14) NOT NULL, 

    CONSTRAINT revendedora_pkey PRIMARY KEY (cnpj)
);

-- OK
CREATE TABLE Peca (
    id INTEGER NOT NULL,
    categoria VARCHAR2(1),  -- template -- A, B or C
    maquina_inspetora VARCHAR2(10),  -- cod
    veiculo_recebedor VARCHAR2(17),  -- n_chassi
    data_inspecao date,

    CONSTRAINT peca_pkey PRIMARY KEY (id),

    CONSTRAINT peca_fkey1 FOREIGN KEY (maquina_inspetora) REFERENCES Maquina_controle_qualidade(codigo_identificacao),
    CONSTRAINT Peca_fkey2 FOREIGN KEY (veiculo_recebedor) REFERENCES Veiculo(n_chassi)
);

-- OK
CREATE TABLE Historico_manutencao (
    codigo_identificacao_maquina INTEGER NOT NULL, 
    data_ date, 
    valor number(9,2),

    CONSTRAINT historico_manutencao_pkey PRIMARY KEY (codigo_identificacao_maquina,data_),

    CONSTRAINT historico_manutencao_fkey FOREIGN KEY (codigo_identificacao_maquina) REFERENCES Maquina(codigo_identificacao)
);

-- OK
CREATE TABLE Telefone_funcionario (
    cpf_funcionario VARCHAR2(11) NOT NULL,
    num_telefone VARCHAR2(13) NOT NULL, -- template -- (81) 8888-8888

    CONSTRAINT telefone_funcionario_pkey PRIMARY KEY (cpf_funcionario, num_telefone),

    CONSTRAINT telefone_funcionario_fkey FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf)
);

 -- OK
CREATE TABLE Telefone_revendedora (
    cod_revendedora VARCHAR2(14) NOT NULL, -- cnpjrevendedora
    num_telefone VARCHAR2(13) NOT NULL, -- template -- (81) 8888-8888

    CONSTRAINT telefone_revendedora_pkey PRIMARY KEY (cod_revendedora, num_telefone),

    CONSTRAINT telefone_revendedora_fkey FOREIGN KEY (cod_revendedora) REFERENCES Revendedora(cnpj)

);

-- OK
CREATE TABLE Vender (
    cnpj_revendedora VARCHAR2(14),
    cpf_funcionario VARCHAR2(11),
    n_chassi VARCHAR2(17),
    
    CONSTRAINT vender_pkey PRIMARY KEY (cnpj_revendedora, cpf_funcionario, n_chassi),

    CONSTRAINT vender_fkey1 FOREIGN KEY (cnpj_revendedora) REFERENCES Revendedora(cnpj),
    CONSTRAINT vender_fkey2 FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf),
    CONSTRAINT vender_fkey3 FOREIGN KEY (n_chassi) REFERENCES Veiculo(n_chassi)
);

-- OK
CREATE TABLE Produzir(
    cod_maquina_montagem VARCHAR2(10) NOT NULL, 
    n_chassi VARCHAR2(17) NOT NULL, 
    cpf_funcionario VARCHAR2(11),
    
    CONSTRAINT produzir_pkey PRIMARY KEY (cod_maquina_montagem, n_chassi),

    CONSTRAINT produzir_fkey1 FOREIGN KEY (cod_maquina_montagem) REFERENCES Maquina_montagem(codigo_identificacao),
    CONSTRAINT produzir_fkey2 FOREIGN KEY (n_chassi) REFERENCES Veiculo(n_chassi),
    CONSTRAINT produzir_fkey3 FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf)
);