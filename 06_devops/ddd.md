<h1>Introdução ao Domain Driven Design</h1>

**Domain Driven Design (DDD)** ou **Design Orientado ao Domínio**, é uma abordagem de Desenvolvimento de Software, que visa corresponder ao modelo mental do Domínio do problema, que estamos trabalhando, com o objetivo de criar uma solução computacional. O conceito de DDD é uma abordagem de modelagem de software que segue um conjunto de boas práticas com o objetivo de facilitar a implementação de regras complexas e processos de negócios que tratamos como o Domínio da aplicação.

O conceito de ***Domain Driven Design*** como o próprio nome já diz é um assunto que se refere ao ***Design do software* e não do Código propriamente dito**. Esse design é guiado pelo ***Domínio*** de sua aplicação, ou seja uma ***modelagem de software*** focada em resolver os problemas de complexidade das ***Regras de Negócio***.

<div align="center"><img src="https://i.imgur.com/YSggH3D.png" title="source: imgur.com" width="80%"/></div>

Na Imagem acima vemos que o DDD parte do Domínio Real para uma Modelo, que representa uma abstração do Mundo Real.

> **Regras de negócio:** O termo regras de negócio refere-se às **diretrizes que definem ou restringem as ações, mostrando como os Métodos devem funcionar, o que deve ser checado em cada Método e quais são os limites da aplicação**. Essas regras são importantes para que a pessoa desenvolvedora tenha uma visão clara do que deve ser feito, como e por qual razão.

*“Domain Driven Design é um conjunto de princípios com foco no Domínio, na exploração de modelos de formas criativas e definição de uma linguagem Ubíqua, baseada em um contexto delimitado.”*

O DDD não é uma receita pronta sobre como desenvolver uma arquitetura baseada em camadas. O DDD não depende de nenhuma tecnologia que você irá utilizar para fornecer sua aplicação, ou seja, ele é agnóstico. 

*“Toda Arquitetura de Software é Design, mas nem todo o Design é uma Arquitetura”* – **Grady Booch**

> **Arquitetura de software:** É o processo de converter características do software como flexibilidade, escalabilidade, viabilidade, reutilização e segurança em uma solução estruturada que atenda às expectativas técnicas e de negócios. 
>
> **Design de software:** Enquanto a arquitetura do software é responsável pelo esqueleto e pela infraestrutura de alto nível de um software, o design do software é responsável pelo design do nível de código, como o que cada módulo está fazendo, o escopo das classes e os objetivos dos Métodos, entre outros.

Os princípios defendidos por DDD têm, no seu conjunto, um objetivo central: permitir o desenvolvimento de sistemas cujo design é centrado em conceitos próximos e alinhados com um domínio de negócio.

<h2>1. Domínio</h2>

O Domínio é o coração do negócio em que você está trabalhando. O Domínio é baseado em um conjunto de ideias, regras, conhecimentos e processos do negócio. Sem um domínio o sistema e todos os seus processos, não servirão para nada. Sempre que falamos em domínio, estaremos falando da razão, do objetivo, da justificativa daquele software existir. 

O **Domínio** no contexto de Engenharia de Software é o “conhecimento” utilizado em  uma determinada área de aplicação, um campo específico para qual o  sistema foi desenvolvido. É definido por um conjunto de características  que descrevem uma família de problemas para os quais uma determinada  aplicação pretende dar solução. 

Alguns exemplos que podemos citar, incluem sistema de e-commerce, sistemas para reservas de passagens aéreas, sistema de pagamentos, entre outros.

Quando falamos em DDD (Domain Driven Design), não falamos apenas em desenvolver um software, mas sim em entender a modelagem do projeto como um todo. Se você não souber modelar o software, não conseguirá fazê-lo crescer e ser mantido a médio e longo prazo.

<h2>2. Exploração de Modelos e Formas Criativas</h2>

O DDD preza que as pessoas desenvolvedoras façam parte do processo, entendendo o negócio e todos os seus modelos nos diferentes ângulos e não apenas participando de reuniões com o Tech Lead ou com o seu Time de pessoas Desenvolvedoras.

Antigamente, a pessoa desenvolvedora se preocupava apenas com a codificação do software. O novo perfil das pessoas desenvolvedoras exige que todo o Time participe de todo o processo, desde o levantamento de requisitos até o contato com o Especialista no Domínio. Observe que a base de conhecimento dos integrantes do Time de pessoas Desenvolvedoras não pode se limitar apenas ao conhecimento técnico. Entre as habilidades recomendadas, as chamadas Soft Skills, podemos destacar:

- Comunicação

- Criatividade
- Senso Crítico
- Proatividade
- Resiliência

