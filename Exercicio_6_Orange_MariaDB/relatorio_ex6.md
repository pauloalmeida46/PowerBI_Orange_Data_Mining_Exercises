# Mini relatorio - Exercicio 6: Orange + MariaDB

## Arquivos desta pasta
- `criar_banco_ex6.sql` - script completo (CREATE DATABASE, CREATE TABLE e INSERT) que recria o banco
  `atv_orange_mariadb` com as tabelas `clientes` (32 registros), `produtos`
  (10 registros) e `vendas` (104 registros), ja incluindo de forma proposital os
  problemas de qualidade pedidos no exercicio. **Nao foi montado um servidor MariaDB para esta atividade** -
  a investigacao no Orange foi feita diretamente sobre os CSVs abaixo (gerados a partir dos mesmos dados deste
  script). Caso o professor queira conferir em um banco real, basta rodar este arquivo em um MariaDB/MySQL
  (`mysql -u usuario -p < criar_banco_ex6.sql`) para criar tudo do zero.
- `clientes_ex6.csv`, `produtos_ex6.csv`, `vendas_ex6.csv` - exportacao das tres tabelas, usadas no Orange.
- `workflow_ex6.ows` - workflow do Orange: um widget **File** para cada tabela (clientes, produtos, vendas) ->
  Data Table / Feature Statistics (para localizar vazios e valores fora do intervalo esperado) -> Merge Data
  (junta vendas com clientes pelo `id_cliente`). Aponte cada File para o CSV correspondente. Para conectar
  direto a um MariaDB real, basta adicionar o widget **SQL Table** do Orange e informar host, usuario, senha e
  o banco `atv_orange_mariadb` criado pelo script `.sql`.

## Problemas inseridos (log de geracao)
- clientes | vazio | campo=idade | id_cliente=12
- clientes | vazio | campo=idade | id_cliente=30
- clientes | vazio | campo=idade | id_cliente=7
- clientes | vazio | campo=cidade | id_cliente=10
- clientes | vazio | campo=cidade | id_cliente=25
- clientes | vazio | campo=cidade | id_cliente=18
- clientes | invalido | campo=idade | id_cliente=17 | valor=-8
- clientes | invalido | campo=idade | id_cliente=19 | valor=210
- clientes | invalido | campo=estado | id_cliente=27 | valor=XX
- clientes | duplicidade | id_cliente=31 e copia de id_cliente=27
- clientes | duplicidade | id_cliente=32 e copia de id_cliente=16
- produtos | invalido | campo=preco | id_produto=8 | valor=-50.0
- produtos | vazio | campo=categoria | id_produto=3
- vendas | vazio | campo=quantidade | id_venda=35
- vendas | vazio | campo=quantidade | id_venda=42
- vendas | vazio | campo=quantidade | id_venda=3
- vendas | vazio | campo=quantidade | id_venda=100
- vendas | vazio | campo=quantidade | id_venda=27
- vendas | invalido | campo=quantidade | id_venda=63 | valor=-5
- vendas | invalido | campo=quantidade | id_venda=70 | valor=-3
- vendas | invalido | campo=quantidade | id_venda=39 | valor=-1
- vendas | inconsistente | id_venda=79 | valor_total=2696.07 nao corresponde a quantidade x preco do produto
- vendas | inconsistente | id_venda=96 | valor_total=1725.99 nao corresponde a quantidade x preco do produto
- vendas | inconsistente | id_venda=26 | valor_total=4251.41 nao corresponde a quantidade x preco do produto
- vendas | inconsistente | id_venda=76 | valor_total=1720.86 nao corresponde a quantidade x preco do produto
- vendas | duplicidade | id_venda=101 e copia de id_venda=66
- vendas | duplicidade | id_venda=102 e copia de id_venda=29
- vendas | duplicidade | id_venda=103 e copia de id_venda=85
- vendas | duplicidade | id_venda=104 e copia de id_venda=94

## Respostas

**a) Quais problemas foram encontrados?**
Foram encontrados os quatro tipos de problema estudados na lista:
- **Dados vazios**: idade e cidade nulas em `clientes`, categoria nula em `produtos` e quantidade nula em `vendas`.
- **Valores invalidos**: idades negativas/absurdas e estado "XX" em `clientes`; preco negativo em `produtos`;
  quantidade negativa em `vendas`.
- **Duplicidades**: registros de `clientes` e de `vendas` copiados e reinseridos com um novo identificador.
- **Inconsistencias**: vendas cujo `valor_total` nao corresponde ao calculo `quantidade x preco do produto`.

**b) Em quais campos eles apareceram?**
- Tabela `clientes`: campos `idade`, `cidade` e `estado`.
- Tabela `produtos`: campos `categoria` e `preco`.
- Tabela `vendas`: campos `quantidade` e `valor_total`.

**c) Quantos registros foram afetados?**
No total, **29 ocorrencias de problemas** foram inseridas, sendo:
- 12 dados vazios;
- 7 valores invalidos;
- 6 registros duplicados (2 em clientes e 4 em vendas);
- 4 registros de vendas inconsistentes.

Vale notar que alguns registros podem acumular mais de um tipo de problema, mas o log de geracao acima detalha
exatamente qual `id_cliente`/`id_produto`/`id_venda` foi afetado em cada caso, permitindo a conferencia manual
no Orange (por exemplo, filtrando pela `Select Rows` ou observando o `Feature Statistics`).

**d) O fato de os dados estarem armazenados em um banco de dados garante que eles estejam corretos? Explique.**
Nao. Um banco de dados relacional como o MariaDB garante principalmente a **integridade estrutural** dos dados:
tipos de coluna, chaves primarias e estrangeiras, restricoes de unicidade, etc. Ele impede, por exemplo, que
`id_cliente` se repita como chave primaria ou que um valor texto seja inserido em uma coluna numerica. Porem,
ele nao garante **qualidade semantica** dos dados: um valor pode respeitar o tipo da coluna (um INT valido) e
ainda assim ser logicamente invalido (idade = 210), pode ser acuradamente errado (estado divergente da
realidade), pode estar duplicado (a menos que haja uma restricao de unicidade especifica para isso) ou pode
ser inconsistente com outro campo do mesmo registro. Por isso, mesmo dados "limpos" na estrutura de um banco
podem apresentar exatamente os mesmos problemas de qualidade estudados nesta lista, como este exercicio
demonstrou de forma proposital.
