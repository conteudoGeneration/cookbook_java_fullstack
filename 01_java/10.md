<h1>Estrutura de Dados</h1>



As estruturas de dados são uma forma de organizar e armazenar dados em computadores, de forma que possamos realizar operações com mais eficiência. As estruturas de dados têm um escopo amplo e diversificado, em toda a área de ciência da computação e engenharia de software. 

Em termos simples, uma estrutura de dados é um contêiner que armazena  dados em um layout específico. Esse "layout" permite que a estrutura de  dados seja eficiente em algumas operações e ineficiente em outras. Seu  objetivo é entender as estruturas de dados de modo que você consiga  escolher a mais adequada para o problema apresentado.

Estruturas de dados são utilizadas em quase todos os sistemas ou softwares escritos para os mais diversos fins, inclusive em nosso curso você já utilizou algumas e nem percebeu. 

<h3>1.1. Por que precisamos de estruturas de dados ?</h3>

Como as estruturas de dados são usadas para armazenar dados de uma forma  organizada, e como os dados são a entidade mais crucial na Ciência da Computação, fica claro o verdadeiro valor das estruturas de dados.

Independentemente do problema que você esteja resolvendo, de uma forma ou de outra, terá  que lidar com dados — seja o salário de um empregado, preços de ações, uma lista de compras de um e-commerce, ou mesmo uma simples lista de telefones.

Com  base em diferentes cenários, os dados precisam ser guardados em um  formato específico e para este fim existem algumas estruturas de dados que satisfazem as nossas necessidades de armazenar dados em diferentes formatos.

<br />

<h2>2. Principais Estruturas de dados</h2>

Vamos conhecer algumas das Estruturas de dados mais conhecidas:

<h2>2.1. Array</h2>



**Array** foi primeira estrutura de dados que estudamos e é a mais popular, simples e amplamente utilizada no dia a dia pelas pessoas desenvolvedoras. É uma estrutura de dados baseada em índice, o que significa que cada elemento é referenciado por um índice. É uma estrutura de tamanho fixo, que contém itens de um mesmo tipo  de dados. Um array pode ser classificado em 3 categorias

1. **Unidimensionais (Vetor):** Um Array composto por uma única dimensão, ou seja, uma única linha composta por N colunas do mesmo do tipo, onde N é o número máximo de elementos, que o vetor armazenará. Para acessar cada elemento, utilizamos o numero da coluna: `vetor[coluna]`.

<div align="center"><img src="https://i.imgur.com/uAj5USU.png" title="source: imgur.com" /></div>

2. **Bidimensionais (Matriz):** Um Array composto por duas dimensões, ou seja, o par linha (I) e coluna (J), onde I é o número máximo de linhas e J é o número máximo de colunas que a Matriz possui. Para saber quantos elementos a Matriz pode armazenar, precisamos multiplicar o numero de linhas pelo numero de colunas. **Exemplo:** Matriz 3 x 3 (3 linhas por 3 colunas), possui a capacidade de armazenar até 9 elementos (3 * 3 = 9). Para acessar cada elemento, utilizamos o par: `matriz[linha][coluna]`.

<div align="center"><img src="https://i.imgur.com/n96Fbia.png" title="source: imgur.com" /></div>

3. **Multidimensionais:** Um Array que possui 3 ou mais dimensões, embora matematicamente só é possível representar até 3 dimensões. Um Array tridimensional, por exemplo, pode ser visto como uma matriz composta por N Matrizes. Para acessar cada elemento, utilizamos o trio: `matriz3d[numero_da_matriz][linha][coluna]`.

<div align="center"><img src="https://i.imgur.com/qI8qwAx.png" title="source: imgur.com" /></div>

<br />

No tópico Arrays, vimos como implementar Arrays unidimensionais (vetores) e bidimensionais (matrizes). No tópico Collections, vimos também como implementar um Array dinâmico, ou seja, sem tamanho fixo. 

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="100px"/> | <div align="left">**DICA:** *Caso você tenha alguma dúvida sobre Arrays, consulte o Cookbook sobre Matrizes e Vetores, disponível neste [link](08.md).* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>2.2. HashMap</h2> 



