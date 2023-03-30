<h1>Projeto 02 - Blog Pessoal - Classe PostagemController - Método Consultar todas as Postagens</h1>

O que veremos por aqui:

1. Criar a Classe PostagemController
2. Criar o Método getAll() para listar todas as Postagens

<h2>1. O Recurso Postagem</h2>

Nas 2 etapas anteriores, começamos a construir o **Recurso Postagem**, a partir da **Classe Model Postagem**, onde implementamos todos os Atributos do recurso e geramos a tabela **tb_postagens** dentro do nosso Banco de dados **db_blogpessoal**. Na sequência, implementamos a **Interface PostagemRepository**, que possui todos os Métodos necessários para Interagirmos com o Banco de dados. Agora vamos começar a criar os 6 Métodos da Classe Postagem, listados no Diagrama de Classes abaixo, na Classe **PostagemController**.

<div align="center"><img src="https://i.imgur.com/aKmFiA1.png" title="source: imgur.com" width="50%"/></div>

A Classe **PostagemController** será a Classe Controladora do Recurso Postagem, ou seja, ela irá responder toda e qualquer Requisição (HTTP Request), que for enviada de fora da aplicação para o Recurso Postagem. Dentro desta Classe iremos implementar os Métodos do **CRUD (Create, Read, Update e Delete)**, que fazem parte da **Interface JpaRepository** e os Métodos Personalizados (Consultas), que serão assinados dentro da **Interface PostagemRepository**. 

<br />

<h2>👣 Passo 01 - Criar o Pacote Controller</h2>

Na Source Folder Principal (**src/main/java**), observe que já foi criado o pacote Principal da nossa aplicação (**com.generation.blogpessoal**), o pacote Model (**com.generation.blogpessoal.model**) e o pacote Repository (**com.generation.blogpessoal.repository**). Na figura abaixo, podemos visualizar os 3  pacotes:

<div align="center"><img src="https://i.imgur.com/JA9aCIb.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Atenção aos Detalhes ao criar a Camada Controller. Um erro muito comum é criar o pacote na Source Folder de Testes, ao invés de criar na Source Folder Principal.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Nesta etapa, vamos criar a **Camada Controller**:

1. No lado esquerdo superior, na Guia **Package explorer**, clique com o botão direito do mouse sobre a Package **com.generation.blogpessoal**, na Source Folder **src/main/java** e clique na opção  **New 🡪 Package**.

<div align="center"><img src="https://i.imgur.com/HIaPDWx.png" title="source: imgur.com" /></div>

2. Na janela **New Java Package**, no item **Name**, acrescente no final do nome da Package **.controller**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/CTK3grb.png" title="source: imgur.com" width="50%"/></div>

3. Clique no botão **Finish** para concluir.

Quando você terminar de criar a **Camada Controller**, a sua estrutura de pacotes ficará igual a figura abaixo:

<div align="center"><img src="https://i.imgur.com/L7A5q2E.png" title="source: imgur.com" /></div>

<br />

<h2>👣 Passo 02 - Criar a Classe PostagemController na Camada Controller</h2>

Agora, vamos criar a Classe Controladora, que chamaremos de **PostagemController**.

1. Clique com o botão direito do mouse sobre o pacote controller da aplicação ( **com.generation.blogpessoal.controller**).
2. Na sequência, clique na opção **New 🡪 Class**

<div align="center"><img src="https://i.imgur.com/4x4YnFk.png" title="source: imgur.com" /></div>

3. Na janela **New Java Class**, no item **Name**, digite o nome da Classe (**PostagemController**), como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/X30mRar.png" title="source: imgur.com" /></div>

4. Clique no botão **Finish** para concluir.

Agora vamos começar a criar o código da Classe Controladora **PostagemController**:

<div align="left"><img src="https://i.imgur.com/yPIt8cL.png" title="source: imgur.com" /></div>

Nesta primeira parte vamos criar a base da Classe Controladora:

**Linha 1:** Através do comando **package**, estamos informando o nome do pacote (camada), onde a Classe foi criada. Esta informação é inserida automaticamente pelo STS ao criar a Classe.

**Linhas 3 a 13:** Através do comando **import**, estamos indicando todos os pacotes que contém as Classes que estão sendo utilizadas na Classe PostagemController.

