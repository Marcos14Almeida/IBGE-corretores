# IBGE Corretores de Seguro

## Descrição do Projeto 

  Projeto para identificar a média de idade de corretores de seguro no brasil, através dos dados oficiais das pesquisas do IBGE usando a linguagem R.

## Como usar o Projeto

Mudando o ano ou trimestre da função get_pnadc do pacote "PNADcIBGE", podemos obter os dados das pesquisas realizadas pelo IBGE. Com esses dados podemos filtrar os tipos de informações que são relevantes procurando na planilha "dicionario_PNADC_microdados_trimestral", assim podemos filtrar a coluna de profissão por idade, sexo, UF etc...
Porém cada profissão possui um código associado registrado no seguinte documento: "https://silo.tips/download/classificaao-de-ocupaoes-para-pesquisas-domiciliares-cod-2"
Como procuramos agentes de seguro o código associado é "3321".

Por fim, retiramos dessa coluna de profissão os valores NA associados e todos os valores que não são correspondentes a profissão procurada. O resultado final com uma tabela só com as informações só com as pessoas procuradas é salvo em um novo dataframe, e as informações são exibidas ao usuário. 

## Como Executar o projeto

Com o RStudio na versão no mínimo 4.1.3!!! execute o arquivo "corretores.R". Ele irá baixar os dados, filtrar a informação relevante e mostrar no terminal os resultados obtidos. 

## Resultados obtidos

 Em 2019, a média de idade dos corretores de seguro foi de 42 anos. O resultado pode visualizado na imagem a seguir:

<p align="center">
  <img src="https://github.com/Marcos14Almeida/IBGE-corretores/blob/main/resultados%202019.png" width="600" title="Resultados 2019">
  </a>
</p>
