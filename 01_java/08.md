<h1>Arrays - Vetores e Matrizes</h1>



**Array** é uma estrutura de dados muito popular, simples e amplamente utilizada no dia a dia pelas pessoas desenvolvedoras. É uma estrutura de dados baseada em índice, o que significa que cada elemento é referenciado por um índice. É uma estrutura de tamanho fixo, que contém itens de um mesmo tipo  de dados. Um array pode ser classificado em 3 categorias

1. **Unidimensionais (Vetor):** Um Array composto por uma única dimensão, ou seja, uma única linha composta por N colunas do mesmo do tipo, onde N é o número máximo de elementos, que o vetor armazenará. 

2. **Bidimensionais (Matriz):** Um Array composto por duas dimensões, ou seja, o par linha (I) e coluna (J), onde I é o número máximo de linhas e J é o número máximo de colunas que a Matriz possui. 

3. **Multidimensionais:** Um Array que possui 3 ou mais dimensões, embora matematicamente só é possível representar até 3 dimensões. Um Array tridimensional, por exemplo, pode ser visto como uma matriz composta por  N Matrizes. 

Nos próximos tópicos, veremos como implementar Arrays Unidimensionais (Vetores) e Bidimensionais (Matrizes). 

<h2>1. Vetores</h2>

Os **Vetores ou Arrays Unidimensionais**, são estruturas de dados que permitem o acesso a uma grande quantidade de dados em memória usando somente um nome de variável. Esta variável especial é declarada de tal maneira que a pessoa desenvolvedora passa a ter acesso à muitas posições de memória, de maneira controlada.

Um vetor sempre será composto por elementos do mesmo tipo (String, int, float, entre outros), que podem ser referenciados como um todo. Ao declararmos um vetor, estamos reservando na memória principal do computador uma série de células para uso da variável daquele tipo. O nome do vetor aponta para a base das células e o seu início dá a posição relativa do elemento referenciado ao primeiro (base). Para identificar os elementos do vetor utilizaremos o **índice**.

<div align="center"><img src="https://i.imgur.com/WML81no.png" title="source: imgur.com" /></div>

No exemplo acima, temos um vetor com **5 posições alocadas na memória**. Observe que o **índice inicia em 0**. Os dados ficam alocados em cada posição de memória.

**Sintaxe de um Vetor com dados:**

```java
tipo_de_dado nome_do_vetor[] = {v1, v2, v3,..., vn};
```

ou

```java
tipo_de_dado[] nome_do_vetor = {v1, v2, v3,..., vn};
```

**Sintaxe de um Vetor sem dados:**

```java
tipo_de_dado nome_do_vetor[] = new tipo_de_dado[tamanho];
```

ou

```java
tipo_de_dado[] nome_do_vetor = new tipo_de_dado[tamanho];
```

<br />

<h3>1.1. Tipo</h3>

Este parâmetro define o tipo de dado que será armazenado no vetor. Assim como uma variável, o tipo do vetor pode ser: *int, double, float, char, String.*

<h3>1.2. nome do Vetor</h3>

O nome do vetor é o identificador do vetor, assim como fazemos com as variáveis. O nome do vetor segue as mesmas regras que utilizamos para os nomes de variáveis:

Diferentemente das palavras do mundo real, na programação não se pode separar as palavras que fazem parte do identificador de uma variável com espaço. Ao invés disso, usa-se:

- Uma letra maiúscula no começo de cada palavra, exceto a primeira (**Camel-Case**). **Exemplo:** *nomeDaVariavel*

No Java, geralmente se utiliza o padrão Camel-Case, entretanto, existem outras restrições aos identificadores de variáveis, tais como:

- O identificador Java é uma sequência de caracteres que consiste em letras, dígitos, sublinhados (_) e cifrões ($)._
- Deve começar com uma letra, um sublinhado (_) ou um cifrão ($). Não pode começar com um dígito.
- Não pode ser **`true`, `false` ou `null`.**
- Pode ser de qualquer comprimento, entretanto recomenda-se que não seja muito grande.
- Os identificadores em Java devem ser exclusivos e auto descritivos. **Exemplo:** **`mediaFinal`**.
- Existem algumas convenções de nomenclatura que são seguidas pelos programadores Java, como:
  - Os nomes de todas as variáveis e métodos de instância pública começam com uma palavra com todas as letras minúsculas. **Exemplo:** **`media`, `soma`**, entre outras.
  - Se mais de uma palavra for usada em um nome (palavra composta), a segunda e as demais palavras subsequentes devem começar com uma letra maiúscula inicial. **Exemplo:** **`temperaturaAnual`, `estoqueTotalMensal`,** entre outros (Camel-Case).
  - Todas as classes e interfaces, todas as palavras devem começar com uma letra maiúscula inicial. Exemplo: **`HelloJava`, `Produto`,** entre outras.

- Os identificadores não podem utilizar palavras reservadas, como: **`class`**, **`for`**, **`while`**, **`public`**, etc

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** O nome do vetor deve expressar exatamente o seu conteúdo. Evite utilizar nomes genéricos como vetor1, vetor_01, entre outros.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h3>1.3. Declarando Vetores</h3>

