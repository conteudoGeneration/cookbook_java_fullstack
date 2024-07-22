<h1>Introdução ao TypeScript</h1>



O **TypeScript** é uma linguagem de programação criada pela Microsoft. Na prática ele é um _superset_ do ECMAScript que, por sua vez, é um *superset* do JavaScript Clássico. Isso significa que praticamente qualquer código escrito em JavaScript também é um código TypeScript. 

<div align="center"><img src="https://i.imgur.com/izFuHID.png" title="source: imgur.com" width="20%"/></div>

O TypeScript adiciona novos recursos de sintaxe ao JavaScript, além da total compatibilidade com o código JavaScript existente. O código fonte TypeScript é compilado em código JavaScript simples que pode ser executado em qualquer Navegador ou Runtime do JavaScript, como o Node, por exemplo.

<div align="center"><img src="https://i.imgur.com/iTATl2k.png" title="source: imgur.com" /></div>

Como vemos na imagem acima, o Código TypeScript abrange o JavaScript Clássico, o JavaScript Moderno (ECMAScript) e os novos recursos de sintaxe inseridos pelo próprio TypeScript. Após o processo de Transpilação, o TypeScript retornará o código convertido para o JavaScript. **O TypeScript na prática é um JavaScript com super poderes!**

O TypeScript oferece suporte a Tipagem Estática, ou seja, as variáveis, as funções e os objetos podem ser criados com um tipo de dado definido em tempo de compilação. A Tipagem Estática permite o desenvolvimento de códigos de qualidade e com um número reduzido de erros em tempo de execução. 

O TypeScript oferece suporta a Classes, um conceito fundamental da Programação Orientada a Objetos (POO), que são uma das principais formas de definir os Objetos, dentro da Programação Orientada a Objetos (POO), no TypeScritpt. As Classes fornecem uma maneira de Encapsular dados e comportamentos de um Objeto, além de criar Componentes Reutilizáveis.

O TypeScript também oferece suporte a Interfaces, um outro conceito fundamental da Programação Orientada a Objetos (POO), que formalizam contratos entre Classes e Objetos, definindo um conjunto de Métodos, que uma Classe deve implementar. As Interfaces isolam os detalhes de implementação de um componente de software, permitindo que diferentes classes forneçam comportamentos específicos para esses métodos.  As interfaces podem ajudar a tornar o código muito mais sustentável e fácil de entender.

<br />

<h2>1. Arquitetura do TypeScript</h2>



O código TypeScript, diferente de outras linguagens, não é compilado ou interpretado. O código TypeScript é **Transpilado**, ou seja, ele é convertido para **ECMAScript** (JavaScript Moderno). Por este motivo praticamente qualquer código JavaScript pode ser utilizado normalmente em qualquer projeto TypeScript, com alguns ajustes, em especial a tipagem de dados.

> **Transpiler** é um programa que **traduz um código escrito em uma Linguagem de Programação para o código de uma outra Linguagem de Programação**. 
>
> **ECMAScript**: Toda a Linguagem de Programação precisa de uma padronização para reger as regras e o nivelamento da linguagem ao nível global, e para o JavaScript o ECMAScript é a sua padronização, ou seja, a versão oficial da linguagem. O nome JavaScript, na verdade, é uma tradição do mercado de desenvolvimento, porque o nome oficial da linguagem é ECMAScript. O ECMAScript também é conhecido como o **JavaScript Moderno**.

A Linguagem TypeScript utiliza o **TypeScript Compiler (tsc)** para converter o código fonte TypeScript em código JavaScript. O TypeScript Compiler é uma ferramenta de linha de comando, que pode ser utilizada para transpilar o código TypeScript em JavaScript. O TypeScript Compiler também fornece a verificação de tipos, o que ajuda a capturar eventuais erros em tempo de transpilação.

O diagrama a seguir mostra o processo de Transpilação do TypeScript para o JavaScript:

<div align="center"><img src="https://i.imgur.com/GaKFv8w.png" title="source: imgur.com" /></div>

