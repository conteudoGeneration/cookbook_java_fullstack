<h1>Variáveis, Constantes e Funções</h1>



**VARIÁVEL**: Uma variável é um tipo de armazenamento de dados em memória, que possui o conteúdo variável durante a execução de um algoritmo ou programa. Uma variável pode assumir vários valores diferentes ao longo da execução do programa, mas, em um determinado momento, possui apenas um valor. 

**CONSTANTE**: Uma constante é um tipo de armazenamento de dados em memória, que possui um valor fixo e imutável, durante a execução de um algoritmo ou programa.

Toda a Variável possui um tipo de dado. No caso da Linguagem JavaScript, existem diversos tipos de dados, onde cada um tem uma indicação de uso de acordo com as suas características, entretanto este tipo não é definido de forma explícita, porque a Linguagem JavaScript não possui tipagem estática. A Linguagem JavaScript possui tipagem dinâmica, logo o tipo da variável é definido de acordo com o valor que é atribuído para uma variável e este valor (tipo) também pode ser alterado durante o processamento.

Toda a variável possui um **Identificador**, que representa o nome escolhido para rotular a variável.

A seguir, veremos como o JavaScript trabalha com as variáveis:

<br />

<h2>1. Tipos de dados em JavaScript</h2>



A linguagem JavaScript fornece vários tipos de dados, conforme mostrado na figura abaixo. Os tipos de dados estão divididos em duas categorias:

1. **Tipos de dados primitivos** (também chamados de tipos intrínsecos ou integrados), que correspondem a dados mais simples, como números inteiros e reais, caracteres simples, compostos e lógicos. Os valores especiais null e undefined do JavaScript são valores primitivos, mas não são números, nem strings e nem booleanos. 
2. **Tipos de Objeto** Qualquer valor em JavaScript que não seja número, string, booleano, null ou undefined é um objeto. Um objeto é um conjunto de propriedades, em que cada propriedade tem um nome e um valor (ou um valor primitivo, como um número ou string, ou um objeto). A linguagem também define um tipo especial de objeto, conhecido como array, que representa um conjunto ordenado de valores numerados.

<div align="center"><img src="https://i.imgur.com/7ThmNwn.png" title="source: imgur.com" /></div>

Neste primeiro momento, vamos focar nos **tipos primitivos**. No decorrer do Bootcamp, nós veremos os **tipos Objetos**. 

<br />

<h3>1.1 Number</h3>



Ao contrário da maioria das linguagens de programação, JavaScript não faz distinção entre valores inteiros e valores
com ponto flutuante (reais). Todos os números em JavaScript são representados como tipo **Number** e nativamente são numeros reais. O JavaScript representa números usando o formato de ponto flutuante de 64 bits. O formato number do JavaScript também permite representar exatamente todos os inteiros entre -9.223.372.036.854.775.808 e  9.223.372.036.854.775.808.

Quando um número aparece diretamente em um programa JavaScript, ele é chamado de **literal numérico**. JavaScript aceita literais numéricos em vários formatos e inclusive ele pode ser precedido por um sinal de subtração (-) para
indicar que o número é negativo.

Os literais com ponto flutuante podem ter um ponto decimal, que representa a parte fracionária do número. O JavaScript segue o padrão Americano, que ao invés de usar a vírgula como indicador da parte decimal (formato padrão do Brasil), ele utiliza o ponto. 

Os literais reais também podem ser representados usando-se notação exponencial (conhecida como notação científica): um número real seguido da letra e (ou E), seguido por um sinal de adição ou subtração opcional, seguido por um expoente inteiro. Essa notação representa o número real multiplicado por 10, elevado à potência do expoente.

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Number" target="_blank"><b>Documentação: Tipos de dados - Number</b></a></div>

<br />

<h3>1.2. String</h3>



Uma **String** é uma sequência ordenada imutável de valores de 16 bits, cada um dos quais normalmente representa um caractere Unicode, usadas para representar texto. 