Vamos entender como declarar um vetor:

**Exemplo 01 - Vetor com dados do tipo inteiro**

```java
int vetorInteiros[] = {10, 15, 35, 70, 140};
```

<div align="center"><img src="https://i.imgur.com/YILRPx6.png" title="source: imgur.com" /></div>

Na imagem acima, vemos a alocação de memória para o vetor de números inteiros. Observe que cada valor está em uma posição do vetor.

**Exemplo 02 - Vetor com dados do tipo String**

```java
String vetorStrings[] = {"Boxer", "Pastor Alemão", "Pinscher", "Husky Siberiano", "Corgi"};
```

<div align="center"><img src="https://i.imgur.com/Tw9GfYr.png" title="source: imgur.com" /></div>

Na imagem acima, vemos a alocação de memória para o vetor composto por caracteres, por isso o tipo String. Observe que cada palavra está em uma posição do vetor.

**Exemplo 03 - Vetor vazio**

```java
float vetorReal[] = new float[5];
```

<div align="center"><img src="https://i.imgur.com/WML81no.png" title="source: imgur.com" /></div>

Na imagem acima, vemos a alocação de memória para um vetor do tipo Real, vazio. Observe que todas as posições do vetor estão vazias. Neste caso, para inserir dados no vetor seria necessário utilizar a **classe Scanner**.

<h3>1.4. Acessar uma posição do Vetor / Array</h3>

Para acessar os dados armazenados em uma posição do vetor utilizaremos o **nome do vetor seguido por colchetes**. Dentro dos colchetes, informaremos o **índice do vetor**, ou seja, a posição que desejamos obter os dados armazenados.

**Sintaxe:**

```java
nome_do_vetor[indice];
```

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>Exemplo 04 - Exibindo os dados do Vetor

```java
public class Exemplo4 {

    public static void main(String[] args) {
        String vetorString[] = {"Boxer","Pastor Alemão","Pinscher","Husky Siberiano","Corgi"};
    
        System.out.println("1º elemento: " + vetorString[0]);
        System.out.println("2º elemento: " + vetorString[1]);
        System.out.println("3º elemento: " + vetorString[2]);
        System.out.println("4º elemento: " + vetorString[3]);
        System.out.println("5º elemento: " + vetorString[4]);
    }
}
```

<br>

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
1º elemento: Boxer
2º elemento: Pastor Alemão
3º elemento: Pinscher
4º elemento: Husky Siberiano
5º elemento: Corgi
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/vetor_matriz/src/vetor_Matriz/Exemplo4.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

Observe que o índice é uma sequência numérica e o comando **System.out.println();** é repetido por 5 vezes com o mesmo conteúdo, mudando apenas o índice do vetor. Para deixarmos o código acima mais simples, usaremos um Laço de Repetição. Observe o exemplo abaixo:

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>Exemplo 05 - Exibindo os dados do Vetor  - Versão 02

```java
public class Exemplo5 {

    public static void main(String[] args) {
        String vetorString[] = {"Boxer","Pastor Alemão","Pinscher","Husky Siberiano","Corgi"};
        
        for(int indice = 0; indice < 5; indice++) {
            System.out.println((indice + 1) + "º elemento: " + vetorString[indice]);  
        }
    }
}
```

<br>

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
1º elemento: Boxer
2º elemento: Pastor Alemão
3º elemento: Pinscher
4º elemento: Husky Siberiano
5º elemento: Corgi
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/vetor_matriz/src/vetor_Matriz/Exemplo5.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

Observe que o resultado foi o mesmo, entretanto, utilizando o **Laço de Repetição** o código ficou mais simples.

<br />

<h3>1.5. Entrada de dados - Vetor vazio</h3>

Para inserir os dados em um vetor do tipo **int**, via teclado, iremos utilizar a **instância de um Objeto da Classe Scanner**, que chamaremos de **leia**. Para que cada posição do vetor receba um valor através do comando **leia**, vamos passar o **nome do vetor com o índice**, ou seja, a posição que desejamos guardar os dados digitados.

**Sintaxe:**

```java
nome_do_vetor[indice] = leia.metodo_entrada(); 
```

*O Método de entrada do Objeto leia dependerá do tipo de dado do vetor.*

<br />

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>Exemplo 06 - Inserindo dados no Vetor vazio

```java
public class Exemplo6 {

    public static void main(String[] args) {
        
        int vetorInteiros[] = new int[5];
        Scanner leia = new Scanner(System.in);
        
        for(int indice = 0; indice < 5; indice ++) {
            System.out.println("Digite o " + (indice + 1)  +"º Número: ");
            vetorInteiros[indice] = leia.nextInt();
        }
        
        System.out.println("\nOs números digitados foram: \n");
        
        for(int indice = 0; indice < 5; indice++) {
            System.out.println((indice + 1) + "º número: " + vetorInteiros[indice]);
        }
    }
}
```

