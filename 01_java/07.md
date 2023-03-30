<h1>Laços de Repetição</h1>

**Laços de Repetição**, também conhecidos como **Loops**, são estruturas que permitem a repetição de um trecho de código várias vezes dentro de sua estrutura, até que uma determinada condição seja satisfeita, ou infinitamente.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** A condição infinita deve ser evitada, porque ela pode gerar o travamento do seu sistema.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

**Exemplos:**

- **Enquanto numero for menor do que 10** 🡒 *Exibir na tela numero menor do que 10*
- **Enquanto resposta for diferente de S** 🡒 *Exibir na tela resposta é diferente de S*

Como pessoa desenvolvedora, você deverá conhecer e utilizar os Laços de Repetição sempre que tiver de estruturar sequências de ações que deverão ser executadas repetidamente. Apenas não esqueça de estabelecer uma condição para que o loop seja finalizado.

<h3>Por que utilizamos estruturas de repetição?</h3>

Imagine que uma determinada sequencia de execuções/processamentos devem ser repetidos por um número N de vezes, ou ainda, até que alguma condição seja satisfeita, indicando que a repetição deve parar. Essa é a função dos Laços de Repetição.

<h2>1. Tipos de Laços de Repetição</h2>

Em Java, existem 3 Laços de Repetição ou Loops:

1. **For**
2. **While**
3. **Do ... While**

Todas essas três opções de Laços de Repetição executam um conjunto de instruções repetidamente enquanto uma condição especifica permanecer verdadeira. 

Vale ressaltar que assim como nos Laços Condicionais, a aplicação de cada tipo de Laço de Repetição dependerá do contexto de utilização. Da mesma forma, essas estruturas também permitem inserir dentro dos seus blocos, a execução de:

- Cálculos;
- Laços Condicionais;
- Outros Laços de Repetição
- Entre outras operações...

<h3>1.1. O Laço de Repetição FOR</h3>

A estrutura **FOR** deve receber 3 parâmetros, sendo:

1. O **valor inicial** ou **expressão de inicialização**;
2. A **condição limite** ou **condição de teste**;
3. O **contador** ou **expressão de atualização**.

**Sintaxe:**

```java
for(valor inicial; condição limite ou teste; contador){
    // Bloco de comandos (corpo do laço de repetição)
}
```

**Onde:**

1. O **valor inicial**, deve ser uma variável do tipo inteiro. Esse valor inicial pode ser 0 ou qualquer outro número para iniciar a contagem, que pode ser incremental ou decremental.
2. A **condição limite**, é a condição escrita com os Operadores Relacionais, que define o limite do valor que pode ser atingido pela nossa variável iniciada no for. Nesta expressão, temos que testar a condição. Se a condição for avaliada como verdadeira, executaremos o **corpo do laço de repetição** e **atualizaremos o valor do contador**. Caso contrário, sairemos do laço.
3. Na variável **contador**, nós podemos ter 2 situações:
   - Caso o contador inicie em 0, podemos somar um valor no contador até que o limite seja atingido. Para isso utilizaremos o Operador de incremento (++).
   - Caso o contador inicie em 10, podemos subtrair um valor no contador até que o limite seja atingido (provavelmente 0). Para isso utilizaremos o Operador de decremento (--).

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** Assim como nos Laços Condicionais, no Laço de Repetição FOR o uso do escopo (chaves { }) é obrigatório apenas quando for executada mais de uma instrução, entretanto esta não é uma situação comum, pois geralmente os Laços de Repetição possuem várias instruções dentro do seu Bloco de comandos.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Na imagem abaixo, podemos visualizar o fluxograma básico do Laço de Repetição **FOR**:

<br>

<img src="https://i.imgur.com/xNGQtIG.png" title="source: imgur.com" width="3%"/>**Fluxograma:**

<div align="center"><img src="https://i.imgur.com/hOidSwK.png" title="source: imgur.com" /></div>

**Como o Laço de Repetição FOR é executado?**

