<h1>Variáveis e Constantes</h1>



Relembrando...

**VARIÁVEL**: Uma variável é um tipo de armazenamento de dados em memória, que possui o conteúdo variável durante a execução de um algoritmo ou programa. Uma variável pode assumir vários valores diferentes ao longo da execução do programa, mas, em um determinado momento, possui apenas um valor. 

**CONSTANTE**: Uma constante é um tipo de armazenamento de dados em memória, que possui um valor fixo e imutável, durante a execução de um algoritmo ou programa.

Toda a Variável deve possuir um tipo de dado. No caso da Linguagem Java, por se tratar de uma Linguagem de Programação, existem diversos tipos de dados, onde cada um tem uma indicação de uso de acordo com as suas características.

Toda a variável possui um **Identificador**, que representa o nome escolhido para rotular a variável.

A seguir, veremos como o Java trabalha com as variáveis:

<h2>1. Tipos de dados em Java</h2>

A linguagem Java fornece vários tipos de dados, conforme mostrado na figura abaixo. Os tipos de dados estão divididos em duas categorias:

1. **Tipos de dados primitivos** (também chamados de tipos intrínsecos ou integrados), que correspondem a dados mais simples, como números inteiros e reais, caracteres simples e lógicos
2. **Tipos de dados não primitivos** (também chamados de tipos de dados derivados ou de referência), que consistem em arrays (vetores), classes, objetos, interfaces e Strings, armazenam valores de tipos variados ou um grupo de valores definidos em uma Classe.

<div align="center"><img src="https://i.imgur.com/2pECTvw.png" title="source: imgur.com" /></div>

Neste primeiro momento, vamos focar nos **tipos primitivos**. O único tipo não primitivo, que veremos  agora será o tipo  **String**, que é **semelhante ao tipo cadeia do Portugol**. No decorrer do Bootcamp, nós veremos os demais tipos não primitivos e aprofundaremos um pouco mais o tipo String. 

<h3>1.1 Tipos de dados inteiros em Java</h3>


Os tipos de dados inteiros em Java representam valores numéricos inteiros ou números sem partes fracionárias ou pontos decimais, (ponto flutuante). Por exemplo, 225, -56524, 0, 1045, entre outros. estão nesta categoria.

Os tipos de dados inteiros são subdivididos em quatro tipos: **byte, short, int e long**, conforme mostrado na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/NTgUzVg.png" title="source: imgur.com" width="50%"/></div>

Na tabela abaixo, temos um resumo dos tipos de dados numéricos inteiros:

| Tipo      | Descrição                                                    |
| --------- | ------------------------------------------------------------ |
| **byte**  | Tipo de dado inteiro composto por 8 bits. O valor minimo é -128 e o máximo é 127. |
| **short** | Tipo de dado inteiro composto por 16 bits. O valor minimo é -32.768 e o máximo é 32.767. |
| **int**   | Tipo de dado inteiro composto por 32 bits. O valor minimo é -2.147.483.648 e o máximo é 2.147.483.648. |
| **long**  | Tipo de dado inteiro composto por 64 bits. O valor minimo é -9.223.372.036.854.775.808 e o máximo é 9.223.372.036.854.775.808. |

<br />

<h3>1.2. Tipos de dados Reais em Java</h3>


Os tipos de dados Reais ou de ponto flutuante são úteis para armazenar números contendo casas decimais ou partes fracionárias. Por exemplo: 3,14, -2,567, 0,00034, entre outros. Eles são chamados de números de ponto flutuante.

Existem dois tipos de tipos de dados de ponto flutuante: **float e double**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/tUitB6l.png" title="source: imgur.com" width="50%"/></div>

Na tabela abaixo, temos um resumo dos tipos de dados de ponto flutuante em Java:

| Tipo       | Descrição                                                    |
| ---------- | ------------------------------------------------------------ |
| **float**  | Tipo de dado ponto flutuante (numeros com casas decimais) de 32 bits de precisão simples. O tipo float é usado em operações que precisam economizar memória em grandes matrizes de números de ponto flutuante. |
| **double** | Tipo de dado ponto flutuante (numeros com casas decimais) de 64 bits. O tipo double é tipo de dado padrão para grandes valores com ponto flutuante. Esse tipo de dado não deve ser usado para valores precisos, como moeda. |

<br />

<h3>1.3. Tipos de dados não numéricos em Java</h3>