**Linha 15:** A anotação **@RestController** deﬁne que a Classe é do tipo **RestController**, que receberá requisições que serão compostas por:

- **URL:** Endereço da requisição (**endpoint**)
- **Verbo:** Define qual Método HTTP será acionado na Classe controladora.
- **Corpo da requisição (Request Body):** Objeto que contém os dados que serão persistidos no Banco de dadas. Nem toda a requisição enviará dados no Corpo da Requisição.

Após receber e processar a requisição, a Classe Controladora Responderá a todas as requisições com:

- Um **Código de Status HTTP** pertinente a operação que está sendo realizada.
- O resultado do processamento (Objetos de uma Classe, por exemplo) inseridos diretamente no corpo da resposta (**Response Body**)

**Linha 16:** a anotação **@RequestMapping** é usada para mapear as solicitações para os Métodos da Classe controladora **PostagemController**, ou seja, define a **URL** (endereço) padrão do Recurso (**/postagens**). Ao digitar a url do servidor seguida da url do Recurso (**http://localhost:8080/postagens**), o Spring envia a requisição para a Classe responsável pelo Recurso associado à este endereço. 

**Linha 17:** a anotação **@CrossOrigin** indica que a Classe controladora permitirá o recebimento de requisições realizadas de fora do domínio (localhost e futuramente da nuvem quando o Deploy da aplicação for efetivado) ao qual ela pertence. Essa anotação é essencial para que o front-end ou aplicativo mobile, tenha acesso aos Métodos e Recursos da nossa aplicação (O termo técnico é consumir a API). 

Além de liberar todas as **Origens das requisições** (parâmetro **origins**), a anotação libera também os **Cabeçalhos das Requisições** (parâmetro **allowedHeaders**), que em alguns casos trazem informações essenciais para o correto funcionamento da aplicação. Um bom exemplo é o **Token de Autorização - Authorization Token**, que veremos mais à frente, que tem a função de liberar o acesso à um endpoint específico. Em produção, recomenda-se substituir o ***** (asterisco) pelo endereço na nuvem do front-end ou da aplicação mobile.

**Linhas 20 e 21** a anotação **@Autowired** (Injeção de Dependência), é a  implementação  utilizada pelo  Spring  Framework  para  aplicar  a  **Inversão  de  Controle (IoC)**  quando  for necessário. A **Injeção de Dependência** define quais Classes serão instanciadas e em quais lugares serão Injetadas quando houver necessidade.

> **Inversão de Controle ou Inversion of Control** - conhecido pela Sigla **IoC** é um Pattern (padrão de código), que prega para usarmos o controle das instancias de uma determinada classe, devem ser tratadas externamente e não dentro da classe em  questão, ou seja, Inverter o controle de uma classe delegando esta tarefa para uma outra classe, interface, componente, serviço, entre outros.
>
> **Injeção de Dependência ou Dependency Injection ou D.I** é um tipo de Inversão de Controle, que propõe a inserção (injeção) de uma Classe dentro da outra, invertendo o seu controle. Com esta abordagem diminuímos o acoplamento entre as nossas Classes, facilitamos a manutenção, além de ser uma solução elegante.

Em nosso exemplo, a Classe Controladora cria um ponto de injeção da **Interface PostagemRepository** na Classe PostagemController. De acordo com o tipo de Requisição (Método HTTP) , que a Classe **PostagemController** receber, o Spring responderá de uma forma específica: 

- Quando a Classe PostagemController receber uma nova Requisição do tipo **GET**, ele executará uma **Query Method** (Método de Consulta) específica e caso a Consulta encontre os Objetos no Banco de dados, o Spring cria um novo **Objeto ou uma Coleção de Objetos (Collection List) da Classe Postagem** contendo o resultado da consulta e insere no Corpo da Resposta HTTP no formato JSON. Caso nada seja encontrado, ele retornará Null ou a Coleção vazia.

- Quando a Classe PostagemController receber uma nova Requisição do tipo **POST** ou **PUT** ele cria um novo **Objeto da Classe Postagem** através do JSON enviado no Corpo da Requisição, que contém os dados do Objeto e persiste o Objeto através do **Método save()**. 

- Quando a Classe PostagemController receber uma nova Requisição do tipo **DELETE**, ele executará o **Método delete()** e não retornará nada, por se tratar de um Método void.


Observe que o Objeto da Interface PostagemRepository, injetado na Classe PostagemController, permite o uso de todos os Métodos da Interface PostagemRepository (Métodos Padrão ou Personalizados), sem a necessidade de criar Métodos Construtores na Classe Model ou efetuar o processo manual de Criar e Instanciar Objetos (igual você fez em Java no Bloco I). A Injeção de Dependência nos permite transferir a responsabilidade da tarefa de criar e instanciar Objetos da Classe Postagem para o Spring e desta forma, nós pessoas desenvolvedoras, iremos focar apenas no processamento das Requisições HTTP.

<br />

<div align="left"><img src="https://i.imgur.com/cDPH4tl.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Methods" target="_blank"><b>Documentação: HTTP Request Methods</b></a></div>

<div align="left"><img src="https://i.imgur.com/cDPH4tl.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Status" target="_blank"><b>Documentação: HTTP Status Code</b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/5.0.13.RELEASE/spring-framework-reference/web.html#mvc-ann-controller" target="_blank"><b>Documentação: <i>@RestController</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/5.0.13.RELEASE/spring-framework-reference/web.html#mvc-ann-requestmapping" target="_blank"><b>Documentação: <i>@RequestMapping</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/bind/annotation/CrossOrigin.html" target="_blank"><b>Documentação: <i>@CrossOrigin</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/beans/factory/annotation/Autowired.html" target="_blank"><b>Documentação: <i>@Autowired</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://blog.algaworks.com/injecao-de-dependencias-com-spring/" target="_blank"><b>Artigo: <i>Injeção de Dependência</i></b></a></div>

<br />

<h2>👣 Passo 03 - Criar o Método getAll()</h2>

Vamos implementar o Método **getAll()** na Classe Postagem Controller, que retornará todos os Objetos da Classe Postagem persistidos no Banco de dados. Traçando um paralelo com o MySQL, seria o equivalente a instrução: <code>SELECT * FROM tb_postagens;</code>.

<div align="left"><img src="https://i.imgur.com/hxP9UMQ.png" title="source: imgur.com" /></div>

**Linha 23:** a anotação **@GetMapping** mapeia todas as Requisições **HTTP GET**, enviadas para um endereço específico, chamado **endpoint**, dentro do Recurso Postagem, para um Método específico que responderá a requisição, ou seja, ele indica que o Método getAll(), responderá a todas as requisições do tipo **HTTP GET**, enviadas no endereço **http://localhost:8080/postagens/**.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ATENÇÃO:** *O Endereço do endpoint será igual ao Endereço do Recurso (@RequestMapping) apenas quando a anotação @GetMapping não possuir um endereço personalizado, como um parâmetro por exemplo. Caso existam dois ou mais Métodos do tipo GET será necessário personalizar o endereço de cada Método anotado com @GetMapping, pois não pode existir endereços duplicados.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

**Linha 24:** O Método **getAll()** será do tipo **ResponseEntity** porquê ele responderá a **Requisição HTTP** (HTTP Request), com uma  **Resposta HTTP** (HTTP Response). 

✔<img src="https://i.imgur.com/I0U4xHJ.png?1" title="source: imgur.com" height="20px"/>: O Método além de retornar um objeto da **Classe ResponseEntity** (**OK 🡪200**), no parâmetro body (Corpo da Resposta), será retornado um Objeto da Classe **List (Collection)**, contendo todos os Objetos da Classe **Postagem** persistidos no Banco de dados, na tabela **tb_postagens**. Observe que nesta linha foi utilizado um recurso chamado **Java Generics**, que além de simplificar o retorno do Objeto da Classe **List**, dispensa o uso do **casting** (mudança de tipos). Observe que na definição do Método foram utilizados **os símbolos <T>**, onde **T** é o **Tipo do Objeto** que será retornado no **Corpo da Resposta**.

**Linha 25:** **return ResponseEntity.ok(postagemRepository.findAll());** Executa o Método **findAll()** (**Método padrão da Interface JpaRepository**), que retornará **todos os Objetos da Classe Postagem** persistidos no Banco de dados (<img src="https://i.imgur.com/I0U4xHJ.png?1" title="source: imgur.com" height="20px"/>). Como a List sempre será gerada (vazia ou não), o Método sempre retornará o **Status 200 🡪 OK**.

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**)

