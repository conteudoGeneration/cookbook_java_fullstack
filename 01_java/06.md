<h1>Laços Condicionais</h1>

Laços Condicionais ou Estruturas de Decisão, são estruturas que nos ajudam na tomada de decisão. Nós utilizamos essas estruturas sempre que o programa tiver que executar uma sequência de ações que poderão ser executadas ou não, dependendo do resultado de um ou um conjunto de testes lógicos, que permitirá que um dos casos seja executado.

**Exemplos:**

- **Se o numero digitado for maior do que 10** 🡒 *Exibir na tela o número digitado é maior do que 10*
- **Se a média for maior do que 5 e menor do que 7** 🡒 *Exibir na tela alune de exame!*

Observe que para criar as condições lógicas, utilizaremos especialmente os **Operadores Relacionais** e **Lógicos**.

<h2>1. Tipos de Laços Condicionais</h2>

Existem 3 estruturas básicas de Laços Condicionais em Java:

1. **Estrutura IF**
2. **Estrutura IF / ELSE**
3. **Estrutura SWITCH CASE**

Vale reforçar que a aplicação de cada uma dessas estruturas dependerá do contexto de utilização. Além disso, essas estruturas também permitem inserir, dentro de seu escopo, a execução de:

- Cálculos;
- Outros Laços Condicionais;
- Entre outras estruturas e operações da Linguagem Java...

<h3>1.1. O Laço Condicional IF</h3>

O Laço Condicional **IF** é o laço condicional mais simples e um dos mais utilizados em situações em que se faz necessário **testar uma única condição e/ou variável**, que caso seja verdadeira, irá desencadear a execução de um ou mais processamentos ou saídas de dados.

**Sintaxe:**

```java
if(condição){
	// Executa alguma ação caso a condição seja verdadeira
}
```

Neste Laço Condicional temos basicamente um teste (condição) e um grupo de ações que somente acontecerão se a resposta for verdadeira. 

Para criar a condição, geralmente são utilizados os operadores da linguagem Java, principalmente os operadores relacionais. Na imagem abaixo, temos o Fluxograma básico do Laço Condicional IF:

<div align="center"><img src="https://i.imgur.com/6RcELpu.png" title="source: imgur.com" width="80%"/></div>

Observe que o comando A será executado somente se a condição for verdadeira (Sim) e na sequência os comandos B e C também serão executados. Caso a condição seja falsa (Não), o fluxo do programa continua normalmente executando apenas os comandos B e C.

Como exemplo prático vamos escrever um programa em Java que **valida se o valor das variáveis lógicas (boolean) X e Y são verdadeiras**.

A condição do IF está informada dentro do conjunto de parênteses ( *condição* ), tudo que está inserido dentro dos parênteses precisa ser verdadeiro para que as ações inseridas dentro bloco do **IF** sejam processadas. Caso a condição não seja verdadeira, as ações inseridas dentro do bloco **IF** serão ignoradas no momento da execução do código.

<br>

<img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>**Exemplo 01 - Estrutura Condicional IF**

<img src="https://i.imgur.com/xNGQtIG.png" title="source: imgur.com" width="3%"/>**Fluxograma:**

<div align="center"><img src="https://i.imgur.com/SFaLUpx.png" title="source: imgur.com" /></div>

**Código em Java:**

```java
public class Exemplo1 {

	public static void main(String[] args) {
		boolean x = true;
		boolean y = false;
		
		if(x == true) {
			System.out.println("X é verdadeiro");
		}
		
		if(y) {
			System.out.println("Y é verdadeiro");
		}
	}
}
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
X é verdadeiro
```

Observe que apenas o bloco que testa a variável **x** foi executado (a mensagem X é verdadeiro). O bloco que testa a variável **y** não foi executado, porque y é falso.

