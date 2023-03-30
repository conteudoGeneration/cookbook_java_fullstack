<h1>Projeto 02 - Blog Pessoal - Spring Security - Ecossistema da Segurança - Parte 01</h1>

O que veremos por aqui:

1. O Ecossistema da Segurança
2. A Classe UserDetailsImpl
3. A Classe UserDetailsServiceImpl

Antes de finalizarmos o Ecossistema do Usuário, vamos compreender e implementar o **Ecossistema da Segurança**, porque utilizaremos alguns Métodos deste ecossistema na implementação das **Classes UsuarioService e UsuarioController**.

<br />

<h2>1.  Ecossistema da Segurança</h2>

O Ecossistema da Segurança é a parte responsável por efetuar a autenticação do usuário a partir de um Banco de dados. Para isso é necessário enviar o usuario (e-mail) e a senha para que o Spring Security valide a permissão do usuário no sistema e gere um Token de acesso, que será validado em todas as Requisições HTTP para os endpoints protegidos. 

O ecossistema da segurança é composto por 5 Classes:

- **UserDetailsServiceImpl**
- **UserDetailsImpl** 
- **JwtService**
- **JwtAuthFilter**
- **BasicSecurityConfig**

Vamos começar a implementar as nossas Classes.

<br />

<h2>👣 Passo 01 - Criar o Pacote Security</h2>

Primeiro vamos criar a camada de segurança, ou seja, o Pacote Security, onde as  Classes serão implementadas:

1. No lado esquerdo superior, na Guia **Package explorer**, clique com o botão direito do mouse sobre a Package **com.generation.blogpessoal**, na Source Folder **src/main/java** e clique na opção  **New 🡪 Package**.

2. Na janela **New Java Package**, no item **Name**, acrescente no final do nome da Package **.security**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/pw8NoI1.png" title="source: imgur.com" /></div>

3. Clique no botão **Finish** para concluir.

<br />

<h2>👣 Passo 02 - Criar a Classe UserDetailsImpl na Camada Security</h2>

A Classe **UserDetailsImpl** implementa a Interface **UserDetails**, que tem como principal funcionalidade fornecer as informações básicas do usuário para o Spring Security (Usuário, Senha, Direitos de acesso e as Restrições da conta). 

Após a autenticação (login) do usuário no sistema, a Classe de Serviço **UserDetailsServiceImpl** instanciará um novo Objeto da Classe **UserDetailsImpl** com os respectivos Atributos preenchidos com os dados do usuário autenticado (usuario e senha). Este Objeto também conterá todos os Métodos herdados da Interface **UserDetails**, que consultam os Direitos de acesso (roles) e implementam as restrições da conta do usuário (usuário bloqueado, senha expirada, entre outros).

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> ALERTA DE BSM: Mantenha a Atenção aos Detalhes ao construir a Classe UserDetailsImpl. Observe que no final do nome da Classe foi inserido o sufixo "Impl", que significa implements, ou seja, indica que esta Classe irá implementar a Interface UserDetails.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Vamos criar e implementar a Classe **UserDetailsImpl**:

1. Clique com o botão direito do mouse sobre o **Pacote Security** (**com.generation.blogpessoal.security**), na Source Folder Principal (**src/main/java**), e clique na opção **New 🡪 Class**
2. Na janela **New Java Class**, no item **Name**, digite o nome da Classe (**UserDetailsImpl**), e na sequência clique no botão **Finish** para concluir.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** *Por se tratar de uma Implementação de uma Interface (UserDetails), todos os Métodos da Interface devem ser implementados.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Vejamos abaixo a implementação da Classe **UserDetailsImpl**:

<div align="center"><img src="https://i.imgur.com/S7WGbU9.png" title="source: imgur.com" /></div>

> Antes de continuar, vamos relembrar **o que é uma Interface?**
>
> Uma **interface em Java**  é uma **Classe Abstrata** (uma Classe que serve de modelo para outras Classes), composta somente  por Métodos abstratos. E como tal, obviamente não pode ser instanciada,  ou seja, ela só contém as declarações dos Métodos e constantes, nenhuma  implementação, apenas as assinaturas dos Métodos, que serão  implementados em uma Classe.