Os tipos de dados não numéricos são classificados em duas categorias: **char e boolean**. Veja na tabela abaixo:

| Tipo        | Descrição                                                    |
| ----------- | ------------------------------------------------------------ |
| **boolean** | Tipo de dado composto por apenas dois valores possíveis: `true`e `false`. Use esse tipo de dados para sinalizadores simples que rastreiam condições verdadeiras/falsas. Esse tipo de dados representa um bit de informação, mas seu "tamanho" não é algo definido com precisão. |
| **char**    | Tipo de dado composto por um único caractere Unicode de 16 bits. |

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html" target="_blank"><b>Documentação: Tipos de dados</b></a>
<br />
<br />

<h2>2. Identificadores</h2>

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

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** O identificador da variável deve expressar exatamente o seu conteúdo. Evite utilizar nomes genéricos como v1, variavel_01, entre outros.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |


<h3>2.1. Palavras Reservadas</h3>

Geralmente, as linguagens costumam ter palavras-chaves reservadas, que não podem ser usadas como nomes de variáveis, porque elas são parte da sintaxe da linguagem. O Java não é diferente e também possui a sua lista de palavras reservadas que não devem ser utilizadas para identificar variáveis. Na tabela abaixo, temos uma lista com as principais palavras reservadas:

|            |           |            |              |           |
| ---------- | --------- | ---------- | ------------ | --------- |
| abstract   | boolean   | break      | byte         | case      |
| catch      | char      | class      | continue     | default   |
| do         | double    | else       | extends      | false     |
| final      | finally   | float      | for          | if        |
| implements | import    | instanceof | int          | interface |
| long       | native    | new        | null         | package   |
| private    | protected | public     | return       | short     |
| static     | super     | switch     | synchronized | this      |
| throw      | throws    | transient  | true         | try       |
| var        | void      | volatile   | while        |           |

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/java/nutsandbolts/_keywords.html" target="_blank"><b>Documentação: Palavras Reservadas</b></a></div>

<br />


<h2>3. Declaração de Variáveis</h2>

Consiste na definição dos tipos, nomes (identificadores) e valores das variáveis que serão utilizadas pelo algoritmo, antes da sua utilização. Java utiliza **Tipagem Estática**, ou seja, a variável deve ser declarada com o tipo do dado que será armazenado. 

**Sintaxe:**

**Sem atribuição de valor**

```java
[tipo_da_variável] identificador_da_variável;
```

**Com atribuição de valor**

```java
[tipo_da_variável] identificador_da_variável = [valor];
```

Observe que depois de declarar a variável a linha deve ser finalizada com um ponto e virgula (;). Você pode declarar mais de uma variável na mesma linha, desde que todas sejam do mesmo tipo. O valor da variável é opcional. Existem 3 formas de declarar variáveis no Java:

<h3>3.1. Declaração de uma variável sem atribuição de valor</h3>

<img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/>**Exemplo 01 - Declaração de Variáveis sem atribuição de valor:** 

```java
byte bit;
short valor;
int quantidade;
long identificador;
float altura; 
double area;
char tipo;
boolean resposta;
```

Quando declaramos uma variável sem valor, o valor da variável deve ser atribuído posteriormente.

<h3>3.2. Declaração de uma variável com atribuição de valor</h3>

<img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/>**Exemplo 02 - Declaração de Variáveis com atribuição de valor:** 

```java
byte bit = 127;
short valor = 254;
int quantidade = 1000;
long identificador = 10000l;
float altura = 25.4f; 
double area = 45.4567;
char tipo = 'A';
boolean resposta = true;
```

**Observações importantes:**

- Ao atribuir um valor para uma variável do tipo long, **no final do valor deve ser acrescentada a letra l minúscula**, para indicar que se trata de um dado do tipo int;
- Ao atribuir um valor para uma variável do tipo float, as casas decimais devem ser informadas, mesmo que seja zero e **no final deve ser acrescentada a letra f minúscula**, para diferenciar de um dado do tipo double;
- Diferente da língua portuguesa que utiliza a virgula como separador de casas decimais, o Java utiliza o ponto (padrão americano);
- Ao atribuir um valor para uma variável do tipo char, o valor deve estar entre aspas simples (' ');

<h3>3.3. Declaração de múltiplas variáveis</h3>

<img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/>**Exemplo 03 - Declaração de Múltiplas Variáveis:** 