Observe que dentro dos parênteses, na **condição do segundo laço condicional if**, foi inserido apenas a variável **`y`** e nada mais. Por se tratar de uma variável do tipo **boolean**, ao inserir a variável **`y`** sozinha na condição do laço condicional if, é equivalente a escrever a condição: **`y == true`**. 

Para escrever a condição:  **`y == false`**, por exemplo, você poderia escrever da seguinte forma: **`!y`**. 

Lembre-se que o acento de exclamação, na Linguagem Java, representa o **Operador Lógico - Negação**.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/condicionais/src/estruturaCondicional/Exemplo1.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br />

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="120px"/> | <div align="left">**DICA:** *Os Operadores utilizados para comparar e/ou escrever as condições das estruturas que estudaremos estão disponíveis no conteúdo: <a href="05.md" target="_blank">Operadores</a>. Caso você tenha alguma dúvida, não deixe de rever este conteúdo!*</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Agora vamos ver um exemplo do Laço Condicional **IF**, utilizando os Operadores Relacionais:

<br>

<img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>**Exemplo 2 - Estrutura Condicional IF **

<img src="https://i.imgur.com/xNGQtIG.png" title="source: imgur.com" width="3%"/>**Fluxograma:**

<div align="center"><img src="https://i.imgur.com/12KtqiH.png" title="source: imgur.com" /></div>

**Código em Java:**

```java
public class Exemplo2 {

	public static void main(String[] args) {
		int n1 = 4, n2 = 3, n3 = 4;
		
		if(n1 < 5) {
			System.out.println("O número 1 é menor do que 5.");
		}
		
		if(n1 < n2) {
			System.out.println("O número 1 é menor do que o número 2.");
		}
		
		if(n1 == n3)
			System.out.println("O número 1 e o número 3 são iguais.");
	}
}
```

No código acima, no primeiro Laço Condicional **IF**, se o valor da variável **n1 for menor que 5**, será exibida uma mensagem. No segundo Laço Condicional **IF**, se o valor da variável **n1 for menor que o valor da variável n2**, será será exibida uma outra mensagem diferente da primeira. No terceiro Laço Condicional **IF**, se o valor da variável **n1 for igual ao valor da variável n3**, será exibida uma outra mensagem diferente das duas anteriores.

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
O número 1 é menor do que 5.
O número 1 e o número 3 são iguais.
```

Observe neste exemplo, que o terceiro Laço Condicional **IF** foi escrito **sem o uso das chaves (estas chaves são chamadas de escopo do laço condicional), para delimitar o bloco de código**. Neste caso, o algoritmo entende que *caso a condição seja verdadeira, apenas a primeira linha após o Laço Condicional deve ser executada* e apenas essa linha é condicionada ao laço condicional IF.

**Sintaxe:**

```java
// Laço Condicional IF com apenas uma ação - sem o escopo { }
if(condição)
	// Executa alguma ação caso a condição seja verdadeira

// Laço Condicional IF com mais de uma ação - com o escopo { }
if(condição){
	// Executa a primeira ação se a condição for verdadeira
	// Executa a segunda ação se a condição for verdadeira
}
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/condicionais/src/estruturaCondicional/Exemplo2.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br />

<h3>1.1.1. O Laço Condicional IF com duas ou mais condições</h3>

Vale reforçar também que a condição pode ser uma instrução simples ou uma instrução composta. Uma instrução composta consiste em duas ou mais condições que podem ser verdadeiras ou não, dependendo da lógica empregada, para que a ação seja executada.

**Sintaxe:**

```java
if (condição_A <operador lógico> condição_B) {	
    // Executa alguma ação caso a condição seja verdadeira
}
```

Para criar as duas ou mais condições, geralmente são utilizados os operadores relacionais em conjunto com os Operadores Lógicos da Linguagem Java.

<br>

<img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>**Exemplo 3 - Estrutura Condicional IF - Condição Composta**

<img src="https://i.imgur.com/xNGQtIG.png" title="source: imgur.com" width="3%"/>**Fluxograma:**

