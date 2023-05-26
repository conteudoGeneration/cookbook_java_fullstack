<h1>Projeto 02 - Blog Pessoal - Spring Security - Ecossistema do Usuário - Parte 02</h1>

O que veremos por aqui:

1. A Classe UsuarioService
2. A Classe UsuarioController
3. Testes no Insomniaa

Vamos finalizar o Ecossistema do Usuário.

<br />

<h2>👣 Passo 01 - Criar o Pacote Service</h2>

1. Na Guia **Package explorer**, clique com o botão direito do mouse sobre a Package **com.generation.blogpessoal**, na Source Folder **src/main/java** e clique na opção  **New 🡪 Package**.

2. Na janela **New Java Package**, no item **Name**, acrescente no final do nome da Package **.service** e clique no botão **Finish** para concluir.

<div align="center"><img src="https://i.imgur.com/xTtAHJu.png" title="source: imgur.com" width="65%"/></div>

<br />

<h2>👣 Passo 02 - Criar a Classe UsuarioService na Camada Service</h2>

A **Classe UsuarioService** é responsável por manipular as regras de negócio de usuário no sistema. Esta Classe deve ser anotada com a anotação **@Service**, para que o Spring identifique que é uma Classe que serviço. Vale mencionar que alguns Métodos definidos abaixo são de extrema importância para a Spring Security. 

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ATENÇÃO:** *O uso da Classe de Serviço não se restringe apenas a Spring Security, ela pode ser utilizada em qualquer endpoint para criar Regras de Negócio. Exemplo: Não permitir postagens ou temas duplicados.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

1. Clique com o botão direito do mouse sobre o **Pacote Security** (**com.generation.blogpessoal.service**), na Source Folder Principal (**src/main/java**), e clique na opção **New 🡪 Class**
2. Na janela **New Java Class**, no item **Name**, digite o nome da Classe (**UsuarioService**), e na sequência clique no botão **Finish** para concluir.

A Implementação completa da **Classe UsuarioService**, você confere abaixo:

```java
package com.generation.blogpessoal.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.generation.blogpessoal.model.UsuarioLogin;
import com.generation.blogpessoal.model.Usuario;
import com.generation.blogpessoal.repository.UsuarioRepository;
import com.generation.blogpessoal.security.JwtService;

@Service
public class UsuarioService {

	@Autowired
	private UsuarioRepository usuarioRepository;

	@Autowired
    private JwtService jwtService;

    @Autowired
    private AuthenticationManager authenticationManager;

	public Optional<Usuario> cadastrarUsuario(Usuario usuario) {

		if (usuarioRepository.findByUsuario(usuario.getUsuario()).isPresent())
			return Optional.empty();

		usuario.setSenha(criptografarSenha(usuario.getSenha()));

		return Optional.of(usuarioRepository.save(usuario));
	
	}

	public Optional<Usuario> atualizarUsuario(Usuario usuario) {
		
		if(usuarioRepository.findById(usuario.getId()).isPresent()) {

			Optional<Usuario> buscaUsuario = usuarioRepository.findByUsuario(usuario.getUsuario());

			if ( (buscaUsuario.isPresent()) && ( buscaUsuario.get().getId() != usuario.getId()))
				throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Usuário já existe!", null);

			usuario.setSenha(criptografarSenha(usuario.getSenha()));

			return Optional.ofNullable(usuarioRepository.save(usuario));
			
		}

		return Optional.empty();
	
	}	

	public Optional<UsuarioLogin> autenticarUsuario(Optional<UsuarioLogin> usuarioLogin) {
        
        // Gera o Objeto de autenticação
		var credenciais = new UsernamePasswordAuthenticationToken(usuarioLogin.get().getUsuario(), usuarioLogin.get().getSenha());
		
        // Autentica o Usuario
		Authentication authentication = authenticationManager.authenticate(credenciais);
        
        // Se a autenticação foi efetuada com sucesso
		if (authentication.isAuthenticated()) {

            // Busca os dados do usuário
			Optional<Usuario> usuario = usuarioRepository.findByUsuario(usuarioLogin.get().getUsuario());

            // Se o usuário foi encontrado
			if (usuario.isPresent()) {

                // Preenche o Objeto usuarioLogin com os dados encontrados 
			   usuarioLogin.get().setId(usuario.get().getId());
                usuarioLogin.get().setNome(usuario.get().getNome());
                usuarioLogin.get().setFoto(usuario.get().getFoto());
                usuarioLogin.get().setToken(gerarToken(usuarioLogin.get().getUsuario()));
                usuarioLogin.get().setSenha("");
				
                 // Retorna o Objeto preenchido
			   return usuarioLogin;
			
			}

        } 
            
		return Optional.empty();

    }

	private String criptografarSenha(String senha) {

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		return encoder.encode(senha);

	}

	private String gerarToken(String usuario) {
		return "Bearer " + jwtService.generateToken(usuario);
	}

}
```

