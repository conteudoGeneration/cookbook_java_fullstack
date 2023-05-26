<h1>Teste de Software - JUnit 5 - Teste da Classe Controller</h1>



Vamos criar a Classe de Testes **UsuarioControllerTest**:



<h2>👣Passo 01 - Criar a Classe UsuarioControllerTest</h2>

A Classe UsuarioControllerTest será utilizada para testar a Classe Controller do Usuario. Crie a Classe **UsuarioControllerTest** na package **controller**, na Source Folder de Testes (**src/test/java**)

1. No lado esquerdo superior, na Guia **Package Explorer**, clique com o botão direito do mouse sobre a Package **com.generation.blogpessoal.controller**, na Source Folder **src/test/java** e clique na opção  **New 🡪 Class**.

2. Na janela **New Java Class**, no item **Name**, informe o nome da Classe que será o mesmo nome da Classe Principal (**UsuarioController**) + a palavra **Test**, para indicar que se trata de uma Classe de Testes, ou seja, **UsuarioControllerTest**, como mostra a figura abaixo:

   <div align="center"><img src="https://i.imgur.com/r0ugUXm.png" title="source: imgur.com" width="65%"/></div>

3. Clique no botão **Finish** para concluir.

No teste da Camada Controller nós faremos Requisições <b>(http Request)</b> e na sequencia o teste analisará se as Respostas das Requisições <b>(http Response)</b> foram as esperadas.

Para simular as Requisições e Respostas, utilizaremos algumas Classes e Métodos do Spring Framework:

<table width=100%>
	<tr>
        <td width=20%><b>Classes / Métodos</b></td>
        <td width=80%><b>Descrição</b></td>
	</tr>
	<tr>
        <td><b>TestRestTemplate()</b></td>
        <td>É um cliente para escrever testes criando um modelo de comunicação com as APIs HTTP.  Ele fornece os mesmos Métodos, cabeçalhos e outras construções do protocolo HTTP.</td>
	</tr>
	<tr>
        <td><b>HttpEntity()</b></td>
        <td>Representa uma solicitação HTTP ou uma entidade de resposta, composta pelo status da resposta (2XX, 4XX ou 5XX), o corpo (Body) e os cabeçalhos (Headers).</td>
	</tr>
	<tr>
		<td><b>ResponseEntity()</b></td>
        <td>Extensão de HttpEntity que adiciona um código de status (http Status)</td>
	</tr>
	<tr>
		<td><b>TestRestTemplate<br />.exchange(URI, HttpMethod, <br />RequestType, ResponseType)</b></td>
        <td><p>O Método exchange executa uma requisição de qualquer Método HTTP e retorna uma instância da Classe ResponseEntity. Ele pode ser usado para criar requisições com os verbos http <b>GET, POST, PUT e DELETE</b>.</p> 
            <p>Usando o Método exchange(), podemos realizar todas as operações do CRUD (criar, consultar, atualizar e excluir). Todas as requisições do Método exchange() retornarão como resposta um Objeto da Classe ResponseEntity.</p></td>
	</tr>
    <tr>
		<td><b>TestRestTemplate<br />.withBasicAuth(username, password)</b></td>
        <td><p>O Método <b>withBasicAuth</b> permite efetuar login na aplicação para testar os endpoints protegidos pela Spring Security - Padrão Http Basic. Nos endpoints liberados não é necessário efetuar o login. Para checar os Métodos liberados verifique a <b>Classe BasicSecurityConfig</b>.</p> 
            <p>Utilizaremos o usuário em memória (root), que foi criado na Classe BasicSecurityConfig, para execuatr os nossos testes nos endpoints protegidos.</p></td>
	</tr>
</table>


Vamos analisar o código da Classe **UsuarioControllerTest**:

<div align="center"><img src="https://i.imgur.com/1V8hhYd.png" title="source: imgur.com" /></div>

**Linha 1:** Através do comando **package**, estamos informando o nome do pacote (camada), onde a Classe foi criada. Esta informação é inserida automaticamente pelo STS ao criar a Classe.

**Linhas 3 a 22:** Através do comando **import**, estamos indicando todos os pacotes que contém as Classes que estão sendo utilizadas na Classe **UsuarioControllerTest**.

