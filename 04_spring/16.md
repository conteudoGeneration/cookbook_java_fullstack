<h1>Projeto 02 - Blog Pessoal - Spring Security - Ecossistema do Usuário</h1>

O que veremos por aqui:

1. O Ecossistema do Usuário
2. Apresentação do Recurso Usuário
3. Criar a Classe Model Usuario relacionada com a Classe Postagem
4. Criar a Classe UsuarioLogin
5. Criar a Interface UsuarioRepository

<br />

<h2>1. Ecossistema do Usuario</h2>

O Ecossistema do Usuario é a parte responsável por definir os dados do nosso Objeto Usuario, que será utilizado para autenticar e autorizar o acesso ao Blog Pessoal, assim  que a Segurança da aplicação for implementada por completo. 

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ATENÇÃO:** Aproveite esta etapa para validar seu código do Blog Pessoal, o projeto abaixo serve como espelho para o Projeto Integrador. Tenha bastante atenção aos detalhes, pois existem implementações fundamentais para o perfeito funcionamento do sistema. Caso surjam dúvidas, não hesite em buscar os Instrutores da Generation para obter orientações.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>2. O Recurso Usuario</h2>

Nesta etapa vamos começar a construir o Recurso Usuario, que será composto por 2 Classes: **Usuario** e **Usuario Login**. 

<div align="center"><img src="https://i.imgur.com/1OVel2T.png" title="source: imgur.com" width="70%"/></div>

A **Classe Usuario** servirá de modelo para construir a tabela **tb_usuarios** (Entidade) dentro do nosso Banco de dados **db_blogpessoal**. Os campos (Atributos) da tabela serão os mesmos que estão definidos no Diagrama de Classes acima.

Depois de criar a Classe Model Usuario, vamos executar o projeto Blog Pessoal no STS. Após a execução veremos que será criado no Banco de dados db_blogpessoal a tabela tb_usuarios. Veja abaixo como ficará a estrutura da nossa tabela através do Diagrama de Entidade e Relacionamentos (DER):

<div align="center"><img src="https://i.imgur.com/txYWVNR.png" title="source: imgur.com" width="50%"/></div>

O Dicionário de dados da nossa tabela **tb_Usuarios** será o seguinte:

| Atributo | Tipo de dado  | Descrição           | Chave |
| -------- | ------------- | ------------------- | ----- |
| **id**   | bigint        | Identificador único | PK    |
| nome     | varchar(255)  | Nome do usuário     |       |
| usuario  | varchar(255)  | E-mail do usuário   |       |
| senha    | varchar(255)  | Senha do usuário    |       |
| foto     | varchar(5000) | Foto do usuário     |       |

Além de construirmos a Classe Usuario, também faremos o Relacionamento com a Classe Postagem, construída anteriormente. Veja como ficará o Relacionamento entre as 3 Classes, após a implementação, no Diagrama de Classes abaixo:

<div align="center"><img src="https://i.imgur.com/5p6IKku.png" title="source: imgur.com" /></div>

Depois de criar a Classe Model Usuario e o Relacionamento com a Classe Postagem, a estrutura do nosso Banco de dados **db_blogpessoal** ficará igual ao **Diagrama de Entidade e Relacionamentos (DER)** abaixo:

<div align="center"><img src="https://i.imgur.com/mLIEhuA.png" title="source: imgur.com" /></div>

Observe que a entidade Postagem (tb_postagens) passará a ter **2 Chaves Estrangeiras (FK)**: *tema_id e usuario_id*.

Na sequência vamos construir a **Interface UsuarioRepository**, que irá nos auxiliar na interação com o Banco de dados e com as Classes **UsuarioController**, onde serão implementados os 5 Métodos descritos no Diagrama de Classes acima e com a Classe de Serviço (Service), **UsuarioService**, onde serão implementadas as **Regras de Negócio** exigidas pela **Spring Security**.