1. O Laço de Repetição **FOR** é inicializado e o **valor inicial** é definido (variável inteira);
2. O fluxo salta para a **condição limite**;
3. A **condição limite** é testada;
   1. Se a Condição for verdadeira, o fluxo vai para o **corpo do laço de repetição**;
   2. Se a Condição for falsa, o fluxo **sai do laço**.
4. Caso a condição seja verdadeira, **as instruções dentro do corpo do laço de repetição são executadas**;
5. Após executar as operações do corpo do laço, o fluxo vai para o **contador e atualiza o seu valor** através do Operador de incremento ou decremento;
6. Na sequência, o fluxo vai para a etapa 3, testa a condição e repete o fluxo caso a condição seja verdadeira;
7. Caso a condição seja falsa, o Laço de Repetição FOR é finalizado e o fluxo sai do laço.

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>**Exemplo 01 - Laço de Repetição FOR**

Neste exemplo vamos criar um algoritmo que deve receber via teclado os nomes de 3 pessoas e exibir na tela.

Vamos criar uma primeira versão do código, sem utilizar o Laço de Repetição. Na sequência, vamos criar a segunda versão do código, utilizando o Laço de Repetição, para compararmos as 2 soluções:

**Código em Java - Versão sem o Laço de Repetição FOR:**

```java
public class Exemplo1 {

    public static void main(String[] args) {
        String nome1, nome2, nome3;
        Scanner leia = new Scanner(System.in);
        
        System.out.println("Digite o 1º nome: ");
        nome1 = leia.nextLine();
        System.out.println("O 1º nome é: " + nome1);
        
        System.out.println("\nDigite o 2º nome: ");
        nome2 = leia.nextLine();
        System.out.println("O 2º nome é: "  + nome2);
        
        System.out.println("\nDigite o 3º nome: ");
        nome3 = leia.nextLine();
        System.out.println("O 3º nome é: "  + nome3);
    }
```

Observe que nesta primeira versão do código, sem o Laço de repetição, foi necessário criar uma variável para cada nome, além dos comandos de entrada e saída, deixando o nosso código extenso e consumindo memória desnecessária com tantas variáveis.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/repeticao/src/estruturaRepeticao/Exemplo1.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

Vamos melhorar este código implementando o Laço de repetição For:

<img src="https://i.imgur.com/xNGQtIG.png" title="source: imgur.com" width="3%"/>**Fluxograma:**

<div align="center"><img src="https://i.imgur.com/Tx7bVag.png" title="source: imgur.com" /></div>

<br>

**Código em Java - Versão com Laço de Repetição FOR:**

```java
public class Exemplo1_1 {

    public static void main(String[] args) {
        String nome;
        int contador;
        Scanner leia = new Scanner(System.in);

        for (contador = 1; contador < 4; contador++) {
            System.out.println("\nDigite o " + contador + "º nome: ");
            nome = leia.nextLine();
            System.out.println("O " + contador + "º nome é: " + nome);
        }
    }
}
```

<br>

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Digite o 1º nome: 
João
O 1º nome é: João

Digite o 2º nome: 
Maria
O 2º nome é: Maria

Digite o 3º nome: 
Pietra
O 3º nome é: Pietra
```

Observe que nesta segunda versão do código, com o Laço de repetição, foi necessário criar apenas uma variável para receber os nomes, além de reduzir os comandos de entrada e saída, deixando o nosso código mais simples.

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="120px"/> | <div align="left">**DICA:** *Os Operadores utilizados para comparar e/ou escrever as condições do Laço de Repetição FOR estão disponíveis no conteúdo: <a href="https://github.com/rafaelq80/cookbook_java/blob/main/05.md" target="_blank">Operadores</a>. Caso você tenha alguma dúvida, não deixe de rever este conteúdo!*</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/repeticao/src/estruturaRepeticao/Exemplo1_1.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br /><br />

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>**Exemplo 02 - Laço de Repetição FOR - Tabuada**

Neste exemplo, vamos construir um programa que recebe um número inteiro via teclado e exibe na tela a tabuada deste número.

<img src="https://i.imgur.com/xNGQtIG.png" title="source: imgur.com" width="3%"/>**Fluxograma:**

<div align="center"><img src="https://i.imgur.com/cPCl8L8.png" title="source: imgur.com" /></div>

<br>

**Código em Java:**

```java
public class Exemplo2 {

