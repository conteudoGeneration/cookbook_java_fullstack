<h1>Introdução a Linguagem JavaScript</h1>



O **JavaScript (JS)** é uma Linguagem de Programação extremamente popular e amplamente utilizada no desenvolvimento de aplicações WEB. Originalmente, a Linguagem JavaScript é uma Linguagem Interpretada. Com o passar dos anos e com as evoluções tecnológicas, a Linguagem JavaScript passou também a ser uma Linguagem Compilada. Outra característica interessante da Linguagem **JavaScript** é que ela pode ser utilizada tanto no desenvolvimento de aplicações do lado do cliente, quanto para desenvolver aplicações do lado do servidor. 

> **Linguagem Compilada:** O termo compilada vem do Compilador. Um compilador é um software de computador que traduz prontamente a  linguagem de programação em código de máquina ou linguagem de baixo nível. Ele traduz todos os programas para binários (1's e 0's) que um computador entende e faz a tarefa que corresponde ao código. 
>
> **Linguagem Interpretada:** O termo interpretada vem do Interpretador. Um interpretador é um programa de computador que converte instruções de  programa em código de máquina. As declarações do programa incluem  código-fonte, código pré-compilado e scripts. Ao contrário de um  compilador, um interpretador leva um período mais curto de tempo para  interpretar um programa. Diferente do Compilador, o Interpretador não gera um arquivo final, logo, todas as vezes que você precisar executar o código ele será novamente interpretado do começo ao fim.

JavaScript é uma linguagem de programação de alto nível, que possui um alto nível de abstração, o que torna a sua compreensão muito mais simples. 

Javascript é uma Linguagem do itpo *single-threaded* porque originalmente era apenas uma Linguagem de Script para páginas WEB, criada para atender às necessidades de um único usuário em uma única janela do navegador, eliminando a  necessidade de ser uma Linguagem *multithreading*. Embora o **JavaScript continue sendo uma Linguagem single-threaded**, atualmente a Linguagem JavaScript consegue **emular uma Linguagem multithreading**, o que permite o uso dos recursos da Programação Assíncrona (paralela) no desenvolvimento das nossas aplicações JavaScript, permitindo que novas threads de execução sejam criadas e executadas em segundo plano, que são  independentes do thread de execução principal, que é frequentemente usado para executar a lógica da interface do usuário.

<div align="center">
    <img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="25%"/>
     <br />
    <figcaption><b><i>Logo do JavaScript</i></b></figcaption>
</div>
Quando a Linguagem JavaScript é inserida dentro de uma página da WEB, ela é executada a partir de um Navegador  WEB. Atualmente, os Navegadores WEB mais populares como: o Chrome, o Firefox e o Edge, possuem um Interpretador JavaScript. Ao utilizarmos a Linguagem JavaScript desta forma, o JavaScript está sendo utilizado como uma linguagem do lado cliente. 

Quando a Linguagem JavaScript é executada dentro de um Servidor WEB, o JavaScript passa a ter funcionalidades como: acessar os dados de um Bancos de dados, acessar os sistemas de arquivos do Servidor, entre outras funcionalidades. Ao utilizarmos a Linguagem JavaScript desta forma, o JavaScript está sendo utilizado como uma linguagem do lado servidor. Na imagem abaixo, podemos visualizar que o JavaScript pode ser executado tanto no Cliente quanto no Servidor:

<div align="center"><img src="https://i.imgur.com/nFregBw.png" title="source: imgur.com" /></div>

A Linguagem JavaScript é uma linguagem extremamente versátil, simples, que possibilita o reaproveitamento de códigos. O JavaScript é uma Linguagem de Programação, que permite desenvolver códigos para os mais variados tipos de  aplicativos, como vemos na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/7nuqdRg.png" title="source: imgur.com" /></div>

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/JavaScript" target="_blank"><b>Documentação do JavaScript</b></a></div>

<br />

