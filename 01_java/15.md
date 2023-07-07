<h1>Collections (Coleções)</h1>

A linguagem Java suporta arrays para armazenar vários objetos, entretanto, quando uma matriz é inicializada, ela é definida com um tamanho pré-definido durante o processo de instanciação, como vimos no anteriormente. Esta limitação causa alguns problemas para nós pessoas desenvolvedoras, pois quando estamos trabalhando com grandes volumes de dados, fica muito difícil mensurar o número de Objetos que iremos armazenar em uma Matriz. Para suportar estruturas de dados mais flexíveis, ou seja, sem tamanho pré-definido, o Java nos fornece a **Classe Collections** (Coleção). 

Uma Coleção é uma Estrutura de Dados que contém e processa um conjunto de dados. Os dados armazenados na coleção são encapsulados e o acesso aos dados só é possível por meio de métodos predefinidos. 

**Exemplo:** A pessoa desenvolvedora pode adicionar elementos a uma coleção por meio de um método. 

As coleções usam Matrizes internas para o armazenamento, mas ocultam da pessoa desenvolvedora a complexidade de gerenciar o tamanho da Matriz de forma dinâmica.

As Coleções oferecem diversas formas de armazenar os dados com base em fatores como:

- Eficiência no acesso, na busca ou na inserção;
- Forma de organização dos dados;
- Forma de acesso, busca e inserção dos dados

Para gerenciar todas estas estruturas de dados, o Java nos oferece as **Collections**.

<h2>1. Collections</h2>

**Collections** é uma biblioteca de classes e interfaces (no pacote **java.util.***), que implementa as principais estruturas de dados de forma reutilizável (usando apenas duas interfaces comuns). Além disso, oferece implementações de cursor para iteração (**Iterator**), para extrair os dados de qualquer estrutura usando uma única interface e implementações de métodos estáticos utilitários para manipulação de coleções e vetores.

As Collections não suportam dados primitivos (int, float, double, entre outros), somente se forem encapsulados dentro de Objetos ou se forem utilizadas as **Classes Wrappers** para converter os primitivos em Objetos:

**Classes Wrappers**

| **Tipo Primitivo** | **Tamanho**                 | **Wrapper** |
| ------------------ | --------------------------- | ----------- |
| **boolean**        | *true* ou *false*           | Boolean     |
| **char**           | 16  bits                    | Character   |
| **byte**           | 08  bits                    | Byte        |
| **short**          | 16  bits                    | Short       |
| **int**            | 32  bits                    | Integer     |
| **long**           | 64  bits                    | Long        |
| **float**          | 32  bits                    | Float       |
| **double**         | 64  bits                    | Double      |
| **String**         | **Não é um tipo primitivo** |             |

> **Wrapper:** Vem do verbo inglês “wrap” que  significa envolver. São Classes que adicionam funcionalidades a aos  tipos primitivos. A Classe Wrapper transforma um primitivo em Objeto e  adiciona Métodos.
>
> **Exemplo:**
>
> ```java
> Integer numeroInteiro = 2;
> ```
>
> Neste exemplo está sendo criado um **Objeto da Classe wrapper Integer**, chamado **numeroInteiro**, contendo o valor 2.

Nos Organogramas abaixo, temos uma visão geral das Classes e Interfaces, que compõem o Pacote Collections:

> **Interface** é uma estrutura que representa uma **Classe abstrata "pura"** em Java, que **não possui atributos de dados**, **não possui um Método construtor**, **todos os seus Métodos são abstratos** e **não é declarada como Classe, e sim como Interface**. Aprofundaremos este assunto mais adiante.

**Collections - Parte 01**

<div align="center"><img src="https://i.imgur.com/PHjCJzj.png" title="source: imgur.com" /></div>

A interface **List** (Lista) é uma extensão (herança) da Interface **Collection**. **Os elementos em uma lista são ordenados como uma sequência**. O usuário pode utilizar o  número do índice para acessar um determinado elemento da lista, ou seja, o usuário tem controle total sobre qual elemento está inserido na lista. A Interface List é como um array de tamanho variável. 

