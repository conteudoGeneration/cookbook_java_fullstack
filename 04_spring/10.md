<h1>Projeto 02 - Blog Pessoal - Classe PostagemController - Método Cadastrar Postagem</h1>

O que veremos por aqui:

1. Criar o Método post(Postagem postagem) para persistir uma nova Postagem no Banco de Dados

<h2>1. O Recurso Postagem</h2>

Nas etapas anteriores, começamos a construir a Classe **PostagemController** e implementamos os Métodos:

-  **getAll()**  🡪 Retorna todos os Objetos da Classe Postagem persistidos no Banco de dados.
-  **getById(Long id)** 🡪 Retorna um Objeto específico da Classe Postagem persistido no Banco de dados. A Postagem é identificada pelo Atributo id.   
-  **getByTitulo(String titulo)** 🡪 Retorna  todos os Objetos da Classe Postagem persistidos no Banco de dados, cujo Atributo titulo contenha a String enviada no parâmetro titulo do Método.   

Vamos continuar a construção da nossa Classe Controladora implementando o **Método post(Postagem postagem)**, que persistirá um novo Objeto da Classe Postagem no Banco de dados.

<div align="center"><img src="https://i.imgur.com/aKmFiA1.png" title="source: imgur.com" width="50%"/></div>

<br />

<h2>👣 Passo 01 - Criar o Método post(Postagem postagem)</h2>

Vamos implementar o Método **post(Postagem postagem)** na Classe Postagem Controller. Traçando um paralelo com o MySQL, seria o equivalente a instrução: <code>INSERT INTO tb_postagens (titulo, texto, data) VALUES ("Título", "Texto", CURRENT_TIMESTAMP());</code>.

<div align="left"><img src="https://i.imgur.com/uj1CylK.png" title="source: imgur.com" /></div>

**Linha 46:** a anotação **@PostMapping** indica que o Método post(Postagem postagem), responderá a todas as requisições do tipo **HTTP POST**, enviadas no endereço **http://localhost:8080/postagens**.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ATENÇÃO:** *O Endereço do Endpoint será igual ao Endereço do Recurso (@RequestMapping). O Método getAll() utiliza o mesmo endereço, porém como se tratam de verbos diferentes (O primeiro utiliza o verbo GET e o segundo utiliza o verbo POST) o endereço pode ser o mesmo.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

**Linha 47:** O Método ResponseEntity<img src="https://i.imgur.com/QKIS6Rm.png" title="source: imgur.com" height="20px"/> post (@Valid @RequestBody Postagem postagem) será do tipo **ResponseEntity** porque ele responderá Requisições HTTP (HTTP Request), com uma **Resposta HTTP** (HTTP Response). Observe que o Método possui um parâmetro, que é um Objeto da **Classe Postagem**, chamado **postagem**.

**@Valid:** Esta anotação valida o Objeto Postagem enviado no Corpo da Requisição (Request Body), conforme as regras definidas na Model Postagem (@NotNull, @NotBlank, @Size e etc).

**@RequestBody Postagem postagem:** Esta anotação recebe o Objeto do tipo Postagem, que foi enviado no Corpo da Requisição (Request Body), no formato JSON e insere no parâmetro **postagem** do Método post.

<img src="https://i.imgur.com/QKIS6Rm.png" title="source: imgur.com" height="20px"/>: O Método além de retornar um objeto da **Classe ResponseEntity** (**CREATED🡪201**), no parâmetro **body** (Corpo da Resposta), será retornado o **Objeto da Classe Postagem**, que foi persistido no Banco de dados, na tabela **tb_postagens**, com o Atributo **id** preenchido pelo Banco de dados (auto incremento). Observe que nesta linha também foi utilizado o recurso **Java Generics** para simplificar o retorno do Objeto `<T>`, onde **T** é o tipo de retorno do Corpo da Resposta.  

**Linha 48:** **return ResponseEntity.status(HttpStatus.CREATED).body(postagemRepository.save(postagem));:** Executa o Método padrão da Interface JpaRepository **save(postagem)**, responsável por persistir (salvar) um Objeto no Banco de dados e retorna o **HTTP Status CREATED🡪201** se o Objeto foi persistido no Banco de dados.

Depois de Criar o Método, observe que foram importados mais 3 pacotes, como mostra a imagem abaixo (indicados pelas Setas vermelhas):

<div align="left"><img src="https://i.imgur.com/bXw0bAD.png" title="source: imgur.com" /></div>

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**) e verificar se o Projeto está em execução.

