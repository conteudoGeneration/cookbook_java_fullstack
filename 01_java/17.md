<h1>Stream</h1>



A API *Streams* foi introduzida no Java 8, e se tornou um recurso muito utilizado no Processamento de Coleções de dados (Collections). Uma Stream permite **processar Collections** de uma forma simples, através de códigos limpos e concisos, de fácil manutenção, sem causar os famosos efeitos indesejados em tempo de execução (Erros). 

Uma **Stream** é uma sequência de Objetos, que suportam vários métodos encadeados, com o objetivo de produzir um resultado desejado, como uma filtragem ou ordenação de dados por exemplo. 

Muitas pessoas Desenvolvedoras confundem uma **Stream** com uma Estrutura de Dados, entretanto uma Stream não é uma Estrutura de dados. Stream recebe como entrada para efetuar o processamento uma Estrutura de Dados como uma Collection ou um Array, por exemplo.

Esta simplificação do processamento de Collections, introduzido no Java através da API Stream, se tornou possível graças à incorporação do *Paradigma Funcional*, combinado com as *Expressões Lambda*. A ideia central é iterar (percorrer) a Collection e, a cada elemento, realizar alguma ação, seja ela de filtragem, mapeamento, transformação, entre outras.

> **Paradigma Funcional:** Diferentemente da Programação Imperativa, a Programação Funcional parte do princípio de que tudo são funções. Não existe uma lista de instruções ou objetos para o computador realizar, mas uma sequência de **funções matemáticas** (lambda) que, juntas, vão resolver um problema. Isso significa que, no Paradigma Funcional, você tem uma função, insere um dado de entrada, aplica várias operações e obtém uma saída. É  possível alterar as operações e, consequentemente, a saída, mas a  entrada sempre permanecerá a mesma.
>
> Uma **Expressão Lambda** é um pequeno bloco de código que recebe parâmetros e retorna um valor. Uma expressão lambda também pode ser vista como uma função anônima. Uma função que não tem nome e não pertence a nenhuma classe. As Expressões Lambda são semelhantes aos métodos, mas não precisam de um nome e podem ser implementadas diretamente no corpo de um método.

Na prática, uma Stream é um pipeline (conjunto) de operações, que podemos usar para analisar os dados armazenados em uma Collection. Veja como funciona um pipeline Stream na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/yHxtqpT.png" title="source: imgur.com" /></div>

Como vemos na figura acima, as Streams possuem dois tipos de operações:

- **Operações Intermediárias:** são aquelas que retornam um novo Stream para que novas operações intermediárias sejam executadas.
- **Operações Terminais:** são operações que unem os resultados de um *Stream* e retornam  um valor ou um objeto. Depois de executada uma operação terminal, o mesmo Stream não poderá ser alterado por outras operações intermediárias ou  executar novas operações terminais.

<br />

<h3>1.1. Streams x Collections</h3>

Collections e *Streams*, à primeira vista, podem parecer a mesma coisa, pois se referem a interfaces com sequências de dados. Então, qual é a diferença? 

<div align="center"><h3>"As Collections se referem a dados enquanto, as Streams se referem aos resultados obtidos através das operações (cálculos) aplicados na Collection".</h3></div>

A diferença entre Collections e *Streams* está realacionado ao momento em que os dados são computados.

As **Collections** são estruturas de dados, armazenados na memória, onde estão todos os valores que a estrutura de dados tem em um momento determinado. Cada elemento adicionado deve ser computado antes de ser agregado à Collection. 

As *streams* são estruturas de dados fixas, cujos elementos são computados sob demanda. A ideia é iterar sobre a Collection e a cada elemento, realizar alguma ação (cálculo), seja ela de filtragem, mapeamento, transformação, entre outras.

Quando a interface `Collection` é usada, a pessoa desenvolvedora deve se ocupar da iteração (laços de repetição). Essa abordagem é chamada de iteração externa. Em contrapartida, a biblioteca `Streams` recorre à iteração interna, ou seja, a Stream se ocupa da iteração e do armazenamento dos valores resultantes das operações efetuadas, geradas por uma função (geralmente uma Expressão Lambda), fornecida pela pessoa desenvolvedora.

Quando falamos em Stream, é importante destacar que:

- Uma **Stream não é uma estrutura de dados**, em vez disso, recebe uma Collection.
- Uma **Stream não altera a estrutura de dados original**, elas apenas fornecem o resultado de acordo com os métodos inseridos na pipeline.

Na tabela abaixo, vemos um resumo das diferenças entre **Streams e Collections**:

