/*1*/
CREATE TABLE MEDICAMENTO(
	cd_medicamento int,
    nm_medicamento varchar(50),
    cd_anvisa varchar(20),
    ds_medicamento varchar(200),
    vl_venda float(7,2),
    vl_custo float(7,2),
    qt_estoque int,
PRIMARY KEY(cd_medicamento));

CREATE TABLE FORNECEDOR(
	cd_fornecedor int,
    nm_fornecedor varchar(50),
    nr_telefone varchar(15),
    ds_website varchar(100),	
PRIMARY KEY(cd_fornecedor));

CREATE TABLE CATEGORIA(
	cd_categoria int,
    ds_categoria varchar(50),
PRIMARY KEY(cd_categoria));

CREATE TABLE FORNECEDOR_MEDICAMENTO(
	cd_medicamento int,
    cd_fornecedor int,    
  FOREIGN KEY(cd_medicamento)
    REFERENCES MEDICAMENTO(cd_medicamento),
  FOREIGN KEY(cd_fornecedor)
    REFERENCES FORNECEDOR(cd_fornecedor)
);

CREATE TABLE CATEGORIA_MEDICAMENTO(
	cd_categoria int,
	cd_medicamento int,
  FOREIGN KEY(cd_categoria)
    REFERENCES CATEGORIA(cd_categoria),
  FOREIGN KEY(cd_medicamento)
    REFERENCES MEDICAMENTO(cd_medicamento)
);

/*2*/
INSERT INTO MEDICAMENTO VALUES (1, 'Medicamento 1', 111, 'Primeiro medicamento', 10.00, 4.00, 10);
INSERT INTO MEDICAMENTO VALUES (2, 'Medicamento 2', 222, 'Segundo medicamento', 20.00, 8.00, 20);
INSERT INTO MEDICAMENTO VALUES (3, 'Medicamento 3', 333, 'Terceiro medicamento', 30.00, 16.00, 30);
INSERT INTO MEDICAMENTO VALUES (4, 'Medicamento 4', 444, 'Quarto medicamento', 40.00, 8.00, 40);
INSERT INTO MEDICAMENTO VALUES (5, 'Medicamento 5', 555, 'Quinto medicamento', 50.00, 16.00, 50);

INSERT INTO FORNECEDOR VALUES (01, 'Fornecedor 1', '47-01010101', 'www.f1.com.br');
INSERT INTO FORNECEDOR VALUES (02, 'Fornecedor 2', '47-02020202', 'www.f2.com.br');
INSERT INTO FORNECEDOR VALUES (03, 'Fornecedor 3', '47-03030303', 'www.f3.com.br');

INSERT INTO CATEGORIA VALUES (001, 'Categoria 1');
INSERT INTO CATEGORIA VALUES (002, 'Categoria 2');
INSERT INTO CATEGORIA VALUES (003, 'Categoria 3');

INSERT INTO FORNECEDOR_MEDICAMENTO VALUES (1, 01);
INSERT INTO FORNECEDOR_MEDICAMENTO VALUES (1, 02);
INSERT INTO FORNECEDOR_MEDICAMENTO VALUES (2, 02);
INSERT INTO FORNECEDOR_MEDICAMENTO VALUES (2, 03);
INSERT INTO FORNECEDOR_MEDICAMENTO VALUES (3, 02);
INSERT INTO FORNECEDOR_MEDICAMENTO VALUES (4, 01);
INSERT INTO FORNECEDOR_MEDICAMENTO VALUES (5, 03);

INSERT INTO CATEGORIA_MEDICAMENTO VALUES (003, 1);
INSERT INTO CATEGORIA_MEDICAMENTO VALUES (002, 2);
INSERT INTO CATEGORIA_MEDICAMENTO VALUES (001, 3);
INSERT INTO CATEGORIA_MEDICAMENTO VALUES (001, 4);
INSERT INTO CATEGORIA_MEDICAMENTO VALUES (002, 4);
INSERT INTO CATEGORIA_MEDICAMENTO VALUES (002, 5);
INSERT INTO CATEGORIA_MEDICAMENTO VALUES (003, 5);

/*3*/
SELECT nm_medicamento 'Nome', round(((vl_venda-vl_custo)/vl_venda)*100, 2) AS 'Lucro'
FROM MEDICAMENTO
ORDER BY Lucro DESC; 

/*4*/
SELECT m.nm_medicamento 'Nome', m.vl_custo 'Custo', m.qt_estoque 'Estoque', c.ds_categoria 'Categoria'
FROM MEDICAMENTO m, CATEGORIA c, CATEGORIA_MEDICAMENTO k
WHERE c.cd_categoria = k.cd_categoria AND m.cd_medicamento = k.cd_medicamento;

/*5*/
SELECT c.ds_categoria 'Categoria', m.nm_medicamento 'Medicamento'
FROM CATEGORIA c, MEDICAMENTO m, CATEGORIA_MEDICAMENTO k
WHERE c.cd_categoria = k.cd_categoria AND m.cd_medicamento = k.cd_medicamento
ORDER BY c.ds_categoria, m.nm_medicamento;