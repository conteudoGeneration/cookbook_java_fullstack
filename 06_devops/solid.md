<h1>Introdução a SOLID</h1>

<h2>1. O que é SOLID: O guia completo para você entender os 5 princípios da POO</h2>

<h3>Solid</h3>

**SOLID são cinco princípios da programação orientada a objetos que facilitam no desenvolvimento de softwares, tornando-os fáceis de manter e estender. Esses princípios podem ser aplicados a qualquer linguagem de POO.**

<h3>1.2. O que é SOLID?</h3>



![enter image description here](https://i.imgur.com/fNbIbW9.png | width=800)



**SOLID** é um acrônimo criado por [Michael Feathers](https://michaelfeathers.silvrback.com/), após observar que cinco princípios da orientação a objetos e design de código *— Criados por* [*Robert C. Martin*](https://pt.wikipedia.org/wiki/Robert_Cecil_Martin) *(*a.k.a. *Uncle Bob) e abordados no artigo* [The Principles of OOD](http://butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod) *—* poderiam se encaixar nesta palavra.

**S.O.L.I.D: Os 5 princípios da POO**

1. **S — Single Responsiblity Principle** (Princípio da responsabilidade única)
2. **O — Open-Closed Principle** (Princípio Aberto-Fechado)
3. **L — Liskov Substitution Principle** (Princípio da substituição de Liskov)
4. **I — Interface Segregation Principle** (Princípio da Segregação da Interface)
5. **D — Dependency Inversion Principle** (Princípio da inversão da dependência)

Esses princípios ajudam o programador a escrever [códigos mais limpos](https://medium.com/joaorobertopb/1-clean-code-o-que-é-porque-usar-1e4f9f4454c6), separando responsabilidades, diminuindo acoplamentos, facilitando na refatoração e estimulando o reaproveitamento do código.

<h2>2 SRP — Single Responsibility Principle:</h2>

Princípio da Responsabilidade Única — **Uma classe deve ter um, e somente um, motivo para mudar.**

![enter image description here](https://i.imgur.com/ibWNxur.png | width=1000)

![enter image description here](https://i.imgur.com/BwxksRX.png | width=1000)

Esse princípio declara que uma classe deve ser especializada em um único assunto e possuir apenas uma responsabilidade dentro do software, ou seja, a classe deve ter uma única tarefa ou ação para executar.

Quando estamos aprendendo programação orientada a objetos, sem sabermos, damos a uma classe mais de uma responsabilidade e acabamos criando classes que fazem de tudo — **God Class**. Num primeiro momento isso pode parecer eficiente, mas como as responsabilidades acabam se misturando, quando há necessidade de realizar alterações nessa classe, será difícil modificar uma dessas responsabilidades sem comprometer as outras. Toda alteração acaba sendo introduzida com um certo nível de incerteza em nosso sistema — principalmente se não existirem testes automatizados!

**God Class --** **Classe Deus:** *Na programação orientada a objetos, é uma classe que sabe demais ou faz demais.*



**Como esse princípio nos ajuda a construir um software melhor?** Vejamos alguns de seus benefícios:

1. **Teste** – Uma classe com uma responsabilidade terá muito menos casos de teste.
2. **Menor acoplamento** – Menos funcionalidade em uma única classe terá menos dependências.
3. **Organização** – Turmas menores e bem organizadas são mais fáceis de pesquisar do que as monolíticas.

### Exemplo

Por exemplo, vamos ver uma classe para representar um livro simples:

```java
public class Livro {

    private String nome;
    private String autor;
    private String texto;

    //constructor, getters and setters
}
```

Nesse código, armazenamos o nome, o autor e o texto associados a uma instância de um *Livro* .

Vamos agora adicionar alguns métodos para consultar o texto:

```java
public class Livro {

    private String nome;
    private String autor;
    private String texto;

    //constructor, getters and setters

    // métodos que se relacionam diretamente com as propriedades do livro
    public String substituirPalavraNotexto(String palavra, String substituiçãoPalavra){
        return text.replaceAll(palavra, substituiçãoPalavra);
    }

    public boolean eAPalavraNoTexto(String palavra){
        return text.contains(palavra);
    }
}
```

Agora nossa classe *Livro* funciona bem e podemos armazenar quantos livros quisermos em nosso aplicativo.

Mas de que adianta armazenar as informações se não podemos enviar o texto para o nosso console e lê-lo?

Vamos jogar a cautela ao vento e adicionar um método de impressão:

```java
public class Livro {
    //...

    void imprimirTextoNoConsole(){
        // nosso código para formatar e imprimir o texto
    }
}
```

No entanto, este código viola o princípio de responsabilidade única que descrevemos anteriormente.

Para consertar nossa bagunça, devemos implementar uma classe separada que lida apenas com a impressão de nossos textos:

```java
public class ImpressoraDeLivros {

    // métodos para saída de texto
    void imprimirTextoNoConsole(String texto){
        //nosso código para formatar e imprimir o texto
    }

    void imprimirTextoEmOutroMeio(String texto){
        // código para escrever em qualquer outro local
    }
}
```

Incrível. Não apenas desenvolvemos uma classe que alivia o *Livro* de suas funções de impressão, mas também podemos aproveitar nossa classe *ImpressoraDeLivros* para enviar nosso texto para outras mídias.

Seja e-mail, registro ou qualquer outra coisa, temos uma aula separada dedicada a essa preocupação.



<h2>3 OCP — Open-Closed Principle:</h2>

Princípio Aberto-Fechado — **Objetos ou entidades devem estar abertos para extensão, mas fechados para modificação**, ou seja, quando novos comportamentos e recursos precisam ser adicionados no software, devemos estender e não alterar o código fonte original.

![enter image description here](https://i.imgur.com/QeAztrK.png | width=1000)



![enter image description here](https://i.imgur.com/9RPW56e.png | width=1000)

### Exemplo

Vamos explorar o conceito com um exemplo de código rápido. Como parte de um novo projeto, imagine que implementamos uma aula de *guitarra* .

É completo e ainda tem um botão de volume:

```java
public class Guitarra {

    private String marca;
    private String modelo;
    private int volume;

    //Constructors, getters & setters
}
```

Lançamos o aplicativo e todos adoram. Mas depois de alguns meses, decidimos que a *guitarra* é um pouco chata e poderíamos usar um padrão de chama legal para torná-la mais rock and roll.

Neste ponto, pode ser tentador apenas abrir a classe *Guitarra* e adicionar um padrão de chama - mas quem sabe quais erros podem ocorrer em nosso aplicativo.

Em vez disso, vamos nos **ater ao princípio aberto-fechado e simplesmente estender nossa classe \*Guitarra\*** :

```java
public class GuitarraSuperLegalComChamas extends Guitarra {

    private String corDaChama;

    //constructor, getters + setters
}
```

Ao estender a classe *Guitarra* , podemos ter certeza de que nosso aplicativo existente não será afetado.



**Vantagens do uso do principio de Open-closed**

- Facilita a manutenção, já que cada classe possui uma responsabilidade única;
- Contribui para a arquitetura sustentável do projeto, possibilitando evoluções sem comprometer outras funcionalidades.



<h2>4 LSP — Liskov Substitution Principle:</h2>

Princípio da substituição de Liskov — **Uma** **classe derivada deve ser substituível por sua classe base**.

O princípio da substituição de Liskov foi introduzido por [Barbara Liskov](http://en.wikipedia.org/wiki/Barbara_Liskov) em sua conferência “Data abstraction” em 1987. A definição formal de Liskov diz que:

*Se para cada objeto o1 do tipo S há um objeto o2 do tipo T de forma que, para todos os programas P definidos em termos de T, o comportamento de P é inalterado quando o1 é substituído por o2 então S é um subtipo de T*

Um exemplo mais simples e de fácil compreensão dessa definição. Seria:

*se S é um subtipo de T, então os objetos do tipo T, em um programa, podem ser substituídos pelos objetos de tipo S sem que seja necessário alterar as propriedades deste programa.*

![enter image description here](https://i.imgur.com/GPyKRp3.png | width=1000)

![enter image description here](https://i.imgur.com/U9mxJd9.png | width=1000)

![enter image description here](https://i.imgur.com/8fyMt6J.png | width=1000)



![enter image description here](https://i.imgur.com/ByZpuCF.png | width=1000)

**Exemplos de violação do LSP:**

- Sobrescrever/implementar um método que não faz nada;
- Lançar uma exceção inesperada;
- Retornar valores de tipos diferentes da classe base;



Para não violar o Liskov Substitution Principle, além de estruturar muito bem as suas abstrações, em alguns casos, você precisara usar a *injeção de dependência* e também usar outros princípios do SOLID, como por exemplo, o *Open-Closed Principle* e o *Interface Segregation Principle* — será abordado no próximo tópico.

Seguir o **LSP** nos permite usar o polimorfismo com mais confiança. Podemos chamar nossas classes derivadas referindo-se à sua classe base sem preocupações com resultados inesperados.



### Exemplo



Vamos direto ao código para nos ajudar a entender esse conceito:

```java
public interface Carro {

    void ligarOMotor();
    void acelerar();
}
```

Acima, definimos uma interface de *carro* simples com alguns métodos que todos os carros devem ser capazes de cumprir: ligar o motor e acelerar para frente.

Vamos implementar nossa interface e fornecer algum código para os métodos:

```java
public class Automóvel implements Carrro {

    private Engine motor;

    //Constructors, getters + setters

    public void ligarOMotor() {
        //turn on the engine!
        engine.on();
    }

    public void acelerar() {
        //move forward!
        engine.ligar(1000);
    }
}
```

Como nosso código descreve, temos um motor que podemos ligar e podemos aumentar a potência.

Mas espere - agora estamos vivendo na era dos carros elétricos:

```java
public class CarroEletrico implements Carro {

    public void ligarOMotor() {
        throw new AssertionError("não tenho motor!");
    }

    public void acelerar() {
        //essa aceleração é uma loucura!
    }
}
```

Ao lançar um carro sem motor na mistura, estamos inerentemente mudando o comportamento do nosso programa. Esta é **uma violação flagrante da substituição de Liskov e é um pouco mais difícil de corrigir do que nossos dois princípios anteriores.**

Uma solução possível seria retrabalhar nosso modelo em interfaces que levassem em conta o estado sem motor do nosso *carro* .



<h2>5 ISP — Interface Segregation Principle:</h2>

Princípio da Segregação da Interface — **Uma classe não deve ser forçada a implementar interfaces e métodos que não irão utilizar.**

Esse princípio basicamente diz que é melhor criar interfaces mais específicas ao invés de termos uma única interface genérica.

![enter image description here](https://i.imgur.com/lI060vi.png | width=1000)

![enter image description here](https://i.imgur.com/VwEaWoQ.png | width=1000)

### Exemplo



Para este exemplo, vamos trabalhar como tratadores. E mais especificamente, trabalharemos no recinto do urso.

Vamos começar com uma interface que descreve nossos papéis como guardiões do urso:

```java
public interface GuardiãoDoUrso {
    void lavarOUrso();
    void alimenteOUrso();
    void cuidarDoUrso();
}
```

Como ávidos tratadores, estamos mais do que felizes em lavar e alimentar nossos amados ursos. Mas estamos todos muito conscientes dos perigos de acariciá-los. Infelizmente, nossa interface é bastante grande e não temos escolha a não ser implementar o código para acariciar o urso.

Vamos **corrigir isso dividindo nossa interface grande em três separadas** :

```java
public interface LimpadordeUrsos {
    void lavarOUrso();
}

public interface AlimentadorDeUrsos {
    void alimenteOUrso();
}

public interface CuidadorDeUrso {
    void cuidarDoUrso();
}
```

Agora, graças à segregação de interfaces, estamos livres para implementar apenas os métodos que importam para nós:

```java
public class CuidadorDeUrso implements LimpadordeUrsos, AlimentadorDeUrsos {

    public void LimpadordeUrsos() {
        //Acho que perdemos um lugar...
    }

    public void alimenteOUrso() {
        //terças de atum...
    }
}
```

E, finalmente, podemos deixar as coisas perigosas para as pessoas imprudentes:

```java
public class PessoaMaluca implements CuidadorDeUrso {

    public void cuidarDoUrso() {
        //Boa sorte com isso!
    }
}
```

Indo além, poderíamos até dividir nossa classe *[ImpressoraDeLivros](https://www.baeldung.com/solid-principles#s)* de nosso exemplo anterior para usar a segregação de interface da mesma maneira. Ao implementar uma interface *Printer com um único método de* *impressão* , poderíamos instanciar classes *imprimirTextoNoConsole* e *imprimirTextoEmOutroMeio* separadas .



<h2>5 DIP — Dependency Inversion Principle:</h2>

Princípio da Inversão de Dependência — **Dependa de abstrações e não de implementações.**

De acordo com Uncle Bob, esse princípio pode ser definido da seguinte forma:

![enter image description here](https://i.imgur.com/eiS2uCq.png | width=1000)

![enter image description here](https://i.imgur.com/k66MQQf.png | width=1000)

**1 - Módulos de alto nível não devem depender de módulos de baixo nível. Ambos devem depender da abstração.**

**2 - Abstrações não devem depender de detalhes. Detalhes devem depender de abstrações.**



No contexto da programação orientada a objetos, é comum que as pessoas confundam a *Inversão de Dependência* com a [*Injeção de Dependência*](https://pt.wikipedia.org/wiki/Injeção_de_dependência), porém são coisas distintas, mas que relacionam entre si com um proposito em comum, deixar o código desacoplado.



### Exemplo



Para demonstrar isso, vamos à moda antiga e damos vida a um computador Windows 98 com código:

```java
public class Windows98PC {}
```

Mas de que adianta um computador sem monitor e teclado? Vamos adicionar um de cada ao nosso construtor para que cada *Windows98PC* que instanciamos venha pré-empacotado com um *Monitor* e um *TecladoPadrão* :

```java
public class Windows98PC {

    private final TecladoPadrão Teclado;
    private final Monitor monitor;

    public Windows98PC() {
        monitor = new Monitor();
        Teclado = new TecladoPadrão();
    }

}
```

Este código funcionará e poderemos usar o *TecladoPadrão* e o *Monitor* livremente dentro de nossa classe *Windows98PC* .

Problema resolvido? Não exatamente. **Ao declarar o \*TecladoPadrão\* e o \*Monitor\* com a \*nova\* palavra-chave, unimos fortemente essas três classes.**

Isso não apenas torna nosso *Windows98PC* difícil de testar, mas também perdemos a capacidade de trocar nossa classe *TecladoPadrão* por uma diferente caso seja necessário. E também estamos presos à nossa classe *Monitor* .

Vamos desacoplar nossa máquina do *TecladoPadrão* adicionando uma interface de *teclado* mais geral e usando isso em nossa classe:

```java
public interface Keyboard { }
public class Windows98PC{

    private final Teclado teclado;
    private final Monitor monitor;

    public Windows98PC(Keyboard keyboard, Monitor monitor) {
        this.teclado = teclado;
        this.monitor = monitor;
    }
}
```

Aqui, estamos usando o padrão de injeção de dependência para facilitar a adição da dependência *teclado na classe* *Windows98PC* .

Vamos também modificar nossa classe *TecladoPadrão* para implementar a interface *Teclado* para que seja adequada para injetar na classe *Windows98PC* :

```java
public class TecladoPadrão implements Teclado { }
```

Agora nossas classes são desacopladas e se comunicam através da abstração do *teclado .* Se quisermos, podemos facilmente trocar o tipo de teclado em nossa máquina com uma implementação diferente da interface. Podemos seguir o mesmo princípio para a classe *Monitor* .

Excelente! Nós separamos as dependências e estamos livres para testar nosso *Windows98PC* com qualquer framework de teste que escolhermos.



<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
