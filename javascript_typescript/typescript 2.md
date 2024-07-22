<h1>Funções, Spreed Operator e Interfaces</h1>



<h2>0. Funções e Metodos</h2>

A Linguagem TypeScript, diferente da maioria das  Linguagens de Programação, oferece a possibilidade de se criar **Funções (Functions)** e **Métodos**. Dentro do contexto Linguagem TypeScript, existem algumas diferenças:

Uma função como um bloco de código reutilizável, escrito para executar um conjunto específico de tarefas sempre que necessário. Ela permite agrupar instruções relacionadas e executá-las como uma única unidade. Para definir uma função utilizamos a palavra-chave **function**. O corpo da função é escrito dentro do escopo, delimitado por um par chaves, semelhante aos Laços Condicionais de Repetição.

Para promover a capacidade de reutilização de software, **todas as Funções devem estar limitadas à realização de uma única tarefa bem definida**. O **nome da função também deve ser assertivo e expressar essa tarefa efetivamente**. As Funções tornam mais fácil as tarefas de escrever, depurar, manter e modificar código, pelo simples fato de **uma Função realizar apenas uma tarefa, tornando mais fácil os processos de teste e depuração do código**.

**Exemplos de Funções:**

- **function somar()**, **function subtrair()**, **function calcularArea()**.

Um **Método** é uma Função associada à Classe, ou seja, uma ação sobre um Objeto definido pela Classe. Um método TypeScript é uma propriedade de um objeto que contém uma definição de Função. Métodos são funções armazenadas como propriedades do Objeto. O principal benefício do uso de Métodos é que eles são reutilizáveis em futuros programas, evitando a repetição desnecessária de código.

Da mesma forma que as Funções, **todos os Métodos também devem estar limitados à realização de uma única tarefa bem definida** e o **nome do Método também deve ser assertivo e expressar exatamente a tarefa ele executará**. 

**Exemplos de Métodos:**

- **Objeto Carro:** acelerar(), frear(), virar(), parar()
- **Objeto Conta Bancária:** sacar(), depositar(), transferir()
- **Objeto E-commerce:** pagar(), adicionarAoCarrinho()

**Função x Método**

| Função                                                       | Método                                                       |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Uma Função TypeScript é um bloco de código projetado para executar uma tarefa específica. | Um Método TypeScript é uma propriedade de um Objeto que possui o valor de uma Função, projetado para executar uma tarefa específica sobre o Objeto. |
| Uma Função pode passar os dados que serão processados e pode retornar os dados resultantes do processamento. | O Método processa os dados contidos em um Objeto, definidos por uma Classe. |
| Os dados passados para uma Função são explícitos.            | Um Método passa implicitamente o objeto no qual foi chamado. |
| Uma Função é independente de qualquer estrutura do código.   | Um Método é uma função associada a uma propriedade de um  Objeto, ou seja, ele é dependente do Objeto. |
| Uma Função pode ser chamada diretamente pelo seu nome.       | Um Método consiste em um código que pode ser chamado pelo nome de seu Objeto, seguido por um ponto final e o nome do Método.<br />**Exemplo:** `objeto01.metodo01();` |

Neste conteúdo focaremos na declaração e na utilização de Funções. No conteúdo sobre Programação Orientada a Objetos focaremos na declaração e na utilização de Métodos.

<br />

<h2>1. Declarando Funções</h2>



**Sintaxe:**

```ts
function nome(argumento: tipo, argumento:tipo,...): tipo_de_retorno {
   // Corpo da função
}
```

<br />

<h3>1.1. Nome</h3>

É o nome da Função. Para definir o Nome da Função, deve-se seguir algumas boas práticas:

- Por padrão o nome da Função, assim como nas variáveis, segue o padrão **Camel Case**, onde  sempre começam com letras minúsculas.  **Exemplos:** `copiar()`, `colar()`, `recortar()`
- Caso o nome da Função seja composto, a partir da segunda palavra utiliza-se a primeira letra maiúscula em cada palavra. **Exemplos:** `calcularSalario()`, `aplicarDesconto()`, `calcularAreaQuadrado()`
- É recomendado que o nome da Função possua um verbo, porque indicam uma ação. **Exemplos:** `mover()`, `deletar()`, `inserirLinha()`
- O nome da Função deve ser assertivo e indicar exatamente o que ele faz. **Exemplos:** `copiarTexto()`, `colarTexto()`, `recortarTexto()`
- Independente de possuir ou não argumentos, uma Função sempre terá os `( )` parênteses após o seu nome.
- Os identificadores não podem utilizar as palavras reservadas, como: **`class`**, **`for`**, **`while`**, **`public`**, entre outras.

<br />

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words" target="_blank"><b>Documentação: Palavras Reservadas</b></a></div>

<div align="left"><img src="https://i.imgur.com/izFuHID.png" title="source: imgur.com" width="30px"/> <a href="https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#functions" target="_blank"><b>Documentação: Declaração de Funções</b></a></div>

<br />

<h3>1.2. Argumentos</h3>



São os parâmetros da Função. São representados por uma **lista de variáveis separadas por vírgulas**, onde cada parâmetro obedece as regras e a sintaxe de definição de variáveis:

**Sintaxe - Argumento com um tipo de dado**

```ts
function nome_da_funcao(identificador: tipo){
    // Corpo da Função
}
```

- **Identificador:** Nome da variável.
- **Tipo:** Tipo da variável.

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** Ao declarar os argumentos da Função não é necessário adicionar as palavras *var ou let* para indicar que os argumentos são variáveis, declare apenas o identificador do argumento, seguido do seu tipo.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

Uma Função TypeScript pode ter argumentos que aceitem 2 ou mais tipos de dados diferentes. Para indicar essa possibilidade, utilizamos o **PIPE ( | )** para separar os tipos na definição do tipo de dado do argumento, na assinatura da Função.

> O **PIPE ( | )** no TypeScript é utilizado para criar um tipo de dado especial chamado **Tipo de União (Union Type)**. Um tipo de união é um tipo formado por dois ou mais outros tipos de dados diferentes, representando valores que podem ser de qualquer um desses tipos. 

**Sintaxe - Argumento com dois tipos de dado**

```ts
function nome_da_funcao(identificador: tipo1 | tipo2){
    // Corpo da Função
}
```

- **Identificador:** Nome da variável.
- **Tipo1:** Primeiro tipo da variável.
- **Tipo2:** Segundo tipo da variável.

Neste caso, o argumento aceitaria um valor tanto do primeiro tipo, quanto do segundo tipo. 

Uma Função TypeScript também pode ter argumentos opcionais, ou seja, que a inserção de um valor não é obrigatório. Para indicar essa possibilidade, utilizamos uma **Interrogação ( ? )** ao lado da declaração do argumento, na assinatura da Função.

**Sintaxe - Argumento Opcional:**

```ts
function nome_da_funcao(argumento1: tipo, argumento2:tipo, argumento3?:tipo): Tipo01 | Tipo2 {
   // Corpo da função
}
```

Observe que na Função acima os argumentos 1 e 2 são obrigatórios, enquanto o argumento 3 é Opcional.

> A **Interrogação ( ? )** no TypeScript é um Operador chamado **Encadeamento Opcional (Optional chaining)**. Este operador permite a leitura do valor de um argumento, sem que a validação de cada referência seja expressivamente realizada. Na prática ao invés de causar um erro se a variável não receber um valor na chamada da Função, a variável retornará o valor `undefined`.  

<br />

<div align="left"><img src="https://i.imgur.com/izFuHID.png" title="source: imgur.com" width="30px"/> <a href="https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#the-primitives-string-number-and-boolean" target="_blank"><b>Documentação - Tipos de dados</b></a></div>

<div align="left"><img src="https://i.imgur.com/izFuHID.png" title="source: imgur.com" width="30px"/> <a href="https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#union-types" target="_blank"><b>Documentação: Union Type</b></a></div>