```java
byte bit1, bit2;
short valor1, valor2;
int quantidade, idade;
long identificador, codigo;
float altura, peso; 
double area, angulo;
char tipo, item;
boolean resposta1, resposta2;
```

Quando declaramos múltiplas variáveis sem valor, o valor destas variáveis devem ser atribuídos posteriormente.

<h2>4. Declaração de Constantes</h2>

No Java a declaração de uma constante é bem parecida com a declaração de uma variável. Basta colocar a palavra reservada **final** antes do tipo da variável:      

<img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/>**Exemplo 04 - Declaração de Constantes:** 

```java
final byte BIT = 127;
final short VALOR = 254;
final int QAUNTIDADE = 1000;
final long IDENTIFICADOR = 10000l;
final float ALTURA = 25.4f; 
final double AREA = 45.4567;
final char TIPO = 'A';
final boolean RESPOSTA = true;
```

Quando declaramos uma constante, o nome da constante deve ser escrito em letras maiúsculas e o valor da constante deve ser obrigatoriamente atribuído.

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://www.geeksforgeeks.org/final-variables-in-java/" target="_blank"><b>Documentação: Constantes em Java - Final</b></a>

<br />

<h2>5. Tipo String</h2>

O tipo **String**, com **S** maiúsculo, é um tipo de dado não primitivo e um objetos Java mais utilizados. o tipo String é semelhante ao tipo **cadeia** no Portugol. 

As Strings em Java não são tratadas como uma mera sequência de caracteres. Strings são Objetos ou Instâncias da classe **java.lang.String**, portanto, devem ser declarados e instanciados.

> **Objeto** é uma  entidade, caracterizada por um conjunto de operações e um estado, que possui **funções e campos**.
>
> **Classes** são como pequenos programas, que podem ser considerados novos  tipos de dados. Uma classe pode ser considerada como um "molde" de um  objeto, sendo uma descrição de como um objeto pode ser criado. Uma forma interessante de explicar é que uma classe está para um objeto assim  como a planta de uma casa está para a casa.

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="200px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Orientação ao Futuro! Não se preocupe com os conceitos de Classe e Objeto neste momento. No decorrer do Bootcamp nós teremos sessões dedicadas a Programação Orientada a Objetos e estes conceitos serão apresentados em detalhes.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Podemos declarar/instanciar uma **String** de 2 formas, como veremos a seguir:

<h3>5.1. Declaração de uma String sem atribuição de valor</h3>

<img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/>**Exemplo 05 - Declaração de Strings sem atribuição de valor:** 

```java
String palavra;
```

Quando declaramos uma String sem valor, o valor da String é NULL (nulo) e deve ser atribuído posteriormente.

<h3>5.2. Declaração de uma String com atribuição de valor</h3>

<img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/>**Exemplo 06 - Declaração de Strings com atribuição de valor:** 

```java
String palavra = "Generation Brasil";
```

Observe que:

- Ao atribuir um valor para uma String, o valor deve estar entre aspas duplas;
- Quando adicionamos um valor numérico em uma String, o Java interpretará o valor como texto e não como um numero.

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/7/docs/api/java/lang/String.html" target="_blank"><b>Documentação: Classe String</b></a>

<br /><br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** Existem outros Objetos em Java, que são utilizados para representar outros tipos de dados, como: data e hora, moedas, entre outros. No decorrer do Bootcamp, vamos conhecer outros tipos de dados.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

## 🔑**Pontos chave:**

1. Os **tipos de dados primitivos** na programação Java são usados para armazenar um único valor. 
2. Os **tipos de dados não primitivos**, armazenam valores de tipos variados ou um grupo de valores definidos em uma Classe.
3. Os tipos de dados básicos mais utilizados na Linguagem Java são: **int, float, char e boolean**.
4. Os tipos de dados são utilizados em Java na definição de uma variável ou constante, porque a **Linguagem Java é fortemente tipada**, ou seja, exige a definição do tipo de dado.
5. **String** é um tipo de dado **não primitivo**, semelhante ao tipo cadeia do Portugol, que instancia Objetos Java, contendo uma cadeia de caracteres.
6. Os **nomes de variáveis** devem ser **auto descritivos** e seguir as devidas convenções de nomenclatura Java (camel-case).
7. Os **nomes das variáveis** devem ser exclusivos. Desta forma, evita confusão e torna o código legível para nossos colegas de equipe.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
