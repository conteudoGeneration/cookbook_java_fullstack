<h1> Introdução a Containers</h1>

Antes de falarmos sobre os containers, vamos falar um pouco sobre **Virtual Machine (VM ou Máquina Virtual)**.

Uma **Máquina Virtual**, conhecida como guest, é criada dentro de um ambiente de processamento, chamado host. Podem ser criadas várias máquinas virtuais simultaneamente em um host. Os principais arquivos que compõem uma máquina virtual incluem um arquivo de log, um arquivo de configuração NVRAM, um arquivo de disco virtual e um arquivo de configuração.

Agora imagine que temos um computador com o Sistema Operacional Windows instalado e através de um software de virtualização, como o Vmware, o VirtualBox, o Hyper-V entre outros, tenhamos a capacidade de criar alguns "Computadores Virtuais", executando outros Sistemas Operacionais, como o Linux, por exemplo, dentro deste computador.

<div align="center"><img src="https://i.imgur.com/DlT4qhU.png" title="source: imgur.com" /></div>

<br />

<h3>1.1. Quais são as desvantagens?</h3>

- No caso de sistemas operacionais iguais ao da Máquina host, precisaremos baixar e instalar tudo do zero, e no caso de uma preparação de ambiente também haverá duplicidade de dados.

- Uma vez que temos mais de um sistema operacional rodando de forma simultânea no mesmo computador físico também teremos um compartilhamento de processamento, de memória e de disco, o que pode reduzir drasticamente a performance de ambas as máquinas.

- As máquinas virtuais são menos eficientes e mais lentas do que um computador físico.

<h2>2. Containers</h2>


Um container é um ambiente de espaço do usuário isolado e minimalista que é executado no nível do sistema operacional, que compartilha recursos do sistema com outras instâncias. Os containers são projetados para fornecer um ambiente em tempo de execução portátil e consistente para aplicativos, consumindo menos recursos do que um servidor tradicional ou do que uma máquina virtual. Isso permite um melhor uso geral dos recursos computacionais em aplicativos distribuídos de vários componentes e sistemas altamente disponíveis.

Sendo assim podemos assumir que caso exista a necessidade de reservar um espaço em nossa máquina ou até mesmo em um servidor que contenha apenas as bibliotecas necessárias para o funcionamento de uma aplicação especifica, como o JDK, por exemplo, para rodarmos uma aplicação Spring Boot, podemos utilizar este recurso. Se houver a  necessidade de criar um outros espaço para rodar outra aplicação que também necessite do JDK, não precisaremos baixar as mesmas bibliotecas novamente, porque uma vez que na máquina host ou servidor já exista esta biblioteca, a mesma poderá ser compartilhada quantas vezes for necessário. Desta forma, temos uma redução em armazenamento em disco, processamento e uso da memória, pois dentro de um container teremos apenas o que é necessário para rodar a aplicação em questão.

Ao contrário das máquinas virtuais, que normalmente são construídas sobre hardware emulado por computador e executam sistemas operacionais totalmente isolados, os containers compartilham recursos do host, como o kernel e o sistema de arquivos, o que resulta em um uso de espaço muito menor.