Fazendo uma analogia com Blocos de montar, uma **List** seria como uma sequência de blocos numerados (índices), como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/0Oq8S5J.png" title="source: imgur.com" /></div>

As implementações **ArrayList**  e **Vector** são muito semelhantes, a grande diferença entre elas está na performance. A implementação **ArrayList** é bem mais eficiente do que a implementação **Vector**. Nos próximos tópicos, veremos a Estrutura de dados **ArrayList** com mais detalhes.

A Implementação **LinkedList** ou Lista Vinculada é uma estrutura de dados linear, na qual os elementos não são armazenados em locais de memória contíguos (sequenciais). Os elementos em uma lista vinculada são vinculados usando ponteiros internamente, que "apontam" para o endereço de Memória do próximo item (**SimpleLinkedList - Lista Vinculada simples**) ou para o endereço de Memória do próximo item e do item anterior (**DoubleLinkedList - Lista Duplamente Vinculada**).

> Os **Ponteiros** são **variáveis especiais que apontam para uma área de memória**. Os ponteiros não possuem a informações em si, mas dizem onde a informação está armazenada na Memória. Na Linguagem Java, os Ponteiros atuam internamente na Linguagem Java e não ficam visíveis para as Pessoas Desenvolvedoras, como na Linguagem C, por exemplo.

Fazendo uma analogia com Blocos de montar, uma **LinkedList** seria como uma sequência de blocos que possuem conexões (links) com o próximo bloco (encadeada) e com o bloco anterior (duplamente encadeada), como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/yccszbp.png" title="source: imgur.com" /></div>

A Implementação **Stack**, implementa a estrutura de dados chamada Pilha. Uma **Pilha** é uma estrutura de dados do tipo **LIFO**: *"O último elemento inserido na pilha é o primeiro elemento que será retirado da pilha."* (**Last In -  First Out**). 

Fazendo uma analogia com Blocos de montar, uma **Stack** seria como uma pilha de blocos, um em cima do outro, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/WNPT9AV.png" title="source: imgur.com" /></div>

A interface **Queue** (Fila) é uma extensão (herança) da Interface **Collection**. **Queue** é a implementação da Estrutura de Dados conhecida como fila, onde *"O primeiro elemento adicionado, será primeiro elemento a ser retirado da fila"* (**FIFO - First in, First out**). 

Fazendo uma analogia com Blocos de montar, uma **Fila** seria como uma sequência de blocos, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/R4NFtpj.png" title="source: imgur.com" /></div>

Um ponto de atenção importante é que as implementações **PriorityQueue** e **ArrayDeque** não seguem este principio, porque elas permitem tanto a inserção e remoção de elementos da Fila tanto do início, quanto do final da fila. Observe que como **Queue** e **Deque** são Interfaces, elas não possuem uma definição dos Métodos, apenas as assinaturas, logo estas Interfaces necessitam ser implementadas em uma Classe. A Estrutura de dados fila pode ser representada no mundo real como uma fila de pessoas em um balcão, onde a pessoa que entra primeiro será atendida primeiro e log sai da fila primeiro.

A interface **Set** é uma extensão (herança) da Interface **Collection**. O Conjunto é uma estrutura que modela a definição matemática de um conjunto de dados. É uma coleção de objetos, que **não permite objetos duplicados**. O conjunto permite no máximo um elemento nulo. 

Fazendo uma analogia com Blocos de montar, um **Set** seria como uma coleção de blocos, ou seja, um conjunto, sem elementos repetidos, não ordenados, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/ZLO7x3I.png" title="source: imgur.com" /></div>

A implementação **HashSet** é a mais rápida de todas, porque ela utiliza internamente uma **HashTable** e seus elementos não são ordenados. Essa implementação é indicada se você precisa apenas garantir a alta performance sem se importar com a ordem com que os elementos estão ordenados. Nos próximos tópicos, veremos esta Estrutura de dados com mais detalhes.