1. Primeiro a pessoa desenvolvedora escreve o código TypeScript utilizando as estruturas oferecidas pela linguagem, gerando um ou mais arquivos com a extensão **TS**.
2. Depois de receber o código TypeScript, o **Transpilador TypeScript** enviará o código para o **Analisador (Parser)**.
3. O **Analisador (Parser)** fará a leitura do código linha por linha e determinará se a sintaxe (a forma como cada instrução foi escrita) está de acordo com a sintaxe e as regras da Linguagem TypeScript. O analisador irá interromper as operações e emitir um erro se ele encontrar algum problema. Caso o código esteja correto, o analisador criará a **Árvore de Sintaxe Abstrata (AST)**.
4. A **Árvore de Sintaxe Abstrata (AST)** é uma Estrutura de Dados, que será utilizada pelo **Tradutor**.
5. Antes de ser enviada para **Tradutor**, a **Árvore de Sintaxe Abstrata (AST)** será analisada pelo **Verificador de Tipos**. O TypeScript usa um sistema de tipos para verificar os tipos de variáveis, funções e objetos. Isso é feito para garantir que o código esteja correto e para detectar erros antes que o código seja executado. O sistema de tipos é baseado em uma combinação de anotações explícitas de tipo e inferência de tipo.
6. Uma vez que o código foi analisado e verificado, ele é **Traduzido** para a Linguagem JavaScript. O TypeScript é projetado para ser compatível com o código JavaScript existente, de modo que o código Transpilado deve ser compatível com todos os principais Runtimes JavaScript.
7. O **Transpilador JavaScript** retornará o código JavaScript, que será executado em um **Runtime JavaScript** (Navegador WEB ou o Node JS, por exemplo).

O TypeScript utiliza a mesma sintaxe do JavaScript e adiciona sintaxes adicionais para tipos de suporte. Se você tiver um programa JavaScript que não tenha nenhum erro de sintaxe, ele também poderá ser executado como um programa TypeScript. 

Outro ponto importante a ser destacado no TypeScript é que ele permite que a pessoa desenvolvedora crie aplicações 100% JavaScript desde o Backend (utilizando Node Express ou Nest, por exemplo) até o Frontend (utilizando React, Angular, ou VUE, por exemplo). Além disso, também é possível desenvolver Apps Mobile (Android e IOS), que consomem a API desenvolvida no Backend, através do React Native, por exemplo.

Outra característica da Linguagem TypeScript é que ela foi projetada para auxiliar no desenvolvimento de códigos
simples até os códigos mais complexos, utilizando os princípios da Orientação a Objetos, como Classes, Objetos, Tipagens (tipos de dados), Interfaces, Generics, entre outros recursos.

<br />

<h3>1.1. Por que tipar o JavaScript?</h3>



Essa, na realidade, é uma das grandes, se não for a maior, vantagem de se trabalhar com a Linguagem TypeScript. A utilização de Tipagem nos ajuda e muito no momento da depuração (debug) do nosso código, prevenindo alguns possíveis bugs ainda em tempo de desenvolvimento, que o JavaScript puro não nos oferece. Enquanto no JavaScript você terá que executar o código para identificar um erro de tipo de dado, no TypeScript você é alertado sobre este erro durante a construção do código.

<br />

<div align="left"><img src="https://i.imgur.com/izFuHID.png" title="source: imgur.com" width="30px"/> <a href="https://www.typescriptlang.org/pt/docs/" target="_blank"><b>Documentação: TypeScript</b></a></div>

<br />

<h3>1.2. O que vai mudar em relação ao JavaScript?</h3>



Com relação à todos conteúdos vistos até o presente momento com a Linguagem JavaScript, a principal mudança ao utilizar a Linguagem TypeScript será a tipagem das variáveis, constantes e arrays. Entretanto, existem algumas outras diferenças que são específicas da Linguagem TypeScript. Na tabela abaixo vemos um resumo do que muda e o que permanecerá igual:

| Conteúdo                   | Mudanças? | Descrição das mudanças                                       |
| -------------------------- | :-------: | ------------------------------------------------------------ |
| **Script (arquivo)**       |     ✔     | Os arquivos de código do TypeScript utilizam a extensão **.ts** |
| **Execução do Código**     |     ✔     | Será necessário instalar o Transpilador do TypeScript e configurar o ambiente de execução. |
| **Visual Studio Code**     |     ❌     | ---                                                          |
| **Variáveis e Constantes** |     ✔     | A declaração continuará sendo feita pelo **let e o const**, seguindo as mesmas regras do JavaScript, entretanto as variáveis receberão tipo de dados (tipagem estática) |
| **Saída de dados**         |     ❌     | ---                                                          |
| **Entrada de dados**       |     ✔     | Será necessário instalar a Biblioteca **Readline-Sync** for **TypeScript** e a forma de utilizá-la também será um pouco diferente, porque o TypeScript trabalha com a importação de Bibliotecas. Os Métodos de leitura de dados via teclado continuam os mesmos. |
| **Operadores**             |     ❌     | ---                                                          |
| **Laços Condicionais**     |     ❌     | ---                                                          |
| **Laços de Repetição**     |     ❌     | ---                                                          |
| **Vetores e Matrizes**     |     ✔     | A declaração continuará sendo feita pelo **let**, seguindo as mesmas regras do JavaScript, entretanto as variáveis receberão tipo de dados (tipagem estática) |

<br />

<h2>2. Instalação</h2>



Para utilizar o TypeScript, precisamos ter o Node instalado na máquina. Através do Gerenciador de Pacotes do Node (NPM) faremos a instalação do **Transpiler do TypeScript**:

1. Crie uma pasta na **Área de Trabalho**, chamada **typescript**.
2. Abra esta pasta no Visual Studio Code, clicando com o botão direito do mouse sobre a pasta **typescript** e no menu que será aberto, clique na opção **Abrir com o Code**.
3. Abra o Terminal do Visual Studio Code e digite o comando abaixo para instalar o **TypeScript**:

```bash
npm install -g typescript
```

4. Na sequência, digite o comando abaixo para checar se o TypeScript foi instalado corretamente:

```bash
tsc -v
```

5. Será exibido na tela a versão do TypeScript:

```bash
Version 5.0.4
```

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <p align="justify"> **ATENÇÃO:** No momento em que este material foi escrito, a versão mais atual do TypeScript era a versão 5.0.4. Ao utilizar este material no futuro, pode ser que a versão mais atual seja outra.</p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

> Caso apareça a mensagem: 
>
> ```bash
> "tsc is not recognized as an internal or external command". 
> ```
>
> 1. Na Barra de Pesquisar do Windows, localize o app **Editar as Variáveis de Ambiente do Sistema**.
> 2. Será aberta a janela abaixo. Clique no botão **Variáveis de Ambiente**
> 3. No item **Variáveis de Ambiente do Usuário**, dê um duplo clique no item **path**
> 4. Verifique se existe o caminho para a pasta do NPM (**c:\users\seu_usuario\AppData\Roaming\npm**), como mostra a imagem abaixo:
> 5. Se não existir, adicione este caminho através do botão **Novo**.

6. TypeScript instalado, vamos instalar a Biblioteca **ts-node**, para simplificar o uso do **TypeScript**, através do comando:

```bash
npm install -g ts-node
```

7. Na sequência, digite o comando abaixo para checar se o ts-node foi instalado corretamente:

```bash
ts-node -v
```

8. Será exibido na tela a versão do ts-node:

```bash
v10.9.1
```

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <p align="justify"> **ATENÇÃO:** No momento em que este material foi escrito, a versão mais atual do TS-Node era a versão 10.9.1. Ao utilizar este material no futuro, pode ser que a versão mais atual seja outra.</p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

9. Para finalizar, vamos inicializar o Projeto TypeScript através do comando abaixo:

```bash
tsc --init
```

10. Observe que será criado o arquivo **tsconfig.json**:

<div align="center"><img src="https://i.imgur.com/JE81uN1.png" title="source: imgur.com" /></div>

<br />

<div align="left"><img src="https://i.imgur.com/izFuHID.png" title="source: imgur.com" width="30px"/> <a href="https://www.typescriptlang.org/pt/download" target="_blank"><b>Documentação - TypeScript: Instalação</b></a></div>

