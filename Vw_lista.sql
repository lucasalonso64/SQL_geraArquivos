SELECT        TOP (100) PERCENT '=;' + MATRICULADO.MATR_MATRICULA + ';' + CASE WHEN (IDTM_IDENTIFICACAOASSOCIADA IS NULL) OR
                         (IDTM_IDENTIFICACAOASSOCIADA = MATR_MATRICULA) 
                         THEN IDTF_CODIGO ELSE IDTM_IDENTIFICACAOASSOCIADA END + ';' + 'P' + ';' + + 'N' + ';' + + 'N' + ';' + + 'N' + ';' + + 'N' + ';' + + MATRICULADO.MATR_MATRICULA +
                          ';' + FORACESSO.PESSOA.PESS_NOME + ';' + + '' + ';' + + '' + ';' + + '' + ';' + + '' + ';' + + '' + ';' + + CASE WHEN MATR_MATRICULA IN ('00041519', '00041711', 
                         '00041919', '00041546', '00041870', '00011354', '00041740', '00041741', '00041742', '00041818', '00012292', '00009536', '00041587', '00014773', '00041129', 
                         '00041835', '00041891', '00015991', '00015861', '00010120', '00010457', '00006994', '00013612', '00041252', '00041673', '00041846', '00041897', '00014947') 
                         THEN 'DIFERENCIADO;' ELSE 'SIMPLES;' END + emp.EMPR_NOME + ' - ' + ISNULL(SRA.DEFINICAO COLLATE DATABASE_DEFAULT, '') 
                         + ';' + + '0' + ';' + + '0' + ';' + + '0' + ';' + + '0' + ';' + + CASE WHEN MATR_MATRICULA IN ('00041519', '00041711', '00041919', '00041546', '00041870', '00011354', 
                         '00041740', '00041741', '00041742', '00041818', '00012292', '00009536', '00041587', '00014773', '00041129', '00041835', '00041891', '00015991', '00015861', 
                         '00010120', '00010457', '00006994', '00013612', '00041252', '00041673', '00041846', '00041897', '00014947') 
                         THEN '05;' ELSE '01;' END + + '0' + ';' + + '0' + ';' + + '0' + ';' + + 'N' + ';' + + '' + ';' + + '' + ';' + + '' + ';' + + '' + ';' + + '' + ';' + + '' + ';' + + '' + ';' + + '' + ';' + + '' + ';' + + ''
                          + ';' + + '' + ';' + + '' + ';' + + 'S' + ';' + + 'N' + ';' + + 'N' + ';' + + 'N' + ';' + + '' + ';' + + '' + ';' + ';' AS EXPORTACAO
FROM            FORACESSO.MATRICULADO AS MATRICULADO INNER JOIN
                         FORACESSO.PESSOA ON FORACESSO.PESSOA.PESS_ID = MATRICULADO.PESS_ID INNER JOIN
                         FORACESSO.IDENTIFICACAO_MATRICULADO AS IMATRI ON MATRICULADO.MATR_ID = IMATRI.MATR_ID AND 
                         MATRICULADO.MATR_MATRICULA <> IMATRI.IDTF_CODIGO INNER JOIN
                         FORACESSO.MATRICULADO_ALOCACAO AS ALOC ON MATRICULADO.MATR_ID = ALOC.MATR_ID INNER JOIN
                         FORACESSO.EMPRESA AS emp ON emp.EMPR_ID = ALOC.EMPR_ID LEFT OUTER JOIN
                         [EPCSDB03\DB03].EPCELPDBS0001.dbo.vw_SRA AS SRA ON RIGHT(MATRICULADO.MATR_MATRICULA, 6) = SRA.RA_MAT COLLATE DATABASE_DEFAULT AND 
                         SRA.RA_DEMISSA = '' AND SRA.D_E_L_E_T_ <> '*'
WHERE        (MATRICULADO.MATR_ATIVO = 1) AND (IMATRI.IDMT_BAIXA IS NULL) AND (SRA.DEFINICAO IS NOT NULL) OR
                         (MATRICULADO.MATR_ATIVO = 1) AND (IMATRI.IDMT_BAIXA IS NULL) AND (emp.EMPR_ID = 5)
ORDER BY FORACESSO.PESSOA.PESS_NOME