Observe que foram criados os Métodos **cadastrarUsuario()** e **atualizarUsuario()**, que criptografam a senha e impedem a duplicação do usuário no Banco de dados. O Método **autenticarUsuario()**, além de autenticar o usuário no sistema, ele também gera o **Token JWT** do usuário.

Foram criados ainda 2 Métodos auxiliares: **criptografarSenha() e gerarToken()**, para realizar funções específicas na Classe de Serviço. 

Observe que no Método **autenticarUsuario**, para efetuar a autenticação do usuário foram criados Objetos das Classes **UsernamePasswordAuthenticationToken**, que cria o Objeto de autenticação (credenciais) contendo os dados do usuário (e-mail e senha) e **Authentication**, que autenticará o usuário com o Objeto de autenticação (credenciais), através do Método **authenticationManager.authenticate()**. Para checar se o usuário foi autenticado corretamente, foi utilizado o Método **authentication.isAuthenticated()**, da Classe **Authentication**.

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="220px"/> | <div align="left"> **ALERTA DE BSM: Mantenha a Atenção aos Detalhes, o cadastro de um novo usuário no sistema necessita ser validado no Banco de dados. Caso o usuário já exista, a aplicação não deve permitir que ele seja criado novamente, pois um usuário duplicado no sistema ocasionará um erro HTTP Status 500.** </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="200px"/> | <div align="left"> **ALERTA DE BSM: Mantenha a Atenção aos Detalhes, ao atualizar um usuário é importante que seja validado novamente a criptografia da senha e o usuário (e-mail). Caso não seja validado ocasionará um problema ao tentar autenticar pelo front-end da aplicação.** </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="220px"/> | <div align="left"> **ALERTA DE BSM: Mantenha a Atenção aos Detalhes, ao utilizar o Método autenticarUsuario, certifique que todos os Atributos do Objeto usuarioLogin, exceto a senha, sejam preenchidos com os dados recuperados do Banco de dados, pois o mesmo será utilizado pelo front-end da aplicação.** </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="220px"/> | <div align="left"> **ALERTA DE BSM: Mantenha a Atenção aos Detalhes, ao construir o Método gerarToken. Observe que após a palavra Bearer é obrigatório adicionar um espaço em branco, caso contrário o Token JWT não será validado pela Classe JwtService.** </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).

<br />

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/stereotype/Service.html" target="_blank"><b>Documentação: <i>@Service</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="3%"/> <a href="https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/crypto/bcrypt/BCryptPasswordEncoder.html" target="_blank"><b>Documentação: <i>BCryptPasswordEncoder - Java Doc Spring</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="30px"/> <a href="https://docs.google.com/document/d/1IQwgepFjSVCsMWiLHCidJyAj3jF2xp5h/edit" target="_blank"><b>Documentação: <i>Optional</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/essential/exceptions/throwing.html" target="_blank"><b>Documentação: Throw</b></a></div>

<br />


<h2>👣 Passo 03 - Criar a Classe UsuarioController na Camada Controller</h2>

A Classe **UsuarioController**, é responsável por fornecer o acesso aos recursos do sistema. Uma das suas funcionalidades abaixo é promover o CRUD do usuário. Além de permitir total manipulação do usuário, consumindo os serviços cadastrar usuário, atualizar usuário e autenticar da Classe UsuarioService.

1. Clique com o botão direito do mouse sobre o **Pacote Security** (**com.generation.blogpessoal.controller**), na Source Folder Principal (**src/main/java**), e clique na opção **New 🡪 Class**
2. Na janela **New Java Class**, no item **Name**, digite o nome da Classe (**UsuarioController**), e na sequência clique no botão **Finish** para concluir.

A seguir veja sua implementação:

```java
package com.generation.blogpessoal.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.generation.blogpessoal.model.UsuarioLogin;
import com.generation.blogpessoal.model.Usuario;
import com.generation.blogpessoal.repository.UsuarioRepository;
import com.generation.blogpessoal.service.UsuarioService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/usuarios")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class UsuarioController {

	@Autowired
	private UsuarioService usuarioService;

	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@GetMapping("/all")
	public ResponseEntity <List<Usuario>> getAll(){
		
		return ResponseEntity.ok(usuarioRepository.findAll());
		
	}

	@GetMapping("/{id}")
	public ResponseEntity<Usuario> getById(@PathVariable Long id) {
		return usuarioRepository.findById(id)
			.map(resposta -> ResponseEntity.ok(resposta))
			.orElse(ResponseEntity.notFound().build());
	}
	
	@PostMapping("/logar")
	public ResponseEntity<UsuarioLogin> autenticarUsuario(@RequestBody Optional<UsuarioLogin> usuarioLogin){
		
		return usuarioService.autenticarUsuario(usuarioLogin)
				.map(resposta -> ResponseEntity.status(HttpStatus.OK).body(resposta))
				.orElse(ResponseEntity.status(HttpStatus.UNAUTHORIZED).build());
	}
    

	@PostMapping("/cadastrar")
	public ResponseEntity<Usuario> postUsuario(@RequestBody @Valid Usuario usuario) {

		return usuarioService.cadastrarUsuario(usuario)
			.map(resposta -> ResponseEntity.status(HttpStatus.CREATED).body(resposta))
			.orElse(ResponseEntity.status(HttpStatus.BAD_REQUEST).build());

	}

	@PutMapping("/atualizar")
	public ResponseEntity<Usuario> putUsuario(@Valid @RequestBody Usuario usuario) {
		
		return usuarioService.atualizarUsuario(usuario)
			.map(resposta -> ResponseEntity.status(HttpStatus.OK).body(resposta))
			.orElse(ResponseEntity.status(HttpStatus.NOT_FOUND).build());
		
	}

}
```

Observe que nos Métodos Cadastrar, Atualizar e Autenticar, ao invés de usarmos a injeção de dependência da Interface UsuarioRepository, estamos utilizando a injeção de dependência da Classe de Serviço **UsuarioService** porquê os 3 Métodos foram implementados nela.

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left">ALERTA DE BSM: Mantenha a Atenção aos Detalhes, nos Métodos postUsuario e putUsuario para não esquecer a notação @Valid. Caso ela não seja inserida, ao fornecer parâmetros inválidos, o servidor retornará o HTTP Status 500, ao invés do HTTP Status 400.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).

<br />


<h2>👣 Passo 04 - Testar o Recurso Usuario no Insomnia</h2>

Vamos criar no Insomnia todas as requisições necessárias para testar os 5 Métodos do Recurso Usuario. Veja abaixo como ficam as requisições para testar o Recurso Usuario:

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="100px"/> | <div align="left"> **DICA:** *Caso você tenha alguma dúvida sobre como criar as Requisições, consulte a Documentação dos Recursos Postagem e Tema.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="120px"/> | <div align="left"> **ATENÇÃO:** *Depois de criar o Relacionamento entre Classes, todas as Consultas dos Recursos Postagem, Tema e Usuario trarão os Objetos associados.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h3>4.1. Criando a Pasta Usuario</h3>

Vamos criar dentro da **Collection Blog Pessoal** a **Pasta Usuario**, que guardará todas as requisições do **Recurso Usuario**.

1. Na **Collection Blog Pessoal**, clique no botão <img src="https://i.imgur.com/3Ou2SAZ.png" title="source: imgur.com" width="6%"/>. No menu que será aberto, clique na opção **New Folder**.

<div align="center"><img src="https://i.imgur.com/gIGZFHc.png" title="source: imgur.com" width="50%"/></div>

2. Na janela que será aberta, informe o nome da pasta (**Usuario**) e clique no botão **Create** para concluir. 

<div align="center"><img src="https://i.imgur.com/etf4wwv.png" title="source: imgur.com" width="90%"/></div>

<br />

<h3>4.2. Criando a  Requisição - Cadastrar Usuario</h3>