A implementação **TreeSet** implementa um algoritmo conhecido como árvore. Sua principal característica é que ele é o único Set que implementa a interface **SortedSet**, logo ela mantém os elementos da Collection ordenados automaticamente, independente da  ordem que você inserir os elementos. Essa Ordenação dos elementos tem um custo de performance em relação a implementação **HashSet**.

Fazendo uma analogia com Blocos de montar, uma **Tree** seria como uma pirâmide de blocos, que inicia com um bloco no topo e vai crescendo para baixo como se fossem as raízes da árvore, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/ejHofrZ.png" title="source: imgur.com" /></div>

A implementação **LinkedHashSet** é um meio termo entre **HashSet** e **TreeSet**, ou seja, ela  nos proporciona um pouco da performance do HashSet e um pouco do poder de ordenação do TreeSet. Os elementos são mantidos na ordem em que são inseridos na Collection. A implementação **LinkedHashSet** implementa a Interface **NavigableSet**, que oferece uma série de Métodos para percorrer e iterar sobre a Collection tanto na ordem crescente, quanto na ordem decrescente.

**Collections - Parte 02**

<div align="center"><img src="https://i.imgur.com/zuFuBH4.png" title="source: imgur.com" width="75%"/></div>

A interface **Map** define um array associativo, isto é, ao invés de utilizar números inteiros como índices, objetos são utilizados como chaves para recuperar os elementos armazenados nesta Collection. As chaves não podem se repetir (seguindo o mesmo princípio da interface Set), mas os valores podem ser repetidos para chaves diferentes. Um Map também não possui necessariamente uma ordem definida para percorrer a coleção. 

Fazendo uma analogia com Blocos de montar, um **Map** seria como uma coleção de blocos, ou seja, um conjunto, não ordenados, onde cada elemento possui uma Chave e um Valor, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/lyMrafp.png" title="source: imgur.com" /></div>

A implementação **HashMap** armazena os objetos em forma de par **chave-valor**. Além disso, a implementação **HashMap** não mantém os Objetos ordenados, chaves duplicadas não são permitidas e permite vários Objetos com valores nulos.

A implementação **LinkedHashMap** armazena os Objetos em forma de par **chave-valor**. Além disso, a implementação **LinkedHashMap**  mantém a ordem de inserção dos seus elementos e não permite chaves duplicadas.

A implementação **TreeMap** armazena os Objetos em forma de par **chave-valor**. Além disso, a implementação **TreeMap** mantém os elementos armazenados em ordem crescente e não permite chaves duplicadas.

A implementação **HashTable** armazena os Objetos em forma de par **chave-valor**. Além disso, a implementação **HashTable** não permite chaves duplicadas e utiliza o método **hashcode()** para encontrar a posição dos objetos/elementos.

Observe que cada Interface possui algumas implementações diferentes (Classes). Na prática, cada implementação representa um tipo de Estrutura de Dados diferente.

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/collections/interfaces/index.html" target="_blank"><b>Artigo: Java Tutorials: Collections</b></a></div>

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/8/docs/api/?java/util/Collections.html" target="_blank"><b>Documentação: Collections</b></a></div>

<br />

<h2>2. Iterator</h2>

A Interface **Iterable** é a raiz de toda a hierarquia de coleção, o que  significa que cada classe e interface a implementa. A função principal  de um iterador é permitir que o usuário percorra todos os objetos de qualquer uma da Collections, presentes no Pacote Collections, como se fossem sequências simples de itens de dados.

O Iterator deve ser usado sempre que quisermos enumerar elementos em todas as Interfaces implementadas pelas Collections: Set, List, Queue, Deque, e todas as classes implementadas da interface Map. 

**Sintaxe:**

```java
Iterator<T> nomeDoIterator = nomeDaCollection.iterator();
```

