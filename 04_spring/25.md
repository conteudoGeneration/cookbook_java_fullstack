<h1>Deploy do Backend no Render</h1>

<h2>1. O que é Deploy?</h2>

O verbo **deploy**, em inglês, significa **implantar**.

Em programação, seu sentido está intimamente relacionado à sua tradução literal: fazer um deploy, em termos práticos, significa colocar na nuvem, ou seja, publicar na Internet alguma aplicação que teve seu desenvolvimento concluído.
Quando um site é finalizado por uma pessoa desenvolvedora, ele passa pelos últimos testes e finalmente ele é hospedado na nuvem através do processo chamado deploy.
Do mesmo modo, quando um sistema sofre alguma melhoria ou alteração em seu código-fonte, implementar essa alteração ao sistema que está publicado (em Produção), também é chamado de deploy, só que incremental.

<h2>2. O que veremos por aqui?</h2>

Esse documento é um passo a passo para você enviar a sua aplicação Spring, gratuitamente para a nuvem. Este processo irá gerar um link de acesso a sua aplicação, que poderá ser acessado de qualquer lugar, a partir de qualquer dispositivo com acesso a Internet. 
Para efetuar o Deploy vamos precisar fazer algumas modificações em nosso projeto, que serão detalhadas nos próximos tópicos.

<h2>👣 Passo 01 - Criar a Documentação da API</h2>

Para criar a Documentação da API no Swagger, utilize o <a href="22.md" target="_blank">**Guia de Configuração do Springdoc**</a>.

<h2 id="local">👣Passo 02 - Testar a API no seu computador</h2>

1. Execute a sua aplicação localmente pelo STS

2. Abra o endereço: **http://localhost:8080/** no seu navegador

3. A sua aplicação deverá exibir a tela de **Login (Usuário e Senha)**. Utilize o **usuário: *root@root.com*** e a **Senha: *rootroot***, que foram criados anteriormente.

<div align="center"><img src="https://i.imgur.com/mBRxYd8.png" title="source: imgur.com" width="50%"/></div>

4. Caso a aplicação **não** solicite o **Usuário** e a **Senha**, feche todas as janelas abertas do seu Navegador da Internet,  abra novamente e acesse o endereço acima. Se o problema persistir, verifique a sua configuração do Swagger.

5. Verifique se após o login, o **Swagger** está inicializando automaticamente.

6. Caso você não tenha testado no **Insomnia**, execute os testes e verifique se tudo está funcionando. 

7. Em especial, verifique se o Método **logar** está devolvendo o **Token**.

8. Antes de continuar a configuração do projeto para efetuar o Deploy, não esqueça de **parar a execução do Projeto no STS**.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <p align="justify"> **IMPORTANTE:**  *Não altere a senha do usuário root@root.com. Os instrutores da sua turma utilizarão este usuário para abrir, testar e corrigir a sua aplicação*. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="170px"/> | <p align="justify"> **ATENÇÃO:**  *Lembre-se que antes de fazer o Deploy é fundamental que a API esteja rodando e sem erros*. Não faça os testes via Swagger porquê o Swagger não utiliza todos os recursos da Spring Security, em especial o Token. Utilize o Insomnia para fazer os testes.</p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<h2>👣 Passo 03 - Criar uma conta grátis no Render</h2>

<h3>3.1 O que é o Render?</h3>

O Render é uma plataforma unificada para criar e executar todos os seus aplicativos e sites. O Render permite criar e executar todos os seus aplicativos e sites com SSL gratuito, um CDN global, redes privadas e implantações automáticas do Git. 

> Uma **CDN** (Rede de Entrega de Conteúdo) é um grupo de servidores geograficamente distribuídos que aceleram a entrega do conteúdo da Web, aproximando-o de onde os usuários estão. 

O Render é classificado como um **PaaS** (plataforma como serviço), ou seja, é um conjunto de serviços para criar e gerenciar  aplicativos na nuvem. PaaS fornece os componentes de infraestrutura, que permitem que as pessoas Desenvolvedoras criem, integrem, migrem,   implementem, protejam e gerenciem aplicativos móveis e da web, de forma  simples e rápida.

> **Modelos de Serviços na Nuvem:**
>
> - **Plataforma como um serviço (PaaS):** Um provedor de  serviços oferece acesso a um ambiente baseado em cloud no qual os  usuários podem desenvolver e fornecer aplicativos. Além do **Render**, o **Render** e o **Azure** da Microsoft também utilizam este modelo.
> - **Infraestrutura como um serviço (IaaS):**  Um provedor de serviços fornece aos clientes acesso Pay As You Go (Pague pelo que  você usar), para  armazenamento, rede, servidores e outros recursos de  computação na  cloud. O **AWS da Amazon e a Digital Ocean** seguem este modelo.
> - **Software como um serviço (SaaS):** Um provedor de  serviços oferece softwares e aplicativos por meio da  Internet. Os  usuários subscrevem ao software e o acessam por meio da web ou de API's  do fabricante. o **Google Apps e do Microsoft Office 365** seguem este modelo.

Um grande diferencial do Render é que ele oferece **contas gratuítas**, com algumas limitações, que permitem hospedar aplicações desenvolvidas em diversas linguagens e **01 Banco de dados PostgreSQL**.

