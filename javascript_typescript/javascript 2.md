<h1>Entrada e Saída de dados</h1>



Todo o programa de computador é composto por 3 elementos básicos:

**Entrada:** Responsável por obter informações do usuário por meio do teclado, ou seja, é um Comando de Entrada de Dados. **Exemplo:** Digite 2 números: _.

**Processamento:** São as instruções do algoritmo responsáveis por processar as informações. **Exemplo:** Calcule a média dos 2 números digitados pelo usuário. 

**Saída:** Responsável por  mostrar os resultados do processamento na Tela do Computador, ou seja, é um Comando de Saída de Dados. **Exemplo:** Exibir na tela (console) o resultado do cálculo da média.

<div align="center"><img src="https://i.imgur.com/YNUpmlg.png" title="source: imgur.com" width="60%"/></div>

Neste material veremos as 2 pontas do processo, ou seja a **Entrada** e a **Saída**. O **Processamento** nós veremos no decorrer do curso, pois existem diversas opções.

No JavaScript Console, existe um Método (função), que é responsável pela Saída de dados:

-  **console.log()**


Quanto a Entrada de dados via teclado, não existe um Método nativo, porque originalmente a Linguagem JavaScript foi criada par ser utilizada dentro de páginas HTML, logo, utilizava os próprios elementos da Linguagem HTML para receber dados via teclado. Entretanto, o Node JS nos oferece alguns pacotes, que nos permitem fazer a leitura de dados via teclado. Nós utilizaremos 1 deles:

- **readline-sync**

<br />

<h2>1. Saída de dados</h2>



O Método **console.log()** é utilizado para mostrar dados (informações) no console (na tela do computador), ou seja, é um  Método de Saída de Dados em tela. 

O Método de saída **console.log()** utiliza o dispositivo padrão de saída , ou seja, o **Console do Terminal**.

<br />

<h3>1.1. Métodos de Saída</h3>



Os Métodos de saída de dados são responsáveis pela exibição dos dados de uma variável, constante ou objeto na tela do computador.

**Sintaxe:**

```c#
console.log("texto" + variavel);

console.log("texto");
```

Observe que é possível além de exibir um texto na tela, também é possível exibir o valor de uma variável ao lado do texto, unindo o texto e a variável através de um sinal de soma **+**. O texto deve sempre estar entre aspas. 

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/en-US/docs/Web/API/console/log" target="_blank"><b>Documentação: console.log()</b></a></div>

<br />

## <img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 01 - Hello World!**

```javascript
console.log("Olá Mundo!");
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

```bash
Olá Mundo!
```

<br />

## <img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 02 - Exibir os dados das Variáveis na tela **

```js
let bit = 127;
let valor = 254;
let quantidade = 1000;
let identificador = 10000;
let altura = 25.4;
let area = 45.4567;
let tipo = "A";
let resposta = true;
let palavra = "Generation";

console.log(bit);
console.log(valor);
console.log(quantidade);
console.log(identificador);
console.log(altura);
console.log(area);
console.log(tipo);
console.log(resposta);
console.log(palavra);

```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

```bash
127
254
1000
10000
25.4
45.4567
58.45
A
True
Generation
```

<br />

<h3>1.2 Saída de dados formatada</h3>



O Método **console.log()** oferece especificadores de formatação padrão para strings e números, permitindo a personalização do formato de saída de dados no Console.

<br />

<h4>1.2.1 Formatação Composta</h4>



A **Expressão de Controle** é uma sequência de caracteres,  que determina como os dados serão mostradas na tela. 

**Sintaxe:**

```js
console.log("%formato_1 %formato_2 %formato_N texto", variável_1, variável_2, ..., variavel_N);
```

Onde:

- **formato** indica o tipo de formatação.

Na tabela abaixo, temos os principais códigos de formatação:

**Números:**

| Código           | Formato (tipo de dados) |
| ---------------- | ----------------------- |
| **%s**           | string                  |
| **%i** ou **%d** | Números inteiros        |
| **%f**           | Números reais           |

<br />

## <img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 03 - Exibir na tela Números Reais formatados**

```js
let identificador = 10000;
let area = 45.4567;
let palavra = "Generation";