**Linha 1:** Através do comando **package**, estamos informando o nome do pacote (camada), onde a Classe foi criada. Esta informação é inserida automaticamente pelo STS ao criar a Classe.

**Linhas 3 a 9:** Através do comando **import**, estamos indicando todos os pacotes que contém as Classes que estão sendo utilizadas na Classe **UserDetailsImpl**.

**Linha 11:** Observe que na assinatura da Classe foi adicionada a Implementação da Interface **UserDetails**, através da palavra reservada **implements**.

**Linha 13:** O Atributo `private static final long serialVersionUID = 1L` é um identificador da versão da Classe, utilizado para Serializar e Desserializar um Objeto de uma Classe que implementa a Interface `Serializable`. **Simplificando, usamos o atributo serialVersionUID para lembrar as versões de uma Classe que implementa a Interface Serializable, com o objetivo de  verificar se uma classe carregada e o objeto serializado são compatíveis, ou seja, se o Objeto foi gerado pela mesma versão da Classe.** Na prática, esse número seria a versão da sua Classe. Uma nova versão de uma Classe é criada sempre que você adicionar ou modificar um ou mais Atributos da Classe. Essa regra não vale para Métodos, porque a Serialização só leva em consideração os Atributos.

> **Serialização**
>
> É o processo onde o Java pega o valor de  cada atributo e  gera uma sequência de bytes. Junto com essa sequência de bytes é  acrescentado o `serialVersionUID`, que é um código de identificação (gerado via algoritmo hash), que será utilizado para identificar a versão atual da Classe.
>
> **Desserialização**
>
> É o processo inverso da Serialização, ou seja, o Java pega uma sequência de bytes e coloca nos atributos de um novo objeto. Antes de fazer isso,  ele verifica se o `serialVersionUID` salvo é igual ao serial do novo objeto que está sendo criado. Esse número é utilizado para  garantir que uma classe  carregada corresponde exatamente a um objeto serializado. Se nenhuma  correspondência do objeto for encontrada, então é lançada uma exceção do tipo **InvalidClassException**, ou seja, a versão do serial UID da classe não corresponde à do descritor de classe.
>
> Em tese, isso permite você salvar uma "fotografia" de um  Objeto, por  exemplo, num arquivo em disco e depois restaurar o objeto  com os mesmos  valores posteriormente.
>
> **Por que o Eclipse emite um aviso?**
>
> Para um objeto ser serializado ele precisa implementar a Interface `java.io.Serializable`. Se o Eclipse (ou alguma outra ferramenta que analisa o código), encontrar uma Classe que implementa a Interface `Serializable` direta ou indiretamente, ele entende que é uma boa prática especificar um `serialVersionUID`.
>
> Isso pode ocorrer se a classe:
>
> - Implementa a Interface `Serializable`;
> - Implementa uma Interface que estende (herda) a Interface `Serializable`;
> - Estende (herda) uma Classe que Implementa a Interface `Serializable`.
>
> No exemplo acima, a **Interface UserDetails** estende (herda) a **Interface Serializable**. Por isso que o Eclipse exige a inserção do Atributo **serialVersionUID** na Classe.
>
> <br />
>
> <div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="3%"/> <a href="https://www.oracle.com/br/technical-resources/articles/java/serialversionuid.html" target="_blank"><b>Documentação: <i>SerialVersionUID</i></b></a></div>
>
> <br />

**Linhas 15 e 16:** Define os Atributos **username**, que receberá o atributo usuario (e-mail) e **password**, que receberá o atributo senha, após a validação junto ao Banco de dados, no processo de autenticação (login). Os atributos **username** e **password** devem ser obrigatoriamente inseridos na lista de Atributos da Classe, devido aos Métodos **getUsername()** e **getPassword()**, assinados na Interface **UserDetails**, que retornarão os valores do atributos com os mesmos nomes.

