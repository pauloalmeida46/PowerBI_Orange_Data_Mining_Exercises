# Mini relatorio - Exercicio 5: Acuracia, Duplicidade e Consistencia

## Arquivos desta pasta
- `dados_clientes_ex5.xlsx` - contem duas abas: `Base_Clientes` (base principal, com 105 registros
  apos as duplicacoes) e `Fonte_Referencia` (tabela com o estado correto de cada cliente, usada para checar acuracia).
- `dados_clientes_ex5.csv` - exportacao da aba `Base_Clientes` para uso no Orange.
- `fonte_referencia_ex5.csv` - exportacao da aba `Fonte_Referencia`.
- `workflow_ex5.ows` - workflow do Orange: File (clientes) e File (referencia) -> Merge Data (junta as duas bases
  pelo `id_cliente` para comparar o estado informado com o estado correto) -> Data Table; alem de Select Rows,
  usado para filtrar/inspecionar registros suspeitos de duplicidade. Aponte cada widget **File** para o CSV
  correspondente.

## Problemas inseridos (log de geracao)

### 1) Acuracia (estado da base X estado da Fonte de Referencia)
- id_cliente=59 | base=CE | fonte_referencia=BA
- id_cliente=37 | base=AM | fonte_referencia=CE
- id_cliente=20 | base=RJ | fonte_referencia=CE
- id_cliente=25 | base=PR | fonte_referencia=DF
- id_cliente=43 | base=AM | fonte_referencia=RS
- id_cliente=66 | base=PE | fonte_referencia=MG
- id_cliente=17 | base=MG | fonte_referencia=CE
- id_cliente=65 | base=RJ | fonte_referencia=SP
- id_cliente=30 | base=BA | fonte_referencia=CE
- id_cliente=79 | base=PE | fonte_referencia=BA

### 2) Duplicidade (registros copiados e reinseridos)
- id_cliente=75 duplicado
- id_cliente=11 duplicado
- id_cliente=2 duplicado
- id_cliente=55 duplicado
- id_cliente=12 duplicado

### 3) Consistencia (idade x data de nascimento incompativeis)
- id_cliente=68 | idade=63 | data_nascimento=1947-02-25 (ano incompativel com a idade informada)
- id_cliente=72 | idade=53 | data_nascimento=1956-05-07 (ano incompativel com a idade informada)
- id_cliente=18 | idade=25 | data_nascimento=1988-03-24 (ano incompativel com a idade informada)
- id_cliente=14 | idade=70 | data_nascimento=1938-12-10 (ano incompativel com a idade informada)
- id_cliente=1 | idade=42 | data_nascimento=1969-09-22 (ano incompativel com a idade informada)

## Respostas

**a) Um valor pode ser valido e ainda assim estar errado? De um exemplo.**
Sim. Validade verifica apenas se o valor respeita o *formato/dominio* esperado para o campo, nao se ele
corresponde a realidade. Por exemplo, o cliente id_cliente=59 tem
`estado` = "CE" na base principal: essa e uma sigla de UF perfeitamente
valida (passa qualquer validacao de formato), mas esta **errada**, pois a Fonte de Referencia indica que o
estado correto desse cliente e "BA". Isso ilustra a diferenca
entre validade (o valor segue as regras do campo) e acuracia (o valor corresponde a realidade).

**b) O que e uma duplicidade?**
Duplicidade e a existencia de dois ou mais registros que representam a mesma entidade/fato no mundo real, mas
que aparecem mais de uma vez na base de forma indevida. Na base gerada, os clientes
75, 11, 2, 55, 12 tiveram seus registros completos copiados e inseridos
novamente, criando linhas duplicadas que podem, por exemplo, inflar contagens de clientes ou somas de vendas
se nao forem identificadas e removidas. No Orange, essas duplicidades podem ser localizadas ordenando a
**Data Table** pela coluna `id_cliente` (ou `nome`) e observando linhas repetidas.

**c) O que significa dizer que dois dados sao inconsistentes?**
Significa que duas informacoes que deveriam ser compativeis entre si, dentro do mesmo registro (ou entre
registros relacionados), na verdade se contradizem. No exemplo gerado, o cliente
id_cliente=68 tem `idade` = 63
mas `data_nascimento` = 1947-02-25; considerando o ano de referencia
2026, essa data de nascimento resultaria em uma idade bem diferente da que esta informada no campo
`idade`. Nenhum dos dois valores e vazio nem obviamente invalido isoladamente, mas juntos eles nao podem ser
verdadeiros ao mesmo tempo - por isso sao inconsistentes.

**d) Explique, com suas palavras, a diferenca entre validade e acuracia.**
Validade e uma verificacao *interna* ao proprio valor: ela confere se o dado respeita o formato, o tipo e as
regras de dominio definidas para aquele campo (uma idade numerica entre 0 e 110, um estado que seja uma das 27
UFs, etc.), sem depender de nenhuma fonte externa. Acuracia e uma verificacao *externa*: ela compara o valor
armazenado com uma fonte confiavel (como a tabela `Fonte_Referencia` usada neste exercicio) para saber se aquele
valor, alem de estar em um formato aceitavel, realmente corresponde ao fato do mundo real. Um dado pode ser
valido sem ser acurado (caso do item "a"), mas um dado invalido dificilmente sera considerado acurado.
