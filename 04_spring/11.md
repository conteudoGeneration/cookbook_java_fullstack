<h1>Projeto 02 - Blog Pessoal - Classe PostagemController - Método Atualizar Postagem</h1>

O que veremos por aqui:

1. Criar o Método put(Postagem postagem) para atualizar uma Postagem persistida no Banco de Dados

<h2>1. O Recurso Postagem</h2>

Nas etapas anteriores, começamos a construir a Classe **PostagemController** e implementamos os Métodos:

-  **getAll()**  🡪 Retorna todos os Objetos da Classe Postagem persistidos no Banco de dados.
-  **getById(Long id)** 🡪 Retorna um Objeto específico da Classe Postagem persistido no Banco de dados. A Postagem é identificada pelo Atributo id.   
-  **getByTitulo(String titulo)** 🡪 Retorna  todos os Objetos da Classe Postagem persistidos no Banco de dados, cujo Atributo titulo contenha a String enviada no parâmetro titulo do Método.   
-  **Método post(Postagem postagem)** 🡪 Persiste (salva) um novo Objeto da Classe Postagem no Banco de dados.

Vamos continuar a construção da nossa Classe Controladora implementando o **Método put(Postagem postagem)**, que atualizará um Objeto da Classe Postagem persistido no Banco de dados.

<div align="center"><img src="https://i.imgur.com/aKmFiA1.png" title="source: imgur.com" width="50%"/></div>

<br />

<h2>👣 Passo 01 - Criar o Método put(Postagem postagem)</h2>

Vamos implementar o Método **put(Postagem postagem)** na Classe Postagem Controller. Observe que ele é muito parecido com o Método post. Traçando um paralelo com o MySQL, seria o equivalente a instrução: <code>UPDATE tb_postagens SET titulo = "titulo", texto = "texto", data = CURRENT_TIMESTAMP() WHERE id = id;</code>.

<div align="left"><img src="https://i.imgur.com/DDxkmrt.png" title="source: imgur.com" /></div>

**Linha 53:** a anotação **@PutMapping** indica que o Método put(Postagem postagem), responderá a todas as requisições do tipo **HTTP PUT**, enviadas no endereço **http://localhost:8080/postagens**.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ATENÇÃO:** *O Endereço do Endpoint será igual ao Endereço do Recurso (@RequestMapping). Os Métodos getAll() e post(Postagem postagem) utilizam o mesmo endereço, porém como se tratam de verbos diferentes (O primeiro utiliza o verbo GET , o segundo utiliza o verbo POST e o terceiro utiliza o verbo PUT) o endereço pode ser o mesmo.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

**Linha 54:** O Método **ResponseEntity**<img src="https://i.imgur.com/QKIS6Rm.png" title="source: imgur.com" height="20px"/> put (@Valid @RequestBody Postagem postagem) será do tipo **ResponseEntity** porque ele responderá Requisições HTTP (HTTP Request), com uma **Resposta HTTP** (HTTP Response). Observe que o Método possui um parâmetro, que é um Objeto da **Classe Postagem**, chamado **postagem**.

**@Valid:** Esta anotação valida o Objeto Postagem enviado no Corpo da Requisição (Request Body), conforme as regras definidas na Model Postagem (@NotNull, @NotBlank, @Size e etc).

**@RequestBody Postagem postagem:** Esta anotação recebe o Objeto do tipo Postagem enviado no Corpo da Requisição (Request Body), no formato JSON e insere no parâmetro **postagem** do Método put.

<img src="https://i.imgur.com/QKIS6Rm.png" title="source: imgur.com" height="20px"/>: O Método além de retornar um objeto da **Classe ResponseEntity** (**OK🡪200**), no parâmetro **body** (Corpo da Resposta), será retornado o **Objeto da Classe Postagem**, que foi atualizado no Banco de dados, na tabela **tb_postagens**.  

**Linha 55:**