<div align="center"><img src="https://i.imgur.com/9CtZniu.png" title="source: imgur.com" /></div>

Na **linha 24** a anotação **@SpringBootTest** indica que a Classe UsuarioControllerTest é uma Classe Spring Boot Testing. A Opção **environment** indica que caso a porta principal (8080 para uso local) esteja ocupada, o Spring irá atribuir uma outra porta automaticamente.

Na **linha 25** a anotação **@TestInstance** indica que o Ciclo de vida da Classe de Teste será por Classe.

Nas **linhas 28 e 29** foi injetado (**@Autowired**), um objeto da **Classe TestRestTemplate** para enviar as requisições para a nossa aplicação.

Nas **linhas 31 e 32** foi injetado (**@Autowired**), um objeto da **Classe UsuarioService** para persistir os objetos no Banco de dados de testes com a senha criptografada.

Nas **linhas 34 e 35** foi injetado (**@Autowired**), um objeto da **Interface UsuarioRepository** para limpar o Banco de dados de testes.

Entre as **linhas 37 e 45**, o Método **start()**, anotado com a anotação **@BeforeAll**, apaga todos os dados da tabela e cria o usuário **root@root.com** para testar os Métodos protegidos por autenticação.

<br />

<div align="left"><img src="https://i.imgur.com/mw7d1xn.png" title="source: imgur.com" width="30px"/> <a href="https://docs.spring.io/spring-boot/docs/current/reference/html/features.html#features.testing" target="_blank"><b>Documentação: @SpringBootTest</b></a></div>

<div align="left"><img src="https://i.imgur.com/AaUP7GB.png" title="source: imgur.com" width="25px"/> <a href="https://junit.org/junit5/docs/current/user-guide/#writing-tests-annotations" target="_blank"><b>Documentação: @TestInstance</b></a></div>

<div align="left"><img src="https://i.imgur.com/AaUP7GB.png" title="source: imgur.com" width="25px"/> <a href="https://junit.org/junit5/docs/current/user-guide/#writing-tests-test-instance-lifecycle" target="_blank"><b>Documentação: Lifecycle</b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-boot/docs/current/api/org/springframework/boot/test/web/client/TestRestTemplate.html" target="_blank"><b>Documentação: <i>Classe TestRestTemplate</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/repository/CrudRepository.html#deleteAll--" target="_blank"><b>Documentação: <i>deleteAll()</i></b></a></div>

<br />

<h3>Método 01 - Deve criar um Usuário</h3>

<div align="center"><img src="https://i.imgur.com/zSmgPII.png" title="source: imgur.com" /></div>

Na **linha 47**, o Método **deveCriarUmUsuario()** foi anotado com a anotação **@Test** que indica que este Método executará um teste.

Na **linha 48**, a anotação **@DisplayName** configura uma mensagem que será exibida ao invés do nome do Método.

Na **linha 51**, foi criado um objeto da Classe **HttpEntity** chamado **corpoRequisicao**, recebendo um objeto da Classe Usuario. Nesta etapa, o processo é equivalente ao que o Insomnia faz em uma requisição do tipo **POST**: Transforma os Atributos num objeto da Classe Usuario, que será enviado no corpo da requisição (Request Body).

Na **linha 54**, a Requisição HTTP será enviada através do Método **exchange()** da Classe **TestRestTemplate** e a Resposta da Requisição (Response) será recebida pelo objeto **corpoResposta** do tipo **ResponseEntity**. Para enviar a requisição, o será necessário  passar 4 parâmetros:

 - <b>A URI</b>: Endereço do endpoint (/usuarios/cadastrar);
 - <b>O Método HTTP</b>: Neste exemplo o Método **POST**;
 - <b>O Objeto HttpEntity</b>: Neste exemplo o objeto requisicao, que contém o objeto da Classe Usuario;
 - <b>O conteúdo esperado no Corpo da Resposta (Response Body)</b>: Neste exemplo será do tipo Usuario (Usuario.class).

Na **linha 57**, através do Método de asserção <b>AssertEquals()</b>, checaremos se a resposta da requisição (Response), é a resposta esperada (**CREATED 🡪 201**). Para obter o status da resposta vamos utilizar o Método **getStatusCode()** da **Classe ResponseEntity**.