O Diagrama de Classes da nossa Interface **UsuarioRepository** será igual a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/MdU4eSa.png" title="source: imgur.com" width="50%"/></div>

Observe que na Interface UsuarioRepository, a Query Method que será construída é diferente dos Métodos Construídos nas Interfaces **PostagemRepository e TemaRepository**.

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Atenção aos Detalhes ao criar o Recurso Usuario. Todas as Camadas (Pacotes: Model, Repository e Controller), já foram criadas nos Recursos Postagem e Tema.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="100px"/> | <div align="left"> **DICA:** *Caso você tenha alguma dúvida sobre como criar a Classe, executar o projeto, entre outras, consulte a Documentação dos outros Recursos.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

Também vamos criar a **Classe Usuario Login**, que embora seja criada na **Camada Model**, ela não irá gerar uma tabela no Banco de dados. Esta Classe será uma Classe auxiliar para o usuário efetuar login no sistema. 

<div align="center"><img src="https://i.imgur.com/8JIcXQN.png" title="source: imgur.com" width="60%"/></div>

<br />

<h2>👣 Passo 01 - Inserir as Dependências </h2>

No arquivo, **pom.xml**, adicione as linhas abaixo (caso você ainda não tenha adicionado):

```xml
<!-- Dependência da Spring Security -->
<dependency>  
	<groupId>org.springframework.boot</groupId>  
	<artifactId>spring-boot-starter-security</artifactId>  
</dependency>
<!-- Dependências para Geração e Validação do Token JWT -->
<dependency>
	<groupId>io.jsonwebtoken</groupId>
	<artifactId>jjwt-api</artifactId>
	<version>0.11.5</version>
</dependency>
<dependency>
	<groupId>io.jsonwebtoken</groupId>
	<artifactId>jjwt-impl</artifactId>
	<version>0.11.5</version>
</dependency>
<dependency>
	<groupId>io.jsonwebtoken</groupId>
	<artifactId>jjwt-jackson</artifactId>
	<version>0.11.5</version>
</dependency>
```

A primeira dependência, nós adicionamos na introdução da Spring Security. As outras 3 são responsáveis por gerar e validar o Token JWT.

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left">**ATENÇÃO:** No momento em que este conteúdo foi escrito, a versão atual da Dependência JWT era 0.11.5. Ao acessar este conteúdo a versão mais atual da Dependência pode ser outra.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />
	
Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).

<br />


<h2>👣 Passo 02 - Criar a Classe Usuario na Camada Model</h2>

Agora vamos criar a terceira Classe Model que chamaremos de **Usuario**.

1. Clique com o botão direito do mouse sobre o **Pacote Model** (**com.generation.blogpessoal.model**), na Source Folder Principal (**src/main/java**), e clique na opção **New 🡪 Class**
2. Na janela **New Java Class**, no item **Name**, digite o nome da Classe (**Usuario**), e na sequência clique no botão **Finish** para concluir.  


A seguir veja a implementação completa da **Classe Usuario**:

```java
package com.generation.blogpessoal.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "tb_usuarios")
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull(message = "O Atributo Nome é Obrigatório!")
	private String nome;

	@NotNull(message = "O Atributo Usuário é Obrigatório!")
	@Email(message = "O Atributo Usuário deve ser um email válido!")
	private String usuario;

	@NotBlank(message = "O Atributo Senha é Obrigatório!")
	@Size(min = 8, message = "A Senha deve ter no mínimo 8 caracteres")
	private String senha;

	@Size(max = 5000, message = "O link da foto não pode ser maior do que 5000 caracteres")
	private String foto;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario", cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties("usuario")
	private List<Postagem> postagem;

	/* Insira os Getters and Setters */

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getUsuario() {
		return this.usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return this.senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getFoto() {
		return this.foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public List<Postagem> getPostagem() {
		return this.postagem;
	}

	public void setPostagem(List<Postagem> postagem) {
		this.postagem = postagem;
	}

}
```

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="200px"/> | <div align="left"> ALERTA DE BSM: Mantenha a Atenção aos Detalhes, o Atributo senha definido acima, não pode conter o Atributo size max, que limita seu tamanho máximo. Dependendo do limite inserido, pode provocar um erro HTTP Status 500, devido ao limite de caracteres que serão utilizados na criptografia. Configure apenas a propriedade size min.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />


Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).