O item **`<T>`** em Java, representa um **Java Type Generic**. Ele é utilizado para definir o tipo de Objeto que será armazenado na Collection. O Tipo de dados obrigatoriamente deve ser um Objeto, que pode ser de uma **Classe Wrapper** ou de uma **Classe criada pela pessoa desenvolvedora**.

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/java/generics/types.html" target="_blank"><b>Documentação: Java Type Generic</b></a></div>

<br />

<h3>2.1. Principais Métodos da Interface Iterator</h3>

Na tabela abaixo, listamos os principais Métodos para trabalharmos com a Interface Iterator:

| Método        | Descrição                                                    |
| ------------- | ------------------------------------------------------------ |
| **hasNext()** | Retorna verdadeiro se a iteração tiver mais elementos.       |
| **next()**    | Retorna o próximo elemento na iteração. Ele lança a Exceção **NoSuchElementException** se nenhum outro elemento estiver presente. |

<h3>2.2. Quais são as vantagens e desvantagens de se utilizar a Interface Iterator?</h3>

As principais vantagens da Interface Iterator são:

- Podemos utilizar esta Interface com qualquer Collection;

- É um Iterador (cursor) universal para Collections.

- Os nomes dos métodos são simples e fáceis de usar.

As principais limitações da Interface Iterator são:

- O Iterator oferece suporte apenas à iteração de direção direta, ou seja, unidirecional.
- O Iterator NÃO oferece suporte à iteração de elementos paralelos, o que significa que oferece suporte apenas à iteração  sequencial. 

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="100px"/> | <div align="left">**DICA:** *Para efetuar iteração paralela, utilizamos outra Interface, chamada de **SplitIterator**, que divide a Collection em partes menores e percorre estas partes simultaneamente.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Nos próximos tópicos, veremos alguns exemplos com a Interface Iterator.

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html" target="_blank"><b>Documentação: Interface Iterator</b></a></div>

<br />

<h2>3. A Collection ArrayList</h2>

Em nosso curso, vamos estudar mais a fundo Collection List, Subclasse ArrayList. A Collection ArrayList é a escolha natural quando for necessário usar um vetor redimensionável, que é muito mais eficiente para leitura, por ser implementado internamente com vetores, o que a torna ideal para o acesso aleatório aos dados armazenados.

**Sintaxe:**

```java
ArrayList<T> notas = new ArrayList<T>();
```

O construtor sem argumento padrão cria um Objeto da Classe ArrayList novo e vazio.

O item **`<T>`** em Java, representa um **Java Type Generic**. Ele é utilizado para definir o tipo de Objeto que será armazenado na Collection. O Tipo de dados obrigatoriamente deve ser um Objeto, que pode ser de uma **Classe Wrapper** ou de uma **Classe criada pela pessoa desenvolvedora**.

<br />

<h3>3.1. Principais Métodos da Interface List</h3>

Na tabela abaixo, listamos os principais Métodos para trabalharmos com a Collection List:

| **Método**                          | **Descrição**                                                |
| ----------------------------------- | ------------------------------------------------------------ |
| **add(Objeto)**                     | Adiciona  um objeto no final da lista.                       |
| **add(Indice,Objeto)**              | Adiciona  um objeto na posição indicada (empurra elementos existentes para a frente) |
| **get(Indice)**                     | Recupera  um objeto pelo índice.                             |
| **indexOf(Objeto)**                 | Procura  um objeto e retorna índice da primeira ocorrência do objeto. |
| **set(Indice,Objeto)**              | Grava  um objeto na posição indicada (apaga qualquer outro que ocupava a posição). |
| **remove(Indice)**                  | Apaga  o objeto armazenado na posição indicada pelo índice.  |
| **clear()**                         | Limpa  a lista                                               |
| **size()**                          | Retorna  o tamanho da lista (numero de elementos armazenados). |
| **isEmpty()**                       | Retorna  true se a lista está vazia.                         |
| **contains(Objeto)**                | Retorna  true se  existe uma ocorrência do elemento na lista. |
| **sort(null)**                      | Ordena os elementos da lista em ordem crescente.             |
| **sort(Comparator.reverseOrder())** | Ordena os elementos da lista em ordem decrescente.           |