<h2>1. A Linguagem JavaScript e a sua História</h2>



Em 1995, o JavaScript foi criado por um desenvolvedor do Netscape chamado Brendan Eich. Primeiro, seu nome era **Mocha**. E então, seu nome foi alterado para **LiveScript**.

A Netscape decidiu mudar o **LiveScript** para **JavaScript** para aproveitar a fama do Java, que já era uma Linguagem de Programação muito popular. A decisão foi tomada pouco antes da Netscape lançar seu navegador, o Netscape Navigator 2. Como resultado, o JavaScript entrou na versão 1.0. 

<div align="center"><img src="https://i.imgur.com/IhKvgOV.png" title="source: imgur.com" /></div>

A Netscape lançou o JavaScript 1.1 no Netscape Navigator 3. Enquanto isso, a Microsoft lançou o seu Navegador WEB  Internet Explorer 3, com o objetivo de competir com o Netscape. Desta forma, o IE veio com a sua própria implementação do JavaScript, chamado de **JScript**, ou seja, haviam duas versões diferentes do JavaScript no mercado, sem uma padronização.

Em 1997, a Linguagem JavaScript 1.1 foi apresentada à **Associação Europeia de Fabricantes de Computadores (ECMA)** como uma proposta de padronização da Linguagem. O Comitê Técnico nº 39 (TC39) da ECMA, foi designado para padronizar a linguagem e torná-la uma linguagem de script de uso geral, multiplataforma e neutra em termos de fornecedor. Desta forma, O TC39 criou o ECMA-262, um padrão para definir uma nova linguagem de script chamada ECMAScript (frequentemente pronunciada Ek-ma-script).

Depois disso, a Organização Internacional de Padronização e as Comissões Eletrotécnicas Internacionais (ISO/IEC) adotaram o nome ECMAScript (ISO/IEC-16262). A versão mais atual do **ECMAScript é a versão 2023**.

<br />

<h3>1.1. JavaScript e Java são a mesma Linguagem de Programação?</h3>



<div align="center"><img src="https://i.imgur.com/k9FHWYw.png" title="source: imgur.com" /></div>

Essa é uma pergunta muito comum, especialmente pela semelhança dos nomes. A resposta para esta pergunta é definitivamente **não são a mesma Linguagem de Programação**.

A Linguagem de programação JavaScript não faz parte da plataforma Java. O JavaScript na sua forma  mais comum, é uma linguagem que fica embutida nos documentos HTML e pode fornecer níveis de interatividade para páginas Web que não são acessíveis com o HTML simples. Embora possa ser utilizada no desenvolvimento Backend, JavaScript é uma Linguagem voltada para o desenvolvimento Frontend, além de ser fracamente tipada.

A Linguagem Java é uma linguagem de programação nativamente Orientada a Objetos, que cria aplicações executadas em uma máquina virtual (JVM), em ambiente servidor, que precisam ser compiladas antes de serem executadas. Java é uma Linguagem voltada para o desenvolvimento Backend, além de ser fortemente tipada.

Quando falamos no Desenvolvimento de aplicações Backend com JavaScript, no Desenvolvimento de aplicações Frontend com Frameworks como o Angular ou Bibliotecas como o React e no Desenvolvimento de aplicações Mobile com a Biblioteca React Native, boa parte das pessoas desenvolvedoras não utilizam o JavaScript puro. As pessoas Desenvolvedoras tem optado por utilizar a Linguagem **TypeScript**, que é um Superset do JavaScript. O código TypeScript, diferente de outras linguagens, não é nem compilado e muito menos interpretado. O TypeScript é *transpilado* e convertido em ECMAScript (JavaScript). Na sequência a Engine JavaScript se encarrega de Interpretar/Compilar o código gerado.