    public static void main(String[] args) {
        int numero, contador;
        Scanner leia = new Scanner(System.in);

        System.out.println("Digite a Tabuada que você deseja calcular: ");
        numero = leia.nextInt();

        for (contador = 1; contador <= 10; contador++) {
            System.out.println(numero + " x " + contador + " = " + numero * contador);
        }
    }
}
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Digite a Tabuada que você deseja calcular: 
5
5 x 1 = 5
5 x 2 = 10
5 x 3 = 15
5 x 4 = 20
5 x 5 = 25
5 x 6 = 30
5 x 7 = 35
5 x 8 = 40
5 x 9 = 45
5 x 10 = 50
```

Observe no código acima, que para calcular a tabuada **multiplicamos o número digitado pelo contador**. A **variável X (variável contadora), foi inicializada com o valor 1**. A condição que será testada é **enquanto X for menor ou igual 10** (Tabuada inicia em 1 e termina em 10). A operação incremental **somar mais 1 ao valor anterior de X** é o nosso **contador**.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/repeticao/src/estruturaRepeticao/Exemplo2.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

<h3>1.2. O Laço de Repetição WHILE</h3>

**WHILE** é um Laço de Repetição, geralmente utilizado quando não conhecemos o valor final da condição dessa repetição.

**Sintaxe:**

```java
while(condição limite){
     // Bloco de comandos (corpo do laço de repetição)
}
```

O Laço de Repetição **WHILE** permite que o código seja executado repetidamente com base em uma determinada condição booleana. Ele pode ser considerado uma instrução **IF** de repetição. Observe que diferente do Laço de Repetição **FOR**, o laço **WHILE** possui apenas a **condição limite** em seus parênteses. 

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** Assim como nos Laços Condicionais, no Laço de Repetição WHILE o uso do escopo (chaves { }) é obrigatório apenas quando for executada mais de uma instrução, entretanto esta não é uma situação comum, pois geralmente os Laços de Repetição possuem várias instruções dentro do seu Bloco de comandos.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br>

Na imagem abaixo, podemos visualizar o fluxograma básico do Laço de Repetição **WHILE**:

<div align="center"><img src="https://i.imgur.com/uMLXcJD.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Atenção aos Detalhes. Os exemplos apresentados com o Laço FOR, também podem ser resolvidos com o Laço WHILE. O inverso não é verdadeiro, porque a maioria dos casos resolvidos com o Laço WHILE não podem ser resolvidos com o Laço FOR.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br>

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>**Exemplo 03 - Laço de Repetição WHILE**

Vamos escrever um programa que lê dois valores via teclado e efetua a soma dos dois valores. O programa deverá exibir na tela o resultado da soma e perguntar se deseja realizar uma nova soma com outros 2 números. Este processo deve ser repetido até que o usuário digite a letra '**n**' na resposta da pergunta acima, indicando que não deseja mais realizar novos cálculos.

<img src="https://i.imgur.com/xNGQtIG.png" title="source: imgur.com" width="3%"/>**Fluxograma:**

<div align="center"><img src="https://i.imgur.com/QIwIeeE.png" title="source: imgur.com" /></div>

<br>

**Código em Java:**

```java
public class Exemplo3 {

    public static void main(String[] args) {
        String continua = "s";
        int numero1, numero2, resultado;
        Scanner leia = new Scanner(System.in);

        while (!continua.equals("n")) {
            System.out.println("Digite primeiro valor: ");
            numero1 = leia.nextInt();

            System.out.println("Digite segundo valor: ");
            numero2 = leia.nextInt();

            resultado = numero1 + numero2;

            System.out.println("O resultado da soma é: " + resultado);

            System.out.println("\n++++++++++++++++MENU++++++++++++++++++");
            System.out.println("\nDeseja somar dois valores?");
            System.out.println("\nDigite s para sim OU digite n para não: ");
            continua = leia.next();
            System.out.println("++++++++++++++++++++++++++++++++++");
        }
    }
}
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Digite primeiro valor: 
1
Digite segundo valor: 
2
O resultado da soma é: 3

