SELECT '000000' USUARIO, RA_FILIAL, RA_TPCONTR, RA_CATFUNC, RD_CC, RD_DATARQ, RV_TIPOCOD, RV_COD , RV_DESC, COUNT(RV_COD) AS OCORR, SUM(RD_VALOR) AS VALOR, RV_LCTOP, CT5_DEBITO, CT5_CREDIT, 
(CASE WHEN CT5.CT5_SEQUEN IS NOT NULL THEN CT5_SEQUEN ELSE '000' END) AS CT5_SEQUEN 
FROM SRV010 SRV 
LEFT JOIN CT5060 CT5 ON SRV.RV_LCTOP = CT5.CT5_LANPAD AND CT5.D_E_L_E_T_ = ''  
INNER JOIN SRD060 SRD ON SRD.RD_PD = SRV.RV_COD 
INNER JOIN SRA060 SRA ON SRD.RD_FILIAL = SRA.RA_FILIAL and SRD.RD_MAT = SRA.RA_MAT 
INNER JOIN CTT060 CTT ON CTT.CTT_CUSTO = RD_CC AND CTT.D_E_L_E_T_ = '' 
WHERE SRD.D_E_L_E_T_ = '' AND SRD.RD_DATARQ BETWEEN '201710' AND '201710' AND SRA.RA_FILIAL = '01' AND RV_COD = '706'
GROUP BY RD_CC, RV_COD, RA_FILIAL, RD_DATARQ, RV_DESC, RV_LCTOP, CT5_DEBITO, CT5_CREDIT, RA_CATFUNC, RV_TIPOCOD, RA_TPCONTR, CT5.CT5_SEQUEN  
