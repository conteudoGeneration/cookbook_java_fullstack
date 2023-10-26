<h2>6. DIP — Dependency Inversion Principle</h2>

O **Princípio de inversão de dependência** é comumente separado em dois conceitos principais que o definem:

- **Módulos de alto nível não devem depender dos módulos de baixo nível**. Os dois devem ser baseados em abstrações.
- **Abstrações não devem ser baseadas em detalhes**. Detalhes devem ser baseados em abstrações.

O Princípio da Inversão de Dependência nos diz que:

<div align="center"><h2><i>Nossas Classes devem depender de abstrações e não de implementações.<br />As Abstrações não devem ser baseadas em detalhes.</i></h2></div>

<br />

<div align="center"><img src="https://i.imgur.com/ov9ks1s.png" title="source: imgur.com" /></div>

<br />

O princípio de inversão de dependência inverte a maneira como pensamos o nosso design de software, nos induzindo a fazer com que tanto nossos módulos de alto nível quanto os de baixo nível dependam de uma mesma abstração.

Em um esquema tradicional de desenvolvimento de software, os componentes de nível inferior são projetados para serem consumidos por módulos de nível superior, de modo que estes possam ir incrementando de complexidade conforme o sistema vai sendo construído.

Neste modelo arquitetural, os componentes da camada superior dependem dos componentes mais baixos apenas para que possam realizar alguma tarefa, isto reduz as possibilidades de reuso dos componentes de alto nível, devido ao excessivo acoplamento entre os componentes.

No contexto da programação orientada a objetos, é comum que as pessoas confundam a *Inversão de Dependência* com a *Injeção de Dependência*, porém são coisas distintas, mas que relacionam entre si com um proposito em comum, deixar o código desacoplado.

<h3>6.1. Construindo uma camada de abstração</h3>

Para construir a Camada de Abstração, elemento fundamental do princípio de inversão de dependência, precisamos seguir alguns passos:

1. Todas as variáveis membro da classe devem ser Interfaces ou Classes Abstratas;
2. Todos os pacotes contendo classes concretas devem se comunicar somente através de Interfaces ou Classes Abstratas;
3. Nenhuma Classe deve derivar de uma outra Classe concreta;
4. Nenhum Método deve sobrescrever um Método já implementado;
5. Todas as instâncias de objetos devem ser criadas através de Padrões de Projetos de criação como a Injeção de Dependências.



<img src="https://i.imgur.com/xoN57RQ.png" title="source: imgur.com" width="4%"/>**Exemplo**

Vamos analisar as classes **FrontendDev** e **BackendDev**: 

```java
package solid_dip_v1;

public class FrontendDev{

	public void react() {
		System.out.println("\nDesenvolvedor React");
	}
	
}
```

<br />

```java
package solid_dip_v1;

public class BackendDev{

	public void java() {
		System.out.println("\nDesenvolvedor Java");
	}

}
```

<br />

As 2 Classes acima definem 2 tipos de pessoas Desenvolvedoras: Frontend e Backend. 

Na sequência, vamos analisar a Classe **ProjetoSoftware**:

```java
package solid_dip_v1;

public class ProjetoSoftware {

	public FrontendDev frontDev;
	public BackendDev backDev;
	
	public ProjetoSoftware(FrontendDev frontDev, BackendDev backDev) {
		this.frontDev = frontDev;
		this.backDev = backDev;
	}
	
	public void criarProjeto() {
		this.frontDev.react();
		this.backDev.java();
	}
}
```

<br />

Observe que a Classe **ProjetoSoftware** usa as Classes **FrontendDev** e **BackendDev** no seu processo de desenvolvimento. 

A Classe **ProjetoSoftware** é um módulo de **alto nível**, que da forma como foi implementada, ela depende dos módulos de **baixo nível**,ou seja, as Classes **BackendDev** e **FrontendDev**. Na prática, estamos violando a primeira parte do princípio de inversão de dependência. 

Ao inspecionar o Método **criarProjetos()** da Classe ProjetoSoftware, percebemos que os métodos **react()** e **java()** são métodos vinculados às Classes correspondentes. Quanto ao escopo do projeto, são detalhes, pois, em ambos os casos, são formas de desenvolvimento. Na prática, estamos violando a segunda parte do princípio de inversão de dependência. 

Para resolver esse problema, vamos implementar uma interface chamada IDev, como mostra o código abaixo:

```java
package solid_dip_v2;

public interface IDev {

	public void dev();
	
}
```

Observe que foi adicionado o Método **dev()** na Interface **IDev**. Na sequência, vamos modificar as Classes  **BackendDev** e **FrontendDev**, para implementarem a Interface **IDev**:

```java
package solid_dip_v2;

public class FrontendDev implements IDev{

	@Override
	public void dev() {
		this.react();
		
	}

	public void react() {
		System.out.println("\nDesenvolvedor React");
	}
	
}

```

<br />

```java
package solid_dip_v2;

public class BackendDev implements IDev{

	@Override
	public void dev() {
		this.java();
		
	}

	public void java() {
		System.out.println("\nDesenvolvedor Java");
	}

}
```

Observe que como as Classes **FrontendDev** e **BackendDev** são Classes semelhantes, implementamos a Interface **IDev** em ambas. A implementação da Interface obriga a implementar o Método dev(). Na implementação do Método dev(), inserimos a chamada do Método específico de cada Classe, **react()** e **java()** respectivamente, gerando assim uma abstração. Desta forma, resolvemos a segunda parte do princípio de inversão de dependência, que foi violado.

O próximo passo, para resolver a violação da primeira parte, é refatorar a Classe **ProjetoSoftware** para que ela não dependa das Classes **FrontEndDev** e **BackendDev**, como mostra o código abaixo:

```java
package solid_dip_v2;

import java.util.List;

public class ProjetoSoftware {

	public List<IDev> devs;
		
	public ProjetoSoftware(List<IDev> devs) {
		this.devs = devs;
	}

	public void criarProjeto() {
		this.devs.forEach(d -> d.dev());
	}
}
```

Observe que ao invés de inicializar os Objetos das Classes **FrontendDev** e **BackendDev** de uma única maneira dentro da Classe **ProjetoSoftware**, nós transformamos os Objetos em uma Collection **List** do tipo **IDev**, para iterar através dos Objetos e chamar o Método **dev()** de cada Objeto das Classes **FrontEndDev** e **BackendDev**, criando uma abstração. Desta forma, resolvemos a primeira parte do princípio de inversão de dependência, que foi violado.

O resultado é que a Classe ProjetoSoftware não depende de módulos de nível inferior (Classes **FrontendDev** e **BackendDev**), mas sim de abstrações e além disso, os módulos de baixo nível e seus detalhes dependem apenas de abstrações.

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/exemplos_solid/tree/main/05_solid_dip_v1" target="_blank"><b>Código fonte: Projeto de Software</b></a>

<br />
<br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>