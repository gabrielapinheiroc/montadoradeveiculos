CREATE TABLE tb_funcionario OF tp_funcionario (
    CPF PRIMARY KEY,
    primeiro_nome NOT NULL,
    sobrenome     NOT NULL,
    salario       NOT NULL,
    funcao        NOT NULL,
    telefone      NOT NULL,
    supervisor SCOPE IS tb_tripulante
);
/