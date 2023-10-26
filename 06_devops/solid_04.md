<h2>5. ISP — Interface Segregation Principle</h2>

Na Orientação a Objetos, quando falamos de **Interface**, estamos falando do conjunto de métodos que um objeto expõe, ou seja, das maneiras como nós podemos interagir com esse objeto. Toda mensagem (ou chamada de método) que um objeto recebe constitui uma interface. 

A interface funciona como um **contrato**: nós definimos o comportamento da interface na forma de diferentes métodos que ela possui. Cada classe que desejar compartilhar o comportamento dessa interface precisa **implementar** os métodos dela, ou seja, declarar como esses métodos serão executados. Quando a classe utiliza uma interface, na prática ela **assina o contrato** dizendo que **irá implementar todos os métodos dessa interface**.

O Princípio da Segregação da Interface nos diz que:

<div align="center"><h2><i>Uma classe não deve ser forçada a implementar interfaces e métodos que não irão utilizar.</i></h2></div>

<div align="center"><img src="https://i.imgur.com/dUmYXNZ.png" title="source: imgur.com" /></div>

<br />

Esse princípio basicamente diz que é melhor criar interfaces mais específicas ao invés de termos uma única interface genérica, onde as Classes não precisarão implementar Métodos que não serão utilizados.

<br />

<img src="https://i.imgur.com/3ZL5Ray.png" title="source: imgur.com" width="4%"/>**Exemplo:**

Vamos explorar o conceito da princípio Segregação da Interface através do exemplo anterior (RH). Vamos alterar a  Classe **Funcionario**, adicionando 2 Métodos abstratos: **calcularComissao()** e **calcularBonus()**, como vemos no código abaixo:

```java
package solid_lsp_v1;

public abstract class Funcionario {

	private float salario;
    private String cargo;
    private String nome;
    
	public Funcionario(float salario, String cargo, String nome) {
		this.salario = salario;
		this.cargo = cargo;
		this.nome = nome;
	}

	//Métodos abstratos
	abstract float calcularSalario();
	abstract float calcularComissao();
	abstract float calcularBonus();

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

Estes 2 Métodos serão utilizados como Métodos auxiliares do Método **calcularSalario()**, porque a nossa empresa criou um novo cargo: **Atendente de caixa**, como vemos no código abaixo:

```java
package solid_lsp_v1;

public class AtendenteCaixa extends Funcionario {

	public AtendenteCaixa(float salario, String cargo, String nome) {
		super(salario, cargo, nome);
	}

	// Método Calcular Salário
	@Override
	float calcularSalario() {
		return this.getSalario();
	}

	// Método Calcular Comissão - Não Implementado
	@Override
	float calcularComissao() {
		return 0.0f;
	}

	// Método Calcular Bônus - Não Implmentado
	@Override
	float calcularBonus() {
		return 0.0f;
	}

}
```

Observe que os Métodos novos foram inseridos na Classe, mas não retornam nada porquê o Atendente de Caixa não possui comissão e bônus, mas por se tratarem de Métodos abstratos, eles devem ser obrigatoriamente implementados. Vamos observar as Classes **Gerente** e **Vendedor**:

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

	// Método Calcular Salário
	@Override
	public float calcularSalario(){
        return this.getSalario() + this.calcularBonus();
    }

	// Método Calcular Comissão - Não Implmentado
	@Override
	float calcularComissao() {
		return 0.0f;
	}

	// Método Calcular Bônus
	@Override
	float calcularBonus() {
		return this.getSalario() * this.getBonus();
	}
    
}
```

<br />

```java
package solid_lsp_v1;

class Vendedor extends Funcionario {

	private float totalVendas;

	public Vendedor(float salario, String cargo, String nome, float totalVendas) {
		super(salario, cargo, nome);
		this.totalVendas = totalVendas;
	}

	public float getTotalVendas() {
		return totalVendas;
	}

	public void setTotalVendas(float totalVendas) {
		this.totalVendas = totalVendas;
	}

	// Método Calcular Salário
	@Override
	public float calcularSalario() {
		return this.getSalario() + this.calcularComissao();
	}

	// Método Calcular Comissão
	@Override
	float calcularComissao() {
		return this.totalVendas * 0.1f;
	}

	// Método Calcular Bônus - Não Implmentado
	@Override
	float calcularBonus() {
		return 0.0f;
	}
}
```