++++++++++++++++MENU++++++++++++++++++

Deseja somar dois valores?

Digite s para sim OU digite n para não: 
s
++++++++++++++++++++++++++++++++++
Digite primeiro valor: 
3
Digite segundo valor: 
4
O resultado da soma é: 7

++++++++++++++++MENU++++++++++++++++++

Deseja somar dois valores?

Digite s para sim OU digite n para não: 
n
++++++++++++++++++++++++++++++++++
```

Observe que criamos e inicializamos a variável **continua** fora do Laço de Repetição **WHILE**, para criar a condição de saída do laço, diferente do Laço de Repetição **FOR**, onde a variável foi criada no próprio laço. Isso nos permite, por exemplo, inicializar a nossa variável com um valor ou ler via teclado um valor que indicará quando a repetição deve ser finalizada.

Também é possível utilizar essa estrutura para executar por N vezes a repetição, semelhante ao Laço de Repetição **FOR**.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/repeticao/src/estruturaRepeticao/Exemplo3.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br /><br />

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>**Exemplo 04 - Laço de Repetição WHILE**

Agora vamos escrever um programa que lê 3 números via teclado, multiplica cada numero por 3 e mostra na tela o resultado de cada cálculo.

**Código em Java:**

```java
public class Exemplo4 {

    public static void main(String[] args) {
        int resultado, numero, contador = 1;
        Scanner leia = new Scanner(System.in);

        while (contador < 4) {
            System.out.println("Digite o " + contador + "º número:");
            numero = leia.nextInt();

            resultado = numero * 3;
            System.out.println(numero + " x 3 = " + resultado);
            System.out.println(
                "\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n");
            contador++;
        }
        System.out.println("\t\t_________Fim do programa_________");
    }
}
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Digite o 1º número:
1
1 x 3 = 3

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Digite o 2º número:
2
2 x 3 = 6

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Digite o 3º número:
3
3 x 3 = 9

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        _________Fim do programa_________
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/repeticao/src/estruturaRepeticao/Exemplo4.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br />

<h3>1.3. O Laço de Repetição DO... WHILE</h3>

Todos nós já tivemos uma pessoa próxima que primeiro faz e depois pergunta, correto. Essa pessoa é o **DO WHILE**, ele executa ao menos uma vez o código, isso porque ele primeiro executa o laço a primeira vez e depois verifica a condição.

```java
do{
     // Bloco de comandos (corpo do laço de repetição)
} while (condição limite);
```

Observe na sintaxe desse laço, que comparando com os outros Laços de Repetição, o **DO... WHILE** possui a estrutura invertida, isso porque ele é controlado pela saída. Isso significa que o **DO WHILE** avalia sua condição limite na parte inferior do loop após executar as instruções dentro do seu corpo.

Com isso, podemos perceber **que o bloco de comando do DO WHILE sempre será executado pelo menos uma vez!**

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** Assim como nos Laços Condicionais, no Laço de Repetição DO... WHILE o uso do escopo (chaves { }) é obrigatório apenas quando for executada mais de uma instrução, entretanto esta não é uma situação comum, pois geralmente os Laços de Repetição possuem várias instruções dentro do seu Bloco de comandos.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br>

Na imagem abaixo, podemos visualizar o fluxograma básico do Laço de Repetição **DO... WHILE**:

<div align="center"><img src="https://i.imgur.com/MtAkWhP.png" title="source: imgur.com" /></div>

<br />

Para entendermos melhor essa diferença, vamos escrever um programa com o laço **WHILE** e na sequência vamos reescrever o mesmo programa com o laço **DO WHILE**, para visualizar as diferenças entre os comportamentos dos dois laços.

