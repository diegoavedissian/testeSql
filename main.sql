--CRIANDO A TABELA CLIENTE:
CREATE TABLE TB_CLIENTE
(
    ID_CLIENTE      INT         NOT NULL,
    NR_CEP          VARCHAR(9)  NOT NULL,
    --TORNANDO O ID CHAVE PRIMARIA: 
    CONSTRAINT PK_TB_CLIENTE_ID_CLIENTE     PRIMARY KEY (ID_CLIENTE)                        
);

--INSERINDO OS DADOS NA TABELA CLIENTE:
INSERT INTO TB_CLIENTE
(
    ID_CLIENTE,
    NR_CEP
)
VALUES 
(
    123456,	'01001-902 '
    --OBS: COLOQUEI O CEP EXATAMENTE COMO ESTAVA NO TESTE
),
( 
    123457,	'01045-001'
),
( 
    123458,	'01045-908'
),
( 
    123459,	'01045-909'
);

--CRIANDO A TABELA VENDAS:
CREATE TABLE TB_VENDAS
(
    --TOMEI A LIBERDADE DE CRIAR UM ID PARA CADA VENDA, NAO FOI NECESSARIO NESSE CASO MAS É O PADRAO PARA UMA NECESSIDADE FUTURA
    ID_VENDA    INT         IDENTITY(1,1)   NOT NULL,
    ID_CLIENTE  INT         NOT NULL,
    VL_VENDA    DEC(9,2)    NOT NULL,
    SG_LINHA    CHAR(2)     NOT NULL,
    
    --TORNANDO O ID DA VENDA UMA CHAVE PRIMARIA:
    CONSTRAINT PK_TB_VENDAS_ID_VENDA        PRIMARY KEY (ID_VENDA),
    --CRIANDO UMA CHAVE ESTRANGEIRA COM O ID DO CLIENTE:
    CONSTRAINT FK_TB_VENDAS_ID_CLIENTE      FOREIGN KEY (ID_CLIENTE) REFERENCES TB_CLIENTE (ID_CLIENTE) 
);

--INSERINDO DADOS NA TABELA VENDAS:
INSERT INTO TB_VENDAS
(
    ID_CLIENTE,
    VL_VENDA,
    SG_LINHA
)
VALUES 
(
    123456, 445,	'LB'
),
(
    123456,	305,	'CL'
),
(
    123458,	392,	'LB'
),
(
    123459,	464,	'UT'
),
(
    123457,	109,	'UT'
),
(
    123457,	203,	'UT'
),
(
    123457,	269,	'US'
),
(
    123457,	618,	'LB'
),
(
    123457,	102,	'VD'
),
(
    123457,	887,	'VD'
),
( 
    123456,	77,	    'GM'
);

/* 
VALOR DAS VENDAS POR CEP:
FOI FEITO UM JOIN PRA TRAZER OS DADOS DA TB_VENDAS PARA A TB_CLIENTE; A SOMA DOS VALORES POR CEP COM O APELIDO DE 'TOTAL' E 
ORDENACAO POR VALORES, DO MAIOR PARA O MENOR.
*/
SELECT 
    TB_CLIENTE.NR_CEP, 
    SUM(TB_VENDAS.VL_VENDA) AS TOTAL
FROM TB_CLIENTE
    INNER JOIN TB_VENDAS
            ON TB_VENDAS.ID_CLIENTE = TB_CLIENTE.ID_CLIENTE
GROUP BY NR_CEP
ORDER BY TOTAL DESC 

/*
VALOR DAS VENDAS POR LINHA:
FOI FEITA A SOMA DOS VALORES POR LINHA, COM O APELIDO DE 'TOTAL' E ORDENADO POR VALORES DO MAIOR PARA O MENOR
*/
SELECT 
    SG_LINHA, 
    SUM(VL_VENDA) AS TOTAL
FROM TB_VENDAS
GROUP BY SG_LINHA
ORDER BY TOTAL DESC

/*
VALOR DAS VENDAS POR CLIENTE:
FEITO A SOMA DOS VALORES POR CLIENTE COM O APELIDO DE 'TOTAL' E ORDENACAO POR VALOR DO MAIOR PARA O MENOR AGRUPADO POR ID DE CLIENTE
*/
SELECT 
    ID_CLIENTE, 
    SUM(VL_VENDA) AS TOTAL
FROM TB_VENDAS
GROUP BY ID_CLIENTE
ORDER BY TOTAL DESC

--HIGIENIZACAO DOS DADOS DO CEP, RETIRANDO ESPACOS:
UPDATE TB_CLIENTE SET NR_CEP = TRIM(NR_CEP)