**Principais Limitações do Plano Gratuito:**

- Se a aplicação ficar **15 minutos sem receber nenhuma requisição**, o aplicativo é finalizado e será reiniciado somente quando receber outra requisição, para economizar os recursos da plataforma.
- Os servidores do Render estão disponíveis apenas na Europa, Ásia e nos Estados Unidos.
- Os recursos de Memória, Disco e Processamento são  limitados, logo a aplicação e principalmente o Banco de dados não podem  ser muito grandes.
- Aceita **apenas um Banco de dados por conta**;
- O **tráfego mensal é limitado a 750 horas somando todas as aplicações e o Banco de dados**, ou seja, se ultrapassar este valor antes do mês acabar, sua conta ficará suspensa até o mês seguinte;
- Dependendo da linguagem, o Deploy da aplicação deverá ser realizado via Docker.

<br />

<div align="left"><img src="https://i.imgur.com/nnCZtX8.png" title="source: imgur.com" width="25px"/> <a href="https://render.com/docs/free" target="_blank"><b>Documentação: Render - Plano Gratuíto</b></a></div>

<br />

Vamos criar a conta no Render para fazermos o Deploy:

1) Acesse o endereço: **https://www.render.com**

<div align="center"><img src="https://i.imgur.com/1VVzxQD.png" title="source: imgur.com" width="90%"/></div>

2. Existem diversas formas de criar uma conta no Render. Neste Guia utilizaremos a conta do Github. Clique no link **GitHub**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/xfjXrJ8.png" title="source: imgur.com" /></div>

3. Na próxima janela, digite o endereço do e-mail e a senha da sua conta do Github, e em seguida clique no botão **Sign in**

<div align="center"><img src="https://i.imgur.com/gOhiPeU.png" title="source: imgur.com" /></div>

4. Na próxima janela, autorize o Render a acessar a sua conta do Github, clicando no botão **Authorize Render**.

<div align="center"><img src="https://i.imgur.com/H3q1w18.png" title="source: imgur.com" /></div>

5. Na próxima janela, confirme se o endereço do e-mail está correto e clique no botão **COMPLETE SIGN UP**

<div align="center"><img src="https://i.imgur.com/AA50W1E.png" title="source: imgur.com" /></div>

6. Na próxima janela, será exibida uma mensagem solicitando que você verifique se recebeu uma mensagem no seu e-mail para validar a sua conta no Render. Abra a sua conta de e-mail e verifique se o e-mail foi recebido. Caso não tenha recebido, clique no botão **RESEND VERIFICATION EMAIL**.

<div align="center"><img src="https://i.imgur.com/rZGSHqM.png" title="source: imgur.com" /></div>

7. Abra o e-mail enviado pelo Render (semelhante a imagem abaixo) e **clique no link para validar a sua conta**.

<div align="center"><img src="https://i.imgur.com/wlXD6G8.png" title="source: imgur.com" /></div>

8. Depois de clicar no link, sua conta será validada e será redirecionada para a tela do **Dashboard**.

<div align="center"><img src="https://i.imgur.com/AusmZfX.png" title="source: imgur.com" /></div>

<br />


| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <p align="justify"> **ATENÇÃO:**  *Conclua todas etapas do processo de criação da conta no Render antes de avançar para o próximo passo do Deploy*. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>👣 Passo 04 - Adicionar a Dependência do PostgreSQL no pom.xml</h2>

O Render, na sua versão gratuita, utiliza o **PostgreSQL** como **SGBD** (Sistema Gerenciador de Bando de dados). 

No Bloco 02 estamos utilizando o **MySQL** para desenvolver o Blog Pessoal. Ambos são Banco de dados Relacionais e graças ao **Spring Data JPA**, não será necessário realizar nenhuma alteração no código da nossa aplicação. A única mudança necessária, além de adicionar a **Dependência do PostgreSQL no pom.xml**,  será necessário configurar a conexão com o Banco de dados PostgreSQL na nuvem. 

<br />

<div align="left"><img src="https://i.imgur.com/b3khcJI.png" title="source: imgur.com" width="25px"/> <a href="https://www.postgresql.org/" target="_blank"><b>Site Oficial: PostgreSQL</b></a></div>

<br />
	
No arquivo, **pom.xml**, vamos adicionar as linhas abaixo, com a dependência do **PostgreSQL**:

```xml
<!-- Dependência do Banco de dados PostgreSQL -->
<dependency>
	<groupId>org.postgresql</groupId>
	<artifactId>postgresql</artifactId>
</dependency> 
```

<br />

<h2>👣 Passo 05 - Configurar o Banco de Dados na Nuvem</h2>

A Configuração do Banco de dados Local é diferente da configuração que será utilizada no Render. 

No passo anterior, adicionamos a Dependência do PostgreSQL no arquivo pom.xml, neste passo vamos configurar a aplicação para acessar o Banco de dados remoto que será criado no Render.

Para simplificar o processo, vamos utilizar um recurso do Spring chamado **Profiles** (perfis), que nada mais é do que criar um modelo de configuração para cada etapa do desenvolvimento da aplicação, ou seja, uma configuração para usar localmente (**application-dev.properties**) e outra configuração para usar na nuvem (**application-prod.properties**). 