<div align="center"><img src="https://i.imgur.com/IjB5zFQ.png" title="source: imgur.com" /></div>

**Código em Java:**

```java
public class Exemplo3 {

	public static void main(String[] args) {
		int idade = 18;
		boolean carteiraM = true;
		
		if(idade >= 18 && carteiraM == true) {
			System.out.println("Você pode dirigir.");
		}
	}
}
```

Observe no código acima, que a mensagem **"Você pode dirigir."**, somente será exibida se as 2 condições forem satisfeitas:

- **Idade maior do que 18 anos;**
- **Possuir a Carteira de motorista.**

Como estamos utilizando o **Operador Lógico && (E lógico ou Conjunção)**, as 2 condições acima devem ser verdadeiras para que o teste lógico seja Verdadeiro.

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Você pode dirigir.
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/condicionais/src/estruturaCondicional/Exemplo3.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

<h3>1.2. O Laço Condicional IF/ELSE</h3>

A estrutura **IF** também permite a execução de um ou mais processamentos ou saídas de dados para o caso em que a condição do laço condicional não seja satisfeita (falso). Para executarmos operações, caso a condição seja falas, utilizaremos a instrução **ELSE** (Senão). 

A instrução **ELSE**, em conjunto com a estrutura **IF**, permite criar uma resposta tanto para a condição verdadeira, quanto para a condição falsa.

**Sintaxe:**

```java
if(condição){
    // Executa alguma ação caso a condição seja verdadeira
}else{
    // Executa alguma ação caso a condição anterior anterior seja falsa
}
```

Este Laço Condicional é muito utilizado em situações em que se faz necessário testar uma única condição/variável, que caso seja verdadeira, irá desencadear a realização de um ou mais comandos e caso seja falsa, irá desencadear um outro conjunto de um ou mais comandos. 

Temos então um teste e dois blocos de ações possíveis: 

- Um Bloco que será executado se a condição for verdadeira;

- Um outro Bloco que  será executado se a condição for falsa. 

Veja o Fluxograma básico desta estrutura:

<div align="center"><img src="https://i.imgur.com/mKnE9eA.png" title="source: imgur.com" width="80%"/></div>

Observe que o comando A será executado somente se a condição for verdadeira (Sim) e na sequência o comando C também será executado. O comando B será executado somente se a condição for falsa (Não) e na sequência o comando C também será executado.

<br>

<img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>**Exemplo 4 - Estrutura Condicional IF/ELSE**

<img src="https://i.imgur.com/xNGQtIG.png" title="source: imgur.com" width="3%"/>**Fluxograma:**

<div align="center"><img src="https://i.imgur.com/K048Umo.png" title="source: imgur.com" /></div>

**Código em Java:**

```java
public class Exemplo4 {

	public static void main(String[] args) {
		float nota1, nota2, media;
		Scanner leia = new Scanner(System.in);
		
		System.out.println("Digite a primeira nota: ");
		nota1 = leia.nextFloat();
		
		System.out.println("Digite a segunda nota: ");
		nota2 = leia.nextFloat();
		
		media = (nota1 + nota2)/2;
		
		if(media >= 6) {
			System.out.println("Parabéns, você foi aprovade!");
		}else {
			System.out.println("Infelizmente você foi reprovade...");
		}
	}
}
```

No exemplo acima, a condição **se a média for maior ou igual a 6**, resultará na saída: **Parabéns, você foi aprovade!** **Caso essa condição não seja atendida** (falsa), o bloco onde temos o **ELSE** será executado e resultará na saída: **Infelizmente você foi reprovade...**

Observe que apenas uma das duas saídas será executada e o **ELSE** só pode ser utilizado em um código onde previamente foi declarada a condição de um **IF**. Se a condição **media>=6 for verdadeira**, a **condição do ELSE não será executada**.

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