Fazendo uma analogia, **a Linguagem TypeScript é um JavaScript com Super Poderes!**

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** *Não se preocupe com a Linguagem TypeScript neste momento. A partir da Metade do Bloco 01, quando já teremos estudado toda a base do JavaScript e estudaremos Orientação a Objetos, vamos migrar para a Linguagem TypeScript e conheceremos as suas características com mais detalhes.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Orientação ao Futuro. No Bootcamp a Linguagem TypeScript será utilizada tanto no Desenvolvimento do Backend com o Nest, quanto no Desenvolvimento do Frontend com o React.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>2. Características da Linguagem JavaScript</h2>



1. O JavaScript é uma linguagem de programação de alto nível, interpretada e orientada a objetos
2. Pode ser executada em Navegadores WEB e manipular comportamentos de páginas WEB. 
3. É uma linguagem de script, ou seja, não precisa ser compilada antes de ser executada.
4. O JavaScript é amplamente utilizado para o desenvolvimento WEB, mas também pode ser usada em vários outros ambientes sem o Navegador WEB, como o **Node.js**, por exemplo. 
5. O JavaScript é uma linguagem dinâmica, com tipagem dinâmica, ou seja, na declaração de uma variável ela não terá um tipo de dado fixo, o tipo será definido na atribuição de um valor para a variável. 
6. O JavaScript oferece suporte a Programação Funcional e Processamento Assíncrono (Processamento em Paralelo).
7. O JavaScript tem uma sintaxe simples, com uma baixa curva aprendizagem.

<br />

<h2>3. A Linguagem JavaScript em Páginas WEB</h2>



Ao contrário da maioria das  linguagens de programação, a linguagem JavaScript não possui originalmente o conceito de  entrada ou saída. O JavScript foi projetado para ser executado como uma linguagem  de script, em um ambiente host, e o ambiente host deve ser o responsável por fornecer os mecanismos de entrada e saída. No caso de uma página WEB, o HTML fornece os formulários e seus elementos (caixas de texto, botões, entre outros). O ambiente de host mais comum da Linguagem JavaScript é o Navegador WEB.

O JavaScript é uma linguagem de programação, que foi inicialmente projetada para interagir com os elementos das Páginas WEB. Nos navegadores da WEB, o JavaScript possui três componentes principais:

1. O **ECMAScript**, que fornece as funcionalidades principais, ou seja, é a Linguagem JavaScript propriamente dita.
2. O **Document Object Model (DOM)**, que fornece as interfaces necessárias para interagir com os elementos das páginas  WEB.
3. O **Browser Object Model (BOM)**, que fornece a API do navegador necessária para interagir com o navegador WEB.

<div align="center"><img src="https://i.imgur.com/87Oowth.png" title="source: imgur.com" /></div>

A Linguagem JavaScript permite adicionar interatividade a uma página da WEB. Normalmente, você usa o JavaScript em conjunto com as Linguagens HTML e CSS, para aprimorar as funcionalidades de uma página da WEB, como validação de dados em formulários, ações em elementos do formulário, criação de mapas interativos, exibição de gráficos animados, entre outros.

Quando uma página da WEB é carregada, ou seja, após o download do HTML e do CSS, o **Mecanismo JavaScript** disponível no navegador da WEB executa o código JavaScript, que fará as modificações no HTML e no CSS, atualizando a interface do usuário dinamicamente.

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** *Não se preocupe com os conceitos da criação de Páginas WEB com JavaScript neste momento. Quando iniciarmos o estudo do Frontend, veremos todos estes conceitos com mais detalhes.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

O **Mecanismo JavaScript (JavaScript Engine)** é o programa que executa o código JavaScript. Nos primórdios da Linguagem JavaScript, o **Mecanismo JavaScript** era implementado como um **Interpretador**, que fazia a leitura do código linha a linha e executava as instruções. Atualmente, o **Mecanismo JavaScript** é implementado como um **Interpretador** e como um **Compilador Just-In-Time (JIT)**, que além de Interpretar o código linha a linha, ele também faz o processo de Compilação Dinâmica do código JavaScript, ou seja, além de converter o **Bytecode** gerado pelo Interpretador em código de máquina, ele também faz algumas otimizações no código, o que acelera significativamente o processo de compilação e execução do código JavaScript.