| **Stream**s                                                  | **Collections**                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| Não armazenam dados e opera na estrutura de dados de origem, ou seja, na Collection. | Armazena e mantém todos os dados que a estrutura de dados possui atualmente em uma estrutura de dados específica como List, Set, entre outras |
| Usam interfaces funcionais, como lambda por exemplo, o que o torna uma boa opção para a linguagem de programação. | Não usam interfaces funcionais.                              |
| Java Streams são consumíveis, ou seja, para usar uma Stream, ela precisa ser criada todas as vezes. | Não são consumíveis, ou seja, pode ser percorrida (iterada) várias vezes sem a necessidade de criar novamente. |
| Streams Java suportam processamento sequencial e paralelo.   | Suporta processamento paralelo, que pode ser muito útil para alcançar alto desempenho. A Collection Map é a que possui melhor desempenho no Processamento Paralelo. |
| Streams não são modificáveis, ou seja, não é possível adicionar ou remover elementos. | Collections são modificáveis, ou seja, pode-se facilmente adicionar ou remover elementos. |
| Streams são iterados internamente apenas mencionando as operações. | Collections são iteradas externamente usando laços de repetição, principalmente o for...each. |

> **Processamento Sequencial:** As operações são executadas na ordem em que foram escritas,
>
> **Processamento Paralelo:** As operações são executadas simultaneamente, ou seja, em paralelo, com o objetivo de aumentar o desempenho. Essa técnica é muito utilizada em situações onde a ordem das operações é irrelevante

**Sintaxe:**

```java
//Collection numeros
List<Integer> numeros = Arrays.asList(1,2,3,4,5,6,7,8,9,10);

//Gerar a Stream a partir da Collection
Stream<Integer> numerosStream = numeros.stream();

//Gerar a Stream a partir de uma lista de numeros
Stream<Integer> novoNumerosStream = Stream.of(1,2,3,4,5,6,7,8,9,10);
```

As 2 formas acima nos fornecem um Objeto Stream. Chamamos o método **stream()** sobre o Objeto de coleção ou passamos os valores diretamente para o método **Stream.of()**.

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://www.oracle.com/br/technical-resources/articles/java-stream-api.html" target="_blank"><b>Artigo: Java 8: Iniciando o desenvolvimento com a Streams API</b></a>

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/8/docs/api/java/util/stream/Stream.html" target="_blank"><b>Documentação: Stream API</b></a>

<br />

<h2>2. Métodos Intermediários</h2>



Métodos Intermediários ou Operações Intermediarias são Métodos que retornam um novo Stream, para que novas operações intermediárias sejam executadas. Vamos conhecer os Métodos Intermediários mais utilizados da API Stream:

Nos exemplos abaixo, vamos utilizar as 3 Collections abaixo:

```java
List<Integer> numeros = Arrays.asList(1,2,3,4,5,6,7,8,9,10);

List<Integer> numerosDesordenados = Arrays.asList(6,7,8,1,4,5,9,10,2,3);

List<String> estados = Arrays.asList("São Paulo", "Rio de Janeiro", "Minas Gerais","Espirito Santo", 
"São Paulo", "Rio de Janeiro", "Minas Gerais", "São Paulo", "Rio de Janeiro");
```

<br />

<h3>2.1. Map</h3>

O método **map()** é usado para executar uma operação na lista de coleções. Vamos ver como podemos criar uma nova lista contendo os números da lista fornecida, elevados ao cubo:

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="4%"/> Exemplo - Método Map:

```java
		System.out.println("\nExemplo - Método Map");
		
		List<Integer> numerosAoCubo = numeros.stream()
		        .map(x -> x*x*x)
		        .collect(Collectors.toList());
		
		System.out.println("\nNumeros elevados ao Cubo: " + numerosAoCubo);
```

No código acima, foi passado como parâmetro do Método **map()** a **Expressão Lambda:** `x -> x*x*x`. Esta Expressão Lambda calcula a multiplicação de cada elemento da Collection **numeros** por ele mesmo 3 vezes, ou seja, o numero elevado ao cubo.

Na sequência, através do Método Terminal **collect()**, convertemos a Stream em uma nova Collection  chamada **numerosAoCubo**. Observe que foi passado como parâmetro do Método collect() o Método **Collectors.tolist()**, que **converte uma Stream em uma Collection List**. O resultado do algoritmo você confere abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/> **Resultado do Algoritmo:**