<h2>3. A História do DDD</h2>

O DDD não é um conceito moderno, uma ideia nova recém-descoberta. Ele nasceu entre os anos 50 e 60 com o surgimento dos primeiros conceitos da **Orientação a Objetos**, criados para solucionar problemas muito complexos, no qual uma abordagem Procedimental (Lógica Linear) não era suficiente.

No final da década de 60, surge o que muitas pessoas consideram ser a primeira linguagem Orientada a Objetos (POO -  Programação Orientada a Objetos - *Object Oriented Programming*), o Simula 67, que apresentava um resumo de todos os conceitos e experiências reunidos até o momento naquela direção.

<div align="center"><img src="https://i.imgur.com/CQv6VAN.png" title="source: imgur.com" /></div>

Anos mais tarde, em 1982, surge um novo estágio evolutivo da POO, a **Análise e Design Orientado a Objetos** (*Object Oriented Analysis and Design).*

Em 2003, surge um novo marco e um novo termo: **DDD - Domain Driven Design**, que reúne um conjunto das melhores práticas, além de novos conceitos, gerando uma estruturação revolucionária na **Análise e Design Orientado a Objetos**.

Se considerarmos todos estes conceitos, estamos falando em pelo menos **50 anos de sabedoria e experiência da comunidade de pessoas desenvolvedores de software**, sobre como lidar com **domínios de problemas complexos**.

<div align="left"><img src="https://i.imgur.com/l2A1aPc.png" title="source: imgur.com" width="35px"/><a href="https://www.wikiwand.com/pt/Simula_67" target="_blank"><b>Linguagem de Programação - Simula 67</b></a></div>

<br />

<h2>4. Como utilizar o DDD</h2>

Embora o DDD não possua um modelo rígido ou um passo a passo de como implementa-lo, podemos tentar criar um resumo inspirado nos seus princípios e boas práticas. A seguir vamos apresentar os 7 Passos essenciais do DDD, lembrando que dependendo da complexidade e/ou domínio da aplicação outras etapas podem ser necessárias.

<h3>👣 Passo 01 – Entender o Negócio</h3>

Sem entender o negócio não tem como implementar um projeto, independente de ser ou não um projeto de um software. Antes de iniciar qualquer projeto é fundamental compreender como o Negócio funciona. A análise do negócio possibilita entender a estrutura, as políticas e as operações de uma organização e recomendar soluções para que os objetivos sejam atingidos. 

Para entender o negócio é importante conversar com as pessoas envolvidas no processo, sejam pessoas colaboradoras da empresa ou pessoas desenvolvedoras, através de entrevistas, reuniões e da observação da rotina da empresa. Neste contexto, as pessoas envolvidas no projeto, basicamente são classificadas em duas categorias:

- **Domain Experts**, ou Especialistas no Domínio (Negócio), que são as pessoas que entendem do negócio, que acumularam um grande conhecimento e que vão guiar o Time de Pessoas Desenvolvedoras no projeto tirando dúvidas, definindo regras, processos e nomeando os termos a serem utilizados. São as pessoas essenciais para definição do Domínio.
- O **Time de pessoas Desenvolvedoras**, que são as pessoas que irão desenvolver o software, ou seja, um grupo multidisciplinar de pessoas, responsável por realizar o trabalho de desenvolvimento do projeto e do software de ponta a ponta. 

DDD defende que as **pessoas desenvolvedoras** devem ter um profundo conhecimento do domínio do sistema que eles desenvolvem. Esse conhecimento deve ser obtido por meio de conversas frequentes com **especialistas no domínio**. Portanto, o design do sistema deve ser norteado para atender o seu domínio. E não, por exemplo, para se moldar a uma determinada tecnologia de programação. Em suma, o design é dirigido pelo domínio, e não por frameworks, arquiteturas, linguagens de programação, entre outros.

<br />

<h3>👣 Passo 02 – Definir a Linguagem Ubíqua</h3>

Um dos pontos mais importantes do DDD, onde 99% das pessoas desenvolvedoras acabam ignorando, é falar e extrair a **Linguagem Ubíqua**. 

**Linguagem Ubíqua é a linguagem falada no dia a dia por todos os envolvidos no projeto.**

É a linguagem criada a partir da união dos termos falados no dia a dia, no contexto da empresa e os termos falados no dia a dia , no contexto do time de pessoas desenvolvedoras, que são relevantes para que todos compreendam o projeto.

Como citado anteriormente, é preciso conhecer a linguagem utilizada pelas pessoas envolvidas no projeto. Ignorar esta etapa é o primeiro grande passo para o fracasso do software, por este motivo é importante familiarizar-se com a linguagem do negócio. 