<br />

<h2>3. Exemplo de código: Hello World!</h2>



1. Crie a pasta **introducao** dentro da pasta **typescript**
2. Crie um novo arquivo, na pasta **introducao**, chamado **HelloWorld.ts**.
3. Insira o código abaixo:

```typescript
console.log("Hello World!");
```

<br />

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="80px"/> | <div align="left">**DICA:** *Assim como no JavaScript, o ponto e virgula no final da linha é opcional.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

3. No Terminal do  Visual Studio Code, execute os comandos abaixo:

```bash
cd introducao
```

```bash
tsc HelloWorld.ts
```

4. Observe que será criado na mesma pasta um arquivo chamado **HelloWorld.js**

<div align="center"><img src="https://i.imgur.com/AclReIo.png" title="source: imgur.com" /></div>

A nossa Classe **HelloWorld.ts** foi transpilada e neste processo foi gerado o arquivo **HelloWorld.js**, ou seja, o código TypeScript no formato do JavaScript.

5. Abra o arquivo **HelloWorld.js** e veja o código:

<div align="center"><img src="https://i.imgur.com/TJjdUBs.png" title="source: imgur.com" /></div>

Neste exemplo, como se trata de um código simples, ambos os arquivos terão o mesmo conteúdo. 

6. Vamos executar o arquivo **HelloWorld.js** através do comando abaixo:

```bash
node HelloWorld.js
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Hello World!
```

<br />

<h3>3.1. Automatizando a Execução do Código</h3>



Através do **Pacote ts-node**, nós podemos automatizar o processo de transpilação e execução do código em um único comando, como veremos a seguir:

No Terminal do  Visual Studio Code, execute o comando abaixo:

```bash
ts-node HelloWorld.ts
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Hello World!
```

Observe que o resultado será o mesmo, entretanto o arquivo js não será gerado.

<br />

<h2>4. Variáveis Tipadas</h2>



O TypeScript dispõe de inúmeros recursos que complementam o JavaScript. Provavelmente o recurso mais importante e relevante do TypeScript são as variáveis tipadas. Você pode definir qual será o tipo que uma variável deve receber, que uma função deve retornar, entre outras situações de uso. 

<br />

<h3>4.1. Declaração de Variáveis</h3>



As variáveis no TypeScript, assim como no JavaScript são declaradas com a palavra-chave **var** ou com a palavra chave **let**, seguida do identificador da variável. 

**Sintaxe:**

**Sem atribuição de valor**

```typescript
var identificador_da_variável: tipo;
let identificador_da_variável: tipo;
```

No exemplo acima, vemos a sintaxe para criar uma variável sem a inicialização de valor. Observe que após o identificador, será adicionado dois pontos (:) e na sequência o tipo de dado.

**Com atribuição de valor**

```typescript
var identificador_da_variável: tipo = [valor];
let identificador_da_variável: tipo = [valor];
```

No exemplo acima, vemos a sintaxe para criar uma variável com a inicialização de valor correspondente ao tipo da variável. Observe que após o identificador, será adicionado dois pontos (:) e na sequência o tipo de dado.

<br />

**Relembrando a diferença entre o var e o let**

Antes de vermos a diferença entre o var e o let, precisamos relembrar o conceito de **Escopo**:

O **Escopo** de uma variável é a região do código-fonte do seu programa em que ela está definida. A maioria das Linguagens de Programação o Escopo é delimitado através de um par de chaves { }.

Quando declaramos uma variável dentro de um bloco de código (laço condicional, laço de repetição, função, entre outros), dizemos que o **Escopo da variável é Local**, ou seja, esta variável poderá ser acessada apenas dentro do bloco ou função onde foi declarada.

Quando declaramos uma variável fora de um bloco de código (laço condicional, laço de repetição, função, entre outros), dizemos que o **Escopo da variável é Global**, ou seja, esta variável poderá ser acessada em qualquer parte do código.

