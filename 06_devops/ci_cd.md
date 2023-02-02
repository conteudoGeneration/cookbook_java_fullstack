<h1>Introdução a CI/CD: integração e entrega contínuas</h1>

<h3>O que é CI/CD?</h3>





![enter image description here](https://miro.medium.com/proxy/1*TNJ7Rpr5G1OJHtKH-IBEFw.png)



CI/CD, continuous integration/continuous delivery, é um método para entregar aplicações com frequência aos clientes. Para isso, é aplicada a [automação](https://www.redhat.com/pt-br/topics/automation/whats-it-automation) nas etapas do desenvolvimento de aplicações. Os principais conceitos atribuídos a esse método são a integração, entrega e implantação contínuas. Com o CI/CD, é possível solucionar os problemas que a integração de novos códigos pode causar para as equipes de operações e desenvolvimento (o famoso "[inferno de integração](https://www.solutionsiq.com/agile-glossary/integration-hell/)").

Especificamente, o CI/CD aplica monitoramento e automação contínuos em todo o [ciclo de vida das aplicações](https://www.redhat.com/pt-br/topics/devops/what-is-application-lifecycle-management-alm), incluindo as etapas de teste e integração, além da entrega e implantação. Juntas, essas práticas relacionadas são muitas vezes chamadas de "pipeline de CI/CD" e são compatíveis com o trabalho conjunto das [equipes de operações e desenvolvimento](https://www.redhat.com/pt-br/topics/devops) com métodos ágeis.

<h2>Qual é a diferença entre CI e CD (e o outro CD)? </h2>

O acrônimo CI/CD tem alguns significados. "CI" sempre se refere à integração contínua, que é um processo de automação para desenvolvedores. Uma CI bem-sucedida é quando novas mudanças no código de uma aplicação são desenvolvidas, testadas e consolidadas regularmente em um repositório compartilhado. É a solução ideal para evitar conflitos entre ramificações quando muitas aplicações são desenvolvidas ao mesmo tempo.

"CD" se refere à entrega contínua e/ou à implantação contínua, conceitos relacionados e usados alternadamente às vezes. Em ambos os casos, se trata da automação de fases avançadas do pipeline, mas são usados às vezes separadamente para ilustrar o nível de automação presente.

Geralmente, a *entrega* contínua representa as mudanças feitas pelo desenvolvedor em uma aplicação, que são automaticamente testadas contra bugs e carregadas em um repositório, como o [GitHub](https://redhatofficial.github.io/#!/main), ou em um registro de container. Nesse repositório, a equipe de operações pode implantar essas mudanças em um ambiente de produção ativo. Isso resolve o problema de baixa visibilidade e comunicação entre as equipes de negócios e desenvolvimento. Para isso, a finalidade da entrega contínua é garantir o mínimo de esforço na implantação de novos códigos.

A *implantação* contínua, outro significado para "CD", se refere ao lançamento automático das mudanças feitas por um desenvolvedor do repositório à produção, onde podem ser usadas pelos clientes. Isso evita a sobrecarga das equipes de operações por conta dos processos manuais que atrasam a entrega de aplicações. Nesse conceito, são aproveitados os benefícios da entrega contínua ao automatizar a próxima etapa no pipeline.

![enter image description here](https://www.redhat.com/cms/managed-files/styles/wysiwyg_full_width/s3/ci-cd-flow-desktop_edited_0.png?itok=TzgJwj6p)

1. Na abordagem de CI/CD, é possível especificar apenas as práticas relacionadas da integração e entrega contínuas ou as práticas dessas duas mais as da implantação contínua. Ainda há outra questão que dificulta o entendimento: às vezes, o termo "entrega contínua" é usado englobando também os processos da implantação contínua.

   Por fim, não vale a pena se prender a esses conceitos. Basta se lembrar de que o CI/CD é, na verdade, um processo muitas vezes visto como um pipeline, que envolve a inclusão de um alto nível de automação e monitoramento contínuos no desenvolvimento de aplicações. Em cada caso, o que esses termos querem dizer depende da quantidade de automação implantada no pipeline de CI/CD. Muitas empresas começam adicionando CI e depois trabalham para automatizar a entrega e implantação. Por exemplo, como parte de [aplicações nativas na nuvem](https://www.redhat.com/pt-br/topics/cloud-native-apps).

<h2>Integração contínua</h2>

No [desenvolvimento moderno de aplicações](https://www.redhat.com/pt-br/solutions/cloud-native-development), o objetivo é que muitos desenvolvedores trabalhem ao mesmo tempo em diferentes recursos na mesma aplicação. No entanto, se uma organização tiver que consolidar todo o código-fonte de ramificação em apenas um dia (conhecido como "[merge day](https://thedailywtf.com/articles/Happy_Merge_Day!)" ou "dia de consolidação"), o trabalho poderá ser entediante, manual e demorado. Isso acontece porque a mudança realizada em uma aplicação por um desenvolvedor que trabalha isoladamente pode entrar em conflito com outras feitas ao mesmo tempo pelos colegas. Esse problema pode ser agravado se cada desenvolvedor tiver seu próprio [ambiente de desenvolvimento integrado (IDE)](https://www.redhat.com/pt-br/topics/middleware/what-is-ide) local personalizado. O ideal seria que a equipe entrasse em acordo com apenas um IDE baseado em nuvem.

Com a integração contínua (CI), os desenvolvedores consolidam as mudanças no código de volta a uma ramificação compartilhada ou "tronco" com mais frequência (às vezes, até diariamente). As mudanças são consolidadas e depois validadas através da criação automática da aplicação. Vários testes automatizados, geralmente de unidade e integração, são feitos para garantir que as mudanças não corrompam a aplicação. Basicamente, tudo é testado, incluindo classes, funções e diferentes módulos que formam toda a aplicação. Em caso de conflito entre os códigos novos e existentes, a CI facilita a correção desses bugs com rapidez e frequência.

A prática da integração contínua começa com a realização do commit de alterações num [sistema de controle de fontes/versão](https://www.jetbrains.com/pt-br/teamcity/ci-cd-guide/concepts/version-control/), em intervalos regulares, para garantir que todos estejam construindo sobre a mesma base de código. Cada commit dispara um build e uma série de [testes automatizados](https://www.jetbrains.com/pt-br/teamcity/ci-cd-guide/automated-testing/) para verificar o comportamento e garantir que a mudança não tenha quebrado nada. Embora a integração contínua traga benefícios por si só, ela é também a primeira etapa para implementar um [pipeline de CI/CD](https://www.jetbrains.com/pt-br/teamcity/ci-cd-guide/ci-cd-pipeline/).

#### O que é controle de versão?

Sistemas de controle de versão (VCS), também conhecidos como sistemas de gerenciamento de código-fonte (SCM), permitem que você acompanhe todas as alterações na sua base de código. Ao manter seus arquivos em um sistema de controle de versão, você pode ver cada edição, adição ou exclusão, quando ela foi feita e por quem.

Você também pode reverter para um estado anterior e comparar as alterações nos arquivos ao longo do tempo. O controle de versão é [uma ferramenta essencial](https://www.jetbrains.com/pt-br/teamcity/ci-cd-guide/ci-cd-tools/) para o desenvolvimento de softwares modernos. Isso não apenas dá a todos visibilidade das alterações, como também permite que várias pessoas trabalhem nos mesmos arquivos e mesclem suas atualizações, tornando mais fácil gerenciar versões e lançamentos.

#### Testes automatizados para CI/CD

O teste automatizado é a aplicação de ferramentas de software para automatizar um processo manual conduzido por humanos de revisão e validação de um produto de software. A maioria dos projetos de software [ágeis](https://www.atlassian.com/br/agile) e de [DevOps](https://www.atlassian.com/br/devops/what-is-devops) modernos agora inclui testes automatizados desde o início. Para apreciar de verdade o valor dos testes automatizados, no entanto, é bom entender como era a vida antes da adoção ampla do método.

O foco da entrega contínua (CD) é entregar novos lançamentos de código o mais rápido possível para os clientes. O teste automatizado é fundamental para esse objetivo. Não há como automatizar a entrega aos usuários se houver uma etapa manual e demorada no processo de entrega.

A CD faz parte de um pipeline de implementação maior. A CD é sucessora e também dependente da integração contínua (CI). A CI é totalmente responsável por executar testes automatizados para quaisquer novas alterações de código e verificar se essas alterações não quebram recursos estabelecidos ou introduzem novos bugs. A CD é acionada quando a etapa de integração contínua passa no plano de teste automatizado.

Essa relação entre testes automatizados, CI e CD produz muitos benefícios para uma equipe de software de alta velocidade. Os testes automatizados garantem a qualidade em todas as fases do desenvolvimento, garantindo que os novos commits não introduzam nenhum bug, para que o software permaneça pronto para implementação a qualquer momento.

![Um diagrama que descreve a relação entre testes automatizados, integração contínua e entrega contínua.](https://wac-cdn.atlassian.com/dam/jcr:c4c69694-506f-4d68-9563-c1bc5770e784/testing-stack@4x.png?cdnVersion=506)



#### O que são pipelines de CI/CD?

Pipelines de CI/CD consistem em uma série de etapas a serem realizadas para a disponibilização de uma nova versão de um software. Os pipelines de [integração e entrega contínuas (CI/CD](https://www.redhat.com/pt-br/topics/devops/what-is-ci-cd)) são uma prática que tem como objetivo acelerar a disponibilização de softwares, adotando a abordagem de [DevOps](https://www.redhat.com/pt-br/topics/devops) ou de [engenharia de confiabilidade de sites (SRE)](https://www.redhat.com/pt-br/topics/devops/what-is-sre).

O pipeline de CI/CD inclui monitoramento e [automação](https://www.redhat.com/pt-br/topics/automation) para melhorar o processo de desenvolvimento de aplicações principalmente nos estágios de integração e teste, mas também na entrega e na implantação. É possível executar manualmente cada etapa do pipeline de CI/CD, mas o real valor dele está na automação.

#### Elementos de um pipeline de CI/CD

As etapas que compõem um pipeline de CI/CD são subconjuntos distintos de tarefas agrupadas no que chamamos de *estágio do pipeline*. Os estágios típicos do pipeline são:

- **Compilação**: estágio em que a aplicação é compilada.
- **Teste**: estágio em que o código é testado. O uso da automação neste estágio poupa tempo e esforços.
- **Lançamento**: estágio em que a aplicação é enviada ao repositório.
- **Implantação**: estágio em que o código é implantado no ambiente de produção.
- ﻿**Validação e conformidade**: etapas para validar uma versão são determinadas pelas necessidades da empresa. É possível usar ferramentas de verificação da segurança de imagens, como o [Clair](https://www.redhat.com/pt-br/topics/containers/what-is-clair), para ter certeza da qualidade das imagens ao compará-las com [vulnerabilidades (CVEs)](https://www.redhat.com/pt-br/topics/security/what-is-cve) conhecidas.

#### Jenkins o que é?

**Jenkins®** é um servidor de automação de código aberto. Com o Jenkins, as organizações podem acelerar o processo de desenvolvimento de software automatizando-o.

O Jenkins gerencia e controla os processos de entrega de software em todo o ciclo de vida, incluindo construção, documento, teste, pacote, estágio, implantação, análise de código estático e muito mais.

Você pode configurar o Jenkins para observar qualquer mudança de código em lugares como GitHub, Bitbucket ou GitLab e fazer uma construção automática com ferramentas como Maven e Gradle. Você pode utilizar a tecnologia de contêiner, como [Docker](https://www.gocache.com.br/dicas/o-que-e-docker-e-quais-sao-suas-aplicacoes/#:~:text=Docker é uma plataforma de,executados isoladamente um do outro.) e [Kubernetes](https://www.gocache.com.br/dicas/o-que-e-kubernetes-e-quais-suas-aplicacoes/), iniciar testes e, em seguida, realizar ações como retroceder ou avançar na produção.

Desenvolvido originalmente por Kohsuke para integração contínua (Continuous Integration – CI), hoje o Jenkins orquestra todo o pipeline de entrega de software – chamado de entrega contínua. Para algumas organizações, a automação se estende ainda mais, para implantação contínua. A entrega contínua (Continuous Delivery – CD), juntamente com uma **cultura DevOps**, acelera drasticamente a entrega de software.

Jenkins é a solução mais amplamente adotada para entrega contínua, graças à sua extensibilidade e a uma comunidade ativa e vibrante. A comunidade Jenkins oferece mais de 1.700 plug-ins que permitem que o Jenkins se integre a virtualmente a qualquer ferramenta, incluindo todas as melhores soluções usadas em todo o processo de entrega contínua. Jenkins continua a crescer como a solução dominante para automação de processos de software, integração contínua e entrega contínua e, em fevereiro de 2018, havia **mais de 165.000 instalações ativas** e cerca de **1,65 milhão de usuários em todo o mundo**.

#### Metodologias ágeis e CI

Já mencionamos que a integração contínua é um elemento importante do DevOps. Ela também se adapta bem ao desenvolvimento ágil de software. Embora [seguir uma metodologia ágil](https://www.jetbrains.com/pt-br/teamcity/ci-cd-guide/agile-continuous-integration/) não seja requisito essencial para adotar o DevOps ou implementar integração contínua, todos estão baseados nos mesmos princípios.

Como desenvolvedores de software, nosso objetivo geral é, ou pelo menos deveria ser, resolver um problema para nossos usuários. Mas o desenvolvimento de software não é apenas complexo; construir a coisa certa é difícil. Para lidar com isso, as metodologias ágeis defendem o desenvolvimento e entrega em ciclos mais curtos, fazendo com que seja mais fácil obter feedback sobre o que foi construído e se adaptar em resposta a esse feedback. O DevOps fornece técnicas para encurtar os ciclos de desenvolvimento e lançamento, a fim de implementar esses ciclos de feedback mais curtos na forma de integração, entrega e implantação contínuas.

A integração contínua evoluiu em resposta aos problemas que as equipes de desenvolvimento enfrentaram ao tentar reunir o trabalho de vários desenvolvedores individuais num único produto depois de passar meses, ou até mesmo anos, escrevendo código. O processo de integração de módulos desenvolvidos separadamente pode adicionar longos atrasos a um projeto de software, já que suposições e dependências foram identificadas muito depois do código ter sido escrito, muitas vezes exigindo um retrabalho considerável.

#### Práticas da CI

Os principais ingredientes da integração contínua são os seguintes:

- uma sistema de controle de fontes ou versão contendo toda a base de código, incluindo arquivos de código-fonte, bibliotecas, arquivos de configuração e scripts
- scripts de build automatizados
- testes automatizados
- infraestrutura para executar builds e testes.

Para que todo mundo esteja construindo sobre a mesma base, todos precisam estar trabalhando no mesmo repositório e compartilhando suas alterações uns com os outros com frequência. Uma boa regra prática é fazer com que todos façam commit de suas alterações no master/trunk pelo menos uma vez por dia.

Depois de fazer commit de uma mudança, o próximo passo é construir a solução e submetê-la a uma série de testes automatizados para verificar seu comportamento. A automação desse processo é parte integrante da integração contínua; construir e/ou testar manualmente consome tempo e está sujeito a erros, sem contar que faz com que a meta de integrar as alterações diárias seja impraticável. As ferramentas de build e frameworks de teste que você usa dependem da linguagem na qual está trabalhando.

Depois que os scripts e testes estiverem implementados, o processo precisa ser mantido. Isto significa incluir testes automatizados como parte de quaisquer novos recursos, lidar com falhas e monitorar o desempenho do processo.

Adicionar um [servidor de CI](https://www.jetbrains.com/pt-br/teamcity/ci-cd-guide/ci-cd-tools/servers/) para cuidar do monitoramento do seu repositório, disparar builds, executar testes automatizados e agrupar resultados ajuda a juntar todas essas peças, economizando tempo na programação de uma lógica de automação personalizada e fornece insights adicionais, tais como métricas de [cobertura de código](https://www.jetbrains.com/pt-br/teamcity/ci-cd-guide/concepts/code-coverage/) e histórico de builds.

Embora essas ferramentas e processos sejam importantes na implementação da integração contínua, para obter o melhor da integração contínua, você precisa que as pessoas envolvidas adotem a prática. Como uma equipe de desenvolvimento, você precisa adaptar seus processos para incluir a prática de realizar commits ao master com frequência, acrescentar testes automatizados a qualquer novo recurso e priorizar a correção do build caso algo dê errado. Trabalhar com a equipe de QA para priorizar, projetar e manter testes automatizados e colaborar com a equipe de infraestrutura para provisionar máquinas nas quais os builds e testes possam ser executados ajudará a quebrar os silos organizacionais.

#### Desafios da integração contínua

Embora a integração contínua traga benefícios não apenas para os desenvolvedores, mas para a empresa como um todo, isto não significa que ela é sempre recebida de braços abertos. Para muitas empresas de desenvolvimento de software, o DevOps representa uma grande mudança na maneira como trabalham e desafia os processos existentes. A boa comunicação é fundamental para coordenar o esforço entre as equipes e incutir uma cultura de colaboração.

Se você já adota metodologias ágeis, a mudança é geralmente um pouco mais fácil, pois a importância de ouvir o feedback para garantir que você desenvolveu a coisa certa e a noção de equipes que se organizam sozinhas já devem ter ganhado força.

Quando esse não é o caso, reconhecer que esta é uma mudança significativa, envolver as pessoas, começar devagar e demonstrar os benefícios à medida que se avança pode ajudar a convencer seus colegas dos benefícios dessa prática.

A integração contínua também enfrenta desafios mais práticos. Se você estiver trabalhando com um aplicativo grande e monolítico, os tempos de compilação podem ser lentos e, se os ambientes de teste forem escassos, poderá ser um grande desafio paralelizar execuções dos testes.

Ter visibilidade de seu processo de CI e usar métricas para identificar gargalos pode ajudar a quantificar os custos e benefícios de se investir em mudanças de arquitetura, infraestrutura adicional e cobertura de testes automatizados.

<h2>Entrega contínua</h2>

Depois de realizar a automação de compilações e da unidade e os testes de integração na CI, a entrega contínua automatiza o lançamento desse código validado em um repositório. Portanto, para ter um processo eficaz de entrega contínua, é importante que a CI já esteja integrada ao pipeline de desenvolvimento. O objetivo da entrega contínua é garantir uma base de códigos que esteja sempre pronta para implantação em um ambiente de produção.

Cada etapa da entrega contínua, da consolidação das mudanças de código à entrega de compilações prontas para produção, inclui a automação do lançamento de códigos e do teste. No final desse processo, a equipe de operações pode implantar uma aplicação na produção com rapidez e facilidade.

#### Da transmissão à colaboração

No cerne do DevOps está uma mudança de mentalidade. Em vez de ver o processo de desenvolvimento de software como uma cadeia de produção de mão única, com requisitos, código e relatórios transmitidos de uma equipe para a outra de forma linear, o DevOps defende a colaboração e o feedback rápido a partir de ciclos curtos e iterativos.

Mudar sua definição de "pronto" pode ajudar na adoção dessa mentalidade: em vez de considerar que sua parte está concluída quando você entrega seu código para a equipe seguinte da cadeia, seu novo recurso ou alteração no código só é considerado pronto quando for lançado para ser colocado em produção. Se um problema for encontrado em qualquer estágio do pipeline, comunicar esse feedback imediatamente e colaborar para realizar uma correção faz com que a resolução seja mais rápida do que a elaboração de relatórios longos que precisariam passar por uma comissão de alterações para ter aprovação.

Ao olhar para todo o ciclo de vida de desenvolvimento de software, em vez para apenas uma parte dele, você terá uma melhor compreensão do que é necessário para entregar software aos usuários e ainda a oportunidade de abrir mais linhas de comunicação com as outras equipes envolvidas.

A entrega contínua é sobre identificar os pontos problemáticos que retardam esse processo de entrega e construir um pipeline automatizado para fazer com que os lançamentos sejam mais rápidos e mais confiáveis, de forma que que você esteja sempre pronto para fazer um lançamento a qualquer momento. Com o pipeline instalado, você deverá ser capaz de implantar e colocar no ar qualquer build de boa qualidade com um único comando.

A integração contínua oferece os fundamentos para isto, com commits pelo menos diários de alterações de código, seguidos por um processo automatizado de build e testes para garantir feedback rápido aos desenvolvedores. Se um build ou teste falhar, é prioridade de todos resolver o problema.

Ao detectar os bugs no início, você pode corrigi-los enquanto o código ainda está fresco em sua mente e evitar que outras funcionalidades sejam criadas sobre código ruim, fazendo com que seja necessário desfazê-las posteriormente. Com a entrega contínua, o build contendo as mudanças mais recentes do processo de CI é automaticamente promovido através de uma série de ambientes de pré-produção. Embora o push final para a produção seja acionado manualmente, ele ainda segue um processo de script, facilitando a repetição de forma que você possa realizar lançamentos com a frequência necessária.

#### Montando um pipeline

A construção do seu pipeline de CI/CD é uma oportunidade de colaborar com as várias partes interessadas no seu processo de lançamento, para que você possa levar em consideração suas necessidades e integrá-las ao design do pipeline. Esperamos que você já tenha se envolvido com seus colegas de QA, ao projetar [testes automatizados](https://www.jetbrains.com/pt-br/teamcity/ci-cd-guide/automated-testing/).

Acrescentar uma etapa para testes manuais exploratórios num ambiente de teste adequado (o mais próximo possível da produção) ajudará a identificar falhas que você não tenha previsto (e que poderão assim serem cobertas por testes automatizados).

A equipe de segurança cibernética ou infosec costuma ser vista como uma barreira aos lançamentos frequentes devido ao tempo envolvido na execução de uma auditoria de segurança e aos longos relatórios que seguem. Adotar uma abordagem [DevSecOps](https://www.jetbrains.com/pt-br/teamcity/ci-cd-guide/what-is-devsecops/) irá ajudá-lo a inserir requisitos de segurança no seu pipeline.

As etapas de construção, ambientes e testes de que você precisa dependem da arquitetura do seu software e de suas prioridades organizacionais. Se você está construindo um sistema baseado em microsserviços, você pode aproveitar as vantagens da arquitetura para rodar testes em serviços individuais em paralelo antes de combiná-los para integrações mais complexas e testes de ponta-a-ponta.

A realização de testes manuais exploratórios pode parecer excessiva para cada correção de bug que chega pelo pipeline. Nesse caso, ter etapas opcionais ou pipelines alternativos com base no tipo de alteração pode ser uma solução mais eficiente.

Uma vez que você tenha decidido as etapas do seu pipeline, incluindo quais testes serão executados em cada um, é hora de escrever o script do processo para garantir que seja confiável e repetível. Para evitar introduzir inconsistências, o mesmo artefato de build da fase de CI deve ser implantado em cada ambiente de pré-produção e no próprio ambiente de produção.

Idealmente, os ambientes de teste devem ser reiniciados para cada novo build. Usar contêineres com uma abordagem de infraestrutura como código significa que você pode fazer criar scripts para essas etapas, destruindo e recriando novos ambientes conforme necessário.

Se seu pipeline inclui ambientes de preparação para que equipes de suporte, vendas ou marketing se familiarizem com os novos recursos, você talvez prefira controlar manualmente o processo quando eles forem atualizados com um novo build, evitando interromper o trabalho em andamento. Quanto ao processo de colocar em produção a versão final, o processo de implantação poderá ainda ser programado em um script, para manter o processo rápido e consistente.

#### Vantagens e desafios da entrega contínua

A entrega contínua promete lançamentos mais rápidos sem comprometer a qualidade, mas tornar isso uma realidade requer a cooperação de diversas partes de uma organização. A quebra de silos é não apenas um desafio no curto prazo, mas também um benefício no longo prazo, pois essa colaboração vai ajudá-lo a trabalhar de forma mais eficiente.

Implementar entrega contínua requer bastante investimento de tempo e pode ser um verdadeiro desafio. Adotar uma abordagem iterativa e construir seu processo ao longo do tempo torna tudo mais gerenciável e permite que você demonstre as vantagens do processo para as principais partes interessadas. A coleta de métricas sobre os tempos de build e teste, comparando-as aos procedimentos manuais é uma maneira simples de mostrar o retorno do investimento, assim como as taxas de defeitos.

Medir o valor da entrega contínua pode ser útil ao planejar seus requisitos de infraestrutura. À medida em que você escala seu processo de lançamento, você provavelmente irá querer começar a executar múltiplos builds e testes em paralelo. Nesse contexto, as máquinas disponíveis podem se tornar um fator limitante. Uma vez que você tenha otimizado o desempenho do seu pipeline, você talvez queira considerar a mudança para uma [infraestrutura hospedada em nuvem](https://www.jetbrains.com/pt-br/teamcity/ci-cd-guide/cloud-ci-cd-pipeline/), para que você possa escalar a solução, conforme necessário.



<h2>Implantação contínua</h2>

A etapa final de um pipeline de CI/CD sólido é a implantação contínua. Ela é um complemento da entrega contínua, que automatiza o lançamento de compilações prontas para produção em um repositório de códigos. A implantação contínua automatiza o lançamento de uma aplicação para a produção. Como não há um canal manual na etapa do pipeline antes da produção, a implantação contínua depende muito da automação otimizada dos testes.

Na prática, a implantação contínua significa que a mudança do desenvolvedor em uma aplicação será habilitada depois de alguns minutos após a gravação (supondo que ela seja aprovada no teste automatizado). Isso facilita muito mais o recebimento do feedback dos usuários e a incorporação dele. Juntas, todas essas práticas de CI/CD relacionadas diminuem o risco da implantação de aplicações, facilitando o lançamento das mudanças em pequenas partes, e não de uma só vez. No entanto, há também a necessidade de muitos investimentos iniciais, já que os testes automatizados precisam ser gravados para acomodar várias etapas de teste e lançamento no pipeline de CI/CD.

#### Fazendo com que a implantação contínua seja uma realidade

Se os seus processos de integração e implantação são completamente manuais, com congelamentos de código, estratégias de testes que requerem o envolvimento de todos, a ansiedade de toda a empresa no dia do lançamento e depois a cada hora, a ideia de realizar implantações sem nenhuma interferência pode soar como uma fantasia.

Mas a realidade é que muitas empresas estão adotando essa abordagem, desde grandes empresas como Netflix, Etsy e Amazon a empresas menores que tentam acompanhar o mercado. A adoção da implantação contínua permitiu que elas reduzissem sua periodicidade de lançamentos desde semanas ou mesmo meses para horas. Para uma quantidade cada vez maior de setores da indústria, a capacidade de entregar recursos rapidamente e responder de forma ágil ao feedback dos usuários tornou-se essencial.

Como uma extensão da integração e entrega contínuas, a implantação contínua depende de um processo de build, testes e implantação totalmente automatizado, para garantir que a velocidade não prejudique a qualidade. Mas para pôr em prática a implantação contínua de maneira eficaz é necessário ter mais do que uma base sólida.

Ao planejar como implementar a implantação contínua, uma questão importante a se considerar é como suas alterações serão lançadas. Além de escolher uma atualização que possa ser colocada em execução, em vez de colocar os servidores offline evitando assim interrupções frequentes em serviços online, você também pode fazer com que a distribuição seja uma extensão do seu [processo de testes automatizados](https://www.jetbrains.com/pt-br/teamcity/ci-cd-guide/automated-testing/).

Uma implantação canário (canary deployment) limita a implantação do código atualizado a uma pequena porcentagem dos usuários, que se tornam testadores involuntários na produção. Ao monitorar o comportamento e as métricas de uso, você pode verificar se a nova versão não introduziu novas falhas antes de distribuí-la de forma mais abrangente.

Algumas empresas têm levado a automação mais longe com uma pontuação de confiança canário, que compara automaticamente uma série de métricas em relação a uma linha de referência. A distribuição continua automaticamente apenas se a pontuação exceder o limite especificado, enquanto a análise da métrica fornece um ponto de partida para uma investigação mais aprofundada de possíveis problemas.

Um processo de implantação azul/verde é uma técnica comum para organizações que praticam implantação contínua, já que torna mais fácil reverter uma versão caso haja algum problema, mantendo o código antigo online até que você tenha certeza de que as alterações estejam funcionando conforme o esperado. Se necessário, você pode seguir uma implantação canário inicial com um lançamento azul/verde.

Esteja você executando uma implantação azul/verde ou implantando substituições diretas, monitorar a integridade do sistema de produção é essencial se você deseja ser capaz de responder rapidamente a quaisquer bugs que tenham escapado ao processo de lançamento.

Ficar de olho nas métricas específicas que indicam a integridade do seu sistema, desde espaço em disco e uso da CPU até o número de solicitações ou transações, e compará-los com uma linha de referência pode fornecer um aviso prévio quando as coisas não estiverem se comportando como deveriam. Você pode então decidir se deseja reverter a alteração ou avançar, introduzindo uma correção através do pipeline.

#### Considerações para a implantação contínua

Antes de entrar na onda da implantação contínua, vale a pena reservar um momento para considerar alguns dos problemas que normalmente surgem ao adotar a CD.

O ciclo de vida de desenvolvimento de software envolve bem mais que apenas alterações de código. As equipes de pesquisa de usuário, marketing de produto, design de interação, documentação, comercial, jurídica e de suporte têm todas um papel a cumprir.

Se você ainda não estabeleceu as bases com suas partes interessadas nem se envolveu com elas para entender as suas necessidades dentro do processo de lançamento, a mudança para a implantação contínua pode fazer com que elas tenham a impressão que o desenvolvimento está fora de controle. Isso pode resultar na introdução de pontos de verificação manuais e estágios de revisão que irão retardar o processo, ou até mesmo a implantação contínua ser rejeitada como um experimento fracassado.

É essencial a criação de uma cultura de colaboração. Envolver outras equipes por todo o processo de desenvolvimento para que suas opiniões - quanto a design, questões de segurança, terminologia ou conformidade - possam ser incorporadas desde o início é um exemplo de como ciclos curtos de feedback podem tornar o ciclo de vida de desenvolvimento de software mais eficiente. Tão importante quanto estimular o compartilhamento de opiniões é fornecer visibilidade sobre o que está sendo lançado e quando. Manter as partes interessadas informadas é um processo que pode ser automatizado com a [ajuda de um servidor de CI](https://www.jetbrains.com/pt-br/teamcity/ci-cd-guide/ci-cd-tools/servers/) para disseminar informações através de painéis e notificações.

Às vezes, a visibilidade do que está sendo feito, por si só, não é suficiente. Quando você está trabalhando num recurso maior ou precisa controlar a programação de um lançamento, simplesmente implantar cada commit e colocar o serviço no ar depois de passar em todos os testes não é o ideal.

Sinalizadores de recursos são uma das alternativas para controlar a visibilidade do código em produção, com a vantagem de que o código estará rodando ao vivo, para que você possa monitorar falhas inesperadas. Uma outra abordagem é usar uma branch dedicada, implantada em um pipeline separado que não faz push para a produção automaticamente, combinando dessa forma tanto a [entrega contínua, como a implantação contínua](https://www.jetbrains.com/pt-br/teamcity/ci-cd-guide/continuous-integration-vs-delivery-vs-deployment/) para atender às suas necessidades.

## Pratica de integração continua utilizando Render



Nesta prática iremos implementar um serviço de deploy automatico para uma aplicação java de helloWorld

a aplicação java possui um endpoint /hello que tem como finalidade apresentar uma mensagem de boas vindas, a ideia e fazermos que a cada nova atualização na branch main do github o sistema realizará um novo deploy colocando a atualização do sistema em produção de forma automatica.





Realize um fork sobre o repositorio no link abaixo

 https://github.com/LucasCapSilva/HelloWorldSpring

clique no botão Fork

![enter image description here](https://i.imgur.com/aL1kGE7.png)



Despois clique no botão Create Fork



![enter image description here](https://i.imgur.com/uaysAo0.png)



Caso ainda não tenha uma conta entre no site do Render e crie uma conta como na imagem descrita abaixo;

[Render| Sign up](https://dashboard.render.com/)

![enter image description here](https://i.imgur.com/5l7OE1g.png)



Realize o login na plataforma Render.

![enter image description here](https://i.imgur.com/5l7OE1g.png)



Dentro do dashboard da Render selecione  Web services.

![enter image description here](https://i.imgur.com/R77FvbO.png)



Vincule a sua conta do github na plataforma Render e selecione o projeto HelloWorldSpring que foi realizado o fork

Clique em Connect

![enter image description here](https://i.imgur.com/7B3AonS.png)



Insira o nome do projeto de preferencia helloWorld



![enter image description here](https://i.imgur.com/o7iYeVA.png)

Selecione o enviroment como docker 

region como oregon

Branch como main



![enter image description here](https://i.imgur.com/rjka94l.png)



Selecione  o plano Free 

![enter image description here](https://i.imgur.com/Fq9CThh.png)



Clique em Create Web Service



Espere **15 minutos** até o projeto spring compilar e aparecer a seguinte mensagem **JVM runing**



![enter image description here](https://i.imgur.com/TuFYbrq.png)

Depois de **15 minutos** (obs: você precisa esperar  no minimo 15 minutos para aplicação compilar caso você tentar abrir antes do tempo a aplicação não executará ) clique sobre o link da aplicação para abrir ela em seu navegador.



![enter image description here](https://i.imgur.com/y2vZjDb.png)



![enter image description here](https://i.imgur.com/v6VJESC.png)

com a aplicação aberta na barra de endereço acrecente ao endereço da aplicação a rota /hello como no exemplo abaixo

enderecodoapp-ye8r.onrender.com/hello

![enter image description here](https://i.imgur.com/WrX5aXL.png)



Agora vamos ver a funcionalidade de deploy automatico em ação



Entre no github da aplicação

![enter image description here](https://i.imgur.com/do5gWTD.png)



acesse o controller da aplicação HelloController.java

![enter image description here](https://i.imgur.com/ZcnhQNi.png)



Edite a mensagem Hello Generation!!! para Hello my Friends.

![enter image description here](https://i.imgur.com/Bcutlzg.png)



Salve o commit da alteração e espere 15 minutos (**Se você não esperar 15 minutos para entrar na aplicação o deploy automatico não funcionará**)

em seguida acesse a aplicação novamente no endpoint /hello.



![enter image description here](https://i.imgur.com/v4lUFWW.png)



E pronto  deploy automatico funcionando perfeitamente, a cada commit novo realizado na branch main o serviço da Render realiza um novo deploy de forma automatica demonstrando o poder da implementação da integração continua.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