A Linguagem Ubíqua deve ser elaborada pelo Time de Pessoas Desenvolvedoras em conjunto com os Especialistas no negócio.

<div align="center"><img src="https://i.imgur.com/vbK7pW5.png" title="source: imgur.com" width="80%"/></div>

A imagem acima, ilustra que existem termos que **somente os Especialistas no Domínio conhecem**, assim como existem outros termos, de cunho tecnológico, que **são do conhecimento apenas do Time de Pessoas Desenvolvedoras**. Porém, existe um conjunto de termos que devem ser do conhecimento de ambos, os quais formam a **Linguagem Ubíqua** do sistema. Desta forma, todes os envolvidos falarão a mesma língua.

Os termos da Linguagem Ubíqua são usados com dois propósitos:

- Para **possibilitar uma comunicação fluida entre as pessoas desenvolvedoras e os especialistas no domínio**.
- Para **nomear entidades do código do sistema**, como classes, métodos, atributos, pacotes, módulos, tabelas de bancos de dados, rotas de API's, entre outros.

Um processo importante na definição da Linguagem Ubíqua do negócio é definir o **Glossário das palavras**. Observe a lista de palavras abaixo:

- Carregador de celular
- Usuário/Cliente
- Perfil
- Estação
- Localização
- Meu histórico
- Pagamento

Algumas destas palavras podem ter vários significados dependendo do contexto, por isso é importante definir o significado destas palavras de acordo com o contexto da aplicação. Se levarmos em consideração o contexto de um software de **aluguel de carregadores de celular portátil**, como um serviço oferecido nas Estações de Trem e Metrô, que são reservados através de um aplicativo, podemos definir o seguinte Glossário de palavras:

- **Carregador de celular** – Objeto que será alugado, cujas características serão armazenadas na aplicação.
- **Usuário/Cliente** – Pessoa que alugará o carregador de celular, cujos dados serão armazenados na aplicação.
- **Perfil** – Espaço na aplicação onde a pessoa visualiza seus dados e poderá editá-los ou excluir a conta.
- **Estação** – Local físico onde a pessoa poderá retirar o seu carregador portátil, cujos dados ficam armazenados na aplicação.
- **Localização** – Entidade responsável por verificar a localização da pessoa usuário no momento da retirada do carregador, ou seja, a estação em que foi retirado e entregue o carregador.
- **Meu histórico** – Lista o histórico de aluguéis da pessoa usuária com localização da estação de retirada e de entrega e data/hora do aluguel.
- **Pagamento** – Parte em que o usuário efetua o pagamento do aluguel do carregador.

Uma vez definido o Glossário, este será utilizado até o final do projeto, dentro de um ou mais contextos.

<br />

<h3>👣 Passo 03 – Identificar os Contextos da aplicação</h3>

Com o tempo, sistemas de software ficam mais complexos e abrangentes. Por isso, é irrealista imaginar que sistemas de organizações grandes e complexas vão possuir um modelo de domínio único e baseado na mesma linguagem ubíqua.

Em vez disso, é natural que tais organizações tenham sistemas que atendem a usuários com perfis e necessidades diferentes, o que complica a definição de uma única linguagem ubíqua. A solução para esse problema consiste em quebrar tais domínios complexos em domínios menores, os quais em DDD são chamados de **Contextos Delimitados** (*Bounded Contexts*).

Os **Contextos Delimitados**, delimita os contextos de atuação da sua aplicação. Cada contexto possui suas responsabilidades claramente definidas que por sua vez possuem a sua própria **Linguagem Ubíqua**. A utilização de histórias e levantamento do escopo do projeto com o Especialista no Domínio auxilia no processo de delimitação dos contextos.

<div align="center"><img src="https://i.imgur.com/p0XetJ9.png" title="source: imgur.com" /></div>

Na imagem acima vemos uma abstração dos Contextos delimitados e suas interações.

Uma técnica muito utilizada para identificar os Contextos Delimitados é criar uma descrição detalhada de cada processo, ou seja, escrever a história de como funciona cada processo. Veja um exemplo abaixo:

**História: *Alugar um carregador de celular portátil***

1. Criar uma conta no aplicativo.
2. Fazer login no aplicativo.
3. Adicionar seus dados pessoais e salvar em seu *Perfil*.
4. Habilitar o GPS para compartilhar a sua localização com o aplicativo. 
5. Visualizar uma mensagem de confirmação se a *Estação* em que se localiza corresponde à captada pelo GPS. 
6. Habilitar a câmera para captar os dados do carregador portátil via QR Code.
7. Visualizar mensagem de confirmação de dados coletados. 
8. Visualizar tela para preenchimento das informações de *Pagamento*. 
9. Inserir as informações de *Pagamento*.
10. Visualizar mensagem de confirmação do carregador portátil liberado.

