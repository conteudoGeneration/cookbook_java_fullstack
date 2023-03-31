<h1>Introdução a CI/CD: Integração e Entrega Contínuas</h1>



Antes de falarmos sobre CI/CD, vamos introduzir o conceito de DEVOPS.

<br />

<h2>1. DEVOPS</h2>



Um composto de **Dev** (desenvolvimento) e **Ops** (operações), o DevOps é a união de pessoas, processos e tecnologias para fornecer continuamente valor aos clientes.

**O que o DevOps significa para as equipes?** 

O DevOps permite que  funções anteriormente isoladas – desenvolvimento, operações de TI,  engenharia da qualidade e segurança – atuem de forma coordenada e  colaborativa para gerar produtos melhores e mais confiáveis. Ao adotar  uma cultura de DevOps em conjunto com as práticas e ferramentas de  DevOps, as equipes ganham a capacidade de responder melhor às  necessidades dos clientes, aumentar a confiança nos aplicativos que  constroem e cumprir as metas empresariais mais rapidamente.

Equipes que adotam a cultura, as práticas e as ferramentas de DevOps  apresentam alto desempenho, criando produtos melhores, com mais rapidez, para maior satisfação do cliente. 

<br />

<h3>1.1. Pipeline DEVOPS</h3>



Um Pipeline de DevOps é um conjunto de práticas, ferramentas e processos automatizados usados pelas equipes de desenvolvimento (Dev) e operações (Ops) para criar e implantar código. A imagem abaixo, mostra uma visão geral de um ciclo de vida de desenvolvimento de software de um pipeline DevOps.

<div align="center"><img src="https://i.imgur.com/Zwm8hHY.png" title="source: imgur.com" /></div>

Observe que a imagem acima forma o símbolo do infinito, indicando que as etapas se repetem infinitamente.

<br />

<h3>1.2. Etapas do pipeline de desenvolvimento</h3>



Um pipeline DEVOPS é composto por 8 etapas:

1. **Planejamento: **Planejar seu projeto, tecnologia, ambiente, estrutura e arquitetura cria um roteiro para atingir com sucesso os objetivos do seu projeto. O planejamento também é o estágio em que você deseja decidir quais softwares e ferramentas usará.
2. **Código**: Esta etapa é bastante direta — é onde começamos a escrever o código para o projeto. Efetivamente, estamos nos preparando para construir um produto testável. No entanto, como escrever código pode levar muito tempo, essa é uma excelente oportunidade para maximizar as ferramentas de automação.
3. **Construir:** No estágio Build, pegamos o código fornecido e o construímos para fins de teste. O código é construído em um ambiente de desenvolvimento para permitir testes e correções de bugs.
4. **Teste:** Teste é o que parece - teste automatizado para garantir que o projeto esteja funcionando conforme o esperado, identificando quaisquer bugs ou problemas de comportamento. Dependendo do fluxo de trabalho da sua equipe, UI/UX ou testes de desempenho também acontecerão nesta etapa.
5. **Liberar:** O estágio de lançamento (Release) é onde a equipe de operações confirmará que o projeto está pronto para ser lançado e o incorporará ao ambiente de produção. Este estágio é crítico, pois é a última parada após vários estágios de verificações – como vulnerabilidades e bugs – pouco antes da implantação.
6. **Implantar:** A implantação (Deploy) é o estágio em que movemos o projeto - em seu estado atual - para o ambiente de produção para acesso dos usuários finais. Este estágio é onde as alterações aprovadas são implantadas para o consumidor/usuário.
7. **Operar:** No estágio Operate a equipe de operações configurará e gerenciará o projeto no ambiente de produção. Normalmente, a equipe contará com a automação para ajudar a manter o projeto DevOps nesse estágio.
8. **Monitorar:** No estágio Monitor, o projeto está em produção (operação). A partir dos resultados registrados, as equipes obterão mais informações sobre o comportamento, a resposta do usuário e o sucesso geral do produto.