```bash
Exemplo - Método Map

Numeros elevados ao Cubo: [1, 8, 27, 64, 125, 216, 343, 512, 729, 1000]
```

<br />

<h3>2.2. Filter</h3>

O método **filter** é utilizado para filtrar os resultados de acordo com as condições pré definidas. Agora vamos considerar que queremos filtrar os números pares da lista de números de 1 a 10.

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="4%"/> Exemplo - Método Filter:

```java
		System.out.println("\nExemplo - Método Filter");
		
		List<Integer> numerosPares = numeros.stream()
		        .filter(x -> x%2==0)
		        .collect(Collectors.toList());

		 System.out.println("\nExibir apenas os Numeros Pares: " + numerosPares);
```

No código acima, foi passado como parâmetro do Método **filter()** a **Expressão Lambda:** `x -> x%2==0`. Esta Expressão Lambda calcula o resto da divisão de cada elemento da Collection **numeros** e verifica se o resultado foi igual a zero, ou seja, verifica se o resto da divisão é igual zero, o que indica que o número é par.

Na sequência, através do Método Terminal **collect()**, convertemos a Stream em uma nova Collection chamada **numerosPares**. Observe que foi passado como parâmetro do Método collect() o Método **Collectors.tolist()**, que **converte uma Stream em uma Collection List**. O resultado do algoritmo você confere abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/> **Resultado do Algoritmo:**

```bash
Exemplo - Método Filter

Exibir apenas os Numeros Pares: [2, 4, 6, 8, 10]
```

<br />

<h3>2.3. Sorted</h3>

O método **Sort*ed* é utilizado para classificar a Collection fornecida. Veja o exemplo abaixo:

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="4%"/> Exemplo - Método Sort:

```java
System.out.println("\nExemplo - Método Sorted");
		 
		 List<Integer> numerosOrdenadosAsc = numerosDesordenados.stream()
				 .sorted()
				 .collect(Collectors.toList());

		 System.out.println("\nExibir os Numeros em Ordem Crescente: " + numerosOrdenadosAsc);
		 
		 List<Integer> numerosOrdenadosDesc = numerosDesordenados.stream()
				 .sorted(Comparator.reverseOrder())
				 .collect(Collectors.toList());

		 System.out.println("\nExibir os Numeros em Ordem Decrescente: " + numerosOrdenadosDesc);
		 
```

No código acima, foi executado o Método **sorted()**, responsável por ordenar os dados em ordem crescente. Para ordenar em ordem decrescente foi passado como parâmetro do Método sorted() o Método **Comparator.reverseOrder()**, que **inverte o resultado do Método sorted()**.

> **Comparator:** É uma Interface Funcional de comparação, que é usada para ordenar os objetos de classes definidas pelo usuário. Um Objeto da Interface Comparator é capaz de comparar dois objetos da mesma Classe e Ordenar uma Collection (em Ordem Crescente e Decrescente), por exemplo, através dos seus Métodos.
>
> <br />
>
> <div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html" target="_blank"><b>Documentação: Interface Comparator</b></a>
>
> <br />

Na sequência, através do Método Terminal **collect()**, convertemos as 2 Streams em duas novas Collections chamadas **numerosOrdenadosAsc** e **numerosOrdenadosDesc** respectivamente. Observe que foi passado como parâmetro do Método collect() o Método **Collectors.tolist()**, que **converte uma Stream em uma Collection List**. O resultado do algoritmo você confere abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/> **Resultado do Algoritmo:**

```bash
Exemplo - Método Sorted

Exibir os Numeros em Ordem Crescente: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

Exibir os Numeros em Ordem Decrescente: [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
```

<br />

<h3>2.4. Distinct</h3>

Se a Collection fornecida possuir itens duplicados, podemos usar o método **distinct()** para remover todos os itens duplicados e obter uma Collection filtrada. Veja o exemplo abaixo:

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="4%"/> Exemplo - Método Distinct:

```java
		System.out.println("\nExemplo - Método Distinct");
		 
		 List<String> estadosSemRepeticao = estados.stream()
				 .distinct()
				 .collect(Collectors.toList());
				     
		 System.out.println("\nExibir os Estados sem repetição: " + estadosSemRepeticao);
		 
```

No código acima, foi executado o Método **distinct()**, responsável por remover os dados duplicados.

Na sequência, através do Método Terminal **collect()**, convertemos a Stream em uma nova Collection chamada **estadosSemRepeticao**. Observe que foi passado como parâmetro do Método collect() o Método **Collectors.tolist()**, que **converte uma Stream em uma Collection List**. O resultado do algoritmo você confere abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/> **Resultado do Algoritmo:**

