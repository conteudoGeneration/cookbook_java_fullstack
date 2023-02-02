<h1>Spring Data JPA - Guia de referência rápida</h1>
<h2>1. Validation</h2>
<h3>1.1 Annotations - javax.validation</h3>

<table>
	<tr>
		<td><b>Anotação
		<td><b>Descrição
	</tr>
	<tr>
		<td><code>@NotNull
		<td>Valida se o valor do Atributo não é nulo.
	</tr>
	<tr>
		<td><code>@AssertTrue
		<td>Valida se o valor do Atributo é verdadeiro.
	</tr>
	<tr>
		<td><code>@Size
		<td>Valida se o valor do Atributo possui um tamanho entre os parâmetros min e max. utilize com Strings e  Collections.
	</tr>
	<tr>
		<td><code>@Min
		<td>Valida se o valor do Atributo tem um valor maior ou igual ao valor mínimo atribuído ao Atributo.
	</tr>
	<tr>
		<td><code>@Max 
		<td>Valida se o valor do Atributo tem um valor menor ou igual ao valor máximo atribuído ao Atributo.
	</tr>
	<tr>
		<td><code>@Email
		<td> Valida se o valor do Atributo é um email.
	</tr>
	<tr>
		<td><code>@NotEmpty 
		<td>Valida se o valor do Atributo não é nulo ou vazio; pode ser aplicado a valores de String e  Collections.
	</tr>
	<tr>
		<td><code>@NotBlank
		<td>Pode ser aplicado apenas a valores de texto e valida se o valor do Atributo não é nulo ou possui espaços em branco.
	</tr>
	<tr>
		<td><code>@Positive <br /> @PositiveOrZero
		<td>Aplique a valores numéricos e valide se eles são estritamente positivos ou positivos incluindo o Zero.
	</tr>
	<tr>
		<td><code>@Negative <br /> @NegativeOrZero
		<td>Aplique a valores numéricos e valide se eles são estritamente negativos ou negativos incluindo o Zero.
	</tr>
	<tr>
		<td><code>@Past <br /> @PastOrPresent
		<td>Valida se um valor de data está no passado ou no passado, incluindo o presente.
	</tr>
	<tr>
		<td><code>@Future <br /> @FutureOrPresent
		<td>Valida se um valor de data está no futuro ou no futuro, incluindo o presente.
	</tr>
	<tr>
		<td><code>@Digits
		<td>Valida a parte inteira e decimal de um numero. Esta anotação geralmente é utilizada com numeros no formato BigDecimal. Esta anotação possui 2 parâmetros: <b>integer</b> (Numero de digitos da parte inteira) e <b>fraction</b> (Numero de digitos da parte decimal).
	</tr>
</table>

<h3>1.2 Annotations - hibernate.validation</h3>

| Anotação                                            | Descrição                            |
| --------------------------------------------------- | ------------------------------------ |
| @CPF                                                | Valida CPF                           |
| @CNPJ                                               | Valida CNPJ                          |
| @ISBN                                               | Valida o ISBN de um Livro            |
| @TituloEleitoral                                    | Valida o Título de Eleitor           |
| @CreditCardNumber(ignoreNonDigitCharacters = false) | Valida o numero do Cartão de Crédito |

<h2>2. Spring Data JPA</h2>
<h3>2.1 Principais Métodos</h3>
<br />


<table>
	<tr>
		<td><code>save(Objeto objeto)</code></td>
		<td>Salva ou Atualiza um Objeto no Banco de Dados.</td>
	</tr>
	<tr>
		<td><code>findById(Long id)</code></td>
		<td>Retorna (exibe) um Objeto com um id específico.</td>
	</tr>
	<tr>
		<td><code>existsById(Long id)</code></td>
		<td>Checa se existe um Objeto com um id específico.</td>
	</tr>
	<tr>
		<td><code>findAll()</code></td>
		<td>Retorna (exibe) todos os Objetos de uma Classe.</td>
	</tr>
	<tr>
		<td><code>deleteById(Long id)</code></td>
		<td>Deleta um Objeto com um id específico.</td>
	</tr>
	<tr>
		<td><code>deleteAll()</code></td>
		<td>Deleta todos os Objetos de uma Classe.</td>
	</tr>
</table>

<br />

<h2>3. Query Methods</h2>

**Query Method** são Métodos de Consulta personalizados, que permitem criar consultas específicas com qualquer Atributo da Classe associada a Interface Repositório (Postagem). 

Como a Interface JpaRepository possui apenas um Método de consulta específico pelo id (**findById( Long id)**), que é um Atributo comum em todas as Classes Model de um Projeto Spring, através das Query Methods podemos ampliar as nossas opções de consulta. 

As Query Methods são declaradas dentro da **Interface Repositório** e implementadas nas **Classes Controladoras e de Serviços** (Service, que veremos mais a frente).

Na prática, o que as Query Methods fazem são criar instruções SQL através de Palavras Chave, que combinadas com os Atributos da Classe Model, geram consultas personalizadas.

**Exemplo 01 - Blog Pessoal (CRUD):**

**Query Method**

