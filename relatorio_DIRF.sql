SELECT RA_FILIAL, RA_TPCONTR, RA_CATFUNC, RD_CC, RD_DATPGT, RV_TIPOCOD, RV_COD, RV_DESC, COUNT(RV_COD) AS OCORR, SUM(RD_VALOR) AS VALOR, RV_LCTOP,
CT5_DEBITO, CT5_CREDIT, (CASE WHEN CT5.CT5_SEQUEN IS NOT NULL THEN CT5_SEQUEN ELSE '000' END) AS CT5_SEQUEN
FROM SRV100 SRV 
	LEFT JOIN CT5010 CT5 ON SRV.RV_LCTOP = CT5.CT5_LANPAD AND CT5.D_E_L_E_T_ = '' AND CT5.CT5_FILIAL= '01'
	INNER JOIN SRD100 SRD ON SRD.RD_PD = SRV.RV_COD AND SRD.D_E_L_E_T_ = ''
	INNER JOIN SRA100 SRA ON SRD.RD_FILIAL = SRA.RA_FILIAL AND SRD.RD_MAT = SRA.RA_MAT AND SRA.D_E_L_E_T_ = '' AND SRA.RA_FILIAL= '01' 
WHERE SRD.RD_DATPGT BETWEEN '20170801' AND '20170831' 
	AND SRV.RV_COD IN ('705', '402', '720', '496', '706', '501', '707', '552') 
	AND SRV.D_E_L_E_T_ = '' 
	AND RD_CC = '210240'
GROUP BY RD_CC, RV_COD, RA_FILIAL, RD_DATPGT, RV_DESC, RV_LCTOP, CT5_DEBITO, CT5_CREDIT, RA_CATFUNC, RV_TIPOCOD, RA_TPCONTR, CT5.CT5_SEQUEN, RD_CC
ORDER BY RD_CC, RD_DATPGT, RV_TIPOCOD

--v02
SELECT '000000' USUARIO, RA_FILIAL, RA_TPCONTR, RA_CATFUNC, RD_CC, CTT_DESC01, RD_DATPGT, RV_TIPOCOD, RV_COD, RV_DESC, COUNT(RV_COD) AS OCORR, 
SUM(RD_VALOR) AS VALOR, RV_LCTOP  
FROM SRV100 SRV  
	INNER JOIN SRD100 SRD ON SRD.RD_PD = SRV.RV_COD 
		AND SRD.D_E_L_E_T_ = ''  
	INNER JOIN SRA100 SRA ON SRD.RD_FILIAL = SRA.RA_FILIAL 
		AND SRD.RD_MAT = SRA.RA_MAT 
		AND SRA.D_E_L_E_T_ = '' 
		AND SRA.RA_FILIAL = '01'  
	LEFT JOIN CTT100 CTT ON CTT.CTT_CUSTO = SRD.RD_CC 
		AND CTT.D_E_L_E_T_ = ''  
WHERE SRD.RD_DATPGT BETWEEN '20171001' AND '20171031'   
	AND SRV.RV_COD IN ('705', '402', '720', '496', '706', '501', '707', '552') 
	AND SRV.D_E_L_E_T_ = ''  
GROUP BY RD_CC, RV_COD, RA_FILIAL, RD_DATPGT, RV_DESC, RV_LCTOP, RA_CATFUNC, RV_TIPOCOD, RA_TPCONTR, RD_CC, CTT_DESC01
