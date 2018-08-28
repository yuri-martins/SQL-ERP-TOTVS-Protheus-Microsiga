DECLARE @DATAINI VARCHAR(8);
DECLARE @DATAFIM VARCHAR(8);

SET @DATAINI = '20170101'
SET @DATAFIM = '20170115'

SELECT * FROM 
(SELECT 'EMP01 ' AS EMPRESA,'01' AS CODIGO,CT2_FILIAL, CT2_LOTE, CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*) * 2 
	END) TOTAL 
FROM CT2010
WHERE D_E_L_E_T_ = '' AND CT2_FILIAL = '01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR <> 0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP02' AS EMPRESA,'02' AS CODIGO, CT2_FILIAL, CT2_LOTE, CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 
END) TOTAL 
FROM CT2010
WHERE D_E_L_E_T_=' ' 
	AND CT2_FILIAL = '02' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP03' AS EMPRESA,'03' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2030
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP04' AS EMPRESA,'04' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2040
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP05' AS EMPRESA,'05' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2050
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP06' AS EMPRESA,'06' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2060
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP07' AS EMPRESA,'07' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
	FROM CT2070
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP08' AS EMPRESA,'08' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2080
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP09' AS EMPRESA,'09' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2090
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP10' AS EMPRESA,'10' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2100
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP11' AS EMPRESA,'11' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2110
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP12' AS EMPRESA,'12' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2120
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP13' AS EMPRESA,'13' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2130
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP16' AS EMPRESA,'16' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2160
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP17' AS EMPRESA,'17' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2170
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP18' AS EMPRESA,'18' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2180
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP23' AS EMPRESA,'23' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2230
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP24' AS EMPRESA,'24' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2240
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA
UNION ALL
SELECT 'EMP25' AS EMPRESA,'25' AS CODIGO, CT2_FILIAL, CT2_LOTE,CT2_DATA,
	(CASE CT2_DC 
	WHEN '1' THEN COUNT(*) 
	WHEN '2' THEN COUNT(*) 
	WHEN '3' THEN COUNT(*)*2 END) TOTAL 
FROM CT2250
WHERE D_E_L_E_T_=' ' AND CT2_FILIAL='01' 
	AND CT2_DATA BETWEEN @DATAINI AND @DATAFIM  
	AND CT2_VALOR<>0
GROUP BY CT2_FILIAL,CT2_LOTE, CT2_DC, CT2_DATA) A
ORDER BY CODIGO, CT2_DATA