console.log("Formatação - Número Inteiro: %d", identificador);
console.log("Formatação - Número Real: %f",area);
console.log("Formatação - String: %s",palavra);

```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

```bash
Formatação - Número Inteiro: 10000
Formatação - Número Real: 45.4567
Formatação - String: Generation
```

<br />

<h4>1.2.2 Caracteres de Scape</h4>



**Caracteres de Escape** são instruções inseridas geralmente no começo ou no final de um texto, para sinalizar uma interpretação alternativa de uma série de caracteres. No JavaScript, **um caractere precedido por uma barra invertida \ indica uma sequência de escape**. Veja a tabela abaixo:

| Caractere de escape | Descrição                                                    |
| ------------------- | ------------------------------------------------------------ |
| \n                  | Nova linha                                                   |
| \t                  | Tabulação horizontal (o mesmo que pressionar a tecla Tab)    |
| \r                  | "Retorno do carro". É um escape de controle, que move o cursor do Terminal para o inicio da linha. |
| \b                  | Backspace. Faz o papel da tecla Backspace do seu teclado: move o cursor uma posição ou excluí um único caractere a esquerda da linha. |
| \\'                 | Aspas simples                                                |
| \”                  | Aspas dupla                                                  |
| \\\                 | Barra invertida                                              |

<br />

## <img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 04 - Exibir na tela Texto com Tabulação**

```js
let identificador = 10000;
let area = 45.4567;
let palavra = "Generation";

console.log("Formatação - Número Inteiro:\t %d", identificador);
console.log("Formatação - Número Real:\t %f",area);
console.log("Formatação - String:\t\t %s",palavra);

```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

```bash
Formatação - Número Inteiro:     10000
Formatação - Número Real:        45.4567
Formatação - String:             Generation
```

Observe na imagem acima, que **todas as variáveis foram alinhadas à direita**, graças a **Sequência de Escape \t**. 

<br />

<h4>1.2.3 Casas Decimais</h4>



Para formatarmos o número de casas decimais dos números reais, utilizaremos o método **toFixed()**:

**Sintaxe:**

```js
variavelNumeroReal.toFixed(numero de casas decimais);
```

<br />

## <img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 05 - Formatando o número de Casas Decimais**

```js
let identificador = 10.0000;
let area = 45.456739;

console.log("Formatação - Número Real:\t %d", identificador.toFixed(1));
console.log("Formatação - Número Real:\t %f",area.toFixed(2));