As 4 primeiras etapas pertencem ao Desenvolvimento e as 4 últimas pertencem às Operações.

<br />

<h3>1.3. Ferramentas</h3>



Na imagem abaixo, temos um overview das principais ferramentas utilizadas em cada estágio da pipeline:

 <div align="center"><img src="https://i.imgur.com/CuRxeF8.png" title="source: imgur.com" /></div>

<br />

<h2>2.O que é CI/CD?</h2>



 <div align="center"><img src="https://i.imgur.com/9GcuWGr.png" title="source: imgur.com" /></div>



**CI/CD, Continuous Integration / Continuous Delivery**, é uma metodologia para entregar aplicações com frequência aos clientes. Para isso, é aplicada a automação nas etapas do desenvolvimento de aplicações. Os principais conceitos atribuídos a esse método são a Integração, a Entrega e a Implantação Contínuas. Com o CI/CD, é possível solucionar os problemas que a integração de novos códigos pode causar para as equipes de operações e desenvolvimento (o famoso "Inferno de Integração").

> **Automação de TI**, às vezes chamada de automação de infraestrutura, é o uso de softwares para criar instruções e processos reproduzíveis para substituir ou reduzir a interação humana com os sistemas de TI. O software de automação trabalha dentro dos limites de tais instruções, ferramentas e frameworks para executar tarefas com pouca ou nenhuma intervenção humana.
>
> **Inferno da Integração** **(integration hell)** normalmente acontece quando as pessoas esperam o dia do lançamento da aplicação para mesclar suas alterações na brach main, levando um **tempo muito maior para integrar do que o tempo que levou para fazer suas alterações originais.**.

Especificamente, o CI/CD aplica monitoramento e automação contínuos em todo o ciclo de vida das aplicações, incluindo as etapas de teste e integração, além da entrega e implantação. Juntas, essas práticas relacionadas são muitas vezes chamadas de "pipeline de CI/CD" e são compatíveis com o trabalho conjunto das equipes de operações e desenvolvimento com métodos ágeis.

<br />

<h3>2.1. Qual é a diferença entre CI e CD (e o outro CD)? </h3>

O acrônimo CI/CD tem alguns significados. "**CI**" sempre se refere à Integração Contínua, que é um processo de automação para desenvolvedores. Uma CI bem-sucedida é quando novas mudanças no código de uma aplicação são desenvolvidas, testadas e consolidadas regularmente em um repositório compartilhado. É a solução ideal para evitar conflitos entre ramificações quando muitas aplicações são desenvolvidas ao mesmo tempo.

"**CD**" se refere à Entrega Contínua e/ou à implantação contínua, conceitos relacionados e usados alternadamente às vezes. Em ambos os casos, se trata da automação de fases avançadas do pipeline, mas são usados às vezes separadamente para ilustrar o nível de automação presente.

Geralmente, a *entrega* contínua, primeiro "**CD**", **representa as mudanças feitas pelo desenvolvedor em uma aplicação, que são automaticamente testadas contra bugs e carregadas em um repositório, como o GitHub, ou em um registro de container**. Nesse repositório, a equipe de operações pode implantar essas mudanças em um ambiente de produção ativo. Isso resolve o problema de baixa visibilidade e comunicação entre as equipes de negócios e desenvolvimento. Para isso, a finalidade da Entrega Contínua é garantir o mínimo de esforço na implantação de novos códigos.

A *implantação* contínua, outro significado para "**CD**", **se refere ao lançamento automático das mudanças feitas por um desenvolvedor do repositório à produção, onde podem ser usadas pelos clientes**. Isso evita a sobrecarga das equipes de operações por conta dos processos manuais que atrasam a entrega de aplicações. Nesse conceito, são aproveitados os benefícios da Entrega Contínua ao automatizar a próxima etapa no pipeline.

 <div align="center"><img src="https://i.imgur.com/IQbZ1e6.png" title="source: imgur.com" /></div>