> **Bytecode** é um formato de  código intermediário entre o código fonte (escrito pela pessoa desenvolvedora) e o código de máquina (conjunto der números binários, ou seja, código binário composto por combinações de 0's e 1's), que o computador consegue executar.

<br />

<h2>4. A Linguagem JavaScript em Ambiente Servidor</h2>



Na atualidade, a criação de aplicações tem como foco arquiteturas que sejam escaláveis e na entrega de soluções em tempo real, além da atenção à componentização e a segurança. Além disso, temos a revolução dos smartphones e o aumento de soluções de IoT (Internet das Coisas) e IA (Inteligência Artificial). 

Nesse contexto, os paradigmas conhecidos no desenvolvimento de aplicações também têm passado por diversas mudanças e evoluções, que envolvem o Desenvolvimento do Frontend, do Backend e inclusive do Universo Mobile, onde pensamos cada vez mais em uma solução como um todo, levando em consideração o consumo de dados e a disponibilidade de infraestrutura.

O JavaScript é uma linguagem popular e amplamente utilizada na construção de aplicações WEB interativas, especialmente em aplicações Frontend e Mobile (client side), ou seja, é comumente utilizada para rodar no “lado cliente” da aplicação. Entretanto, com a evolução das tecnologias WEB, tornou-se possível o uso do JavaScript também como uma Linguagem para o desenvolvimento Backend (server side). Neste contexto de consolidação de tecnologias e soluções JavaScript server side, surge o **Node.js**.

O **Node.js** é um ambiente de execução do código JavaScript do lado servidor (server side), que na prática se reflete na possibilidade de criar aplicações standalone (autossuficientes) em ambiente server side, sem a necessidade do Navegador. Internamente o Node JS possui um **Mecanismo JavaScript**, que funciona sem a necessidade de um Navegador WEB, e uma Interface **CLI - Command Line Interface**, que permite executar os códigos JavaScript através de comandos executados no Console do Terminal.

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** *No próximo tópico falaremos mais sobre o Node JS, que será a Plataforma que utilizaremos para interpretar e executar os nossos códigos JavaScript.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>5. Como o JavaScript Funciona?</h2>



Antes de começarmos a escrever código, é fundamental entender como o JavaScript funciona. Nós escrevemos código no editor de texto ou em uma **IDE (Integrated Development Environment ou Ambiente de Desenvolvimento Integrado)**, e de alguma forma este código magicamente se transforma em bits (0 e 1), que diz ao computador para  fazer alguma coisa.

O JavaScript originalmente é uma Linguagem de Programação Interpretada. Para que o código seja compreendido pelo computador, precisamos do **Mecanismo JavaScript**.

O **Mecanismo JavaScript** é simplesmente um programa de computador, que interpreta o código JavaScript. O motor é o responsável pela execução do  código.

Cada navegador possui o seu próprio **Mecanismo JavaScript**, que executa o código JavaScript. O mais popular é o **Google Chrome V8**. O **V8** do Google é utilizado no Google Chrome e no Node.js.

Na tabela abaixo, você confere as Engines dos Navegadores WEB mais populares:

| Navegador                    | Engine Javascript      |
| ---------------------------- | ---------------------- |
| **Google Chrome**            | V8                     |
| **Edge (Internet Explorer)** | Chakra                 |
| **Mozilla Firefox**          | Spider Monkey          |
| **Safári**                   | Javascript Core Webkit |

<br />

Na imagem abaixo, vemos um resumo do processo de execução do código JavaScript:

<div align="center"><img src="https://i.imgur.com/YwmOyAe.png" title="source: imgur.com" /></div>

