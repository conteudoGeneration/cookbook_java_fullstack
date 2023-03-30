
<h1>Projeto 02 - Blog Pessoal - Interface Postagem Repository</h1>

O que veremos por aqui:

1. Criar a Interface PostagemRepository
1. Compreender o que é a Interface JPA Repository?

<h2>1. O Recurso Postagem</h2>

Na etapa anterior, começamos a construir o Recurso Postagem, a partir da Classe Model Postagem, onde implementamos todos os Atributos do recurso. Veja o Diagrama de Classes abaixo: 

<div align="center"><img src="https://i.imgur.com/aKmFiA1.png" title="source: imgur.com" width="50%"/></div>

Nesta etapa, vamos construir a **Interface PostagemRepository**, que irá nos auxiliar na interação com o Banco de dados. Esta Interface contém diversos Métodos pré-implementados para a geração de consultas SQL, que serão utilizadas para manipular os dados da entidade Postagem. Os Métodos pré-implementados realizam ações como: Salvar (persistir), Deletar, Consultar e Atualizar dados dos objetos persistidos. 

Além destes Métodos, a Interface Repository permite criar Métodos, que irão gerar consultas personalizadas. Estes Métodos são chamados de **Query Methods**, que veremos como utilizá-los mais a frente. Para utilizar todos os Métodos da Interface Repository, vamos criar dentro da Interface PostagemRepository uma **Herança** (extends) com a Interface **JpaRepository**. Os Métodos desta Interface serão implementados na próxima etapa, na construção da Classe **PostagemController**.

O Diagrama de Classes da nossa Interface, neste momento, será igual a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/EoYIfl5.png" title="source: imgur.com" width="50%"/></div>

Nas próximas etapas do Projeto, iremos acrescentar um Método personalizado em nossa Interface.

<br />

<h2>👣 Passo 01 - Criar o Pacote Repository</h2>

Na Source Folder Principal (**src/main/java**), observe que já foi criado o pacote Principal da nossa aplicação (**com.generation.blogpessoal**) e o pacote Model (**com.generation.blogpessoal.model**). Na figura abaixo, podemos visualizar os 2  pacotes:

<div align="center"><img src="https://i.imgur.com/QKpe56L.png" title="source: imgur.com" /></div>

Nesta etapa, vamos criar a **Camada Repository**:

1. No lado esquerdo superior, na Guia **Package explorer**, clique com o botão direito do mouse sobre a Package **com.generation.blogpessoal**, na Source Folder **src/main/java** e clique na opção  **New 🡪 Package**.

<div align="center"><img src="https://i.imgur.com/KFgbORX.png" title="source: imgur.com" /></div>

2. Na janela **New Java Package**, no item **Name**, acrescente no final do nome da Package **.repository**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/pJiwCrP.png" title="source: imgur.com" /></div>

3. Clique no botão **Finish** para concluir.

Quando você terminar de criar a **Camada Repository**, a sua estrutura de pacotes ficará igual a figura abaixo:

<div align="center"><img src="https://i.imgur.com/0xnq7IN.png" title="source: imgur.com" /></div>

<br />

<h2>👣 Passo 02 - Criar a Interface PostagemRepository na Camada Repository</h2>

Agora vamos criar a Interface Repository que chamaremos de **PostagemRepository**.

1. Clique com o botão direito do mouse sobre o **Pacote Repository** (**com.generation.blogpessoal.repository**), na Source Folder Principal (**src/main/java**), como mostra a figura abaixo:
2. Na sequência, clique na opção **New 🡪 Interface**

<div align="center"><img src="https://i.imgur.com/RxOMk9N.png" title="source: imgur.com" /></div>

3. Na janela **New Java Interface**, no item **Name**, digite o nome da Interface (**PostagemRespository**), como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/iG0wWPN.png" title="source: imgur.com" /></div>

4. Clique no botão **Finish** para concluir.

 Agora vamos criar o código da **Interface Repository PostagemRepository**, como mostra a figura abaixo:

<div align="left"><img src="https://i.imgur.com/QIpW9hr.png" title="source: imgur.com" /></div>

Vamos analisar o código:

> Antes de continuar, vamos relembrar **o que é uma Interface?**
>
> Uma **interface em Java**  é uma **Classe Abstrata** (uma Classe que serve de modelo para outras Classes), composta somente por Métodos abstratos. E como tal, obviamente não pode ser instanciada, ou seja, ela só contém as declarações dos Métodos e constantes, nenhuma implementação, apenas as assinaturas dos Métodos, que serão implementados em uma Classe.

**Linha 1:** Através do comando **package**, estamos informando o nome do pacote (camada), onde a Classe foi criada. Esta informação é inserida automaticamente pelo STS ao criar a Classe.

**Linhas 3 e 5:** Através do comando **import**, estamos indicando todos os pacotes que contém as Classes que estão sendo utilizadas na Interface PostagemRepository.

**Linha 07:** Observe que na declaração da Interface foi adicionada a Herança através da palavra reservada **extends** com a Interface JpaRepository, que recebe 2 parâmetros:

1. A **Classe Postagem**, que é a Entidade que será mapeada em nosso Banco de dados (Lembre-se que a Classe Postagem foi quem gerou a nossa tabela tb_postagens) 
2. O **Long** representa a nossa Chave Primária (Primary Key), que é o Atributo que recebeu a anotação **@Id** na nossa Classe Postagem (o Atributo também se chama id em nossa Classe Postagem).

Estes 2 parâmetros são do tipo **Java Generics** (podem receber qualquer tipo de Objeto <T, T>). Dentro do contexto do JPA, estes 2 parâmetros é o mínimo necessário para executar os Métodos padrão da Interface Repository, que serão implementados na próxima etapa na Classe **PostagemController**. Estes Métodos básicos já ficam automaticamente  disponíveis no Recurso Postagem a partir do momento que a Interface PostagemRepository herda a Interface JpaRepository.

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Atenção aos Detalhes ao criar a Interface Respository. Nas versões anteriores a versão 3 do Spring, utilizava-se acima da assinatura da Interface Repository a anotação @Repository. A partir da versão 3, esta anotação deixou de ser utilizada, entrando na lista de comandos Deprecated (descontinuados) do Java.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="4%"/> <a href="https://www.w3schools.com/java/java_interface.asp" target="_blank"><b>Documentação: <i>Java Interface</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="4%"/> <a href="https://www.w3schools.com/java/java_abstract.asp" target="_blank"><b>Documentação: <i>Classes Abstratas</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="4%"/> <a href="https://docs.oracle.com/javase/tutorial/java/generics/types.html" target="_blank"><b>Documentação: <i>Java Generics</i></b></a></div>


<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/conteudoGeneration/backend_blog_pessoal/blob/03-blog_pessoal_crud_03/blogpessoal/src/main/java/com/generation/blogpessoal/repository/PostagemRepository.java" target="_blank"><b>Código fonte da Interface Postagem Repository</b></a></div>

<br />

<h2>2. A Interface JPA Repository</h2>

O Repositório JPA é usado principalmente para gerenciar os dados em um aplicativo Spring Boot . 

Como vimos nas sessões sobre Banco de dados, para trabalhar com os Bancos de dados, é necessário criar uma grande quantidade de código contendo instruções **SQL**. Através do Spring Data JPA, estes códigos SQL podem ser facilmente reduzidos, através dos Métodos Padrão do JPA e dos Métodos Personalizados. 

Para utilizarmos estes facilitadores oferecidos pelo JPA, para cada uma das entidades (Classes Model) da aplicação, precisamos definir uma **Interface Repository que herdará todos os Métodos da Interface JpaRepository**. Uma Interface Repository, que herda a Interface JpaRepository, inclui todos os Métodos utilizados para executar as operações do **CRUD (Create - Read - Update - Delete)** nos dados de uma entidade. Estes Métodos sabem exatamente com qual entidade irão interagir, através dos parâmetros indicados na Herança da Interface JpaRepository, na assinatura da Interface Repository de cada entidade.

```java
public interface PostagemRepository extends JpaRepository<Postagem, Long>
```

No exemplo da Interface **PostagemRepository**, a Entidade (Model) é a Classe **Postagem** e o segundo parâmetro (**Long**), representa o Atributo id (Chave Primária da Tabela), que é do tipo **Long**.

**Resumindo:** A Interface JpaRepository contém todos os Métodos necessários para criação de um CRUD.

<br />

<h3>2.1. Métodos Padrão da Interface JpaRepository</h3>

Na tabela abaixo, temos os principais Métodos da Interface JpaRepository:

<table>
	<tr>
        <td width="30%"><b>Método</b></td>
		<td><b>Descrição</b></td>
	</tr>
    <tr>
        <td width="30%"><code><b>save(Objeto objeto)</b></code></td>
		<td>Cria ou Atualiza um objeto no Banco de Dados.</td>
	</tr>
	<tr>
        <td><code><b>findById(Long id)</b></code></td>
		<td>Retorna (exibe) um Objeto persistido de acordo com o id informado.</td>
	</tr>
	<tr>
        <td><code><b>existsById(Long id)</b></code></td>
		<td>Retorna True se um Objeto identificado pelo id estiver persistido no Banco de dados.</td>
	</tr>
	<tr>
        <td><code><b>findAll()</b></code></td>
		<td>Retorna (exibe) todos os Objetos persistidos.</td>
    </tr>
	<tr>
        <td><code><b>deleteById(Long id)</b></code></td>
		<td>Localiza um Objeto persistido pelo id e deleta caso ele seja encontrado. Não é possível desfazer esta operação.</td>
	</tr>
	<tr>
        <td><code><b>deleteAll()</b></code></td>
		<td>Deleta todos os Objetos persistidos.Não é possível desfazer esta operação.</td>
    </tr>
</table>
<br />

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#repositories.core-concepts" target="_blank"><b>Documentação: Métodos Padrão</b></a></div>

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="3%"/> <a href="https://github.com/rafaelq80/backend_blogpessoal_v3/tree/03_Interface_PostagemRepository" target="_blank"><b>Código fonte do Projeto</b></a>


<br /><br />
	
<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