Com os itens acima, é possível começar a delimitar os contextos da aplicação, as entidades envolvidas em cada um e as ações (Métodos) que o aplicativo irá realizar.

<br />

<h3>👣 Passo 04 – Modelagem Estratégica</h3>

Para a aplicação ter um bom design, uma fácil manutenção / extensibilidade e o domínio ser bem modelado é necessário focar em **Modelagem Estratégica**, que é a definição formal dos contextos que utilizaremos no sistema. Neste momento é importante preocupar-se com a integridade do modelo conforme o Diagrama do Mapa de Contextos abaixo:

<div align="center"><img src="https://i.imgur.com/HUXKy7e.png" title="source: imgur.com" /></div>

Todos os conceitos do Mapa de Contextos acima são importantes e é necessário compreender muito bem cada um deles para termos condição de realizar uma boa modelagem.

<h4>✔ Big Ball of Mud - (A grande bola de lama!)</h4>

Este conceito aborda os aspectos negativos da sua aplicação, desde um código que fere os princípios do **SOLID** e do **Clean Code**, até uma entidade com muitas responsabilidades em um único contexto. Analise a imagem a seguir:

<div align="center"><img src="https://i.imgur.com/XrlNigl.png" title="source: imgur.com" /></div>

A entidade Carregador possui diversos comportamentos, cada um destes comportamentos está ligado a uma intenção da aplicação, todas as intenções são relativas ao carregador em si, porém imagine a complexidade desta classe e quantas equipes de desenvolvimento estão compartilhando a mesma classe em comum?

A entidade Carregador atende aspectos do Pagamento, Perfil, Conta, entre outras. Esse tipo de modelagem pode ser considerada um bom exemplo de **Big Ball of Mud**, pois qualquer manutenção nessa entidade pode ocasionar impactos sérios em diversos pontos da aplicação, além de ser praticamente impossível gerenciar e documentar as mudanças.

<h4>✔ Como resolver ou evitar este tipo de cenário?</h4>

**O DDD não é sobre dividir a aplicação em camadas responsáveis, o DDD é sobre modelar corretamente o domínio do seu negócio**. Se sua aplicação possui uma única camada de domínio e esta camada concentra todas as entidades do seu negócio você pode estar cometendo um grande erro de modelagem do domínio. Para aplicações que possuem domínios muito complexos o ideal é aplicar o conceito de Contextos Delimitados.

Os contextos delimitados buscam delimitar o seu domínio complexo em contextos baseados nas intenções do negócio. Isto significa que você deve delimitar as intenções de suas entidades com base no contexto que ela pertence. Analise a imagem a seguir:

<div align="center"><img src="https://i.imgur.com/LaZH2iH.png" title="source: imgur.com" /></div>

O domínio foi subdividido em 4 Contextos Delimitados, um para cada intenção de negócio (Pagamento, Perfil, Conta, entre outros). Agora cada contexto delimitado possui uma entidade Carregador. Cada **versão da entidade Carregador é única e exclusiva de cada um dos 4 Contextos Delimitados existentes**. 

A entidade Carregador possui comportamentos que atendem necessidades específicas do seu Contexto Delimitado, a única coisa em comum entre todas as entidades Carregador é sua identidade. A identidade em comum vai ajudar na persistência e na comunicação entre os Contextos Delimitados.

<h4>✔ Representar a mesma entidade em diversos Contextos Delimitados não seria duplicar o código?</h4>

De forma alguma. Duplicar código é ter a mesma responsabilidade em trechos de código diferentes. Neste caso existe uma segregação de comportamentos e intenções de uma entidade conforme o contexto em que ela está. Não importa se a entidade é persistida na mesma tabela ou em tabelas diferentes, neste caso ambos os cenários são aceitos.

<h4>✔ Características importantes de um Contexto Delimitado</h4>

- Cada **Contexto Delimitado pode possuir sua própria abordagem de arquitetura**. Camadas de aplicação, persistência, infra-estrutura, entre outros.
- A **arquitetura de um Contexto Delimitado não precisa estar necessariamente no padrão DDD** (Domain Model) pode ser um modelo mais simples.
- Cada **Contexto Delimitado pode possuir um meio próprio de persistência**, seja ele relacional, NoSQL, em memória / cache, entre outros.
- Os **Contextos Delimitados podem se comunicar entre si de diversas maneiras**, inclusive utilizando eventos de domínio “*Domain Events*”.
- Cada **Contexto Delimitado possui sua própria Linguagem Ubíqua**.
- Cada **Contexto Delimitado pode ser desenvolvido por um time de desenvolvedores diferente**. Não existe necessidade de um único time conhecer a implementação de todos os contextos, pelo contrário, por motivos de segurança o fonte de um Contexto Delimitado pode ser restrito a um time específico.

