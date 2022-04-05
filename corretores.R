##https://rpubs.com/BragaDouglas/335574
#https://rstudio-pubs-static.s3.amazonaws.com/620616_239e76a94e574d7480f0bb82956be1d5.html
#https://rpubs.com/amrofi/pnadcibge_survey
#https://github.com/Gabriel-Assuncao/PNADcIBGE/issues/1
 
 #Agentes de Seguros - 3321
 #https://www.ibge.gov.br/arquivo/projetos/sipd/oitavo_forum/COD.pdf
 #https://silo.tips/download/classificaao-de-ocupaoes-para-pesquisas-domiciliares-cod-2 
 
#V4010 -> Código da ocupação (cargo ou função)
#V4041 -> Código da ocupação (cargo ou função)
#V2009 -> Idade do morador na data de referência
#V20082 -> Ano de nascimento
#V2007 -> Sexo
#UF -> Estado
#V2010 -> Cor da Pele
#V403311 -> Salário

#tempdir()
#sessionInfo()

# install.packages("PNADcIBGE")
# install.packages("readr")
# install.packages("survey")
 ######################################################################
 
library(PNADcIBGE)
library(readr)
library(dplyr)
library(convey)
library(survey)
packageVersion("PNADcIBGE")

help("get_pnadc")

####################################
#EXTRAÇÃO DOS DADOS
print("start")
dadosPNADc_class <-  get_pnadc(year=2018, quarter=4, defyear=2018, defperiod=4, vars=c("V4010","V2009","V4041","V403311","V2007"),
                                   labels=TRUE, deflator=TRUE, design=TRUE, savedir=tempdir())
print("finished")

#####################################
##Começo da manipulação de dados
variable <- dadosPNADc_class$variables

tabela <- variable[, c("V4010", "V2007", "V403311","UF","V2009")]
names(tabela)[names(tabela) == "V4010"] <- "emprego"
names(tabela)[names(tabela) == "V2007"] <- "sexo"
names(tabela)[names(tabela) == "V403311"] <- "salario"
names(tabela)[names(tabela) == "V2009"] <- "idade"

#Muda NA values in emprego to NA
tabela$emprego <- ifelse(is.na(tabela$emprego),0,tabela$emprego)

#Seleciona somente agentes de seguro = código "3321"
profissao <- tabela
profissao$emprego <- ifelse((profissao$emprego=="3321"),"1","0")
#Remove rows of other professions
resultado <- profissao[profissao$emprego != "0", ]

#######################################
##SHOW RESULTS
summary(resultado$idade)
summary(resultado$sexo)
summary(resultado)


####################
##PROFISSÃO 2
profissaob <- tabela
profissaob$emprego <- ifelse((profissaob$emprego=="1346"),"1","0")
colunab <- profissaob[profissaob$emprego != "0", ]
summary(colunab)








##############################################
##NÃO USADO

#Código de corretor de seguros: 3545-05 // CIUO88 - Agentes de Seguro 3412
#http://www.mtecbo.gov.br/cbosite/pages/pesquisas/BuscaPorTitulo.jsf

tail(tabela,10)

svymean(~V2007+V4010, dadosPNADc_class, na.rm = T)

totalsexoEraca <- svytotal(~interaction(V2007, V403311), dadosPNADc_class, na.rm = TRUE)
ftable(totalsexoEraca)  # coluna A com valor e B com SE
