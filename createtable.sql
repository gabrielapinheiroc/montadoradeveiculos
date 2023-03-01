CREATE TABLE Funcionario (
    cpf VARCHAR2(11) NOT NULL, 
    primeiro_nome varchar2(50),
    sobrenome varchar2(50),
    salario number(7,2), 
    funcao varchar2(30),
    supervisor VARCHAR2(11),

    CONSTRAINT funcionario_pkey PRIMARY KEY (cpf), 

    CONSTRAINT funcionario_fkey FOREIGN KEY (supervisor) REFERENCES Funcionario(cpf)

);


CREATE TABLE Telefone_funcionario (
    cpf_funcionario VARCHAR2(11) NOT NULL,
    num_telefone VARCHAR2(13) NOT NULL, -- template -- (81) 8888-8888

    CONSTRAINT telefone_funcionario_pkey PRIMARY KEY (cpf_funcionario, num_telefone),

    CONSTRAINT telefone_funcionario_fkey FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf)

);



CREATE TABLE Revendedora (
    cnpj VARCHAR2(11) NOT NULL, 

    CONSTRAINT revendedora_pkey PRIMARY KEY (cnpj)
);

-- IN PROGRESS

CREATE TABLE Peca (
    id VARCHAR2(10),
    categoria VARCHAR2(1),  -- template -- A, B or C
    maquina_inspetora VARCHAR2(10),  -- cod
    veiculo_recebedor VARCHAR2(17),  -- n_chassi
    data_inspecao date,

    CONSTRAINT Peca_pkey PRIMARY KEY (id),

    CONSTRAINT Peca_fkey1 FOREIGN KEY (maquina_inspetora) REFERENCES Maquina_controle_qualidade(codigo_identificacao),
    CONSTRAINT Peca_fkey2 FOREIGN KEY (veiculo_recebedor) REFERENCES Veiculo(n_chassi)

)

CREATE TABLE Telefone_revendedora (
    cod_revendedora VARCHAR2(11) NOT NULL,
    num_telefone VARCHAR2(13) NOT NULL, -- template -- (81) 8888-8888

    CONSTRAINT telefone_revendedora_pkey PRIMARY KEY (cod_revendedora, num_telefone),

    CONSTRAINT telefone_revendedora_fkey FOREIGN KEY (cod_revendedora) REFERENCES Revendedora(cnpj)

);

-- #DUVIDA: o que fazer quando a chave primaria é uma chave estrangeira?
CREATE TABLE Data_venda (
    n_chassi VARCHAR2(17) NOT NULL,
    data_chegada_revendedora date NOT NULL, 
    data_saida_montadora date NOT NULL,

    CONSTRAINT Data_venda_pkey PRIMARY KEY (n_chassi),

    CONSTRAINT Data_venda_fkey FOREIGN KEY (n_chassi) REFERENCES Veiculo(n_chassi)

);