> Um evento é algo que ocorreu no passado. Um **Evento de Domínio** é algo que ocorreu no domínio que você deseja que outras partes do mesmo domínio (em processo) tenham conhecimento. As partes notificadas geralmente reagem de alguma forma aos eventos.

Na imagem abaixo, temos a representação gráfica dos Contextos Delimitadores da nossa aplicação de aluguel de carregadores de celular:

<div align="center"><img src="https://i.imgur.com/5PARIYG.png" title="source: imgur.com" /></div>

Observe que os contextos foram classificados pelos seguintes critérios:

**Domínio principal:** quando o Contexto é a razão de existir do sistema proposto, ou seja, sem ele o software não existe. Num sistema de aluguel de carregadores de celular portátil, sem o Domínio carregador, o serviço não existe.

**Domínio genérico (Subdomínio):** quando o Contexto ajuda em todo o processo e faz com que o domínio principal funcione. ele é chamado de genérico porque trabalha de forma independente e pode servir para diversas coisas, não somente para um único propósito. Pagamento é um bom exemplo, pois ele não se limita apenas ao pagamento do carregador.

**Domínio auxiliar:** pode até ser confundido com domínio genérico, mas não é, pois ele auxilia o sistema como um todo, inclusive os domínios genéricos a funcionarem. Autenticação, que é responsável pelo login do usuário no sistema é um bom exemplo.

Observe que quando conseguimos identificar os contextos e classificá-los, ficará muito mais fácil o desenvolvimento da aplicação. 

<div align="left"><img src="https://i.imgur.com/XtXfL8a.png" title="source: imgur.com" width="25px"/><a href="https://medium.com/desenvolvendo-com-paixao/o-que-%C3%A9-solid-o-guia-completo-para-voc%C3%AA-entender-os-5-princ%C3%ADpios-da-poo-2b937b3fc530" target="_blank"><b>Artigo: O que é SOLID: O guia completo para você entender os 5 princípios da POO</b></a></div>

<div align="left"><img src="https://i.imgur.com/XtXfL8a.png" title="source: imgur.com" width="25px"/><a href="https://blog.betrybe.com/tecnologia/clean-code/" target="_blank"><b>Artigo: Clean code: O que é?, Por quê usar? e as principais regras!</b></a></div>

<br />

<h3>👣 Passo 05 - Context Map</h4>


O **Context Map** ou **Mapa de contexto** é o mapeamento dos Contextos Delimitados, ou seja, a representação Gráfica das relações entre eles. 

<h4>✔ Padrões de relacionamento entre Contextos Delimitados</h4>

Antes de falarmos sobre os padrões de relacionamento entre Contextos Delimitados, precisamos compreender dois conceitos importantes:

- **Contexto Upstream**: É um contexto que influenciará a contraparte, **Contexto Downstream**. O oposto pode não ser verdadeiro.
- **Contexto Downstream**: É um contexto que será influenciado pela sua contraparte, **Contexto Upstream**. 

Existem diversos patterns (padrões) que descrevem o tipo de relacionamento entre os Contextos Delimitados. Veja na tabela abaixo os padrões mais utilizados:

| Padrão                                                  | Descrição                                                    |
| ------------------------------------------------------- | ------------------------------------------------------------ |
| **Shared Kernel** <br />(Núcleo compartilhado)          | O **Shared Kernel** é um tipo de Contexto Delimitado onde N Contextos Delimitados dependem dele, uma espécie de Core (Núcleo) do domínio. Este tipo de contexto não pode ser alterado sem consultar todos os times de pessoas desenvolvedoras que dependem dele. |
| **Customer / Supplier** <br />(Cliente / Fornecedor)    | O time de pessoas desenvolvedoras downstream atua como cliente (customer) do time de pessoas desenvolvedoras upstream, que atua como fornecedora (supplier). Ambos os times de pessoas desenvolvedoras definem testes de aceitação automatizados, que validam as interfaces que o time de pessoas desenvolvedoras upstream fornece. O time de pessoas desenvolvedoras upstream pode então fazer alterações em seu código sem medo de quebrar alguma coisa do timed de pessoas desenvolvedoras downstream. |
| **Conformist** (Conformista)                            | É o cenário onde os times de pessoas desenvolvedoras downstream e upstream não estão mutuamente alinhadas e o time de pessoas desenvolvedoras downstream precisa atender o negócio com o que o time de pessoas desenvolvedoras upstream fornece mesmo não estando de acordo com as necessidades. O time de pessoas desenvolvedoras downstream precisa aceitar este fato e se conformar com isto. |
| **Partner** (Parceira)                                  | Neste cenário os dois times possuem dependências mútuas em seus contextos e precisam somar esforços de modelagem para se atenderem mutuamente. |
| **Anti Corruption Layer** <br />(Camada Anti-Corrupção) | Neste cenário o time de pessoas desenvolvedora sdownstream desenvolve uma camada adicional anti-corrupção para se comunicar com o contexto delimitado upstream. Este é o cenário típico onde o contexto fornecedor é um sistema legado ou uma API mal desenvolvida. |


