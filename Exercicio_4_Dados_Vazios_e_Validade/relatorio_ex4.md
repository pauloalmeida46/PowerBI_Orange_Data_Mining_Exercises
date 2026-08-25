# Mini relatorio - Exercicio 4: Dados Vazios e Validade

## Arquivos desta pasta
- `dados_clientes_ex4_problematica.xlsx` / `.csv` - copia da base do Exercicio 3 com problemas inseridos
  (dados vazios e valores invalidos). A base original correta permanece intacta na pasta do Exercicio 3
  (`dados_clientes_ex3.csv`), conforme pedido no enunciado.
- `dados_clientes_ex4_tratada.xlsx` / `.csv` - base apos o tratamento (valores vazios/invalidos substituidos
  pela mediana/moda da base original).
- `workflow_ex4.ows` - workflow do Orange: File (base problematica) -> Data Table / Feature Statistics
  (para localizar vazios e estatisticas fora do intervalo esperado) -> Impute (tratamento) -> Data Table (resultado).
  Aponte o widget **File** para `dados_clientes_ex4_problematica.csv`.

## Problemas inseridos (log de geracao)
- vazio | campo=idade | id_cliente=34
- vazio | campo=idade | id_cliente=26
- vazio | campo=idade | id_cliente=100
- vazio | campo=idade | id_cliente=85
- vazio | campo=idade | id_cliente=79
- vazio | campo=renda | id_cliente=82
- vazio | campo=renda | id_cliente=22
- vazio | campo=renda | id_cliente=94
- vazio | campo=renda | id_cliente=83
- vazio | campo=renda | id_cliente=2
- vazio | campo=estado | id_cliente=23
- vazio | campo=estado | id_cliente=1
- vazio | campo=estado | id_cliente=62
- vazio | campo=estado | id_cliente=74
- vazio | campo=estado | id_cliente=25
- vazio | campo=quantidade_compras | id_cliente=50
- vazio | campo=quantidade_compras | id_cliente=27
- vazio | campo=quantidade_compras | id_cliente=45
- vazio | campo=quantidade_compras | id_cliente=77
- vazio | campo=quantidade_compras | id_cliente=80
- invalido | campo=idade | id_cliente=48 | valor=250
- invalido | campo=idade | id_cliente=3 | valor=-5
- invalido | campo=estado | id_cliente=52 | valor=XX
- invalido | campo=renda | id_cliente=39 | valor=-3000
- invalido | campo=quantidade_compras | id_cliente=15 | valor=-10

## Respostas

**a) Quantos dados vazios foram encontrados?**
Foram inseridos e encontrados **20 dados vazios**, distribuidos em 4 campos (5 ocorrencias em cada):
`idade`, `renda`, `estado` e `quantidade_compras`. No Orange, isso pode ser confirmado no widget
**Feature Statistics**, que mostra a contagem de valores ausentes (missing) por coluna.

**b) Quais valores eram invalidos?**
Foram inseridos **5 valores invalidos**, um em cada um dos seguintes campos:
- `idade` = 250 (idade fora da faixa humana possivel)
- `idade` = -5 (idade nao pode ser negativa)
- `estado` = "XX" (sigla que nao corresponde a nenhuma UF brasileira valida)
- `renda` = -3000 (renda nao pode ser negativa)
- `quantidade_compras` = -10 (quantidade nao pode ser negativa)

Apos o tratamento, esses 5 valores e os 20 vazios foram substituidos pela mediana (campos numericos)
ou pela moda (campo `estado`) calculada a partir da base original correta, totalizando
**25 valores corrigidos** na base tratada.

**c) Qual e a diferenca entre um dado vazio e um dado invalido?**
Um **dado vazio** e a ausencia de informacao onde deveria haver um valor preenchido (a celula esta em branco/nula).
Um **dado invalido** e um valor que ESTA preenchido, mas que nao respeita as regras (dominio, formato ou faixa)
definidas para aquele campo - por exemplo, uma idade de 250 anos ou um estado "XX" que nao existe. Ou seja, o dado
vazio e um problema de completude, enquanto o dado invalido e um problema de validade: o campo tem um valor, so
que esse valor nao poderia existir na realidade descrita pelo campo.