<br />

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/bind/annotation/PostMapping.html" target="_blank"><b>Documentação: <i>@PostMapping</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/ResponseEntity.html#created-java.net.URI-" target="_blank"><b>Documentação: <i>ResponseEntity</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/HttpStatus.html#CREATED" target="_blank"><b>Documentação: <i>HttpStatus</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/repository/CrudRepository.html?is-external=true#save-S-" target="_blank"><b>Documentação: <i>.save(T entidade)</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/bind/annotation/RequestBody.html" target="_blank"><b>Documentação: <i>@RequestBody</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://jakarta.ee/specifications/bean-validation/3.0/apidocs/jakarta/validation/valid" target="_blank"><b>Documentação: <i>@Valid</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="3%"/> <a href="https://docs.oracle.com/javase/tutorial/java/generics/types.html" target="_blank"><b>Documentação: <i>Java Generics</i></b></a></div>

<br />

<h2>👣 Passo 02 - Testar no Insomnia o Método Post</h2>

Agora vamos criar a Requisição para o **Método post(Postagem postagem)**:

1. Clique com o botão direito do mouse sobre a **Pasta Postagem** para abrir o menu e clique na opção **New HTTP Request**.

<div align="center"><img src="https://i.imgur.com/KvRI8b2.png" title="source: imgur.com" /></div>

2.  Será criada uma nova Requisição (New Request) dentro da pasta **Postagem**.

<div align="center"><img src="https://i.imgur.com/CA70WQn.png" title="source: imgur.com" /></div>

3. Dê um duplo clique sobre a nova Requisição (**New Request**), informe o nome da Requisição (indicado na imagem abaixo na cor amarela) e pressione a tecla **enter** do seu teclado.

<div align="center"><img src="https://i.imgur.com/z1mf3na.png" title="source: imgur.com" /></div>

4. Selecione o Método HTTP que será utilizado (**POST**) na Requisição, indicado na imagem abaixo na cor verde. 

<div align="center"><img src="https://i.imgur.com/TLBY2tJ.png" title="source: imgur.com" /></div>

5. No item **Body**, vamos alterar para **JSON**, como mostra a imagem abaixo. Desta forma poderemos enviar os dados do Objeto Postagem no Corpo da Requisição, no formato JSON.

<div align="center"><img src="https://i.imgur.com/PxOpzFd.png" title="source: imgur.com" /></div>

6. Observe que o item **Body** será renomeado para **JSON**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/8hDNIbh.png" title="source: imgur.com" /></div>

7. Configure a requisição conforme a imagem abaixo: 

<div align="center"><img src="https://i.imgur.com/9wzOrkQ.png" title="source: imgur.com" /></div>

8. No item marcado em amarelo na imagem acima, informe o endereço (endpoint) da Requisição. A requisição **Cadastrar Postagem** foi configurada da seguinte maneira:

   - A primeira parte do endereço (http://localhost:8080) é o endereço do nosso servidor local. Quando a API estiver na nuvem, ele será substituído pelo endereço da aplicação na nuvem.
   - A segunda parte do endereço é o **endpoint** configurado na anotação ***@RequestMapping***, em nosso caso  **/postagens**. 
   
9. Na guia **JSON**, precisamos inserir um **JSON** com os dados que serão inseridos na nova postagem. Lembrando que no padrão JSON: **o texto antes dos 2 pontos** (:) é o **Atributo** da Classe e **o texto depois dos 2 pontos** (:) é o **dado** que será cadastrado no Atributo.  Os Atributos são separados por virgula, como mostra a imagem acima.

   | <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** Observe que no Método **POST não é necessário enviar os Atributos id** (será gerado pelo Banco de dados) e **data** (será enviada pelo Sistema Operacional) no JSON.</div> |
   | ------------------------------------------------------------ | ------------------------------------------------------------ |

10. Para testar a requisição, com a aplicação rodando, clique no botão <img src="https://i.imgur.com/sy0V8Nx.png" title="source: imgur.com" width="50px"/>.

11. O resultado da requisição você confere na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/HB4LGxx.png" title="source: imgur.com" /></div>

12. Observe que a aplicação retorna além dos dados que foram persistidos no Banco de dados com o **id** (Chave Primária gerada pelo Banco de dados) e a **data** (Data obtida junto ao Sistema Operacional), além de retornar  **HTTP Status 201 🡪 CREATED** (indicado em verde na imagem acima). Este Status indica que a Requisição foi bem sucedida!

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/backend_blogpessoal_v3/tree/07_Classe_PostagemController_post" target="_blank"><b>Código fonte do projeto</b></a></div>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