<div align="left"><img src="https://i.imgur.com/r9lrbPG.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining" target="_blank"><b>Documentação: Optional Chaining</b></a></div>

<br />

<h3>1.3. Tipo de Retorno</h3>



É o indicador do Tipo de retorno da Função, ou seja, o tipo do valor que se espera que a Função retorne ao finalizar o processamento dos dados. Assim como as variáveis, as Funções com tipo de retorno geralmente são declaradas com  tipos de dados primitivos, mas elas também podem retornar tipos não primitivos como Objetos, array, entre outros. Na tabela abaixo, vemos o tipos mais comuns de retorno:

| **Tipo**    | **Tamanho**          |
| ----------- | -------------------- |
| **boolean** | *true* ou *false*    |
| **number**  | 64  bits             |
| **string**  | cadeia de caracteres |
| **any**     | qualquer tipo        |
| **null**    | Nulo                 |

As Funções que possuem um tipo de dado, obrigatoriamente precisam retornar um valor equivalente ao seu tipo, ou seja, se a Função for declarada para retornar um valor do tipo **number**, ela precisa retornar um numero ao final do seu processamento. Para retornar este valor, o TypeScript utiliza a palavra reservada **return** seguido do valor de retorno.

Uma Função também pode retornar dois ou mais tipos de dado diferentes. Para indicar essa possibilidade, utilizamos o **PIPE ( | )** para separar os tipos na definição do tipo de retorno da Função, na assinatura da Função.

**Sintaxe - Dois tipos de retorno:**

```ts
function nome_da_funcao(argumento1: tipo, argumento2:tipo,...): tipo1 | tipo2 {
   // Corpo da função
}
```

Observe que a Função acima pode retornar um valor do tipo1 ou um valor do tipo2.

Caso a Função **não necessite ter um tipo de dado de retorno, ou seja, um valor que deverá ser retornado ao final da execução da Função**, na assinatura da Função, defina o tipo de retorno como **void**.

**Sintaxe - Sem tipo de retorno:**

```ts
function nome(): void {
   // Corpo da função
}
```

Observe que na Função acima além de não possuir argumentos, ela não retornará nenhum valor, por isso foi declarada com o tipo **void**.

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** *Ao declarar uma Função, caso o tipo de retorno não seja informado, o TypeScript definirá o tipo de retorno por inferência, baseado nos argumentos e no retorno definido no Corpo da Função.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

## <img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/> Exemplo 01: Funções com retorno e argumentos



```ts
	function soma(numero1: number, numero2: number): number {
		return numero1 + numero2;
	}
```

No exemplo acima, a Função **soma** retorna um valor numérico, ou seja, o comando **return** retornará um numero, no exemplo acima, a soma entre os 2 números. 

Veja a implementação abaixo:

```ts
let resultado: number;

resultado = soma(2, 2);

console.log("O Resultado da soma é: " + resultado);

function soma(numero1: number, numero2: number): number {
    return numero1 + numero2;
}
```

<br />

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
O Resultado da soma é: 4
```

Observe que para receber este valor, foi necessário criar uma variável do mesmo tipo de retorno da Função (no exemplo acima, uma variável do tipo **number**), associado a um comando de saída de dados, para exibir o conteúdo da variável.

<br />

## <img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/> Exemplo 02: Funções com tipo de retorno e argumentos com 2 tipos de dado



```ts
function tipoProduto(tamanho: number | string): void{
    if (typeof(tamanho) === "number" )
        console.log("\nO Tamanho é um número");
    else
        console.log("\nO Tamanho é uma string");
}
```

No exemplo acima, a Função **tipoProduto** exibe uma mensagem se o argumento for um valor numérico e exibe uma outra mensagem se o argumento for uma string.

Veja a implementação abaixo:

```ts
tipoProduto(40);

tipoProduto('M');