**HashMap** foi a segunda estrutura de dados, que estudamos em Collections, ao falarmos da Collection **Set**. **HashMap** é um conjunto de pares do tipo Chave Valor, que são organizadas a partir do **Hashcode** (Chave). Quando você adiciona um elemento, ele é adicionado na HashMap e o Hashcode correspondente é gerado automaticamente, através uma função matemática, que determina a posição em que o valor será armazenado na tabela. Por se tratar de um número calculado, a posição do elemento será aleatória. Veja a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/xSBwPjD.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="100px"/> | <div align="left">**DICA:** *Caso você tenha alguma dúvida sobre a Collection Set, consulte o Cookbook sobre Collections, disponível neste [link](15.md).* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>2.3. Fila</h2>



Uma **Fila** é uma estrutura de dados do tipo **FIFO**: *"o primeiro elemento que entra é o primeiro elemento que sai"* (first in, first out).  A ideia fundamental da fila é que só podemos inserir um novo elemento no final da fila e só podemos retirar um elemento do inicio. A estrutura fila é uma analogia natural com o conceito de fila que usamos no nosso dia a dia: A primeira pessoa a entrar na fila será a primeira pessoa a ser atendida (sair da fila). 

<div align="center"><img src="https://i.imgur.com/h43C5MC.png" title="source: imgur.com" /></div>

Observe na imagem acima que a Fila permite manipulação nas duas extremidades: no início (frente) e no fim (cauda). As Inserções são feitas na cauda e as Remoções são feitas na frente. 



<h3>2.3.1. A Collection Queue</h3>

Para a implementarmos a estrutura de dados Fila, vamos utilizar a Collection **Queue**, que é uma lista ordenada de objetos, onde só é possível inserir elementos no final da lista e excluir elementos do início da lista, ou seja, segue o princípio **FIFO** (**First-In-First-Out**).

**Sintaxe:**

```java
Queue<T> fila = new LinkedList<T>();
```

O construtor sem argumento padrão cria um Objeto da Classe **LinkedList** novo e vazio.

O item **`<T>`** em Java, representa um **Java Type Generic**. Ele é utilizado para definir o tipo de Objeto que será armazenado na  Collection. O Tipo de dados obrigatoriamente deve ser um Objeto, que  pode ser de uma **Classe Wrapper** ou de uma **Classe criada pela pessoa desenvolvedora**.

> **Por quê utilizamos a Classe LinkedList?**
>
> A **Classe LinkedList**, implementa a estrutura de dados chamada de **Lista encadeada ou vinculada**. Uma lista vinculada é como uma cadeia de nós, onde cada nó contém 2 informações: dados e um ponteiro (indicador) para o próximo nó da cadeia, que indica o endereço de memória onde o próximo elemento está armazenado. Nesta estrutura também existe um ponteiro (indicador), chamado **HEAD** (cabeça), que aponta para o primeiro elemento da lista vinculada. Caso a lista esteja vazia, ele simplesmente apontará para um Objeto Null (nulo). A imagem abaixo, vemos como funciona uma lista vinculada:
>
> <div align="center"><img src="https://i.imgur.com/l1HKF2E.png" title="source: imgur.com" /></div>
>
> Observe que o ponteiro **HEAD** aponta para o primeiro item da lista e cada item possui um ponteiro que aponta para o próximo elemento. O ultimo item aponta para um endereço NULL (nulo), porque não existe um próximo item atém que um novo elemento seja adicionado no final da lista. 
>
> Como os Objetos da Classe **LinkedList** sabem exatamente quem é o primeiro e o último item da lista, faz desta Classe a melhor opção para implementar a estrutura de dados Fila.
>
> 

<br />

<h3>Principais Métodos da Interface Queue</h3>

