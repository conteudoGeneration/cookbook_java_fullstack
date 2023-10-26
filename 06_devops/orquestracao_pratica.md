<h1>Docker Swarm - Atividade Prática</h1>



Vamos entender na prática, como funciona o Orquestrador de Containers Docker Swarm.

<h2>1. Cenário</h2>

Vamos criar 4 Máquinas dentro do **Docker Playground**, onde 1 será a **Manager** e as outras 3 serão **Workers**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/LsqOYt4.png" title="source: imgur.com" /></div>

<br />

<h3>1.2. Criando as Máquinas</h3>

1. Acesse o **Docker Playground**, através do endereço: **https://labs.play-with-docker.com/**

<div align="center"><img src="https://i.imgur.com/zIMmgpm.png" title="source: imgur.com" /></div>

2. Faça o Login clicando na caixa de listagem **Login** e clique na opção **Docker**.

<div align="center"><img src="https://i.imgur.com/A1CL6OI.png" title="source: imgur.com" width="67%"/></div>

3. Faça o login no **Dockerhub**, caso você não esteja autenticado.

4. Na sequência, clique no botão **Start** para iniciar.

<div align="center"><img src="https://i.imgur.com/XUgw2Tq.png?1" title="source: imgur.com" /></div>

5. Após o Login, será aberta uma nova sessão do **Docker Playground**. 

<div align="center"><img src="https://i.imgur.com/5O0FzgO.png" title="source: imgur.com" /></div>

4. Clique 4 vezes no botão **+ ADD NEW INSTANCE** para criar **4 Máquinas**

<div align="center"><img src="https://i.imgur.com/cLTVyhK.png" title="source: imgur.com" /></div>

5. Após adicionar as 4 Máquinas, o menu **Instances** ficará semelhante a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/8S1bCcc.png" title="source: imgur.com" /></div>

Em nosso exemplo, nossas máquinas estão com as seguintes configurações:

| Máquina   | Endereço IP  | Função no Cluster |
| --------- | ------------ | ----------------- |
| **node1** | 192.168.0.28 | Worker            |
| **node2** | 192.168.0.27 | Worker            |
| **node3** | 192.168.0.26 | Worker            |
| **node4** | 192.168.0.25 | Manager           |

<br />

> **Endereço IP:** **É um endereço lógico, configurável e exclusivo, que identifica um dispositivo na Internet ou em uma Rede Local**. IP vem do inglês "Internet Protocol" (protocolo de rede) que consiste  em um conjunto de regras que regem o formato de dados enviados pela  Internet ou por uma Rede Local.

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Atenção aos Detalhes ao criar as Máquinas. Ao criar uma nova instância dentro do Docker Playground, os endereços IP das máquinas podem ser diferentes do nosso exemplo.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** Ao adicionar novas máquinas no Docker Playground, nenhuma delas estará configurada como Manager ou Worker. Somente após iniciarmos a configuração do Cluster que os papéis de cada máquina serão atribuídos.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>2. Criando um Cluster</h2>



A primeira etapa após a configuração das 4 máquinas é criar o **Cluster Docker Swarm**. Para isso, precisamos definir qual máquina será a máquina **Manager** e executar no **Terminal** desta máquina o seguinte comando:

```bash
docker swarm init --advertise-addr <MANAGER-IP>
```

Onde:

-  `--advertise-addr`: Endereço IP que será publicado. 
-  `MANAGER-IP`: O Endereço IP da máquina Manager do Cluster Docker Swarm, que será utilizado para gerenciar o Cluster. 

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="200px"/> | <div align="left"> **ALERTA DE BSM:** Mantenha a Atenção aos Detalhes ao criar o Cluster Docker Swarm. A maior parte dos comandos e configurações do Docker Swarm serão executados na máquina Manager, porque ela é a responsável por gerenciar o Cluster. </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

No nosso exemplo, dentro do **Docker Playground**, a máquina Manager será a **node4**, cujo Endereço **IP** é o *192.168.0.25*, logo o comando `docker swarm init` será o seguinte:

```bash
docker swarm init --advertise-addr 192.168.0.25
```

Na imagem abaixo, você confere o resultado da execução do comando:

<div align="center"><img src="https://i.imgur.com/sK707qs.png" title="source: imgur.com" /></div>