Na imagem abaixo, temos o Mapa de Contexto simplificado, da nossa aplicação de aluguel de carregadores de celular, com os respectivos relacionamentos:

<div align="center"><img src="https://i.imgur.com/9jt3sXw.png" title="source: imgur.com" width="80%"/></div>

Observe no Mapa de Contexto existe a relação entre domínios principais e domínios genéricos. Os domínios principais são **upstream**, ou seja, **têm prioridade em relação aos genéricos**, que são **downstream**. Isso significa que na ordem de prioridade, quando alguma coisa mudar, será prioritariamente do lado dos domínios genéricos. Nestes casos, temos uma **Relação Cliente Fornecedor**. 

Já na relação entre domínios genéricos, **prevalece o que nós não temos autonomia para alterar**. Observe que nas relações **perfil/pagamento**, **estação/localização** e **conta/autenticação**, nós não temos controle sobre a API de pagamento e sobre a API do Google Maps, assim como não temos a garantia de que o usuário será autenticado, logo a relação é **simultaneamente upstream/downstream**. Neste caso, temos uma **Relação Conformista**. Nesta Relação será criada uma **Camada anticorrupção** para não termos que refazer todo o processo novamente, caso haja alguma alteração no meio do caminho. 

Em relação a autenticação temos um núcleo compartilhado onde todos poderão acessar esse processo. Neste caso, também temos uma **Relação Conformista**.

<br />

<h3>👣 Passo 06 - Definir a Arquitetura Contextual</h3>

Após a conclusão do Mapa de contexto é necessário definir qual a Arquitetura de Software será utilizada em cada contexto delimitado. Cada contexto terá a sua arquitetura, independente dos demais ou a combinação de duas ou mais arquiteturas. O DDD não impõe o mesmo estilo arquitetural para todos os contextos, é a análise do contexto que indica qual a melhor opção.

Existem diversos Modelos de Arquitetura de Software, entre os quais podemos citar:

- Arquitetura Onion

- Arquitetura Hexagonal
- Microsserviços
- Arquitetura em Camadas (Layer)

Existem outras Arquiteturas que podem ser utilizadas. Aqui estamos dando destaque as mais utilizadas no Mercado atualmente. Uma pessoa arquiteta de software deve conhecer as diversas Arquiteturas e principalmente saber reconhecer onde e quando devem ser utilizadas.

<div align="left"><img src="https://i.imgur.com/XtXfL8a.png" title="source: imgur.com" width="25px"/><a href="https://medium.com/p/551f460c3b2c" target="_blank"><b>Artigo: Arquitetura Onion: Definição, Camadas e Benefícios.</b></a></div>

<div align="left"><img src="https://i.imgur.com/XtXfL8a.png" title="source: imgur.com" width="25px"/><a href="https://github.com/rafaelq80/cookbook_nest/blob/main/03_nest/01.md#arquitetura-hexagonal" target="_blank"><b>Arquitetura Hexagonal</b></a></div>

<div align="left"><img src="https://i.imgur.com/XtXfL8a.png" title="source: imgur.com" width="25px"/><a href="https://medium.com/@marcelomg21/arquitetura-de-microsservi%C3%A7os-bc38d03fbf64" target="_blank"><b>Artigo: Arquitetura de Microsserviços</b></a></div>

<div align="left"><img src="https://i.imgur.com/XtXfL8a.png" title="source: imgur.com" width="25px"/><a href="https://guia.dev/pt/pillars/software-architecture/layers.html#" target="_blank"><b>Arquitetura de Camadas (Layer)</b></a></div>

<br />

<h3>👣 Passo 07 - Modelagem Tática</h3>

A **Modelagem Tática** está relacionada com os blocos de construção da DDD, ou seja, um conjunto de recursos técnicos usados na construção do *Modelo de domínio* do negócio. Neste momento é importante preocupar-se com a integridade do modelo conforme o Diagrama de Design do Modelo do Domínio abaixo:

<div align="center"><img src="https://i.imgur.com/MGmEDuN.png" title="source: imgur.com" /></div>

Todos os conceitos apresentados no diagrama acima são importantes e é necessário compreender muito bem cada um deles para termos condição de realizar uma boa modelagem do domínio.

O diagrama acima representa o padrão **Domain Model Pattern**, que é uma abordagem de como escrever as classes que vão mapear os modelos do mundo real e implementar os comportamentos do negócio. Esse é o modelo mais utilizado e recomendado ao utilizar o DDD.

O Domain Model Patterns são padrões de desenvolvimento e estruturação de aplicações cujo domínio é o principal foco, sendo que eles estão focados em entidades de agregadores, objetos de valor, repositórios e serviços.

O **Domain Model Pattern deve ser isolado dos detalhes da sua arquitetura como persistência (Banco de dados), Linguagem, Framework, entre outros**. 

O Domain Model Pattern atende as convenções do DDD. Essas convenções estão representadas nos círculos azuis do Diagrama acima. As convenções expressadas no Diagrama são as seguintes:

- **Entidade:** Uma entidade do domínio, possui estados e comportamentos, lógica de negócio, getters e setters AdHoc, etc.
- **Objeto de valor (Value Object):** Um objeto que agrega valor às entidades, não possui identidade e é imutável. Um exemplo é o endereço de uma Estação de Trem ou Metrô.
- **Objetos Agregados (Aggregate Object)):** são compostos por uma entidade ou um conjunto de entidades e Value Objects que compartilham um mesmo contexto. Por exemplo, o pagamento e uma transação realizada.
- **Factory:** Classe responsável por construir adequadamente um objeto / entidade.
- **Service:** Serviço do domínio que atende partes do negócio que não se encaixam em entidades específicas, trabalha com diversas entidades, realiza persistência através de repositórios e etc.
- **Repository:** Uma classe que realiza a persistência das entidades se comunicando diretamente com o meio de acesso aos dados, é utilizado apenas um repositório por agregação.
- **Evento do Domínio (Domain Event):** São eventos disparados quando acontece alguma alteração ao domínio. Isso ocorre para que outras partes tenham conhecimento da alteração que aconteceu.

Todos esses conceitos são essenciais para definição do DDD, mas existem alguns princípios relacionados a cada um deles que, quando presentes, não necessariamente significam que a sua aplicação utiliza DDD, ou seja, não basta simplesmente implementar todos estes conceitos no código, é preciso fazer todo o processo de modelagem proposto pelo DDD para compreender o domínio da aplicação, delimitar os contextos e estabelecer os relacionamentos entre os contextos.

Na imagem abaixo temos uma representação Gráfica destes conceitos:

<div align="center"><img src="https://miro.medium.com/max/1400/1*B4dzWNEPBnqK5jtuIAgVYQ.png" title="source: imgur.com" /></div>

<br />

## Como criar um modelo efetivo?

Para construir um modelo efetivo, é importante combinar os seguintes fatores: 

- A **implementação deve refletir o modelo real** de acordo com a necessidade de cada contexto. 
- **Construção de um modelo evolutivo**, ou seja, que fica mais profundo e rico em conhecimento à medida que são acrescentadas alterações e novas regras ao domínio. 
- **Refinar o modelo** adicionando e retirando conceitos à medida que necessário, com as mudanças acrescentadas ao domínio. 
- **Estabelecer uma linguagem baseada no modelo** entre as pessoas especialistas de domínio e pessoas desenvolvedoras, que seja entendida por ambos. A linguagem é desenvolvida desde a primeira interação mas todos ficam fluentes ao longo do processo. 
- **Muita experimentação e estratégias de interações** entre pessoas desenvolvedoras e especialistas no domínio. Quanto mais o domínio fica evidente e a linguagem é bem estabelecida entre o time, mais fácil é o processo de desenvolvimento como um todo. 

<br />

<h2>5. Quais as vantagens do Domain Driven Design?</h2>

- Iterações (ciclos) de desenvolvimento mais rápidos
- Alta colaboração entre membros do time 
- Torna o código reutilizável e legível 
- Facilita a manutenção graças a definição da complexidade dos limites.

<br />

<h2>6. Quais as desvantagens do Domain Driven Design? </h2>

Cada projeto é único e deve ser estudado caso a caso, mas é importante levar em consideração as desvantagens nos contextos de: 

- **Complexidade técnica:** quando as tecnologias envolvidas já são muito complexas e envolve um esforço grande do time para refatorar o que existe com DDD. 
- **Complexidade de domínio:** quando existem muitos subdomínios dentro de um outro, e a manutenção de uma funcionalidade simples exige mexer em muitos subdomínios. 