Na tabela abaixo, listamos os principais Métodos para trabalharmos com a Collection **Queue**:

| Método                 | Descrição                                                    |
| ---------------------- | ------------------------------------------------------------ |
| **add(elemento)**      | Este método é usado para adicionar um elemento no final da fila. |
| **size()**             | Este método é usado para retornar o tamanho da fila.         |
| **clear()**            | Este método é usado para remover todos os elementos da fila. |
| **remove(elemento)**   | Este método é usado para remover e retornar o primeiro elemento da fila. |
| **isEmpty()**          | Este método é usado para verificar se a fila está vazia ou não. Retorna verdadeiro se a fila estiver vazia, caso contrário, falso. |
| **contains(elemento)** | Este método é usado para verificar se a fila contém o elemento fornecido ou não. Retorna verdadeiro se a fila contiver o elemento. |
| **peek()**             | Este método é usado para exibir, mas não remover, o elemento que está sendo apontado pelo ponteiro HEAD desta fila (o primeiro elemento), ou retornar nulo se esta fila estiver vazia. |
| **poll()**             | Este método é usado para exibir e remover, o elemento que está sendo apontado pelo ponteiro HEAD desta fila (o primeiro elemento), ou retornar nulo se esta fila estiver vazia. |

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/collections/interfaces/queue.html" target="_blank"><b>Artigo: Java Tutorials: Collection Queue</b></a></div>

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/8/docs/api/java/util/Queue.html" target="_blank"><b>Documentação: Collection Queue</b></a></div>


<br />

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="4%"/> Exemplo 01 - Collection Queue:

No exemplo abaixo, vamos construir uma Collection Queue, chamada **fila**, contendo uma lista de numeros. Os números serão Objetos da Classe Wrapper **Integer** (lembre-se que Collections não aceitam primitivos) e faremos alguns testes com os Métodos da Collection Queue.

```java
package fila;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.Queue;

public class Fila {

	public static void main(String[] args) {

		Queue<Integer> fila = new LinkedList<Integer>();

		for (int i = 0; i <= 10; i++)
			fila.add(i);

		System.out.println("\nElementos na fila: "	+ fila);
		
		System.out.println("\nRemover Elemento: " + fila.remove());

		System.out.println("\nFila atualizada: " + fila);
		
		System.out.println("\nAdicionar Elemento 11: " + fila.add(11));

		System.out.println("\nExibir a Fila atualizada: " + fila);

		System.out.println("\nExibir o Primeiro Elemento da fila: " + fila.peek());

		System.out.println("\nExibir o Tamanho da fila: " + fila.size());
		
		System.out.println("\nChecar se o Elemento 4 existe na fila? " + fila.contains(4));
		
		System.out.println("\nExibe e Retira da fila o 1º Elemento (HEAD): " + fila.poll());
		
		System.out.println("\nExibir todos os Elementos da fila por Iteração");
		
		Iterator<Integer> iterator = fila.iterator();
		
		while(iterator.hasNext()){
		   System.out.println(iterator.next());
		}

		System.out.println("\nLimpar a fila");
		fila.clear();

		System.out.println("\nA fila está vazia? " + fila.isEmpty());		

	}

}
```

O resultados deste exemplo, você confere abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/> **Resultado do Algoritmo:**

```bash
Elementos na fila: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

Remover Elemento: 0

Fila atualizada: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

Adicionar Elemento 11: true

Exibir a Fila atualizada: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

Exibir o Primeiro Elemento da fila: 1

Exibir o Tamanho da fila: 11

Checar se o Elemento 4 existe na fila? true

Recupera e Retira da fila o 1º Elemento da fila (HEAD): 1

Exibir todos os Elementos da fila por Iteração
2
3
4
5
6
7
8
9
10
11

Limpar a fila...

A fila está vazia? true

Fila atualizada: [null]

```

Observe no código acima que um novo elemento sempre será inserido no final da fila e sempre será retirado o primeiro elemento da fila.