Observe que na saída do comando `docker swarm init` no Terminal, foi gerado o comando `docker swarm join`, que será utilizado para adicionar outras máquinas (Nodes) no Cluster. O comando `docker swarm join`, possui a seguinte sintaxe:

```bash
docker swarm join --token <token> <MANAGER-IP:PORTA>
```

Onde:

- `--token`:  É o token de segurança para acesso ao Cluster
- `MANAGER-IP:PORTA`: É o Endereço IP da máquina Manager e a Porta onde o Docker Swarm está sendo executado. A porta padrão do Docker Swarm é 2377.

Copie este comando no Terminal da Máquina node4, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/jwwbnHL.png" title="source: imgur.com" /></div>

<br />

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/swarm_init/" target="_blank"><b>Documentação: docker swarm init</b></a></div>

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/swarm_join/" target="_blank"><b>Documentação: docker swarm join</b></a></div>

<br />

<h2>3. Adicionar nós ao Cluster</h2>

Com o Cluster Swarm criado, agora podemos adicionar novos **Nós Workers**, através do comando `docker swarm join`, fornecido pela saída do comando acima e posteriormente copiado.

Em nosso exemplo, a saída do comando ficou a seguinte:

```bash
docker swarm join --token SWMTKN-1-2eat9kqh801tm1ktxgs8z5wvw2fd5oxmhbszb29hjn7wzh5m23-e0coakr22rmvty2shtmb2nbgf 192.168.0.25:2377
```

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Atenção aos Detalhes ao adicionar as Máquinas no Cluster. Cada vez que um novo Cluster é criado, o Token de segurança nunca será o mesmo, portanto copie o comando do Terminal.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |


O Comando acima adicionará uma máquina ao Cluster como um Worker do Cluster. Vamos Executar este comando nas outras 3 Máquinas do nosso cenário (node1, node2 e node3). Abaixo, você confere o resultado do comando nas 3 máquinas:

**Node1:**

<div align="center"><img src="https://i.imgur.com/hJihlKH.png" title="source: imgur.com" /></div>

**Node2:**

<div align="center"><img src="https://i.imgur.com/jlAOmWX.png" title="source: imgur.com" /></div>

**Node3:**

<div align="center"><img src="https://i.imgur.com/f3tI27r.png" title="source: imgur.com" /></div>

<br />

Observe que foi executado o mesmo comando nas 3 máquinas e em todas elas foi exibida a mensagem de confirmação: **This node joined a swarm as a worker**, indicando que a máquina foi adicionada ao Cluster Docker Swarm com sucesso.

Para conferir se as 3 maquinas estão conectadas ao Cluster, execute o comando abaixo na máquina Manager (node4):

```bash
docker node ls
```

Na imagem abaixo podemos observar que temos uma máquina **Leader** (máquina node4 - Manager). As outras 3 máquinas (node1, node2 e node3 - Workers), a propriedade Manager Status está vazia, porque são máquinas **Workers**. 

<div align="center"><img src="https://i.imgur.com/q5EAHn3.png" title="source: imgur.com" /></div>

Observe na imagem abaixo, que no menu **Instances**, ao lado da máquina **node4**, foi adicionado um ícone de um Gerente, indicando que esta máquina é a Manager do Cluster.

<div align="center"><img src="https://i.imgur.com/qm3LMvO.png" title="source: imgur.com" /></div>

<br />

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/swarm_join/" target="_blank"><b>Documentação: docker swarm join</b></a></div>

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/node_ls/" target="_blank"><b>Documentação: docker node ls</b></a></div>

<br />

<h2>4. Promovendo uma Máquina no Cluster</h2>

Se você deseja conceder privilégios de **Manager** para uma máquina, você terá que promover a máquina para **Reachable**, através do comando docker node promote, que deverá ser executado na máquina Manager (node4, em nosso exemplo):

```bash
docker node promote <HOSTNAME>
```

Onde:

- `HOSTNAME`: É o nome da máquina que será promovida.

Vamos promover a máquina node1 para **Reachable**, através do comando abaixo, que será executado na máquina Manager (node4):

```bash
docker node promote node1
```

Na imagem abaixo, vemos que a máquina node1 foi promovida:

<div align="center"><img src="https://i.imgur.com/EJliJAw.png" title="source: imgur.com" /></div>

Para conferir a promoção da máquina node1, execute o comando abaixo na máquina Manager (node4):

```bash
docker node ls
```

Na imagem abaixo podemos observar que a máquina node1 está com a propriedade Manager Status **Reachable** e as outras 2 máquinas (node2 e node3), continua com a propriedade Manager Status vazia, porque são máquinas **Workers**. 

<div align="center"><img src="https://i.imgur.com/5RwyceD.png" title="source: imgur.com" /></div>

Observe na imagem abaixo, que no menu **Instances**, ao lado da máquina **node1**, após a promoção, foi adicionado um ícone de um Gerente, indicando que esta máquina também é uma Manager do Cluster.

<div align="center"><img src="https://i.imgur.com/ndayFSZ.png" title="source: imgur.com" /></div>

Como um Cluster Swarm pode ter apenas um Manager, a máquina promovida recebeu o status Reachable, ou seja, ela exercerá o papel de Worker e Manager, entretanto ela só assumirá o papel de Manager se a máquina Manager falhar.

Para remover a promoção bastar usar o comando:

```bash
docker node demote <HOSTNAME>
```

Onde:

- `HOSTNAME`: É o nome da máquina que a promoção será removida.

<br />

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/node_promote/" target="_blank"><b>Documentação: docker node promote</b></a></div>

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/node_demote/" target="_blank"><b>Documentação: docker node demote</b></a></div>

<br />

<h2>5. Criando um Serviço</h2>



Para criar um serviço, vamos executar o comando abaixo na máquina Manager (node4):

```bash
docker service create --name my_web --replicas 6 --publish published=8080,target=80 nginx
```

Onde:

- `--name`: Nome do Serviço (aplicação).
- `--replicas`:A quantidade de replicas (cópias) a serem distribuídas em nossas instancias/nós.
- `--publish`: Mapeamento de portas internas e externas onde:
  - `target`: É a porta interna.
  - `published`: É a porta externa.

- `nginx`: É a imagem que iremos rodar.

Após executar o comando acima, o Docker Swarm iniciará o processo de criação dos containers e distribuição entre as máquinas do Cluster:

<div align="center"><img src="https://i.imgur.com/SMjCFKt.png" title="source: imgur.com" /></div>

**Pronto!** 6 cópias do serviço foram geradas no Cluster, como vemos na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/sLk2Ll8.png" title="source: imgur.com" /></div>

Observe que depois de criar o serviço, o endereço de acesso, com a respectiva porta, será exibido no cabeçalho, acima do terminal, como mostra a imagem abaixo:

 <div align="center"><img src="https://i.imgur.com/raDjdNd.png" title="source: imgur.com" /></div>

Ao clicar no link, será aberta uma nova aba no Navegador, que exibirá a tela inicial do NGinx.

 <div align="center"><img src="https://i.imgur.com/Jv5YHn6.png" title="source: imgur.com" /></div>

Para verificar se todas as replicas/serviços estão online, podemos utilizar o comando abaixo, na máquina Manager (node4): 

```bash
docker service ls 
```

Podemos notar na imagem abaixo que temos 6/6 replicas do serviço **my_web** online:

<div align="center"><img src="https://i.imgur.com/fP5tIQT.png" title="source: imgur.com" /></div>

Na sequência, vamos executar o comando `docker service ps`, para visualizar a distribuição das réplicas no Cluster: 

```bash
docker service ps <NOME_DO_SERVIÇO>
```

Onde:

- `NOME_DO_SERVIÇO`: É o nome do serviço que você deseja visualizar a distribuição das réplicas.

Digite o comando abaixo na máquina Manager (node4):

```bash
docker service ps my_web
```
Na imagem abaixo, vemos que em todas máquinas temos réplicas do serviço em execução:

<div align="center"><img src="https://i.imgur.com/qGFPE9Q.png" title="source: imgur.com" /></div>

Na máquina node1 temos 2 réplicas, na máquina node2 temos 1 réplica, na máquina node3 temos 1 réplica e na máquina node4 temos 2 réplicas, totalizando 6 réplicas.