![enter image description here](https://i.imgur.com/nYJksHq.png)

Para utilizarmos e criarmos os containers precisamos adotar um sistema de gerenciamento de containers para prosseguirmos com nosso aprendizado. Vamos adotar o [**Docker**](https://www.docker.com/), por ser o sistema mais popular e utilizado no mercado para este fim.

<h2>3. Introdução ao Docker</h2>


O Docker é uma ferramenta de containerização de código aberto, que foi muito importante para estimular a adoção de projetos de aplicativos baseados em componentes com microsserviços independentes. Embora existam outros sistemas de containerização, o Docker tornou-se popular por fornecer uma interface mais acessível e abrangente em torno da tecnologia.

Neste caso usaremos o Docker para a criação e manipulação dos nossos containers e para efetuarmos a instalação das nossas imagens.

<h3>3.1. Imagens</h3>

Outro conceito importante ao tratar de containers são as  **imagens.** Sendo o container um processo isolado, a imagem é o que dá a esse processo um sistema de arquivos. Por exemplo, comparando com uma máquina virtual, nós temos um arquivo do tipo  **iso** contendo uma imagem (cópia) do sistema operacional que desejamos usar, e utilizamos esta imagem  no Software de Virtualização para subir nosso sistema operacional. No caso do docker utilizamos as **imagens.**

No serviço [**DockerHub**](https://hub.docker.com/) temos vários ambientes containerizados prontos para uso. O Dockerhub disponibiliza Imagens de distribuições Linux, aplicações Flask, Node.js, Redis, Apache e várias outras. Algumas imagens são oficiais, por exemplo a do Ubuntu Linux, outras são criadas pelos próprios usuários e compartilhadas. Em resumo, para efeitos de comparação o Docker Hub pode ser chamado de “O GitHub dos containers”.

Para termos acesso a essas imagens, precisamos acessar  site do Docker Hub e fazer o cadastro clicando no link **Register** preenchendo o formulário abaixo:

<div align="center"><img src="https://i.imgur.com/LGmwHss.png" title="source: imgur.com" /></div>

Após registrar, faça o login no Docker hub e você terá acesso a tela abaixo:

![enter image description here](https://i.imgur.com/qHCYqbA.png)

Um pouco mais abaixo, podemos ver que ja temos algumas **imagens** indicadas para uso, dentre elas temos os Gerenciadores de Banco de dados Redis, Postgres, MySQL, o Sistema Operacional Linux na sua distribuição Ubuntu e muito mais.

![enter image description here](https://i.imgur.com/PUTqYg9.png)

Vamos começar testando o [NgInx](https://www.nginx.com/), que basicamente é um serviço que atua como servidor de paginas web:

No campo de busca digite a palavra Nginx e pressione a tecla enter do seu teclado:

![enter image description here](https://i.imgur.com/QXAJxzI.png)

O código disponível no canto superior direito `docker pull nginx` servirá apenas para baixarmos as libs no Docker, que posteriormente vamos utilizar sem a necessidade de baixá-las novamente.

***Neste caso vamos navegar até este ponto da página (indicado pela seta vermelha) e copiar o código.***

![enter image description here](https://i.imgur.com/LhfESIa.png)

```bash
 docker run --name serverHttp -d -p 8080:80 nginx
```

Atentes de avançarmos vamos entender o código:

 - `docker run` serve para execultar uma lib que temos ja baixada no nosso host docker,  neste caso como ainda não temos o nginx o prórprio docker dará um docker pull nginx.
 -  `--name` usaremos para nomear o container que será criado com o nginx, neste caso o nome será serverHttp.
 -  `-d` significa para fazer o deamon da aplicação (Rodar em segundo plano).
 -  `-p` define as portas que a aplicação será instalada dentro de container, e a porta que este container será exposto externamente  neste caso dentro do container instalaremos o nginx na porta 80 e ele será acessível através da porta 8080 externamente.
 -  `nginx` por fim este é o nome da imagem que precisamos que o docker baixe e instale no nosso container

Vamos testar...

**Importante!**
Não abordaremos a instalação do Docker, ao invés disso utilizaremos a plataforma gratuita e online do Docker, chamada **[Docker Playground](https://labs.play-with-docker.com/)**, para realizarmos as instalações destas imagens.

***Acesse o [Docker Playground](https://labs.play-with-docker.com/) e utilize o seu usuário e senha do Docker Hub para logar na plataforma***

![enter image description here](https://i.imgur.com/aLdS7Fi.png)

**Clique no botão Start -> Docker e na próxima tela faça o Login. Em seguida clique novamente no botão Start. **

***Clique em + add new instance, como mostra a imagem abaixo:***

![enter image description here](https://i.imgur.com/v2UCKUd.png)

**Ao criar uma nova instância a sua tela ficará semelhante a imagem abaixo:**
![enter image description here](https://i.imgur.com/CyETDch.png)

Enumeramos cada item para melhor compreensão

 1. Local onde indica quantos hosts estão aberto.
 2. Endereço de IP e opção de deixar uma porta visível externamente.
 3. Quantidade de memória disponivél e utilizada.
 4. Percentual de processamento usado.
 5. Endereço para conexão ssh. 
 6. Através do editor podemos ver a estrutura de pastas dentro da instância.
 7. Delete deleta a instância. 
 8. Este é o terminal executaremos os comandos docker para manipular nossos containers
 9. Através deste icone poderemos criarmais de uma instancia e interligala pela fucionalidade swarm do docker  (veremos isso mais a fundo na proxima sessão).
 10. Configuração do modo de exibição da pagina.
 11. Finalizar sessão.
 12. Temporizador da sessão, ao zerar o contato a sessão será finalizada.

<h2>4. Criando e testando o nosso primeiro container.</h2>

No console do Docker Playground, execute o seguinte comando:

```bash
docker run --name serverHttp -d -p 8080:80 nginx
```

![enter image description here](https://i.imgur.com/AmrBxAE.png) 

Repare que no campo 2, já temos a porta 8080 disponível para acesso. Vamos clicar na porta para vermos se nosso container está funcionando de forma publica.

![enter image description here](https://i.imgur.com/Jv5YHn6.png)

***Listando todos os containers que estão em execução:***

```bash
docker ps
```

Ao digitar o comando `docker ps` podemos ver as seguintes informações, de cada container que esta em execução: 

*CONTAINER ID, IMAGE, COMAND, CREATED, STATUS, PORTS E NAMES* 

![enter image description here](https://i.imgur.com/KIqAnjW.png)

 - **CONTAINER ID**: este é o id do container, através dele que iremos iniciar, pausar, e excluir nossos containers.
 - **IMAGE**: aqui mostra exatamente qual imagem nosso container foi baseado na hora de sua construção, neste caso o nginxa. 
 - **COMAND**: aqui mostra exatamente qual foi o comando que o docker usou para criar a aplicação.
 - **CREATED**: mostra à quanto tempo o container foi criado.
 - **STATUS**: a quanto tempo o container esta em execução.
 - **PORTS**: porta interna e externa do container.
 - **NAMES**: nome que escolhemos para nosso container.

Também podemos entrar no container que está em modo de execução com o comando:

 `docker exec –it <container_name> /bin/bash`

```bash
docker exec -it serverHttp /bin/bash
```

![enter image description here](https://i.imgur.com/7Nfv4Kh.png)

Uma vez dentro do container podemos navegar por `/usr/share/nginx/html` e nesta pasta encontraremos o arquivo html que contem a pagina inicial do nginx. Nesta  pasta podemos colocar nossa pagina web para expor o nosso site. 

Para sair do container basta executar o comando:

```bash
exit
```

Além disso, podemos pausar nosso container com o comando:

 `docker stop <container_name ou container_id>`

```bash
docker stop serverHttp
```

 **importante**: Uma vez que o container esteja com o status stop, nós só poderemos listar ele através do comando: `docker ps -a` 

Para excluir o container utilizamos o comando:

 `docker rm <container_name ou container_id>` 

```bash
docker rm serverHttp
```

**Importante**: só podemos excluir containers que estão com o status stop.

<h2>5. Dockerfile</h2>

A interface de linha de comando é o jeito manual de fazer as coisas. No nosso caso não é complexo fazer o pull, run, ps e stop de uma imagem, mas há como automatizar esse processo utilizando **_Dockerfiles._** Esses arquivos nada mais são do que listas de instruções utilizadas para automatizar a criação e configuração de containers. Também podemos salvar estes arquivos ao invés de decorar cada comando. O Dockerfile é uma maneira de criarmos containers com mais de uma configuração, como no exemplo abaixo, criaremos um container com um sistema operacional Linux Debian e instalaremos o serviço do Nginx dentro do sistema operacional que está dentro do container.

**Importante**: Vamos criar o arquivo Dockerfile no VSCode e salvaremos com o nome Dockerfile.

```dockerfile
# define a imagem base 
FROM debian:latest

# define o mantenedor da imagem
LABEL maintainer="Generation"

# Atualiza a imagem com os pacotes
RUN apt-get update && apt-get upgrade -y

# Instala o NGINX para testar
RUN apt-get install nginx -y

# Expoe a porta 80
EXPOSE 80

# Comando para iniciar o NGINX no Container
CMD ["nginx", "-g", "daemon off;"]
```

Após a criação do arquivo, arraste e solte o arquivo no Terminal do Docker Playground. Para confirmar que o upload do arquivo foi feito com sucesso, basta executar o comando `ls` para listar todos os arquivos e pastas.

![enter image description here](https://i.imgur.com/VsHWLYv.png)

Pronto! uma vez que o arquivo Dockerfile foi incluso dentro da pasta basta executar o seguinte comando:

 `docker build -t <imagem> .`

Vamos supor que você deseje criar a imagem com o nome: generation/nginx:1.0

Para fazer isso usamos o comando **build** e informamos o  nome da imagem, a tag e um ponto(.). O comando fica assim:

```bash
docker build -t generation/nginx .
```

- **docker build**:  O comando  
- **-t**:  Parâmetro usado para informar que a imagem pertence ao meu usuário  
- **generation/nginx**:  O nome da imagem e a tag atribuída à imagem  
- **.**: Significa que o diretório do arquivo Dockerfile é o mesmo diretório onde estamos executando o comando.

**Executando o comando docker build:**

![inserindo o comando docker](https://i.imgur.com/PweQgkn.png)

**Baixando todas as libs necessárias para construção da imagem:**

![Carregando instalação](https://i.imgur.com/4RGFxYX.png)

**Imagem Criada!**

![Imagem Criada](https://i.imgur.com/3rn55an.png)

Para conferir se a imagem foi criada e também todas as imagens armazenadas nesta instancia do docker, basta executar o comando: 

```bash
docker images
```

![Docker images](https://i.imgur.com/Qx3rNlP.png)

Repare que o Docker precisou baixar a imagem do Linux Debian antes de criar a nossa imagem com o Linux Debian e o Nginx. Isso acontece por que é necessário ter a imagem do sistema operacional antes de personalizá-la.

Uma vez que já temos a imagem criada, basta criar o container com a imagem usando o comando:

```bash
docker container run --name teste -d -p 80:80 generation/nginx
```

![enter image description here](https://i.imgur.com/Ktam9pT.png)

Agora vamos testar para ver se o nosso serviço está on-line. Você também pode executar o comando: 

```bash
docker ps
```

Você verá todos os containers que estão em modo de execução.

![enter image description here](https://i.imgur.com/NBCrzSx.png)

<h2>6. Principais Comandos Docker</h2>

|Comando		  |Ação                          |
|-----------------|------------------------------|
|`docker run --name <name_container> -d -p <porta_Externa:porta_Interna> <imageName>`	|Cria uma imagem e expõe uma porta            |
|`docker ps`     															|Lista todos os containers em execução           |
|`docker ps -a`																|Lista todos os containers com status stop|
|`docker exec –it <container_name> /bin/bash`								|Acessa um container|
|`exit`          															|Sai do container|
|`docker stop <container_name ou container_id>`								|Pausa um container|
|`docker rm <container_name ou container_id>`  								|Remove um container|
|`docker restart <container_name ou container_id>`							|Reinicia container|
|`docker inspect <container_name ou container_id>`							|Exibe mais informações sobre o container|
|`docker build -t <imagem> .`												|Cria uma imagem a partir de um Dockerfile|
|`docker images`															|Lista todas as imagens criadas|
|`docker container run --<name_container> teste -d -p pExterna:pInterna <nome_imagem>`|Cria um container baseado na imagem contida dentro da instancia do Docker|

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