No link abaixo, você pode obter o código completo do Exemplo acima.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/estrutura_dados/fila" target="_blank"><b>Código fonte - Exemplo 01 - Fila</b></a></div>

<br />

<h2>2.4. Pilha</h2>



Uma **Pilha** é uma estrutura de dados do tipo **LIFO**: *"O último elemento inserido na pilha é o primeiro elemento que será retirado da pilha."* (**Last In -  First Out**). A ideia fundamental da pilha é que só podemos inserir ou retirar um elemento do topo da pilha. Essa Estrutura de dados é chamada de “pilha” porque se assemelha a uma pilha do mundo real, como por exemplo uma pilha de pratos, onde o último prato inserido na pilha, é o primeiro a ser retirado.

<div align="center"><img src="https://i.imgur.com/y8maSln.png" title="source: imgur.com" /></div>

Observe na imagem acima, que as 2 operações básicas que podem ser realizadas em uma pilha são inserir um elemento na pilha (Push) e retirar um elemento da pilha (Pop). 

- **PUSH** ou empurrar, insere um elemento no topo da pilha. 
- **POP** ou Excluir, retira o elemento do topo da pilha (retornando-o ou não). 

<h3>2.4.1. A Collection Stack</h3>

Para a implementarmos a estrutura de dados Pilha, vamos utilizar a Collection **Stack**, que é uma Classe que modela e implementa a estrutura de dados Pilha, seguindo o príncipio **Last In -  First Out**. Além disso, a Classe Stack fornece as operações básicas push e pop e métodos para esvaziar, pesquisar e consultar a pilha. 

**Sintaxe:**

```java
Stack<T> stack = new Stack<T>();
```

O construtor sem argumento padrão cria um Objeto da Classe **Stack** novo e vazio.

O item **`<T>`** em Java, representa um **Java Type Generic**. Ele é utilizado para definir o tipo de Objeto que será armazenado na  Collection. O Tipo de dados obrigatoriamente deve ser um Objeto, que  pode ser de uma **Classe Wrapper** ou de uma **Classe criada pela pessoa desenvolvedora**.

<br />

<h3>Principais Métodos da Classe Stack</h3>

Na tabela abaixo, listamos os principais Métodos para trabalharmos com a Collection **Stack**:

| Método                 | Descrição                                                    |
| ---------------------- | ------------------------------------------------------------ |
| **push()**             | Este método é usado para adicionar um elemento no topo da pilha. |
| **size()**             | Este método é usado para retornar o tamanho da pilha.        |
| **clear()**            | Este método é usado para remover todos os elementos da pilha. |
| **pop()**              | Este método é usado para remover e retornar o elemento no topo da pilha. |
| **isEmpty()**          | Este método é usado para verificar se a pilha está vazia ou não. Retorna verdadeiro se a pilha estiver vazia, caso contrário, falso. |
| **contains(elemento)** | Este método é usado para verificar se a pilha contém o elemento fornecido ou não. Retorna verdadeiro se a pilha contiver o elemento, caso contrário, falso. |
| **peek()**             | Este método é usado para exibir, sem remover, o elemento no topo da Pilha, ou retorna nulo se a pilha estiver vazia. |

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/8/docs/api/java/util/Stack.html" target="_blank"><b>Documentação: Collection Stack</b></a></div>

<br />

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="4%"/> Exemplo 02 - Collection Stack:

No exemplo abaixo, vamos construir uma Collection Stack, chamada **pilha**, contendo uma pilha de pratos identificados pela cor e na sequência faremos alguns testes com os Métodos da Collection Stack.