Vamos começar pela requisição Cadastrar Usuario porquê sem um usuário cadastrado não será possível autenticar (logar) no sistema e acessar os demais endpoints.

1. Clique com o botão direito do mouse sobre a **Pasta Usuario** para abrir o menu e clique na opção **New Request**.

<div align="center"><img src="https://i.imgur.com/gEzaJVM.png" title="source: imgur.com" /></div>

2. Será criada uma nova Requisição (New Request) dentro da pasta **Usuario**.
3. Dê um duplo clique sobre a nova requisição (**New Request**), informe o nome da requisição (indicado na imagem abaixo na cor amarela) e pressione a tecla **enter** do seu teclado.

<div align="center"><img src="https://i.imgur.com/BIsfvDG.png" title="source: imgur.com" /></div>

4. Selecione o Método HTTP que será utilizado (**POST**) na requisição, indicado na imagem abaixo na cor verde. 

<div align="center"><img src="https://i.imgur.com/TLBY2tJ.png" title="source: imgur.com" /></div>

5. No item **Body**, vamos alterar para **JSON**, como mostra a imagem abaixo. Desta forma poderemos enviar os dados do Objeto Usuario no Corpo da Requisição, no formato JSON.

<div align="center"><img src="https://i.imgur.com/PxOpzFd.png" title="source: imgur.com" /></div>

6. Observe que o item **Body** será renomeado para **JSON**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/8hDNIbh.png" title="source: imgur.com" /></div>

7. Configure a requisição conforme a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/2199dTU.png" title="source: imgur.com" /></div>

8. Observe que na requisição do tipo Post o Corpo da requisição (Request Body), deve ser preenchido com um JSON contendo o nome, o usuario(e-mail), a senha e a foto(link), que vc deseja persistir no Banco de dados.

9. Observe que depois de persistir os dados do usuario, a aplicação retornará a senha criptografada.

<div align="center"><img src="https://i.imgur.com/GPIA7LX.png" title="source: imgur.com" /></div>

<br />

<h3>4.3. Criando a Requisição - Autenticar Usuario (Login)</h3>

Usuário persistido, agora vamos efetuar o login no sistema, que nos retornará o **Token de Autorização**, que nos permitirá consumir os demais endpoints e recursos da aplicação.

1. Clique com o botão direito do mouse sobre a **Pasta Usuario** para abrir o menu e clique na opção **New Request**.

2. Será criada uma nova Requisição (New Request) dentro da pasta **Usuario**.

3. Dê um duplo clique sobre a nova requisição (**New Request**), informe o nome da requisição (indicado na imagem abaixo na cor amarela) e pressione a tecla **enter** do seu teclado.

<div align="center"><img src="https://i.imgur.com/sVVW1sF.png" title="source: imgur.com" /></div>

4. Selecione o Método HTTP que será utilizado (**POST**) na requisição, indicado na imagem abaixo na cor verde. 

<div align="center"><img src="https://i.imgur.com/TLBY2tJ.png" title="source: imgur.com" /></div>

5. No item **Body**, vamos alterar para **JSON**, como mostra a imagem abaixo. Desta forma poderemos enviar os dados do Objeto Usuario no Corpo da Requisição, no formato JSON.

<div align="center"><img src="https://i.imgur.com/PxOpzFd.png" title="source: imgur.com" /></div>

6. Observe que o item **Body** será renomeado para **JSON**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/8hDNIbh.png" title="source: imgur.com" /></div>

7. Configure a requisição conforme a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/f2NvyEo.png" title="source: imgur.com" /></div>

8. Observe que no JSON estamos passando apenas o usuário e a senha, porquê são as únicas informações que utilizaremos no login. A Classe UsuarioLogin possui outros Atributos que serão preenchidos (exceto a senha) pela aplicação (se o login for efetuado com sucesso) e retornados no JSON da resposta, como vemos na figura abaixo:

<div align="center"><img src="https://i.imgur.com/H5gkNzF.png" title="source: imgur.com" /></div>

9. Observe que o Token foi gerado e enviado na resposta. Copie o Token da resposta porquê vamos precisar dele nas próximas requisições.

<div align="center"><img src="https://i.imgur.com/GhBcfMt.png" title="source: imgur.com" /></div>

10. Caso o login falhe, você receberá o **status 403 (Forbidden)**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/PxmSjdZ.png" title="source: imgur.com" /></div>