```java
public List <Postagem> findAllByTituloContainingIgnoreCase(@Param("titulo") String titulo);
```

**Instrução SQL equivalente**

```sql
SELECT * FROM tb_postagens WHERE titulo LIKE "%titulo%";
```

| Palavra Chave     |      | Instrução SQL                                                |
| ----------------- | ---- | ------------------------------------------------------------ |
| **find**          | 🡪    | SELECT                                                       |
| **All**           | 🡪    | *                                                            |
| **By**            | 🡪    | WHERE                                                        |
| **Titulo**        | 🡪    | Atributo da Classe Postagem                                  |
| **Containing**    | 🡪    | LIKE "%titulo%"                                              |
| **IgnoreCase**    | 🡪    | Ignorando letras maiúsculas ou minúsculas                    |
| **@Param("titulo")** | 🡪    | Define a variável String título como um parâmetro da consulta. A partir da versão 2.6.7 do Spring, o uso desta anotação se tornou obrigatório em consultas do tipo Like.|
| **String titulo** | 🡪    | Parâmetro do Método contendo o título que você deseja procurar. |

Como esta consulta retornará um ou mais Objetos da Classe Postagem, o Método foi assinado com uma **Collection List** de Objetos da Classe Postagem.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ATENÇÃO:** *A instrução FROM tb_postagens será inserida pelo JPA ao checar o nome da tabela gerada pela Classe Postagem, associada na Interface PostagemRepository.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

**Exemplo 02 - Blog Pessoal (Security):**

**Query Method**

```java
public Optional <Usuario> findByUsuario(String usuario);
```

**Instrução SQL equivalente**

```sql
SELECT * FROM tb_usuarios WHERE usuario = "usuario";
```

| Palavra Chave     |      | Instrução SQL                                                |
| ----------------- | ---- | ------------------------------------------------------------ |
| **find**          | 🡪    | SELECT                                                       |
| **By**            | 🡪    | WHERE                                                        |
| **Usuario**        | 🡪    | Atributo da Classe Usuario                                  |
| **String usuario** | 🡪    | Parâmetro do Método contendo o usuário (e-mail) que você deseja procurar. |

Como esta consulta retornará apenas um Objeto da Classe Usuario ou um Objeto Nulo, caso a consulta não encontre nada, o Método foi assinado com apenas um Objeto da Classe Usuario do tipo **Optional** para evitar o erro **NullPointerException** (Objeto Nulo). 

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ATENÇÃO:** *A instrução FROM tb_usuarios será inserida pelo JPA ao checar o nome da tabela gerada pela Classe Usuario, associada na Interface UsuarioRepository.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<h2>4. Principais palavras-chave suportadas pelas Query Methods</h2>



Para exemplificar outros tipos de consultas personalizadas, vamos utilizar como base a **Classe Produto**, definida pelo Diagrama de Classes abaixo:

<div align="center"><img src="https://i.imgur.com/D4qMKUE.png" title="source: imgur.com" /></div>

<h3>Operadores Relacionais</h3>


| Palavra        | Descrição                                                    | Exemplo                                          |
| -------------------- | ------------------------------------------------------------ | ------------------------------------------------ |
| **LessThan**         | Seleciona valores menores do que o critério da consulta.     | **findByPrecoLessThan(BigDecimal preco)** <br /> *SELECT * FROM tb_produtos WHERE preco < preco;*        |
| **LessThanEqual**    | Seleciona valores menores ou iguais ao  critério da consulta. | **findByPrecoLessThanEqual(BigDecimal preco)** <br /> *SELECT * FROM tb_produtos WHERE preco <= preco;*    |
| **GreaterThan**      | Seleciona valores maiores do que o critério da consulta.     | **findByPrecoGreaterThan(BigDecimal preco)** <br /> *SELECT * FROM tb_produtos WHERE preco > preco;*      |
| **GreaterThanEqual** | Seleciona valores maiores ou iguais ao  critério da consulta. | **findByPrecoGreaterThanEqual(BigDecimal preco)** <br /> *SELECT * FROM tb_produtos WHERE preco >= preco;* |

<h3>Operadores Lógicos</h3>


| Palavra | Descrição                                                    | Exemplo                                                 |
| ------------- | ------------------------------------------------------------ | ------------------------------------------------------- |
| **And**       | Exibe um registro se todas as condições separadas por AND, que forem TRUE | **findByNomeAndFornecedor(String nome, String fornecedor)**<br /> *SELECT * FROM tb_produtos WHERE nome = nome AND fornecedor = fornecedor;*  |
| **Or**        | Exibe um registro se alguma das condições separadas por OR, que seja TRUE | **findByNomeOrFornecedor(String nome,String fornecedor)**<br /> *SELECT * FROM tb_produtos WHERE nome = nome OR fornecedor = fornecedor;*  |
| **Not**       | Seleciona todos os dados diferentes de um critério definido. Exemplo: Nome diferente de João | **findByFornecedorNot(String fornecedor)**<br /> *SELECT * FROM tb_produtos WHERE NOT fornecedor = fornecedor;*                           |

<h3>Ordenação</h3>