<br />

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/bind/annotation/GetMapping.html" target="_blank"><b>Documentação: <i>@GetMapping</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/ResponseEntity.html#ok-T-" target="_blank"><b>Documentação: <i>ResponseEntity</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/HttpStatus.html" target="_blank"><b>Documentação: <i>HttpStatus</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/repository/CrudRepository.html#findAll--" target="_blank"><b>Documentação: <i>.findAll()</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="3%"/> <a href="https://docs.oracle.com/javase/tutorial/collections/interfaces/list.html" target="_blank"><b>Documentação: <i>Collection List</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="3%"/> <a href="https://docs.oracle.com/javase/tutorial/java/generics/types.html" target="_blank"><b>Documentação: <i>Java Generics</i></b></a></div>

<br />

<h2>👣 Passo 04 - Executar o projeto</h2>

1. No **Spring Boot Dashboard**, como mostra a imagem abaixo, Selecione o Projeto que você deseja executar:

<div align="center"><img src="https://i.imgur.com/7DPZUc8.png" title="source: imgur.com" /></div>

2. Clique no botão <img src="https://i.imgur.com/AHCJCHf.png" title="source: imgur.com" width="4%"/> **Start** para **executar** o Projeto.
3. Observe que será aberta a janela Console com o log da execução do código. Caso esteja tudo certo, o Console exibirá no final do processamento a mensagem indicando que a **aplicação está em execução** (indicada em vermelho na imagem).