Vamos entender o fluxo de desenvolvimento e execução de uma aplicação JavaScript:

1. Tudo começa em um editor de código (IDE) de sua escolha, onde a pessoa desenvolvedora escreve o código JavaScript, cujo o arquivo terá a extensão **.js**;
2. Para executar esse arquivo **.js** existem 2 possibilidades: **executar dentro de uma página HTML** através do Navegador WEB ou executar via Console, através de um **Ambiente de execução desacoplado do Navegador WEB**, como a Plataforma **Node JS**, por exemplo. De qualquer forma, em ambos os casos utilizaremos o **Mecanismo JavaScript** para interpretar o nosso código.
3. O **Mecanismo JavaScript** nos permite interpretar o arquivo com o código do JavaScript (js). O **Mecanismo JavaScript** vai traduzir o código JavaScript para Linguagem de Máquina e enviar todas as Instruções para o Processador.
4. O Processador executará todas as Instruções e encaminhará o resultado do processamento das instruções para o **Mecanismo JavaScript**.
5. O **Mecanismo JavaScript** exibirá o resultado do processamento na tela.

<br />

<h3>5.1. Como funciona internamente o Mecanismo do JavaScript?</h3>



Na imagem abaixo, vemos um resumo do funcionamento interno do **Mecanismo JavaScript**:

<div align="center"><img src="https://i.imgur.com/waEeNUi.png" title="source: imgur.com" /></div>

Vamos entender o funcionamento interno do **Mecanismo JavaScript**:

1. Depois de receber o código JavaScript, o **Mecanismo JavaScript** enviará o código para o **Analisador (Parser)**.
2. O **Analisador (Parser)** fará a leitura do código linha por linha e determinará se a sintaxe (a forma como cada instrução foi escrita) está de acordo com a sintaxe e as regras da Linguagem JavaScript. O analisador irá interromper as operações e emitir um erro se ele  encontrar algum problema. Caso o código esteja correto, o analisador criará a **Árvore de Sintaxe Abstrata (AST)**.
3. A **Árvore de Sintaxe Abstrata (AST)** é um Estrutura de Dados, que será utilizada pelo **Interpretador**.
4. O **Interpretador** fará a conversão da **Árvore de Sintaxe Abstrata (AST)** no **Bytecode**.
5. O **Bytecode** é uma representação intermediária (IR) do código. A função do Bytecode é atuar como uma ponte entre o código da máquina e o código escrito no JavaScript. Na sequência, o Bytecode será enviado para o **Compilador**.
6. O **Compilador Just In Time** converterá o Bytecode em código de máquina, efetuando certas otimizações, para tornar o código mais rápido. As instruções geradas pelo compilador serão enviadas para o Processador, que executará as instruções e retornará o resultado do processamento das instruções.
7. O **Mecanismo JavaScript** exibirá o resultado do processamento na tela.

<br />

------

## 🔑**Pontos chave:**

1. **JavaScript** é Linguagem de Programação extremamente popular, originalmente interpretada, que atualmente também pode ser compilada. 
2. **JavaScript** e **Java** não são a mesma Linguagem de Programação.
3. O **Java** é amplamente utilizado no desenvolvimento de aplicações server side.
4. O **JavaScript** pode ser utilizado tanto para desenvolver aplicações do lado do cliente, quanto para desenvolver aplicações do lado do servidor. 
5. O **JavaScript** pode ser executado dentro de uma página WEB em um Navegador ou em um Servidor que possua um **Mecanismo JavaScript**. 
6. As aplicações JavaScript são executadas através de um **Mecanismo JavaScript** que é responsável por interpretar e compilar o código JavaScript.
7. O **Mecanismo JavaScript** está presente tanto nos Navegadores WEB mais modernos (Chrome, Firefox, Edge, entre outros), quanto nos Ambientes de execução server side do JavaScript, como o **Node JS**.

<br />

<br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div> 