<br />

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/>**Exemplo 05 - Laço de Repetição WHILE**

Vamos escrever um programa que lê um número via teclado e multiplica ele por 5, até o contador atingir o valor limite menor ou igual a 2, iniciando o nosso contador em 3.

<img src="https://i.imgur.com/xNGQtIG.png" title="source: imgur.com" width="3%"/>**Fluxograma:**

<div align="center"><img src="https://i.imgur.com/W4yikog.png" title="source: imgur.com" /></div>

<br>

**Código em Java:**

```java
public class Exemplo5 {

    public static void main(String[] args) {

        int numero, resultado, contador = 3;
        Scanner leia = new Scanner(System.in);

        while (contador <= 2) {
            System.out.println("\nDigite um número inteiro: ");
            numero = leia.nextInt();
            resultado = numero * 5;
            System.out.println("\nO resultado da multiplicação é: " + resultado);
        }
    }
}
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

Observe que o código acima irá **falhar!** Por um simples motivo: **a variável contador é maior do que 2**. Logo o Laço não será executado.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/repeticao/src/estruturaRepeticao/Exemplo5.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<br>

Vamos reescrever o mesmo código, utilizando o Laço de repetição **Do... While**:

## <img src="https://i.imgur.com/gsSDe7P.png" width="4%"/> **Exemplo 06 - Laço de Repetição DO... WHILE**

```java
public class Exemplo6 {

    public static void main(String[] args) {

        int numero, resultado, contador = 3;
        Scanner leia = new Scanner(System.in);

        do {
            System.out.println("\nDigite um número inteiro: ");
            numero = leia.nextInt();

            resultado = numero * 5;

            System.out.println("\nO resultado da multiplicação é: " + resultado);

        } while (contador <= 2);
    }
}
```

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Digite um número inteiro: 
5

O resultado da multiplicação é: 25
```

Ao executar o código acima, teremos o bloco de código dentro do laço **DO**, que será executado pelo menos uma vez, mesmo que o valor da condição seja falsa. Essa estrutura é válida quando precisamos gerar um processamento ou uma saída na tela pelo menos uma vez, antes de testar a condição. Após executar o laço uma vez, a condição da instrução **WHILE** será validada.

Um exemplo prático do mundo real, seria criar um formulário contendo o campo telefone, que deve ser exibido ao menos uma vez, mas ainda assim podemos repetir mais campos de telefone caso o usuário queira registrar mais de um número de telefone. Outro uso do Laço de Repetição **DO... WHILE** é a construção de menus, porque ele garante que o Menu será exibido na tela pelo menos uma vez.

<br>

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/blob/main/repeticao/src/estruturaRepeticao/Exemplo6.java" target="_blank"><b>Código Fonte do Exemplo</b></a></div>

<BR>

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ALERTA DE BSM:** Mantenha a Orientação ao Futuro. Realizar a prática dos exercícios aqui apresentados vai tornar seu aprendizado ainda mais assertivo. Não deixe de praticar e experimentar fazer mudanças nos parâmetros dos exemplos, para compreender o funcionamento dos Laços de Repetição. </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

------

## 🔑**Pontos chave:**

1. Os Laços de repetição são estruturas de programação extremamente importantes. Eles permitem repetir uma ou mais instruções várias vezes sem a necessidade de elaborar uma grande quantidade de código.
2. O Laço de repetição **for** permite definir o número de iterações que o código será executado. Também costuma ser utilizado para iterar estruturas de dados que exploraremos mais adiante.
3. O Laço de repetição **while** avaliam uma condição lógica e, enquanto a condição for avaliada como verdadeira, o código dentro do laço será executado.
4. O Laço de repetição **do... while** funciona de maneira semelhante ao Laço de repetição **while**, com a diferença de que o código dentro do bloco sempre será executado pelo menos uma vez. A condição lógica é avaliada no final do bloco de código. Se a condição for verdadeira, o loop será executado repetidamente até que a condição seja falsa.

<br />

<br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
