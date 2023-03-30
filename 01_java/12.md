<h1>Tratamento de erros no Java - Exceptions</h1>



Componentes de software podem ter problemas durante a execução e gerar erros como:

- Terminar o programa;
- Retornar uma mensagem de erro indicando uma falha;
- Retornar e ignorar o problema;
- Chamar um método para tratar o erro, entre outras.

Os problemas mais comumente encontrados são:

- Falha na aquisição de um recurso (new, open...);
- Tentativa de fazer algo impossível (divisão por zero, índice de um array inválido...);
- Outras condições inválidas (lista vazia, overflow...).

Para contornar estes empecilhos, utilizamos o recurso chamado **Exceções (Exceptions)**.

<br />

<h2>1. Exceptions</h2>



As **Exceções** (Exceptions) são uma indicação de um problema que ocorre durante a execução de um programa, ou seja, são eventos que interrompem o fluxo normal de processamento de uma classe causando um erro na aplicação. 

Na Linguagem Java, é possível tratar as exceções, que normalmente interromperiam a execução da aplicação, de forma que o programa continue funcionando ou termine de forma elegante, tornando o código muito mais robusto e confiável.

As Exceções na Linguagem Java são Objetos criados a partir de Classes especiais, que são “disparados” quando ocorrem condições excepcionais durante a execução do código. 

<h3>1.1 Tipos de erros</h2>
Os erros que acontecem nas aplicações Java estão classificados em 3 categorias:

1. **Erros de lógica:** Esta categoria abrange erros na construção do Algoritmo. Este tipo de erro devem ser corrigidos pelo programador

	**Exemplos:** Limites do vetor ultrapassados, divisão por zero, entre outros;

2. **Erros devido a condições do ambiente de execução:** Esta categoria abrange erros na infraestrutura onde a aplicação está sendo executada. Este tipo de erro foge do controle da pessoa desenvolvedora, mas podem ser contornados em tempo de execução;

	**Exemplos:** arquivo não encontrado, rede fora do ar, entre outros;

3. **Erros graves:** São erros que simplesmente travam o sistema e não há nada o que fazer. Este tipo de erro foge do controle da pessoa desenvolvedora e não podem ser contornados;

	**Exemplos:** falta de memória, erro interno do Java, entre outros.

As Exceções tem como foco principal tratar os erros do tipo 1, ou seja, erros de lógica, como veremos no exemplo abaixo:

<br />

<img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/>**Exemplo 01 - Divisão entre 2 números inteiros:** 

```java
package exceptions;

import java.util.Scanner;

public class Divisao {

	static Scanner ler = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		int dividendo = 0;
		int divisor = 0;
			
		System.out.println("Digite o Dividendo: ");
		dividendo = ler.nextInt();
				
		System.out.println("Digite o Divisor: ");
		divisor = ler.nextInt();
				
		divide(dividendo, divisor);
		
	}

	public static void divide(int dividendo, int divisor) {
		System.out.println("Divisão = " + (dividendo / divisor));
	}

}
```

O código acima, é um programa simples, que recebe 2 números inteiros e chama um método chamado dividir(), que fará a divisão entre estes 2 número. Execute o código acima e digite os valores 10 e 0.

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

<div align="center"><img src="https://i.imgur.com/aTXz9R1.png" title="source: imgur.com" /></div>

Na imagem acima, vemos que foi disparada uma exceção: **ArithmeticException** (indicado por uma seta amarela), informando que aconteceu algum erro em uma operação aritmética (cálculo matemático) e na sequência o programa é finalizado sem dar a oportunidade de contornar o erro. No exemplo acima, a exceção indica que não é possível efetuar a divisão de um número por zero.

Execute o código novamente e experimente inserir uma String ao invés de um numero no segundo valor. 

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

<div align="center"><img src="https://i.imgur.com/IT55yyi.png" title="source: imgur.com" /></div>