Na abordagem de CI/CD, é possível especificar apenas as práticas relacionadas da integração e Entrega Contínuas ou as práticas dessas duas mais as da implantação contínua. Ainda há outra questão que dificulta o entendimento: às vezes, o termo "Entrega Contínua" é usado englobando também os processos da implantação contínua.

O mais importante é lembrar de que o CI/CD é, na verdade, **um processo muitas vezes visto como um pipeline, que envolve a inclusão de um alto nível de automação e monitoramento contínuos no desenvolvimento de aplicações**. 

<br />

<h2>3. Integração contínua</h2>

No desenvolvimento moderno de aplicações, o objetivo é que muitos desenvolvedores trabalhem ao mesmo tempo em diferentes recursos na mesma aplicação. No entanto, se uma organização tiver que consolidar todo o código fonte de uma Branch em apenas um dia (conhecido como "**merge day**" ou "dia de consolidação"), o trabalho poderá ser entediante, manual e demorado. Isso acontece porque a mudança realizada em uma aplicação por um desenvolvedor que trabalha isoladamente pode entrar em conflito com outras feitas ao mesmo tempo pelos colegas. Esse problema pode ser agravado se cada desenvolvedor tiver usando seu próprio ambiente personalizado, diferente dos demais membros da equipe. O ideal é que a equipe entre em acordo com apenas um ambiente.

Com a **Integração Contínua (CI)**, as pessoas desenvolvedoras consolidam as mudanças no código em uma Branch compartilhada com mais frequência (às vezes, até diariamente). As mudanças são consolidadas e depois validadas através da criação automática da aplicação. Vários testes automatizados, geralmente de unidade e integração, são feitos para garantir que as mudanças não quebrem a aplicação. Basicamente, tudo é testado, incluindo classes, funções e diferentes módulos que formam toda a aplicação. Em caso de conflito entre os códigos novos e existentes, a CI facilita a correção desses bugs com rapidez e frequência. Veja o exemplo de um pipeline CI na imagem abaixo:

 <div align="center"><img src="https://i.imgur.com/lismtUI.png" title="source: imgur.com" /></div>

1. A prática da Integração Contínua começa com a pessoa desenvolvedora criando o seu código;
2. Na sequência, ao finalizar o código, a pessoa desenvolvedora faz um commit de alterações num sistema de controle de versão, como o Github, por exemplo, para garantir que todos estejam construindo sobre a mesma base de código. 
3. Cada commit dispara uma série de testes automatizados para verificar o comportamento e garantir que a mudança não tenha alterado o funcionamento do projeto. 
4. Após passar nos testes, o processo de geração do Build da aplicação é iniciado.
5. Ao finalizar o Build, um novo pacote é gerado.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** *Este exemplo é um exemplo de um pipeline Básico de CI, ou seja, podem existir outras etapas de acordo com as políticas da empresa.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h3>3.1. Desafios da Integração Contínua</h3>

Embora a Integração Contínua traga benefícios não apenas para os desenvolvedores, mas para a empresa como um todo, isto não significa que ela é sempre recebida de braços abertos. Para muitas empresas de desenvolvimento de software, o DevOps representa uma grande mudança na maneira como trabalham, que geram novos desafios aos processos existentes. A boa comunicação é fundamental para coordenar o esforço entre as equipes e criar uma cultura de colaboração.

Se a sua empresa já adota metodologias ágeis, a mudança é geralmente um pouco mais simples e rápida, pois a importância de ouvir o feedback para garantir que você desenvolveu a coisa certa e a noção de equipes que se organizam sozinhas já devem fazer parte da cultura da empresa.

Quando esse não é o caso, reconhecer que esta é uma mudança significativa, envolver as pessoas, começar devagar e demonstrar os benefícios à medida que se avança pode ajudar a convencer a todes dos benefícios dessa prática.