<br />

<div align="left"><img src="https://i.imgur.com/AaUP7GB.png" title="source: imgur.com" width="25px"/> <a href="https://junit.org/junit5/docs/current/user-guide/#writing-tests-annotations" target="_blank"><b>Documentação: @Test</b></a></div>

<div align="left"><img src="https://i.imgur.com/AaUP7GB.png" title="source: imgur.com" width="25px"/> <a href="https://junit.org/junit5/docs/current/user-guide/#writing-tests-display-names" target="_blank"><b>Documentação: @DisplayName</b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/HttpEntity.html" target="_blank"><b>Documentação: <i>Classe HttpEntity</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-boot/docs/current/api/org/springframework/boot/test/web/client/TestRestTemplate.html" target="_blank"><b>Documentação: <i>Classe TestRestTemplate</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/ResponseEntity.html" target="_blank"><b>Documentação: <i>Classe ResponseEntity</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/HttpMethod.html" target="_blank"><b>Documentação: <i>HttpMethod</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/HttpStatus.html" target="_blank"><b>Documentação: <i>HttpStatus</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/AaUP7GB.png" title="source: imgur.com" width="25px"/> <a href="https://junit.org/junit5/docs/current/api/org.junit.jupiter.api/org/junit/jupiter/api/Assertions.html" target="_blank"><b>Documentação: assertEquals</b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/HttpEntity.html" target="_blank"><b>Documentação: <i>Classe HttpEntity</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/HttpEntity.html#getBody--" target="_blank"><b>Documentação: <i>Classe HttpEntity - Método getBody()</i></b></a></div>

<br />

<h3>Método 02 - Não deve permitir a duplicação do Usuário</h3>

<div align="center"><img src="https://i.imgur.com/rGF7fKz.png" title="source: imgur.com" /></div>

Na **linha 65**,  através do Método **cadastrarUsuario()** da **Classe UsuarioService**, foi persistido um Objeto da Classe Usuario no Banco de dados (Maria da Silva). 

Na **linha 68**, foi criado um objeto **HttpEntity** chamado **corpoRequisicao**, recebendo um objeto da Classe Usuario **contendo os mesmos dados do objeto persistido na linha 60** (Maria da Silva). 

Na **linha 71**, a Requisição HTTP será enviada através do Método **exchange()** da Classe **TestRestTemplate** e a Resposta da Requisição (Response) será recebida pelo objeto **corpoResposta** do tipo **ResponseEntity**. Para enviar a requisição, o será necessário  passar 4 parâmetros:

 - <b>A URI</b>: Endereço do endpoint (/usuarios/cadastrar);
 - <b>O Método HTTP</b>: Neste exemplo o Método **POST**;
 - <b>O Objeto HttpEntity</b>: Neste exemplo o objeto requisicao, que contém o objeto da Classe Usuario;
 - <b>O conteúdo esperado no Corpo da Resposta (Response Body)</b>: Neste exemplo será do tipo Usuario (Usuario.class).

Na **linha 74**, através do Método de asserção <b>AssertEquals()</b>, checaremos se a resposta da requisição (Response), é a resposta esperada (**BAD_REQUEST 🡪 400**). Para obter o status da resposta vamos utilizar o Método **getStatusCode()** da **Classe ResponseEntity**. 

| <img src="https://i.imgur.com/nSpXEZ0.png" title="source: imgur.com" width="250px"/> | <p align="justify"> Observe que neste Método temos o objetivo de testar o Erro! (Usuário Duplicado) e não a persistência dos dados. Observe que enviamos o mesmo objeto 2 vezes e verificamos se o aplicativo rejeita a persistência do mesmo objeto pela segunda vez (BAD REQUEST). </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Como o teste tem por objetivo checar se está duplicando usuários no Banco de dados, ao invés de checarmos se o objeto foi persistido (**CREATE 🡪 201**), checaremos se ele não foi persistido (**BAD_REQUEST 🡪 400**).  Se retornar o **Status 400**, o teste será aprovado!

<br />

<h3>Método 03 - Deve atualizar um Usuário</h3>

<div align="center"><img src="https://i.imgur.com/bY2cxGX.png" title="source: imgur.com" /></div>

