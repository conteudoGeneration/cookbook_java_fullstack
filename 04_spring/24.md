<h1>Documentação com o SpringDoc</h1>

Uma API bem construída deve ser simples de ser consumida, por isso é fundamental documentar a API da  maneira correta. O objetivo da Documentação é apresentar uma espécie de "manual de instruções" que permita que qualquer pessoa (Desenvolvedora ou não), que ainda não tenha pleno conhecimento do domínio da sua aplicação, **consuma a API de maneira fácil, rápida, eficaz e autônoma**. 

<h2>1. OpenApi</h2>

A **OpenApi**, trata-se de uma especificação Open Source, que auxilia as pessoas desenvolvedoras nos processos de **definir, criar, documentar e consumir** API's REST e RESTful. A OpenApi tem por objetivo padronizar este tipo de integração, descrevendo os recursos que uma API possui, os respectivos endpoints, os dados que serão solicitados nas Requisições, os dados que serão retornados nas Respostas, os Status HTTP, os modelos de dados, os Métodos de autenticação, entre outros.

APIs REST são frequentemente usadas para a integração de aplicações, seja para consumir serviços de terceiros, seja para prover novos serviços. Para estas APIs, a especificação OpenApi facilita a modelagem, a documentação e a geração de código.

<br />

<div align="left"><img src="https://i.imgur.com/EWMO1wL.png" title="source: imgur.com" width="25px"/> <a href="https://www.openapis.org/" target="_blank"><b>Site Oficial: <i>OpenApi</i></b></a>

<br />

<div align="left"><img src="https://i.imgur.com/EWMO1wL.png" title="source: imgur.com" width="25px"/> <a href="https://spec.openapis.org/oas/latest.html#introduction" target="_blank"><b>Documentação: <i>Especificação OpenApi</i></b></a></div>

<br />


<h2>2. Swagger</h2>

O Swagger é uma poderosa ferramenta que ajuda pessoas Desenvolvedoras a **projetar, desenvolver, documentar e consumir serviços** web REST e RESTful, de forma interativa e dinâmica, aproveitando ao máximo todos os Recursos da especificação OpenApi.
Apesar de ser conhecida principalmente por sua interface **Swagger UI**, o software inclui suporte para documentação automatizada da API, geração de código e testes.

<br />

<div align="left"><img src="https://i.imgur.com/IJNY0uR.png" title="source: imgur.com" width="25px"/> <a href="https://swagger.io/" target="_blank"><b>Site Oficial: Swagger</b></a></div>

<br />


<h3>2.1. Swagger-UI</h3>

<div align="center"><img src="https://i.imgur.com/vKKoa2c.png" title="source: imgur.com" width="90%"/></div>

<br />

<div align="left"><img src="https://i.imgur.com/IJNY0uR.png" title="source: imgur.com" width="25px"/> <a href="https://swagger.io/tools/swagger-ui/" target="_blank"><b>Site Oficial: Swagger-UI</b></a></div>

<br />


<h3>2.2. Swagger Editor</h3>

O Editor Swagger é um editor de código aberto para projetar, definir e documentar APIs RESTful na Especificação Swagger. 

<div align="center"><img src="https://i.imgur.com/ADiczZM.png?1" title="source: imgur.com" width="90%"/></div>

<br />

<div align="left"><img src="https://i.imgur.com/IJNY0uR.png" title="source: imgur.com" width="25px"/> <a href="https://editor.swagger.io/" target="_blank"><b>Site Oficial: Swagger-Editor</b></a></div>

<br />

<h2>3. SpringDoc</h2>

A biblioteca Java **Springdoc-OpenApi** é uma implementação da OpenApi + Swagger, que ajuda a automatizar a geração de documentação API em projetos SpringBoot. A Springdoc-OpenApi examina um aplicativo em tempo de execução para Criar a Documentação da API, com base nas configurações do Spring, na estrutura das Classes e algumas Anotações.  A documentação é gerada automaticamente no formato JSON / YAML e HTML. Esta documentação pode ser completada por comentários usando Anotações do Swagger. 

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | **ATENÇÃO:** *Para utilizar o Springdoc com o Spring Boot 3.0 ou superior, obrigatoriamente devemos utilizar a versão 2.0 ou superior do Springdoc.* |
| ------------------------------------------------------------ | :----------------------------------------------------------- |

<br />

