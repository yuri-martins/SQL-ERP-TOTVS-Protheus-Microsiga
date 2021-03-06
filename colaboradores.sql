SELECT RA_FILIAL, RA_MAT, RA_NOMECMP, RA_SEXO, RA_DESFUNC, RB_MAT, RA_LOCAL, RA_CATFUNC, RA_CC, RA_CODFUNC, C.R8_TIPO, R8_TIPOAFA, R8_DATAINI, R8_DATAFIM, CTT_DESC01 
FROM SRA100 A
LEFT JOIN CTT100 CTT ON CTT.D_E_L_E_T_ <> '*' AND A.RA_CC = CTT.CTT_CUSTO
LEFT JOIN SRB100 B ON B.D_E_L_E_T_ <> '*' AND A.RA_FILIAL = B.RB_FILIAL AND A.RA_MAT = B.RB_MAT AND B.RB_GRAUPAR = 'F'
LEFT JOIN SR8100 C ON C.D_E_L_E_T_ <> '*' AND A.RA_FILIAL = C.R8_FILIAL AND A.RA_MAT = C.R8_MAT AND C.R8_DATAINI = (SELECT MAX(D.R8_DATAINI) FROM SR8100 D WHERE D.R8_MAT = A.RA_MAT AND D.D_E_L_E_T_ <> '*')
WHERE RA_SITFOLH <> 'D' AND A.D_E_L_E_T_ <> '*' 
--and RA_SEXO LIKE 'M%'

--AND RB_MAT IS NOT NULL /* POSSUI DEPENDENTES */
--AND RB_MAT IS NULL /* NAO POSSUI DEPENDENTES */ 

--AND R8_TIPOAFA IS NULL /*NAO POSSUI AFASTAMENTO */
AND (R8_DATAINI <> '' AND R8_DATAFIM <> '') OR (R8_DATAFIM > GETDATE()) /* POSSUI AFASTAMENTO */ 
--AND RA_CATFUNC = 'M'
ORDER BY R8_DATAFIM

--VERSAO 02

SELECT '" + cUser + "' USUARIO, RA_MAT, RA_NOMECMP, RA_SEXO, RA_DESFUNC, A.RA_CBO, RB_MAT, RA_LOCAL, RA_CATFUNC, RA_CC, RA_CODFUNC, C.R8_TIPOAFA, R8_DATAINI, 
R8_DATAFIM, CTT_DESC01, B.RB_GRAUPAR, A.RA_SITFOLH, C.R8_DURACAO
FROM SRA100 A 
	-- Centro de Custo
	LEFT JOIN CTT100 CTT ON CTT.D_E_L_E_T_ = '' 
		AND A.RA_CC = CTT.CTT_CUSTO 
	-- Dependentes
	LEFT JOIN SRB100 B ON B.D_E_L_E_T_ = '' 
		AND A.RA_FILIAL = B.RB_FILIAL 
		AND A.RA_MAT = B.RB_MAT 
		AND B.RB_GRAUPAR = 'F' -- Verificar Grau de Parentesco (F = Filho)
	-- Afastamentos
	LEFT JOIN SR8100 C ON C.D_E_L_E_T_ = '' 
		AND A.RA_FILIAL = C.R8_FILIAL 
		AND A.RA_MAT = C.R8_MAT 
		AND C.R8_DATAINI = (SELECT MAX(D.R8_DATAINI) FROM SR8100 D WHERE D.R8_MAT = A.RA_MAT AND D.D_E_L_E_T_ = '') 
WHERE RA_SITFOLH <> 'D' 
	AND A.D_E_L_E_T_ = ''
	--AND (R8_DATAINI <> '' AND R8_DATAFIM <> '') OR (R8_DATAFIM > GETDATE()) -- Somente afastados
	--AND RA_SITFOLH <> ''		-- Somente afastados
	--AND RB_MAT IS NOT NULL	-- Com dependente
	--AND RB_MAT IS NULL		-- Sem dependente
GROUP BY RA_MAT, RA_NOMECMP, RA_SEXO, RA_DESFUNC, RB_MAT, RA_LOCAL, RA_CATFUNC, RA_CC, RA_CODFUNC, C.R8_TIPOAFA, R8_DATAINI, R8_DATAFIM, CTT_DESC01, RA_CBO,
RB_GRAUPAR, RA_SITFOLH, R8_DURACAO
ORDER BY RA_NOMECMP