Na **linha 81**, foi criado um Objeto **Optional**, do tipo Usuario, chamado **usuarioCreate**, para armazenar o resultado da persistência de um Objeto da Classe Usuario no Banco de dados, através do Método cadastrarUsuario() da Classe UsuarioService. 

Na **linha 84**, foi criado um Objeto do tipo Usuario, chamado **usuarioUpdate**, que será utilizado para atualizar os dados persistidos no Objeto **usuarioCreate** (linha 78). 

Na **linha 87**, foi criado um objeto **HttpEntity** chamado **corpoRequisicao**, recebendo o objeto da Classe Usuario chamado **usuarioUpdate**. Nesta etapa, o processo é equivalente ao que o Insomnia faz em uma requisição do tipo **PUT**: Transforma os Atributos num objeto da Classe Usuario, que será enviado no corpo da requisição (Request Body).

Na **linha 89**, a Requisição HTTP será enviada através do Método **exchange()** da Classe **TestRestTemplate** e a Resposta da Requisição (Response) será recebida pelo objeto **corpoResposta** do tipo **ResponseEntity**. Para enviar a requisição, o será necessário  passar 4 parâmetros:

 - <b>A URI</b>: Endereço do endpoint (**/usuarios/atualizar**);
 - <b>O Método HTTP</b>: Neste exemplo o Método **PUT**;
 - <b>O Objeto HttpEntity</b>: Neste exemplo o objeto requisicao, que contém o objeto da Classe Usuario;
 - <b>O conteúdo esperado no Corpo da Resposta (Response Body)</b>: Neste exemplo será do tipo Usuario (Usuario.class).

Observe que na **linha90**, como o Blog Pessoal está com o **Spring Security** habilitado com a autenticação do tipo **Http Basic**, o Objeto **testRestTemplate**, que será enviada para os endpoints protegidos (exigem autenticação), deverá efetuar o login com um usuário e uma senha válida para realizar os testes. 

Para autenticar o usuário e a senha utilizaremos o Método **withBasicAuth(username, password)** da Classe TestRestTemplate. Vamos utilizar o usuário **root@root.com**, que foi criado no Método **start()**, para autenticar na aplicação. 

Na **linha 93**, através do Método de asserção <b>AssertEquals()</b>, checaremos se a resposta da requisição (Response), é a resposta esperada (**OK 🡪 200**). Para obter o status da resposta vamos utilizar o Método **getStatusCode()** da **Classe ResponseEntity**.

<br />

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-boot/docs/current/api/org/springframework/boot/test/web/client/TestRestTemplate.html#withBasicAuth-java.lang.String-java.lang.String-" target="_blank"><b>Documentação: <i>Classe TestRestTemplate - Método .withBasicAuth()</i></b></a></div>

<br />


<h3>Método 04 - Listar todos os Usuários</h3>

<div align="center"><img src="https://i.imgur.com/nt6YXjW.png" title="source: imgur.com" /></div>

Na **linhas 101 e 104**, foram persistidos dois Objetos da Classe Usuario no Banco de dados, através do Método cadastrarUsuario() da Classe UsuarioService. 

Na **linha 107**, a Requisição HTTP será enviada através do Método **exchange()** da Classe **TestRestTemplate** e a Resposta da Requisição (Response) será recebida pelo objeto **resposta** do tipo **ResponseEntity**. Para enviar a requisição, o será necessário  passar 4 parâmetros:

 - <b>A URI</b>: Endereço do endpoint (/usuarios/all);
 - <b>O Método HTTP</b>: Neste exemplo o Método **GET**;
 - <b>O Objeto HttpEntity</b>: O objeto será nulo (null). **Requisições do tipo GET não enviam Objeto no corpo da requisição**;
 - <b>O conteúdo esperado no Corpo da Resposta (Response Body)</b>: Neste exemplo como o objeto da requisição é nulo, a resposta esperada será do tipo **String (String.class)**.

Observe que na **linha 108**, como o Blog Pessoal está com o **Spring Security** habilitado com autenticação do tipo **Http Basic**, o Objeto **testRestTemplate** dos endpoints que exigem autenticação, deverá efetuar o login com um usuário e uma senha válida para realizar os testes. 

