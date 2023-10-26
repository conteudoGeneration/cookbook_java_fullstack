<h2>4. LSP — Liskov Substitution Principle</h2>



O princípio da substituição de Liskov foi introduzido por *Barbara Liskov* em sua conferência *“Data abstraction”* em 1987. A definição formal de Liskov diz que:

*Se para cada objeto o1 do tipo S há um objeto o2 do tipo T de forma que, para todos os programas P definidos em termos de T, o comportamento de P é inalterado quando o1 é substituído por o2 então S é um subtipo de T*.

Falando de outra maneira, a visão de "**subtipo**" defendida por Liskov é baseada na noção da **substituição**; isto é, se **S** é um subtipo de **T**, então os objetos do tipo **T**, em um programa, podem ser substituídos pelos objetos de tipo **S** sem que seja necessário alterar as propriedades deste programa.

Suponha que uma parte do sistema está utilizando uma determinada **funcionalidade**. Se essa funcionalidade precisar ser trocada por outra, por meio de polimorfismo dinâmico ou estático, a outra deverá devolver o mesmo tipo de informação, caso contrário, o sistema quebrará.

Neste contexto, para garantir que a classe **S** tenha o mesmo comportamento que a classe base **T**, é imprescindível a utilização de um contrato (interface ou classe abstrata), contendo as definições de métodos necessárias para que as classes que a herdarem sejam obrigadas a implementá-las.

O **Princípio da Substituição de Liskov** pode ser resumido na frase abaixo:

<div align="center"><h2><i>Uma classe derivada deve ser substituível por sua classe base.</i></h2></div>

<div align="center"><img src="https://i.imgur.com/Tp2Rbb6.png" title="source: imgur.com" /></div>

O Principio da Substituição de Liskov é mais desafiador de se compreender, para simplificar um pouco observe os exemplos abaixo:

- Sobrescrever/implementar um método que não faz nada;
- Lançar uma exceção inesperada;
- Retornar valores de tipos diferentes da classe base;

Para não violar o princípio da substituição de Liskov, além de estruturar muito bem as suas abstrações, em alguns casos, você precisara usar a *injeção de dependência* e também usar outros princípios do SOLID, como por exemplo, o princípio aberto/fechado.

> **Injeção de dependência** é um tipo de **inversão de controle** (*Inversion of Control* – IoC) que dá nome ao processo de prover instâncias de classes que um objeto precisa para funcionar.

Seguir o **princípio da substituição de Liskov** nos permite usar o polimorfismo com mais confiança. Podemos chamar nossas classes derivadas referindo-se à sua classe base sem preocupações com resultados inesperados.

<img src="https://i.imgur.com/ekcbNUw.png" title="source: imgur.com" width="4%"/>**Exemplo:**

Vamos analisar as Classes **Funcionario**, **Gerente** e **Vendedor**:

```java
package solid_lsp_v1;

public class Funcionario {

	private float salario;
    private String cargo;
    private String nome;
    
	public Funcionario(float salario, String cargo, String nome) {
		this.salario = salario;
		this.cargo = cargo;
		this.nome = nome;
	}

	public float getSalario() {
		return salario;
	}

	public void setSalario(float salario) {
		this.salario = salario;
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
    
}
```

<br >

```java
package solid_lsp_v1;

class Gerente extends Funcionario {
    
	private float bonus;
    
    public Gerente(float salario, String cargo, String nome, float bonus) {
		super(salario, cargo, nome);
		this.bonus = bonus;
	}

	public float getBonus() {
		return bonus;
	}

	public void setBonus(float bonus) {
		this.bonus = bonus;
	}
    
	public float CalcularSalarioGerente(){
        return this.getSalario() + bonus;
    }
}

```

<br >

```java
package solid_lsp_v1;

class Vendedor extends Funcionario{
    
	private float comissao;
    
    public Vendedor(float salario, String cargo, String nome, float comissao) {
		super(salario, cargo, nome);
		this.comissao = comissao;
	}

	public float getComissao() {
		return comissao;
	}

	public void setComissao(float comissao) {
		this.comissao = comissao;
	}

	public float calcularSalarioVendedor(){
        return this.getSalario() + comissao;
    }
    
}
```

<br />

Aparentemente essas classes não possuem qualquer problema, pois cada Classe possui a sua responsabilidade e não há necessidade de alterar a Classe Funcionario cada vez que criamos um novo cargo. Porém, imagine que você deseja criar uma Classe para imprimir a folha salarial, chamada **FolhaSalarial**:

```java
package solid_lsp_v1;

import java.time.LocalDate;
import java.util.List;

class FolhaSalarial{
    
	private LocalDate data;
    
    public FolhaSalarial(LocalDate data) {
		this.data = data;
	}

	public LocalDate getData() {
		return data;
	}

	public void setData(LocalDate data) {
		this.data = data;
	}

	public void imprimirFolhaSalarial(List<Funcionario> funcionarios){
        
		System.out.println("FOLHA SALARIAL\n");
		
		for(Funcionario funcionario : funcionarios){
            
            // Erro no Método calcularSalarioGerente()
            if(funcionario.getCargo() == "Vendedor"){
                System.out.println("\n" + funcionario.getNome() + " ----- R$" + 
                                   funcionario.calcularSalarioGerente());
            }
            
            // Erro no Método calcularSalarioVendedor()
            if(funcionario.getCargo() == "Gerente"){
                System.out.println("\n" + funcionario.getNome() + " ----- R$" + 
                                   funcionario.calcularSalarioVendedor());
            }
        }
    } 
}

```

Observe que a Classe FolhaSalarial viola dois princípios de uma só vez: 

- **Substituição de Liskov**, pois não podemos substituir Funcionário por um subtipo Gerente ou Vendedor, pois cada subtipo possui um método diferente para calcular o salário. Além disso, o Método **imprimirFolhaSalarial** exibirá um erro informando que os Métodos **calcularSalarioGerente()** e **calcularSalarioVendedor()** não foram definidos na Classe **Funcionario**, obrigando a criar os 2 Métodos na Classe Funcionario, retornando o salário (duplicidade de código);
- **Aberto/Fechado**, dado que cada vez que criarmos um novo cargo, precisamos alterar a Classe **FolhaSalarial**.

Para resolver o problema, precisamos definir um único método para calcular o salário na Classe Funcionario. Para isso iremos converter a Classe Funcionario em uma Classe Abstrata e iremos criar um método abstrato *getSalario()*. Desta forma, todos os subtipos de Funcionario terão de implementar o Método abstrato com as suas epecificidades.

Vejamos como ficarão as nossas Classes, começando pela **Classe Funcionario**:

```java
package solid_lsp_v2;

public abstract class Funcionario {

	private float salario;
    private String cargo;
    private String nome;
    
	public Funcionario(float salario, String cargo, String nome) {
		this.salario = salario;
		this.cargo = cargo;
		this.nome = nome;
	}

    //Método abstrato
	abstract float calcularSalario();

	public float getSalario() {
		return salario;
	}
	
	public void setSalario(float salario) {
		this.salario = salario;
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
    
}
```

Na sequência, vamos modificar as Classes **Gerente** e **Vendedor**:

```java
package solid_lsp_v2;

class Gerente extends Funcionario {
    
	private float bonus;
    
    public Gerente(float salario, String cargo, String nome, float bonus) {
		super(salario, cargo, nome);
		this.bonus = bonus;
	}

	public float getBonus() {
		return bonus;
	}

	public void setBonus(float bonus) {
		this.bonus = bonus;
	}

    // Método Calcular Salário
	public float calcularSalario(){
        return this.getSalario() + bonus;
    }
    
}

```

<br />

```java
package solid_lsp_v2;

class Vendedor extends Funcionario{
    
	private float comissao;
    
    public Vendedor(float salario, String cargo, String nome, float comissao) {
		super(salario, cargo, nome);
		this.comissao = comissao;
	}

	public float getComissao() {
		return comissao;
	}

	public void setComissao(float comissao) {
		this.comissao = comissao;
	}

	// Método Calcular Salário
	public float calcularSalario(){
        return this.getSalario() + comissao;
    }
    
}
```

<br />

Para finalizar, vamos alterar a Classe **FolhaSalarial** para utilizar o Método **calcularSalario()** para qualquer subtipo de **Funcionario**:

```java
package solid_lsp_v2;

import java.time.LocalDate;
import java.util.List;

class FolhaSalarial{
    
	private LocalDate data;
    
    public FolhaSalarial(LocalDate data) {
		this.data = data;
	}

	public LocalDate getData() {
		return data;
	}

	public void setData(LocalDate data) {
		this.data = data;
	}

	public void imprimirFolhaSalarial(List<Funcionario> funcionarios){
        
		System.out.println("FOLHA SALARIAL\n");
		
		for(Funcionario funcionario : funcionarios){
            
        	System.out.println("\n" + funcionario.getNome() + " ----- R$ " + 
                               funcionario.calcularSalario());

        }
    } 
}
```

Agora podemos criar quantos subtipos de funcionários desejarmos e nunca precisaremos nos preocupar com Classe **FolhaSalarial**, pois ela conhece a abstração de funcionário e sabe que tipos os subtipos possuem o método ***getSalario()***, independente de como cada um irá implementar.

O **princípio da Substituição de Liskov** veio para garantir que não criaremos nenhum design estranho enquanto usamos a herança. A herança é um mecanismo muito poderoso da Orientação a Objetos, mas potencialmente pode criar muita confusão e comportamentos estranhos e difíceis de serem detectados. Seguindo esse princípio os comportamentos ficam mais previsíveis ao longo da cadeia de  heranças.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_solid/tree/main/03_solid_lsp_v1" target="_blank"><b>Código fonte: Projeto - RH</b></a>


<br />
<br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>