<br />

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="4%"/> Exemplo 01 - Collection ArrayList:

No exemplo abaixo, vamos construir uma Collection ArrayList, chamada **notas**, contendo uma lista de notas. Os números serão Objetos da Classe Wrapper Double (lembre-se que Collections não aceitam primitivos) e faremos alguns testes com os Métodos da Collection List.

```java
package arraylist;

import java.util.ArrayList;
import java.util.Collections;

public class CollectionList {

	public static void main(String[] args) {

		// Cria a Collection ArrayList, do tipo Double, chamada notas
		ArrayList<Double> notas = new ArrayList<Double>();

		// Cria um Objeto da Classe Wrapper Double
		Double y = Double.valueOf(9);

		/**
		 * Adiciona algumas Notas. 
		 * Observe que a primeira nota é o Objeto Wrapper Double.
		 */
		notas.add(y);
		notas.add(7.0);
		notas.add(5.0);
		notas.add(4.0);
		notas.add(10.0);
		notas.add(4.0);

		/**
		 * Mostra na tela todas as notas adicionadas. 
		 * Observe que a nota duplicada foi adicionada duas vezes.
		 */
		System.out.println("\nNotas cadastradas: " + notas);

		/**
		 * Mostra a posição (indice) de uma determinada nota. 
		 * Caso existam 2 notas iguais será exibida a posição da primeira nota encontrada.
		 */
		System.out.println("\nA posição da nota 5 é: " + notas.indexOf(5d));

		// Mostra se uma determinada nota existe na lista
		System.out.println("\nA nota 5 existe na lista? " + notas.contains(5d));

		// Mostra a nota inserida em uma determinada posição (indice)
		System.out.println("\nNa posição 1 da lista, a nota é: " + notas.get(1));

		// Altera a nota 5.0 para 6.0 e mostra que a alteração foi efetuada
		notas.set(notas.indexOf(5d), 6.0d);
		System.out.println("\nA nota 5 foi alterada para 6: " + notas);
	
		/**
		 *  Apaga a nota 4.0 e mostra que a exclusão foi efetuada.
		 *  Observe que apenas a primeira nota 4.0 foi apagada.
		 */
		notas.remove(notas.indexOf(4.0d));
		System.out.println("\nA nota 4 foi apagada: " + notas);

		// Checa se a lista está vazia
		System.out.println("\nA lista está vazia? " + notas.isEmpty());

		// Exibe o tamanho da lista (numero de elementos)
		System.out.println("\nO tamanho da lista é: " + notas.size());

		// Limpa a lista e mostra que ela está vazia
		notas.clear();
		System.out.println("\nA lista está vazia: " + notas);
		
	}

}
```

O resultados deste exemplo, você confere abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/> **Resultado do Algoritmo:**

```bash
Notas cadastradas: [9.0, 7.0, 5.0, 4.0, 10.0, 4.0]

A posição da nota 5 é: 2

A nota 5 existe na lista? true

Na posição 1 da lista, a nota é: 7.0

A nota 5 foi alterada para 6: [9.0, 7.0, 6.0, 4.0, 10.0, 4.0]

A nota 4 foi apagada: [9.0, 7.0, 6.0, 10.0, 4.0]

A lista está vazia? false

O tamanho da lista é: 5

A lista está vazia: []
```

<br />

<h3>Como a Colection ArrayList irá armazenar os dados?</h3>

Na imagem abaixo, temos uma representação gráfica da Collection ArrayList **notas**:

 <div align="left"><img src="https://i.imgur.com/EBd8R46.png" /></div>

Observe que a Collection **notas**, será do tipo **Double** (Classe Wrapper para números double) e cada novo Objeto (número) da Classe Double, será adicionado em uma linha da Collection ArrayList. Assim como os vetores, cada linha é identificada por um número inteiro (índice).