A Integração Contínua também enfrenta desafios mais práticos. Se você estiver trabalhando com um aplicativo grande e monolítico, os tempos de compilação podem ser lentos e, se os ambientes de teste forem escassos, poderá ser um grande desafio paralelizar as execuções dos testes.

Ter visibilidade de seu processo de CI e usar métricas para identificar gargalos pode ajudar a quantificar os custos e benefícios de se investir em mudanças de arquitetura, infraestrutura adicional e cobertura de testes automatizados.

<br />

<h2>4. Entrega contínua</h2>

Depois de realizar a automação de compilações e da unidade e os testes de integração na CI, a Entrega Contínua automatiza o lançamento desse código validado em um repositório. Portanto, para ter um processo eficaz de Entrega Contínua, é importante que a CI já esteja integrada ao pipeline de desenvolvimento. O objetivo da Entrega Contínua é garantir uma base de códigos que esteja sempre pronta para implantação em um ambiente de produção.

Cada etapa da Entrega Contínua, da consolidação das mudanças de código à entrega de compilações prontas para produção, inclui a automação do lançamento de códigos e do teste. No final desse processo, a equipe de operações pode implantar uma aplicação na produção com rapidez e facilidade.Veja o exemplo de um pipeline CD na imagem abaixo:

 <div align="center"><img src="https://i.imgur.com/YW2Irgp.png" title="source: imgur.com" /></div>

1. A prática da Entrega Contínua começa com a geração da Release;
2. Na sequência, a pipeline dispara uma série de testes automatizados para verificar o comportamento e garantir que a Release está funcionando corretamente. 
3. Após passar nos testes, antes de efetuar o deploy, o Lead precisa validar a Release, o chamado aceite, onde pode ser via uma mensagem do Slack, por exemplo. O importante é que este processo de aceite seja tão simples como clicar em um botão ou em um link.
4. Após o aceite, o deploy é realizado em Produção, caso a Implantação Contínua faça parte do pipeline;
5. Caso a Implantação Contínua não faça parte do pipleine CI/CD, ou seja, uma nova etapa do pipeline, o deploy é realizado em um Ambiente de pré lançamento (popularmente conhecido como Beta), onde serão realizados os testes E2E, por exemplo.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** *Este exemplo é um exemplo de um pipeline Básico de CD, ou seja, podem existir outras etapas de acordo com as políticas da empresa.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h3>4.1. Da transmissão à colaboração</h3>

Dentro da Cultura DevOps esta é uma grande mudança de mentalidade. Em vez de ver o processo de desenvolvimento de software como uma cadeia de produção de mão única, com requisitos, código e relatórios transmitidos de uma equipe para a outra de forma linear, o DevOps defende a colaboração e o feedback rápido a partir de ciclos curtos e iterativos.

**Mudar sua definição de "pronto" pode ajudar na adoção dessa mentalidade**: em vez de considerar que sua parte está concluída quando você entrega seu código para a equipe seguinte da cadeia, seu novo recurso ou alteração no código só é considerado pronto quando for lançado para ser colocado em produção. Se um problema for encontrado em qualquer estágio do pipeline, comunicar esse feedback imediatamente e colaborar para realizar uma correção faz com que a resolução seja mais rápida do que a elaboração de relatórios longos que precisariam passar por uma comissão de alterações para ter aprovação.

Ao olhar para todo o ciclo de vida de desenvolvimento de software, em vez para apenas uma parte dele, você terá uma melhor compreensão do que é necessário para entregar software aos usuários e ainda a oportunidade de abrir mais linhas de comunicação com as outras equipes envolvidas.

A **Entrega Contínua é sobre identificar os pontos problemáticos que retardam esse processo de entrega e construir um pipeline automatizado para fazer com que os lançamentos sejam mais rápidos e mais confiáveis, de forma que que você esteja sempre pronto para fazer um lançamento a qualquer momento**. Com o pipeline instalado, você deverá ser capaz de implantar e colocar no ar qualquer build de boa qualidade com um único comando.