function tipoProduto(tamanho: number | string){
    if (typeof(tamanho) === "number" )
        console.log("\nO Tamanho é um número");
    else
        console.log("\nO Tamanho é uma string");
}
```

<br />

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
O Tamanho é um número

O Tamanho é uma string
```

Para checar se o tipo de dado que foi enviado para a função é número ou string, utilizamos a função **typeof**. Esta verificação de tipos é chamada de **Estreitamento de Tipos** (**Narrowing**). 

**Narrowing** refere-se ao processo de redução do tipo de uma variável de um tipo mais amplo para um tipo mais específico dentro de um determinado bloco de  código ou contexto. Isso geralmente é feito através de instruções  condicionais ou protetores de tipo (**Type Guards**), que ajudam o compilador TypeScript a entender com mais precisão qual é o tipo de uma variável em um  determinado ponto do código.

> **O que é Narrowing?**
>
> O **Narrowing** é o processo de refino do tipo de uma  variável com base em uma condição. Isso pode ser útil quando você tem  uma variável que pode ter vários tipos possíveis, como no exemplo acima, mas você deseja executar operações nela que são válidas apenas para um tipo específico.
>
> O TypeScript usa a análise de fluxo de controle para estreitar tipos  com base em instruções condicionais, loops, verificações de veracidade. O estreitamento de tipos normalmente é feito usando instruções  condicionais, como no exemplo acima, que checa o tipo da variável para definir o que será feito com ela.
>
> **O que são Type Guards?**
>
> **Type Guards** é uma técnica TypeScript usada para obter informações sobre o tipo de uma variável, geralmente dentro de um bloco condicional. Os Type Guards são funções regulares que retornam um valor boolean, obtendo um tipo e dizendo ao TypeScript se ele pode ser reduzido a algo mais específico. Os Type Guards têm a propriedade única de garantir que o valor testado seja de um tipo definido dependendo do boolean retornado. O comandos **typeof** e **instanceof** são exemplos de Type Guards.
>
> <br />
>
> <div align="left"><img src="https://i.imgur.com/izFuHID.png" title="source: imgur.com" width="30px"/> <a href="https://www.typescriptlang.org/docs/handbook/2/narrowing.html" target="_blank"><b>Documentação: Narrowing</b></a></div>
>
> <br />

<br />

## <img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/> Exemplo 03: Funções com 2 tipos de retorno e argumentos



```ts
function divisao(numero1: number, numero2: number): number|null {
    let divisao = numero1 / numero2;
    return (divisao != Infinity ? divisao : null)
}
```

No exemplo acima, a Função **divisao** retorna um valor numérico caso a divisão seja realizada com sucesso, ou seja, o comando **return** retornará um numero, no exemplo acima, a divisão entre os 2 números. Caso contrário, a Função retornará nulo (null).

Veja a implementação abaixo:

```ts
let resposta: any;

resposta = divisao(4, 0);

if (resposta != null)
    console.log("O Resultado da divisão é: " + resposta);
else
    console.log("Não existe divisão por zero");

function divisao(numero1: number, numero2: number): number|null {
    let divisao = numero1 / numero2;

    return (divisao != Infinity ? divisao : null)
}
```

<br />

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Não existe divisão por zero
```

Observe que para definir o valor de retorno da Função, utilizamos um laço condicional para checar se o resultado da divisão é igual a `Infinity`, ou seja, se a divisão não é possível de ser realizada (divisão por zero, por exemplo).

Para receber o retorno da Função **divisao**, foi necessário criar uma variável do tipo **any**, que recebe qualquer tipo de valor. Antes de exibir o resultado, checamos se o valor de retorno é diferente de `null`. Caso seja, ao invés de exibir o resultado, será exibida uma mensagem informando que não foi possível processar a divisão. 

<br />

## <img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/> Exemplo 04: Funções com argumentos opcionais



```typescript
const resultado2 = somar(10, 20);
console.log(resultado2);

const resultado3 = somar(10, 20, 30);
console.log(resultado3);