Na imagem acima, vemos que desta vez foi disparada uma outra exceção: **InputMismatchException** (indicado por uma seta amarela), informando que aconteceu algum erro na entrada de dados da aplicação e na sequência o programa é finalizado sem dar a oportunidade de contornar o erro. No exemplo acima, a exceção indica que a Classe Scanner estava aguardando por um número inteiro e recebeu uma String.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/exceptions/exceptions_v1" target="_blank"><b>Código fonte: Exemplo 01</b></a></div>

<br />

Quando uma exceção é lançada sem nenhum tipo de tratamento, ela interrompe o **fluxo normal** do programa, como vimos nos 2 exemplos acima. Se o método onde o erro aconteceu não capturar a exceção, ela será **propagada** para o método que chamar esse método e assim por diante. Se **ninguém** capturar a exceção, ela causará o término da aplicação. Agora se em algum lugar ela for capturada, **o controle da aplicação pode ser recuperado**.

Um bom **Sistema de Tratamento de Exceções** procura sempre atender a 3 princípios fundamentais: 

- Se antecipar aos problemas (uma das tarefas da pessoa desenvolvedora);
- Reverter situações de erro que podem ser revertidas;
- Buscar a **Solução ideal** para o tratamento de problemas de forma isolada do código principal.

Com o tratamento de exceções, o programa captura e trata o erro, isto é, lida com a exceção. Para capturar e lidar com as exceções o Java utiliza a estrutura **try-catch-finally**.

<br />

<h2>2. Estrutura try-catch-finally</h2>

A estrutura **try-catch-finally** é utilizada pelo Java para capturar e tratar um erro ou exceção. Ela é composta por 3 estruturas básicas:

- **try:** é usada para indicar um bloco de código que possa lançar (throw) uma exceção. Caso ocorra uma exceção em algum ponto, o restante do código contido no bloco <em>try</em> não será executado. O bloco <em>try</em> não pode ser declarado sozinho, portanto, precisa estar seguido de um ou vários blocos <em>catch</em> e/ou de um bloco <em>finally</em>.
- **catch:** serve para manipular as exceções, ou seja, tratar o erro. Esse bloco será executado somente se o bloco <em>try</em> apresentar alguma exceção. Numa estrutura try-catch-finally você pode criar um ou mais blocos <em>catch</em>, porém, será executado apenas o primeiro bloco que identificar a exceção.
- **finally:** é um bloco opcional, mas caso seja construído, quase sempre será executado, a menos que seja forçada sua parada, por exemplo, com um System.exit(0), no catch (finalizar a aplicação independente do que estiver sendo processado). Dentro do bloco finally, poderá conter outros blocos try-catch, bem como outro <em>finally</em>. Geralmente utilizamos o bloco finally quando precisamos executar algum código independente se ocorrer a exception ou não.

Na imagem abaixo, vemos a sintaxe da estrutura try-catch-finally dentro do código Java:

<div align="center"><img src="https://i.imgur.com/Uwvqs3q.png" title="source: imgur.com" /></div>

O **Bloco try** contém o código que pode lançar (throw) uma exceção. Ele consiste na palavra – chave try seguida por um bloco de código entre chaves.

O **Bloco Catch** captura e trata uma exceção. Ele começa com a palavra-chave catch. Dentro dos parênteses deve ser inserido o parâmetro de exceção, que identifica o tipo da exceção, ou seja, um Objeto da classe ou subclasse da possível exceção. O bloco de código entre as chaves será executado quando uma exceção do tipo indicado no parâmetro ocorre, ou seja, o que fazer em caso de erro.

O **Bloco Finally** se for construído, quase sempre será executado. Geralmente ele contém código de liberação de recursos do sistema. **Exemplo:** finalizar a conexão com uma Banco de dados

Na imagem abaixo, vemos a sintaxe da estrutura try-catch-finally dentro do código Java:

<div align="center"><img src="https://i.imgur.com/hORZemU.png" title="source: imgur.com" /></div>

<br />

<h3>2.1 O comando de Saída System.err.println()</h3>

O comando de Saída **System.err.println()** funciona da mesma forma que O comando de Saída System.out.println(). A principal diferença é que este comando é usado principalmente para exibir os erros de exceção no console. Alguns programas (como o Eclipse) mostrarão o texto na cor vermelha, para tornar mais óbvio que é uma mensagem de erro.