**Diferente da maioria das Linguagens de Programação, o JavaDcript e o TypeScript não utilizam as Chaves para definir o Escopo Global, eles utilizam as Chaves apenas para definir o Escopo Local.**  Veja o exemplo no trecho de código abaixo:

```typescript
// Escopo Global

if( condição ){
    // Escopo Local
}

// Escopo Global
```

Observe que tudo que está fora do Bloco if, delimitado pelas Chaves { }, é definido como **Escopo Global** e tudo que está dentro do Bloco if, delimitado pelas Chaves { }, é definido como **Escopo Local**. 

Quando declaramos uma variável com a palavra reservada **var**, ela será interpretada pelo TypeScript como uma **Variável de Escopo Global**, independente de onde a variável foi declarada, seja no início, no meio ou no final do código, dentro ou fora de um Bloco de Código, tornando a variável acessível em qualquer parte do código.

Quando declaramos uma variável com a palavra reservada **let**, ela será interpretada pelo TypeScript como uma **Variável de Escopo Local**, caso seja declarada dentro de um Bloco de Código, tornando a variável acessível apenas dentro do Bloco onde ela foi declarada. Caso a variável seja declarada fora de um Bloco de Código, ela será uma **Variável de Escopo Global**, tornando a variável acessível em qualquer parte do código.

Adotaremos como boa prática criarmos todas as variáveis através da palavra reservada **let**, que garante um maior controle sobre as nossas variáveis.

<br />

<div align="left"><img src="https://i.imgur.com/izFuHID.png" title="source: imgur.com" width="30px"/> <a href="https://www.typescriptlang.org/pt/docs/handbook/variable-declarations.html#handbook-content" target="_blank"><b>Documentação: Declaração de variáveis</b></a></div>

<br />

<h3>4.2 Identificadores</h3>



Diferentemente das palavras do mundo real, na programação não se pode separar as palavras que fazem parte do identificador de uma variável com espaço. Ao invés disso, usa-se:

- Uma letra maiúscula no começo de cada palavra, exceto a primeira (**Camel-Case**). **Exemplo:** *nomeDaVariavel*

No TypeScript, geralmente se utiliza o padrão Camel-Case, entretanto, existem outras restrições aos identificadores de variáveis, tais como:

- Os nomes das variáveis podem conter as letras a-z, A-Z, os dígitos 0-9, bem como o caractere *underscore* ou sublinhado (_) e o caractere cifrão ($).
- Os nomes das variáveis não podem começar com um dígito.
- Os nomes das variáveis devem começar com uma letra, um cifrão ($) ou um sublinhado (_). Não pode começar com um dígito.
- Os nomes das variáveis diferenciam maiúsculas de minúsculas. Isso significa que `numero`e `Numero`são variáveis diferentes.
- Os nomes das variáveis não podem corresponder a uma palavra reservada da linguagem TypeScript, como por exemplo: `var`, `const`, `let`, entre outras. (Veja a lista no próximo item)
- Os nomes das variáveis podem ser de qualquer comprimento, entretanto recomenda-se que não seja muito grande.
- Os identificadores em TypeScript devem ser exclusivos e auto descritivos. **Exemplo:** **`mediaFinal`**.
- Existem algumas convenções de nomenclatura que são seguidas pelas Pessoas Desenvolvedoras, como:

- - Os nomes de todas as variáveis e métodos de instância pública começam com uma palavra com todas as letras minúsculas. **Exemplo:** `media`, `soma`, entre outras.
  - Se mais de uma palavra for usada em um nome (palavra composta), a segunda e as demais palavras subsequentes devem começar com uma letra maiúscula inicial. **Exemplo:** `temperaturaAnual`, `estoqueTotalMensal`, entre outros (Camel-Case).
  - Todas as palavras que compõem o identificador dos métodos, classes e interfaces devem começar com uma letra maiúscula inicial. Exemplo: `Hello`, `Produto`, `VisualizarDados`, entre outras.

- Os identificadores não devem conter dois caracteres sublinhado (`_`) consecutivos. Esses nomes estão reservados para identificadores gerados por compilador.