11. Observe que na propriedade **trace** (indicada pela seta), foi lançada a Exceção **Bad Credentials**, ou seja, usuario e/ou senha incorretos.

<br />

<h3>4.4. Criando a  Requisição - Consultar todos os Usuarios - findAll()</h3>

1. Clique com o botão direito do mouse sobre a **Pasta Usuario** para abrir o menu e clique na opção **New Request**.

2. Será criada uma nova Requisição (New Request) dentro da pasta **Usuario**.

3. Dê um duplo clique sobre a nova requisição (**New Request**), informe o nome da requisição (indicado na imagem abaixo na cor amarela) e pressione a tecla **enter** do seu teclado.

<div align="center"><img src="https://i.imgur.com/Veedyux.png" title="source: imgur.com" /></div>

4. Selecione o Método HTTP que será utilizado (**GET**) na requisição, indicado na imagem abaixo na cor verde. 

<div align="center"><img src="https://i.imgur.com/mWPpKHD.png" title="source: imgur.com" /></div>

5. Configure a requisição conforme a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/sHaqXfI.png" title="source: imgur.com" /></div>

6. Como a segurança foi habilitada, caso você envie a requisição do jeito que está, você receberá o **HTTP status 401 (Unauthorized)**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/tP6IoZJ.png" title="source: imgur.com" /></div>

7. A explicação é simples: **Você precisa passar no cabeçalho da requisição o Token JWT recebido no login**, caso contrário não será possível efetuar nenhuma operação dentro da API. 

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** *No Frontend, independente de ser implementado no Angular ou no React, a passagem do Token será automatizada.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

8. Clique na Guia **Headers** e adicione uma nova linha de cabeçalho.

<div align="center"><img src="https://i.imgur.com/gEll9dH.png" title="source: imgur.com" /></div>

9. Na coluna **New header** digite **Authorization**. Na coluna **New value** da linha insira o **Token JWT** que você recebeu no Login, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/d4MGeap.png" title="source: imgur.com" /></div>

10. Agora a sua requisição funcionará!

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left">ALERTA DE BSM: Mantenha a Atenção aos Detalhes! Você deverá inserir o Token JWT no cabeçalho de todas as Requisições dos Recursos Postagem, Tema e Usuario (Exceto Cadastrar e Autenticar), caso contrário você receberá o status 401 (Unauthorized) em todas elas.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h3>4.5. Criando a  Requisição - Consultar Usuario por ID - findById(id)</h3>

1. Clique com o botão direito do mouse sobre a **Pasta Usuario** para abrir o menu e clique na opção **New Request**.

2. Será criada uma nova Requisição (New Request) dentro da pasta **Usuario**.

3. Dê um duplo clique sobre a nova requisição (**New Request**), informe o nome da requisição (indicado na imagem abaixo na cor amarela) e pressione a tecla **enter** do seu teclado.

<div align="center"><img src="https://i.imgur.com/RLUrAOZ.png" title="source: imgur.com" /></div>

4. Selecione o Método HTTP que será utilizado (**GET**) na requisição, indicado na imagem abaixo na cor verde. 

<div align="center"><img src="https://i.imgur.com/mWPpKHD.png" title="source: imgur.com" /></div>

5. Configure a requisição conforme a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/tQgQcsz.png" title="source: imgur.com" /></div>

6. Clique na Guia **Header** e adicione uma nova linha de cabeçalho.

<div align="center"><img src="https://i.imgur.com/gEll9dH.png" title="source: imgur.com" /></div>

7. Na coluna **New header** digite **Authorization**. Na coluna **New value** insira o **Token JWT** que você recebeu no Login, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/Izd1nAW.png" title="source: imgur.com" /></div>

<br />

<h3>4.6. Criando a  Requisição - Atualizar Usuário</h3>

1. Clique com o botão direito do mouse sobre a **Pasta Usuario** para abrir o menu e clique na opção **New Requisição**.

2. Será criada uma nova Requisição (New Request) dentro da pasta **Usuario**.

3. Dê um duplo clique sobre a nova requisição (**New Request**), informe o nome da requisição (indicado na imagem abaixo na cor amarela) e pressione a tecla **enter** do seu teclado.

<div align="center"><img src="https://i.imgur.com/dE5zZge.png" title="source: imgur.com" /></div>