> **YAML** é um formato de serialização (codificação de dados) de dados legíveis por humanos inspirado no XML, sendo amplamente utilizada em arquivos de configuração, assim como o XML e o JSON. YAML é um acrónimo recursivo que significa "YAML Ain't Markup Language" (em português, "YAML não é linguagem de marcação"). 

<br />

<div align="left"><img src="https://i.imgur.com/VKWcUsU.png" title="source: imgur.com" width="3%"/> <a href="https://yaml.org" target="_blank"><b>Site Oficial: <i>YAML</i></b></a></div>

<br />

<div align="left"><img src="https://i.imgur.com/EWMO1wL.png" title="source: imgur.com" width="25px"/> <a href="https://springdoc.org/v2/" target="_blank"><b>Site Oficial: <i>SpringDoc - Versão 2 - Spring 3</i></b></a></div>

<br />

Vamos criar a Documentação do nosso Projeto Blog Pessoal no formato Digital através da Biblioteca **SpringDoc** e no formato Impresso através do **Swagger Editor**.

<br />

<h2>👣 Passo 01- Adicionar a Dependência do Spring Doc</h2>

Abra o arquivo pom.xml e insira a dependência do SpringDoc:

```xml
	<!-- Dependência para Geração do Swagger -->
	<dependency>
		<groupId>org.springdoc</groupId>
		<artifactId>springdoc-openapi-starter-webmvc-ui</artifactId>
		<version>2.2.0</version>
	 </dependency>
```

<br />

<div align="left"><img src="https://i.imgur.com/EWMO1wL.png" title="source: imgur.com" width="25px"/> <a href="https://springdoc.org" target="_blank"><b>Documentação: Dependência do SpringDoc</b></a></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | **ATENÇÃO:** *Quando este material foi escrito, a versão atual do Springdoc era a 2.2.0, logo a versão atual pode ser outra.* |
| ------------------------------------------------------------ | :----------------------------------------------------------- |

<br />

<h2>👣 Passo 02- Configurar o arquivo application.properties</h2>

Insira as linhas abaixo no arquivo **application.properties**, da **Source Folder Principal** (src/main/resources), logo abaixo da configuração do Banco de dados MySQL:

<div align="left"><img src="https://i.imgur.com/9xj08EW.png" title="source: imgur.com" /></div>

**Linha 16:** Define o Caminho para a Documentação do OpenAPI no formato JSON.
	
**Linha 17:** Define o Caminho para a Documentação do Swagger-ui no formato HTML.
	
**Linha 18:** Define a ordem em que os Recursos serão exibidos no Swagger-ui. Em nosso projeto, os Recursos serão ordenados por Método.
	
**Linha 19:** Desabilita a URL padrão do Swagger-ui (Exemplo no site do Swagger).

**Linha 20:** Define o nome da Package da Camada Controladora (Controller).

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Atenção aos Detalhes ao criar a configuração do Springdoc no arquivo application.properties. Informar o caminho (path) incorreto da Camada Controller fará com que o Swagger não funcione e seja exibida a mensagem de erro *No operations defined in spec!*, como mostra a imagem abaixo:* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<div align="center"><img src="https://i.imgur.com/jWy13Pq.png" title="source: imgur.com" /></div>

<br />

**Linha 21:** Define o Swagger-ui como a página inicial da aplicação.

<br />

<div align="left"><img src="https://i.imgur.com/EWMO1wL.png" title="source: imgur.com" width="30px"/> <a href="https://springdoc.org/#properties" target="_blank"><b>Documentação: application.properties - configurações do Spring Doc</b></a></div>

<br />

<h3>Código para adicionar no arquivo application.properties em src/main/resources</h3>

```properties
springdoc.api-docs.path=/v3/api-docs
springdoc.swagger-ui.path=/swagger-ui.html
springdoc.swagger-ui.operationsSorter=method
springdoc.swagger-ui.disable-swagger-default-url=true
springdoc.packagesToScan=com.generation.blogpessoal.controller
springdoc.swagger-ui.use-root-path=true
```

<br />

| <img src="https://i.imgur.com/oScAYGc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** *Não insira comentários no arquivo application.properties. Geralmente, durante o Deploy na nuvem, comentários inseridos no arquivo application.properties podem causar erros de compilação no projeto.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>👣 Passo 03 - Criar a Camada configuration e a Classe SwaggerConfig</h2>

A Camada **Configuration** é responsável por  implementar configurações específicas da aplicação. Em nosso Projeto, vamos utilizar esta Camada para implementar a Documentação da API com o Swagger