A Collection ArrayList sempre respeita a ordem em que o Objeto foi inserido, ou seja, a cada novo Objeto inserido, uma nova linha será criada após o último Objeto adicionado.

<br />

No link abaixo, você pode obter o código completo do Exemplo acima.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/collections/list" target="_blank"><b>Código fonte - Exemplo 01</b></a></div>

<br />

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="4%"/> Exemplo 02 - Collection ArrayList e Iterator:

No exemplo abaixo, vamos iterar a Collection ArrayList **notas**, através do Laço de Repetição **for...each** e da Interface Iterator.

```java
package arraylist;

import java.util.ArrayList;
import java.util.Iterator;

public class CollectionList {

	public static void main(String[] args) {

		// Cria a Collection ArrayList chamada notas
		ArrayList<Double> notas = new ArrayList<Double>();

		// Cria um Objeto da Classe Wrapper Double
		Double y = Double.valueOf(9);

		/**
		 * Adiciona algumas Notas. 
		 * Observe que a primeira nota é o Objeto Wrapper Double.
		 */
		notas.add(y);
		notas.add(7.0);
		notas.add(5.0);
		notas.add(4.0);
		notas.add(10.0);
		notas.add(4.0);

		/**
		 * Mostra na tela todas as notas através do laço For...Each. 
		 */
		System.out.println("\nNotas cadastradas - Laço For...Each");

		for(Double nota : notas) {
			System.out.println(nota);
		}
		
		/**
		 * Mostra na tela todas as notas através da Interface Iterator. 
		 */
		System.out.println("\nNotas cadastradas - Interface Iterator");

		Iterator<Double> iNotas = notas.iterator();
		
		while(iNotas.hasNext()) {
			System.out.println(iNotas.next());
		}
	
		
	}

}
```

Observe que o Iterator, cria um Objeto da Interface Iterator, chamado **iNotas**, contendo os dados da Collection **notas**. Para efetuar a Iteração, utilizamos um Laço de repetição **while**, que verifica se existe um próximo elemento no Iterator, através do Método **hasNext()**. Se existir um próximo item, este próximo item é acessado através do Método **next()** e exibido na tela. O Iterator é uma solução mais elegante e intuitiva, para percorrer uma Collection.

O resultado você confere abaixo:

```bash
Notas cadastradas - Laço For...Each
9.0
7.0
5.0
4.0
10.0
4.0

Notas cadastradas - Interface Iterator
9.0
7.0
5.0
4.0
10.0
4.0
```

No link abaixo, você pode obter o código completo do Exemplo acima.

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/collections/interfaces/list.html" target="_blank"><b>Artigo: Java Tutorials: Collection List</b></a></div>

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/8/docs/api/java/util/List.html" target="_blank"><b>Documentação: Collection List</b></a></div>

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/collections/list_iterator" target="_blank"><b>Código fonte - Exemplo 02</b></a></div>

<br />

<h2>4. A Collection Set </h2>

**Set** é uma coleção não ordenada de objetos, que não permite o armazenamento de valores duplicados, ou seja, ela permite apenas valores únicos. Essa interface contém os métodos herdados da Interface Collection e adiciona um recurso que restringe a inserção dos elementos duplicados. Esta classe também permite a inserção de um único elemento nulo (NULL), embora não seja recomendado. 

Os objetos que inserimos na Collection Set não serão necessariamente inseridos na mesma ordem e inclusive esta ordem não é constante ao longo do tempo. A Collection Set não possui um Método para obter um Objeto a partir do seu índice, como vimos na Collection List. 

Os objetos são inseridos na Collection Set com base em seu **Hashcode**. O **Hashcode** é um número inteiro com 7 dígitos, calculado a partir do Método **Hashcode()**. A partir do Hashcode do Objeto, obtido pelo Método **hashcode()**, a Collection Set determina a posição onde o Objeto será armazenado no **Hashmap**. Por se tratar de um número calculado, a posição do elemento será aleatória.