function somar(numero1: number, numero2: number, numero3?: number): number{
    
    if(numero3 != undefined)
        return numero1 + numero2 + numero3;

    return numero1 + numero2;
}
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Soma com 2 parâmetros:  30
Soma com 3 parâmetros:  60
```

Observe que quando não é atribuído um valor para o terceiro parâmetro na chamada da Função, ele retornará `undefined`. Sem o Operador de Encadeamento Opcional, o TypeScript não aceitaria a chamada da Função sem atribuir um valor válido para o terceiro parâmetro.

<br />

## <img src="https://i.imgur.com/8eYS3Y6.png" title="source: imgur.com" width="3%"/> Exemplo 05: Função sem retorno - void



```ts
function mensagem(): void {
    console.log("Método sem retorno (void)!");
}
```

Funções **void** não retornam valor, apenas exibem uma mensagem na tela ou realizam algum tipo de processamento sem retornar nenhum valor. No exemplo acima, a Função **mensagem** está exibindo uma mensagem na tela.

Veja a implementação abaixo:

```ts
mensagem();

function mensagem(): void {
    console.log("Método sem retorno (void)!");
}
```

<br />

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Método sem retorno (void)!
```

<br />

<div align="left"><img src="https://i.imgur.com/izFuHID.png" title="source: imgur.com" width="30px"/> <a href="https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#functions" target="_blank"><b>Documentação - TypeScript: Funções</b></a></div>

<br />

<h2>2. Operador Spread (propagação)</h2>

O operador de espalhamento, representado por `...`, é uma funcionalidade do JavaScript (e, por conseguinte, do TypeScript) que permite expandir elementos de arrays ou objetos em contextos onde múltiplos elementos ou valores são esperados. É amplamente utilizado para copiar, combinar ou desestruturar arrays e objetos.

O TypeScript também implementa o Operador Spread (propagação), outra feature do ES6, que nos permite expandir arrays e outras expressões em locais onde vários parâmetros ou elementos são esperados. A sintaxe do Operador Spread é semelhante a sintaxe dos Parâmetros Rest, composta por 3 pontos (...) antes do nome do Array ou Expressão:

```typescript
const usuario: [string, number] = ['Márcia da Silva', 30];
console.log(...usuario);
console.log(usuario);
// Se necessário
const numeros: Array<number> = new Array<number>(1, 2, 3, 4, 5)
const [...resto] = numeros;
console.log(...resto)
```

**Resultado do Código:**

```bash
Márcia da Silva 30
['Márcia da Silva', 30]
1 2 3 4 5
```

O código define e manipula arrays e tuplas em TypeScript. Primeiro, ele cria uma tupla chamada `usuario` que contém uma string e um número, representando o nome e a idade de uma pessoa, respectivamente. A linha `console.log(...usuario);` usa o operador de espalhamento (spread operator) para expandir os elementos da tupla e exibi-los separadamente no console. Em seguida, `console.log(usuario);` imprime a tupla inteira, exibindo-a como um array contendo dois elementos.

Depois, o código declara um array de números chamado `numeros` usando a classe `Array` e o inicializa com os valores de 1 a 5. Em seguida, ele tenta usar o operador de espalhamento para criar um novo array chamado `resto` contendo os mesmos elementos do array `numeros`. A linha `const [...resto] = numeros;` é uma tentativa de usar o operador de espalhamento, mas está incorreta. A sintaxe correta para espalhar os elementos de um array é `const resto = [...numeros];`. Finalmente, `console.log(...resto);` exibe os elementos do array `resto` separadamente no console. Para que esse trecho de código funcione corretamente, a sintaxe deve ser corrigida.

<div align="left"><img src="https://i.imgur.com/izFuHID.png" title="source: imgur.com" width="30px"/> <a href="https://jorgedacostaza.gitbook.io/typescript-pt/future-javascript/spread-operator" target="_blank"><b>Documentação - TypeScript: Spread operator</b></a></div>