```bash
Exemplo - Método Distinct

Exibir os Estados sem repetição: [São Paulo, Rio de Janeiro, Minas Gerais, Espirito Santo]
```

No link abaixo, você pode obter o código completo do Exemplo acima.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/stream/streams_01" target="_blank"><b>Código fonte - Exemplo 01</b></a>

<br />

<h2>3. Métodos Terminais</h2>

Métodos Terminais ou Operações Terminais são Métodos que unem os resultados de um *Stream* e retornam  um valor ou um objeto. Depois de chamar uma operação terminal, o mesmo Stream não poderá ser alterado por outras operações intermediárias ou executar novas operações terminais. Vamos conhecer alguns Métodos Terminais da API Stream:

Nos exemplos abaixo, vamos utilizar a Collection abaixo:

```java
List<String> estados = Arrays.asList("São Paulo", "Rio de Janeiro", "Minas Gerais", 
"Espirito Santo", "Rio Grande do Sul", "Santa Catarina", "Paraná");
```

<br />

<h3>3.1. Collect</h3>

A operação **collect()** cria uma Collection com o resultado final das operações realizadas na Stream, como vimos no exemplo 01. No exemplo abaixo, observe que podemos ter mais de uma operação intermediária:

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="4%"/> Exemplo - Método Collect:

```java
		List <String> estadosR = estados.stream()
		        .filter(x-> x.toString().startsWith("R"))
		        .sorted()
		        .collect(Collectors.toList());

		System.out.println("\nEstados cujo nome começam com a letra R: " + estadosR);
		
```

No código acima, foi passado como parâmetro do Método **filter()** a **Expressão Lambda:** `x -> x.toString().startsWith("R")`. Esta Expressão Lambda verifica em cada elemento da Collection **estados**, se o nome do estado inicia com a letra R, através do Método **startsWith()**, da Classe String. 

**Exemplo:** 