<div align="center"><img src="https://i.imgur.com/QHrIYpb.png" title="source: imgur.com" /></div>

<br />

<h2>👣 Passo 05 - Inserir dados no Banco de dados</h2>

Como ainda não criamos um Método para Cadastrar Postagens (criaremos em breve), vamos inserir dois registros diretamente no Banco de Dados **db_blogpessoal**  na Tabela **tb_postagens** para testarmos o nosso Método **findAll()**.

1. Abra o <b>MySQL Workbench</b>.

2. No <b>MySQL Workbench</b>, Clique sobre a **Conexão Local instance MySQL80**

3. Será aberta a janela principal do <b>MySQL Workbench</b>. 

4. Na Barra de Ferramentas Principal Crie um novo arquivo SQL **(Query)**, clicando no ícone <img src="https://i.imgur.com/E1JV5po.png" title="source: imgur.com" width="3%"/>:

5. Insira os comandos abaixo no arquivo:

```sql
USE db_blogpessoal;

INSERT INTO tb_postagens (data, texto, titulo) 
VALUES (current_timestamp(), 'Texto da postagem 01', 'Postagem 01');
INSERT INTO tb_postagens (data, texto, titulo) 
VALUES (current_timestamp(), 'Texto da postagem 02', 'Postagem 02');

SELECT * FROM tb_postagens;
```

6. Clique no primeiro raio <img src="https://i.imgur.com/xH6Ei9O.png" title="source: imgur.com" /> para executar a Consulta e inserir os dados no Banco de dados **db_blogpessoal**.

<div align="center"><img src="https://i.imgur.com/6yEc6tE.png" title="source: imgur.com" /></div>

7. A imagem acima mostra que os dados foram inseridos com sucesso!

<br />

<h2>👣 Passo 06 - Testar no Insomnia</h2>

Para testar a aplicação, utilizaremos o aplicativo **Insomnia**. 

<div align="left"><img src="https://i.imgur.com/g1HCNZy.png" title="source: imgur.com" width="30px" /><a href="https://insomnia.rest/" target="_blank"><b>Site Oficial do Insomnia</b></a></div>

Vamos criar no Insomnia uma nova **Collection**, chamada **Blog Pessoal**, para guardar todas as nossas Requisições do Projeto Blog Pessoal. Na sequência vamos criar dentro da Collection Blog Pessoal uma pasta chamada **Postagem** para guardar todas as requisições do Recurso Postagem. Para concluir, vamos criar uma requisição do tipo **GET**, dentro da pasta Postagem, para testar o nosso Método **getAll()**.

<h3>6.1. Criando a Collection Blog Pessoal</h3>

