<h1>Expressões Lambda</h1>



Antes de falarmos sobre Expressões Lambdas, precisamos definir o conceito de Programação Funcional.

<h2>1. Programação Funcional</h2>



A **Programação Funcional** é um paradigma da programação, que te permite criar códigos confiáveis e fáceis de testar. 

> Em computação, **Paradigma** nada mais é que a forma de fazer algo, ou seja, é a orientação que os códigos vão ter.

O Paradigma da Programação Funcional é baseado num modelo Computacional bem antigo, chamado de **Cálculo Lambda**, por isso o nome de Expressões Lambda. Para entender o que é programação funcional, entretanto, é importante entender outros paradigmas de programação famosos: **Programação Imperativa** e **Programação Orientada a Objetos** (POO).



<h3>1.1. Programação Imperativa</h3>

É o paradigma de programação mais famoso. Nas linguagens imperativas – como C e PHP –, os códigos são escritos como uma lista de instruções  que o computador lê e executa. É como se fossem comandos para a máquina, por isso programação imperativa. 

<h3>1.2. Programação Orientada a Objetos</h3>

Já na Programação Orientada a Objetos, em vez de descrever um código, o programador cria um objeto e adiciona comportamentos a ele. Alguns exemplos de linguagens de programação orientadas a objetos são Java, Python e Ruby. Outras, como JavaScript e PHP, são linguagens com suporte à orientação de objetos.

<h3>1.3. E a Programação Funcional?</h3>

Diferentemente das programações Imperativa e 0rientada a Objetos, a Funcional parte do princípio de que  tudo são funções. Não existe uma lista de instruções ou objetos para o  computador realizar, mas uma sequência de **funções matemáticas** que, juntas, vão resolver um problema.

Isso significa que, no paradigma funcional, você tem uma função,  coloca um dado de entrada, aplica várias operações e obtém uma saída. É  possível alterar as operações e, consequentemente, a saída, mas a  entrada sempre permanecerá a mesma.

Além disso, no Paradigma da Programação Funcional não existem variáveis, mas constantes. Isso se traduz em códigos mais  objetivos com constantes que, de forma geral, não mudam. Alguns exemplos de linguagens 100% funcionais são Clojure, Haskell e Elixir.

<div align="center"><img src="https://i.imgur.com/EtLQsSx.jpg" title="source: imgur.com" width="90%"/></div>

<br />

<h2>2. Expressões Lambda</h2>

Uma **Expressão Lambda** é um pequeno bloco de código que recebe parâmetros e retorna um valor. Uma expressão lambda também pode ser vista como uma função anônima. Uma função que não tem nome e não pertence a nenhuma classe. As Expressões Lambda são semelhantes aos métodos, mas não precisam de um nome e podem ser implementadas diretamente no corpo de um método. Através das Expressões Lambda o Java adicionou novas Classes, que implementam os conceitos da Programação Funcional, tornando a Linguagem Java mais flexível, servindo como um complemento para a construção de códigos mais limpos e enxutos.

**Sintaxe:**

```java
lista de parâmetros -> corpo da função
```

Uma Expressão Lambda consiste em três componentes, um conjunto de parâmetros, um operador Lambda e um corpo de função. Aqui estão os três componentes:

- **Lista de Parâmetros:** Aqui vem o argumento que pode ser vazio ou não vazio também.
- **Expressão Lambda:** Expressão Lambda ou seta (->) é usada para separar a lista de parâmetros e o corpo da função.
- **Corpo da função:** contém a instrução de função para Expressão Lambda.

Os parâmetros de entrada estão no lado esquerdo do Operador Lambda e o corpo da função no lado direito do Operador Lambda. Essa sintaxe do Lambda Expression reduz o volume do código, que é de cinco linhas de código em uma linha.

### Características da Expressão Lambda

Aqui estão algumas características importantes da Expressão Lambda.

- **Declaração de tipo:** a declaração de tipo é opcional. Depende de você, se você não declarar o tipo de parâmetro, o compilador pode adivinhar o valor do parâmetro. Por exemplo, você pode escrever como:

```java
(5,4) -> corpo da função
```

- **Parênteses ao redor do parâmetro:** O parêntese ao redor do parâmetro também é opcional. Você pode colocar parênteses se quiser, caso contrário, deixe como está. Se houver vários parâmetros em uma Expressão Lambda, os parênteses serão necessários, conforme mostrado no exemplo acima. Para apenas um parâmetro, você pode escrever como:

```java
5 -> corpo da função
```

- **Chaves:** As chaves ao redor do corpo da função também são opcionais se houver apenas uma instrução. Para várias declarações, chaves em torno do corpo da função são necessárias. Por exemplo:

```java
(5, 4) -> 5 + 4;
```

- **Instrução de retorno:** A instrução de retorno também é opcional em Expressões Lambda. O compilador Java retorna automaticamente o valor se o corpo tiver uma única expressão. Se o corpo da função retornar um valor, você deve colocá-lo entre chaves.

<img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/>**Exemplo 01 - Expressões Lambda e Collections:** 

Nesta primeira versão do código, não foram utilizadas as Expressões Lambdas:

```java
package lambda_collections_01;

import java.util.Arrays;
import java.util.List;

public class Lambda {
	public static void main(String[] args) {

		List<Integer> numeros = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9);

		System.out.println("Exibir os itens\n");
		
		// Exibir os itens da Lista sem Expressão Lambda
		for(Integer n : numeros) {
			System.out.println(n);
		}

		System.out.println("\nExibir os itens somados com eles mesmos\n");
		
		// Exibir os itens da Lista dobrados sem Expressão Lambda
		for(Integer n : numeros) {
			System.out.println(n + n);
		}

		System.out.println("\nExibir os itens pares da lista\n");
		
		// Exibir apenas os elementos pares da Lista sem Expressão Lambda
		for(Integer n : numeros) {
			if(n%2 == 0)
			System.out.println(n);
		}
	}
}
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/lambda/lambda_collections_v1" target="_blank"><b>Código fonte: Exemplo 01 - Versão 01</b></a></div>



<br />

Na segunda versão do código, foram utilizadas as Expressões Lambdas:

```java
package lambda_collections_02;