- **Rio de Janeiro** inicia com a letra R. 
- **São Paulo** não inicia com a letra R.

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="100px"/> | <div align="left">**DICA:** *Caso você tenha dúvidas sobre a Classe String, acesse o Cookbook Trabalhando com Strings em Java clicando [aqui](https://github.com/rafaelq80/cookbook_java/blob/main/b02.md)* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Na sequência, ordena em ordem crescente a Stream que contém os estados iniciados com a letra R, através do Método **Sorted()**. 

Observe que neste exemplo, foram utilizadas 2 Operações Intermediárias e 1 Operação Terminal, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/BokLPP4.png" title="source: imgur.com" /></div>

Para concluir o pipeline, através do Método Terminal **collect()**, convertemos a Stream em uma nova Collection chamada **estadosR**. Observe que foi passado como parâmetro do Método collect() o Método **Collectors.tolist()**, que **converte uma Stream em uma Collection List**. O resultado do algoritmo você confere abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/> **Resultado do Algoritmo:**

```bash
Exemplo - Método Collect

Estados cujo nome começam com a letra R: [Rio Grande do Sul, Rio de Janeiro]
```

<br />

<h3>3.2. Count</h3>

A operação terminal **count()** exibe o numero de itens encontrados no resultado final das operações realizadas na Stream. Veja o exemplo abaixo:

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="4%"/> Exemplo - Método Count:

```java
		System.out.println("\nExemplo - Método Count");
		
		long numeroEstadosTerminaComO = estados.stream()
		        .filter(x-> x.toString().endsWith("o"))
		        .count();

		System.out.println("\nNúmero de Estados cujo nome terminam com a letra O: " + numeroEstadosTerminaComO);

```

No código acima, foi passado como parâmetro do Método **filter()** a **Expressão Lambda:** `x -> x.toString().endsWith("o")`. Esta Expressão Lambda verifica em cada elemento da Collection **estados**, se o nome do estado termina com a letra o, através do Método **endsWith()**, da Classe String. 

Observe que o resultado da contagem foi armazenado na variável do tipo long **numeroEstadosTerminaComO**. O resultado do algoritmo você confere abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/> **Resultado do Algoritmo:**

```bash
Exemplo - Método Count

Número de Estados cujo nome terminam com a letra O: 3
```

<br />

<h3>3.3. AllMatch</h3>

A operação **allMatch()** nos ajuda a obter a resposta: *todos os elementos da Stream correspondem à uma determinada condição?* Veja o exemplo abaixo:

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="4%"/> Exemplo - Método AllMatch:

```java
		System.out.println("\nExemplo - Método AllMatch");
		
		boolean todosEstadosContemRio = estados.stream()
				.allMatch(x -> x.toString().contains("Rio"));

		System.out.println("\nTodos os Estados contém a palavra Rio? " + todosEstadosContemRio);
		
```

No código acima, foi passado como parâmetro do Método **allMatch()** a **Expressão Lambda:** `x -> x.toString().contains("Rio")`. Esta Expressão Lambda verifica se todos os elementos da Collection **estados**, o nome do estado contém a palavra Rio, através do Método **contains()**, da Classe String. 

Observe que o resultado da checagem foi armazenado na variável do tipo boolean **todosEstadosContemRio**. O resultado do algoritmo você confere abaixo:



<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/> **Resultado do Algoritmo:**

```bash
Exemplo - Método AllMatch

Todos os Estados contém a palavra Rio? false

```

<br />

<h3>3.4. AnyMatch</h3>

Em comparação com a operação **allMatch()**, a operação **anyMatch()** ajuda a verificar se pelo menos um dos elementos da Stream correspondem à uma determinada condição. Veja o exemplo abaixo:

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="4%"/> Exemplo - Método AnyMatch:

```java
System.out.println("\nExemplo - Método AnyMatch");
		
		boolean algumEstadoContemRio = estados.stream()
				.anyMatch(x -> x.toString().contains("Rio"));

		System.out.println("\nPelo menos um Estado contém a palavra Rio? " + algumEstadoContemRio);
		
```

No código acima, foi passado como parâmetro do Método **anyMatch()** a **Expressão Lambda:** `x -> x.toString().contains("Rio")`. Esta Expressão Lambda verifica em cada elemento da Collection **estados**, se pelo menos um estado contém a palavra Rio no nome, através do Método **contains()**, da Classe String. 

Observe que o resultado da checagem foi armazenado na variável do tipo boolean **algumEstadoContemRio**. O resultado do algoritmo você confere abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/> **Resultado do Algoritmo:**

```bash
Exemplo - Método AnyMatch

Pelo menos um Estado contém a palavra Rio? true
```

<br />

<h3>3.5. ForEach</h3>

O método **forEach()** é usado para iterar sobre a Collection resultante, igual ao laço de repetição for tradicional. Veja o exemplo abaixo:

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="4%"/> Exemplo - Método ForEach:

```java
		System.out.println("\nExemplo - Método ForEach");
		
		System.out.println("\nEstados cujo nome iniciam com a letra S:");
		
		estados.stream()
		        .filter(x-> x.toString().startsWith("S"))
		        .forEach(System.out::println);
		
```

No código acima, foi passado como parâmetro do Método **filter()** a **Expressão Lambda:** `x -> x.toString().startsWith("S")`. Esta Expressão Lambda verifica em cada elemento da Collection **estados**, se o nome do estado inicia com a letra S, através do Método **startsWith()**, da Classe String. 

Na sequência, através do Método **forEach()**, a Stream resultante será percorrida e a cada iteração, exibe na tela um elemento armazenado. O resultado do algoritmo você confere abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/> **Resultado do Algoritmo:**

```bash
Exemplo - Método ForEach

Estados cujo nome iniciam com a letra S:
São Paulo
Santa Catarina

```

No link abaixo, você pode obter o código completo do Exemplo acima.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/stream/streams_02" target="_blank"><b>Código fonte - Exemplo 02</b></a>

<br />

------

## 🔑**Pontos chave:**

- **Stream** é um pipeline (conjunto) de operações, que podemos usar para analisar os dados armazenados em uma Collection.
- Streams possuem dois tipos de Operações: **Intermediárias e Terminais**.
- **Operações intermediárias** são aquelas que retornam um novo Stream para que novas operações intermediárias sejam executadas.
- **Operações Terminais** são operações que unem os resultados de um *Stream* e retornam  um valor ou um objeto. Depois de invocada uma operação terminal, o mesmo Stream não poderá ser alterado por outras operações intermediárias ou  executar novas operações terminais.
- Uma Stream não é uma estrutura de dados, ela recebe uma Estrutura de Dado (Collection ou Array).
- Uma Stream não altera a estrutura de dados original, elas apenas fornecem o resultado de acordo com os métodos inseridos na pipeline.
- Stream não armazena dados, ela opera na estrutura de dados de origem, ou seja, na Collection.
- Streams não são modificáveis, ou seja, não é possível adicionar ou remover elementos.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