Para autenticar o usuário e a senha utilizaremos o Método **withBasicAuth(username, password)** da Classe TestRestTemplate. Vamos utilizar o usuário **root@root.com**, que foi criado no Método **start()**, para autenticar na aplicação. 

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="120px"/> | <p align="justify"> Observe que no Método GET não foi criado o Objeto da Clase HttpEntity, porque o Método GET não envia um Objeto no Corpo da Requisição. Lembre-se: Ao criar uma requisição do tipo GET no Insomnia é enviado apenas a URL do endpoint. Esta regra também vale para o Método DELETE. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Na **linha 111**, através do Método de asserção <b>AssertEquals()</b>, checaremos se a resposta da requisição (Response), é a resposta esperada (**OK 🡪 200**). Para obter o status da resposta vamos utilizar o Método **getStatusCode()** da **Classe ResponseEntity**. 

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).


<br />

<h2>👣 Passo 02 - Executando os Testes no STS


<h3>7.1. Executar todos os testes</h3>

1) No lado esquerdo superior, na Guia **Project**, na Package **src/test/java**, clique com o botão direito do mouse sobre a Classe de teste que você deseja executar e clique na opção **Run As 🡪 JUnit Test**.

<div align="center"><img src="https://i.imgur.com/pjm7kzG.png" title="source: imgur.com" /></div>


2) Para acompanhar os testes, ao lado da Guia **Project**, clique na Guia **JUnit** .

<div align="center"><img src="https://i.imgur.com/4GxjbSU.png" title="source: imgur.com" width="70%"/></div>

  3) Se todos os testes passarem, a Guia do JUnit ficará com uma faixa verde (janela 01). Caso algum teste não passe, a Guia do JUnit ficará com uma faixa vermelha (janela 02). Neste caso, observe o item <b>Failure Trace</b> para identificar o (s) erro (s).

<div align="center">
<table width=100%>
	<tr>
		<td width=50%><div align="center"><img src="https://i.imgur.com/Lxt1cfC.png" title="source: imgur.com" /></div>
		<td width=50%><div align="center"><img src="https://i.imgur.com/5G767aj.png" title="source: imgur.com" /></div>
	</tr>
	<tr>
		<td><div align="center">Janela 01: <i> Testes aprovados.
		<td><div align="center">Janela 02: <i> Testes reprovados.
	</tr>
</table>
</div>
<br />

<h3>7.2. Executar apenas um Método espcífico</h3>

1. Posicione o cursor do mouse sobre o nome do teste. Observe que o nome será selecionado, como mostra a figura abaixo:

   <div align="center"><img src="https://i.imgur.com/Oj11AqF.png" title="source: imgur.com" /></div>

2. Clique com o botão direito do mouse sobre o nome do Método que você deseja executar e clique na opção **Run As 🡪 JUnit Test**.

   <div align="center"><img src="https://i.imgur.com/nbD1D4A.png" title="source: imgur.com" /></div>

3. Observe que será executado apenas o Método que você selecionou.

<div align="center"><img src="https://i.imgur.com/XQH0ZKI.png" title="source: imgur.com" /></div>

| <img src="https://i.imgur.com/L338M2G.png" title="source: imgur.com" width="138px"/> | **DESAFIO:** Faça algumas alterações nos dados dos objetos e/ou escreva outros testes para praticar. A melhor forma de aprender e compreender como funcionam os testes é praticando!  |
| ------------------------------------------------------------ | :----------------------------------------------------------- |

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/backend_blogpessoal_v3/tree/16_Testes_UsuarioController" target="_blank"><b>Código fonte do projeto</b></a> 
</div>

<br />

<h2>✔ Boas práticas</h2>

1. **Faça testes pequenos.**
2. **Faça testes rápidos:** Os testes devem ser simples e objetivos porquê serão executados o tempo todo.
3. **Faça testes determinísticos:** O teste deve garantir o resultado.
4. **Faça testes independentes:** Um teste não pode depender do resultado de outro teste.
5. **Utilize nomes auto descritivos:** A ideia é que você entenda o que o teste faz sem precisar abri-lo.
6. **Insira poucas asserções em cada teste:** O objetivo é que um teste seja responsável por apenas uma verificação.
7. **Sempre avalie os resultados dos seus testes.**

<br /> <br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