<br />

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/service_create/" target="_blank"><b>Documentação: docker service create</b></a></div>

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/service_ls/" target="_blank"><b>Documentação: docker service ls</b></a></div>

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/service_ps/" target="_blank"><b>Documentação: docker service ps</b></a></div>

<br />

<h2>6. Removendo uma máquina do Cluster</h2>



Para remover uma máquina do Cluster a partir da máquina Manager, digite o comando abaixo no Terminal da máquina Manager do Cluster (node4):

```bash
docker node rm WORKER
```

Onde:

- `WORKER`: É o nome da máquina que será removida do Cluster.

Vamos remover a máquina node2, através do comando abaixo:

```bash
docker node rm --force node2
```

Observe na imagem abaixo, que a máquina node2 foi removida do Cluster:

<div align="center"><img src="https://i.imgur.com/ylE9MhC.png" title="source: imgur.com" /></div>

Para conferir se a maquina node2 foi removida do Cluster, também podemos executar o comando abaixo na máquina Manager (node4):

```bash
docker node ls
```

Na imagem abaixo podemos observar que a máquina node2 não faz mais parte do Cluster. 

<div align="center"><img src="https://i.imgur.com/Tvp1qxs.png" title="source: imgur.com" /></div>

Digite o comando abaixo na máquina Manager (node4), para visualizarmos como ficou a distribuição das réplicas:

```bash
docker service ps my_web
```

Na imagem abaixo, vemos que em todas máquinas temos réplicas do serviço em execução:

<div align="center"><img src="https://i.imgur.com/CRoMGOr.png" title="source: imgur.com" /></div>

Observe que a réplica **my_web.3**, que estava na máquina node2, foi recriada na máquina node3, enquanto a réplica que estava na máquina node2 ficou **orfã** e por isso foi finalizada. 

Neste exemplo, podemos ver todo o poder do Orquestrador de Containers: **A máquina node2 foi removida do Cluster e o Docker Swarm prontamente criou uma nova réplica e distribuiu para outra máquina do cluster**. 

<br />

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/node_rm/" target="_blank"><b>Documentação: docker node rm</b></a></div>

<br />

<h2>7. Escalar um serviço</h2>

Agora que temos um serviço em execução no cluster, nós podemos redimensionar o número de containers e serviços. Dependendo do numero de acessos que uma aplicação recebe, pode ser necessário aumentar o número de containers em execução, ou seja, o número de réplicas. Para escalar o serviço, utilizamos o comando abaixo:

```bash
docker service scale <NOME_DO_SERVIÇO>=<NUMERO_DE_RÉPLICAS>
```

Onde:

- `<NOME_DO_SERVIÇO>`: Nome do serviço.
- `<NUMERO_DE_RÉPLICAS>`: Novo número de réplicas.

Vamos escalar o nosso serviço **my_web** para 10 réplicas, através do comando abaixo, na nossa instancia Manager (node4): 

```bash
docker service scale my_web=10
```

Na imagem abaixo, vemos a conclusão do escalonamento do serviço my_web. O serviço possuía 6 réplicas e após o escalonamento, passou a ter 10 réplicas:

<div align="center"><img src="https://i.imgur.com/UHz1kQQ.png" title="source: imgur.com" /></div>

Para verificar se todos as replicas/serviços estão online, podemos utilizar o comando abaixo, na nossa instancia leader (node4): 

```bash
docker service ps my_web
```

Podemos notar na imagem abaixo que temos 10 replicas do serviço **my_web**, distribuídas pelas máquinas do cluster.

<div align="center"><img src="https://i.imgur.com/LqSxJla.png" title="source: imgur.com" /></div>

Na máquina node1 temos 3 réplicas, na máquina node3 temos 3 réplica e na máquina node4 temos 4 réplicas, totalizando 10 réplicas.

Para reduzir o numero de réplicas do serviço, utilizamos o mesmo comando, atribuindo um numero menor de réplicas:

```bash
docker service scale my_web=5
```

<br />

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/service_scale/" target="_blank"><b>Documentação: docker service scale</b></a></div>

<br />

<h2>8. Inspecionar um serviço</h2>

Você pode obter os detalhes do seu serviço usando o `inspect`comando.

```bash
docker service inspect --pretty <SERVICE_NAME>
```