O grande benefício dos Profiles é simplificar a troca entre a configuração Local (**MySQL**) e a configuração Remota do Render (**PostgreSQL**). 

1) Na Source Folder **src/main/resources**, crie os arquivos **application-dev.properties** (Configuração do Banco de dados local) e **application-prod.properties** (Configuração do Banco de dados na nuvem), como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/EKZASZm.png" title="source: imgur.com" width="45%"/></div>

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="250px"/> | <p align="justify"> **ALERTA DE BSM:** *Mantenha a atenção aos detalhes ao criar os arquivos application-dev.properties e application-prod.properties. Cuidado para não se equivocar ao nomear os arquivos ou criar em uma pasta diferente.* </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

2. Vamos criar o primeiro arquivo. No lado esquerdo superior, na **Guia Package explorer**, na Source Folder **src/main/resources**, clique com o botão direito do mouse e clique na opção **New 🡢 File**.

3) Em **File name**, digite o nome do primeiro arquivo (**application-dev.properties**) e clique no botão **Finish**.

<div align="center"><img src="https://i.imgur.com/Q1s30nm.png" title="source: imgur.com" width="50%"/></div>

4. Vamos criar o segundo arquivo da mesma forma que criamos o primeiro.

5. Em **File name**, digite o nome do segundo arquivo (**application-prod.properties**) e clique no botão **Finish**.

<div align="center"><img src="https://i.imgur.com/pSiak7m.png" title="source: imgur.com" width="50%"/></div>

Agora vamos configurar os 3 arquivos **.properties**:

<br />

<h3>5.1 Configuração do arquivo application.properties</h3>

1. Abra o arquivo **application.properties**, **apague todo o conteúdo do arquivo** e substitua pelas linhas abaixo  e salve o arquivo.

```properties
spring.profiles.active=prod

springdoc.api-docs.path=/v3/api-docs
springdoc.swagger-ui.path=/swagger-ui.html
springdoc.swagger-ui.operationsSorter=method
springdoc.swagger-ui.disable-swagger-default-url=true
springdoc.swagger-ui.use-root-path=true
springdoc.packagesToScan=com.generation.blogpessoal.controller
```

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <p align="justify"> **ALERTA DE BSM:** *Mantenha a atenção aos detalhes ao configurar o arquivo application.properties. Cuidado para não apagar a configuração do Swagger (SpringDoc).* </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="180px"/> | <p align="justify"> **ALERTA DE BSM:** *Mantenha a atenção aos detalhes ao configurar o arquivo application.properties. Na ultima linha (springdoc.packagesToScan), verifique se os pacotes da sua aplicação estão configurados da mesma forma que o trecho de código acima, caso contrário, altere a configuração.* </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h3>5.2 Configuração do arquivo application-dev.properties</h3>

1. Abra o arquivo **application-dev.properties**, insira as linhas abaixo (configuração original do **application.properties**) e salve o arquivo. 
1. **Não esqueça de alterar a senha do usuário root caso a sua senha do MySQL não seja root**.

```properties
spring.jpa.hibernate.ddl-auto=update
spring.jpa.database=mysql
spring.datasource.url=jdbc:mysql://localhost/db_blogpessoal?createDatabaseIfNotExist=true&serverTimezone=America/Sao_Paulo&useSSl=false
spring.datasource.username=root
spring.datasource.password=root
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.MySQLDialect

spring.jpa.properties.jakarta.persistence.sharedCache.mode=ENABLE_SELECTIVE

spring.jackson.date-format=yyyy-MM-dd HH:mm:ss
spring.jackson.time-zone=Brazil/East
```

<br />

<h3>5.3 Configuração do arquivo application-prod.properties</h3>

1. No arquivo, **application-prod.properties**,  insira as linhas abaixo e salve o arquivo:

```properties
spring.jpa.generate-ddl=true
spring.jpa.database=postgresql
spring.datasource.url=jdbc:postgresql://${POSTGRESHOST}:${POSTGRESPORT}/${POSTGRESDATABASE}
spring.datasource.username=${POSTGRESUSER}
spring.datasource.password=${POSTGRESPASSWORD}

spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.PostgreSQLDialect

spring.jpa.properties.jakarta.persistence.sharedCache.mode=ENABLE_SELECTIVE

spring.jackson.date-format=yyyy-MM-dd HH:mm:ss
spring.jackson.time-zone=Brazil/East
```

Observe no código acima que nas configurações referentes ao acesso ao Banco de dados na nuvem (endereço, usuário, senha, entre outros), foram inseridas **variáveis de ambiente**, que serão configuradas no Render com os dados de acesso.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="120px"/> | <div align="left"> **ATENÇÃO:** *Depois de finalizar as configurações dos 3 arquivos, recomendamos executar o comando Update Project para atualizar as configurações do projeto.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h3>5.4 Alternando entre os perfis no arquivo application.properties</h3>

1. Para alternar entre as configurações Local e Remota, abra o arquivo **application.properties** e utilize uma das 2 opções abaixo:

<b><code>spring.profiles.active=dev</code> </b> 🡢 O Spring executará a aplicação com a configuração do Banco de dados local (MySQL)

<b><code>spring.profiles.active=prod</code> </b> 🡢 O Spring executará a aplicação com a configuração do Banco de dados na nuvem (Render)

