CREATE TABLE VEICULO(
	nr_placa char(7),
    cd_cor int,
    cd_proprietario int,
    cd_modelo int,
    nr_ano_fab int,
    nr_ano_mod int,
    qt_km_rodado int,
    qt_portas int,
    ds_observacao varchar(100),
CONSTRAINT VEICULO_nr_placa_pk PRIMARY KEY (nr_placa));

CREATE TABLE MARCA(
	cd_marca int,
    ds_marca varchar(30),
CONSTRAINT MARCA_cd_marca_pk PRIMARY KEY(cd_marca));

CREATE TABLE MODELO(
	cd_modelo int,
    cd_marca int,
    ds_modelo varchar(50),
CONSTRAINT MODELO_cd_modelo_pk PRIMARY KEY(cd_modelo));

CREATE TABLE PROPRIETARIO(
	cd_proprietario int,
    cd_localidade int,
    nm_proprietario varchar(50),
	ds_logradouro varchar(50),
    ds_complemento varchar(50),
    ds_bairro varchar(50),
    nr_telefone varchar(15),
    ds_email varchar(50),
    sg_uf char(2),
CONSTRAINT PROPRIETARIO_cd_proprietario_pk PRIMARY KEY(cd_proprietario));

CREATE TABLE LOCALIDADE(
	cd_localidade int,
    nm_localidade varchar(50),
CONSTRAINT LOCALIDADE_cd_localidade_pk PRIMARY KEY(cd_localidade));

CREATE TABLE VEICULO_COMBUSTIVEL(
	cd_combustivel int,
    nr_placa char(7)
);

CREATE TABLE COMBUSTIVEL(
	cd_combustivel int,
    ds_combustivel varchar(30),
CONSTRAINT COMBUSTIVEL_cd_combustivel_pk PRIMARY KEY(cd_combustivel));

CREATE TABLE COR(
	cd_cor int,
    ds_cor varchar(30),
CONSTRAINT COR_cd_cor_pk PRIMARY KEY(cd_cor));

CREATE TABLE VEICULO_ACESSORIO(
	nr_placa char(7),
    cd_acessorio int
);

CREATE TABLE ACESSORIO(
	cd_acessorio int,
    ds_acessorio varchar(50),
CONSTRAINT ACESSORIO_cd_acessorio_pk PRIMARY KEY(cd_acessorio));

ALTER TABLE VEICULO
ADD CONSTRAINT VEICULO_cd_cor_fk FOREIGN KEY (cd_cor) REFERENCES COR (cd_cor),
ADD CONSTRAINT VEICULO_cd_proprietario_fk FOREIGN KEY (cd_proprietario) REFERENCES PROPRIETARIO (cd_proprietario),
ADD CONSTRAINT VEICULO_cd_modelo_fk FOREIGN KEY (cd_modelo) REFERENCES MODELO (cd_modelo);

ALTER TABLE MODELO
ADD CONSTRAINT MODELO_cd_marca_fk FOREIGN KEY(cd_marca) REFERENCES MARCA(cd_marca);

ALTER TABLE PROPRIETARIO
ADD CONSTRAINT PROPRIETARIO_cd_localidade_fk FOREIGN KEY(cd_localidade) REFERENCES LOCALIDADE(cd_localidade);

ALTER TABLE VEICULO_COMBUSTIVEL
ADD CONSTRAINT VEICULO_COMBUSTIVEL_cd_combustivel_fk FOREIGN KEY(cd_combustivel) REFERENCES COMBUSTIVEL(cd_combustivel),
ADD CONSTRAINT VEICULO_COMBUSTIVEl_nr_placa_fk FOREIGN KEY(nr_placa) REFERENCES VEICULO(nr_placa);

ALTER TABLE VEICULO_ACESSORIO
ADD CONSTRAINT VEICULO_ACESSORIO_nr_placa_fk FOREIGN KEY(nr_placa) REFERENCES VEICULO(nr_placa),
ADD CONSTRAINT VEICULO_ACESSORIO_cd_acessorio_fk FOREIGN KEY(cd_acessorio) REFERENCES ACESSORIO(cd_acessorio);