<br>

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Digite o 1º Número: 
10
Digite o 2º Número: 
20
Digite o 3º Número: 
30
Digite o 4º Número: 
40
Digite o 5º Número: 
50

Os números digitados foram: 

1º número: 10
2º número: 20
3º número: 30
4º número: 40
5º número: 50
```

Neste exemplo, o vetor foi preenchido com os dados obtidos via teclado e ao finalizar o preenchimento do vetor, os dados foram exibidos na tela.

<br>

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/vetor_matriz/src/vetor_Matriz/Exemplo6.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

<h3>1.6. Métodos padrão de um Vetor</h3>

| Método     | Descrição                      |
| ---------- | ------------------------------ |
| **length** | Retorna o tamanho de um vetor. |

<br />

**Sintaxe:**

```java
nome_do_vetor.length;
```

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>Exemplo 07 - Descobrindo o tamanho de um Vetor

```java
public class Exemplo7 {

    public static void main(String[] args) {
        String vetor_cachorros[] = {"Boxer","Pastor Alemão","Pinscher","Husky Siberiano","Corgi"};
        
        System.out.println("Itens dentro do vetor: \n");
        
        for(int indice = 0; indice < vetor_cachorros.length; indice++) {
            System.out.println(vetor_cachorros[indice]);    
        }
        
        System.out.println("\nO tamanho do seu vetor é: " + vetor_cachorros.length);
    }
}
```

<br>

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Itens dentro do vetor: 

Boxer
Pastor Alemão
Pinscher
Husky Siberiano
Corgi

O tamanho do seu vetor é: 5
```

Observe que neste exemplo, além de usar o método **length** para mostrar o tamanho do nosso vetor, também o utilizamos no Laço de Repetição FOR, no segundo parâmetro, para determinar a sua **condição limite**, sem a necessidade de passar um número em si.

<br>

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/vetor_matriz/src/vetor_Matriz/Exemplo7.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

<h3>1.7. Métodos da Classe Arrays</h3>

A **Classe Arrays** é a classe que implementa métodos para manipular arrays. Os métodos da classe Arrays suportam arrays de qualquer tipo. 

**Principais métodos:**

| Método                                             | Descrição                                                    |
| -------------------------------------------------- | ------------------------------------------------------------ |
| **Arrays.sort(array)**                             | Ordena os elementos de um array de primitivos em ordem crescente. |
| **Arrays.sort(array, Collections.reverseOrder())** | Ordena os elementos de um array de Objetos em ordem decrescente. <br />Para utilizar este Método em um vetor de primitivos, precisamos converter o vetor para um vetor de Objetos através das **Classes Wrapper** (veremos mais adiante). |
| **Arrays.equals(array1,  array 2)**                | Compara 2 arrays retornando true se ambos tiverem o mesmo conteúdo, as mesmas  referências, na mesma ordem e do mesmo tipo. |
| **Arrays.binarySearch(array,  chave de pesquisa)** | Retorna a posição do elemento procurado no array. O array deverá estar ordenado e sem  valores duplicados. |
| **Arrays.fill(array,  valor)**                     | Preenche o array com o valor informado.                      |
| **Arrays.compare(array1,  array 2)**               | Compara 2 arrays baseados no seu conteúdo, retornando true se ambos tiverem o mesmo conteúdo, as mesmas  referências, na mesma ordem e do mesmo tipo. |

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>Exemplo 08 - Utilizando o Método .sort()

```java

import java.util.Arrays;
import java.util.Collections;

public class Exemplo8 {

    public static void main(String[] args) {
        String array_nomes[] = {"Samantha", "Amanda", "Vinicius", "Cauê", "Leonardo"};

        Arrays.sort(array_nomes);
        
        System.out.println("Array em Ordem Crescente \n");
        for(int indice = 0; indice < array_nomes.length; indice++) {
            System.out.println(array_nomes[indice]);    
        }
        
        Arrays.sort(array_nomes, Collections.reverseOrder());
        
        System.out.println("\nArray em Ordem Decrescente \n");
        for(int indice = 0; indice < array_nomes.length; indice++) {
            System.out.println(array_nomes[indice]);    
        }
    }
}
```

<br />

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Array em Ordem Crescente 

Amanda
Cauê
Leonardo
Samantha
Vinicius

Array em Ordem Decrescente 

Vinicius
Samantha
Leonardo
Cauê
Amanda
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/vetor_matriz/src/vetor_Matriz/Exemplo8.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>Exemplo 08 - Versão 02 - Utilizando o Método .sort() com primitivos

```java
import java.util.Arrays;

public class Exemplo8V2 {

    public static void main(String[] args) {
        
        int vetorInteiros[] = { 3, 2, 1, 6, 5, 10, 7, 4, 9, 8 };

		Arrays.sort(vetorInteiros);

		System.out.println("Array de primitivos em Ordem Crescente \n");
		for (int indice = 0; indice < vetorInteiros.length; indice++) {
			System.out.println(vetorInteiros[indice]);
		}

		System.out.println("\nArray de primitivos em Ordem Decrescente \n");
		
		int[] reverseArray = new int[vetorInteiros.length];

		for (int indice = 0; indice < vetorInteiros.length; indice++) {
			reverseArray[indice] = vetorInteiros[(vetorInteiros.length - 1) - indice];
		}

		for (int indice = 0; indice < vetorInteiros.length; indice++) {
			System.out.println(reverseArray[indice]);
		}
    }
}
```

