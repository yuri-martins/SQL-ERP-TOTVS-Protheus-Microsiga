/*
RELATORIO CONTROLE DE FERIAS DOS COLABORADORES
*/

SELECT  
(SELECT P3_MESDIA 
FROM SP3100 
WHERE P3_MESDIA = SUBSTRING(CONVERT(VARCHAR(10), IDEAL_NOVO, 112),5,2)+SUBSTRING(CONVERT(VARCHAR(10), IDEAL_NOVO, 112),7,2) AND D_E_L_E_T_ = '') FERIADO1, 
(SELECT P3_MESDIA 
FROM SP3100 
WHERE P3_MESDIA = SUBSTRING(CONVERT(VARCHAR(10), IDEALMAX_NOVO, 112),5,2)+SUBSTRING(CONVERT(VARCHAR(10), IDEALMAX_NOVO, 112),7,2) AND D_E_L_E_T_ = '') FERIADO2,* 
FROM
( SELECT 
P3_DATA, P3_MESDIA, DIA_IDEALMAX, 
CASE DIA_IDEALMAX
	WHEN '1' THEN DateAdd(day, -4, IDEALMAX) --SE DOMINGO (DESCAMSO SEMANAL REMUNERADO) 72H ANTES
	WHEN '7' THEN DateAdd(day, -4, IDEALMAX) --SE SABADO (DESCAMSO SEMANAL REMUNERADO) 72H ANTES	
	ELSE IDEALMAX
	END AS IDEALMAX_NOVO, 
DIA_IDEAL, 
CASE DIA_IDEAL
	WHEN '1' THEN DateAdd(day, -4, IDEAL) --SE DOMINGO (DESCAMSO SEMANAL REMUNERADO) 72H ANTES
	WHEN '7' THEN DateAdd(day, -4, IDEAL) --SE SABADO (DESCAMSO SEMANAL REMUNERADO) 72H ANTES	
	ELSE IDEAL
	END AS IDEAL_NOVO, 
UN, DESCRICAO_CC, CTT_CUSTO, RA_MAT, RA_NOMECMP, RA_DESFUNC, RA_CATFUNC, RA_ADMISSA, BASEDATA, FIMDATA, MESANO,
RF_DATAINI, RF_DFERVAT, RF_DFALVAT, RF_DFERAAT, RF_DFALAAT, RF_DIASDIR, RF_STATUS
FROM
(SELECT CASE substring(SRA.RA_LOCAL,9,30) 
	WHEN 'RIO BRANCO 23' THEN 'RB'
	WHEN 'RIO BRANCO 27' THEN 'RB'
	WHEN 'RIO BRANCO 28' THEN 'RB'
	WHEN 'RIO BRANCO 29' THEN 'RB'
	WHEN 'RIO BRANCO 35' THEN 'RB'
	WHEN 'ZONA NORTE' THEN 'ZN' 
	WHEN 'ZONA OESTE' THEN 'ZO'
	WHEN 'BAIXADA FLUMINENSE' THEN 'BF' 
	WHEN 'GRANDE NITEROI' THEN 'GN'	 
	WHEN 'JARDIM DE MESQUITA' THEN 'JM'
	WHEN 'PRESIDENTE VARGAS' THEN 'PV'
	ELSE '' 
	END UN, 	
	CTT.CTT_DESC01 AS DESCRICAO_CC, CTT.CTT_CUSTO, SRA.RA_MAT, SRA.RA_NOMECMP, SRA.RA_DESFUNC, SRA.RA_CATFUNC,
	SRA.RA_ADMISSA, P3_DATA, P3_MESDIA,
	CONVERT(DATE,SRF.RF_DATABAS,103) BASEDATA, 
	CONVERT(DATE,SRF.RF_DATAFIM,103) FIMDATA,
	(SUBSTRING(RF_DATAFIM,5,2) + '/' + SUBSTRING(RF_DATAFIM,1,4)) AS MESANO,
	CONVERT(DATE,DateAdd(day, +30, SRF.RF_DATAFIM)) AS IDEAL,
	CONVERT(DATE,dateadd(day, -92, DateAdd(year, +1, SRF.RF_DATAFIM)))   AS IDEALMAX,
	DATEPART(DW,CONVERT(DATE,dateadd(day, -92, DateAdd(year, +1, SRF.RF_DATAFIM)))) DIA_IDEALMAX,
	DATEPART(DW,CONVERT(DATE,dateadd(day, +30, DateAdd(year, +1, SRF.RF_DATAFIM)))) DIA_IDEAL,
	RF_DATAINI, SRF.RF_DFERVAT, SRF.RF_DFALVAT, SRF.RF_DFERAAT, SRF.RF_DFALAAT,RF_DIASDIR, RF_STATUS
FROM SRF100 SRF
	INNER JOIN SRA100 SRA ON SRA.RA_MAT = SRF.RF_MAT 
		AND SRA.D_E_L_E_T_ = '' 
		--AND SRA.RA_CATFUNC = 'E' -- INSERIR CATEGORIA DO COLABORADOR 
		AND SRA.RA_SITFOLH <> 'D' -- EXCLUIR COLABORADORES DEMITIDOS
	INNER JOIN CTT100 CTT ON SRA.RA_CC = CTT.CTT_CUSTO 
		AND CTT.D_E_L_E_T_ = ''
		AND RF_STATUS = '1' -- FILTRANDO COLABORADORES C/ FERIAS ATIVAS (1-ATIVO / 2- PRESCRITO / 3-PAGO)
	LEFT JOIN SP3100 SP3 ON (SP3.P3_DATA = dateadd(day, -92, DateAdd(year, +1, SRF.RF_DATAFIM)) 
		OR SP3.P3_DATA = DateAdd(day, +30, SRF.RF_DATAFIM))
		AND SP3.D_E_L_E_T_= ''
WHERE SRF.D_E_L_E_T_ = '' 	
) TESTE1 
) TESTE2