```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

```bash
Formatação - Número Real:        10
Formatação - Número Real:        45.46 
```

Observe na imagem acima, que **todas as variáveis reais estão com o número de casas decimais definido**, através do **Método toFixed()**. 

<br />

<h3>1.3. Outros Métodos de Saída de dados</h3>



Além do Método **console.log()**, existem alguns outros Métodos que são utilizados em situações específicas:

| Método                    | Descrição                                                    | Exemplo                                                      |
| ------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **console.table(objeto)** | Exibe os dados do objeto no formato tabular, ou seja, como uma tabela. Este Método é muito útil para trabalhar com arrays. | `console.table(array01);`<br />┌────────┐<br/>│ (index) │ 0   │<br/>├────────┤<br/>│    0    │ 10    │<br/>│    1    │ 70    │<br/>│    2    │ 50    │<br/>└────────┘ |
| **console.dir(objeto)**   | Exibe uma lista interativa das propriedades do objeto JavaScript especificado. Este Método é muito útil para trabalhar com arrays e objetos. | `console.dir(array01);`<br />[1, 2, 3, 4, 5]                 |

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/API/console/dir" target="_blank"><b>Documentação - Método console.dir</b></a></div>

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/API/console/table" target="_blank"><b>Documentação - Método console.table</b></a></div>

<br />

<h2>2. Entrada de dados </h2>



O **Pacote Readline-Sync** é utilizado quando se deseja obter informações do usuário por meio do teclado, ou seja, é um pacote que oferece alguns Métodos de Entrada de Dados. Antes de utilizarmos o Pacote **Readline-Sync**, precisamos instalar o pacote através do NPM.

1. Abra o **Terminal** do **VSCode** através do menu **Terminal 🡪 New Terminal**

<div align="center"><img src="https://i.imgur.com/4rdobXK.png?1" title="source: imgur.com" /></div>

2. Será aberta a tela do **Terminal** na parte inferior da janela do VSCode.

<div><img src="https://i.imgur.com/dclBNT6.png" title="source: imgur.com" /></div>

3. Vamos instalar o **Pacote Readline-Sync** através do comando abaixo:

```bash
npm install readline-sync
```

4. Verifique se o **Pacote Readline-Sync** foi instalado corretamente através do comando abaixo:

```bash
npm list
```

5. Será exibida a lista de pacotes instalados. Verifique se o **Pacote Readline-Sync** está instalado no seu projeto:

<div><img src="https://i.imgur.com/CN2Dx97.png" title="source: imgur.com" /></div>

<br />

Para utilizarmos o **Pacote Readline-Sync** em nossas Classes JavaScript, precisamos instanciar um Objeto deste Pacote em nosso código, como mostra o trecho de código abaixo:

**Sintaxe:**

```java
const leia = require('readline-sync');
```

O Objeto **leia**, do **Pacote Readline-Sync**, foi criado e instanciado para efetuar a leitura via teclado, usando o dispositivo padrão de entrada. 

> Instanciar um Objeto **é um processo por meio do qual se realiza a cópia de um Objeto (definido por uma Classe) existente**. Uma classe, tem a função de definir um tipo de dado, que deve ser instanciado para que possamos utilizá-la. 
>
> Veremos estes conceitos com mais detalhes no tópico **Orientação a Objetos**.

Ao instanciar um **Objeto do Pacote Readline-Sync**, o pacote será importado para a sua aplicação através da palavra reservada **require**.

> A palavra reservada **require** da linguagem JavaScript é uma função de módulo CommonJS, que permite incluir módulos, pacotes e bibliotecas em seu projeto. Isso ocorre porque, por padrão, o Node.js trata o código JavaScript como módulos CommonJS.
>
> Os módulos **CommonJS** são a maneira original de empacotar código JavaScript para Node.js.

<br />

<h3>2.1. Lendo instruções</h3>



Usa-se um Objeto do Pacote Readline-Sync (em nosso exemplo chamamos de **leia**), que foi instanciado no inicio do programa, quando é necessário que o usuário digite algum dado, que será armazenado em uma variável. 

O Pacote Readline-Sync possui uma série de Métodos de leitura de dados via teclado, que será utilizado de acordo com o tipo de variável e o tipo de leitura de dados. Veja a tabela abaixo:

<h3>2.1.1. Métodos de Entrada - Pacote Readline-Sync</h3>



| Método                                   | Descrição                                                    | Tipo de dado        |
| ---------------------------------------- | ------------------------------------------------------------ | ------------------- |
| **leia.question('Pergunta')**            | Faz a leitura, via teclado, de uma cadeia de caracteres simples ou composta, ou seja, string. <br />A pergunta será a mensagem que será exibida para o usuário, informando qual a informação ele deve digitar. | string              |
| **leia.keyIn('Pergunta')**               | Faz a leitura, via teclado, de um único caractere simples, exceto o caractere espaço em branco.<br />A pergunta será a mensagem que será exibida para o usuário, informando qual a informação ele deve digitar. | equivalente ao char |
| **leia.questionInt('Pergunta')**         | Faz a leitura, via teclado, de um número inteiro.<br />A pergunta será a mensagem que será exibida para o usuário, informando qual a informação ele deve digitar. | int                 |
| **leia.questionFloat('Pergunta')**       | Faz a leitura, via teclado, de um número em notação de ponto flutuante (usado para receber valores reais).<br />A pergunta será a mensagem que será exibida para o usuário, informando qual a informação ele deve digitar. | float               |
| **leia.keyInYNStrict('Pergunta')**       | Faz a leitura, via teclado, de um valor boolean, representado pelos valores y e n, onde true é equivalente a y e false é equivalente a n.<br />A pergunta será a mensagem que será exibida para o usuário, informando qual a informação ele deve digitar. | boolean             |
| **leia.keyInSelect(Array, 'Pergunta')**  | Exibe uma lista de itens indexadas, onde via teclado, o usuário digitará o número associado a cada elemento da lista.<br />O Array é a lista de elementos, qe será representada por um vetor.<br />A pergunta será a mensagem que será exibida para o usuário, informando qual a informação ele deve digitar. | int                 |
| **leia.questionEMail('Pergunta')**       | Faz a leitura, via teclado, de uma cadeia de caracteres que represente um endereço de e-mail. <br />A pergunta será a mensagem que será exibida para o usuário, informando qual a informação ele deve digitar. | string              |
| **leia.questionNewPassword('Pergunta')** | Faz a leitura, via teclado, de uma cadeia de caracteres substituindo os caracteres digitados por *, ou seja, ocultar a senha. <br />A pergunta será a mensagem que será exibida para o usuário, informando qual a informação ele deve digitar. | string              |

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Orientação ao Futuro ao utilizar a Biblioteca Readline-Sync. No decorrer do Bootcamp estudaremos o tema Array em detalhes.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

O **Pacote Readline-Sync** fornece uma maneira fácil de lidar com entradas inválidas nos Métodos **questionInt()** e **questionFloat()**. Você pode usar a opção **limitMessage** para personalizar a mensagem de erro quando o usuário insere um valor inválido.

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://www.npmjs.com/package/readline-sync" target="_blank"><b>NPM - Biblioteca Readline-Sync</b></a></div>

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://github.com/anseki/readline-sync" target="_blank"><b>Documentação: Biblioteca Readline-Sync</b></a></div>

<br />

## <img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 06 - Entrada de dados**

```js
const leia = require('readline-sync');