**Condição Verdadeira**

```bash
// Alune Aprovade
Digite a primeira nota: 
6
Digite a segunda nota: 
9
Parabéns, você foi aprovade!
```

**Condição Falsa**

```bash
// Alune Reprovade
Digite a primeira nota: 
4
Digite a segunda nota: 
4
Infelizmente você foi reprovade...
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/condicionais/src/estruturaCondicional/Exemplo4.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br />

<h3>1.2.1. Acrescentando mais opções - IF Encadeado</h3>

O Laço condicional IF permite incluir em um algoritmo quantos "IF's" forem necessários. Entretanto, nestes casos, o **ELSE** será uma condição obrigatória, que será executada caso todas as condições anteriores tenham sido descartadas por se tratarem de condições falsas. Para criar condições intermediárias dentro do Laço Condicional IF, utilizaremos a combinação **ELSE IF**.

**Sintaxe:**

```java
if(condição 1){
    // Executa alguma ação caso a condição seja verdadeira
}else if (condição 2){
    // Executa alguma ação caso a condição anterior seja falsa
}else if (condição N){
    // Executa alguma ação caso as condições anteriores sejam falsas
}else{
    // Executa alguma ação caso todas as condições anteriores sejam falsas
}
```

Este Laço Condicional é muito utilizado em situações em que se faz necessário testar várias condições/variáveis, onde cada condição é testada uma a uma até que uma delas seja satisfeita e o seu respectivo Bloco de comandos é executado. Se nenhuma condição for satisfeita, o Bloco **ELSE** será executado.

**Importante destacar que se uma condição for verdadeira, as demais condições do Laço Condicional não serão testadas.**

Vamos dar sequencia ao nosso exemplo anterior, acrescentando uma nova condição: **Alune em exame!**. 

**Condição:** *Para receber a mensagem: Alune de exame, a média deve ser igual a 5.*

<br>

<img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>**Exemplo 5 - Estrutura Condicional IF Encadeado**

<img src="https://i.imgur.com/xNGQtIG.png" title="source: imgur.com" width="3%"/>**Fluxograma:**

<div align="center"><img src="https://i.imgur.com/vHzCUpr.png" title="source: imgur.com" /></div>

**Código em Java:**

```java
public class Exemplo5 {

	public static void main(String[] args) {
		float nota1, nota2, media;
		Scanner leia = new Scanner(System.in);

		System.out.println("Digite a primeira nota: ");
		nota1 = leia.nextFloat();
	
		System.out.println("Digite a segunda nota: ");
		nota2 = leia.nextFloat();
	
		media = (nota1 + nota2)/2;
		
		if(media >= 6) {
			System.out.println("Parabéns, você foi aprovade!");
		}else if(media == 5){
			System.out.println("Alune de exame!");
		}else {
			System.out.println("Infelizmente você foi reprovade...");
		}
	}
}
```

Observe o código acima, que ele possui 3 condições:

**I.** *Se a condição **media maior ou igual a 6 for verdadeira**, será exibida a mensagem: **Parabéns, você foi aprovade!*** 

**II.** *Se a condição: **media igual a 5** for verdadeira, será exibida a mensagem: **Alune de exame!*** 

**III.** *Se **as duas condições anteriores forem falsas** (SENÃO), será exibida a mensagem: **Infelizmente você foi reprovade...***

<br>

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

**Média igual a 5**

```bash
// Alune de Exame
Digite a primeira nota: 
5
Digite a segunda nota: 
5
Alune de exame!
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/condicionais/src/estruturaCondicional/Exemplo5.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br />

<h3>1.3. Laço Condicional SWITCH CASE</h3>

**Switch Case**, também é um laço condicional, ou seja, uma estrutura de decisão, onde podemos através de premissas indicar qual ação deve-se ter conforme a opção escolhida. Em outras palavras, **Switch Case** é um Laço Condicional, que define o código a ser executado com base em uma comparação de valores.

