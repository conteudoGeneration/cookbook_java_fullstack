<h1>Introdução ao TDD - Test Driven Development</h1>



**Test Driven Development (TDD)** ou **Teste Guiado pelo Desenvolvimento**, tornou-se uma das práticas mais populares entre as pessoas desenvolvedoras de software. O conceito é muito simples: **Escreva seus testes antes mesmo de escrever o código de produção**. 

Mas por quê a ideia parece ser tão boa? Ao escrever os testes antes, a pessoa desenvolvedora garante que boa parte do seu sistema tem um teste que garante o seu funcionamento. Além disso, muitas pessoas desenvolvedoras também afirmam que os testes os guiam no projeto das classes do sistema.

Antes de compreendermos como funciona, embora o conceito do TDD seja muito simples, é importante ressaltar que ele se baseia em 3 princípios fundamentais:

> 1. *Você deve escrever um teste com falha antes de escrever qualquer código de produção.*
>
> 2. *Você não deve escrever apenas um teste, que seja suficiente para o código falhar ou provocar um erro de compilação.*
>
> 3. *Você não deve escrever mais código de produção do que o suficiente para fazer o teste com falha no momento passar.*

Não aplicar estes 3 princípios fundamentais ao escrever os seus testes, indica que você está aplicando o TDD de forma incorreta.

<br />

<h2>1. Qual a diferença entre fazer TDD e escrever os testes depois?</h2>

A pessoa desenvolvedora quando cria um teste automatizado, obtém o feedback da aplicação através da execução do teste. A diferença é justamente na quantidade de feedback. Quando o desenvolvedor escreve os testes somente ao finalizar a implementação do código de produção, ele passou muito tempo sem retorno. Afinal, escrever o código de produção leva tempo. Ao praticar o TDD, a pessoa desenvolvedora divide seu trabalho em pequenas etapas. Ela escreve um pequeno teste e implementa um pequeno pedaço da funcionalidade. E repete. A cada teste escrito, o desenvolvedor ganha feedback naquele momento.

Quando se tem muito código já escrito, mudanças podem ser trabalhosas e custar caro. Ao contrário, quanto menos código escrito, menor será o custo da eventual mudança. E é justamente isso que acontece com os praticantes de TDD: eles recebem feedback no momento em que mudar ainda é barato.

A figura abaixo exemplifica a diferença entre a quantidade de feedback de um desenvolvedor que pratica TDD e de um desenvolvedor que escreve testes ao final.

<div align="center"><img src="https://i.imgur.com/fdHX9gW.png" title="source: imgur.com" /></div>

A questão é que ao escrever os testes primeiro e esforçar-se para mantê-los fáceis de escrever, você está fazendo três coisas importantes no seu projeto:

1. Você está criando documentação e as especificações do projeto nunca ficarão desatualizadas.
2. Você está (re)projetando seu código, mantendo simples e facilmente testável, e isso o torna limpo, descomplicado, fácil de entender e de modificar.
3. Você está criando uma rede de segurança para fazer mudanças com a confiança de já ter realizado diversos testes.

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="130px"/> | <p align="justify"> **ATENÇÃO:** *Os testes do Projeto Blog Pessoal foram criados no final do projeto por questões didáticas. No Mundo Real, geralmente os testes caminham junto com o projeto. * </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>2. A História do TDD</h2>

O TDD ficou bastante popular após a publicação do livro TDD: By Example (Kent Beck - 2002). O próprio Kent afirma que TDD não foi uma ideia totalmente original. Ele conta que em algum momento de sua vida, ele leu em algum dos livros de seu pai (que era uma pessoa desenvolvedora), sobre uma técnica de testes mais antiga, onde a pessoa desenvolvedora colocava na fita (meio de armazenamento de dados, muito comum nos anos 60 e 70), o valor que ele esperava daquele programa, e então a pessoa desenvolvedora implementava o código até chegar naquele valor.

Ele próprio conta que achou a ideia absurda. Qual o sentido de escrever um teste que falha? Mas resolveu experimentar. Após a experiência, ele disse que “*as pessoas sempre diziam conseguir separar o que o programa deve fazer, da sua implementação final, mas o que ele não sabia como fazer, até aquele momento em que resolveu escrever o teste antes.*” 

Daquele momento em diante, Kent continuou a trabalhar neste conceito. Em 1994, ele escreveu o seu primeiro framework de testes de unidade, o SUnit, (linguagem Smalltalk). Em 1995, ele apresentou o TDD pela primeira vez na OOPSLA - **Object-Oriented Programming, Systems, Languages & Applications**, que é uma conferência muito famosa da área de computação, já que muitas novidades tendem a aparecer lá.

No ano 2000, o JUnit surgiu e Kent Beck, junto com Erich Gamma, publicou o artigo chamado de *“Test Infected”*, que mostrava as vantagens de se ter testes automatizados e como isso pode ser viciante. Finalmente em 2002, Kent Beck lançou seu livro sobre isso, e desde então a prática tem se tornado cada vez mais popular entre as pessoas desenvolvedoras.

<br />

<h2>3. Como o TDD funciona?</h2>

O TDD na prática é muito simples: 

1. Escreva um teste que falha;

2. Escreva o código da forma o mais simples possível;

3. Faça-o passar no teste; 

4. Refatore (melhore) o código;

5. Teste novamente.

   