let quantidade;
let altura;
let tipo;
let resposta;
let palavra;

quantidade = leia.questionInt("\nDigite um valor do tipo Inteiro: ", {limitMessage: 'Digite um numero inteiro'});
console.log("O valor inteiro digitado foi: " + quantidade);

altura = leia.questionFloat("\nDigite um valor do tipo Float: ", {limitMessage: 'Digite um numero float'});
console.log("O valor float digitado foi: " + altura);

tipo = leia.keyIn("\nDigite um valor do tipo Char: ");
console.log("\nO valor char digitado foi: " + tipo);

resposta = leia.keyInYNStrict("\nDigite um valor do tipo Boolean: ");
console.log("O valor boolean digitado foi: " + resposta);

palavra = leia.question("\nDigite um valor do tipo string: ");
console.log("O valor string digitado foi: " + palavra);

```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

```bash
Digite um valor do tipo Inteiro: 100
O valor inteiro digitado foi: 100

Digite um valor do tipo Float: 10.5
O valor float digitado foi: 10.5

Digite um valor do tipo Char: a 

O valor char digitado foi: a

Digite um valor do tipo Boolean [y/n]: n
O valor boolean digitado foi: false

Digite um valor do tipo string: Generation
O valor string digitado foi: Generation
```

Observe no código acima que:

-  As variáveis **do tipo numéricas**, aceitam **somente valores numéricos**. Caso você digite letras ou caracteres especiais, será exibida a seguinte mensagem de erro no console: 

```bash
Input valid number, please.
```

*A mensagem acima indica que um tipo de dado diferente do esperado foi digitado e na sequência será solicitado que você digite um número novamente.* 

Caso você tenha configurado a propriedade **limitMessage**, será exibida a mensagem que você configurou nesta propriedade.

- Na entrada de dados das variáveis do tipo **ponto flutuante** (números reais), ao digitar os valores, observe que os números decimais foram separados por **ponto e não por vírgula**. A explicação é simples:  O JavaScript utiliza o padrão Americano, onde o separador de decimais é o ponto. Caso as casas decimais sejam zero, não é necessário digitar .00, basta digitar o número como se fosse um número inteiro. Caso você se esqueça e digite vírgula, ao invés do ponto, Pacote Readline-Sync irá ignorar a parte decimal e receberá apenas a parte inteira.

```bash
Digite um valor do tipo Float: 10,2
O valor float digitado foi: 10
```

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Atenção aos Detalhes ao inicializar variáveis numéricas Reais. Ao inicializar uma variável numérica do tipo ponto flutuante ou inserir um valor via teclado, utilize o ponto (padrão Americano) como separador de casas decimais.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

- O JavaScript não possui um tipo de dado char, que aceita **somente um único caractere**. Entretanto, podemos utilizar uma variável para armazenar um único caractere, como se fosse um char, através do Método **keyIn()**, que permite a digitação de um único caractere, sem o uso da tecla enter para confirmar. Caso você digite mais de um caractere, ele será ignorado e o programa seguirá o seu fluxo.
- Uma variável **boolean**, aceita **somente os valores true ou false**. O Método **keyInYNStrict()** restringe as opções de digitação em **y 🡒 true** e **n 🡒 false**. Caso você digite outras letras ou caracteres, o Método não irá aceitar e aguardará até que você digite uma das duas opções.

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** Mais adiante, veremos como tratar mensagens de erros, através da captura de Exceptions.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

- Ao ler os dados de uma variável string, observe que o **Pacote Readline-Sync** não reconhece palavras acentuadas no Terminal do Windows, devido ao tipo de codificação de caracteres utilizado. O Linux utiliza o padrão **UTF-8**, enquanto o Windows utiliza o padrão **Latim-1**. Utilizem caracteres não acentuados. Veja no exemplo abaixo, como os Caracteres acentuados são interpretados:

```bash
Digite um valor do tipo string: João 
O valor string digitado foi: Jo�o
```

<br />

<h2>4. Comentários no código</h2>



A inserção de comentários no decorrer do algoritmo facilita a leitura deste por você e por outras pessoas desenvolvedoras. Os comentários são uma excelente alternativa para auxiliar nos estudos, porque ajudam a relembrar o como você implementou o seu código. Veja abaixo algumas formas e inserir comentários no seu código:

**Sintaxe:** 

```java
// Meu Comentário