<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** O identificador da variável deve expressar exatamente o seu conteúdo. Evite utilizar nomes genéricos como v1, variavel_01, entre outros.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h3>4.3. Palavras Reservadas</h3>



Geralmente, as linguagens costumam ter palavras-chaves reservadas, que não podem ser usadas como nomes de variáveis, porque elas são parte da sintaxe da linguagem. O TypeScript não é diferente e também possui a sua lista de palavras reservadas que não devem ser utilizadas para identificar variáveis, que é a mesma lista do JavaScript. Na tabela abaixo, temos uma lista com as principais palavras reservadas:

|                |            |              |           |
| -------------- | ---------- | ------------ | --------- |
| abstract       | arguments  | await        | boolean   |
| break          | byte       | case         | catch     |
| char           | class      | const        | continue  |
| debugger       | default    | delete       | do        |
| double         | else       | enum         | eval      |
| export         | extends    | false        | final     |
| finally        | float      | for          | function  |
| goto           | if         | implements   | import    |
| in             | instanceof | int          | interface |
| let            | long       | native       | new       |
| null           | package    | private      | protected |
| public         | return     | short        | static    |
| super          | switch     | synchronized | this      |
| throw          | throws     | transient    | true      |
| try            | typeof     | var          | void      |
| volatile       | while      | with         | yield     |
| Array          | Date       | eval         | function  |
| hasOwnProperty | Infinity   | isFinite     | isNaN     |
| isPrototypeOf  | length     | Math         | NaN       |
| name           | Number     | Object       | prototype |
| String         | toString   | Undefined    | valueOf   |

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words" target="_blank"><b>Documentação: Palavras Reservadas</b></a></div>

<br />

<h2>5. Tipos de Dados</h2>



Os tipos de dados do TypeScript podem ser resumidos na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/AnoulGf.png" title="source: imgur.com" /></div>

O **tipo Static** significa “em tempo de compilação” ou “sem executar um programa”. Em uma linguagem de tipagem estática, variáveis, parâmetros e objetos possuem tipos que o compilador reconhece em tempo de compilação, sem a necessidade de declarar ou instanciar um objeto. 

O tipo Static está dividido em 2 categorias:

1. **Tipos de dados primitivos** (também chamados de tipos intrínsecos ou integrados), que correspondem a dados mais simples, como números inteiros e reais, caracteres simples e lógicos
2. **Tipos de dados não primitivos** (também chamados de tipos de dados derivados ou de referência), que consistem em arrays  (vetores), classes, objetos, interfaces e funções, que armazenam valores de tipos variados ou um grupo de valores definidos em uma Classe.

O **tipo Generic** é usado para criar um componente que pode funcionar com uma variedade de tipos de dados, em vez de um único. Ele permite criar componentes reutilizáveis. Isso garante que o programa seja flexível e escalonável a longo prazo. TypeScript usa genéricos com a variável de tipo <T> que denota tipos. O tipo de funções genéricas é igual ao das funções não genéricas, com os parâmetros de tipo listados primeiro, de forma semelhante às declarações de função.

<br />

<h3>Tipos Primitivos</h3>

<br />

<h3>5.1. Any</h3>



O tipo **Any** é o equivalente a uma variável qualquer escrita em JavaScript. O tipo **any** pode receber qualquer valor que você quiser. Como o TS é tipado, neste momento você deve estar se perguntando: Por que utilizar o any ?

Imagine o seguinte cenário: você está fazendo integração da sua aplicação com uma API de terceiros e, mesmo que você tenha uma documentação dessa API, você não conhece 100% a estrutura do outro projeto. Esse é um dos cenários em que o any é mais utilizado: Quando não temos a certeza do tipo de dado que receberemos da API, utilizamos o tipo any, que recebe qualquer tipo de dado.

<br />

<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 01 - Tipo Any:**

```typescript
let variavel: any = 'qualquer coisa';
console.log("Valor da varíavel any:", variavel);

variavel = 22;
console.log("Valor da varíavel any:", variavel);

variavel = true;
console.log("Valor da varíavel any:", variavel);
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Valor da varíavel any: qualquer coisa
Valor da varíavel any: 22  
Valor da varíavel any: true
```