Para o Deploy, devemos deixar a linha **spring.profiles.active** configurada com a opção **prod**.

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="250px"/> | <p align="justify"> **ALERTA DE BSM:** *Mantenha a atenção aos detalhes ao criar os perfis do Banco de Dados. Um erro muito comum é tentar executar o seu projeto no STS com o Perfil prod habilitado no arquivo application.properties. Com o perfil prod habilitado, o projeto não será inicializado.* </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ATENÇÃO:** *Caso o projeto seja inicializado normalmente com o perfil prod, verifique se os nomes dos arquivos de perfil e as configurações estão corretas. Se peristir, execute o comando Update Project.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />    


<h2>👣 Passo 06 - Criar o arquivo Dockerfile</h2>

O Render não possui nativamente o suporte ao Java. Como opção para fazer o Deploy de aplicações Java, o Render oferece a possibilidade de utilizar o **Docker**, sem a necessidade de instalar o Docker Desktop no computador.

O **Docker** é um projeto para automatizar a implantação de aplicativos como **Containers** autossuficientes e portáteis, que podem ser executados na nuvem ou localmente, a partir de **imagens** contendo o ambiente mínimo para executar uma aplicação. 

Uma **Imagem** nada mais é do que uma **representação imutável** de como será efetivamente construído um container. **Exemplo:** uma imagem contendo o Ubuntu Linux, uma imagem contendo o Java 17, entre outros. 

Como uma imagem é imutável, nós não podemos executar a imagem de forma direta, nós fazemos isso através de um **Container**, que é uma tecnologia que permite empacotar e isolar aplicações com  o seu  ambiente de tempo de execução, ou seja, com todos os arquivos  necessários para executar.

<div align="center"><img width="65%" src="https://i.imgur.com/ZnwbDac.png" title="source: imgur.com" /></div>

O ponto principal que precisamos compreender para efetuarmos o Deploy da nossa aplicação no Render é que escrevemos um **Dockerfile**, construímos uma imagem a partir do Dockerfile, e por fim, criamos e executamos o container. **O container é o fim enquanto a imagem é o meio**.

<div align="center"><img width="65%" src="https://i.imgur.com/7jQda72.png" title="source: imgur.com" /></div>

O **Dockerfile** nada mais é do que **um meio que utilizamos para criar nossas próprias imagens**. Em outras palavras, ele serve como uma **receita para construir um container**, permitindo definir um ambiente personalizado e próprio para meu projeto pessoal ou empresarial. 

No Projeto Blog Pessoal nós iremos **construir o Dockerfile e o Render se encarregará de construir a Imagem e o Container com o ambiente necessário para executar o projeto Blog Pessoal**.

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ATENÇÃO:** *O nosso foco não é estudar o Docker. O foco neste momento é compreender como criaremos o Dockerfile necessário para efetuarmos o Deploy da nossa aplicação no Render*.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

Veja na tabela abaixo os comandos do **Dockerfile** que vamos utilizar:

| Comandos       | Descrição                                                    |
| -------------- | ------------------------------------------------------------ |
| **FROM**       | Deve ser o primeiro comando de um Dockerfile, com ele configuramos qual a imagem que queremos utilizar como base na nossa imagem. Podemos criar uma imagem a partir de uma imagem do Java ou de um sistema Linux e assim por diante. |
| **RUN**        | Serve para executar comandos no processo de montagem da imagem que estamos construindo no Dockerfile, ele é executado durante o *build* (construção da imagem) e não durante a construção do container. Em um Dockerfile é possível ter mais de um comando **RUN**. |
| **COPY**       | Comando para copiar arquivos e pastas de um lugar específico na máquina local para uma pasta no container. O COPY é utilizado para copiar arquivos e pastas locais. |
| **VOLUME**     | Quando adicionamos **VOLUME** no Dockerfile estamos informando um ponto de montagem, criando uma pasta que ficará disponível entre o *container* e o *host*. |
| **WORKDIR**    | Define a pasta dentro do container onde os comandos serão executados. |
| **ENTRYPOINT** | É um comando que não pode ser sobrescrito, ele sempre será executado e o container irá rodar como um executável. Quando este comando "morrer" (finalizar), o container morrerá também. |
| **ARG**        | A instrução ARG define uma variável que os usuários podem passar em tempo de compilação do container. Se um usuário especificar um argumento de compilação que não foi definido no Dockerfile, a compilação gerará um aviso. |