<br />

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Array de primitivos em Ordem Crescente 

1
2
3
4
5
6
7
8
9
10

Array de primitivos em Ordem Decrescente 

10
9
8
7
6
5
4
3
2
1
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/vetor_matriz/src/vetor_Matriz/Exemplo8V2.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>Exemplo 09 - Utilizando os Métodos .equals() e .toString()

```java
import java.util.Arrays;

public class Exemplo9 {

    public static void main(String[] args) {
        String grupoA[] = { "Amanda", "Elen", "Vinicius" };
        String grupoB[] = { "Samantha", "Letícia", "Alan" };

        System.out.println("Os Arrays são iguais? ");

        if (Arrays.equals(grupoA, grupoB)) {
            System.out.println("Sim, são iguais.");
        } else {
            System.out.println("Não, são diferentes.");
        }

    }
}
```

<br />

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Os Arrays são iguais? 
Não, são diferentes.
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/vetor_matriz/src/vetor_Matriz/Exemplo9.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>Exemplo 10 - Utilizando o Métodos .binarySearch()

```java
package aula_04;

import java.util.Arrays;

public class Exemplo10 {

	public static void main(String[] args) {
		
		int vetorInteiros[] = {1,2,3,4,5,10,7,6,9,8};
		
		//Ordena o Vetor 
		Arrays.sort(vetorInteiros);
		
		System.out.println("\nVetor Ordenado");
		
		for (int indice = 0; indice < vetorInteiros.length; indice++) {
			 System.out.println(vetorInteiros[indice]);
		}

        System.out.println("\nO elemento 10 Existe? Qual é a posição?");

        int posicao = Arrays.binarySearch(vetorInteiros, 10);
        
        // Se a posição for positiva = Encontrou
        if (posicao >= 0 )
			System.out.println("\nO elemento foi Encontrado e está na Posição: " + posicao);
		else
			System.out.println("\nElemento não encontrado!");

	}

}
```

<br />

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Vetor Ordenado
1
2
3
4
5
6
7
8
9
10

O elemento 10 Existe? Qual é a posição?

