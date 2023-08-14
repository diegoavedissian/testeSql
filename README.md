# testeSql
Teste para ingressar em empresa como analista de dados

Desafio:
⦁	O Banco de dados é relacional, e a linguagem em t-SQL. 
Faça um código com demonstrar a análise dos dados, para que o resultado seja: 
⦁	Valor de venda por CEP.  
	CEP	 	TOTAL 
	01045-001	 R$ 2.188,00 
	01001-902	 R$ 827,00 
	01045-909	 R$ 464,00 
	01045-908	 R$ 392,00 

⦁	Valor de venda por Linha.
	LINHA	 TOTAL 
	LB	 R$ 1.455,00 
	VD	 R$ 989,00 
	UT	 R$ 776,00 
	CL	 R$ 305,00 
	US	 R$ 269,00 
	GM	 R$ 77,00 

⦁	Valor de venda por cliente.
	ID_CLIENTE	 TOTAL 
	123457	 	R$ 2.188,00 
	123456	 	R$ 827,00 
	123459	 	R$ 464,00 
	123458	 	R$ 392,00 

Abaixo, as tabelas necessárias para esse fim:
TABELA: VENDAS
Id_cliente	Valor_Venda	Linha
123456	445	LB
123456	305	CL
123458	392	LB
123459	464	UT
123457	109	UT
123457	203	UT
123457	269	US
123457	618	LB
123457	102	VD
123457	887	VD
123456	77	GM

TABELA: CLIENTE
Id_cliente	CEP
123456	01001-902 
123457	01045-001
123458	01045-908
123459	01045-909

⦁	Analisar a base de dados e verificar se há necessidade de alguma higienização;
⦁	Dos dados, realizar uma análise descritiva - usando as medidas de tendência central, medidas de dispersão, percentis, quartis, e medidas de distribuição;
	
⦁	Há algum outlier?
	Sim. Foi verificada a média de 138 vendas por mes, sendo que em uma determinada data (29/11/2019) as vendas chegaram a 1136. Nota-se que caiu em uma sexta-feira no final do ano, o que se supõe que tenha sido algum tipo de liquidação (como a Black Friday).
 
⦁	Quais as categorias e linhas que mais venderam? 
	linha	categorias	 valor 
	CL	CL - SMARTPHONE	 R$ 14.871.497,08 
	LB	LB - LAVANDERIA	 R$ 11.530.486,69 
	VD	VD - TV 55 - 58	 R$ 1.306.348,92 
	
