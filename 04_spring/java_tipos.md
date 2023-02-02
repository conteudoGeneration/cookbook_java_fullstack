<h1>Tipos de Dados em Java</h1>

<h2>Tipos de dados primitivos</h2>

| Tipo        | Descrição                                                    |
| ----------- | ------------------------------------------------------------ |
| **byte**    | Tipo de dado inteiro composto por 8 bits. O valor minimo é -128 e o máximo é 127. |
| **short**   | Tipo de dado inteiro composto por 16 bits. O valor minimo é -32.768 e o máximo é 32.767. |
| **int**     | Tipo de dado inteiro composto por 32 bits. O valor minimo é -2.147.483.648 e o máximo é 2.147.483.648. O tipo int geralmente é utilizado em operações aritméticas para inteiros sem sinal. |
| **long**    | Tipo de dado inteiro composto por 64 bits. O valor minimo é -9.223.372.036.854.775.808 e o máximo é 9.223.372.036.854.775.808. O tipo int geralmente é utilizado em operações aritméticas para inteiros sem sinal. |
| **float**   | Tipo de dado ponto flutuante (numeros com casas decimais) de 32 bits de precisão simples. O tipo float é usado em operações que precisam economizar memória em grandes matrizes de números de ponto flutuante. Esse tipo de dados nunca deve ser usado para valores precisos, como moeda. Para isso, você precisará usar a Classe [java.math.BigDecimal](https://docs.oracle.com/javase/8/docs/api/java/math/BigDecimal.html) e outras Classes úteis fornecidas pela plataforma Java. |
| **double**  | Tipo de dado ponto flutuante (numeros com casas decimais) de 64 bits. O tipo double é tipo de dado padrão para grandes valores com ponto flutuante. Conforme mencionado no tipo float, esse tipo de dados também nunca deve ser usado para valores precisos, como moeda. |
| **boolean** | Tipo de dado composto por apenas dois valores possíveis: `true`e `false`. Use esse tipo de dados para sinalizadores simples que rastreiam condições verdadeiras/falsas. Esse tipo de dados representa um bit de informação, mas seu "tamanho" não é algo definido com precisão. |
| **char**    | Tipo de dado composto por um único caractere Unicode de 16 bits. |

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html" target="_blank"><b>Documentação: <i>Tipos de dados</i></b></a>

<h2>Classe String</h2>

Em Java, uma string é basicamente um objeto que representa uma sequência de valores char, ou seja um texto. **A Classe Java String** é utilizada para definir uma String e fornecer alguns Métodos para realizar algumas operações com strings como compare(), concat(), equals(), split(), length(), replace(), compareTo(), intern(), substring(), entre outros.

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/7/docs/api/java/lang/String.html" target="_blank"><b>Documentação: <i>Classe String</i></b></a>
  
<h2>Classes Wrappers</h2>

Os **Wrapper** são conhecidos na linguagem Java como Classes especiais, que possuem  Métodos capazes de fazer conversões em variáveis primitivas e também de encapsular tipos primitivos para serem trabalhados como objetos, ou  seja, converte um primitivo em um Objeto, mantendo as sa características do primitivo e adicionando alguns Métodos para manipular o Objeto. 

<table border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<p align="center">
					<strong>Tipo primitivo</strong>
				</p>
			</td>
			<td>
				<p align="center">
					<strong>Classe Wrapper</strong>
				</p>
			</td>
			<td>
				<p align="center">
					<strong>Argumentos do construtor</strong>
				</p>
			</td>
		</tr>
		<tr>
			<td>
				<p align="center">
					<strong>boolean</strong>
				</p>
			</td>
			<td>
				<p align="center">
					Boolean
				</p>
			</td>
			<td>
				<p align="center">
					boolean ou String
				</p>
			</td>
		</tr>
		<tr>
			<td>
				<p align="center">
					<strong>byte</strong>
				</p>
			</td>
			<td>
				<p align="center">
					Byte
				</p>
			</td>
			<td>
				<p align="center">
					byte ou String
				</p>
			</td>
		</tr>
		<tr>
			<td>
				<p align="center">
					<strong>char</strong>
				</p>
			</td>
			<td>
				<p align="center">
					Character
				</p>
			</td>
			<td>
				<p align="center">
					char
				</p>
			</td>
		</tr>
		<tr>
			<td>
				<p align="center">
					<strong>int</strong>
				</p>
			</td>
			<td>
				<p align="center">
					Integer
				</p>
			</td>
			<td>
				<p align="center">
					int ou String
				</p>
			</td>
		</tr>
		<tr>
			<td>
				<p align="center">
					<strong>float</strong>
				</p>
			</td>
			<td>
				<p align="center">
					Float
				</p>
			</td>
			<td>
				<p align="center">
					float, double ou String
				</p>
			</td>
		</tr>
		<tr>
			<td>
				<p align="center">
					<strong>double</strong>
				</p>
			</td>
			<td>
				<p align="center">
					Double
				</p>
			</td>
			<td>
				<p align="center">
					double ou String
				</p>
			</td>
		</tr>
		<tr>
			<td>
				<p align="center">
					<strong>long</strong>
				</p>
			</td>
			<td>
				<p align="center">
					Long
				</p>
			</td>
			<td>
				<p align="center">
					long ou String
				</p>
			</td>
		</tr>
		<tr>
			<td>
				<p align="center">
					<strong>short</strong>
				</p>
			</td>
			<td>
				<p align="center">
					Short
				</p>
			</td>
			<td>
				<p align="center">
					short ou String
				</p>
			</td>
		</tr>
</table>
  
<h2>Classe BigDecimal</h2>

Trabalhar com um sistema que manipula valores  monetários é uma tarefa crítica e que deve exigir o máximo de atenção do desenvolvedor. Como exemplo, temos sistemas de Caixa de Lojas (PDV),  Supermercados, Sistemas Bancários e etc. Um cálculo errado pode ocasionar grandes transtornos para o Banco, assim como em qualquer outra ocasião onde se faz necessária a manipulação de dinheiro. Para resolver esta questão, o Java nos oferece a Classe BigDecimal.

O grande diferencial da Classe BigDecimal para o Double está na precisão. Enquanto Double trabalha com N casas decimais, o BogDecimal trabalha com uma precisão arbitrária entre 1 e 2 csas decimais, por isso é a melhor opção para trabalhar com operações financeiras.

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/7/docs/api/java/math/BigDecimal.html" target="_blank"><b>Documentação: <i>Classe BigDecimal</i></b></a>
  
<h2>Classes LocalDate, LocalDateTime e LocalTime</h2>

São Classes do pacote java.time, utilizadas para a manipulação de Data e Hora, que oferecem Métodos para formatar, converter e realizar cálculos com datas, como por exemplo, encontrar o intervalo de tempo entre 2 datas.

| Classe            | Descrição                                                    |
| ----------------- | ------------------------------------------------------------ |
| **LocalDate**     | Armazena uma data.                                           |
| **LocalTime**     | Armazena um horário.                                         |
| **LocalDateTime** | Armazena uma data e um horário em um único Objeto. Esta Classe é muito utilizada para receber a data e o horário em que um Objeto foi criado ou atualizado. |

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/8/docs/api/java/time/package-summary.html" target="_blank"><b>Documentação: <i>Classes Local Date, LocalTime e LocalDateTime</i></b></a>

<br /><br />
	

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div