1. No lado esquerdo superior, na Guia **Package explorer**, clique com o botão direito do mouse sobre a Package **com.generation.blogpessoal**, na Source Folder **src/main/java** e clique na opção  **New 🡪 Package**.

2. Na janela **New Java Package**, no item **Name**, acrescente no final do nome da Package **.configuration**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/oaQPqgK.png" title="source: imgur.com" /></div>

3. Clique no botão **Finish** para concluir.

4.  Clique com o botão direito do mouse sobre o **Pacote Configuration** (**com.generation.blogpessoal.configuration**), na Source Folder Principal (**src/main/java**), e na sequência, clique na opção **New 🡪 Class**

5. Na janela **New Java Class**, no item **Name**, digite o nome da Classe (**SwaggerConfig**), como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/LKkwrTA.png" title="source: imgur.com" /></div>

6. Clique no botão **Finish** para concluir.

Vejamos abaixo a implementação da Classe **SwaggerConfig**:

<div align="left"><img src="https://i.imgur.com/mPrPQWZ.png" title="source: imgur.com" /></div>

**Linha 1:** Através do comando **package**, estamos informando o nome do pacote (camada), onde a Classe foi criada. Esta informação é inserida automaticamente pelo STS ao criar a Classe.

**Linhas 3 a 13:** Através do comando **import**, estamos indicando todos os pacotes que contém as Classes que estão sendo utilizadas na Classe **SwaggerConfig**.

<div align="center"><img src="https://i.imgur.com/bXihwEI.png" title="source: imgur.com" /></div>

Vamos analisar o código:

**Linha 15:**  A Anotação (Annotation) **@Configuration** indica que a Classe é do tipo configuração, ou seja, define uma Classe como fonte de definições de Beans. A anotação **@Configuration** é uma das anotações essenciais ao utilizar uma configuração baseada em Java.

**Linha 18:** A Anotação **@Bean** utilizada em Métodos de uma Classe, geralmente marcada com **@Configuration**, indica ao Spring que ele deve invocar aquele Método e gerenciar o objeto retornado por ele, ou seja, agora este objeto pode ser injetado em qualquer ponto da sua aplicação.

> **Bean:** No Spring, os objetos que formam a espinha dorsal da sua aplicação e que são gerenciados pelo Spring são chamados de **Beans**. Um Bean é um objeto que é instanciado, montado e gerenciado pelo Spring. 
>
> Existem diversas formas de se criar Beans no Spring. Você pode criar Classes anotadas com **@Configuration** ou **@Service** para serem gerenciadas pelo Spring, assim como pode usar a anotação **@Bean** em um Método, e transformar a instância retornada pelo Método em um Objeto gerenciado pelo Spring (seja de uma Classe própria ou de terceiros).
>
> Estas Classes, que na visão do Spring são os Beans, para você nada mais são do que Classes que você irá escrever as regras de funcionamento da sua aplicação, que poderão ser utilizadas em qualquer Classe, diferente da **Injeção de Dependência** criada pela anotação **@Autowired**, que só permite o uso dentro da Classe em que foi criada.


**Linha 20:** Cria um Objeto da Classe OpenAPI, que gera a documentação no Swagger utilizando a especificação OpenAPI.

**Linhas 21 a 24:** Insere as informações sobre a API (Nome do projeto (Title), Descrição e Versão)

**Linhas 25 a 27:** Insere as informações referentes a licença da API (Nome e Link)

**Linhas 28 a 31:** Insere as informações de contato da pessoa Desenvolvedora (Nome, Site e e E-mail)

| <img src="https://i.imgur.com/oScAYGc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** *As propriedades nome, site e e-mail permitem apenas um nome, um único endereço WEB e um único endereço de e-mail.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

**Linhas 32 a 24:** Insere as informações referentes a Documentações Externas (Github, Gitpage e etc), onde são informados o Nome e o Link. 

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Atenção aos Detalhes ao criar a Classe SwaggerConfig. As informações de Contato e Documentações Externas devem ser preenchidas com os seus dados (Nome, E-mail, Github e etc). No caso do Projeto Integrador, devem ser preenchidos com os dados do Grupo* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<div align="left"><img src="https://i.imgur.com/ZENGh6G.png" title="source: imgur.com" width="25px"/> <a href="https://opensource.guide/pt/legal/" target="_blank"><b>Artigo: O Lado Legal do Open Source</b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/context/annotation/Configuration.html" target="_blank"><b>Documentação: @Configuration</b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://www.baeldung.com/spring-bean" target="_blank"><b>Artigo: Spring Bean</b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/>  <a href="https://docs.oracle.com/javase/8/docs/api/java/beans/package-summary.html" target="_blank"><b>Documentação: Java Beans</b></a></div>

