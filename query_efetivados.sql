--COLABORADORES EFETIVADOS

SELECT B.RA_NOME, B.RA_MAT, B.RA_CIC, B.RA_ADMISSA, B.RA_DEMISSA, B.RA_CODFUNC, B.RA_DESFUNC, A.RA_ADMISSA, A.RA_DEMISSA, A.RA_DESFUNC, B.RA_CATFUNC, B.RA_SITFOLH FROM
(SELECT A.RA_MAT, A.RA_NOME, A.RA_CIC, A.RA_ADMISSA, A.RA_DEMISSA, A.RA_CODFUNC, A.RA_CATFUNC, A.RA_SITFOLH, A.RA_DESFUNC FROM SRA090 A WHERE A.RA_CODFUNC = '0001' AND RA_ADMISSA like '201709%') A, --CONSULTOR
(SELECT B.RA_MAT, B.RA_NOME, B.RA_CIC, B.RA_ADMISSA, B.RA_DEMISSA, B.RA_CODFUNC, B.RA_CATFUNC, B.RA_SITFOLH, B.RA_DESFUNC FROM SRA090 B WHERE B.RA_CODFUNC = '1011' AND RA_DEMISSA LIKE '201709%') B --AGENCIADOR AUTONOMO
WHERE A.RA_CIC = B.RA_CIC