O Render ao receber o Dockerfile através do repositório do Github, vai gerar a Imagem e o Container automaticamente, e caso não aconteça nenhum erro, a sua aplicação será implantada na nuvem e o Render lhe oferecerá um endereço (https://meuprojeto.onrender.com) para acessar externamente. Veja umresumo do processo na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/3aBN02y.png" title="source: imgur.com" /></div>

Vamos criar o arquivo **Dockerfile** no projeto Blog Pessoal:

1. Na **raiz do seu projeto**, na pasta **blogpessoal** (como mostra a figura abaixo), crie o arquivo **Dockerfile**.

<div align="center"><img src="https://i.imgur.com/iOdo9rb.png" title="source: imgur.com" /></div>

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="250px"/> | <p align="justify"> **ALERTA DE BSM:** *Mantenha a atenção aos detalhes ao criar o arquivo Dockerfile. Um erro muito comum é não criar o arquivo na pasta raíz do projeto. Outro erro comum é digitar o nome do arquivo com letras minúsculas. Observe que o arquivo inicia com letra maiúscula* </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

2. Na Guia **Package Explorer**, clique com o botão direito do mouse sobre a pasta do projeto (indicada em azul) e clique na opção **New 🡢 File**.

<div align="center"><img src="https://i.imgur.com/ykiTjTa.png" title="source: imgur.com" /></div>

3. Em **File name**, digite: **Dockerfile** e clique no botão **Finish**.

<div align="center"><img width="55%" src="https://i.imgur.com/nCpNXbO.png" title="source: imgur.com" /></div>

4. Copie o código abaixo dentro do arquivo **Dockerfile** que você criou:

```dockerfile
FROM openjdk:17.0.1-jdk-oracle as build

WORKDIR /workspace/app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

RUN chmod -R 777 ./mvnw

RUN ./mvnw install -DskipTests

RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

FROM openjdk:17.0.1-jdk-oracle

VOLUME /tmp

ARG DEPENDENCY=/workspace/app/target/dependency

COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java","-cp","app:app/lib/*","com.generation.blogpessoal.BlogpessoalApplication"]
```

Vamos entender o código:

<div align="center"><img src="https://i.imgur.com/SgTILC7.png" title="source: imgur.com" /></div>

A Criação do Container é dividida em 2 estágios:

1. Criar o Build da aplicação, ou seja, gerar o arquivo JAR.
2. Executar a Aplicação dentro do Container

Vamos detalhar as etapas:

**Etapa 01 - Build da aplicação**

**Linha 1:** Estamos indicando que o Build da aplicação será gerado a partir de uma imagem contendo a versão 17 do Java, rodando sobre o Linux numa versão minimalista, ou seja, apenas o necessário para executar o Java 17. Neste momento será feito o download da imagem contendo o Java 17. Observe que no final do nome da imagem, temos o alias **as build**, indicando que o Java 17 será executado nesta etapa em modo Build.

**Linha 3:** Estamos indicando que dentro do nosso container, o Build da nossa aplicação será gerado dentro da pasta **/workspace/app**.

**Linha 5 a 8:** Copia o projeto do **Repositório do Github** para a pasta **/workspace/app**.

**Linha 10:** Autoriza a execução do **Maven** (mvnw) dentro da pasta **/workspace/app**. Sem este comando, o Render devolverá o erro: **Permission Denied! (Permissão negada)**

**Linha 12:** Gera o Build da nossa aplicação, excluindo os testes, porquê em produção eles são desnecessários. Neste momento será feito o download de todas as dependências do projeto do Repositório central do Maven e o arquivo JAR será criado.

**Linha 14:** Cria a pasta **target/dependency**, e na sequência descompacta o arquivo .JAR que foi gerado. Ao descompactar o JAR, está sendo extraída uma versão compilada do código, ou seja, pronta para executar.



**Etapa 02 - Executar aplicação**

**Linha 16:** Indica que a nossa aplicação será executada através da imagem da versão 17 do Java, que já foi obtida via download.

**Linha 18:** Cria um volume chamado **/tmp** para armazenar os arquivos temporários.

**Linha 20:** Indica onde os arquivos e pastas do Build do projeto serão gravados.

**Linha 22 a 24:** Copia todos os arquivos e pastas gerados no Build da aplicação, na pasta **/workspace/app/target/dependency**, dentro da pasta **/workspace/app**.

**Linha 26:** Executa o projeto Blog Pessoal. 

**Importante:** A instrução "**com.generation.blogpessoal.BlogpessoalApplication**" deve ser igual ao caminho da Classe Main da aplicação, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/dPmctx5.png" title="source: imgur.com" /></div>

Observe na imagem acima que:

- **com.generation.blogpessoal** 🡢 Pacote principal da aplicação.
- **BlogpessoalApplication** 🡢 Nome da Classe que contém o método **main()**.

Salve o arquivo antes de continuar.

<br />

<div align="left"><img src="https://i.imgur.com/1fDswF4.png" title="source: imgur.com" width="30px"/> <a href="https://docs.docker.com/engine/reference/builder/" target="_blank"><b>Documentação: Dockerfile</b></a></div>

<div align="left"><img src="https://i.imgur.com/S4GYUIM.png" title="source: imgur.com" width="30px"/> <a href="https://maven.apache.org/wrapper/" target="_blank"><b>Documentação: Maven Wrapper - MVNW</b></a></div>

<div align="left"><img src="https://i.imgur.com/PuWeuww.png" title="source: imgur.com" width="30px"/> <a href="https://www.guiafoca.org/guiaonline/iniciante/ch11s07.html" target="_blank"><b>Documentação: Linux - CHMOD</b></a></div>

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="30px"/> <a href="https://github.com/rafaelq80/backend_blogpessoal_v3/tree/18_Deploy" target="_blank"><b>Código fonte do Projeto finalizado</b></a>


<br />

<h2>👣 Passo 07 - Atualizar o repositório do projeto no Github</h2>

1. Envie as atualizações do seu projeto para o repositório do  Github, através do **Git Bash**, utilizando os comandos abaixo:

   ```bash
    git add .
    
    git commit -m “Deploy do Projeto Blog Pessoal”
    
    git push origin main
   ```
   
| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="400px"/> | <div align="left"> **ATENÇÃO:** *Para efetuar o Deploy, o projeto Spring OBRIGATORIAMENTE precisa estar em um Repositório EXCLUSIVO e não pode estar DENTRO DE UMA PASTA, ou seja, ao abrir o repositório do projeto no Github, o conteúdo exibido será semelhante ao da imagem abaixo. Outro ponto importante é que o arquivo Dockerfile deve estar na raiz do projeto*.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<div align="center"><img src="https://i.imgur.com/Xkw4wJS.png" title="source: imgur.com" /></div>

<br />

<h2>👣 Passo 08 - Criar o Banco de dados no Render</h2>



1. Para adicionar um novo Banco de dados, no Dashboard do Render, clique no botão **New +** e em seguida clique na opção **PostgreSQL**.

<div align="center"><img src="https://i.imgur.com/MbMjaSK.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <p align="justify"> **ATENÇÃO:** O Plano Gratuito do Render autoriza a criação de apenas 1 Banco de dados PostgreSQL por conta. Outro ponto importante é que me 90 dias o Banco será apagado (Drop Database). </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

2. Na próxima tela, informe o nome do Banco de dados (**db_blogpesoal**), na propriedade **Name**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/0LCVlTo.png" title="source: imgur.com" /></div>

3. Role a tela para baixo e verifique se o Plano Gratuito (**Free**) está selecionado e na sequência, clique no botão **Create Database**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/fbrL22b.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <p align="justify"> **ATENÇÃO:** *Caso seja selecionado um plano diferente, o Render exigirá o Cartão de Crédito para emitir a fatura do serviço. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

4. Na próxima tela, aguarde até que o **Status** esteja **Available**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/Aq2bsDP.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <p align="justify"> **ATENÇÃO:** *O processo do Deploy enviará apenas a sua aplicação para a nuvem, logo o Banco de dados que será criado nesta etapa estará vazio. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>👣 Passo 09 - Criar o Web Service no Render</h2>



1. Na barra de menus principal do Render, clique no item Dashboard, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/AYQts2Z.png" title="source: imgur.com" /></div>

2. Para adicionar um novo Web Service, no Dashboard do Render, clique no botão **New +** e em seguida clique na opção **Web Service**.

<div align="center"><img src="https://i.imgur.com/FVGlwLN.png" title="source: imgur.com" /></div>

3. No item **GitHub**, clique no link **+ Connect account**, para conectar a sua conta do Render com a sua Conta do Github.

<div align="center"><img src="https://i.imgur.com/xaffIQz.png" title="source: imgur.com" /></div>

4. Na tela, **Install Render**, clique no seu usuário do Github (no exemplo, rafaelproinfo), como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/hfSfPEx.png" title="source: imgur.com" /></div>

5. Na próxima tela, clique no botão **Install**, para concordar que o Render acesse a sua Conta do Github.

<div align="center"><img src="https://i.imgur.com/Mvp1eX5.png" title="source: imgur.com" /></div>

6. Conecte o Render com o Repositório onde você enviou o Blog Pessoal, clicando no botão **Connect**, localizado ao lado do Repositório.

<div align="center"><img src="https://i.imgur.com/E2JyydO.png" title="source: imgur.com" /></div>

7. Na próxima tela, informe o nome da sua aplicação na propriedade **Name** (blogpessoal) e verifique se a propriedade **Environment** está com a opção **Docker** selecionada.

<div align="center"><img src="https://i.imgur.com/sqfjbNy.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="120px"/> | <p align="justify"> **ATENÇÃO:** O NOME DO PROJETO NÃO PODE CONTER LETRAS MAIUSCULAS, NUMEROS OU CARACTERES ESPECIAIS. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

8. Role a tela para baixo e verifique se o Plano Gratuito (**Free**) está selecionado.

<div align="center"><img src="https://i.imgur.com/ZUU3Et2.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <p align="justify"> **ATENÇÃO:** Caso seja selecionado um plano diferente, o Render exigirá o Cartão de Crédito para emitir a fatura do serviço. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>👣Passo 10 - Configurar as Variáveis de Ambiente</h2>



Nesta etapa, serão criadas 5 variáveis de ambiente, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/c4AIxwx.png" title="source: imgur.com" /></div>

Antes de criarmos as variáveis, precisamos identificar os dados que serão inseridos nestas variáveis, que estão disponíveis no **Banco de dados** criado no passo anterior. 

1. Na **Barra Principal** do Render, clique com o botão direito mouse no item **Dashboard** e clique na opção **Abrir link em uma Nova Guia**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/EKMMRG5.png" title="source: imgur.com" /></div>

2. Na nova guia que foi aberta, clique no Banco de dados **db_blogpessoal**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/tJzANXP.png" title="source: imgur.com" /></div>

3. Role a tela para baixo e localize o item: **Connections**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/Vm5Y74T.png" title="source: imgur.com" /></div>

4. Na imagem abaixo, está indicada qual variável receberá cada item da configuração do Banco de dados na nuvem:

<div align="center"><img src="https://i.imgur.com/N7GXWVI.png" title="source: imgur.com" /></div>

5. Ao criar a variável **POSTGRESHOST**, acrescente no final do **Hostname**: ***.oregon-postgres.render.com***. Caso contrário o Sprinh não conectará com o banco de dados.
6. Nas demais variáveis, utilize os mesmos dados que estão na tela do Banco de dados.
7. No exemplo acima, a configuração ficou da seguinte forma:

| Variável             | Conteúdo                                                |
| -------------------- | ------------------------------------------------------- |
| **POSTGRESHOST**     | *dpg-ccdmqr6n6mpu7e89atrg-a.oregon-postgres.render.com* |
| **POSTGRESPORT**     | *5432*                                                  |
| **POSTGRESDATABASE** | *db_blogpessoal*                                        |
| **POSTGRESUSER**     | *db_blogpessoal_user*                                   |
| **POSTGRESPASSWORD** | *senha do banco de dados*                               |

Agora vamos criar as variáveis:

1. Volte para a Guia onde o **Web Service** está sendo criado e role a tela para baixo e clique no botão **Advanced**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/xBSB5q0.png" title="source: imgur.com" /></div>

2. Na sequência, clique no botão **Add Environment Variable**

<div align="center"><img src="https://i.imgur.com/Irh8nio.png" title="source: imgur.com" /></div>

3. No item **Key**, informe o nome da 1ª variável: **POSTGRESHOST**

<div align="center"><img src="https://i.imgur.com/xUxhRJM.png" title="source: imgur.com" /></div>

4. Cole no item **Value** da Variável de Ambiente **POSTGRESHOST** o Hostname do Banco de dados, conforme detalhado nos itens acima, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/e3jlYHq.png" title="source: imgur.com" /></div>

5. **Repita os passos 2, 3 e 4** para criar as demais variáveis.

6. Verifique se a propriedade **Auto-Deploy** está com a opção **Yes** selecionada

<div align="center"><img src="https://i.imgur.com/QfGb1V0.png" title="source: imgur.com" /></div>

7. Clique no botão **Create Web Service** para criar o Web Service e iniciar o Deploy.

<div align="center"><img src="https://i.imgur.com/3IFof7N.png" title="source: imgur.com" /></div>

8. Acompanhe o processo do Deploy no **Log do Web Service**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/9IDFRMP.png" title="source: imgur.com" /></div>

9. Ao **finalizar a criação da imagem e do Container Docker**, será exibida a mensagem: **DONE**, como mostra a imagem abaixo e na sequência a aplicação será iniciada.

<div align="center"><img src="https://i.imgur.com/9dmvu47.png" title="source: imgur.com" /></div>

10. Observe na imagem abaixo, que caso a aplicação inicialize sem erros, será exibida a mensagem informando que a aplicação está em execução. A mensagem é a mesma que é exibida no **Console do STS**.

<div align="center"><img src="https://i.imgur.com/MyZSexS.png" title="source: imgur.com" /></div>

11. Para **confirmar que o Deploy foi concluído com êxito**, verifique na parte superior da tela de **Log do Webservice**, se apareceu a mensagem **Live**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/7vRNY3x.png" title="source: imgur.com" /></div>

12. Se apareceu esta mensagem, o Deploy foi finalizado com sucesso!

13. Para abrir a aplicação no Navegador da Internet, clique no link da aplicação, indicado na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/tgEfV7G.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <p align="justify"> **ATENÇÃO:** Ao clicar no link da aplicação, o projeto não abrirá automaticamente no navegador. Como o Docker precisa finalizar alguns processos, ele pode demorar alguns minutos para abrir. O tempo médio do processo de deploy completo do Blog Pessoal pode demorar um pouco.</p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <p align="justify"> **ALERTA DE BSM:** *Mantenha a atenção aos detalhes. Caso o nome do projeto já seja um endereço em uso no Render, ele acrescentará caracteres aleatórios depois do nome do projeto ao criar o endereço da aplicação. Exemplo: blogpessoal-wrtc.onrender.com*. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>❌ O Deploy não Abriu!</h2>



❌**O Deploy não abre no Navegador**

-  Se o **Console** indica que a aplicação subiu, S**tarted BlogpessoalApplication in 15.456 seconds (JVM running for 20.59)**, mas ao abrir a aplicação no Navegador aparece a mensagem abaixo:

<div align="center"><img src="https://i.imgur.com/AlKoYkc.png" title="source: imgur.com" /></div>

- Clique no botão **Manual Deploy** e em seguida, clique na opção **Clear build cache & deploy** para refazer o deploy, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/3zTUQrU.png" title="source: imgur.com" /></div>

- Aguarde a conclusão e tente abrir novamente

❌**O Deploy Falhou**

- Se aparecer a mensagem **Failed**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/7SaAc4l.png" title="source: imgur.com" /></div>

- Caso não tenha aparecido mensagens de erro no **Console, na tela Log do Webservice** (O projeto Spring inicializou, mas o deploy falhou), clique no botão **Manual Deploy** e em seguida, clique na opção **Clear build cache & deploy** para refazer o deploy, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/3zTUQrU.png" title="source: imgur.com" /></div>

- Se o erro persistir, verifique se as **Variáveis de Ambiente estão configuradas corretamente**. Caso seja necessário atualizar o valor de qualquer Variável de ambiente, o Render iniciará um novo Deploy automaticamente após a atualização;
- Caso tenha aparecido algum erro no **Log do Web Service**, identifique o tipo do erro:
  - Se for erro no **Dockerfile**, corrija o erro e atualize o seu repositório no Github;
  - Se for erro de código (erro do Spring), siga as instruções do tópico: <a href="#update">**3. Como atualizar o Deploy no Render?**</a> e corrija o erro.


<br />

<h2>👣 Passo 11 - Abrir o Deploy no Navegador</h2>

1. Ao abrir a sua aplicação no Navegador, será exibida a tela de login abaixo. Como o Banco de dados criado no Render está vazio, precisamos criar uma conta de usuário e efetuar o login com esta conta antes de exibir a sua documentação no Swagger. 

<div align="center"><img src="https://i.imgur.com/MTFkYZb.png" title="source: imgur.com" /></div>

2. Abra o **Insomnia** e acesse a Workspace **Blog Pessoal**.

3. Crie uma pasta chamada **Blog Pessoal** e arraste as 3 pastas (Postagem, Tema e Usuario) para dentro dela.

4. Duplique a pasta **Blog Pessoal**.

5. Na próxima janela, defina o nome da nova pasta como **Blog Pessoal - Render**.

<div align="center"><img src="https://i.imgur.com/hE8xkGA.png" title="source: imgur.com" /></div>

6. Abra a requisição **Cadastrar Usuário** na pasta **Blog Pessoal - Render**.

7. Altere o caminho atual: **http://localhost:8080/usuarios/cadastrar** 

<div align="center"><img src="https://i.imgur.com/0zGznXO.png" title="source: imgur.com" /></div>

8. Para o endereço do Render: https://meuprojeto.render.com/usuarios/cadastrar (No exemplo acima: https://blogpessoal.onrender.com/usuarios/cadastrar)

<div align="center"><img src="https://i.imgur.com/HmopPqF.png" title="source: imgur.com" /></div>

9. Após efetuar as alterações, crie o usuário **root@root.com** com os dados da imagem abaixo:

<div align="center"><img src="https://i.imgur.com/3GD5gh1.png" title="source: imgur.com" /></div>

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <p align="justify"> **ALERTA DE BSM:** *Mantenha a atenção aos detalhes. Crie o usuário root exatamente como mostra a figura acima. Será através deste usuário que os Instrutores da sua turma irão corrigir o seu projeto*. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

10. Volte para o Navegador da Internet e efetue o login com o usuário **root@root.com**.

<div align="center"><img src="https://i.imgur.com/A3NXaGE.png" title="source: imgur.com" /></div>

11. A Documentação no Swagger será exibida como a página inicial.

<div align="center"><img src="https://i.imgur.com/SJHPYNu.png" title="source: imgur.com" width="90%"/></div>

12. Outra forma de abrir a aplicação é digitando o endereço: **https://nomedoprojeto.onrender.com** no navegador. (No exemplo acima: https://blogpessoal.onrender.com)

<br />

<h2>👣 Passo 12 - Testar o Deploy no Insomnia</h2>

1. Volte para o **Insomnia** 

2. Atualize o endereço de todas requisições da pasta **Blog Pessoal - Render**, assim como foi feito na requisição **Cadastrar Usuário**

3. Execute a requisição **Login** para acessar a API

4. Teste todas requisições seguindo as orientações do **Checklist do Projeto Blog Pessoal**.

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="200px"/> | <p align="justify"> **ALERTA DE BSM:** *Mantenha a atenção aos detalhes e a persistência. Insira dados na API através do Insomnia em todos os recursos (Postagem, Tema e Usuario). No recurso Postagem, não esqueça de testar o Relacionamento entre as Classes*. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2 id="update">3. Como atualizar o Deploy no Render? </h2>

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <p align="justify"> **ALERTA DE BSM:** *Mantenha a atenção aos detalhes. Este item você utilizará apenas se você precisar alterar alguma coisa no seu projeto Spring e atualizar  a aplicação na nuvem*. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

1. Para fazer alterações no código do projeto e executar localmente, volte para o **STS** e altere a primeira linha do arquivo, **application.properties** conforme o código abaixo:

```properties
spring.profiles.active=dev
```

2. Faça as alterações necessárias no código do seu projeto, execute localmente e verifique se está tudo funcionando **sem erros**.

3. Antes de refazer o Deploy, altere novamente a primeira linha do arquivo, **application.properties** conforme o código abaixo:

```properties
spring.profiles.active=prod
```

4.  Envie as atualizações do seu projeto para o repositório do  Github, através do **Git Bash**, utilizando os comandos abaixo: 

```bash
git add .
git commit -m “Atualização do Deploy - Blog Pessoal”
git push origin main
```

5. Ao finalizar o **git push**, o Render começará a refazer o Deploy. Acompanhe o processo pelo **Dashboard do Render**. 

<div align="center"><img src="https://i.imgur.com/Fj5OmPo.png" title="source: imgur.com" /></div>

6. Verifique se a Aplicação abre no Navegador e faça os testes no Insomnia.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
