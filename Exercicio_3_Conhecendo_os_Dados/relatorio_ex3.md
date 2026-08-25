# Mini relatorio - Exercicio 3: Conhecendo os Dados

## Arquivos desta pasta
- `dados_clientes_ex3.xlsx` - base original criada no Excel (100 clientes, correta e completa).
- `dados_clientes_ex3.csv` - mesma base exportada em CSV, formato usado para abrir no Orange.
- `workflow_ex3.ows` - workflow do Orange Data Mining pronto: File -> Data Table / Distributions / Scatter Plot / Feature Statistics.
  Ao abrir no Orange, clique no widget **File** e selecione o arquivo `dados_clientes_ex3.csv` desta mesma pasta (o caminho nao fica
  gravado no .ows por portabilidade entre computadores).

## Base de dados
Colunas: id_cliente, idade, cidade, estado, renda, quantidade_compras, valor_total_compras
Total de registros: 100

## Respostas

**a) Qual faixa etaria possui mais clientes?**
A faixa etaria **46-55** anos concentra o maior numero de clientes, com **21** pessoas.
Distribuicao completa por faixa:
  - 18-25: 14 clientes
  - 26-35: 16 clientes
  - 36-45: 16 clientes
  - 46-55: 21 clientes
  - 56-65: 20 clientes
  - 66-75: 13 clientes

**b) Qual estado possui mais clientes?**
O estado **PR** possui mais clientes, totalizando **14** registros.
Distribuicao completa por estado:
  - PR: 14 clientes
  - RJ: 12 clientes
  - MG: 12 clientes
  - PE: 12 clientes
  - RS: 11 clientes
  - DF: 10 clientes
  - BA: 9 clientes
  - CE: 8 clientes
  - AM: 8 clientes
  - SP: 4 clientes

**c) Qual e a distribuicao da renda?**
A renda dos clientes varia de **R$ 1248.93** a **R$ 14855.42**, com media de
**R$ 7229.62**, mediana de **R$ 7034.79** e desvio padrao de **R$ 3789.56**.
Como os valores foram gerados de forma uniforme entre R$ 1.200,00 e R$ 15.000,00, a distribuicao observada no
widget **Distributions** do Orange tende a se aproximar de um formato retangular (aproximadamente uniforme),
sem grandes concentracoes em nenhuma faixa especifica.

**d) Existe alguma relacao entre quantidade de compras e valor total das compras?**
Sim. O coeficiente de correlacao de Pearson entre `quantidade_compras` e `valor_total_compras` calculado sobre a
base e de **0.737**, o que indica uma relacao **positiva e forte**: quanto maior a quantidade de
compras de um cliente, maior tende a ser o valor total gasto por ele. Isso e esperado, pois o valor total foi
construido a partir da quantidade de compras multiplicada por um ticket medio. No Orange, essa relacao pode ser
visualizada plotando `quantidade_compras` no eixo X e `valor_total_compras` no eixo Y no widget **Scatter Plot**,
onde os pontos devem formar uma tendencia de crescimento conjunto (correlacao positiva).
