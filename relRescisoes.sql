SELECT * FROM SRD100
SELECT * FROM SRV100
SELECT * FROM SRA100
SELECT * FROM SRG100


SELECT RV_COD, RV_DESC, RD_VALOR, RD_DATPGT, SUBSTRING(RCC_CONTEU,1,2) CODIGO FROM SRV090 SRV
	INNER JOIN SRD090 SRD ON SRD.RD_PD = SRV.RV_COD AND SRD.D_E_L_E_T_ = ''
	INNER JOIN SRG090 SRG ON SRG.RG_MAT = RD_MAT AND SRG.D_E_L_E_T_ = ''
	INNER JOIN RCC090 RCC ON SUBSTRING(RCC.RCC_CONTEU,1,2) = SRG.RG_TIPORES AND RCC.D_E_L_E_T_ = '' AND SUBSTRING(RCC.RCC_CONTEU,1,2) = '23'
	INNER JOIN SRA090 SRA ON SRA.RA_MAT = SRG.RG_MAT AND SRA.D_E_L_E_T_ = '' AND RA_CATFUNC = 'C'
WHERE RV_COD IN ('701', '702', '703', '825', '832') AND RD_DATPGT BETWEEN '2016' AND '2017' AND SRV.D_E_L_E_T_ = '' AND RV_COD = '701'




--PEGAR O CODIGO E DESCRICAO DA RESCISAO
SELECT SUBSTRING(RCC_CONTEU,1,2) CODIGO, SUBSTRING(RCC_CONTEU,3,30) DESCR FROM RCC090 RCC WHERE RCC_CODIGO = 'S043' AND RCC.D_E_L_E_T_ = ''


SELECT RA_MAT, RA_NOME, RA_ADMISSA, RA_DEMISSA, RA_DESFUNC, * FROM SRA090  WHERE RA_DEMISSA BETWEEN '2016' AND '2017' AND RA_CATFUNC = 'C'