O **HashSet** usa internamente o **HashMap** para armazenar seus elementos. Sempre que você cria um objeto HashSet, um objeto HashMap associado a ele também é criado. Este objeto HashMap é usado para armazenar os elementos inseridos no HashSet. Os elementos adicionados ao HashSet são armazenados como chaves desse objeto HashMap. O valor associado a essas chaves será uma constante (**PRESENT**). 

Veja a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/xSBwPjD.png" title="source: imgur.com" /></div>

<br />

Observe na imagem acima, que em cada Objeto inserido na Collection Set, a função Hash é executada, ou seja, o  hashcode() do Objeto é calculado. A partir deste cálculo, a posição do Objeto na HashMap é definido, sem levar em consideração a ordem de inserção. Os elementos que foram adicionados na Collection Set, são inseridos no HashMap na propriedade **Chave** do item do HashMap, enquanto a propriedade **Valor** receberá sempre a constante **PRESENT**.

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="200px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha atenção aos detalhes ao trabalhar com a Collection Set. O foco da Collection Set não é a ordenação e a posição de inserção dos elementos na Collection, e sim garantir a exclusividade dos seus elementos, ou seja, valores únicos, sem repetições.*</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

**Sintaxe:**

```java
Set<T> setNumeros = new HashSet<T>();
```

Em nosso curso, vamos estudar a Collection Set, Subclasse HashSet. O construtor sem argumento padrão cria um Objeto da Classe HashSet novo e vazio.

O item **`<T>`** em Java, representa um **Java Type Generic**. Ele é utilizado para definir o tipo de Objeto que será armazenado na Collection. O Tipo de dados obrigatoriamente deve ser um Objeto, que pode ser de uma **Classe Wrapper** ou de uma **Classe criada pela pessoa desenvolvedora**.

<br />

<h3>4.1. Métodos da Collection Set</h3>

Na tabela abaixo, listamos os principais Métodos para trabalharmos com a Collection Set:

| **Método**           | **Descrição**                                                |
| -------------------- | ------------------------------------------------------------ |
| **add(Objeto)**      | Adiciona um Objeto na Collection Set.                        |
| **remove(Objeto)**   | Apaga o Objeto armazenado na Collection Set.                 |
| **clear()**          | Limpa a Collection Set                                       |
| **size()**           | Retorna  o tamanho da Collection Set (numero de elementos armazenados). |
| **isEmpty()**        | Retorna  true se a Collection Set está vazia.                |
| **contains(Objeto)** | Retorna  true se o Objeto existe na Collection Set.          |
| **hashcode()**       | Retorna o **Hashcode** do elemento.                          |


Vamos ver no exemplo abaixo como criar uma Collection Set:

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="4%"/> Exemplo 03 - Collection Set:

No exemplo abaixo, vamos construir uma Collection Set, chamada **setFrutas**, contendo uma lista de frutas. As frutas serão Objetos da Classe String (lembre-se que Collections não aceitam primitivos) e faremos alguns testes com os Métodos da Collection Set.