<br />

<h2>👣 Passo 03 - Criar a Relação ManytoOne na Classe Postagem</h2>

A Classe Postagem será o lado N:1, ou seja, **Muitas Postagens podem ter apenas Um Usuario**. Para criar a Relação vamos inserir depois do último Atributo da Classe Postagem (tema), as 3 linhas abaixo:

```java
	@ManyToOne
	@JsonIgnoreProperties("postagem")
	private Usuario usuario;
```

Não esqueça de acrescentar os **Métodos Get e Set** para o novo Atributo (usuario), que foi adicionado na Classe Postagem. Veja o código completo abaixo:

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="150px"/> | <div align="left"> **DICA:** *Toda vez que você adicionar um novo Atributo na sua Classe, não esqueça de criar os Métodos GET e SET do Atributo. Caso contrário, você não conseguirá visualizar ou atualizar os dados do Atributo.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

A seguir veja a implementação completa da **Classe Postagem** com as alterações:
```java
package com.generation.blogpessoal.model;

import java.time.LocalDateTime;

import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "tb_postagens")
public class Postagem {
    
    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Long id;
	
	@NotBlank(message = "O atributo título é Obrigatório!") 
	@Size(min = 5, max = 100, message = "O atributo título deve conter no mínimo 05 e no máximo 100 caracteres")
	private String titulo;
	
	@NotBlank(message = "O atributo texto é Obrigatório!")
	@Size(min = 10, max = 1000, message = "O atributo texto deve conter no mínimo 10 e no máximo 1000 caracteres")
	private String texto;
	
	@UpdateTimestamp
	private LocalDateTime data;
	
	@ManyToOne
	@JsonIgnoreProperties("postagem")
	private Tema tema;
	
	@ManyToOne
	@JsonIgnoreProperties("postagem")
	private Usuario usuario;

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitulo() {
        return this.titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTexto() {
        return this.texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public LocalDateTime getData() {
        return this.data;
    }

    public void setData(LocalDateTime data) {
        this.data = data;
    }

	public Tema getTema() {
		return tema;
	}

	public void setTema(Tema tema) {
		this.tema = tema;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
    
}
```

<br />
	
Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).

<br />


<h2>👣 Passo 04 - Criar a Classe UsuarioLogin na Camada Model</h2>

Agora vamos criar a quarta Classe Model que chamaremos de **UsuarioLogin**.

A Classe **UsuarioLogin** é responsável por definir que o cliente ao tentar autenticar (fazer login) no sistema, forneça apenas o usuário (e-mail) e a senha. Essa Classe funcionará como uma DTO (*Data trasfer object*), que é uma Classe que é utilizada para transitar dados do sistema sem revelar sua Classe Model para o cliente. 

1. Clique com o botão direito do mouse sobre o **Pacote Model** (**com.generation.blogpessoal.model**), na Source Folder Principal (**src/main/java**), e clique na opção **New 🡪 Class**
3. Na janela **New Java Class**, no item **Name**, digite o nome da Classe (**UsuarioLogin**), e na sequência clique no botão **Finish** para concluir.

A seguir veja a implementação completa da **Classe UsuarioLogin**:

```java
package com.generation.blogpessoal.model;

public class UsuarioLogin {
	
	private Long id;
	private String nome;
	private String usuario;
	private String senha;
	private String foto;
	private String token;

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getUsuario() {
		return this.usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return this.senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getFoto() {
		return this.foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getToken() {
		return this.token;
	}

	public void setToken(String token) {
		this.token = token;
	}

}
```

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> ALERTA DE BSM: Mantenha a Atenção aos Detalhes, não se esqueça de passar o id do usuario como Atributo da Classe, pois este Atributo será utilizado como crdencial pelo front-end para pegar o usuario pelo id. Todos os Atributos presentes na Classe Model Usuario devem estar presentes na Classe UsuarioLogin.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="120px"/> | **ALERTA DE BSM: Mantenha a Atenção aos Detalhes, não esqueça de adicionar o Atributo token, pois o mesmo será passado no cabeçalho de todas as requisições do front-end. Este Atributo é fundamental para consumir a API.** |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />
	
Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).

<br />

<h2>👣 Passo 05 - Executar o projeto e Checar o Banco de dados</h2>

1. Execute o projeto e verifique no **MySQL Workbench** se a tabela **tb_usuarios** foi criada no Banco de dados **db_blogpessoal** com o respectivo relacionamento com a tabela **tb_postagens**, onde foi criada a Chave Estrangeira **usuario_id**.

<div align="center"><img src="https://i.imgur.com/o3Ul8iS.png" title="source: imgur.com" /></div>

<br />

<h2>👣 Passo 06 - Criar a Interface UsuarioRepository na Camada Repository</h2>

Agora vamos criar a Interface Repository que chamaremos de **UsuarioRepository**.

1. Clique com o botão direito do mouse sobre o **Pacote Repository** (**com.generation.blogpessoal.repository**), na Source Folder Principal (**src/main/java**)
	
2. Na sequência, clique na opção **New 🡪 Interface**

3. Na janela **New Java Interface**, no item **Name**, digite o nome da Interface (**PostagemRespository**), e na sequência clique no botão **Finish** para concluir.

<br />

A seguir veja a implementação completa da **Interface UsuarioRepository**:

```java
package com.generation.blogpessoal.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.generation.blogpessoal.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long>{

	public Optional<Usuario> findByUsuario(String usuario);
	
}
```

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left">ALERTA DE BSM: Mantenha a Atenção aos Detalhes, tome muito cuidado pois se a escrita dos Métodos findBy ou findAllBy estiver errada, pode aparecer um erro no console do STS.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Observe que foi criada uma Query Method na Interface UsuarioRepository, conforme detalhado abaixo:

**Query Method**

```java
public Optional<Usuario> findByUsuario(String usuario);
```

**Instrução SQL equivalente**

```sql
SELECT * FROM tb_usuario WHERE usuario = "usuarios";
```

| Palavra            |      | Instrução SQL                                                |
| ------------------ | ---- | ------------------------------------------------------------ |
| **find**           | 🡪    | SELECT                                                       |
| **By**             | 🡪    | WHERE                                                        |
| **Usuario**        | 🡪    | Atributo da Classe Usuario                                   |
| **String usuario** | 🡪    | Parâmetro do Método contendo o e-mail do usuário que você deseja procurar. |

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** *A instrução FROM tb_usuarios será inserida pelo JPA ao checar o nome da tabela gerada pela Classe Usuario.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />
	
Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="30px"/> <a href="https://github.com/rafaelq80/backend_blogpessoal_v3/tree/12_Classe_Usuario_Relacionamentos" target="_blank"><b>Código fonte do Projeto</b></a></div>

<br /><br />

<h2 id="anexo1">Anexo I - Principais Mensagens de Erro</h2>

| Erro                        | Descrição                                                    |
| --------------------------- | ------------------------------------------------------------ |
| ***BeanCreationException*** | Ao criar o Relacionamento Bidirecional, você criou apenas um lado da Relação (**@OneToMany**). Faltou criar o outro lado da Relação (**@ManyToOne**).<br />**Exemplo:** <br/>Habilitou o Relacionamento na Classe Tema, mas não habilitou na Classe Postagem. |

<br /><br />


<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