<br />

<h3>5.2. Boolean</h3>



Como em outras linguagens tipadas, o tipo Boolean suporta dois tipos de valores: `true` ou `false`.

<br />

<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 02 - Tipo Boolean:**

```typescript
let resposta: boolean = true;
console.log("Valor da varíavel boolean resposta:", resposta);

let continua: boolean = "false";
console.log("Valor da varíavel boolean continua:", continua);
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Valor da varíavel boolean resposta: true
Valor da varíavel boolean continua: false
```

<br />

| <img src="https://i.imgur.com/L338M2G.png" title="source: imgur.com" width="80px"/> | **DESAFIO:** *O que acontecerá se você tentar inserir na variável do tipo boolean um valor diferente de `true` ou `false`?  Faça o teste e veja o resultado.* |
| ------------------------------------------------------------ | :----------------------------------------------------------- |

<br />

<h3>5.3.Number</h3>



No TypeScript, todos os valores numéricos, como: **int** (inteiro), **float** (real) , **decimal** , **hexadecimal** , **octal**, entre outros, devem ser tipados como Number. Em outras palavras, no TypeScript número é número.

<br />

<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 03 - Tipo Number:**

```typescript
let numeroInteiro: number = 10;
console.log("Valor da varíavel number:", numeroInteiro);

let numeroReal: number = 10.25;
console.log("Valor da varíavel number:", numeroReal);

let numeroHexadecimal: number = 0x01;
console.log("Valor da varíavel number:", variavel);
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Valor da varíavel number: 10
Valor da varíavel number: 10.25
Valor da varíavel number: 1
```

<br />

<h3>5.4.String</h3>



As strings armazenam valores do tipo texto. Diferente de outras linguagens de programação, no TypeScript nós podemos declarar uma string com aspas simples ou com aspas duplas.

<br />

<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 04 - Tipo String:**

```typescript
let variavelString01: string = 'String com aspas simples';
console.log(variavelString01);

let variavelString02: string = "String com aspas duplas";
console.log(variavelString02);
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
String com aspas simples
String com aspas duplas
```

<br />

