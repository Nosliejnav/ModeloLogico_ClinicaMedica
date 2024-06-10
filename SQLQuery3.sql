-- Banco de Dados Clínica Médica - Modelo ...

-- drop database clinica_medica;

-- create database clinica_medica;

-- use clinica_medica;

CREATE TABLE paciente (
	cpf varchar(14) PRIMARY KEY,
	nome_paciente varchar(40),
	telefone varchar(14),
	numero_plano int,
	nome_plano varchar(20),
	tipo_plano varchar(10)
);

CREATE TABLE medico (
	crm int PRIMARY KEY,
	nome_medico varchar(30),
	especialidade varchar(20)
);

-- auto incremento --
-- identity (valor inicial, incremento) --
CREATE TABLE pedido_exame (
	numero_pedido int identity(2200,1) PRIMARY KEY,
	reultado varchar(40),
	data_exame date,
	valor_pagar money,
	fk_consulta_numero_consulta int,
	fk_exame_codigo int
);

-- auto incremento --
-- identity (valor inicial, incremento) --
CREATE TABLE consulta (
	numero_consulta int identity (22000,1) PRIMARY KEY,
	data_consulta date,
	horaio_consulta time,
	fk_paciente_cpf varchar(14),
	fk_medico_crm int
);

CREATE TABLE exame (
	codigo int PRIMARY KEY,
	especificacao varchar(20),
	preco money
);

ALTER TABLE pedido_exame ADD CONSTRAINT FK_pedido_exame_2
	FOREIGN KEY (fk_consulta_numero_consulta)
	REFERENCES consulta (numero_consulta)
	ON DELETE CASCADE;

ALTER TABLE pedido_exame ADD CONSTRAINT FK_pedido_exame_3
	FOREIGN KEY (fk_exame_codigo)
	REFERENCES exame (codigo)
--	ON DELETE RESTRICT;

ALTER TABLE consulta ADD CONSTRAINT FK_consulta_2
	FOREIGN KEY (fk_paciente_cpf)
	REFERENCES paciente (cpf)
	ON DELETE CASCADE;

ALTER TABLE consulta ADD CONSTRAINT FK_consulta_3
	FOREIGN KEY (fk_medico_crm)
	REFERENCES medico (crm)
    ON DELETE CASCADE;


-- inclusão e seleção de dados --------------------
select * from paciente;