A **Integração Contínua oferece os fundamentos para isto, com commits diários de alterações de código, seguidos por um processo automatizado de build e testes para garantir feedback rápido aos desenvolvedores. Se um build ou teste falhar, é prioridade de todos resolver o problema**.

Ao detectar os bugs no início, você pode corrigir enquanto o código ainda está vivo na sua mente e evitar que outras funcionalidades sejam criadas sobre código ruim, fazendo com que seja necessário desfazer posteriormente. Com a Entrega Contínua, o build contendo as mudanças mais recentes do processo de CI é automaticamente promovido através de uma série de ambientes de pré-produção. Embora o push final para a produção seja acionado manualmente, geralmente pelo lead, ele ainda segue um processo de script, facilitando a repetição de forma que você possa realizar lançamentos com a frequência necessária.

<h3>Vantagens e desafios da Entrega Contínua</h3>

A Entrega Contínua promete lançamentos mais rápidos sem comprometer a qualidade, mas tornar isso uma realidade requer a cooperação de diversas partes de uma organização. A quebra de ciclos longos não é apenas um desafio no curto prazo, mas também um benefício no longo prazo, pois essa colaboração vai ajudar a trabalhar de forma mais eficiente.

Implementar Entrega Contínua requer bastante investimento de tempo e pode ser um verdadeiro desafio. Adotar uma abordagem iterativa e construir seu processo ao longo do tempo torna tudo mais gerenciável e permite que você demonstre as vantagens do processo para as principais partes interessadas. A coleta de métricas sobre os tempos de build e teste, comparando-as aos procedimentos manuais é uma maneira simples de mostrar o retorno do investimento, assim como as taxas de defeitos.

Medir o valor da Entrega Contínua pode ser útil ao planejar seus requisitos de infraestrutura. À medida em que você escala seu processo de lançamento, você provavelmente irá querer começar a executar múltiplos builds e testes em paralelo. Nesse contexto, as máquinas disponíveis podem se tornar um fator limitante. Uma vez que você tenha otimizado o desempenho do seu pipeline, você talvez queira considerar a mudança para uma infraestrutura hospedada em nuvem, para que você possa escalar a solução, conforme necessário.

<br />

<h2>5. Implantação contínua</h2>

A etapa final de um pipeline de CI/CD sólido é a implantação contínua. Ela é um complemento da Entrega Contínua, que automatiza o lançamento de compilações prontas para produção em um repositório de códigos. A implantação contínua automatiza o lançamento de uma aplicação para a produção. Como não há um canal manual na etapa do pipeline antes da produção, a implantação contínua depende muito da automação otimizada dos testes.Veja o exemplo de um pipeline CD na imagem abaixo:

 <div align="center"><img src="https://i.imgur.com/CsgWD9r.png" title="source: imgur.com" /></div>

1. A prática da Entrega Contínua começa com o deploy do Beta;
2. Na sequência, a pipeline dispara uma série de testes automatizados para verificar o comportamento e garantir que a Release está funcionando corretamente. 
3. Após passar nos testes, antes de efetuar o deploy, o Lead precisa validar a Release, o chamado aceite, onde pode ser via uma mensagem do Slack, por exemplo. O importante é que este processo de aceite seja tão simples como clicar em um botão ou em um link.
4. Após o aceite, o deploy é realizado em Produção.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** *Este exemplo é um exemplo de um pipeline Básico de CD, ou seja, podem existir outras etapas de acordo com as políticas da empresa.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

