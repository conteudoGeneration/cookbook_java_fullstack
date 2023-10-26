<h2>2. SRP — Single Responsibility Principle</h2>

Uma das bases da programação orientada a objetos é a **Coesão**. Uma classe é **coesa** quando ela é focada em uma responsabilidade bem definida, assim como também não tem responsabilidades além da sua. Se uma classe deve gerar uma nota fiscal, por exemplo, essa deve ser a única responsabilidade que ela deve ter e qualquer coisa além disso vai diminuir a sua coesão. A coesão nos trás uma série de vantagens:

- **Facilidade de manutenção:** Uma vez que temos classes com uma única responsabilidade, saberemos quais classes afetam ou não uma funcionalidade, qual o escopo dessa classes e onde a manutenção e correções de bugs de uma determinada funcionalidade devem ser feitas;
- **Menos código:** Com menos código, a legibilidade fica mais fácil e podemos ganhar tempo no entendimento do sistema;
- **Reuso:** Uma vez que uma classe cuida de uma única responsabilidade, é fácil reusar sempre que quisermos essa mesma responsabilidade/funcionalidade no sistema.

O **Princípio de Responsabilidade Única** reforça o uso da coesão, afirmando que uma classe que tem muitas responsabilidades, aumentam as possibilidades de ocorrerem *bugs* ao alterar uma de suas responsabilidades, sem que possamos perceber.

<div align="center"><h2><i>Uma classe deve ter um, e somente um, motivo para mudar.</i></h2></div>

<br />

<div align="center"><img src="https://i.imgur.com/A8efp8H.png" title="source: imgur.com"/></div>

<br />

Esse princípio declara que uma classe deve ser especializada em um único assunto e possuir apenas uma responsabilidade dentro do software, ou seja, a classe deve ter uma única tarefa ou ação para executar.

Quando estamos aprendendo Programação Orientada a Objetos, sem percebermos, damos a uma classe mais de uma responsabilidade e acabamos criando classes que fazem de tudo, as chamada **God Class** (Classe Deus). Num primeiro momento isso pode parecer eficiente, mas como as responsabilidades acabam se misturando, quando há necessidade de realizar alterações nessa classe, será difícil modificar uma dessas responsabilidades sem comprometer as outras. Toda alteração acaba sendo introduzida com um certo nível de incerteza em nosso sistema, principalmente se não existirem testes automatizados!

> **God Class** ou **Classe Deus:** *Na Programação Orientada a Objetos, é uma classe que sabe demais ou faz demais.*

<img src="https://i.imgur.com/AbOL0Uo.png" title="source: imgur.com" width="4%"/>**Exemplo**:

Vamos analisar a Classe **Livro**:

```java
package solid_srp_v1;

class Livro {
	
	String nome;
	String nomeAutor;
	int ano;
	double preco;
	String isbn;

	public Livro(String nome, String nomeAutor, int ano, double preco, String isbn) {
		this.nome = nome;
		this.nomeAutor = nomeAutor;
		this.ano = ano;
		this.preco = preco;
		this.isbn = isbn;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNomeAutor() {
		return nomeAutor;
	}

	public void setNomeAutor(String nomeAutor) {
		this.nomeAutor = nomeAutor;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
}
```

Na Classe Livro estamos armazenando os Atributos e Métodos de um Objeto da Classe *Livro*.

Agora, vamos criar a Classe Fatura, que terá a lógica para o faturamento e o cálculo do preço total de venda dos livros. Na Classe Fatura, vamos considerar que nossa loja vende apenas livros:

```java
package solid_srp_v1;

public class Fatura {

	private Livro livro;
	private int quantidade;
	private double porcDesconto;
	private double porcImposto;
	private double total;

	public Fatura(Livro livro, int quantidade, double porcDesconto, double porcImposto) {
		this.livro = livro;
		this.quantidade = quantidade;
		this.porcDesconto = porcDesconto;
		this.porcImposto = porcImposto;
		this.total = this.calcularTotal();
	}

	public Livro getLivro() {
		return livro;
	}

	public void setLivro(Livro livro) {
		this.livro = livro;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public double getPorcDesconto() {
		return porcDesconto;
	}

	public void setPorcDesconto(double porcDesconto) {
		this.porcDesconto = porcDesconto;
	}

	public double getPorcImposto() {
		return porcImposto;
	}

	public void setPorcImposto(double porcImposto) {
		this.porcImposto = porcImposto;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal() {
		this.total = this.calcularTotal();
	}

	public double calcularTotal() {
		double preco = ((livro.preco - livro.preco * porcDesconto) * this.quantidade);

		double precoComImposto = preco * (1 + porcImposto);

		return precoComImposto;
	}

	public void imprimirFatura() {
		System.out.println(quantidade + "x " + livro.nome + " " + livro.preco + "$");
		System.out.println("Porcentagem de desconto: " + porcDesconto);
		System.out.println("Procentagem de imposto: " + porcImposto);
		System.out.println("Total: " + total);
	}

}
```

A Classe Fatura contém um Objeto da Classe Livro, alguns Atributos relativos ao faturamento e 2 Métodos especializados:

- Método **calcularTotal**, que calcula o preço total;
- Método **imprimirFatura**, que imprime a fatura no console.

Neste exemplo, o Método **imprimirFatura**, que tem nossa lógica de impressão, viola o Principio da Responsabilidade Única. De acordo com o SRP, nossa Classe deve ter apenas uma única razão para ser alterada. Essa razão  deve ser uma mudança no cálculo da fatura. Nessa arquitetura, no entanto, se quiséssemos mudar o formato de impressão,  precisaríamos mudar a classe. É por isso que não devemos misturar a  lógica de impressão com a lógica de negócios na mesma classe.

Como podemos, então, consertar esse problema?

Podemos  criar novas classes para a lógica de impressão, para  não precisarmos mais modificar a classe Fatura para esses fins. Vamos criar a Classe **ImpressaoDeFatura** e movermos o método para ela:

```java
package solid_srp_v2;

public class ImpressaoDeFatura {

	private Fatura fatura;

    public ImpressaoDeFatura(Fatura fatura) {
        this.fatura = fatura;
    }
    
    public void imprimir() {
            System.out.println(fatura.getQuantidade() + "x " + fatura.getLivro().getNome() 
                               + " R$ " + fatura.getLivro().getPreco());
            System.out.println("Porcentagem de desconto: " + fatura.getPorcDesconto());
            System.out.println("Procentagem de imposto: " + fatura.getPorcImposto());
            System.out.println("Total: " + fatura.getTotal());
	}
    
}
```

A nossa Classe **Fatura** ficará da seguinte forma:

```java
package solid_srp_v2;

public class Fatura {

	private Livro livro;
	private int quantidade;
	private double porcDesconto;
	private double porcImposto;
	private double total;

	public Fatura(Livro livro, int quantidade, double porcDesconto, double porcImposto) {
		this.livro = livro;
		this.quantidade = quantidade;
		this.porcDesconto = porcDesconto;
		this.porcImposto = porcImposto;
		this.total = this.calcularTotal();
	}

	public Livro getLivro() {
		return livro;
	}

	public void setLivro(Livro livro) {
		this.livro = livro;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public double getPorcDesconto() {
		return porcDesconto;
	}

	public void setPorcDesconto(double porcDesconto) {
		this.porcDesconto = porcDesconto;
	}

	public double getPorcImposto() {
		return porcImposto;
	}

	public void setPorcImposto(double porcImposto) {
		this.porcImposto = porcImposto;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal() {
		this.total = this.calcularTotal();
	}

	public double calcularTotal() {
		double preco = ((livro.preco - livro.preco * porcDesconto) * this.quantidade);

		double precoComImposto = preco * (1 + porcImposto);

		return precoComImposto;
	}

}
```


Observe que além de desenvolvermos uma Classe que alivia a Classe *Fatura* de suas funções de Impressão, também poderemos aproveitar a Classe *ImpressaoDeFatura* para imprimir a fatura em outras mídias porque temos uma Classe separada e dedicada a essa preocupação.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_solid/tree/main/01_solid_srp_v1" target="_blank"><b>Código fonte: Projeto - Livraria</b></a>

<br />
<br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