4. Selecione o Método HTTP que será utilizado (**PUT**) na requisição, indicado na imagem abaixo na cor verde. 

<div align="center"><img src="https://i.imgur.com/z6dWHYj.png" title="source: imgur.com" /></div>

5. No item **Body**, vamos alterar para **JSON**, como mostra a imagem abaixo. Desta forma poderemos enviar os dados do Objeto Usuario no Corpo da Requisição, no formato JSON.

<div align="center"><img src="https://i.imgur.com/PxOpzFd.png" title="source: imgur.com" /></div>

6. Observe que o item **Body** será renomeado para **JSON**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/8hDNIbh.png" title="source: imgur.com" /></div>

7. Configure o endereço da requisição conforme a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/H5RRlRg.png" title="source: imgur.com" /></div>

8. Observe que na requisição do tipo **PUT** o Corpo da requisição (Request Body), deve ser preenchido com um JSON contendo o Id, o nome, o usuario (e-mail), a senha e a foto(link) que vc deseja atualizar no Banco de dados.

9. Clique na Guia **Header** e adicione uma nova linha de cabeçalho.


<div align="center"><img src="https://i.imgur.com/bRBvX71.png" title="source: imgur.com" /></div>

10. Na coluna **New header** digite **Authorization**. Na coluna **New value** insira o **Token JWT** que você recebeu no Login, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/GJq6oCf.png" title="source: imgur.com" /></div>

<br />

<h2>👣 Passo 05 - Atualizar as Requisições Cadastrar e Atualizar Postagem  no Insomnia</h2>

Como habilitamos o Relacionamento entre as Classes Postagem e Usuario, para Cadastrarmos e Alterarmos as Postagens vamos precisar atender alguns requisitos:

- O Tema e o Usuario devem ser persistidos antes de criar a nova Postagem.
- Na requisição Cadastrar e Atualizar Postagem, o JSON enviado no Corpo da Requisição deve conter um Objeto da Classe Tema identificado apenas pelo **Atributo id** e um Objeto da Classe Usuario identificado apenas pelo **Atributo id**.

<br />

<h3>5.1. Atualização - Requisição Cadastrar Postagem</h3>

Vamos alterar o Corpo da requisição (Body), conforme a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/D46gazO.png" title="source: imgur.com" /></div>

Observe que foi inserido dentro do JSON um **Objeto da Classe Usuario**, chamado **usuario**, identificado apenas pelo **Atributo id**, além do Objeto da Classe Tema, que foi inserido anteriormente.

Não esqueça de inserir o token no cabeçalho da requisição.

<div align="center"><img src="https://i.imgur.com/GJq6oCf.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | **ATENÇÃO:** *O Objeto Usuario deve ser persistido no Banco de dados antes de ser inserido no JSON da requisição Cadastrar Postagem.* |
| ------------------------------------------------------------ | :----------------------------------------------------------- |

<br />

<h3>5.2. Atualização - Requisição Atualizar Postagem</h3>

Vamos alterar o Corpo da requisição (Body), conforme a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/ovpUW1C.png" title="source: imgur.com" /></div>

Observe que foi inserido dentro do JSON um **Objeto da Classe Usuario**, chamado **usuario**, identificado apenas pelo **Atributo id**, além do Objeto da Classe Tema, que foi inserido anteriormente.

Não esqueça de inserir o token no cabeçalho da requisição.

<div align="center"><img src="https://i.imgur.com/GJq6oCf.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | **ATENÇÃO:** *O Objeto Usuario deve ser persistido no Banco de dados antes de ser inserido no JSON da requisição Atualizar Postagem.* |
| ------------------------------------------------------------ | :----------------------------------------------------------- |

<br />

<div align="center"><h2>IMPORTANTE!</h2></div>

Caso em alguma Requisição com o Token JWT inserido no cabeçalho, retorne o **HTTP status 403 (Forbidden)**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/RagAaMk.png" title="source: imgur.com" /></div>

**Significa que o Token JWT Expirou!** 

Lembre-se que o **Token JWT foi configurado com um limite de 1 hora** e depois deste período ele deixa de funcionar. Refaça o login e atualize o Token de todas as Requisições HTTP.

<br/>

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/backend_blogpessoal_v3/tree/14_Classe_UsuarioService" target="_blank"><b>Código fonte do projeto</b></a></div>


<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