Vamos implementar o tratamento de exceções no exemplo 01:

<br />

<img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/>**Exemplo 02 - Divisão entre 2 números inteiros com tratamento de exceções:** 

```java
package exceptions;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Divisao {

	static Scanner ler = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		int dividendo = 0;
		int divisor = 0;
		boolean loop = true;
		
		do {
			
			try {
				System.out.println("Digite o Dividendo: ");
				dividendo = ler.nextInt();
						
				System.out.println("Digite o Divisor: ");
				divisor = ler.nextInt();
						
				divide(dividendo, divisor);
				
				loop = false;
				
			}catch(InputMismatchException e){
				System.err.println("\nExceção: " + e);
				ler.nextLine();
				System.out.println("\nDigite valores inteiros!");
			}catch(ArithmeticException e){
				System.err.println("\nExceção: " + e);
				ler.nextLine();
				System.out.println("\nDigite Numeros inteiros positivos!");
			}finally{
                System.out.println("\nSempre serei executada!\n");
            }
		
		}while (loop);
	}

	public static void divide(int dividendo, int divisor) {
		System.out.println("Divisão = " + (dividendo / divisor));
	}

}
```

Execute o código acima e digite os valores 10 e 0, novamente.

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

<div align="center"><img src="https://i.imgur.com/ogfx67U.png" title="source: imgur.com" /></div>

<br />

Observe na imagem acima que a exceção: **ArithmeticException**  (indicado pela seta rosa), foi disparada, mas desta vez foi exibida uma mensagem personalizada de alerta sobre o erro (indicada pela seta amarela). Como implementamos o bloco **finally**, também será exibida a mensagem criada dentro do bloco (indicada pela seta azul) e o programa será reiniciado (seta verde), solicitando uma nova entrada de dados. 

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **IMPORTANTE:** *Para ocultar a Exceção que foi disparada (linha indicada pela seta rosa), e exibir apenas a mensagem personalizada, basta não exibir no console o conteúdo da variável e, que armazena a Exceção capturada.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

Experimente inserir uma String ao invés de um numero no segundo valor. 

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

<div align="center"><img src="https://i.imgur.com/bkfjBs3.png" title="source: imgur.com" /></div>

Observe na imagem acima que a exceção: **InputMismatchException**  (indicado pela seta rosa), foi disparada, mas desta vez foi exibida uma mensagem personalizada de alerta sobre o erro (indicada pela seta amarela). Como implementamos o bloco **finally**, também será exibida a mensagem criada dentro do bloco (indicada pela seta azul) e o programa será reiniciado (seta verde), solicitando uma nova entrada de dados. 

Experimente inserir os valores 10 e 2:

<div align="center"><img src="https://i.imgur.com/JyB90KA.png" title="source: imgur.com" /></div>

Observe na imagem acima que nenhuma exceção foi disparada e o cálculo da divisão foi efetuado com sucesso. Entretanto, como implementamos o comando **finally**, a mensagem (indicada pela seta azul) continuará sendo exibida, mesmo que nenhuma exceção seja disparada.

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/essential/exceptions/handling.html" target="_blank"><b>Documentação: Try..Catch..Finally</b></a></div>

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/7/docs/api/java/util/InputMismatchException.html" target="_blank"><b>Documentação: Classe InputMismatchException</b></a></div>

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/7/docs/api/java/lang/ArithmeticException.html" target="_blank"><b>Documentação: Classe ArithmeticException</b></a></div>


<br /><br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/exceptions/exceptions_v2" target="_blank"><b>Código fonte: Exemplo 02</b></a></div>

<br />

<h2>3. A Classe Exceptions</h2>

Como vimos no exemplo anterior, foram tratadas 2 Exceções dentro da aplicação: **ArithmeticException** **InputMismatchException**. De onde vieram estas Exceções? a resposta é a Classe **Exceptions**, que é uma Sub-Classe da Classe **Throwable**. Veja na imagem abaixo, a hierarquia da Classe Throwable:

<div align="center"><img src="https://i.imgur.com/1RGpZnI.png" title="source: imgur.com" /></div>

- **Throwable:** É a Super Classe (Classe mãe) de todos os Erros e Exceções.
- **Error:** Não são exceções, e sim erros que jamais poderiam ter acontecido, como estouro da memória (**Out Of Memory Error**), por exemplo.
- **Exception:** São as classes que deveriam aqui, lançar exceções e não erros de programação. **Exemplo:** tentar abrir um arquivo que não existe. 
- **RuntimeException**: São exceções que indicam erros de programas (não de lógica, pois senão não passaria pelo compilador).
- **IOException**: São exceções que indicam erros de entrada/saída por falha ou interrupção. **Exemplo:** interrupção ou falha na leitura de um arquivo em disco.

> As Exceções são Classificadas em 2 categorias:
>
> 1. As exceções que devem ser tratadas pela pessoa desenvolvedora e que são verificadas pelo compilador, são chamadas de **Checked Exception** ou **Exceção Verificada**. Este tipo de Exceção o tratamento é obrigatório. Todas as Exceções do tipo **IOException** são **Checked Exceptions**.
>
> 2. As exceções que podem ocorrer durante a execução do programa e não são verificadas pelo compilador, são chamadas de **Unchecked Exception** ou **Exceção não Verificada**. Geralmente estas Exceções são causadas por erros de lógica e o tratamento não é obrigatório. Todos os **Erros** e Exceções do tipo **RuntimeExceptions** são **Unchecked Exceptions**.

Na tabela abaixo, vemos as principais diferenças entre **Erros** e **Exceções**:

| Erros                                                        | Exceções                                                     |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Recuperar-se de um erro não é possível.                      | Podemos nos recuperar de exceções usando o bloco try-catch ou lançando exceções de volta para o chamador. |
| Todos os erros em java são do tipo não verificados.          | As exceções incluem tipos verificados e não verificados.     |
| Os erros são causados principalmente pelo ambiente em que o programa está sendo executado. | O próprio programa é responsável por causar exceções.        |
| Erros podem ocorrer em tempo de compilação, bem como em tempo de execução. <br />**Tempo de compilação:** erro de sintaxe. <br />**Tempo de execução:** erro lógico. | Todas as exceções ocorrem em tempo de execução, mas as exceções verificadas  são conhecidas pelo compilador, enquanto as não verificadas não são. |
| Eles são definidos no pacote **java.lang.Error.**            | Eles são definidos no pacote **java.lang.Exception**         |

<h3>3.2. Exceções Integradas</h3>

As exceções integradas são as exceções disponíveis nas bibliotecas Java, nos pacotes no pacote **java.lang.Error.** e no pacote **java.lang.Exception.**. Essas exceções são adequadas para explicar certas situações de erro. Na tabela abaixo, vemos as Exceções mais utilizadas:

<h4>3.1.1. Exceções do tipo Checked</h4>

| Exceção                    | Descrição                                                    | Exemplo                                                      |
| -------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **ClassNotFoundException** | Esta exceção é gerada quando tentamos acessar uma classe cuja definição não foi encontrada. | Na IDE, durante o desenvolvimento do código, ao tentar importar uma Classe que não existe, esta Exceção será disparada. |
| **FileNotFoundException**  | Esta exceção é gerada quando um arquivo não está acessível ou não abre. | Ao tentar abrir um arquivo externo que não existe, esta Exceção será disparada. |
| **NoSuchFieldException**   | Esta exceção é lançada quando uma classe não contém o Atributo ou variável especificada | Ao tentar acessar um Atributo que não existe na Classe, esta Exceção será disparada. |
| **NoSuchMethodException**  | Esta exceção é lançada ao acessar um método que não foi encontrado | Ao tentar acessar um Método que não existe na Classe, esta Exceção será disparada. |

<br />

<h4>3.1.2. Exceções do tipo Unchecked</h4>

