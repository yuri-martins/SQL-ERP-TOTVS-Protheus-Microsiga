SELECT RA_MAT, RA_NOME, RV_COD, RV_TIPOCOD, RV_DESC, RD_MES, RD_VALOR FROM SRA090 RA 
	INNER JOIN SRD090 RD ON RD_MAT = RA_MAT
	INNER JOIN SRV090 RV ON RD_PD = RV_COD
WHERE RA_MAT LIKE 'XXX'
	AND RD_PERIODO LIKE '2017%'  
	--AND RD_MES = '01'
	--AND RV_TIPOCOD = '3'
	--AND RV_COD = '799'
ORDER BY RD_MES

/*
RV_TIPOCOD
1 - proventos
2 - descontos
3 - base
*/