<div align="left"><img src="https://i.imgur.com/EWMO1wL.png" title="source: imgur.com" width="30px"/> <a href="https://spec.openapis.org/oas/latest.html#openapi-specification" target="_blank"><b>Documentação: OpenApi()</b></a></div>

<br />


<div align="left"><img src="https://i.imgur.com/Bxw4UpC.png" title="source: imgur.com" /></div>

A Classe **OpenApiCustomiser** permite personalizar o Swagger, baseado na Especificação OpenAPI. O Método acima, personaliza todas as mensagens HTTP Responses (Respostas das requisições) do Swagger.

**Linha 40:** Cria um Objeto da Classe OpenAPI, que gera a documentação no Swagger utilizando a especificação OpenAPI.

**Linha 41:** Cria um primeiro looping que fará a leitura de todos os recursos (Paths) através do Método getPaths(), que retorna o caminho de cada endpoint. Na sequência, cria um segundo looping que Identificará qual Método HTTP (Operations), está sendo executado em cada endpoint através do Método readOperations(). Para cada Método, todas as mensagens serão lidas e substituídas pelas novas mensagens.

**Linha 44:** Cria um Objeto da **Classe ApiResponses**, que receberá as Respostas HTTP de cada endpoint (Paths) através do Método **getResponses()**.

**Linhas 46 a 53:** Adiciona as novas Respostas no endpoint, substituindo as atuais e acrescentando as demais, através do Método **addApiResponse()**, identificadas pelo HTTP Status Code (200, 201 e etc).

<div align="left"><img src="https://i.imgur.com/W6n0l0G.png" title="source: imgur.com" /></div>

**Linhas 59 a 63:** O Método **createApiResponse()** adiciona uma descrição (Mensagem), em cada Resposta HTTP.

<br />

<div align="left"><img src="https://i.imgur.com/IJNY0uR.png" title="source: imgur.com" width="25px"/> <a href="https://swagger.io/docs/specification/describing-parameters/" target="_blank"><b>Documentação: Paths and Operations</b></a></div>

<div align="left"><img src="https://i.imgur.com/IJNY0uR.png" title="source: imgur.com" width="25px"/> <a href="https://javadoc.io/static/io.swagger.core.v3/swagger-models/2.1.6/io/swagger/v3/oas/models/responses/ApiResponses.html" target="_blank"><b>Documentação: ApiResponses</b></a></div>

<div align="left"><img src="https://i.imgur.com/IJNY0uR.png" title="source: imgur.com" width="25px"/> <a href="https://javadoc.io/static/io.swagger.core.v3/swagger-models/2.1.6/io/swagger/v3/oas/models/Operation.html" target="_blank"><b>Documentação: Operation</b></a></div>

<div align="left"><img src="https://i.imgur.com/IJNY0uR.png" title="source: imgur.com" width="25px"/> <a href="https://javadoc.io/static/io.swagger.core.v3/swagger-models/2.1.6/io/swagger/v3/oas/models/PathItem.html" target="_blank"><b>Documentação: PathItem</b></a></div>

<br />

<h2>👣 Passo 04 - Alteração na Classe Usuario</h2>

Vamos configurar o Atributo **usuario**, da **Classe Usuario**, para emitir um lembrete no Swagger de que deve ser digitado um e-mail no valor do Atributo. Para isso, utilizaremos a anotação **@Schema**.

A anotação **@Schema** nos permite controlar as definições específicas do Swagger, como descrição (valor), nome, tipo de dados, valores de exemplo e valores permitidos para as propriedades do modelo. No Atributo usuario, vamos utilizar a propriedade **example**.

Na Classe **Usuario**, localizada na **Camada Model**, acrescente no Atributo **usuario** a anotação abaixo:

```java
@Schema(example = "email@email.com.br")
```

Após acrescentar a anotação acima, o Atributo usuario terá a seguinte configuração:

```java
@Schema(example = "email@email.com.br")
@NotNull(message = "O Atributo Usuário é Obrigatório!")
@Email(message = "O Atributo Usuário deve ser um email válido!")
private String usuario;
```

Observe na imagem abaixo que o Swagger indicará que o Atributo usuario deve ser um endereço de e-mail. Ao testar o Swagger, verifique se esta indicação foi adicionada no Atributo usuario.