| Palavra | Descrição                                                    | Exemplo                                                      |
| ------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **OrderBy**   | Ordena os dados segundo um critério definido. A Clausula **Desc** indica ordenação em ordem decrescente. | **findByNomeOrderByDataValidade(String nome)**<br /> *SELECT * FROM tb_produtos WHERE nome = nome ORDER BY data_validade;* <br /><br />**findByNomeOrderByDataValidadeDesc(String nome)**<br /> *SELECT * FROM tb_produtos WHERE nome = nome ORDER BY data_validade DESC;* |

<h3>Intervalo e Lista de dados</h3>

| Palavra | Descrição                                                    | Exemplo                                                      |
| ------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Between**   | Seleciona os valores dentro de um determinado intervalo. Os valores podem ser números, texto ou datas. | **findByPrecoBetween(BigDecimal inicio, BigDecimal fim)**<br />*SELECT * FROM tb_produtos WHERE preco BETWEEN inicio AND fim;<br /><br />**findByDataValidadeBetween(LocalDate inicio, LocalDate fim)**<br /> *SELECT * FROM tb_produtos WHERE data_validade BETWEEN inicio AND fim;* |
| **In**        | Permite que você especifique uma lista com vários critérios que a consulta deverá procurar. Ao implementar o Método na Classe Controladora, será necessário converter os parâmetros em uma Collection.| **findByPrecoIn(List<BigDecimal> preco)**<br />*SELECT * FROM tb_produtos WHERE preco IN (List01, List02, List03);*                     |

<h3>Busca textual específica</h3>

Nas consultas do tipo textual, utilizaremos a anotação **@Param**. Os parâmetros de consulta permitem a definição de consultas reutilizáveis. Essas consultas podem ser executadas com diferentes valores de parâmetro para recuperar resultados diferentes, eliminando a necessidade de usar uma nova String para cada execução da consulta.

| Palavra-chave    | Descrição                                                    | Exemplo                                                      |
| ---------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Like**         | Busca todos os Objetos, onde um Atributo específico (String), possua exatamente o mesmo texto do critério de busca. | **findAllByNomeLike(@Param("nome") String nome)** <br />*SELECT * FROM tb_produtos WHERE nome LIKE "nome";* |
| **Containing**   | Busca todos os Objetos, onde um Atributo específico (String), contenha o texto do critério de busca, independente da posição (inicio, meio ou fim) | **findAllByNomeContaining(String nome)**<br />*SELECT * FROM tb_produtos WHERE nome LIKE "%nome%";* |
| **StartingWith** | Busca todos os Objetos, onde um Atributo específico (String), inicie com o texto do critério de busca | **findAllByNomeStartingWith(@Param("nome") String nome)**<br />*SELECT * FROM tb_produtos WHERE nome LIKE "nome%";* |
| **EndingWith**   | Busca todos os Objetos, onde um Atributo específico (String), termine com o texto do critério de busca | **findAllByNomeEndingWith(@Param("nome") String nome)**<br />*SELECT * FROM tb_produtos WHERE nome LIKE "%nome";* |
| **IgnoreCase**   | Ignora se as letras são Maiúsculas ou Minúsculas. O MySQL, por padrão, já é Case Sensitive. Esta palavra chave pode ser usada em qualquer busca textual. | **findAllByNomeContainingIgnoreCase(@Param("nome") String nome)**<br />*SELECT * FROM tb_produtos WHERE UPPER(nome) LIKE UPPER("nome");* |

<h3>Busca por Data</h3>

Ao implementar os Métodos de Consulta por Data na Classe Controladora, será necessário converter os parâmetros String (Variáveis de Caminho), contendo as datas em Objetos da Classe **LocalDate** ou **LocalDateTime** antes de passar como parâmetros para o Método de Consulta.

| Palavra | Descrição                                                    | Exemplo                                     |
| ------------- | ------------------------------------------------------------ | ------------------------------------------- |
| **Before**    | Seleciona todos os Objetos cuja as datas sejam anteriores (Passado) a data informada no critério. | **findByDataValidadeBefore(LocalDate data)**<br />*SELECT * FROM tb_produtos WHERE data_validade < data;* |
| **After**     | Seleciona todos os Objetos cuja as datas sejam posteriores (Futuro) a data informada no critério. | **findByDataValidadeAfter(LocalDate data)**<br />*SELECT * FROM tb_produtos WHERE data_validade > data;*  |

<h3>Busca por Verdadeiro ou Falso</h3>

| Palavra | Descrição                                   | Exemplo                    |
| ------------- | ------------------------------------------- | -------------------------- |
| **True**      | Verifica se um Atributo Boolean é verdadeiro. | **findByDisponivelTrue()**<br />*SELECT * FROM tb_produtos WHERE disponivel = true;*  |
| **False**     | Verifica se um Atributo Boolean é falso.      | **findByDisponivelFalse()**<br />*SELECT * FROM tb_produtos WHERE disponivel = false;* |

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="30px"/> <a href="https://github.com/rafaelq80/jpa_query_methods" target="_blank"><b>Código fonte do projeto exemplo</b></a>

<br /><br />
	
<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