1. Na janela principal do Insomnia, clique no botão **Create** e clique na opção **Request Collection**.

<div align="center"><img src="https://i.imgur.com/NhdF4d0.png" title="source: imgur.com" /></div>

2. Na janela que será aberta, informe o nome da Collection (**Blog Pessoal**) e clique no botão **Create** para concluir. 

<div align="center"><img src="https://i.imgur.com/eYp2qUL.png" title="source: imgur.com" width="80%"/></div>

<h3>6.2. Criando a  Pasta Postagem</h3>

Vamos criar dentro da **Collection Blog Pessoal** a **Pasta Postagem**, que guardará todas as requisições do **Recurso Postagem**.

1. Na **Collection Blog Pessoal**, clique no botão <img src="https://i.imgur.com/3Ou2SAZ.png" title="source: imgur.com" width="6%"/>. No menu que será aberto, clique na opção **New Folder**.

<div align="center"><img src="https://i.imgur.com/gIGZFHc.png" title="source: imgur.com" /></div>

2. Na janela que será aberta, informe o nome da pasta (**Postagem**) e clique no botão **Create** para concluir. 

<div align="center"><img src="https://i.imgur.com/2rUhRGT.png" title="source: imgur.com" width="80%"/></div>

<h3>6.3. Criando a  Requisição - Consultar todas as postagens</h3>

Agora vamos criar a Requisição para o **Método getAll()**:

1. Clique com o botão direito do mouse sobre a **Pasta Postagem** para abrir o menu e clique na opção **New HTTP Request**.

<div align="center"><img src="https://i.imgur.com/KvRI8b2.png" title="source: imgur.com" /></div>

2. Será criada uma nova Requisição (New Request) dentro da pasta **Postagem**.

<div align="center"><img src="https://i.imgur.com/ZIi9kJp.png" title="source: imgur.com" /></div>

3. Dê um duplo clique sobre a nova requisição (**New Request**), informe o nome da requisição (indicado na imagem abaixo na cor amarela) e pressione a tecla **enter** do seu teclado.

<div align="center"><img src="https://i.imgur.com/3eD6Zwy.png" title="source: imgur.com" /></div>

4. Selecione o Método HTTP que será utilizado (**GET**) na requisição, indicado na imagem abaixo na cor verde. 

<div align="center"><img src="https://i.imgur.com/mWPpKHD.png" title="source: imgur.com" /></div>

5. Configure a requisição conforme a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/xI7UKwe.png" title="source: imgur.com" /></div>

6. No item marcado em verde na imagem acima, informe o endereço (endpoint) da Requisição. A requisição **Consultar Todas as postagens** foi configurada da seguinte maneira:

- A primeira parte do endereço (**http://localhost:8080**) é o endereço do nosso servidor local. Quando a API estiver na nuvem, ele será substituído pelo endereço da aplicação na nuvem.
- A segunda parte do endereço é o **endpoint** configurado na anotação ***@RequestMapping***, em nosso caso  **/postagens**. 

7. Para testar a requisição, com a aplicação rodando, clique no botão <img src="https://i.imgur.com/sy0V8Nx.png" title="source: imgur.com" width="60px"/>.

8. O resultado da requisição você confere na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/iUfzYul.png" title="source: imgur.com" /></div>

9. Observe que a aplicação além de exibir os dados de todos os Objetos da Classe Postagem persistidos no Banco de dados, no Corpo da Resposta, ela também retornará um **HTTP Status 200 🡪 OK** (indicado em verde na imagem acima), informando que a Requisição foi bem sucedida!
9. Caso o Projeto Spring não esteja em Execução, o Insomnia retornará a mensagem abaixo:

<div align="center"><img src="https://i.imgur.com/Y2iNu9v.png" title="source: imgur.com" /></div>

11. Execute o seu Projeto e teste novamente!

<br />

<div align="left"><img src="https://i.imgur.com/nxjyCpY.png" title="source: imgur.com" width="4%"/><a href="https://www.json.org/json-pt.html" target="_blank"><b>Site Oficial do JSON</b></a></div>

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="35px"/> <a href="https://github.com/rafaelq80/backend_blogpessoal_v3/tree/04_Classe_Postagem_Controller_getAll" target="_blank"><b>Código fonte do projeto</b></a></div>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
