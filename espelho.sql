SELECT SRA.RA_MAT, SRA.RA_NOME, SRA.RA_CATFUNC, SRA.RA_DESFUNC, 
SRA.RA_LOCAL, 
	CASE substring(RA_LOCAL,9,30) 
		WHEN 'RIO BRANCO 23' THEN 'RB'
		WHEN 'RIO BRANCO 27' THEN 'RB'
		WHEN 'RIO BRANCO 28' THEN 'RB'
		WHEN 'RIO BRANCO 29' THEN 'RB'
		WHEN 'RIO BRANCO 35' THEN 'RB'
		WHEN 'ZONA NORTE' THEN 'ZN' 
		WHEN 'ZONA OESTE' THEN 'ZO'
		WHEN 'BAIXADA FLUMINENSE' THEN 'BF' 
		WHEN 'GRANDE NITEROI' THEN 'GN' 
		ELSE '' 
	END UNIDADE, SRD.RD_PD, 
SRV.RV_DESC,  
	CASE SRV.RV_TIPOCOD
		WHEN '1' THEN 'PROVENTO' 
		WHEN '2' THEN 'DESCONTO' 
		WHEN '3' THEN 'BASE' 
	END AS TIPO, 	
SRV.RV_TIPOCOD, SRD.RD_VALOR, SRD.RD_DATARQ, SRD.RD_PERIODO, SRD.RD_MES, SRD.RD_TIPO2, SRD.RD_ROTEIR, RV_CODFOL 
FROM SRD090 SRD  
	INNER JOIN SRA090 SRA ON SRA.RA_MAT = SRD.RD_MAT  AND SRA.RA_SITFOLH <> 'D' 
		--AND SRA.RA_CATFUNC IN ( " + _cCatFunc + ") " --FILTRAR CATEGORIA
		--AND SRA.RA_MAT BETWEEN '" + MV_PAR04 + "' AND '" + MV_PAR05 + "' --FILTRAR MATRICULA
		AND SRA.D_E_L_E_T_ = '' 
	INNER JOIN SRV090 SRV ON SRV.RV_COD = SRD.RD_PD 
		AND SRV.D_E_L_E_T_ = '' 
WHERE SRD.RD_DATARQ BETWEEN '20171201' AND '20190131'  --FILTRAR PERIODO
	AND SRD.RD_MAT  NOT IN () --FILTRAR MATRICULA 
	--AND RD_PD IN ('698','799','179','180','126','108','137', '321', '507') 
	AND SRD.D_E_L_E_T_ = '' 
	AND SRD.RD_ROTEIR = 'FOL' 
GROUP BY RA_DESFUNC, SRA.RA_MAT, SRA.RA_NOME, SRA.RA_CATFUNC, SRA.RA_LOCAL, SRD.RD_PD, SRV.RV_DESC,
SRV.RV_TIPOCOD, SRD.RD_VALOR, SRD.RD_DATARQ, SRD.RD_PERIODO, SRD.RD_MES, SRD.RD_TIPO2, SRD.RD_ROTEIR, RV_CODFOL  

ORDER BY RD_DATARQ, RA_DESFUNC, RA_NOME, RV_TIPOCOD