O elemento foi Encontrado e está na Posição: 9
```

<br />

Observe que para utilizar o Método **binarySearch()** o vetor deve estar previamente ordenado.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/vetor_matriz/src/vetor_Matriz/Exemplo10.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

<h2>2. Matrizes</h2>



As Matrizes são estruturas de dados, que assim como os vetores, permitem o acesso a uma grande quantidade de dados em memória usando-se somente um nome de variável, que diferem de um vetor pelo fato de possuir 2 dimensões, ou seja, possui uma estrutura composta por linhas e colunas. As Matrizes também são conhecidas como **Arrays Bidimensionais**.

<div align="center"><img src="https://i.imgur.com/Xn1GvqP.png" title="source: imgur.com" /></div>

No exemplo acima, temos uma Matriz 3x3, ou seja, com **3 linhas por 3 colunas**. Observe que o **índice das linhas e das colunas iniciam em 0**. Os dados ficam alocados em cada posição de memória identificada pelo par (linha, coluna).

<br />

<h3>2.1. Tipos de Matrizes</h3>



As Matrizes são Classificadas em 2 tipos:

- **Matrizes Regulares ou Quadradas:** São Matrizes que possuem o mesmo número de linhas e colunas;
- **Matrizes Irregulares:** São Matrizes que possuem um número diferente de linhas e colunas.

**Exemplo:**

<table>
	<tr>
        <td width="50%"><img src="https://i.imgur.com/P3Gu2oN.png" title="source: imgur.com" /></td>
        <td width="50%"><img src="https://i.imgur.com/fFy03Ae.png" title="source: imgur.com" /></td>
    </tr>
<tr>
        <td align="center">Matriz Regular 3 x 3</td>
        <td align="center">Matriz Irregular 2 x 3</td>
    </tr>
</table>

<br />

**Sintaxe de uma Matriz com dados:**

```java
tipo_de_dado nome_da_Matriz[][] = {{v1, v2, ..., vn}, {v1, v2, ..., vn}, ..., {vn, vn, .., vn}};
```

ou

```java
tipo_de_dado[][] nome_da_Matriz = {{v1, v2, ..., vn}, {v1, v2, ..., vn}, ..., {vn, vn, .., vn}};
```

**Sintaxe de uma Matriz sem dados:**

```java
tipo_de_dado nome_da_Matriz[][] = new tipo_de_dado[numero de linhas][numero de colunas];
```

ou

```java
tipo_de_dado[][] nome_da_Matriz = new tipo_de_dado[numero de linhas][numero de colunas];
```

<br />

<h3>2.2. Tipo</h3>

Este parâmetro define o tipo de dado que será armazenado na Matriz. Assim como uma variável, o tipo da matriz pode ser: *int, double, float, char, String.*

<br />

<h3>2.3. Identificador da Matriz</h3>

O nome da matriz é o identificador da matriz, assim como fazemos com as variáveis. O nome da matriz segue as mesmas regras que utilizamos para os nomes de variáveis:

Diferentemente das palavras do mundo real, na programação não se pode separar as palavras que fazem parte do identificador de uma variável com espaço. Ao invés disso, usa-se:

- Uma letra maiúscula no começo de cada palavra, exceto a primeira (**Camel-Case**). **Exemplo:** *nomeDaVariavel*

No Java, geralmente se utiliza o padrão Camel-Case, entretanto, existem outras restrições aos identificadores de variáveis, tais como:

- O identificador Java é uma sequência de caracteres que consiste em letras, dígitos, sublinhados (_) e cifrões ($)._
- Deve começar com uma letra, um sublinhado (_) ou um cifrão ($). Não pode começar com um dígito.
- Não pode ser **`true`, `false` ou `null`.**
- Pode ser de qualquer comprimento, entretanto recomenda-se que não seja muito grande.
- Os identificadores em Java devem ser exclusivos e auto descritivos. **Exemplo:** **`mediaFinal`**.
- Existem algumas convenções de nomenclatura que são seguidas pelos programadores Java, como:
  - Os nomes de todas as variáveis e métodos de instância pública começam com uma palavra com todas as letras minúsculas. **Exemplo:** **`media`, `soma`**, entre outras.
  - Se mais de uma palavra for usada em um nome (palavra composta), a segunda e as demais palavras subsequentes devem começar com uma letra maiúscula inicial. **Exemplo:** **`temperaturaAnual`, `estoqueTotalMensal`,** entre outros (Camel-Case).
  - Todas as classes e interfaces, todas as palavras devem começar com uma letra maiúscula inicial. Exemplo: **`HelloJava`, `Produto`,** entre outras.

- Os identificadores não podem utilizar palavras reservadas, como: **`class`**, **`for`**, **`while`**, **`public`**, etc

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** O nome da matriz deve expressar exatamente o seu conteúdo. Evite utilizar nomes genéricos como matriz1, matriz_01, entre outros.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h3>2.4. Declarando matrizes</h3>

Vamos conhecer 2 formas de declarar uma matriz:

**Exemplo 11-A - Matriz com dados do tipo inteiro**

```java
int matrizInteiros[][] = {{10, 15, 35}, {70, 120, 140}, {50, 100, 150}};
```

<div align="center"><img src="https://i.imgur.com/JzsvZW6.png" title="source: imgur.com" /></div>

Na imagem acima, vemos a alocação de memória para uma matriz 3x3, de números inteiros. Observe que cada valor está em uma posição da matriz.

**Exemplo 11-B - Matriz Vazia**

```java
double[][] matrizReal = new double[3][3];
```

<div align="center"><img src="https://i.imgur.com/Xn1GvqP.png" title="source: imgur.com" /></div>

Na imagem acima, vemos a alocação de memória para uma matriz do tipo double, vazia. Observe que todas as posições da matriz estão vazias. Neste caso, para inserir dados na matriz seria necessário utilizar a **classe Scanner**.

<br />

<h3>2.5. Acessar uma posição da matriz</h3>

Para acessar os dados armazenados em uma posição da matriz utilizaremos o **nome da matriz seguido por 2 colchetes**. Dentro dos colchetes, informaremos o **índice da linha no primeiro colchete e o índice da coluna no segundo colchete**, ou seja, a posição que desejamos obter os dados armazenados. Veja a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/aHONJGv.png" title="source: imgur.com" /></div>

Observe que cada posição da Matriz, **possui o par formado pelo índice da linha e o índice da coluna**. 

**Sintaxe:**

```java
nome_da_matriz[indice_linha][indice_coluna];
```

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>Exemplo 12 - Exibindo os dados da Matriz

```java
public class Exemplo12 {