<h2>7. Quando devo utilizar o DDD?</h2>

DDD é uma filosofia de desenvolvimento voltada para domínios de negócio complexos. Envolve um conjunto de práticas de entendimento do negócio, comunicação, colaboração, e desenvolvimento de uma solução emergente que reflita o domínio no próprio código. Para ajudar a descobrir se você deve ou não implementar o DDD no seu projeto, utilize o **DDD Score Card** (tabela abaixo). 

A ideia é bem simples, a primeira coluna descreve seu projeto, em seguida o número de pontos que devem ser acumulados, a última coluna descreve algumas observações. Se no final a **somatória dos pontos for igual ou maior que 7 considere seriamente implementar o DDD em seu projeto**.

| **Se o seu Projeto…**                                        | **Pontos** | **Pensamentos de Suporte**                                   |
| ------------------------------------------------------------ | :--------: | ------------------------------------------------------------ |
| Se sua aplicação for completamente centrada em dados e se qualificar verdadeiramente para uma solução CRUD, em que cada operação é basicamente uma consulta simples de banco de dados para criar, ler, atualizar ou excluir, você não precisa do DDD. |   **0**    | Um sistema totalmente baseado na implementação de vários CRUD's não precisa de um modelo para projetos complexos como o DDD. |
| Se seu sistema exigir apenas 30 ou menos operações de negócio, ele provavelmente é bem simples. Isso significa que a aplicação não teria um total de mais de 30 histórias de usuário ou fluxos de caso de uso, com cada um desses fluxos tendo apenas uma lógica mínima de negócio. Se você puder desenvolver de forma rápida e facilmente esse tipo de aplicação, o sistema provavelmente não precisará usar o DDD. |   **1**    | Neste exemplo estamos falando de 25 a 30 únicos métodos de negócio, não de 25 a 30 interfaces de serviço completas, cada uma com vários métodos, o que seria um cenário complexo. |
| Em algum lugar no intervalo entre 30 e 40 histórias de usuário ou fluxos de caso de uso, a complexidade poderia ser pior. Seu sistema pode estar entrando no território do DDD. |   **2**    | Geralmente a complexidade não é reconhecida rapidamente. Nós, pessoas desenvolvedoras, costumamos subestimar a complexidade, apenas pelo desafio de codificar uma aplicação em N camadas com diversos Patterns (Padrões), mas isso não significa que devemos fazer. <br />No longo prazo, essas aplicações poderiam prejudicar mais do que realmente ajudar. |
| Mesmo que a aplicação não seja complexa agora, a complexidade dela aumentará no futuro? <br />Você só irá descobrir depois que os usuários reais começarem a trabalhar com ela, mas tenha cuidado aqui.<br />Se houver qualquer indício de que a aplicação tem alguma complexidade moderada no momento, talvez seja interessante ser um pouquinho precavido e considerar que isso pode ser um indicativo de que ela poderá se tornar mais do que moderadamente complexa no futuro. Avalie a possibilidade de utilizar o DDD. |   **3**    | Aqui vale a pena analisar os cenários de uso mais complexos com os Domain Experts e ver aonde eles levam. <br />Os Domain Experts: <br />1. Já estão solicitando recursos mais complexos? <br />Se sim, isso provavelmente é uma indicação de que a aplicação já é ou em breve se tornará excessivamente complexa para usar uma abordagem CRUD.<br />2. Estão entediados com os recursos ao ponto em que dificilmente vale a pena discuti-los? <br />Provavelmente a aplicação não é complexa. |
| Os recursos da aplicação serão alterados com frequência ao longo de alguns anos, e você não pode antecipar que as alterações serão simples. |   **4**    | O DDD pode ajudá-lo a gerenciar a complexidade da refatoração de seu modelo ao longo do tempo. |
| Você não entende o Domínio porque ele é novo. Na medida em que você e sua equipe se aprofundam na análise, percebem que ninguém fez isso antes. <br />Isso provavelmente significa que ele é complexo ou, pelo menos, merece a devida análise para determinar o nível de complexidade. |   **5**    | Você precisará trabalhar com os Domain Experts e testar os modelos para fazer a coisa certa. Você certamente também pontuou em um ou mais dos critérios anteriores, portanto, use o DDD. |

Ao finalizar o teste você terá mais clareza para determinar se o DDD é viável ou não para o seu projeto. Lembre-se de tomar as decisões com foco na simplicidade, entrega e manutenção. Muitas vezes sofremos da vontade incontrolável de implementar todos os conceitos de nossos estudos, porém estamos colocando em risco o dinheiro da empresa e nossa própria carreira.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
