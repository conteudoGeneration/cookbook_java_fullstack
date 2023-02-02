<h1>Introdução a Orquestradores de Containers</h1>



Antes de entrarmos a fundo no conteúdo técnico, eu vou propor o seguinte problema:

*Imagine que você é a pessoa responsável por manter uma aplicação funcionando, esta aplicação precisa rodar “fulltime” ou seja não pode haver interrupções ou quedas na aplicação, pois a cada vez que a aplicação cai por algum motivo o nosso cliente (empresa que nos contratou), perde um valor muito alto em vendas, um outro ponto importante é que quando há uma grade quantidade de requisições (acessos simultâneos na aplicação), a aplicação perde performance.*

*Qual estratégia poderíamos usar para suprir a necessidade do nosso cliente?*

Orquestradores de containers caberia como uma luva e garantiria a integridade e a alta disponibilidade da nossa aplicação.



<h2>1. O Problema</h2>



Imagine que temos um cluster com apenas um container da nossa aplicação rodando assim como na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/dMF9VOg.png" title="source: imgur.com" /></div>

> Um **Cluster no Docker** se refere a um ou vários nós (nodes) unidos usando o modo Swarm. 

Se sua infraestrutura de software atual se parece com a imagem acima, rodando em alguns contêineres que se comunicam com um banco de dados replicado, muito provavelmente você não precise de orquestração de contêineres e consegue gerenciar tudo você mesmo.

<div align="center"><h2>Se você continuar adicionando mais e mais funcionalidades até que se torne um monolito maciço, que é quase impossível de manter e consome muita CPU e Memória RAM? </h2></div>

Desta forma caso haja algum evento que derrube o container ou interrompa a conexão com a Internet, ou até mesmo o excesso de requisições, são eventos que podem causar lentidão ou até mesmo a interrupção da nossa aplicação.

Neste cenário desafiador, naturalmente você terá que dividir seu aplicativo gigante em partes menores, cada uma responsável por uma tarefa específica, mantida por uma equipe, também conhecida como: **microsserviço**.

> **Monolito:** Em engenharia de software, uma aplicação monolítica **descreve uma única aplicação de software em camadas no qual a interface de  usuário e código de acesso aos dados são combinados em um único programa a partir de uma única plataforma**. 
>
> **Microsserviço:** É uma abordagem arquitetônica e organizacional de desenvolvimento de software, na qual o software  consiste em pequenos serviços independentes que se comunicam usando API's bem definidas. Esses serviços pertencem a pequenas equipes de desenvolvimento autossuficientes.

Com esta divisão, você deseja aumentar o desempenho, ser capaz de processar tarefas de forma assíncrona e compartilhar dados rapidamente entre os serviços. Você também vai querer executar várias instâncias de cada microsserviço abrangendo vários servidores para torná-lo altamente disponível em um ambiente de produção. Além disso, surgirão outras preocupações, como:

- **Service Discovery:** A descoberta de serviços é o processo de detecção automática de  dispositivos e serviços em uma rede de computadores. Isso reduz a  necessidade de configuração manual por usuários e administradores.
- **Load Balance:** Balanceamento de carga ou **load balance** é uma técnica utilizada para manter a estabilidade de um servidor quando o tráfego ou o volume de dados é muito grande. O ponto principal é otimizar o tráfego de informações e garantir o funcionamento de um  sistema para o usuário, estabilizando a navegação. No contexto do desenvolvimento, O load balance é o responsável por fazer o balanceamento das requisições, ou seja, ele garante que cada container receba a quantidade de requisições que é definido na sua configuração.
- **Auto Scaling dos containers e nodes:** É um recurso que  permite que as organizações aumentem ou diminuam automaticamente  serviços em nuvem, como capacidades de servidor ou máquinas virtuais,  com base em situações definidas, como níveis de utilização de tráfego.
- **Zero-downtime deploys:** É uma estratégia que visa fazer um deploy sem interromper o  funcionamento do aplicativo a fim que a troca fique transparente para os usuários.

Para suprir estas novas necessidades, utilizamos um Orquestrador de Container, que permite disponibilizar outras instancias com o mesmo container dentro do cluster assim como na figura abaixo:

<div align="center"><img src="https://i.imgur.com/isiBVKA.png" title="source: imgur.com" /></div>



<h2>2. Orquestrador de Containers</h2>



O termo orquestração é utilizado na TI por conta da sua alusão aos vários instrumentos musicais (ferramentas) usadas por vários músicos (pessoas desenvolvedoras e administradoras de sistemas) que são minuciosamente coordenados por um maestro (orquestrador). Tudo isso para que seja entregue a melhor experiência musical (serviços e apps) para o usuário final.

Um orquestrador *dita como a banda toca*, organizando e disponibilizando microsserviços de acordo com a demanda naquele momento.

Costuma-se dizer que utilizar containers é algo que tende ao caos, pois é uma arquitetura cujos componentes se multiplicam muito rapidamente, por isso, há a necessidade de um super componente que organize tudo.
Essa arquitetura se popularizou com o Docker, que entrega containers que compartilham recursos do kernel do sistema hospedeiro e entrega apenas camadas adicionais, isolando sistemas e aplicações.

> **Kernel é uma  palavra inglesa usada na computação para designar o núcleo do sistema  operacional, que é a parte principal de um computador**. Uma simples  alteração da versão do Kernel para uma mais antiga ou mais atual pode  ser suficiente para resolver problemas de hardware e também de  compatibilidade no computador.

Um orquestrador possui duas funcionalidades que são de extrema importância:

- **Replica set:** O replica set é responsável por manter exatamente o numero de replicas de containers que definimos para que nosso orquestrador gerencie, caso alguma dessas replicas fique fora do ar o replica set irá construir uma replica para substituir a que ficou fora do ar.
- **Load Balance:** O load balance é o responsável por fazer o balanceamento das requisições, ou seja, ele garante que cada container receba a quantidade de requisições que é definido na sua configuração.

<br />

<h2>3. Docker Swarm</h2>



O **Docker Swarm** é uma ferramenta nativa do Docker, que permite a criação de clusters Docker, ou seja, podemos fazer com que diversos Docker hosts estejam dentro do mesmo pool de recursos, facilitando assim o deploy de containers. É possível, por exemplo, criar um container sem necessariamente saber em qual host ele está, pois o Swarm disponibilidade uma API de integração, onde é possível realizar grande parte das atividades administrativas de um container.

<h3>3.1. O que é um Swarm?</h3>



<div align="center"><img src="https://i.imgur.com/q38I6f7.jpg" title="source: imgur.com" /></div>

Um Swarm  (*enxame*), consiste em vários hosts Docker que são executados no chamado modo swarm e atuam como *gerentes*, *trabalhadores* ou pode desempenhar ambas as funções, como vemos na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/jqUNF42.png" title="source: imgur.com" /></div>

Na imagem acima, podemos ver que existem 3 tipos de Nós (node): **Leader, Reachable e Worker**, que serão detalhados a seguir.

Ao criar um serviço em um Swarm, você define o estado ideal de seu serviço (número de réplicas, portas do serviço, recursos de rede e armazenamento e muito mais). O Docker tentará manter esse estado desejado reiniciando/reagendando tarefas indisponíveis e equilibrando a carga entre diferentes nós.

<br />

<h3>3.2.Node (Nós)</h3>

Um nó é uma instância do mecanismo do Docker que participa do Swarm, ou seja, uma máquina física ou virtual. Você pode executar um ou vários nós em um único dispositivo, mas as implantações de produção geralmente incluem nós do Docker distribuídos em vários dispositivos físicos.



<h4>3.2.1. Manager Nodes ou Leader (Nós de Gerente)</h4>



Os nós gerenciadores distribuem e agendam tarefas recebidas pelos nós trabalhadores, mantêm o estado do cluster e executam funções de orquestração e gerenciamento de cluster. Os nós do gerenciador também podem, opcionalmente, executar serviços para os nós do trabalhador.

<div align="center"><img src="https://i.imgur.com/1vQMXDp.png" title="source: imgur.com" /></div>

As tarefas de gerenciamento de cluster incluem:

- Orquestração de Containers
- Manter o estado do cluster
- Agendamento de serviços e tarefas
- Gerar o modo swarm para pontos de extremidade da API HTTP

Sempre deve haver vários nós gerenciadores em seu enxame devido aos seguintes motivos:

- Manter alta disponibilidade
- Recuperar-se facilmente de uma falha do nó gerenciador sem tempo de inatividade

É por isso que o Docker recomenda que você implemente um número ímpar de nós de acordo com os requisitos de disponibilidade do seu projeto.

**Observação:** o Docker recomenda no máximo sete nós gerenciadores para um Swarm.



<h4>3.2.2. Worker Nodes (Nós de Trabalho)</h4>



Os nós de trabalho também são instâncias do Docker Engine, cujo único objetivo é executar contêineres e serviços conforme instruído pelos nós do gerenciador.

<div align="center"><img src="https://i.imgur.com/fTuj5NW.png" title="source: imgur.com" /></div>

Para implantar seu aplicativo em um Swarm, você precisa de pelo menos um nó gerenciador. Por padrão, todos os nós gerenciadores também são trabalhadores. 



<h4>3.2.3. Reachable Nodes (Nós Acessíveis)</h4>



Os nós acessíveis realizam os 2 papéis:

- Workers - Comportamento Padrão.
- Manager - Quando o Nó Gerente apresenta falha.

<div align="center"><img src="https://i.imgur.com/8lU4iBG.png" title="source: imgur.com" /></div>



<h3>3.3. Services (Serviços)</h3>



Um *serviço* é a definição das tarefas a serem executadas nos nós. É a raiz principal da interação do usuário com o enxame.

Ao criar um serviço, você especifica qual imagem de contêiner usar e quais comandos executar dentro dos contêineres em execução. Você também define outras opções para o serviço, incluindo:

- A porta que você deseja expor
- Limitações de CPU e memória (opcional)
- O número de réplicas da imagem a serem executadas no enxame
- Uma política de atualização contínua (Opcional)

Aqui está um exemplo de um servidor HTTP equilibrando sua carga em três réplicas:

<div align="center"><img src="https://i.imgur.com/Makn0sI.png" title="source: imgur.com" /></div>

Como você pode ver, o serviço tem três tarefas diferentes e cada tarefa invoca exatamente um contêiner. 



<h4>3.3.1. Serviços replicados e globais</h4>



Há duas maneiras diferentes de implantar um serviço: **Replicado e Global**.

*Os serviços replicados* especificam o número de tarefas idênticas (réplicas) que você deseja executar. Essas réplicas serão então divididas nos diferentes nós de trabalho e cada uma servirá o mesmo conteúdo.

*Um serviço global* é um serviço que executa uma tarefa em cada nó que você tem em seu enxame e não precisa de um número pré-especificado de tarefas. Os serviços globais geralmente são usados para agentes de monitoramento ou qualquer outro tipo de contêiner que você deseja executar em cada nó.

Aqui está uma representação visual de um Serviço Replicado e um Serviço Global:

<div align="center"><img src="https://i.imgur.com/gO1tIgz.png" title="source: imgur.com" /></div>

Observe que o Serviço Global possui exatamente 01 Container em cada Nó, enquanto o Serviço Replicado pode ter mais de 1 Container em cada Nó, dependendo do número de réplicas.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