<h2>3. Interfaces</h2>

Interface é uma estrutura que define um contrato em seu aplicativo. Ela define a sintaxe para as classes. As classes derivadas de uma interface devem seguir a estrutura fornecida por sua interface. O compilador TypeScript não converte interface em JavaScript. Ele usa interface para verificação de tipo. Isso também é conhecido como "subtipagem estrutural". Uma interface é definida com a palavra-chave interface e pode incluir propriedades e declarações de métodos usando uma função ou uma Arrow Function.

```typescript
interface Pessoa{
 nome: string;
 sobrenome: string;
}

let pessoa1: Pessoa = {
 nome: 'Maria',
 sobrenome: 'Simões'
}

let pessoa2 = {
 nome: 'Juliana'
}

console.log(pessoa1);
console.log(pessoa2);
```

**Resultado do Código:**

```bash
{ nome: 'Maria', sobrenome: 'Simões' }
{ nome: 'Juliana' }
```

O código define uma interface chamada `Pessoa` em TypeScript, que especifica que um objeto do tipo `Pessoa` deve ter duas propriedades: `nome` e `sobrenome`, ambas do tipo `string`. Em seguida, ele cria um objeto `pessoa1` do tipo `Pessoa` com os valores `nome` e `sobrenome` atribuídos como 'Maria' e 'Simões', respectivamente. O código, então, cria outro objeto `pessoa2` com apenas a propriedade `nome` definida como 'Juliana'. Embora `pessoa2` possua a propriedade `nome`, ele não adere à interface `Pessoa` completamente, pois falta a propriedade `sobrenome`.

Por fim, o código utiliza `console.log` para exibir os objetos `pessoa1` e `pessoa2` no console. `pessoa1` será exibido corretamente com ambas as propriedades definidas, enquanto `pessoa2` será exibido sem a propriedade `sobrenome`, destacando que ele não segue totalmente a estrutura definida pela interface `Pessoa`. Se houvesse verificação de tipos em tempo de compilação, TypeScript geraria um erro para `pessoa2` por não cumprir com os requisitos da interface `Pessoa`.

<div align="left"><img src="https://i.imgur.com/izFuHID.png" title="source: imgur.com" width="30px"/> <a href="https://jorgedacostaza.gitbook.io/typescript-pt/future-javascript/spread-operator" target="_blank"><b>Documentação - TypeScript: Interfaces</b></a></div>

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="5%"/> <a href="https://github.com/rafaelq80/exemplos_js/tree/main/typescript/functions" target="_blank"><b>Código Fonte dos Exemplos</b></a></div>

<br />

------

## 🔑**Pontos chave:**

1. Uma função como um bloco de código reutilizável, escrito para executar um conjunto específico de tarefas sempre que necessário. Ela permite agrupar instruções relacionadas e executá-las como uma única unidade.  
2. Para definir uma função utilizamos a palavra-chave **function**. 
3. O corpo da função é escrito dentro do escopo, delimitado por um par chaves, semelhante aos Laços Condicionais de Repetição.
4. **Uma Função deve realizar apenas uma tarefa para facilitar os processos de testagem e depuração**;
5. Uma Função pode ter um ou mais tipos de retorno (number, boolean, String, entre outros) ou não retornar nada (void);
6. Um Método pode receber nenhum, um ou mais argumentos que correspondam a diferentes tipos de dados de entrada e esses dados podem ser processados e/ou utilizados dentro do código do método.
7. Um Argumento da Função pode ter mais de um tipo de dado.
8. Um **Método** é uma Função associada à Classe, ou seja, uma ação sobre um Objeto definido pela Classe. 
9. **Operador de Espalhamento**: Utilizado com `...` para expandir elementos de arrays ou objetos, facilitando a cópia, combinação ou passagem de argumentos.
10. **Interface TypeScript**: Define a estrutura de objetos, especificando propriedades e métodos, proporcionando tipagem estática e melhorando a verificação de tipos no desenvolvimento.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>	