**return postagemRepository.findById(postagem.getId()):** Retorna a execução do Método **findById(id)**. O Método  retornará um **Objeto da Classe Postagem** persistido no Banco de dados, caso ele seja encontrado a partir do parâmetro **id**, que foi recuperado do Objeto **postagem** recebido no Corpo da Requisição, no formato JSON. Caso contrário, será retornado um Objeto Nulo. Observe que o **id da postagem** foi recuperado através do Método **getId()** que retorna o **id** da Postagem recebido no Corpo da Requisição (Request Body)

**.map(resposta 🡪 ResponseEntity.status(HttpStatus.OK).body(postagemRepository.save(postagem)):** Se o Objeto da Classe Postagem for encontrado, o Método **map** (Optional), mapeia no **Objeto resposta** o retorno do Método **findById(id)**, mas ao invés de exibir o Objeto **resposta** no Corpo da Resposta, vamos executar o Método **postagemRepository.save(postagem)**, que substituirá o Objeto da Classe Postagem encontrado no Banco de dados,  pelo Objeto **postagem** recebido no Corpo da Requisição. Na sequência, o Objeto **postagem** atualizado será retornado no Corpo da Resposta, além do HTTP Status **OK🡪200**, indicando que a atualização foi bem sucedida.

O Método save(postagem) funciona da seguinte maneira:

- **Se o Objeto enviado possuir o Atributo id** 🡪 Ele checa se o Objeto existe e atualiza todos os Atributos. Se não existir o Objeto, ele cria um novo Objeto com os dados enviados, gerando uma duplicação no Banco de dados. Por este motivo fazemos a checagem se o Objeto existe através do Método **findById(Long id)** antes de executar o Método save(postagem), pois um Objeto só pode ser atualizado se ele existir.
- **Se o Objeto enviado não possuir o Atributo id** 🡪 Ele cria um novo com os dados enviados.
- Neste modelo de atualização, o Objeto terá todos os seus dados atualizados (exceto o id), ou seja, precisamos preencher todos os parâmetros do Objeto postagem, que será enviado no Corpo da Requisição no formato JSON. 
- Para realizarmos uma atualização parcial no Spring, precisaríamos implementar o **Método HTTP PATCH** e atualizar os Atributos do Objeto postagem persistido no Banco de dados individualmente, através dos respectivos **Métodos Get e Set** implementados na Classe Postagem, o que tornaria o código muito extenso e "verboso" dependendo do número de Atributos. 
- Com o Método atual, a atualização parcial poderia ser resolvida direto no Front-end da aplicação, onde podemos selecionar apenas o que queremos atualizar e manter sem alterações o que não queremos atualizar. Bem mais Simples!

**.orElse(ResponseEntity.notFound().build());:** Se o Objeto Postagem não for encontrado (Nulo) pelo Método findById(id), será retornado o HTTP Status **NOT FOUND 🡪 404** (Não Encontrado!). O Método **build()** constrói a Resposta com o HTTP Status retornado.

Depois de Criar o Método, observe que foi importado mais 1 pacote, como mostra a imagem abaixo (indicado pela Seta vermelha):

<div align="left"><img src="https://i.imgur.com/sQahD3s.png" title="source: imgur.com" /></div>

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**) e verificar se o Projeto está em execução.

<br />

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/bind/annotation/PutMapping.html" target="_blank"><b>Documentação: <i>@PutMapping</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/ResponseEntity.html#created-java.net.URI-" target="_blank"><b>Documentação: <i>ResponseEntity</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/HttpStatus.html#OK" target="_blank"><b>Documentação: <i>HttpStatus</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/repository/CrudRepository.html?is-external=true#save-S-" target="_blank"><b>Documentação: <i>.save(T entidade)</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/bind/annotation/RequestBody.html" target="_blank"><b>Documentação: <i>@RequestBody</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://jakarta.ee/specifications/bean-validation/3.0/apidocs/jakarta/validation/valid" target="_blank"><b>Documentação: <i>@Valid</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="3%"/> <a href="https://docs.oracle.com/javase/tutorial/java/generics/types.html" target="_blank"><b>Documentação: <i>Java Generics</i></b></a></div>