**Sintaxe:**

```java
switch(variável ou valor){
    case valor1:
        // Executa alguma ação caso esta condição seja verdadeira
        break;
    case valor2:
        // Executa alguma ação caso esta condição seja verdadeira
        break;
    case valorN:
        // Executa alguma ação caso esta condição seja verdadeira
        break;
    default:
        // Opcional -  Executa alguma ação caso todas as condições acima forem falsas
}
```

O Laço Condicional **SWITCH CASE** representa de uma maneira mais simples o encadeamento de estruturas **IF**. É uma forma de reduzir a complexidade de várias estruturas **IF** encadeadas. O conteúdo da **variável** da cláusula do **SWITCH** é comparado com os valores constantes das cláusulas **CASE**, e caso uma das comparações seja verdadeira, o comando associado é executado (somente esse comando). Caso nenhuma comparação seja Verdadeira, a estrutura executará a cláusula **DEFAULT**. Este laço é muito utilizado na construção de Menus de opções, onde o usuário digita uma letra ou um número para a escolher um item do Menu.

**Importante destacar que caso uma condição seja verdadeira, as demais condições do Laço Condicional não serão testadas.**

É importante atentar-se que para cada caso teremos um comando chamado **BREAK**, para indicar que acabou as ações para essa opção. A única opção que não adicionaremos o **BREAK**, é a opção **DEFAULT**, que só será executada caso todas as opções anteriores sejam falsas. A opção **DEFAULT** não é obrigatória.

<div align="center"><img src="https://i.imgur.com/l8GbQB6.png" title="source: imgur.com" width="80%"/></div>

Observe que o comando A será executado somente se o Case valor 1 for verdadeiro (Sim). O comando B será executado somente se o Case valor 2 for verdadeiro (Sim). O comando C será executado somente se o Case valor 1 e o Case valor 2 forem falsos (Não)

**Algumas regras importantes para instruções SWITCH CASE:**

- Valores de cases duplicados não são permitidos.
- O valor para um case deve ser do mesmo tipo de dado que a variável inserida na instrução **switch**.
- O valor para um case deve ser uma constante ou literal. Variáveis ou testes lógicos não são permitidos.
- A instrução break é usada dentro do case para encerrar uma sequência de instruções.
- A instrução break é opcional. Se omitido, a execução continuará no próximo case.
- A instrução default é opcional.

Vamos construir no **Exemplo 6** um Menu com 3 opções. De acordo com o numero digitado, uma mensagem diferente será exibida na tela:

<br>

<img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>**Exemplo 6 - Estrutura Condicional SWITCH CASE**

<img src="https://i.imgur.com/xNGQtIG.png" title="source: imgur.com" width="3%"/>**Fluxograma:**

<div align="center"><img src="https://i.imgur.com/eVLYAG2.png" title="source: imgur.com" /></div>

**Código em Java:**

```java
public class Exemplo6 {

	public static void main(String[] args) {

		int opcao;
		Scanner leia = new Scanner(System.in);

		System.out.println("# ## ### #### #########   Menu   ########## #### ### ## #");
		System.out.println("\n--Digite 1 para ver Indicação de um Livro--");
		System.out.println("--Digite 2 para ver ler uma Frase Motivacional--");
		System.out.println("--Digite 3 para receber uma Indicação de música--");
		opcao = leia.nextInt();

		switch (opcao) {
		case 1:
			System.out.println("Livro: O Alquimista");
			break;
		case 2:
			System.out.println(
                "Frase motivacional: Se você cair, levante! Não dá para andar deitado.");
			break;
		case 3:
			System.out.println("Música: AURORA - No Cure For Me.");
			break;
		}
	}
}
```

Observe no código acima, que o comando **SWITCH**, recebe a **variável opcao**, que receberá o numero da opção escolhida pelo usuário.