Na imagem abaixo, podemos visualizar de forma gráfica o Ciclo do TDD, conhecido como o **Ciclo Vermelho-Verde-Azul (Refatora)**.

<div align="center"><img src="https://i.imgur.com/9xTqi3O.png" title="source: imgur.com" width="80%"/></div>

Sempre que uma pessoa desenvolvedora recebe uma nova funcionalidade (feature) para implementar, ela geralmente encontra dificuldades nas pequenas tarefas. Tarefas essas que exigem a escrita de código. Classes são criadas, outras são modificadas para atender as novas necessidades. Todas essas modificações tem um propósito claro. Todo código escrito tem um objetivo.

Ao praticar o TDD, a pessoa desenvolvedora, antes de começar a fazer essas modificações, deixa bem claro quais são os objetivos através de testes automatizados. **O teste em código nada mais é do que um trecho de código, que deixa claro o que determinado trecho de código deve fazer**.

**Ao formalizar esse objetivo na forma de um teste automatizado, esse teste falhará porquê a funcionalidade ainda não foi implementada**. A pessoa desenvolvedora então trabalha para fazer esse teste passar. 

**Como?**

**Implementando a funcionalidade!**

Assim que o teste passar, a pessoa desenvolvedora então parte para uma próxima etapa no ciclo da busca pelo código de qualidade: **Refatorar!** 

> **Refatorar é melhorar o código que já está escrito**. É o processo de alterar um software de uma maneira que não mude o seu comportamento externo e ainda melhore a sua estrutura interna. É uma técnica disciplinada de limpar e organizar o código, e por consequência minimizar a chance de introduzir novos bugs.

Durante a implementação de um código, a pessoa desenvolvedora está focada única e exclusivamente em implementar a funcionalidade, ou seja, fazer o código rodar. Raramente a pessoa desenvolvedora está pensando na qualidade do código. Por isso que, após a implementação da funcionalidade, a pessoa desenvolvedora começa a analisar como ela pode melhorar a qualidade do código, que já funciona e atende ao requisito do negócio. Após implementar as melhorias, será necessário executar novamente os testes, para garantir que tudo continua funcionando.

<br />

<h2>4. As Regras do TDD</h2>

O Tio Bob (Robert C. Martin) definiu as regras do TDD no seu livro The Clean Coder (O código limpo).

1. Você não está autorizado a escrever qualquer código de produção a menos que seja para fazer um teste unitário falhado passar.
2. Você não está autorizado a escrever mais de um teste unitário do que é suficiente para falhar; e falhas de compilação são falhas.
3. Você não tem permissão para escrever mais código de produção do que o suficiente para passar no teste unitário falhado.

<h3>4.1 Por que seguir estas regras?</h3> 

Porque elas se destinam a facilitar sua vida!

O objetivo das regras é manter as coisas concentradas em cada fase e evitar que você fique em ciclos e isso ajuda muito a manter as coisas claras em sua cabeça. Portanto:

- Durante a fase vermelha (escrever o teste), trabalhe somente no código de teste. Um teste falhado é bom. Pelo menos se for o teste em que você está trabalhando. Todos os outros devem ser verdes.
- Durante a fase verde (fazer o teste passar), trabalhe apenas no código de produção que fará o teste passar e não refatore nada. Se o teste que você acabou de escrever falhar, isso significa que sua implementação precisa funcionar. Se outros testes falharem, você quebrou a funcionalidade existente e precisa retroceder alguns passos. 
- Durante a fase azul (refatoração), somente refatore o código de produção e não faça nenhuma alteração funcional.
  Qualquer falha no teste significa que você quebrou a funcionalidade existente. Ou você não completou a refatoração, ou precisa recuar.

<br />

<h2>5. Quais são as vantagens de utilizar o TDD?</h2>

Utilizar o TDD traz muitas vantagens para a pessoa desenvolvedora, entre elas podemos destacar:

- Feedback rápido sobre a nova funcionalidade e sobre as outras funcionalidades existentes no sistema;
- Código mais limpo, já que escrevemos códigos simples para o teste passar;
- Segurança no Refatoramento pois podemos ver o que estamos ou não afetando;
- Segurança na correção de bugs;
- Maior produtividade já que o desenvolvedor encontra menos bugs e não desperdiça tempo com debugs;
- Código da aplicação mais flexível, já que para escrever testes temos que separar em pequenos "pedaços" o nosso código, para que sejam testáveis, ou seja, nosso código estará menos acoplado.

<br />

<h2>6. Desvantagens do TDD</h2>

Utilizar o TDD também tem as suas desvantagens, entre elas podemos destacar:

- **O TDD não é uma fórmula mágica:** Os testes ajudam a localizar bugs, mas não encontram os bugs para você e muito menos resolverá todos os problemas do seu código;
- **Processo lento:** Aplicar o TDD demanda mais tempo para escrever o código, tempo este que muitas vezes o time de desenvolvimento não tem;
- **Todo o time de pessoas desenvolvedoras devem aplicar o TDD:** Como o TDD influencia o planejamento do código, é recomendado que todas as pessoas desenvolvedoras usem o TDD ou ninguém usa;
- **Todos os testes devem ser mantidos quando os requisitos mudam:** Mesmo que os requisitos mudem, você não deve remover os testes. Simplesmente tem que alterar os testes primeiro e, em seguida, fazer os testes passarem, seguindo o Ciclo do TDD.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