<br />

<h2>👣 Passo 02 - Testar no Insomnia o Método put</h2>

Agora vamos criar a Requisição para o **Método put(Postagem postagem)**:

1. Clique com o botão direito do mouse sobre a **Pasta Postagem** para abrir o menu e clique na opção **New Request**.

<div align="center"><img src="https://i.imgur.com/KvRI8b2.png" title="source: imgur.com" /></div>

2.  Será criada uma nova Requisição (New Request) dentro da pasta **Postagem**.

<div align="center"><img src="https://i.imgur.com/CA70WQn.png" title="source: imgur.com" /></div>

3. Dê um duplo clique sobre a nova Requisição (**New Request**), informe o nome da Requisição (indicado na imagem abaixo na cor amarela) e pressione a tecla **enter** do seu teclado.

<div align="center"><img src="https://i.imgur.com/ZQKmphk.png" title="source: imgur.com" /></div>

4. Selecione o Método HTTP que será utilizado (**PUT**) na Requisição, indicado na imagem abaixo na cor verde. 

<div align="center"><img src="https://i.imgur.com/z6dWHYj.png" title="source: imgur.com" /></div>

5. No item **Body**, vamos alterar para **JSON**, como mostra a imagem abaixo. Desta forma poderemos enviar os dados do Objeto Postagem no Corpo da Requisição, no formato JSON.

<div align="center"><img src="https://i.imgur.com/PxOpzFd.png" title="source: imgur.com" /></div>

6. Observe que o item **Body** será renomeado para **JSON**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/8hDNIbh.png" title="source: imgur.com" /></div>

7. Configure a requisição conforme a imagem abaixo: 

<div align="center"><img src="https://i.imgur.com/c1hyPAK.png" title="source: imgur.com" /></div>

8. No item marcado em amarelo na imagem acima, informe o endereço (endpoint) da Requisição. A requisição **Editar Postagem** foi configurada da seguinte maneira:

   - A primeira parte do endereço (http://localhost:8080) é o endereço do nosso servidor local. Quando a API estiver na nuvem, ele será substituído pelo endereço da aplicação na nuvem.
   - A segunda parte do endereço é o **endpoint** configurado na anotação ***@RequestMapping***, em nosso caso  **/postagens**. 
   
9. Na guia **JSON**, precisamos inserir um **JSON** com os dados que serão inseridos na nova postagem. Lembrando que no padrão JSON: **o texto antes dos 2 pontos** (:) é o **Atributo** da Classe e **o texto depois dos 2 pontos** (:) é o **dado** que será cadastrado no Atributo.  Os Atributos são separados por virgula, como mostra a imagem acima.

   | <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** Observe que no Método **PUT é necessário enviar o Atributo id** no JSON para identificar a Postagem que será atualizada. A data não precisa ser enviada, porquê ela será atualizada pela própria aplicação.</div> |
   | ------------------------------------------------------------ | ------------------------------------------------------------ |

10. Para testar a requisição, com a aplicação rodando, clique no botão <img src="https://i.imgur.com/sy0V8Nx.png" title="source: imgur.com" width="60px"/>.

11. O resultado da requisição você confere na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/vTn1BJ9.png" title="source: imgur.com" /></div>

12. Observe que a aplicação retorna além dos dados que foram atualizados no Banco de dados, ela também retorna um **HTTP Status 200 🡪 OK** (indicado em verde na imagem acima). Este Status indica que a Requisição foi bem sucedida!

13. Caso a Postagem não seja encontrada, será retornado o **HTTP Status 404 🡪 NOT_FOUND**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/5lCAhBv.png" title="source: imgur.com" /></div>

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/backend_blogpessoal_v3/tree/08_Classe_PostagemController_put" target="_blank"><b>Código fonte do projeto</b></a></div>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