Observe que os Métodos novos foram inseridos nas duas Classes, por se tratarem de Métodos abstratos, eles devem ser obrigatoriamente implementados. Na Classe **Gerente** foi implementado o Método **calcularBonus()** e na Classe **Vendedor** foi implementado o Método **calcularComissao()**.

Com isso temos vários problemas de Design: 

- O primeiro é que apenas o Gerente recebe bônus e Vendedor e Atendente de Caixa estão sendo obrigados a implementar o Método **calcularBonus()**.
- O segundo é que apenas o Vendedor recebe comissão e Gerente e Atendente de Caixa estão sendo obrigados a implementar o Método **calcularComissao()**.
- O terceiro é que o Atendente de Caixa não recebe comissão e bônus, e está sendo obrigado a implementar os Métodos **calcularBonus()** e **calcularComissao()**.

Aplicando o Princípio da Segregação de Interfaces, vamos fazer uma refatoração no código, e criar 2 Interfaces:  **Comissionavel** e **BonusAplicavel**, que terão em suas assinaturas os respectivos métodos **calcularBonus()** e **calcularComissao()**:

```java
package solid_lsp_v2;

public interface Comissionavel{
    
	public float calcularComissao();
	
}
```

<br />

```java
package solid_lsp_v2;

public interface BonusAplicavel{
    
	public float calcularBonus();
	
}
```

<br />

Na sequência, vamos implementar a Interface **BonusAplicavel na Classe Gerente a Interface**, a interface  **Comissionavel na Classe Vendedor** e limpar a Classe **AtendenteCaixa**:

```java
package solid_lsp_v2;

public class Gerente extends Funcionario implements BonusAplicavel {

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

	// Método Calcular Salário - Classe Funcionario
	@Override
	public float calcularSalario() {
		return this.getSalario() + this.calcularBonus();
	}

	// Método Calcular Bônus - Interface BonusAplicavel
	@Override
	public float calcularBonus() {
		return this.getSalario() * this.getBonus();
	}
}

```

<br />

```java
package solid_lsp_v2;

class Vendedor extends Funcionario implements Comissionavel{
    
	private float totalVendas;
    
    public Vendedor(float salario, String cargo, String nome, float totalVendas) {
		super(salario, cargo, nome);
		this.totalVendas = totalVendas;
	}

	public float getTotalVendas() {
		return totalVendas;
	}

	public void setTotalVendas(float totalVendas) {
		this.totalVendas = totalVendas;
	}
	
	// Método Calcular Salário - Classe Funcionario
	@Override
	public float calcularSalario(){
        return this.getSalario() + this.calcularComissao();
    }

	// Método Calcular Comissão - Interface Comissionavel
	@Override
	public float calcularComissao() {
		 return this.totalVendas * 0.1f;
	}
    
}
```

<br />

```java
package solid_lsp_v2;

public class AtendenteCaixa extends Funcionario{

	
	public AtendenteCaixa(float salario, String cargo, String nome) {
		super(salario, cargo, nome);
	}

	// Método Calcular Salário - Classe Funcionario
	@Override
	float calcularSalario() {
		return this.getSalario();
	}

}
```

Agora nossas Classes  **Gerente** e **Vendedor** e **AtendenteCaixa** estão implementando apenas os Métodos que serão realmente utilizados.

O princípio da Segregação de Interfaces nos ajuda a aumentar a granularidade de nossos objetos, aumentando a coesão de suas interfaces e diminuindo drasticamente o acoplamento. E isso melhora a manutenção do nosso código, pois interfaces mais simples são mais fáceis de serem entendidas e implementadas.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_solid/tree/main/04_solid_isp_v1" target="_blank"><b>Código fonte: Projeto - RH</b></a>

<br />
<br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>