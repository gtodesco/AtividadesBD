CREATE TABLE VEICULO(
	nr_placa char(7),
    cd_proprietario int,
    cd_modelo int,
    nr_ano_fab int,
    nr_ano_mod int,
    qt_km_rodado int,
    qt_portas int,
    ds_observacao varchar(100)
);

CREATE TABLE MARCA(
	cd_marca int,
    ds_marca varchar(30)
);

CREATE TABLE MODELO(
	cd_modelo int,
    cd_marca int,
    ds_modelo varchar(50)
);

CREATE TABLE PROPRIETARIO(
	cd_proprietario int,
    cd_localidade int,
    nm_proprietario varchar(50),
	ds_logradouro varchar(50),
    ds_complemento varchar(50),
    ds_bairro varchar(50),
    nr_telefone varchar(15),
    ds_email varchar(50),
    sg_uf char(2)
);

CREATE TABLE LOCALIDADE(
	cd_localidade int,
    nm_localidade varchar(50)
);

CREATE TABLE VEICULO_COMBUSTIVEL(
	cd_combustivel int,
    nr_placa char(7)
);

CREATE TABLE COMBUSTIVEL(
	cd_combustivel int,
    ds_combustivel varchar(30)
);