Na sequência, cada um dos comandos **CASE** receberá uma das opções do menu:

- Caso escolhida a opção 1 então exiba o livro
- Caso escolhida a opção 2 então exiba a frase
- Caso escolhida a opção 3 então exiba a música

Note que temos apenas 3 opções para esse menu, mas poderíamos oferecer outras opções de escolha para o nosso usuário acrescentando mais condições.

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```
// Caso 2 Escolhido

# ## ### #### #########   Menu   ########## #### ### ## #

--Digite 1 para ver indicação de um livro--
--Digite 2 para ver ler uma frase motivacional--
--Digite 3 para receber uma indicação de música--
2
Frase motivacional: Se você cair, levante! Não dá para andar deitado.
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/condicionais/src/estruturaCondicional/Exemplo6.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br />

<h3>1.3.1. SWITCH CASE com a cláusula DEFAULT</h3>

Execute o Exemplo 06 e insira uma opção que não existe, por exemplo o numero 4.

Observe que não será exibida nenhuma mensagem na tela e o programa será finalizado.

Para resolver o problema do processamento sem resposta, podemos reescrever o código acima adicionando a opção **DEFAULT**, que vai exibir alguma mensagem na tela ou efetuar algum processamento sempre que o usuário digitar qualquer numero diferente de 1, 2 ou 3. Esta opção funciona como uma opção padrão, daí o nome **default**.

<br>

<img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>**Exemplo 7 - Estrutura Condicional SWITCH CASE - DEFAULT**

<img src="https://i.imgur.com/xNGQtIG.png" title="source: imgur.com" width="3%"/>**Fluxograma:**

<div align="center"><img src="https://i.imgur.com/eVLYAG2.png" title="source: imgur.com" /></div>

**Código em Java:**

```java
public class Exemplo7 {

	public static void main(String[] args) {

		int opcao;
		Scanner leia = new Scanner(System.in);

		System.out.println("# ## ### #### #########   Menu   ########## #### ### ## #");

		System.out.println("\n--Digite 1 para ver Indicação de um Livro--");
		System.out.println("--Digite 2 para ver ler uma Frase Motivacional--");
		System.out.println("--Digite 3 para receber uma Indicação de música--");
		opcao = leia.nextInt();

		switch (opcao) {
		case 1:
			System.out.println("Livro: O Alquimista");
			break;
		case 2:
			System.out.println(
                "Frase motivacional: Se você cair, levante! Não dá para andar deitado.");
			break;
		case 3:
			System.out.println("Música: AURORA - No Cure For Me.");
			break;
		default:
			System.out.println("Opção inválida!");
		}
	}
}
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```
// Opção Default executada

# ## ### #### #########   Menu   ########## #### ### ## #

--Digite 1 para ver indicação de um livro--
--Digite 2 para ver ler uma frase motivacional--
--Digite 3 para receber uma indicação de música--
4
Opção inválida!
```

Observe que ao executar o código com a instrução **default**, ao digitar p valor 4, será exibida uma mensagem na tela informando que a Opção digitada é inválida.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/condicionais/src/estruturaCondicional/Exemplo7.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br />

------

## 🔑**Pontos chave:**

1. O **Laço Condicional ou Fluxo de Controle** é um recurso extremamente importante da programação, pois facilita a criação de programas, que podem tomar decisões com base em condições definidas.
2. O **controle** e o **fluxo** de execução podem ser realizados por declarações **if-else** e declarações **switch**.
3. Dependendo das **condições** definidas com o uso do fluxo de controle, os programas podem obter resultados diferentes.
4. Quando as condições são numerosas, pode ser mais indicado utilizar a declaração **switch**, do que as declarações **if-else**.
5. Você pode aninhar condições se desejar verificar mais de uma condição em um bloco lógico.
6. É aconselhável, mas não obrigatório, definir um caso padrão em um bloco de declarações switch.

<br />

<br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>	
