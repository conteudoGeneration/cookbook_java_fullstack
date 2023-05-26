<h1>Teste de Software - JUnit 5 - Configurando o Ambiente de testes</h1>

<br />


<h2>👣 Passo 01 - Configurações das Dependências</h2>

Neste passo vamos configurar a Dependência Spring Boot Starter Test (adicionada na criação do projeto) e adicionar a Dependência do Banco de dados em memória H2.

<h3>1. Configurar a Dependência Spring Testing</h3>

Vamos Configurar a Dependência Spring Boot Starter Test para aceitar apenas o **JUnit 5**. No arquivo, **pom.xml**, vamos **substituir** a dependência **Spring Boot Starter Test**:

**Localize as linhas abaixo:**

```xml
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-test</artifactId>
		<scope>test</scope>
	</dependency>
```

**Substitua por:**

```xml
    <dependency>
    	<groupId>org.springframework.boot</groupId>
    	<artifactId>spring-boot-starter-test</artifactId>
    	<scope>test</scope>
    	<exclusions>
    		<exclusion>
    			<groupId>org.junit.vintage</groupId>
    			<artifactId>junit-vintage-engine</artifactId>
    		</exclusion>
    	</exclusions>
    </dependency>
```
*Essa alteração irá ignorar as versões anteriores ao **JUnit 5** (vintage).

<h3>2. Adicionar a Dependência do Banco de Dados H2</h3>

Para utilizar o Banco de Dados H2 no seu projeto será necessário inserir a Dependência no seu arquivo **pom.xml**. No arquivo, **pom.xml**, vamos adicionar as linhas abaixo:

```xml
<!-- Dependência do Banco de dados H2 -->
<dependency>
	<groupId>com.h2database</groupId>
	<artifactId>h2</artifactId>
	<scope>test</scope>
</dependency>
```

*Sugerimos adicionar esta dependência logo abaixo da dependência do MySQL.

<br />

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).

<br />


<h2 >👣 Passo 02 - Criar os Métodos Construtores na Classe Usuario (Camada Model)</h2>

Na **Classe Usuario**, na camada Model, vamos criar 2 Métodos construtores: o primeiro com todos os Atributos (exceto o Atributo postagens, que tem a função de listar as postagens associadas ao usuário, logo é um Atributo preenchido automaticamente pelo Relacionamento entre as Classes) e um segundo Método construtor vazio, ou seja, sem Atributos como mostra o trecho de código abaixo. Através destes dois Métodos iremos instanciar alguns objetos da Classe Usuario nas nossas Classes de teste. 

```java
	public Usuario(Long id, String nome, String usuario, String senha, String foto) {
		this.id = id;
		this.nome = nome;
		this.usuario = usuario;
		this.senha = senha;
		this.foto = foto;
	}
	
	public Usuario() { }
```

1. Para criar o Primeiro Construtor, posicione o cursor após o último Atributo da Classe (em nosso exemplo postagem) e clique no menu **Source 🡪 Generate Constructor using fields**.

2. Na janela **Generate Constructor using fields**, selecione todos os Atributos, exceto postagem e marque a opção **Omit call to default constructor super()** como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/hVxDcKQ.png" title="source: imgur.com" /></div>

3. Clique no botão **Generate** para concluir. O Construtor será gerado com todas as anotações nos parâmetros, como mostra a figura abaixo:

```java
	public Usuario(Long id, @NotNull(message = "O Atributo Nome é Obrigatório!") String nome,
	@NotNull(message = "O Atributo Usuário é Obrigatório!") @Email(message = "O Atributo Usuário deve ser um email válido!") String usuario,
	@NotBlank(message = "O Atributo Senha é Obrigatório!") @Size(min = 8, message = "A Senha deve ter no mínimo 8 caracteres") String senha,
	String foto) {
		super();
		this.id = id;
		this.nome = nome;
		this.usuario = usuario;
		this.senha = senha;
		this.foto = foto;
	}

```

4.  Apague todas as anotações dos parâmetros do Método Construtor. O Método ficará igual ao trecho de código abaixo:
```java
	public Usuario(Long id, String nome, String usuario, String senha, String foto) {
		this.id = id;
		this.nome = nome;
		this.usuario = usuario;
		this.senha = senha;
		this.foto = foto;
	}
```

Agora vamos criar o segundo Método Construtor:

1. Posicione o cursor após o Método Construtor com parâmetros e clique no menu **Source 🡪 Generate Constructor using fields**.