```java
package hashset;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class CollectionSet {

	public static void main(String[] args) {
		
		// Cria a Collection Set, do tipo String chamada setFrutas
		Set<String> setFrutas = new HashSet<String>();

		// Adiciona algumas frutas na Colection Set
		setFrutas.add("Abacate");
		setFrutas.add("Banana");
		setFrutas.add("Jaboticaba");
		setFrutas.add("Kiwi");
		setFrutas.add("Maçã");
		setFrutas.add("Morango");
		setFrutas.add("Pêra");
		setFrutas.add("Jaboticaba");
		setFrutas.add("Kiwi");

		/**
		 * Mostra os dados armazenados na Collection Set Observe que as frutas repetidas
		 * foram inseridos apenas uma vez
		 */
		System.out.println("\nDados da Collection: " + setFrutas);

		// Verifica se um elemento está armazenado na Collection Set
		System.out.println("\nExiste a fruta Kiwi? " + setFrutas.contains("Kiwi"));

		// Remove um elemento da Collection
		setFrutas.remove("Kiwi");
		System.out.println("\nKiwi foi removida!");

		// Verifica após a remoção se o elemento ainda existe na Collection Set
		System.out.println("\nExiste a fruta Kiwi na Collection? " + setFrutas.contains("Kiwi"));

		// Lista os hashcodes da Collection através do Laço de repetição for...each
		System.out.println("\n\nListar todos os Elementos com o Laço For..Each");

		for (String fruta : setFrutas) {
			if (fruta != null)
				System.out.println("O Hashcode do Elemento " + fruta + " é " + fruta.hashCode());
		}

		// Lista todos os elementos da Collection Set com o Objeto da Classe Iterator
		System.out.println("\n\nListar todos os Elementos com o Iterator");

		Iterator<String> isetFrutas = setFrutas.iterator();

		while (isetFrutas.hasNext()) {
			System.out.println(isetFrutas.next());
		}

		// Verifica se a Collection Set está vazia
		System.out.println("\nA Colection Set está vazia? " + setFrutas.isEmpty());

		// Limpa a Collection Set
		setFrutas.clear();
		System.out.println("\nTodos os itens foram removidos da Collection Set!");

		// Verifica novamente se a Collection Set está vazia
		System.out.println("\nA Colection Set está vazia? " + setFrutas.isEmpty());
		
	}

}
```

O resultado deste exemplo, você confere abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/> **Resultado do Algoritmo:**

```bash

Dados da Collection: [Jaboticaba, Kiwi, Maçã, Morango, Abacate, Pêra, Banana]

Existe a fruta Kiwi? true

Kiwi foi removida!

Existe a fruta Kiwi na Collection? false

Listar todos os Elementos com o Laço For..Each
O Hashcode do Elemento Jaboticaba é 1259857398
O Hashcode do Elemento Maçã é 2394512
O Hashcode do Elemento Morango é -1390544699
O Hashcode do Elemento Abacate é 456481679
O Hashcode do Elemento Pêra é 2611785
O Hashcode do Elemento Banana é 1982479237


Listar todos os Elementos com o Iterator
Jaboticaba
Maçã
Morango
Abacate
Pêra
Banana

A Colection Set está vazia? false

Todos os itens foram removidos da Collection Set!

A Colection Set está vazia? true
```

No link abaixo, você pode obter o código completo do Exemplo acima.

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/collections/interfaces/set.html" target="_blank"><b>Artigo: Java Tutorials: Collection Set</b></a></div>

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/8/docs/api/java/util/Set.html" target="_blank"><b>Documentação: Collection List</b></a></div>

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/collections/set" target="_blank"><b>Código fonte - Exemplo 03</b></a></div>

<br />

------

## 🔑**Pontos chave:**

- **Collections (coleções)** em Java são tipos especiais de classes utilizadas para manipular grupos de dados do mesmo tipo (por exemplo, coleção de strings), com tamanho flexível.
- **Array** é um tipo de estrutura de dados que contém um número fixo de valores de um único tipo
- **ArrayList** é a coleção em Java que representa a estrutura de dados do array
- **Queue (Fila)** é um tipo de estrutura de dados que armazena valores sequenciais, onde o primeiro valor inserido, sempre será o primeiro valor a ser retirado (First In - First Out).
- **Set** é um tipo de estrutura de dados que armazena valores exclusivos do mesmo tipo (sem duplicatas)
- **HashSet** é a coleção em Java que representa a estrutura de dados do set
- **Map** é um tipo de estrutura de dados utilizado para a pesquisa rápida de dados. Ele armazena dados na forma de pares de chave e valor.
- **HasMap** é a coleção em Java que representa a estrutura de dados do map
- **Iterator**  é uma Interface que permite ao usuário iterar (percorrer) todos os objetos de uma Collection, como se fossem sequências simples de itens de dados. O Iterator é uma Interface padrão para todas as Collections e faz o mesmo papel do Laço de repetição for...each, de uma forma mais elegante.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