    public static void main(String[] args) {
        int matrizInteiros[][] = { { 10, 15, 35 }, { 70, 120, 140 }, { 50, 100, 150 } };

        for (int indiceLinha = 0; indiceLinha < 3; indiceLinha++) {
            for (int indiceColuna = 0; indiceColuna < 3; indiceColuna++) {
                System.out.println(
                    "O valor armazenado na posição [" + indiceLinha + "][" + indiceColuna + "] é: " + matrizInteiros[indiceLinha][indiceColuna]);

            }
        }
    }
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
O valor armazenado na posição [0][0] é: 10
O valor armazenado na posição [0][1] é: 15
O valor armazenado na posição [0][2] é: 35
O valor armazenado na posição [1][0] é: 70
O valor armazenado na posição [1][1] é: 120
O valor armazenado na posição [1][2] é: 140
O valor armazenado na posição [2][0] é: 50
O valor armazenado na posição [2][1] é: 100
O valor armazenado na posição [2][2] é: 150
```

Neste exemplo, os dados da matriz foram exibidos na tela acessando posição por posição, através de dois laços de repetição **For**. o Laço externo itera (percorre) as linhas e o Laço interno itera (percorre) as colunas.

<br>

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/vetor_matriz/src/vetor_Matriz/Exemplo12.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

<h3>2.6. Entrada de dados - Matriz vazia</h3>

Para inserir os dados em uma matriz, via teclado, iremos utilizar a **instância de um Objeto da Classe Scanner**, que chamaremos de **leia**. Para que cada posição da Matriz receba um valor através do comando **leia**, vamos passar o **nome da matriz com os respectivos índices da linha e da coluna**, ou seja, a posição que desejamos guardar os dados digitados.

**Sintaxe:**

```java
nome_da_matriz[indice_linha][indice_coluna] = leia.nextInt()
```

*O Método de leitura do Objeto leia, dependerá do tipo de dado da matriz.*

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>Exemplo 13 - Inserindo dados na matriz via teclado

```java
public class Exemplo13 {

    public static void main(String[] args) {
        int[][] matrizInteiros = new int[3][3];
        Scanner leia = new Scanner(System.in);

        for (int linha = 0; linha < 3; linha++) {
            for (int coluna = 0; coluna < 3; coluna++) {
                System.out.println(
                    "Digite um valor para a posição [" + linha + "][" + coluna + "]: ");
                matrizInteiros[linha][coluna] = leia.nextInt();
            }
        }

        for (int linha = 0; linha < 3; linha++) {
            for (int coluna = 0; coluna < 3; coluna++) {
                System.out.println(
                    "O valor armazenado na posição [" + linha + "][" + coluna + "] é: "
                        + matrizInteiros[linha][coluna]);
            }
        }
    }
}
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Digite um valor para a posição [0][0]: 
1
Digite um valor para a posição [0][1]: 
2
Digite um valor para a posição [0][2]: 
3
Digite um valor para a posição [1][0]: 
4
Digite um valor para a posição [1][1]: 
5
Digite um valor para a posição [1][2]: 
6
Digite um valor para a posição [2][0]: 
7
Digite um valor para a posição [2][1]: 
8
Digite um valor para a posição [2][2]: 
9
O valor armazenado na posição [0][0] é: 1
O valor armazenado na posição [0][1] é: 2
O valor armazenado na posição [0][2] é: 3
O valor armazenado na posição [1][0] é: 4
O valor armazenado na posição [1][1] é: 5
O valor armazenado na posição [1][2] é: 6
O valor armazenado na posição [2][0] é: 7
O valor armazenado na posição [2][1] é: 8
O valor armazenado na posição [2][2] é: 9
```

Neste exemplo, a matriz foi preenchida com dados obtidos via teclado e ao finalizar o preenchimento da matriz, os dados foram exibidos na tela.

<br>

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/vetor_matriz/src/vetor_Matriz/Exemplo13.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

<h3>2.7. Operações Matemáticas com Matrizes</h3>

Vamos criar um programa para Somar todos os elementos inteiros de cada coluna da Matriz. Para guardar o resultados das somas das colunas, vamos utilizar um vetor auxiliar do tipo inteiro.

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>Exemplo 14 - Somas das colunas da matriz

```java
public class Exemplo14 {