2. Na janela **Generate Constructor using fields**, desmarque  todos os Atributos e marque a opção **Omit call to default constructor super()** como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/TaJjHTH.png" title="source: imgur.com" /></div>

3. Clique no botão **Generate** para concluir.

4. O construtor vazio ficará igual a imagem abaixo:

```java
	public Usuario() {	}
```

<br />

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).

<br />

<h2>👣 Passo 03 - Configurar o Banco de dados H2</h2>

Agora vamos configurar o Banco de dados H2 para executar os nossos testes sem alterar o Banco de dados principal da aplicação. Como não temos em nosso projeto a pasta **resources**, dentro da **Source Folder src/test**, vamos criar a pasta e na sequência inserir o arquivo **application.properties** para configurarmos o Banco de dados de testes (H2). 

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <p align="justify"> **ATENÇÃO:** *A configuração do Banco de dados H2 será feita na Source Folder Testes (ser/test). Mantenha atenção aos detalhes para não errar na configuração.* </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

1) No lado esquerdo superior, na Guia **Package Explorer**, clique sobre a pasta do projeto com o botão direito do mouse e clique na opção **New 🡪 Source folder**

<div align="center"><img src="https://i.imgur.com/HPjOwdn.png" title="source: imgur.com" width="85%"/></div>

2) Em **Source Folder**, no item **Folder name**, informe o caminho como mostra a figura abaixo (**src/test/resources**), e clique em **Finish**:

<div align="center"><img src="https://i.imgur.com/bHilbvh.png" title="source: imgur.com" /></div>

3) No lado esquerdo superior, na Guia **Package explorer**, na Source Folder **src/test/resources**, clique com o botão direito do mouse e clique na opção **New 🡪 File**.

4) Em File name, digite o nome do arquivo (**application.properties**) e clique em **Finish**. 

<div align="center"><img src="https://i.imgur.com/VSZCPTR.png" title="source: imgur.com" /></div>

6) Veja o arquivo criado na  **Package Explorer** 

<div align="center"><img src="https://i.imgur.com/vpbrBCc.png" title="source: imgur.com" /></div>

7) Insira no arquivo **application.properties** criado em **src/test/resources** o código abaixo, para configurar o Banco de dados H2:

```properties
spring.jpa.hibernate.ddl-auto=create-drop

spring.datasource.url=jdbc:h2:file:~/target/h2;DB_CLOSE_ON_EXIT=FALSE
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=sa
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
```
<br />

| Linha                                 | Descrição                                                    |
| ------------------------------------- | ------------------------------------------------------------ |
| **spring.jpa.hibernate.ddl-auto**     | Configura o Spring para criar (create) o Banco de dados ao executar a aplicação e apagar (drop) o Banco de dados ao finalizar a aplicação |
| **spring.datasource.url**             | Define que o Banco de dados será gerado em um arquivo na pasta target/h2 (jdbc:h2:file:~/target/h2) e o H2 não será fechado até que o STS seja finalizado (DB_CLOSE_ON_EXIT=FALSE) |
| **spring.datasource.driverClassName** | Define o Driver do Banco de dados (H2)                       |
| **spring.datasource.username**        | Define o usuário do H2 (sa)                                  |
| **spring.datasource.password**        | Define a senha do usuário do H2 (sa)                         |
| **spring.jpa.database-platform**      | Configura o tipo do Banco de dados (H2).                     |

<br />

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).

<br />

<h2>👣 Passo 05 - Criar o pacote controller em src/test/java</h2>

Na Source Folder de Testes (**src/test/java**), observe que existe a mesma estrutura de pacotes da Source Folder Principal (**src/main/java**). 

<div align="center"><img src="https://i.imgur.com/SkJ4D76.png" title="source: imgur.com" width="45%"/></div>

Vamos criar em **src/test/java** as packages **Repository** e **Controller**:

1. No lado esquerdo superior, na Guia **Package explorer**, clique com o botão direito do mouse sobre a Package **com.generation.blogpessoal**, na Source Folder **src/test/java** e clique na opção  **New 🡪 Package**.

2. Na janela **New Java Package**, no item **Name**, acrescente no final do nome da Package **.controller**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/uso8FfA.png" title="source: imgur.com" width="55%"/></div>

3. Clique no botão **Finish** para concluir.

4. O Resultado você confere na imagem abaixo:


<div align="center"><img src="https://i.imgur.com/EarBjJP.png" title="source: imgur.com" width="45%"/></div>

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/backend_blogpessoal_v3/tree/15_Ambiente_Testes" target="_blank"><b>Código fonte do projeto</b></a></div>

<br /><br />
	

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