import java.util.Arrays;
import java.util.List;

public class Lambda {
	public static void main(String[] args) {

		List<Integer> numeros = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9);

		System.out.println("Exibir os itens\n");
		
		// Exibir os itens da Lista com Expressão Lambda
		numeros.forEach(n -> System.out.println(n));

		System.out.println("\nExibir os itens somados com eles mesmos\n");
		
		// Exibir os itens da Lista dobrados com Expressão Lambda
		numeros.forEach(n -> System.out.println(n + n));

		System.out.println("\nExibir os itens pares da lista\n");
		
		// Exibir apenas os elementos pares da Lista com Expressão Lambda
		numeros.forEach(n -> {
			if (n % 2 == 0)
				System.out.println(n);
		});
	}
}
```

Observe que ao comparar a primeira versão sem Expressões Lambdas, com a segunda versão com Expressões Lambdas, o código da segunda versão fica muito menos verboso, mais direto e limpo. Abaixo, vemos o resultado da execução de ambos os códigos.

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

```bash
Exibir os itens

1
2
3
4
5
6
7
8
9

Exibir os itens somados com eles mesmos

2
4
6
8
10
12
14
16
18

Exibir os itens pares da lista

2
4
6
8
```

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/java/javaOO/lambdaexpressions.html" target="_blank"><b>Documentação: Lambda Expressions</b></a></div>

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/lambda/lambda_collections_v2" target="_blank"><b>Código fonte: Exemplo 01 - Versão 02</b></a></div>


<br />

<h2>3. Interfaces Funcionais</h2>



**Interfaces Funcionais** são interfaces que têm um único Método Abstrato a ser implementado. Isso significa que toda Interface criada que respeite esta premissa, torna-se automaticamente uma Interface Funcional.

Um ponto importante que deve ser destacado é que o compilador Java reconhece automaticamente essas Interfaces e a partir da Expressão Lambda enviada, ele sabe exatamente qual Operação será executada pelo Método da Interface.

Para identificar que uma Interface é Funcional utilizamos a anotação **@FunctionalInterface**. O compilador exibe um alerta *'Annotation @FunctionalInterface inesperado'* se a Interface contiver mais de um método abstrato. No entanto, não há obrigação de utilizar esta anotação.

<br />

<img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/>**Exemplo 02 - Expressões Lambdas e Interface Funcional:** 

Neste exemplo, vamos criar uma Calculadora utilizando Interfaces Funcionais e Expressões Lambdas. 

Vamos começar implementando a Interface Funcional **OperacaoMatematica**, que será responsável por executar todas as Operações matemáticas da nossa Calculadora:

**Interface OperacaoMatematica**

```java
package lambda;

@FunctionalInterface
public interface OperacaoMatematica {

	public int executar(int a, int b);

}
```

Dentro da nossa Interface foi assinado o Método Abstrato executar, com 2 parâmetros inteiros.

Na sequência, vamos implementar a Classe **Calculadora**, onde implementaremos a Calculadora propriamente dita:

**Classe Calculadora**

```java
package lambda;

import java.util.Scanner;

public class TestaCalculadora {

	public static int calcular(OperacaoMatematica om, int num1, int num2) {
        return om.executar(num1, num2);
    }
	
	public static void main(String[] args) {

		Scanner leia = new Scanner(System.in);
		
		int n1, n2 = 0;
		
		System.out.println("****************************************************");
		System.out.println("              Calculadora com Lambda                ");
		System.out.println("****************************************************");
		System.out.println("Digite o primeiro numero: ");
		n1 = leia.nextInt();
		System.out.println("Digite o segundo numero: ");
		n2 = leia.nextInt();
		
		System.out.println("Soma = " + calcular((a,b) -> a + b, n1, n2));
        System.out.println("Subtração = " + calcular((a,b) -> a - b, n1, n2));
        System.out.println("Multiplicação = " + calcular((a,b) -> a * b, n1, n2));
        System.out.println("Divisão = " + calcular((a,b) -> a / b, n1, n2));
		
        leia.close();
        
	}
		
}
```

Observe que foi criado o Método **Calcular**, que receberá 3 parâmetros: Um **Objeto da Interface OperacaoMatematica**, que receberá a Expressão Lambda contendo a Operação Matemática que o Método **executar()** irá calcular e **2 parâmetros inteiros**, que serão a lista de parâmetros da Expressão Lambda.

Depois da entrada de dados, vamos observar a linha da operação de soma:

```java
System.out.println("Soma = " + calcular((a,b) -> a + b, n1, n2));
```

Observe que na chamada do Método Calcular, foi passado no primeiro parâmetro a Expressão Lambda responsável por efetuar a soma, que será processada pela Interface Funcional:

```java
//Expressão Lambda
(a,b) -> a + b
```

Na sequência foram inseridos os 2 números inteiros recebidos via teclado, que substituirão os parâmetros a e b na Expressão Lambda, efetuando a soma dos dois números.

As demais Operações seguem a mesma linha de raciocínio.

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

```bash
****************************************************
              Calculadora com Lambda                
****************************************************
Digite o primeiro numero: 
10
Digite o segundo numero: 
5
Soma = 15
Subtração = 5
Multiplicação = 50
Divisão = 2
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/lambda/calculadora_lambda" target="_blank"><b>Código fonte: Exemplo 02</b></a></div>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