    public static void main(String[] args) {

        int soma = 0;
        int vetorSoma[] = new int[4]; // Cria um vetor de 4 posições
        int[][] matrizInteiros = new int[5][4]; // Cria uma Matriz 5x4
        
        Scanner leia = new Scanner(System.in);

        // Insere os dados na matriz
        for (int linha = 0; linha < 5; linha++) {
            for (int coluna = 0; coluna < 4; coluna++) {

                System.out.println(
                    "Digite um valor para a posição [" + linha + "][" + coluna + "]: ");
                matrizInteiros[linha][coluna] = leia.nextInt();
            }
        }
        
        // Como desejamos somar as colunas, invertemos os índices nos laços de repetição
        // Compare com os laços de repetição acima
        for(int coluna = 0; coluna < 4; coluna++) {
            for(int linha = 0; linha < 5; linha++) {
                
                // Armazena a soma dos elementos da coluna na variável 
                soma += matrizInteiros[linha][coluna];
            }
            
            // Guarda a soma no vetor auxiliar
            vetorSoma[coluna] = soma;
            
            // Zera a variável soma, para receber a soma dos elementos da próxima coluna
            soma = 0;
        }
        
        // Mostra na tela o resultado da soma dos elementos de cada coluna da Matriz
        for(int coluna=0; coluna < 4; coluna++) {
            System.out.println(
                "Soma de todos os elementos da coluna " + (coluna + 1) + " é: " + vetorSoma[coluna]);
        }   
    }
}
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Digite um valor para a posição [0][0]: 
1
Digite um valor para a posição [0][1]: 
2
Digite um valor para a posição [0][2]: 
3
Digite um valor para a posição [0][3]: 
4
Digite um valor para a posição [1][0]: 
5
Digite um valor para a posição [1][1]: 
6
Digite um valor para a posição [1][2]: 
7
Digite um valor para a posição [1][3]: 
8
Digite um valor para a posição [2][0]: 
9
Digite um valor para a posição [2][1]: 
10
Digite um valor para a posição [2][2]: 
11
Digite um valor para a posição [2][3]: 
12
Digite um valor para a posição [3][0]: 
13
Digite um valor para a posição [3][1]: 
14
Digite um valor para a posição [3][2]: 
15
Digite um valor para a posição [3][3]: 
16
Digite um valor para a posição [4][0]: 
17
Digite um valor para a posição [4][1]: 
18
Digite um valor para a posição [4][2]: 
19
Digite um valor para a posição [4][3]: 
20

Soma de todos os elementos da coluna 1 é: 45
Soma de todos os elementos da coluna 2 é: 50
Soma de todos os elementos da coluna 3 é: 55
Soma de todos os elementos da coluna 4 é: 60
```

Leia os comentários no código para compreender o programa.

<br>

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/vetor_matriz/src/vetor_Matriz/Exemplo14.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

<h3>2.8. Propriedades das Matrizes</h3>



| Método                         | Descrição                                                    |
| ------------------------------ | ------------------------------------------------------------ |
| **matriz.length**              | Retorna o número de linhas de uma matriz, onde matriz é o nome do array. |
| **matriz[indiceLinha].length** | Retorna o número de colunas de uma matriz, onde matriz é o nome do array e indiceLinha é variável que representa o índice da linha na estrutura de repetição.<br />Caso a Matriz possua o mesmo número de linhas e colunas, você pode usar o método **matriz.length** em ambas as estruturas de repetição. |

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>Exemplo 15 - Utilizando o Método .length em uma Matriz

```java
public class Exemplo15 {