**Linha 17:** Define o Atributo **authorities** como uma **Collection List** do tipo **GrantedAuthority**. O atributo **authorities** é responsável por receber os Direitos de Acesso do Usuário (Autorizações ou Roles), que são Objetos de uma Classe (a Classe poderia se chamar **Roles**, por exemplo), que herdará a Interface **GrantedAuthority**. O atributo **authorities** deve ser obrigatoriamente inserido na lista de Atributos da Classe, devido ao Método **getAuthorities()**, assinado na Interface **UserDetails**, que retornará uma coleção (lista) com os valores do atributo com o mesmo nome.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ATENÇÃO:** *Com o objetivo de simplificar a nossa implementação da Spring Security, nós NÃO iremos implementar os Direitos de Acesso do Usuário (Roles), ou seja, todo o Usuário autenticado terá os mesmos direitos de acesso sobre toda a aplicação. * </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

**Linhas 19 a 22:** Cria o Método Construtor da Classe **UserDetailsImpl**, com os atributos **username** e **password**, que terão os seus valores preenchidos através de um Objeto da Classe **Usuario** (parâmetro do Método Construtor), recebido no processo de autenticação via Banco de dados (veremos na implementação da Classe **UserDetailsServiceImpl** no próximo passo). Para recuperar os valores dos atributos do Objeto usuario, utilizaremos os Métodos **Get** de cada atributo (usuario e senha).

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> ALERTA DE BSM: Mantenha a Atenção aos Detalhes ao construir a Classe UserDetailsImpl.  O Método Construtor da Classe UserDetailsImpl foi adaptado para receber apenas os Atributos que serão utilizados para logar no sistema. Os Atributos em questão são usuário e senha, mas poderia receber outros atributos conforme a necessidade. Para evitar erros recomendamos não alterar o código desta Classe.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

**Linha 24:** Cria o Método Construtor da Classe **UserDetailsImpl** sem parâmetros, ou seja, Método Construtor vazio, que está Sobrecarregando o Método Construtor (Polimorfismo de Sobrecarga), que será utilizado eventualmente para gerar Objetos com os atributos não preenchidos.

<div align="center"><img src="https://i.imgur.com/hOjYDar.png" title="source: imgur.com" /></div>

**Linhas 26 a 30:** Implementa o Método **getAuthorities()**, responsável por retornar os Direitos de Acesso do Usuário (Autorizações ou Roles). Como não iremos implementar os Direitos de Acesso do Usuário, o Método sempre retornará uma Collection vazia. Observe que o Método está anotado com a anotação **@Override**, o que indica que este Método está sendo Sobrescrito (Polimorfismo de Sobrescrita), ou seja, é um Método da Interface **UserDetails**, que obrigatoriamente deve ser implementado.

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> ALERTA DE BSM: Mantenha a Atenção aos Detalhes ao construir a Classe UserDetailsImpl. Observe que na assinatura do Método getAuthorities(), nos parâmetros da Collection, foi inserido um sinal de interrogação (?). Este sinal significa que o Método pode receber um Objeto de qualquer Classe. Se os Direitos de Acesso fossem implementados, a interrogação seria substituída pelo nome da Classe responsável por definir os roles do usuário.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="120px"/> | <div align="left"> **ATENÇÃO:** *Observe que o Método getAuthorities(), que retorna a lista com os direitos de acesso do usuário, sempre retornará uma Collection vazia, porquê este Atributo não pode ser Nulo. Com o objetivo de simplificar a nossa implementação, todo o Usuário autenticado terá os mesmos direitos de acesso sobre toda a aplicação. * </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

**Linhas 32 a 42:** Implementa os Métodos **getUsername()** e **getPassword()**, que retornarão os valores do atributos **username** e **password**. Observe que os dois Métodos estão anotados com a anotação **@Override**, o que indica que estes Métodos estão sendo Sobrescritos (Polimorfismo de Sobrescrita), ou seja, são Métodos da Interface **UserDetails**, que obrigatoriamente devem ser implementados.

<div align="center"><img src="https://i.imgur.com/nAGfyXO.png" title="source: imgur.com" /></div>

**Linhas 44 a 62:** Implementa os Métodos que contém as propriedades do usuário. Não confundir propriedades com Direitos de Acesso. Na tabela abaixo, temos a descrição dos Métodos:

<h3>Métodos da Interface UserDetails com as Propriedades do usuário:</h3>

| Método                        | Descrição                                                    |
| ----------------------------- | ------------------------------------------------------------ |
| **isAccountNonExpired()**     | Indica se o acesso do usuário expirou (tempo de acesso). Uma conta expirada não pode ser autenticada (return false). |
| **isAccountNonLocked()**      | Indica se o usuário está bloqueado ou desbloqueado. Um usuário bloqueado não pode ser autenticado (return false). |
| **isCredentialsNonExpired()** | Indica se as credenciais do usuário (senha) expiraram (precisa ser trocada). Senha expirada impede a autenticação (return false). |
| **isEnabled()**               | Indica se o usuário está habilitado ou desabilitado. Um usuário desabilitado não pode ser autenticado (return false). |

Observe que todos estes Métodos são do tipo boolean. Para simplificar a nossa implementação da Spring Security, todos eles irão retornar o valor **`true`**.

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="100px"/> | <div align="left"> ALERTA DE BSM: Mantenha a Atenção aos Detalhes ao construir a Classe UserDetailsImpl. Se qualquer um destes 4 Métodos retornar o valor `false`, nenhum usuário conseguirá autenticar no sistema.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).

A Implementação completa da **Classe UserDetailsImpl**, você confere abaixo:

```java
package com.generation.blogpessoal.security;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.generation.blogpessoal.model.Usuario;

public class UserDetailsImpl implements UserDetails {

	private static final long serialVersionUID = 1L;

	private String userName;
	private String password;
	private List<GrantedAuthority> authorities;

	public UserDetailsImpl(Usuario user) {
		this.userName = user.getUsuario();
		this.password = user.getSenha();
	}

	public UserDetailsImpl() {	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {

		return authorities;
	}

	@Override
	public String getPassword() {

		return password;
	}

	@Override
	public String getUsername() {

		return userName;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
```

<br />

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/core/userdetails/UserDetails.html" target="_blank"><b>Documentação: <i>Interface UserDetails</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/core/GrantedAuthority.html"><b>Documentação: <i>Método GrantedAuthority</i></b></a></div>

<br />

<h2>👣 Passo 02 - Criar a Implementação da Classe UserDetailsServiceImpl</h2>

A Classe **UserDetailsServiceImpl** é uma implementação da Interface **UserDetailsService**, responsável por validar a existência de um usuário no sistema através do Banco de dados e retornar um Objeto da Classe **UserDetailsImpl** (implementada no passo anterior), com os dados do Objeto encontrado no Banco de dados. A busca será feita através do atributo usuario (e-mail).

A Interface **UserDetailsService** permite autenticar um usuário baseando-se na sua existência no Banco de dados (em nosso caso na tabela **tb_usuarios**). Vale lembrar que para isso é necessário que ao persistir o usuário no Banco de dados, **a senha deve estar obrigatoriamente criptografada**, como veremos na implementação da Classe **UsuarioService**, utilizando um algoritmo hash de criptografia, e **o usuario (e-mail) deve ser único no sistema**, ou seja, não podem existir 2 usuários com o mesmo e-mail. 

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> ALERTA DE BSM: Mantenha a Atenção aos Detalhes ao construir a Classe UserDetailsServiceImpl. Observe que no final do nome da Classe foi inserido o sufixo "Impl", que significa implements, ou seja, indica que esta Classe irá implementar a Interface UserDetailsService.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/oScAYGc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** *Gravar a senha criptografada no Banco de dados não é opcional, é obrigatório por lei. A LGPD (Lei Geral de Proteção de Dados) determina que apenas o próprio usuário pode conhecer a sua senha.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Vamos criar e implementar a Classe **UserDetailsServiceImpl**:

1. Clique com o botão direito do mouse sobre o **Pacote Security** (**com.generation.blogpessoal.security**), na Source Folder Principal (**src/main/java**), e clique na opção **New 🡪 Class**
2. Na janela **New Java Class**, no item **Name**, digite o nome da Classe (**UserDetailsServiceImpl**), e na sequência clique no botão **Finish** para concluir.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** *Por se tratar de uma Implementação de uma Interface (UserDetailsService), todos os Métodos da Interface devem ser implementados.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Vejamos abaixo a implementação da Classe **UserDetailsServiceImpl**:

<div align="center"><img src="https://i.imgur.com/CTpvc6o.png" title="source: imgur.com" /></div>

**Linha 1:** Através do comando **package**, estamos informando o nome do pacote (camada), onde a Classe foi criada. Esta informação é inserida automaticamente pelo STS ao criar a Classe.

**Linhas 3 a 14:** Através do comando **import**, estamos indicando todos os pacotes que contém as Classes que estão sendo utilizadas na Classe **UserDetailsServiceImpl**.

**Linha 16:** A Classe foi anotada com a anotação **@Service**, o que indica que esta Classe é uma **Classe de Serviço**. **Classe de Serviço** é uma Classe responsável por implementar as regra de negócio e as tratativa de dados de uma parte do ou recurso do sistema.

**Linha 17:** Observe que na assinatura da Classe foi adicionada a Implementação da Interface **UserDetailsService**, através da palavra reservada **implements**.

**Linhas 19 e 20:** A anotação **@Autowired** (Injeção de Dependência), cria um ponto de Injeção da **Interface UsuarioRepository** na Classe **UserDetailsServiceImpl**, permitindo acessar os Métodos de interação com os Objetos da Classe Usuario, persistidos no Banco de dados da aplicação.

<div align="center"><img src="https://i.imgur.com/8k8YO2j.png" title="source: imgur.com" /></div>

**Linha 22:** Observe que o Método  **loadUserByUsername(String username)** está anotado com a anotação **@Override**, o que indica que este Método está sendo Sobrescrito (Polimorfismo de Sobrescrita), ou seja, é um Método da Interface **UserDetails**, que obrigatoriamente deve ser implementado.

**Linha 23:** Implementa o Método **loadUserByUsername(String username)**, da Interface **UserDetailsService**, que receberá o usuário através da tela de login do sistema.

**Linha 25:** Cria um Objeto da Classe Optional do tipo Usuario, que receberá o retorno da Query Method **findByUsuario(String usuario)**, implementada na Interface **UsuarioRepository**, para checar se o usuário digitado está persistido no Banco de dados, ou seja, se ele existe. 

**Linhas 27 a 30:** Caso o Objeto usuario esteja persistido no Banco de dados (**isPresent()**), ele executa o Método Construtor da Classe **UserDetailsImpl**, passando o Objeto **usuario** como parâmetro. Observe que foi utilizado Método **get()** do Objeto usuario por se tratar de um Objeto encapsulado em um Objeto da Classe **Optional**. Caso o usuário não seja encontrado, será devolvido o **HTTP Status 403 - FORBIDDEN** (Acesso Proibido - você está tentando alcançar um endereço ou um site ao qual está proibido de acessar).

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> ALERTA DE BSM: Mantenha a Atenção aos Detalhes ao construir a Classe UserDetailsServiceImpl. Ao criar uma Classe de Serviço, não esqueça de colocar a anotação @Service. </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/core/userdetails/UserDetailsService.html" target="_blank"><b>Documentação: <i>Interface UserDetailsService</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/cDPH4tl.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Status/403" target="_blank"><b>Documentação: HTTP Status Code 403 - Forbidden</b></a></div>

<br />

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).

A Implementação completa da **Classe UserDetailsServiceImpl**, você confere abaixo:

```java
package com.generation.blogpessoal.security;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.generation.blogpessoal.model.Usuario;
import com.generation.blogpessoal.repository.UsuarioRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	private UsuarioRepository usuarioRepository;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

		Optional<Usuario> usuario = usuarioRepository.findByUsuario(userName);

		if (usuario.isPresent())
			return new UserDetailsImpl(usuario.get());
		else
			throw new ResponseStatusException(HttpStatus.FORBIDDEN);
			
	}
}
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/backend_blogpessoal_v3/tree/13_Spring_Security" target="_blank"><b>Código fonte do projeto</b></a></div>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