/* Bloco de Comentários */

/** 
* Bloco de Comentários
*/
```

<br />

## <img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 07 - Hello World com comentários**

```js
/**
 * Área reservada para importar os
 * Pacotes.
 *
 * */

// Exibe a Mensagem na tela
console.log("Olá Mundo!");

```

Observe que a execução do programa não muda em nada, porque o JavaScript ignora tudo que estiver comentado.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="5%"/> <a href="https://github.com/rafaelq80/exemplos_js/tree/main/javascript/03_entrada_saida" target="_blank"><b>Código Fonte dos Exemplos</b></a></div>

<br />

------

## 🔑**Pontos chave:**

1. **Entrada:** Responsável por obter informações do usuário por meio do teclado, ou seja, é um Comando de Entrada de Dados.
2. **Processamento:** São as instruções do algoritmo responsáveis por processar as informações.
3. **Saída:** Responsável por  mostrar os resultados do processamento na Tela do Computador, ou seja, é um Comando de Saída de Dados. 
4. O Método **console.log()** é utilizado para mostrar informações no console (na tela do computador), ou seja, é Método de Saída de Dados em tela. 
5. O **Pacote Readline-Sync** é utilizado quando se deseja obter informações do usuário por meio do teclado, ou seja, é uma Classe que oferece alguns Métodos de Entrada de Dados.
6. Para cada tipo de dado ou situação existe um Método adequado para efetuar a leitura dos dados via teclado. 

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="2%"/>Voltar</a></div>