    public static void main(String[] args) {

        String[][] matrizNomes = new String[2][3];
        Scanner leia = new Scanner(System.in);
        
        // Sem Utilizar o Método length
        for (int linha = 0; linha < 2; linha++) {
            for (int coluna = 0; coluna < 3; coluna++) {

                System.out.println(
                    "Digite um nome para a posição [" + linha + "][" + coluna + "]: ");
                matrizNomes[linha][coluna] = leia.next();
            }
        }
        
        // Utilizando o Método length
        for (int linha = 0; linha < matrizNomes.length; linha++) {
            for (int coluna = 0; coluna < matrizNomes[linha].length; coluna++) {
                System.out.println(
                    "O nome armazenado na posição [" + linha + "][" + coluna + "] é: "
                        + matrizNomes[linha][coluna]);
            }
        }
        
        System.out.println(
            "\nSua Matriz tem " + matrizNomes.length + " linhas e " + 
            matrizNomes[0].length + " colunas.");
        
    }
}
```

<br />

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Digite um nome para a posição [0][0]: 
Maria
Digite um nome para a posição [0][1]: 
Ivone
Digite um nome para a posição [0][2]: 
João
Digite um nome para a posição [1][0]: 
Paulo
Digite um nome para a posição [1][1]: 
Miguel
Digite um nome para a posição [1][2]: 
Paula
O nome armazenado na posição [0][0] é: Maria
O nome armazenado na posição [0][1] é: Ivone
O nome armazenado na posição [0][2] é: João
O nome armazenado na posição [1][0] é: Paulo
O nome armazenado na posição [1][1] é: Miguel
O nome armazenado na posição [1][2] é: Paula

Sua Matriz tem 2 linhas e 3 colunas.
```

<br>

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/vetor_matriz/src/vetor_Matriz/Exemplo15.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

<h2>3. O Laço de Repetição For...Each</h2>



A expressão de língua inglesa “for each” pode ser traduzida como “para cada”. Em Java, o Laço de repetição **For..Each**, explicando de maneira bem resumida, é usado para iteração de listas e coleções. Sua principal característica é a **simplificação do Laço de repetição For**, deixando o código mais simples e fácil de ser lido pelas pessoas desenvolvedoras.

O Laço de repetição **For...Each** é utilizado para **percorrer (iterar) todo o Array **, evitando problemas relacionados à manipulação das posições ocupadas pelos elementos de um Array, como iniciar o contador do Laço de repetição pelo número 1 e não pelo 0, por exemplo.

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ALERTA DE BSM:** *Orientação ao Futuro. Caso os termos Coleções, ou Collections, não seja familiar para você não se preocupe. Em breve teremos um conteúdo específico sobre essa temática.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

**Sintaxe:**

```bash
for(tipo identificador : array){
    // comando a serem executados
}
```

<br />

<h3>3.1. Tipo</h3>

Esse parâmetro se refere ao tipo do Array que será percorrido (iterado) pelo Laço de repetição **For...Each**. **Exemplo:** *Se o array é do tipo String, a variável também será String*.

<br />

<h3>3.2. Identificador</h3>

Será o nome da variável que irá representar o item atual da iteração, dentro do Array ou da Collection, excluindo a necessidade de usar o índice. Seria o equivalente a: `nome_do_array[indice]`.

<br />

<h3>3.3. Array</h3>

É a própria estrutura de dados que terá seus itens percorridos

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>Exemplo 16 - Percorrendo um Vetor com o For...Each



Neste exemplo vamos criar um programa que deve exibir em tela os nomes dos alunes que estão dentro de um vetor.

Primeiro, vamos criar uma primeira versão do código, sem utilizar o Laço For...Each. Na sequência, vamos criar a segunda versão do código, utilizando o Laço For...Each, para compararmos as 2 soluções:

**Código em Java - Versão sem o For...Each:**

```java
public class Exemplo16 {

    public static void main(String[] args) {
        String alunes[] = { "Felipe", "Jonas", "Julia", "Marcos" };

        for(int i = 0; i < alunes.length; i++) {
            System.out.println(alunes[i]);
        }
    }
}
```

<br>

**Código em Java - Versão com o For...Each:**

```java
public class Exemplo16_1 {

    public static void main(String[] args) {
        String alunes[] = { "Felipe", "Jonas", "Julia", "Marcos" };

        for (String alune : alunes) {
            System.out.println(alune);
        }
    }
}
```

<br>

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Felipe
Jonas
Julia
Marcos
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/vetor_matriz/src/vetor_Matriz/Exemplo16_1.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

Observe que nesta segunda versão do código, com o For...Each, **foi necessário criar apenas uma variável (alune)** para receber os nomes, deixando o nosso código muito mais simples.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** Não há alteração quanto à performance do programa em que um laço For...Each é aplicado na maioria das vezes. Isso se deve ao fato de que seu funcionamento ocorre da mesma maneira que laço FOR durante o processamento do código..</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br>

Na sequência, vamos criar um exemplo com Matrizes:

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>Exemplo 17 - Percorrendo uma Matriz com o For Each

```java
package vetor_Matriz;

public class Exemplo17 {

	public static void main(String[] args) {
		
		String alunes[][] = { {"Felipe", "Jonas", "Julia"}, {"Mariana", "Carlos", "Juliana"}, {"Augusto", "Sabrina", "Julius"} };

		for (String[] linha : alunes) {
			for (String alune : linha) {
				System.out.println(alune);
			}
		}
		
	}
}
```

<br>

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Felipe
Jonas
Julia
Mariana
Carlos
Juliana
Augusto
Sabrina
Julius
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/vetor_matriz/src/vetor_Matriz/Exemplo17.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

Observe que por se tratar de uma Matriz, utilizamos **dois Laços de Repetição For...Each**:

1. O primeiro laço fará a iteração das linhas, que para o Laço For...Each, cada linha representa um Vetor. Por isso que a variável do laço foi definida como um Vetor;
2. O segundo fará a iteração das colunas, que para o Laço For...Each, cada coluna é uma posição do Vetor selecionado no primeiro Laço For...Each. Por isso que a iteração do segundo laço acontece no Vetor linha (selecionado no primeiro laço), ao invés da Matriz alunes.

<div align="center"><img src="https://i.imgur.com/72cfQ8t.png" title="source: imgur.com" /></div>

<br />

<h3>3.4. Diferenças entre os Laços de Repetição For e For...Each</h3>

| For                                                          | For...Each                                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| A declaração de incremento / decremento é obrigatória.       | O contador sempre é incrementado em 1 e não é permitido decrementar. |
| É apropriado quando os dados do Array precisam ser modificados. | Não é apropriado quando os dados do Array precisam ser modificados. |
| Ele mantém o controle do índice, desta forma é possível obter um índice do array. | Ele não mantém o controle do índice, desta forma não é possível obter um índice do array. |

<br />

------

## 🔑**Pontos chave:**

1. Um **array** é uma estrutura de dados que armazena uma coleção de elementos de tal forma que cada um dos elementos possa ser identificado por, pelo menos, um índice ou uma chave.
2. **Array Unidimensional (Vetor)** é um Array composto por uma única dimensão, ou seja, uma única linha composta por N colunas do mesmo do tipo, onde N é o número máximo de elementos, que o vetor armazenará. 
3. **Array Bidimensional (Matriz)** é um Array composto por duas dimensões, ou seja, o par linha (I) e coluna (J), onde I é o número máximo de linhas e J é o número máximo de colunas que a Matriz possui.
4. **Array Multidimensionais** é um Array que possui 3 ou mais dimensões, embora matematicamente só é possível representar até 3 dimensões. Um Array tridimensional, por exemplo, pode ser visto como uma matriz composta por  N Matrizes. 
5. o Laço de repetição **For..Each**, explicando de maneira bem resumida, é uma Laço de repetição utilizado para a  iteração de listas e coleções. Sua principal característica é a **simplificação do Laço de repetição For**, deixando o código mais simples e fácil de ser lido pelas pessoas desenvolvedoras.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