<div align="center"><img src="https://i.imgur.com/itXOlCC.png" title="source: imgur.com" /></div>

Para efetuar essa alteração na Classe **Usuario** vamos importar um novo pacote, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/ulni8SN.png" title="source: imgur.com" /></div>

<br />

<div align="left"><img src="https://i.imgur.com/IJNY0uR.png" title="source: imgur.com" width="25px"/> <a href="https://javadoc.io/static/io.swagger.core.v3/swagger-models/2.1.6/io/swagger/v3/oas/models/media/Schema.html#example" target="_blank"><b>Documentação: @Schema</b></a>
<br />


<h2>👣 Passo 05 - Executar o Swagger</h2>

Para abrir o Swagger, precisamos de um usuário para efetuar login na nossa aplicação. Vamos criar o usuário **root@root.com** para testarmos a nossa API.

1. Abra o Insomnia e crie o usuário **root** com os dados da imagem abaixo:

<div align="center"><img src="https://i.imgur.com/JuM7AuO.png" title="source: imgur.com" /></div>

2. Abra o seu navegador da Internet e digite o endereço <a href="http://localhost:8080" ><b>http://localhost:8080</b></a> para abrir a sua documentação.

3. Faça o login na aplicação com a conta de usuário usuário **root@root.com**, que foi criada anteriormente.

<div align="center"><img src="https://i.imgur.com/GF53F91.png" title="source: imgur.com" width="50%"/></div>

3. A Documentação no Swagger será exibida.

<div align="center"><img src="https://i.imgur.com/vKKoa2c.png" title="source: imgur.com" /></div>

<br />

<h2>👣 Passo 06 - Gerar o PDF da Documentação</h2>

1) No Swagger, clique no link: <a href="http://localhost:8080/v3/api-docs" />http://localhost:8080/v3/api-docs</a> para visualizar a documentação no formato JSON.

<div align="center"><img src="https://i.imgur.com/rLwFhh1.png" title="source: imgur.com" width="70%"/></div>

2) Visualize o código no formato Raw Data ou Dados brutos (No Chrome e no Edge é o formato padrão), Selecione todo o código (**Ctrl + A**) e Copie (**Ctrl + C**).

<div align="center"><img src="https://i.imgur.com/xsyPpZX.png?1" title="source: imgur.com" /></div>

3) Acesse o site **Swagger Editor** (<a heref="https://editor.swagger.io/" />https://editor.swagger.io/).

<div align="center"><img src="https://i.imgur.com/5eX7guE.png" title="source: imgur.com" /></div>

4) No <b>Swagger Editor</b>, apague o código exemplo e cole o código copiado da Documentação dentro do Editor (**Ctrl + V**).

<div align="center"><img width="850px"  src="https://i.imgur.com/zWPHCk3.png" title="source: imgur.com" /></div>

5) O Swagger Editor perguntará se você deseja converter o código JSON em YAML. Clique em OK para converter.

<div align="center"><img src="https://i.imgur.com/M6aO4li.png" title="source: imgur.com" width="40%"/></div>

6) No menu **Generate Client**, selecione a opção **html2**.

<div align="center"><img  src="https://i.imgur.com/qqkNADn.png" title="source: imgur.com" width="75%"/></div>

7) O <b>Swagger Editor</b> solicitará o download do arquivo <b>html2-client-generated.zip</b>. Faça o download do arquivo, descompacte no seu computador e abra o arquivo <b>index.html</b>.

<div align="center"><img src="https://i.imgur.com/gwLVSIU.png" title="source: imgur.com" /></div>

8) No seu navegador, no menu principal, clique em <b>Imprimir</b>. 

<div align="center"><img src="https://i.imgur.com/ZpbseBW.png" title="source: imgur.com" /></div>

9) Na janela de impressão, no item <b>Destino</b>, selecione a opção <b>Salvar em PDF</b> e clique no Botão <b>Salvar</b>.

<div align="center"><img width="900px" src="https://i.imgur.com/MEZFms0.png" title="source: imgur.com" /></div>

10) Documentação em PDF gerada!

<div align="center"><img width="900px" src="https://i.imgur.com/LDg1tjy.png" title="source: imgur.com" /></div>

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="30px"/> <a href="https://github.com/rafaelq80/backend_blogpessoal_v3/tree/17_Swagger" target="_blank"><b>Código fonte do Projeto</b></a>


<br /><br />
	
<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