O tipo string possui uma variação muito interessante, que são as  *Templates Strings*, que também são conhecidas como Interpolação de strings. Você pode quebrar as linhas e inserir variáveis no meio da strings de forma muito mais fácil. Para isso, basta definir a  *string*  com o caractere acento grave (`), ao invés de utilizar as aspas simples ou dupla.

<br />

<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 05 - Template String:**

```typescript
let mensagem: string = 'Hello World!';
let mensagemRecebida: string = `A mensagem recebida foi ${mensagem}`;
console.log(mensagemRecebida);
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
A mensagem recebida foi Hello World!
```

<br />

<div align="left"><img src="https://i.imgur.com/izFuHID.png" title="source: imgur.com" width="30px"/> <a href="https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#the-primitives-string-number-and-boolean" target="_blank"><b>Documentação - TypeScript: Tipos de dados</b></a></div>

<br />

<h2>6. Null e Undefined</h2>



**Null** é uma palavra-chave da linguagem avaliada com um valor especial, normalmente utilizado para indicar a ausência de um valor, ou seja, null indica que uma variável não possui  “nenhum objeto ou valor”. A maioria das linguagens de programação tem um equivalente para o null, como nil, por exemplo, ou o próprio null.

**Undefined** é uma palavra-chave da linguagem avaliada com um valor especial, que indica a ausência de valor. O valor indefinido representa uma ausência mais profunda. É o valor de variáveis que não foram inicializadas e o valor obtido quando se consulta o valor de uma propriedade de objeto ou elemento de array que não existe. O valor indefinido também é retornado por funções que não têm valor de retorno e o valor de parâmetros de função quando nenhum argumento é fornecido.

Na prática, Null e Undefined indicam uma ausência de valor, entretanto utilizamos Undefined para representar uma ausência de valor em nível de sistema, inesperada ou como um erro, por exemplo,  enquanto o Null é utilizado para representar ausência de valor em nível de programa, normal ou esperada. Se precisar atribuir um desses valores a uma variável ou propriedade ou passar um desses valores para uma função, Null quase sempre será a escolha certa.

<br />

<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 06 - Null e Undefined:**

```typescript
let variavel01: number|undefined;
console.log("Valor inicial da variável 01: ", variavel01);

let variavel02: any = null;
console.log("Valor inicial da variável 02: ", variavel02);

variavel01 = 10;
console.log("Novo valor da variável 01: ", variavel01);

variavel02 = 20;
console.log("Novo valor da variável 02: ", variavel02);
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Valor inicial da variável 01:  undefined
Valor inicial da variável 02:  null
Novo valor da variável 01:  10
Novo valor da variável 02:  20
```

Observe que a variável **variavel01** foi definida com 2 tipos de dado: *number* ou *undefined*. Através do separador ( | ) é possível definir dois tipos diferentes para uma mesma variável.

<br />

<div align="left"><img src="https://i.imgur.com/izFuHID.png" title="source: imgur.com" width="30px"/> <a href="https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#null-and-undefined" target="_blank"><b>Documentação - TypeScript: Null e Undefined</b></a></div>

<br />

<h2>7. Declaração de Constantes</h2>



No JavaScript a declaração de uma constante é bem parecida com a declaração de uma variável. Basta colocar a palavra reservada **const** antes do identificador da variável.

<br />

<img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/>**Exemplo 07 - Declaração de Constantes:** 

```js
const quantidade: number = 10;
console.log(quantidade);

const nome: string = "Mariana Alves";
console.log(nome);

const resposta: boolean = true;
console.log(resposta);
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
10
Mariana Alves
true
```

Uma Constante, diferente de uma Variável, não se pode ser declarada sem atribuir um valor de inicialização e além disso, não pode ter o seu valor alterado, ou seja, ela é imutável. 

<br />

<div align="left"><img src="https://i.imgur.com/izFuHID.png" title="source: imgur.com" width="30px"/> <a href="https://www.typescriptlang.org/pt/docs/handbook/variable-declarations.html#declara%C3%A7%C3%B5es-const" target="_blank"><b>Documentação - TypeScript: Const</b></a></div>

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="4%"/> <a href="https://github.com/rafaelq80/exemplos_js/tree/main/typescript/introducao" target="_blank"><b>Código fonte do Exemplo - Hello World</b></a></div>

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="4%"/> <a href="https://github.com/rafaelq80/exemplos_js/tree/main/typescript/variaveis" target="_blank"><b>Código fonte dos Exemplos - Variáveis</b></a></div>

<br />

------

## 🔑**Pontos chave:**

1. O **TypeScript** é uma linguagem de programação criada pela Microsoft, como um _superset_ do ECMAScript que, por sua vez, é um *superset* do JavaScript Clássico. 
2. Os **tipos de dados primitivos** na Linguagem TypeScript são utilizados para armazenar um único valor. 
3. Os **tipos de dados não primitivos**, armazenam valores de tipos variados ou um grupo de valores definidos em uma Classe.
4. Os tipos de dados primitivos da Linguagem TypeScript são: **number, string, boolean, null e undefined**.
5. Para declarar uma variável, acrescentamos antes do identificador da variável a palavra reservada **var** ou **let**.
6. A palavra reservada **var** cria uma variável de escopo Global, independente de onde ela for declarada.
7. A palavra reservada **let** cria uma variável de escopo Global se ela for declarada fora do escopo de um Bloco de código (laço condicional, laço de repetição, entre outros) e cria uma variável de escopo Local se ela for declarada dentro de um Bloco de código.
8. O tipo de dado de uma variável no TypeScript é definido no momento que a variável é declarada, porque a **Linguagem TypeScript possui tipagem estáticaica**.
9. Os **nomes de variáveis** devem ser **auto descritivos** e seguir as devidas convenções de nomenclatura do JavaScript (camel-case).
10. Os **nomes das variáveis** devem ser exclusivos.
11. Para declarar uma constante, seguimos os mesmos padrões de declaração de variáveis e acrescentamos antes do identificador da constante a palavra reservada **const**.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