> **Unicode** é um padrão de codificação de caracteres, que permite aos computadores representar e manipular, de forma consistente, texto de qualquer sistema de escrita existente.
>
> O **Unicode**  fornece um único conjunto de caracteres contendo os idiomas de todo o  mundo e um número pequeno de formatos e esquemas de codificação conhecidos pelos computadores, para adequar as necessidades dos aplicativos existentes.

O comprimento de uma string é o número de valores de 16 bits que ela contém. As strings em JavaScript utilizam indexação com base em zero: o primeiro valor de 16 bits está na posição 0, o segundo na posição 1 e assim por diante. 

<div align="center"><img src="https://i.imgur.com/8i8d7ZQ.png" title="source: imgur.com" /></div>

Observe na imagem acima, que cada letra de uma string possui um índice. Através deste índice, podemos por exemplo, extrair apenas uma parte da string.

A string vazia é a string de comprimento 0. JavaScript não tem um tipo especial que represente um único elemento de uma string, ou seja, o tipo char, presente em muitas linguagens. Para representar um único valor de 16 bits, basta usar uma string que tenha comprimento 1.

Para incluir uma string em um programa JavaScript, basta colocar os caracteres da string dentro de um par combinado de aspas simples ou duplas (' ou "). Os caracteres de aspas duplas podem estar contidos dentro de strings delimitadas por caracteres de aspas simples e estes podem estar contidos dentro de strings delimitadas por aspas duplas.

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Orientação ao Futuro ao criar a variáveis strings. No decorrer do Bootcamp, conheceremos alguns métodos para manipulação de strings.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/String" target="_blank"><b>Documentação: Tipos de dados - String</b></a></div>

<br />

<h3>1.3. Boolean</h3>



**Boolean** é um tipo de dado composto por apenas dois valores possíveis: `true` ou `false`. Esse tipo de dado geralmente são utilizados como sinalizadores simples que rastreiam condições verdadeiras ou falsas. O tipo Boolean  representa um bit de informação, mas seu "tamanho" não é algo definido com precisão.

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Boolean" target="_blank"><b>Documentação: Tipos de dados - Boolean</b></a></div>

<br />

<h3>1.4. Null e Undefined</h3>



**Null** é uma palavra-chave da linguagem avaliada com um valor especial, normalmente utilizado para indicar a ausência de um valor, ou seja, null indica que uma variável não possui “nenhum objeto ou valor”. A maioria das linguagens de programação tem um equivalente para o null de JavaScript: talvez você já o conheça como null ou nil.

**Undefined** é uma palavra-chave da linguagem avaliada com um valor especial, que indica a ausência de valor. O valor indefinido representa uma ausência mais profunda. É o valor de variáveis que não foram inicializadas e o valor obtido quando se consulta o valor de uma propriedade de objeto ou elemento de array que não existe. O valor indefinido também é retornado por funções que não têm valor de retorno e o valor de parâmetros de função quando nenhum argumento é fornecido. 

Na prática, Null e Undefined indicam uma ausência de valor, entretanto utilizamos Undefined para representar uma ausência de valor em nível de sistema, inesperada ou como um erro, por exemplo, enquanto o Null é utilizado para representar ausência de valor em nível de programa, normal ou esperada. Se precisar atribuir um desses valores a uma variável ou propriedade ou passar um desses valores para uma função, Null quase sempre será a escolha certa.

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Operators/null" target="_blank"><b>Documentação: Tipos de dados - Null</b></a></div>

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/undefined" target="_blank"><b>Documentação: Tipos de dados - Undefined</b></a></div>

<br />

<h3>1.5. NaN e Infinity</h3>



**NaN e Infinity** não são tipos de dados, mas são propriedades do Escopo Global, que podem ser tipos de retornos de operações matemáticas, conversões de tipos e processamento de funções no JavaScript.

**Infinity** é uma propriedade do *objeto global*, ou seja, é uma variável do escopo global. O valor inicial de Infinity, segundo os conceitos da matemática, é equivalente ao infinito (∞). Partindo deste principio, qualquer número positivo multiplicado por Infinity é igual ao Infinito (∞) e qualquer coisa dividida por Infinity é igual a 0. Um exemplo comum de retorno do Infinity é quando se tenta dividir um número por zero no JavaScript. Diferente de outras Linguagens que retornam o erro *"Divide By Zero"* ou algo semelhante, o JavaScript retorna **Infinity**.

**NaN** é uma propriedade do *objeto global*, ou seja, também é uma variável do escopo global. O valor inicial de NaN é Not-A-Number, ou seja, **não é um número**. Geralmente o NaN é retornado quando uma operação matemática falha ou quando uma função tenta transformar uma string em número, que não contém um número.

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Infinity" target="_blank"><b>Documentação: Infinity</b></a></div>

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/NaN" target="_blank"><b>Documentação: NaN</b></a></div>

<br />


<h2>2. Identificadores</h2>



Diferentemente das palavras do mundo real, na programação não se pode separar as palavras que fazem parte do identificador de uma variável com espaço. Ao invés disso, usa-se:

- Uma letra maiúscula no começo de cada palavra, exceto a primeira (**Camel-Case**). **Exemplo:** *nomeDaVariavel*

No JavaScript, geralmente se utiliza o padrão Camel-Case, entretanto, existem outras restrições aos identificadores de variáveis, tais como:

- Os nomes das variáveis podem conter as letras a-z, A-Z, os dígitos 0-9, bem como o caractere *underscore* ou sublinhado (_) e o caractere cifrão ($).
- Os nomes das variáveis não podem começar com um dígito.
- Os nomes das variáveis devem começar com uma letra, um cifrão ($) ou um sublinhado (_). Não pode começar com um dígito.
- Os nomes das variáveis diferenciam maiúsculas de minúsculas. Isso significa que `numero`e `Numero`são variáveis diferentes.
- Os nomes das variáveis não podem corresponder a uma palavra reservada da linguagem JavaScript, como por exemplo: `var`, `const`, `let`, entre outras. (Veja a lista no próximo item)
- Os nomes das variáveis podem ser de qualquer comprimento, entretanto recomenda-se que não seja muito grande.
- Os identificadores em JavaScript devem ser exclusivos e auto descritivos. **Exemplo:** **`mediaFinal`**.
- Existem algumas convenções de nomenclatura que são seguidas pelas Pessoas Desenvolvedoras, como:

- - Os nomes de todas as variáveis e métodos de instância pública começam com uma palavra com todas as letras minúsculas. **Exemplo:** `media`, `soma`, entre outras.
  - Se mais de uma palavra for usada em um nome (palavra composta), a segunda e as demais palavras subsequentes devem começar com uma letra maiúscula inicial. **Exemplo:** `temperaturaAnual`, `estoqueTotalMensal`, entre outros (Camel-Case).
  - Todas as palavras que compõem o identificador dos métodos, classes e interfaces devem começar com uma letra maiúscula inicial. Exemplo: `Hello`, `Produto`, `VisualizarDados`, entre outras.
  
- Os identificadores não devem conter dois caracteres sublinhado (`_`) consecutivos. Esses nomes estão reservados para identificadores gerados por compilador.


<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** O identificador da variável deve expressar exatamente o seu conteúdo. Evite utilizar nomes genéricos como v1, variavel_01, entre outros.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h3>2.1. Palavras Reservadas</h3>



Geralmente, as linguagens costumam ter palavras-chaves reservadas, que não podem ser usadas como nomes de variáveis, porque elas são parte da sintaxe da linguagem. O JavaScript não é diferente e também possui a sua lista de palavras reservadas que não devem ser utilizadas para identificar variáveis. Na tabela abaixo, temos uma lista com as principais palavras reservadas:

|          |            |              |           |
| -------- | ---------- | ------------ | --------- |
| abstract | arguments  | await        | boolean   |
| break    | byte       | case         | catch     |
| char     | class      | const        | continue  |
| debugger | default    | delete       | do        |
| double   | else       | enum         | eval      |
| export   | extends    | false        | final     |
| finally  | float      | for          | function  |
| goto     | if         | implements   | import    |
| in       | instanceof | int          | interface |
| let      | long       | native       | new       |
| null     | package    | private      | protected |
| public   | return     | short        | static    |
| super    | switch     | synchronized | this      |
| throw    | throws     | transient    | true      |
| try      | typeof     | var          | void      |
| volatile | while      | with         | yield     |
| Array          | Date     | eval      | function  |
| hasOwnProperty | Infinity | isFinite  | isNaN     |
| isPrototypeOf  | length   | Math      | NaN       |
| name           | Number   | Object    | prototype |
| String         | toString | Undefined | valueOf   |

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words" target="_blank"><b>Documentação: Palavras Reservadas</b></a></div>

<br />


<h2>3. Declaração de Variáveis</h2>



Antes de utilizar uma variável em um programa JavaScript, você deve declará-la. As variáveis são declaradas com a palavra-chave **var** ou com a palavra chave **let**, seguida do identificador da variável. 

**Sintaxe:**

**Sem atribuição de valor**

```javascript
var identificador_da_variável;
let identificador_da_variável;
```

Se não for especificado um valor inicial para uma variável com a instrução **var** ou **let**, a variável será declarada, mas seu valor será **undefined** até que o código armazene um valor nela.

**Com atribuição de valor**

```c#
var identificador_da_variável = [valor];
let identificador_da_variável = [valor];
```

No exemplo acima, vemos a sintaxe para criar uma variável com a inicialização de valor.

Se você está acostumado com linguagens tipadas estaticamente, como C# ou Java, terá notado que não existe um tipo algum associado às declarações de variável em JavaScript. Uma variável em JavaScript pode conter um valor de qualquer tipo. 

Depois de declarar a variável, opcionalmente a linha pode ser finalizada com um ponto e virgula (;). Você pode declarar mais de uma variável na mesma linha. 

<br />

**Qual é a diferença entre o var e o let?**



Antes de vermos a diferença entre o var e o let, precisamos entender o conceito de **Escopo**:

O **Escopo** de uma variável é a região do código-fonte do seu programa em que ela está definida. A maioria das Linguagens de Programação o Escopo é delimitado através de um par de chaves { }.

Quando declaramos uma variável dentro de um bloco de código (laço condicional, laço de repetição, função, entre outros), dizemos que o **Escopo da variável é Local**, ou seja, esta variável poderá ser acessada apenas dentro do bloco onde foi criada.

Quando declaramos uma variável fora de um bloco de código (laço condicional, laço de repetição, função, entre outros), dizemos que o **Escopo da variável é Global**, ou seja, esta variável poderá ser acessada em qualquer parte do código.

**Diferente da maioria das Linguagens de Programação, o JavaScript não utiliza as Chaves para definir o Escopo Global, utiliza as Chaves apenas para definir o Escopo Local.**  Veja o exemplo no trecho de código abaixo:

```javascript
// Escopo Global

if( condição ){
    // Escopo Local
}

// Escopo Global
```

Observe que tudo que está fora do Bloco if, delimitado pelas Chaves { }, é definido como **Escopo Global** e tudo que está dentro do Bloco if, delimitado pelas Chaves { }, é definido como **Escopo Local**. 

Quando declaramos uma variável com a palavra reservada **var**, ela será interpretada pelo JavaScript como uma **Variável de Escopo Global**, independente de onde a variável foi declarada, seja no início, no meio ou no final do código, dentro ou fora de um Bloco de Código, tornando a variável acessível em qualquer parte do código.

Quando declaramos uma variável com a palavra reservada **let**, ela será interpretada pelo JavaScript como uma **Variável de Escopo Local**, caso seja declarada dentro de um Bloco de Código, tornando a variável acessível apenas dentro do Bloco onde ela foi declarada. Caso a variável seja declarada fora de um Bloco de Código, ela será uma **Variável de Escopo Global**, tornando a variável acessível em qualquer parte do código.

Adotaremos como boa prática criarmos as variáveis todas as variáveis através da palavra reservada **let**, que garante um maior controle sobre as nossas variáveis.

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Orientação ao Futuro ao criar as variáveis. No decorrer do Bootcamp, quando entrarmos em estruturas que possuem escopo local, voltaremos a abordar de forma prática as diferenças entre o var e o let.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Guide/Grammar_and_types" target="_blank"><b>Documentação: Declaração de variáveis</b></a></div>

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Statements/var" target="_blank"><b>Documentação: Declaração de variáveis - var</b></a></div>

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Statements/let" target="_blank"><b>Documentação: Declaração de variáveis - let</b></a></div>

<br />

<h3>3.1. Declaração de uma variável sem atribuição de valor</h3>



<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 01 - Declaração de Variáveis sem atribuição de valor:** 

```javascript
let quantidade;
let altura;
let tipo;
let nome
let resposta;
```

Quando declaramos uma variável sem valor, o valor da variável será **undefined** até que um valor seja atribuído posteriormente.

<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 02 - Visualizar o conteúdo de Variáveis sem atribuição de valor:** 

```javascript
let quantidade;
console.log(quantidade);
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
undefined
```

<br />

<h3>3.2. Declaração de uma variável com atribuição de valor</h3>



<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 03 - Declaração de Variáveis com atribuição de valor:** 

```javascript
let quantidade = 10;
let altura = 1.87;
let tipo = 'A';
let nome = "Mariana Alves";
let resposta = true;
```

Quando declaramos uma variável com valor, o tipo da variável será definido de acordo com o valor atribuído. 

Como JavaScript possui tipagem dinâmica é perfeitamente válido atribuir um número a uma variável e posteriormente atribuir uma string a essa mesma variável:

<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 04 - Atribuição de valor de uma variável depois da criação:** 

```javascript
let tipo = 1;
console.log(tipo);
tipo = "um";
console.log(tipo);
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
1
um
```

Observe que mesmo a variável sendo inicializada como numero, ela aceita uma nova atribuição de valor, mesmo sendo de um formato diferente, no exemplo acima uma string. 

Essa característica do JavaScript requer muita atenção aos detalhes da pessoa desenvolvedora na hora de escrever código, especialmente porque o JavaScript não emitirá alertas no VScode ou em qualquer outra IDE de possíveis erros de tipos, ou seja, você encontrará o erro apenas quando executar o código no Interpretador JavaScript. Lembre-se que o JavaScript não é uma Linguagem tipada, logo uma variável aceita qualquer tipo de valor que você inserir. Veja o exemplo abaixo:

<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 05 - Soma de 2 Variáveis com Tipos diferentes:** 

```javascript
let numero1 = 1;
console.log(numero1);
let numero2 = "2";
console.log(numero2);
console.log(numero1 + numero2);
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
1
2
12
```

Observe que como a segunda variável é uma string, ao invés de somar, o JavaScript interpretou como uma concatenação de strings, ou seja, a união de 2 strings em uma única string.

**Como descobrir o tipo de uma variável?**

Para obter o tipo atual de uma variável no JavaScript, você pode utilizar o operador `typeof`. Veja o exemplo abaixo:

<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 06 - Atribuir um novo valor para uma Constante:** 

```javascript
let quantidade = 10;
console.log(typeof(quantidade));

let altura = 1.87;
console.log(typeof(altura));

let tipo = 'A';
console.log(typeof(tipo));

let nome = "Mariana Alves";
console.log(typeof(nome));

let resposta = true;
console.log(typeof(resposta));
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
number
number 
string 
string 
boolean
```

Observe que o Interpretador JavaScript retornará o tipo de cada variável.

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Operators/typeof" target="_blank"><b>Documentação: Operador typeof</b></a></div>

<br />

<h3>3.3. Declaração de múltiplas variáveis</h3>



<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 07 - Declaração de Múltiplas Variáveis:** 

```javascript
let numero1 = 10, numero2 = 3;
let altura, peso;
```

Quando declaramos múltiplas variáveis, podemos declarar as variáveis com ou sem valor. Geralmente, declaramos variáveis com tipos semelhantes em uma mesma linha, por uma questão de organização do código e boas práticas.

<br />

<h2>4. Declaração de Constantes</h2>



No JavaScript a declaração de uma constante é bem parecida com a declaração de uma variável. Basta colocar a palavra reservada **const** antes do identificador da variável:      

<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 08 - Declaração de Constantes:** 

```c#
const quantidade = 10;
const altura = 1.87;
const tipo = 'A';
const nome = "Mariana Alves";
const resposta = true;
```

Uma Constante, diferente de uma Variável, não se pode ser declarada sem atribuir um valor de inicialização e além disso, não pode ter o seu valor alterado por atribuição direta. Veja o exemplo abaixo:

<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 09 - Atribuir um novo valor para uma Constante:** 

```javascript
const pi = 3.1415;
console.log(pi);
pi = 3.1416;
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
3.1415
c:\Users\rafae\OneDrive\Área de Trabalho\js\variaveis\variavel_08.js:3
pi = 3.1416;
   ^

TypeError: Assignment to constant variable.
    at Object.<anonymous> (c:\Users\rafae\OneDrive\Área de Trabalho\js\variaveis\variavel_08.js:3:4)
    at Module._compile (node:internal/modules/cjs/loader:1256:14)
    at Module._extensions..js (node:internal/modules/cjs/loader:1310:10)
    at Module.load (node:internal/modules/cjs/loader:1119:32)
    at Module._load (node:internal/modules/cjs/loader:960:12)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:81:12)
    at node:internal/main/run_main_module:23:47

Node.js v18.17.1
```

Observe que o Interpretador JavaScript retornará o erro: **Assignment to constant variable**, indicando que não é possível atribuir um valor para uma constante.

Um ponto importante sobre a declaração const, que gera muita confusão entre as pessoas desenvolvedoras, é que ao declarar uma variável com a palavra reservada const será **criada uma referência somente leitura a um valor**. Isso **não significa que esse valor é imutável**, apenas que o identificador da variável constante não pode ser alterado. Se o conteúdo do identificador for um objeto, por exemplo, o conteúdo do objeto (os atributos), podem ser alterados através dos seus Métodos modificadores, mas não poderão ter os seus atributos alterados por atribuição direta.

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Orientação ao Futuro. Não se preocupe com o conceito de Objeto neste momento. Mais adiante este e outros conceitos serão aprofundados em Orientação a Objetos.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Statements/const" target="_blank"><b>Documentação: Constantes</b></a></div>

<br />

<h2>5. Concatenação e Interpolaçao</h2>

A concatenação em JavaScript é o processo de unir duas ou mais strings em uma única string. Isso pode ser feito de várias maneiras, sendo as mais comuns o uso do operador de adição (`+`) e o método `concat()`. A concatenação é amplamente utilizada para construir mensagens dinâmicas, combinar dados de diferentes fontes e formatar strings para exibição ou armazenamento.

### Operador de Adição (`+`)

A maneira mais simples e comum de concatenar strings em JavaScript é utilizando o operador de adição (`+`). Aqui está um exemplo:

```javascript
let saudacao = "Olá, ";
let nome = "Maria";
let mensagem = saudacao + nome;
console.log(mensagem); // Saída: "Olá, Maria"
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Olá, Maria
```

Neste exemplo, a string `"Olá, "` é concatenada com a string `"Maria"`, resultando na string `"Olá, Maria"`

### Método `concat()`

Outra forma de concatenar strings é usando o método `concat()`, que pertence ao objeto `String`:

```javascript
let saudacao = "Olá, ";
let nome = "Maria";
let mensagem = saudacao.concat(nome);
console.log(mensagem); // Saída: "Olá, Maria"

```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Olá, Maria
```

O método `concat()` funciona de maneira similar ao operador `+`, unindo as strings em uma única string. É possível concatenar mais de duas strings em uma única chamada ao `concat()`:

### Interpolação

Outra forma de concatenar strings com Variáveis (numéricas e não numéricas) e Operações Matemáticas é utilizando a Interpolação de strings, que é um tipo de Template String. Template String são strings que permitem expressões embutidas dentro de uma string, ou seja, variáveis. Basicamente é uma nova forma de criar strings e tornar o seu código mais legível.

```javascript
console.log(`Soma: ${num1 + num2}`);
console.log(`Subtração: ${num1 - num2}`);
console.log(`Multiplicação: ${num1 * num2}`);
// Verifica o segundo valor antes de executar a divisão
if (num2 === 0) {
 console.log("Não existe divisão por 0");
}
else {
 console.log(`Divisão: ${num1 / num2}`);
}

```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Soma: 15
Subtração: 5
Multiplicação: 50
Divisão: 2
```

Este código JavaScript realiza operações aritméticas básicas entre dois números, `num1` e `num2`, e exibe os resultados no console. As operações incluem soma (`num1 + num2`), subtração (`num1 - num2`), e multiplicação (`num1 * num2`). Para cada operação, o resultado é calculado e exibido usando a função `console.log` com uma template string, que permite a inserção de expressões dentro de strings utilizando a sintaxe `${}`. Isso facilita a formatação das mensagens de saída de forma clara e legível.

Antes de realizar a divisão, o código verifica se o divisor (`num2`) é zero para evitar um erro de divisão por zero, que não é uma operação válida em matemática e resultaria em um erro em muitas linguagens de programação, incluindo JavaScript. Se `num2` for zero, o código imprime a mensagem "Não existe divisão por 0". Caso contrário, ele calcula e exibe o resultado da divisão (`num1 / num2`). Este tipo de verificação é uma boa prática de programação para garantir que o código seja robusto e não falhe em condições inesperadas.

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Template_literals" target="_blank"><b>Documentação: concatenação e interpolação</b></a></div>

<h2>6. Funções em javascript</h2>

Funções em JavaScript são blocos de código reutilizáveis que realizam tarefas específicas. Elas permitem organizar o código de forma modular, facilitando a manutenção e a reutilização. Funções podem receber dados de entrada, chamados de parâmetros, e podem retornar um valor após a execução. Em JavaScript, funções são objetos de primeira classe, o que significa que podem ser atribuídas a variáveis, passadas como argumentos para outras funções, e retornadas de outras funções.

A definição de uma função pode ser feita usando a palavra-chave `function`, seguida pelo nome da função, uma lista de parâmetros entre parênteses, e um bloco de código entre chaves. Por exemplo:

```javascript
function soma(a, b) {
  return a + b;
}
```

Essa função `soma` recebe dois parâmetros `a` e `b`, e retorna a soma dos dois. Para chamar a função, basta usar o nome da função seguido de parênteses com os argumentos:

```javascript
let resultado = soma(5, 3); // resultado será 8
console.log(resultado); // imprime 8
```

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Guide/Functions" target="_blank"><b>Documentação: Funções</b></a></div>

<h2>7. Arrow functions em javascript</h2>

Arrow functions, introduzidas no ECMAScript 6 (ES6), são uma forma mais concisa de escrever funções em JavaScript. Elas utilizam a sintaxe `=>`, por isso são chamadas de "arrow functions". Uma das principais diferenças em relação às funções tradicionais é que as arrow functions não possuem seu próprio contexto de `this`, herdando o `this` do escopo circundante, o que pode ser vantajoso em certas situações, especialmente em métodos e callbacks.

Aqui está um exemplo básico de uma arrow function:

```javascript
const soma = (a, b) => {
  return a + b;
};

```

Esta função `soma` recebe dois parâmetros, `a` e `b`, e retorna a soma dos dois. Se o corpo da função contém apenas uma expressão, podemos omitir as chaves `{}` e a palavra-chave `return`:

```javascript
const soma = (a, b) => a + b;
```

```javascript
let somar = (num1, num2) => {
 return num1 + num2;
}
let subtrair = (num1, num2) => {
 return num1 - num2;
}
console.log(`Soma: ${somar(num1, num2)}`);
console.log(`Subtração: ${subtrair(num1, num2)}`);
```

### Diferenças Principais

1. **Contexto de `this`**:
   - **Arrow Functions**: Não têm seu próprio `this`. O valor de `this` dentro de uma arrow function é léxico, ou seja, é determinado pelo escopo onde a função foi definida, não onde foi chamada. Isso é útil ao trabalhar com métodos de objeto ou callbacks.
   - **Funções Normais**: Têm seu próprio `this`, que é determinado pela maneira como a função é chamada. Isso pode levar a comportamentos inesperados quando a função é usada como callback ou em outro contexto.

As arrow functions oferecem várias vantagens em JavaScript, especialmente em termos de sintaxe e comportamento. Aqui estão algumas das principais vantagens:

1. **Sintaxe Concisa**:
   - Arrow functions têm uma sintaxe mais curta e direta, o que torna o código mais legível e menos verboso, especialmente para funções simples ou funções anônimas usadas como callbacks.
2. **Sintaxe Curta para Funções de Uma Linha**:
   - Para funções que retornam uma única expressão, a sintaxe das arrow functions é extremamente curta, omitindo as chaves `{}` e a palavra-chave `return`.



<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Guide/Functions" target="_blank"><b>Documentação: Arrow functions</b></a></div>

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="5%"/> <a href="https://github.com/rafaelq80/exemplos_js/tree/main/javascript/02_variaveis" target="_blank"><b>Código Fonte dos Exemplos</b></a></div>

<br /><br />

------

## 🔑**Pontos chave:**

1. Os **tipos de dados primitivos** na programação JavaScript são usados para armazenar um único valor. 
2. Os **tipos de dados Objetos**, armazenam valores de tipos variados ou um grupo de valores definidos em uma Classe.
3. Os tipos de dados básicos mais utilizados na Linguagem JavaScript são: **number, string, boolean, null e undefined**.
4. Para declarar uma variável, acrescentamos antes do identificador da variável a palavra reservada **var** ou **let**.
5. A palavra reservada **var** cria uma variável de escopo Global, independente de onde ela for declarada.
6. A palavra reservada **let** cria uma variável de escopo Global se ela for declarada fora do escopo de um Bloco de código (laço condicional, laço de repetição, entre outros) e cria uma variável de escopo Local se ela for declarada dentro de um Bloco de código.
7. O tipo de dado de uma variável no JavaScript é definido no momento que um valor é atribuído para uma variável ou que uma constante é declarada, porque a **Linguagem JavaScript possui tipagem dinâmica**, ou seja, não exige a definição do tipo de dado como nas linguagens com tipagem estática (Java, C#, entre outras).
8. Os **nomes de variáveis** devem ser **auto descritivos** e seguir as devidas convenções de nomenclatura do JavaScript (camel-case).
9. Os **nomes das variáveis** devem ser exclusivos.
10. Para declarar uma constante, seguimos os mesmos padrões de declaração de variáveis e acrescentamos antes do identificador da constante a palavra reservada **const**.
11. **Concatenação**: Método de unir duas ou mais strings usando operadores como `+` ou funções específicas, formando uma nova string.
12. **Interpolação**: Técnica que permite incorporar variáveis e expressões dentro de uma string, utilizando sintaxes como `${}` em templates literais.
13. **Funções em JavaScript**: Blocos reutilizáveis de código definidos com `function` ou `=>`, que podem receber parâmetros e retornar valores.
14. **Arrow Function**: Sintaxe concisa introduzida no ES6 (`=>`) para definir funções, com herança automática do `this` do contexto léxico.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