```java
package pilha;

import java.util.Iterator;
import java.util.Stack;

public class Pilha {

	public static void main(String[] args) {

		Stack<String> pilha = new Stack<String>();

		pilha.push("Prato Verde");
		pilha.push("Prato Azul");
		pilha.push("Prato Branco");
		pilha.push("Prato Amarelo");
		pilha.push("Prato Vermelho");

		System.out.println("\nElementos da Pilha: " + pilha);

		System.out.println("\nRetirar elemento: " + pilha.pop());
		
		System.out.println("\nElementos da Pilha: " + pilha);
		
		System.out.println("\nRetirar elemento: " + pilha.pop());
		
		System.out.println("\nElementos da Pilha: " + pilha);
		
		System.out.println("\nElemento no topo da Pilha: " + pilha.peek());
		
		System.out.println("\nAdicionar Elemento Prato Roxo: " + pilha.push("Prato Roxo"));
		
		System.out.println("\nExibir a Pilha Atualizada: " + pilha);
		
		System.out.println("\nTamanho da Pilha: " + pilha.size());

		System.out.println("\nO Elemento Prato Verde existe na Pilha? " + pilha.contains("Prato Verde"));
		
		System.out.println("\nExibir todos os Elementos da Pilha por Iteração");
		
		Iterator<String> iterator = pilha.iterator();
		
		while(iterator.hasNext()){
		   System.out.println(iterator.next());
		}

		pilha.clear();

		System.out.println("\nA Pilha está vazia? " + pilha.isEmpty());
		
	}

}
```

O resultados deste exemplo, você confere abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/> **Resultado do Algoritmo:**

```bash
Elementos da Pilha: [Prato Verde, Prato Azul, Prato Branco, Prato Amarelo, Prato Vermelho]

Retirar elemento: Prato Vermelho

Elementos da Pilha: [Prato Verde, Prato Azul, Prato Branco, Prato Amarelo]

Retirar elemento: Prato Amarelo

Elementos da Pilha: [Prato Verde, Prato Azul, Prato Branco]

Elemento no topo da Pilha: Prato Branco

Adicionar Elemento Prato Roxo: Prato Roxo

Exibir a Pilha Atualizada: [Prato Verde, Prato Azul, Prato Branco, Prato Roxo]

Tamanho da Pilha: 4

O Elemento Prato Verde existe na Pilha? true

Exibir todos os Elementos da Pilha por Iteração
Prato Verde
Prato Azul
Prato Branco
Prato Roxo

A Pilha está vazia? true
```

Observe no código acima que um elemento sempre será inserido e retirado do topo da pilha.

No link abaixo, você pode obter o código completo do Exemplo acima.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/estrutura_dados/pilha" target="_blank"><b>Código fonte - Exemplo 02 - Pilha</b></a></div>


<br />

------

## 🔑**Pontos chave:**

- **Estruturas de Dados** são uma forma de organizar e armazenar dados em computadores, de forma que possamos realizar operações com mais eficiência. 
- As estruturas de dados fornecem reutilização de dados, ou seja, após implementar uma determinada estrutura de dados uma vez, podemos usá-la muitas vezes em qualquer outro lugar. 
- **Array** é uma estrutura de dados baseada em índice, o que significa que cada elemento é referenciado por um índice. É uma estrutura de tamanho fixo, que contém itens de um mesmo tipo  de dados.
- **Hashtable** é um conjunto de pares de Chave Valor, que são organizadas a partir do **Hashcode** (Chave). Quando você adiciona um elemento, ele é adicionado na tabela Hash e o Hashcode correspondente é gerado automaticamente, através uma função matemática, que determina a posição em que o valor será armazenado na tabela.
- **Fila** é uma estrutura de dados do tipo **FIFO**: "o primeiro elemento que entra é o primeiro elemento que sai" (first in, first out).  A ideia fundamental da fila é que só podemos inserir um novo elemento no final da fila e só podemos retirar um elemento do inicio. 
- **Pilha** é uma estrutura de dados do tipo **LIFO**: *"O último elemento inserido na pilha é o primeiro elemento que será retirado da pilha."* (**Last In -  First Out**). A ideia fundamental da pilha é que só podemos inserir ou retirar um elemento do topo da pilha.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