Onde:

- `--pretty`: Exibe o conteúdo de forma mais legível.
- `<SERVICE_NAME>`: Nome do serviço.

Para inspecionar o serviço **my_web**, digite o comando abaixo no Terminal da máquina Manager (node4):

```bash
docker service inspect --pretty my_web
```

A saída no Terminal será semelhante ao conteúdo abaixo:

```bash
ID:             nvo8qz8wqimour4nwksb7qsuk
Name:           my_web
Service Mode:   Replicated
 Replicas:      5
Placement:
UpdateConfig:
 Parallelism:   1
 On failure:    pause
 Monitoring Period: 5s
 Max failure ratio: 0
 Update order:      stop-first
RollbackConfig:
 Parallelism:   1
 On failure:    pause
 Monitoring Period: 5s
 Max failure ratio: 0
 Rollback order:    stop-first
ContainerSpec:
 Image:         nginx:latest@sha256:75263be7e5846fc69cb6c42553ff9c93d653d769b94917dbda71d42d3f3c00d3
 Init:          false
Resources:
Endpoint Mode:  vip
Ports:
 PublishedPort = 8080
  Protocol = tcp
  TargetPort = 80
  PublishMode = ingress 
```

Observe que o comando `docker service inspect` exibe todas as configurações do Cluster.

<br />

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/service_inspect/" target="_blank"><b>Documentação: docker service inspect</b></a></div>

<br />

<h2>9. Excluindo um serviço</h2>

Os serviços podem ser removidos usando o comando `docker service rm`.

```bash
docker service rm <SERVICE_NAME>
```

Onde:

- `<SERVICE_NAME>`: Nome do serviço.

Para excluir o serviço **my_web**, digite o comando abaixo no Terminal da máquina Manager (node4):

```bash
docker service rm my_web
```

A saída no Terminal será semelhante figura abaixo:

<div align="center"><img src="https://i.imgur.com/igvqUJi.png" title="source: imgur.com" /></div>

Para verificar se serviço foi removido, podemos utilizar o comando abaixo, na máquina Manager (node4): 

```bash
docker service ls 
```

Observe na imagem abaixo que o serviço **my_web** não existe:

<div align="center"><img src="https://i.imgur.com/e7XANQy.png" title="source: imgur.com" /></div>

<br />

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/service_rm/" target="_blank"><b>Documentação: docker service rm</b></a></div>

<br />

<h2>10. "Drenar um nó"</h2>

*A drenagem de um nó* impede que um nó (máquina) receba novas réplicas, além de interromper todas as tarefas em execução no nó. As tarefas que estavam no nó drenado serão distribuídas entre os demais nós. Para drenar um nó, utilizamos o comando:

```bash
docker node update --availability drain <HOSTNAME>
```

Onde:

- `--availability`: Máquina disponível.
- `<HOSTNAME>`: Nome da máquina.

Vamos recriar o serviço **my_web**, através do comando:

```bash
docker service create --name my_web --replicas 6 --publish published=8080,target=80 nginx
```

Na sequência, digite o comando abaixo, para checar o serviço:

```bash
docker service ps my_web 
```

Observe que as 3 máquinas do Cluster receberam réplicas:

<div align="center"><img src="https://i.imgur.com/KK6HEbd.png" title="source: imgur.com" /></div>

Vamos drenar o nó Manager (node4), para que ele não receba nenhuma réplica, através do comando:

```bash
docker node update --availability drain node4
```

Na sequência, digite o comando abaixo, para checar o serviço:

```bash
docker service ps my_web 
```

Observe na imagem abaixo, que apenas as máquinas node1 e node3 do Cluster receberam réplicas. A máquina Manager (node4), não recebeu nenhum:

<div align="center"><img src="https://i.imgur.com/fBAf1H7.png" title="source: imgur.com" /></div>

<br />

Adicione a máquina node 2 no Cluster novamente. No Terminal da máquina node 2, digite o comando abaixo, para sair do Cluster:

```bash
docker swarm leave
```

Ainda no Terminal da máquina node2, execute o comando abaixo para retornar ao Cluster:

```bash
docker swarm join --token SWMTKN-1-2eat9kqh801tm1ktxgs8z5wvw2fd5oxmhbszb29hjn7wzh5m23-e0coakr22rmvty2shtmb2nbgf 192.168.0.25:2377
```

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Atenção aos Detalhes ao adicionar as Máquinas no Cluster. Cada vez que um novo Cluster é criado, o Token de segurança nunca será o mesmo, portanto copie o comando do Terminal da sua máquina Manager.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Na sequência, volte para a máquina Manager (node4) e digite o comando abaixo, para checar o serviço:

```bash
docker service ps my_web 
```

Observe na imagem abaixo, que apenas as máquinas node1 e node3 do Cluster receberam réplicas. A máquina Manager (node4), não recebeu nenhum. A máquina node2, que foi novamente adicionada ao Cluster também não recebeu nenhuma réplica:

<div align="center"><img src="https://i.imgur.com/fBAf1H7.png" title="source: imgur.com" /></div>

<br />

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/node_update/" target="_blank"><b>Documentação: docker node update</b></a></div>

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/swarm_leave/" target="_blank"><b>Documentação: docker swarm leave</b></a></div>

<br />

<h2>11. Atualizando um serviço</h2>

Vamos atualizar o nosso serviço my_web para redistribuir as réplicas entre as 3 máquinas, através do comando:

```bash
docker service update --force <NOME_DO_SERVIÇO>
```

Onde:

- `--force`: Forçar a atualização.

- `<NOME_DO_SERVIÇO>`: Nome do serviço que será atualizado.

Para atualizar o serviço **my_web**, digite o comando abaixo na máquina Manager (node4):

```bash
docker service update --force my_web
```

Observe que todas as réplicas serão atualizadas:

<div align="center"><img src="https://i.imgur.com/DlQTCw0.png" title="source: imgur.com" /></div>

Na sequência, digite o comando abaixo, para checar o serviço:

```bash
docker service ps my_web 
```

Observe na imagem abaixo, que após o update, as réplicas foram redistribuídas entre as 3 máquinas (node1, node2 e node3):

<div align="center"><img src="https://i.imgur.com/0m3HsrA.png" title="source: imgur.com" /></div>

<br />

Para desativar a drenagem da máquina Manager (node4), utilize o comando:

```bash
docker node update --availability active <HOSTNAME>
```

Onde:

- `--availability`: Máquina disponível.
- `<HOSTNAME>`: Nome da máquina.

Vamos reativar o nó Manager (node4), para que ele volte a receber réplicas, através do comando:

```bash
docker node update --availability active node4
```

Na sequência, Para atualizar o serviço **my_web**, digite o comando abaixo na máquina Manager (node4):

```bash
docker service update --force my_web
```

Digite o comando abaixo, para checar o serviço:

```bash
docker service ps my_web 
```

Observe na imagem abaixo, que todas as máquinas do Cluster receberam réplicas:

<div align="center"><img src="https://i.imgur.com/auys64g.png" title="source: imgur.com" /></div>

<br />

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="4%"/> <a href="https://docs.docker.com/engine/reference/commandline/service_update/" target="_blank"><b>Documentação: docker service update</b></a></div>

<br />

<h2>ANEXO I - Principais Comandos do Docker Swarm</h2>

| Comando                                                      | Ação                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| `docker swarm init --advertise-addr “ip_da_instância”`       | Inicia o service swarm                                       |
| `docker swarm join --token <token> <ip:porta>`               | Adiciona as maquinas em um nó como  worker ou reachable      |
| `docker node ls`                                             | lista as instancias/nodes                                    |
| `docker node promote <HOSTNAME>`                             | Promove uma instancia para leader ou reachable               |
| `docker node demote <HOSTNAME>`                              | Rebaixa uma instancia para worker                            |
| `docker service ls`                                          | Lista os serviços que estão rodando                          |
| `docker swarm leave`                                         | Sai do Docker Swarm                                          |
| `docker swarm join-token manager`                            | Resgata o token para sincronizar com uma instancia leader ou reachable |
| `docker swarm join-token worker`                             | Resgata o token para sincronizar com uma instancia worker    |
| `docker service create --name <App Name> --replicas <Qtd Replicas> --publish published=<Port externa>,target=<Port interna> <Imagem>` | Cria um service no docker swarm                              |

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