| Exceção                            | Descrição                                                    | Exemplo                                                      |
| ---------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **ArithmeticException**            | Esta exceção é lançada quando ocorre uma condição excepcional em uma operação aritmética. | Se em uma divisão, o dividendo (segundo parâmetro) for igual a zero, esta Exceção será disparada. |
| **ArrayIndexOutOfBoundsException** | Esta exceção é lançada para indicar que um array foi acessado com um índice ilegal. | Se o índice passado for negativo ou maior ou igual ao tamanho da matriz, esta Exceção será disparada. |
| **NullPointerException**           | Esta exceção é gerada ao se referir aos membros de um objeto nulo. Nulo não representa nada. Para evitar esta exceção é muito comum utilizar a Classe  [Optional](https://github.com/rafaelq80/cookbook_java/blob/main/16.md). | Ao executar um Método que não seja do tipo void, se ele retornar um Objeto nulo, esta Exceção será disparada. |
| **NumberFormatException**          | Esta exceção é gerada quando um método não pode converter uma String em um formato numérico (int, float, double, entre outros). | Ao tentar converter uma String, que contém apenas letras em um número, esta Exceção será disparada. |
| **IllegalArgumentException**       | Esta exceção geralmente é utilizada para validar valores de parâmetros que não estão nas condições adequadas ao programa. | Se um parâmetro do seu método do tipo inteiro, nunca poderá ser maior do que 100, para evitar falhas no sistema, você pode fazer uso desta Exceção. |
| **IllegalStateException**          | Esta exceção lançará um erro ou mensagem de erro quando tentarmos invocar um Método específico em um momento inapropriado. | Ao adicionar um elemento em uma Estrutura de dados do tipo Fila, devemos garantir que a fila não esteja cheia, caso contrário esta Exceção será disparada. |

<br />


<h2>4. Throw</h2>

A **Cláusula throw lança uma exceção em qualquer ponto do código**, mas não exige que ela seja tratada pela Classe que está chamando o Método. Ela transfere o controle do fluxo para os métodos chamadores. A cláusula throw permite lançar exceções verificadas ou não verificadas.

A palavra-chave throw é usada principalmente para lançar exceções personalizadas, ou seja, uma Classe de Exceção criada pela pessoa desenvolvedora, para ser lançada em um erro específico, quando o Java não possui um tipo de Exceção Integrada adequado para o erro. Veja o exemplo abaixo:

<br />

<img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/>**Exemplo 03 - Cláusula Throw - Versão 01:** 

No exemplo abaixo, vamos construir uma aplicação para checar se uma pessoa está apta a dirigir:

```java
package exceptions;

import java.util.Scanner;

public class ChecaIdade {

	static Scanner leia = new Scanner(System.in);

	public static void main(String[] args) {

		int idade;
		
		System.out.println("\nDigite uma idade: ");
		idade = leia.nextInt();
		
		validarIdade(idade);
		
	}

	public static void validarIdade(int idade){
		
		if(idade < 18)
			throw new ArithmeticException("A Pessoa não pode dirigir!!");
		else
			System.out.println("A Pessoa pode dirigir!!");
	
	}

}
```

Execute o código acima e digite um valor menor do que 18 anos. O resultado você confere abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

```bash
Digite uma idade: 
12
Exception in thread "main" java.lang.ArithmeticException: A Pessoa não pode dirigir!!
	at exceptions.ChecaIdade.validarIdade(ChecaIdade.java:23)
	at exceptions.ChecaIdade.main(ChecaIdade.java:16)
```

<br />

Observe que a exceção: **ArithmeticException**  foi disparada dentro do Método **validarIdade()**, exibindo a mensagem padrão do erro e o programa foi finalizado imediatamente.

Ao executar a instrução **throw**, o programa tenta encontrar algum bloco **try**, que possua instrução **catch** correspondente ao tipo de exceção que foi lançada. Se encontrar uma correspondência, o controle será transferido para essa instrução, caso contrário o programa será finalizado. Vamos atualizar este código inserindo um Bloco **try...catch**.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/exceptions/exceptions_throw_v1" target="_blank"><b>Código fonte: Exemplo 03</b></a></div>

<br />

<img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/>**Exemplo 04 - Cláusula Throw - Versão 2:** 

```java
package exceptions;

import java.util.Scanner;

public class ChecaIdade {

	static Scanner leia = new Scanner(System.in);

	public static void main(String[] args) {

		int idade;
		boolean loop = true;
		
		do {
		
			try {
			
				System.out.println("\nDigite uma idade: ");
				idade = leia.nextInt();
					
				validarIdade(idade);
				
				loop = false;
				
			}catch(ArithmeticException e){
				System.out.println("\nDigite um número inteiro maior ou igual a 18!");
			}
			
		}while (loop);
		
	}

	public static void validarIdade(int idade){
		
		if(idade < 18)
			throw new ArithmeticException("A Pessoa não pode dirigir!!");
		else
			System.out.println("A Pessoa pode dirigir!!");
	
	}

}
```

Execute o código acima e digite um valor menor do que 18 anos. O resultado você confere abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

```bash
Digite uma idade: 
12

Digite um número inteiro maior ou igual a 18!

Digite uma idade:_ 
```

<br />

Observe que a exceção: **ArithmeticException** foi disparada dentro do Método **validarIdade()**, mas desta vez foi exibida a mensagem personaliazada: *"Digite um número inteiro maior ou igual a 18!"*. Além disso, o controle sobre o que fazer com o erro, foi transferido para o Bloco **try...catch**, que solicita ao usuário que digite uma nova idade maior ou igual a 18. Como foi implementado um Laço de repetição **do...while**, este processo se repetirá até que o usuário digite uma idade maior ou igual a 18.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/exceptions/exceptions_throw_v2" target="_blank"><b>Código fonte: Exemplo 04</b></a></div>

<br />

<h2>4. Throws</h2>

A **cláusula throws** especifica as **exceções que um método pode lançar**. Ela é inserida na assinatura do Método, depois da lista de parâmetros do método e antes do corpo do método. A cláusula throws contém uma lista separada por vírgulas das exceções. As exceções podem ser lançadas pelas instruções no corpo do método ou pelos métodos chamados. Veja o exemplo abaixo:

```java
public class TestaExcecao {

	public static void main(String[] args) throws Exception1, Exception2 {

	}

}
```

No exemplo acima, a clausula throws informa para a Classe que está chamando o Método, que este método pode lançar uma ou mais exceções no escopo do método. Isso obriga a fazer a captura dessa exception (<em>try-catch</em>) ou relançar a exceção com o comando ***throw***. Na assinatura do Método, pode ser inserida mais de uma exception na Cláusula throws. Veja o exemplo abaixo:

<br />

<img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/>**Exemplo 05 - Uso das Cláusulas Throws e Throw:** 

Vamos criar um novo projeto chamado **excecao_simples** e inserir a **Classe ExcecaoSimples** (Exceção personalizada), que será uma Classe do tipo Exception, criada pela pessoa desenvolvedora:

1. No lado esquerdo superior, na Guia **Package explorer**, clique com o botão direito do mouse sobre a pasta **src**, como indicado na figura abaixo:

<div align="center"><img src="https://i.imgur.com/uR6s0hm.png" title="source: imgur.com" /></div>

2. Na sequência, clique na opção **New 🡪 Class**.

<div align="center"><img src="https://i.imgur.com/5viAy85.png" title="source: imgur.com" /></div>

3. Na janela **New Java Class**, no item **Name**, digite o nome da Classe **ExcecaoSimples** e desmarque a opção **public static void main(String[] args)**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/IeLenJH.png" title="source: imgur.com" /></div>

4. Clique no botão **Finish** para concluir.

5. Insira o código abaixo na Classe **ExcecaoSimples**:

```java
package excecao_simples;

public class ExcecaoSimples extends Exception {

	private static final long serialVersionUID = 1L;
	
	public ExcecaoSimples () {}
    
	public ExcecaoSimples (String mensagem) {
		super(mensagem);
	}
}
```

A Classe **ExcecaoSimples** foi definida como uma herança da Classe **Exception**.

> **Herança** é um tipo de Relacionamento entre Classes no Java e uma das maiores vantagens da Programação Orientada a Objetos, permitindo que o código seja reutilizado. Em Java, é possível herdar **atributos** e **comportamentos** (**métodos**) de uma classe para outra. A palavra extends inserida na assinatura da Classe, indica que a Classe está herdando uma outra Classe.

Observe que foi definido dentro da **Classe ExcecaoSimples** o Atributo ` private static final long serialVersionUID = 1L `. Este Atributo é um identificador da versão Classe, utilizado para serializar e desserializar um Objeto de uma Classe que implementa a Interface `Serializable`. 

**Simplificando, usamos o atributo serialVersionUID para lembrar as versões de uma Classe que implementa a Interface Serializable, com o objetivo de  verificar se uma classe carregada e o objeto serializado são compatíveis, ou seja, se o Objeto foi gerado pela mesma versão da Classe.** Na prática, esse número seria a versão da sua Classe. Uma nova versão de uma Classe é criada sempre que você adicionar ou modificar um ou mais Atributos da Classe. Essa regra não vale para Métodos, porque a Serialização só leva em consideração os Atributos.

> **Serialização**
>
> É o processo onde o Java pega o valor de  cada atributo e  gera uma sequência de bytes. Junto com essa sequência de bytes é  acrescentado o `serialVersionUID`, que é um código de identificação (gerado via algoritmo hash), que será utilizado para identificar a versão atual da Classe.
>
> **Desserialização**
>
> É o processo inverso da Serialização, ou seja, o Java pega uma sequência de bytes e coloca nos atributos de um novo objeto. Antes de fazer isso,  ele verifica se o `serialVersionUID` salvo é igual ao serial do novo objeto que está sendo criado. Esse número é utilizado para  garantir que uma classe  carregada corresponde exatamente a um objeto serializado. Se nenhuma  correspondência do objeto for encontrada, então é lançada uma exceção do tipo **InvalidClassException**, ou seja, a versão do serial UID da classe não corresponde à do descritor de classe.
>
> Em tese, isso permite você salvar uma "fotografia" de um  Objeto, por  exemplo, num arquivo em disco e depois restaurar o objeto  com os mesmos  valores posteriormente.
>
> **Por que o Eclipse emite um aviso?**
>
> Para um objeto ser serializado ele precisa implementar a Interface `java.io.Serializable`. Se o Eclipse (ou alguma outra ferramenta que analisa o código), encontrar uma Classe que implementa a Interface `Serializable` direta ou indiretamente, ele entende que é uma boa prática especificar um `serialVersionUID`.
>
> Isso pode ocorrer se a classe:
>
> - Implementa a Interface `Serializable`;
> - Implementa uma Interface que estende (herda) a Interface `Serializable`;
> - Estende (herda) uma Classe que Implementa a Interface `Serializable`.
>
> No exemplo acima, a **Interface UserDetails** estende (herda) a **Interface Serializable**. Por isso que o Eclipse exige a inserção do Atributo **serialVersionUID** na Classe.
>

Na sequência, foram criados 2 Métodos Construtores, herdados da Classe Exception, onde o primeiro é um Construtor vazio e o segundo é um Construtor com o parâmetro **mensagem**, que permite personalizar a mensagem de erro. A Classe Exception possui outros Métodos Construtores com outros parâmetros, que podem ser utilizados conforme a sua necessidade.

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/7/docs/api/java/lang/Throwable.html" target="_blank"><b>Documentação: Classe Throwable</b></a></div>

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/7/docs/api/java/lang/Exception.html" target="_blank"><b>Documentação: Classe Exception</b></a></div>

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/7/docs/api/java/io/Serializable.html" target="_blank"><b>Documentação: Interface Serializable</b></a></div>

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="4%"/> <a href="https://www.oracle.com/br/technical-resources/articles/java/serialversionuid.html" target="_blank"><b>Documentação: <i>SerialVersionUID</i></b></a></div>

<br />
<br />


Na sequência, vamos criar a Classe **TestaExcecao**, para testarmos a nossa Classe **ExcecaoSimples**:

1. No lado esquerdo superior, na Guia **Package explorer**, clique com o botão direito do mouse sobre a pasta **src**, como indicado na figura abaixo:

<div align="center"><img src="https://i.imgur.com/uR6s0hm.png" title="source: imgur.com" /></div>

2. Na sequência, clique na opção **New 🡪 Class**.

<div align="center"><img src="https://i.imgur.com/5viAy85.png" title="source: imgur.com" /></div>

3. Na janela **New Java Class**, no item **Name**, digite o nome da Classe **TestaExcecao** e marque a opção **public static void main(String[] args)**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/R6tKy3L.png" title="source: imgur.com" /></div>

4. Clique no botão **Finish** para concluir.

5. Insira o código abaixo na **Classe TestaExcecao**:

```java
package excecao_simples;

public class TestaExcecao {

	public static void main(String[] args) throws ExcecaoSimples {

		String nomes[] = { "João", "Maria", "Pedro", "Manuela" };

		try {
			for (int i = 0; i < nomes.length; i++) {
				System.out.println(nomes[i]);
			}
		} catch (ArrayIndexOutOfBoundsException e) {
			System.err.println("\nExceção: " + e);
			System.out.println("\nPosição Inválida");
		}
		
		throw new ExcecaoSimples("Exceção Simples!");

	}

}

```

Observe que foi inserido no final do código a linha **throw new ExcecaoSimples("Exceção Simples!")**. Nesta linha, estamos lançando a exceção criada na **Classe ExcecaoSimples**, independente ter acontecido um erro, ou seja, ela será lançada de qualquer forma. Veja o resultado no console abaixo:

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Algoritmo:**

<div align="center"><img src="https://i.imgur.com/dZ2rsnQ.png" title="source: imgur.com" /></div>

Observe que mesmo a Exception **ArrayIndexOutOfBoundsException** não sendo disparada, a Exception ExceçãoSimples foi disparada. Ao utilizar o comando throw com uma Exception personalizada, automaticamente o Java nos obrigará a inserir a clausula **throws** na assinatura do Método, indicando que esta Exception poderá ser lançada.

Este recurso é útil quando queremos lançar uma exceção em um condicional, por exemplo, caso uma condição não seja satisfeita.

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/essential/exceptions/declaring.html" target="_blank"><b>Documentação: Throws</b></a></div>

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/essential/exceptions/throwing.html" target="_blank"><b>Documentação: Throw</b></a></div>

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/7/docs/api/java/lang/ArrayIndexOutOfBoundsException.html" target="_blank"><b>Documentação: Classe ArrayIndexOutOfBoundsException</b></a></div>

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_java/tree/main/exceptions/excecao_simples" target="_blank"><b>Código fonte: Exemplo 05</b></a></div>

<br />

<h2>5. Por que devemos tratar as Exceções?</h2>

Quando uma Exceção é tratada, estamos oferecendo alguma forma alternativa para continuar a execução do programa sem que ele seja finalizado devido ao erro. O tratamento de exceções desempenha um papel importante no desenvolvimento de uma aplicação concisa, limpa, legível e de fácil manutenção. 

<br />

------

## 🔑**Pontos chave:**

1. **Exceções** em Java são classes especiais utilizadas para manipular erros que podem surgir durante a execução.
2. *O* **bloco try/catch/finally** permite capturar exceções que podem ocorrer quando uma parcela de código ou função é executada.
3. A **cláusula throws** especifica as **exceções que um método pode lançar**. Ele é inserida na assinatura do Método, depois da lista de parâmetros do método e antes do corpo do método. A cláusula throws contém uma lista separada por vírgulas das exceções. As exceções podem ser lançadas pelas instruções no corpo do método ou pelos métodos chamados. 
4. A **cláusula throw lança uma exceção em qualquer ponto do código**, mas não exige que ela seja tratada por seus chamadores. Ela transfere o  controle do fluxo para os métodos chamadores. Ela usa o que se chama  **unckecked exception**, ou seja, uma exceção é lançada mas nada obriga ela  ser tratada.
5. Você também pode criar e lançar exceções personalizadas.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
