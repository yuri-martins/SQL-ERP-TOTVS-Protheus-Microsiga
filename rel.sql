SELECT CASE substring(RA_LOCAL,9,30) 
	WHEN 'RIO BRANCO 23' THEN 'RB'
	WHEN 'RIO BRANCO 27' THEN 'RB'
	WHEN 'RIO BRANCO 28' THEN 'RB'
	WHEN 'RIO BRANCO 29' THEN 'RB'
	WHEN 'RIO BRANCO 35' THEN 'RB'
	WHEN 'ZONA NORTE' THEN 'ZN' 
	WHEN 'ZONA OESTE' THEN 'ZO'
	WHEN 'BAIXADA FLUMINENSE' THEN 'BF' 
	WHEN 'GRANDE NITEROI' THEN 'ZN'	 
	ELSE '' END UNIDADE, 	
CTT_DESC01, CTT_CUSTO, RA_MAT, RA_NOMECMP, RA_ADMISSA, RF_DATABAS, RF_DATAFIM, 
CONVERT(DATE,DateAdd(day, +1, RF_DATAFIM)) AS INICIO_PERIODO, 
CONVERT(DATE,DateAdd(year, +1, RF_DATABAS)) AS MES_COMPETENCIA, CONVERT(DATE,DATEADD(yy,+1,DATEADD(mm,-1, RF_DATAFIM))) AS MES_LIMITE, 
SUBSTRING(RF_DATAINI,1,6) AS MES_FERIAS, RF_DATAINI, CONVERT(DATE,DateAdd(day, +30, RF_DATAINI)) AS DATA_TERMINO, 
CONVERT(DATE,DateAdd(day, +31, RF_DATAINI)) AS DATA_RETORNO,
DATEDIFF(YEAR,GETDATE(),CONVERT(DATE,RF_DATAFIM)) AS ANO,
RF_DFERVAT, RF_DFALVAT, RF_DFERAAT, RF_DFALAAT
FROM SRF090 SRF
	INNER JOIN SRA090 SRA ON RA_MAT = RF_MAT AND SRA.D_E_L_E_T_ = '' AND RA_CATFUNC IN ('M', 'C', 'H') AND RA_SITFOLH <> 'D'
	INNER JOIN CTT090 CTT ON RA_CC = CTT_CUSTO AND CTT.D_E_L_E_T_ = ''
WHERE SRF.D_E_L_E_T_ = '' 
	--AND RF_DATAINI BETWEEN '20170101' AND '20171230'
ORDER BY RA_NOMECMP