Na prática, a implantação contínua significa que a mudança de uma pessoa desenvolvedora em uma aplicação será habilitada depois de alguns minutos após a gravação (supondo que ela seja aprovada no teste automatizado). Isso facilita muito mais o recebimento do feedback dos usuários. Juntas, todas essas práticas de CI/CD relacionadas diminuem o risco da implantação de aplicações, facilitando o lançamento das mudanças em pequenas partes, e não de uma só vez. No entanto, há também a necessidade de muitos investimentos iniciais, já que os testes automatizados precisam ser gravados para acomodar várias etapas de teste e lançamento no pipeline de CI/CD.

<br />

<h3>5.1. Considerações para a implantação contínua</h3>

Antes de entrar na onda da implantação contínua, vale a pena reservar um momento para considerar alguns dos problemas que normalmente surgem ao adotar a CD:

- O ciclo de vida de desenvolvimento de software envolve bem mais que apenas alterações de código. As equipes de pesquisa de usuário, marketing de produto, design de interação, documentação, comercial, jurídica e de suporte têm todas um papel a cumprir.
- Se você ainda não estabeleceu as bases com suas partes interessadas nem se envolveu com elas para entender as suas necessidades dentro do processo de lançamento, a mudança para a implantação contínua pode fazer com que elas tenham a impressão que o desenvolvimento está fora de controle. Isso pode resultar na introdução de pontos de verificação manuais e estágios de revisão que irão retardar o processo, ou até mesmo a implantação contínua ser rejeitada como um experimento fracassado.
- É essencial a criação de uma cultura de colaboração. Envolver outras equipes por todo o processo de desenvolvimento para que as opiniões quanto ao design, questões de segurança, terminologia ou conformidade possam ser incorporadas desde o início é um exemplo de como ciclos curtos de feedback podem tornar o ciclo de vida de desenvolvimento de software mais eficiente. Tão importante quanto estimular o compartilhamento de opiniões é fornecer visibilidade sobre o que está sendo lançado e quando. Manter as partes interessadas informadas é um processo que pode ser automatizado com a ajuda de um servidor de CI para disseminar informações através de painéis e notificações.

<br />

<h2>6. Ferramentas para CI/CD</h2>

Os principais sistemas operacionais para computadores disponíveis no mercado são: 

<table>
  <tr>
    <td><div align="center"><img src="https://i.imgur.com/mFzDe0C.png" title="source: imgur.com" width="50%"/></div></td>
    <td><div align="center"><img src="https://i.imgur.com/e9u3hVp.png" title="source: imgur.com" width="60%"/></div></td>
    <td><div align="center"><img src="https://i.imgur.com/B2i1yEJ.png" title="source: imgur.com" width="60%"/></div></td>
  </tr>
  <tr>
  	<td><div align="center"><b>Jenkins</b></div></td>
    <td><div align="center"><b>Github Actions</b></div></td>
    <td><div align="center"><b>Gitlab</b></div></td>
  </tr>
</table>

**Jenkins** é um servidor de automação de  código aberto. Com o Jenkins, as organizações podem acelerar o processo  de desenvolvimento de software automatizando-o. O Jenkins gerencia e controla os processos de entrega de  software em todo o ciclo de vida, incluindo construção, documento,  teste, pacote, estágio, implantação, análise de código estático e muito  mais. O Jenkins é a ferramenta mais utilizada no mercado, principalmente pelas grandes corporações.

**Github Actions** é uma plataforma de integração contínua e entrega contínua (CI/CD), disponível em todos os repositórios do Github, que permite automatizar sua compilação, teste e pipeline de implantação. Você pode criar fluxos de trabalho que criam e testam cada solicitação pull para seu repositório ou implantam solicitações pull mescladas para produção.

**Git Lab pipeline** é uma plataforma de integração contínua e entrega contínua (CI/CD), disponível em todos os repositórios do Gitlab, que permite automatizar sua compilação, teste e pipeline de implantação. Você pode criar fluxos de trabalho que criam e testam cada solicitação pull para seu repositório ou implantam solicitações pull mescladas para produção. O Gitlab pipeline é semelhante ao Github Actions.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
