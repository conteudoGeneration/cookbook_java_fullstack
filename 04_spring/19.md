<h1>Projeto 02 - Blog Pessoal - Spring Security - Ecossistema da Segurança - Parte 03</h1>

O que veremos por aqui:

1. A Classe BasicSecurityConfig

Dando continuidade a implementação do **Ecossistema da Segurança**, vamos implementar a ultima Classe com as configurações gerais da Spring Security, a Classe **BasicSecurityConfig**.

<br />

<h2>👣 Passo 01 - Criar a Classe BasicSecurityConfig</h2>

A **Classe BasicSecurityConfig** é responsável por sobrescrever a configuração padrão da **Spring Security** e definir como ela irá funcionar. Nesta Classe vamos definir quais serão as formas de autenticação, quais endpoints serão protegidos pelo Token JWT, entre outras configurações. Depois da implementação desta Classe, aquela tela de login, que apareceu no Navegador vai ser desativada e uma nova configuração será definida como padrão.

Vamos criar e implementar a Classe **BasicSecurityConfig**:

1. Clique com o botão direito do mouse sobre o **Pacote Security** (**com.generation.blogpessoal.security**), na Source Folder Principal (**src/main/java**), e clique na opção **New 🡪 Class**
2. Na janela **New Java Class**, no item **Name**, digite o nome da Classe (**BasicSecurityConfig**), e na sequência clique no botão **Finish** para concluir.

Vejamos abaixo a implementação da Classe **BasicSecurityConfig**:

<div align="center"><img src="https://i.imgur.com/ocVNFXb.png" title="source: imgur.com" /></div>

**Linha 1:** Através do comando **package**, estamos informando o nome do pacote (camada), onde a Classe foi criada. Esta informação é inserida automaticamente pelo STS ao criar a Classe.

**Linhas 3 a 18:** Através do comando **import**, estamos indicando todos os pacotes que contém as Classes que estão sendo utilizadas na Classe **BasicSecurityConfig**.

**Linhas 20 e 21:** A Classe **BasicSecurityConfig** possui 2 anotações: 

- **@Configuration:** indica que a  Classe é do tipo configuração, ou seja, define uma Classe como fonte de  definições de Beans, além de ser uma das anotações essenciais ao utilizar uma configuração baseada em Java.
- **@EnableWebSecurity:** habilita a segurança de forma Global (toda a aplicação) e sobrescreve os Métodos que irão redefinir as regras de Segurança da sua aplicação.

> **Bean:** No Spring, os objetos que formam a espinha dorsal da sua aplicação e que são gerenciados pelo Spring são chamados de **Beans**. Um Bean é um objeto que é instanciado, montado e gerenciado pelo Spring. 
>
> Existem diversas formas de se criar Beans no Spring. Você pode criar Classes anotadas com **@Configuration** ou **@Service** para serem gerenciadas pelo Spring, assim como pode usar a anotação **@Bean** em um Método, e transformar a instância retornada pelo Método em um Objeto gerenciado pelo Spring (seja de uma Classe própria ou de terceiros).
>
> Estas Classes, que na visão do Spring são os Beans, para você nada mais são do que Classes que você irá escrever as regras de funcionamento da sua aplicação, que poderão ser utilizadas em qualquer Classe, diferente da **Injeção de Dependência** criada pela anotação **@Autowired**, que só permite o uso dentro da Classe em que foi criada.

<div align="center"><img src="https://i.imgur.com/ojvsmCS.png" title="source: imgur.com" /></div>

**Linhas 24 e 25:** Foi inserida 1 Injeção de Dependências da Classe **JwtAuthFilter**, para ter acesso ao Filtro de Servlet JWT.

**Linhas 27 a 31:** Foi implementado o Método **userDetailsService**, que retornará uma instância da Classe **UserDetailsServiceImpl**, que implementa a Interface **userDetailsService**. Nós utilizaremos este Método para validar se o usuário que está tentando se autenticar está persistido no Banco de dados da aplicação.

**Linhas 33 a 37:** Foi implementado o Método ***passwordEncoder()***, que retornará uma instância da Classe  **BCryptPasswordEncoder()**, que utiliza o algoritmo de criptografia do tipo **hash**, chamado **BCrypt**. Nós utilizaremos este Método para Criptografar e Validar a senha do usuário.

> **Hash** é um algoritmo que transforma dados de comprimento variável em dados de comprimento fixo codificados.


| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="120px"/> | <div align="left">Dica: No primeiro link abaixo você pode conhecer mais sobre o algoritmo BCrypt e no segundo link você pode testar a codificação e a decodificação de Strings geradas através do algoritmo BCrypt.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<div align="left"><img src="https://i.imgur.com/RlHVydi.png" title="source: imgur.com" width="25px"/> <a href="https://medium.com/reprogramabr/uma-breve-introdu%C3%A7%C3%A3o-sobre-bcrypt-f2fad91a7420" target="_blank"><b>Artigo: <i>Uma breve introdução sobre o BCrypt</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/RlHVydi.png" title="source: imgur.com" width="25px"/> <a href="https://bcrypt-generator.com" target="_blank"><b>Site: <i>Codificador BCrypt</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-security/site/docs/4.2.4.RELEASE/apidocs/org/springframework/security/crypto/password/PasswordEncoder.html" target="_blank"><b>Documentação: <i>Interface PasswordEncoder</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-security/site/docs/4.2.4.RELEASE/apidocs/org/springframework/security/crypto/bcrypt/BCryptPasswordEncoder.html" target="_blank"><b>Documentação: <i>Classe BCryptPasswordEncoder</i></b></a></div>

<br />

<div align="center"><img src="https://i.imgur.com/CIvXyVK.png" title="source: imgur.com" /></div>

**Linhas 38 e 39:** Foi implementado o Método **authenticationProvider**, que retornará uma instância da Classe **AuthenticationProvider**, informando o Método de autenticação que será utilizado.

**Linha 40:** Cria um Objeto da Classe **DaoAuthenticationProvider**, chamado **authenticationProvider**. A Classe **DaoAuthenticationProvider** é utilizada para autenticar um Objeto da Classe Usuario através do usuario (e-mail) e a senha, validando os dados no Banco de dados de aplicação, através da Classe **UserDetailsServiceImpl**.

**Linha 41:** Adiciona um Objeto da Classe **UserDetailsServiceImpl** através do Método **setUserDetailsService()**, que será utilizado para validar o **usuario (e-mail)** do Objeto da Classe Usuario.

**Linha 42:** Adiciona um Objeto da Classe **PasswordEncoder** através do Método **setPasswordEncoder()**, que será utilizado para validar a **senha** do Usuário.

**Linha 43:** Retorna o Objeto **authenticationProvider**.

<div align="center"><img src="https://i.imgur.com/kVyvuOK.png" title="source: imgur.com" /></div>

**Linhas 46 a 50:** O Método ***authenticationManager(AuthenticationConfiguration authenticationConfiguration)***, implementa a confguração de autenticação. Este Método utiliza o Método ***authenticationConfiguration.getAuthenticationManager()*** para procurar uma implementação da Interface **UserDetailsService** e utilizá-la para identificar se o usuário é válido ou não. Em nosso projeto Blog Pessoal, será utilizada a Classe **UserDetailsServiceImpl**, que valida o usuário no Banco de dados.

<br />

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/authentication/AuthenticationManager.html" target="_blank"><b>Documentação: <i>AuthenticationManager</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/config/annotation/authentication/configuration/AuthenticationConfiguration.html" target="_blank"><b>Documentação: <i>AuthenticationConfiguration</i></b></a></div>

<br />

<div align="center"><img src="https://i.imgur.com/7YOFm67.png" title="source: imgur.com" /></div>

**Linhas 52 a 74:** O Método ***SecurityFilterChain filterChain(HttpSecurity http)***, estamos informando ao Spring que a configuração  padrão da Spring Security será substituída por uma nova configuração. Nesta configuração iremos customizar a autenticação da aplicação desabilitando o formulário de login e habilitando a autenticação via HTTP. 

Observe que o Método **SecurityFilterChain filterChain(HttpSecurity http)** pode lançar (throws) uma Exception de **qualquer tipo da Classe Exception**. Como existem muitas possibilidades, simplificamos chamando a Classe **Exception**, que é a mãe de todas as Exceptions.

Em nosso projeto Blog Pessoal, customizamos a nossa configuração em 2 partes:

**Parte 01 - Configurações essenciais**

**Linha 55:** Através do Objeto **http**, da **Classe HttpSecurity**, configuramos a segurança baseada na Web (protocolo HTTP), para todas Requisições HTTP enviadas para esta aplicação. Por padrão, será aplicado a todas as requisições que forem recebidas, mas pode ser restringido para apenas alguns endpoints, como veremos abaixo.

**Linhas 56 e 57:** Através do Método **.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)**, definiremos que o nosso sistema não guardará sessões para o cliente. Quando o cliente fizer uma Requisição HTTP, ela deverá ter todas as informações necessárias para o servidor atender à Requisição e a mesma será finalizada com a Resposta HTTP do servidor. O servidor nunca dependerá de informações de Requisições HTTP anteriores para processar uma nova Requisição HTTP. 

**Linha 58:** Através do Método **.csrf().disable()**, iremos desabilitar a proteção que vem ativa contra ataques do tipo **CSRF (Cross-Site-Request-Forgery)**, que seria uma interceptação dos dados de autenticação antes da Requisição chegar ao servidor. Esta configuração foi desabilitada porquê o Spring Security fica procurando por um *parâmetro oculto adicional* em **qualquer** requisição do tipo **POST / PUT / DELETE**, chamado **Token CSRF**. Como ele não vai encontrar, todas as requisições diferentes de **GET** seriam bloqueadas.

**Linha 59:** Através do Método **.cors()**, vamos liberar o acesso de outras origens (Requisições de outros servidores HTTP), desta forma nossa aplicação poderá ser acessada por outros domínios, ou seja, de outros endereços, além do endereço onde a aplicação está hospedada.

> **Entendendo o CORS**
>
> Enquanto você estiver rodando o Back-end e o Front-end Localmente (localhost), não haverá nenhum problema, como mostra a imagem abaixo:
>
> <div align="center"><img src="https://i.imgur.com/3xYVwLt.png" title="source: imgur.com" /></div>
>
> Todas as Requisições tem como origem o mesmo Servidor (localhost). Agora ao efetuar o Deploy, o seu Front-end estará em um Servidor e o seu Back-end estará em outro:
>
> <div align="center"><img src="https://i.imgur.com/KKWo2Kv.png" title="source: imgur.com" /></div>
>
> No exemplo acima, o Front-end está em um servidor diferente do Back-end, logo quando o Front-end enviar uma Requisição para o Back-end, você receberá uma mensagem de erro de CORS. Para evitar este erro e permitir o recebimento de Requisições HTTP de outras origens (servidores), habilitamos o CORS em todas as Classes Controladoras da aplicação e na Classe **BasicSecurityConfig**.
>
> <div align="center"><img src="https://i.imgur.com/GFqpXeG.png" title="source: imgur.com" /></div>
>
> Com o CORS habilitado, nosso Back-end estará pronto para receber Requisições do Front-end.

<br />

**Parte 02 - Configurações específicas:**

Nesta segunda parte estamos utilizando uma Expressão Lambda (***.authorizeHttpRequests((auth) -> auth)***) para definirmos as configurações específicas da aplicação. Essa Expressão Lambda é chamada de **Lambda DSL (Domain Specific Language -  Linguagem de Domínio Específico)**, ou seja, é uma Expressão Lambda explicitamente adaptada para um uso específico (Spring Security), com o objetivo de reduzir a verbosidade do código, tornando-o mais limpo.

**Linha 61:** Através do Objeto **http**, da **Classe HttpSecurity**, vamos criar a Expressão Lambda para configurar a autenticação da nossa aplicação.

**Linha 62:** Através do Método **.authorizeHttpRequests((auth) -> auth)**, vamos implementar a Expressão Lambda para definir quais endpoints poderão acessar o sistema sem precisar de autenticação. O Objeto **auth** recebe o endereço (URI) da Requisição e checa se o endpoint necessita ou não de autenticação.

**Linhas 63 e 64:** Através dos Métodos **.requestMatchers("/usuarios/logar").permitAll() e .requestMatchers("/usuarios/cadastrar").permitAll()**, indicaremos os endereços (URI) dos endpoints, que estarão acessíveis sem autenticação. No projeto Blog Pessoal foi definido que apenas os endpoints **logar e cadastrar** serão livres de autenticação. 

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="250px"/> | <div align="left"> **ATENÇÃO:** *Os endpoints cadastrar e logar foram liberados porquê caso contrário ninguém conseguirá acessar a aplicação.* Os endereços dos endpoints: /usuarios/logar e /usuarios/cadastrar devem estar obrigatoriamente definidos na implementação da Classe UsuarioController.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

**Linha 65:** Através do Método <img src="https://i.imgur.com/sbalAQm.png" title="source: imgur.com" width="45%"/>, o parâmetro <img src="https://i.imgur.com/mDl6vKk.png" title="source: imgur.com" width="13%"/> permite que as Exceptions lançadas através do comando **throw** sejam lançadas. Sem esta linha, a Exception lançada no Método **atualizarUsuario()**, quando você tenta atualizar o atributo **usuario** com um e-mail que pertence a outro usuário, não será lançada. Ao invés de lançar a Exception, será retornado o HTTP Status acesso negado (**UNAUTHORIZED 🡪 401**), mesmo com o Token JWT sendo válido.

**Linha 66:** Através do Método **.requestMatchers(HttpMethod.OPTIONS).permitAll()**, o parâmetro **HttpMethod.OPTIONS** permite que o cliente (front-end), possa descobrir quais são as opções permitidas e/ou obrigatórias no cabeçalho da Requisição HTTP. Se o parâmetro **HttpMethod.OPTIONS** não for liberado, a aplicação não receberá o **Token JWT** através do Cabeçalho da Requisição (Header), impedindo a aplicação de responder as Requisições protegidas.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="200px"/> | <div align="left"> **ATENÇÃO:** *Liberar o parâmetro HttpMethod.OPTIONS de autenticação é essencial para o correto funcionamento do aplicação na nuvem, em especial na integração com o front-end. Sem essa configuração as requisições do front-end não serão autorizadas.*</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

**Linha 67:** Através do Método **.anyRequest().authenticated()**, informamos ao sistema que todos os endpoints que não estiverem especificados na lista acima, a autenticação será obrigatória.

**Linha 68:** Através do Método **.authenticationProvider(authenticationProvider())**, chamamos o Método **autheticationProvider()**, para efetuar a autenticação do usuário, através do Banco de dados.

**Linha 69:** Através do Método **.addFilterBefore(authFilter, UsernamePasswordAuthenticationFilter.class)**, informamos que o Filtro de Servlet **JwtAuthFilter**, deve ser aplicado antes de efetuar a autenticação do usuário, para validar a existência de um Token JWT na requisição HTTP. Neste momento, existem 2 posibilidades:

1. Se houver um Token JWT, o Filtro de Servlet JwtAuthFilter fará a validação;
2. Se não houver um Token, o processo de autenticação do usuário e geração do Token, seguirá o seu fluxo.

**Linha 70:** Através do Método **.httpBasic()**, informamos ao sistema que o servidor irá receber requisições que devem ter o esquema HTTP Basic de autenticação. Ao abrir a sua aplicação no navegador da Internet, ao invés de abrir o formulário que foi exibido ao habilitar a Spring Security, será aberta a janela abaixo:

 <div align="center"><img src="https://i.imgur.com/mBRxYd8.png" title="source: imgur.com" width="50%"/></div>

**Linha 72:** Através do Método **return http.build()**, o Objeto **http** com as configurações implementadas será instanciado.

<br />

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/config/annotation/web/builders/HttpSecurity.html" target="_blank"><b>Documentação: <i>HttpSecurity</i></b></a></div>

<div align="left"><img src=https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://spring.io/blog/2019/11/21/spring-security-lambda-dsl" target="_blank"><b>Documentação: <i>Expressões Lambda DSL</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/cDPH4tl.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Authentication" target="_blank"><b>Documentação: HTTP Basic Authentication</b></a></div>

<div align="left"><img src="https://i.imgur.com/cDPH4tl.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/HTTP/CORS" target="_blank"><b>Documentação: CORS</b></a></div>

<div align="left"><img src="https://i.imgur.com/cDPH4tl.png" title="source: imgur.com" width="30px"/> <a href="https://reflectoring.io/complete-guide-to-csrf/" target="_blank"><b>Artigo: Complete Guide to CSRF/XSRF (Cross-Site Request Forgery)</b></a></div>

<br />

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).

A Implementação completa da **Classe BasicSecurityConfig**, você confere abaixo:

```java
package com.generation.blogpessoal.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class BasicSecurityConfig {

    @Autowired
    private JwtAuthFilter authFilter;

    @Bean
    UserDetailsService userDetailsService() {

        return new UserDetailsServiceImpl();
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(userDetailsService());
        authenticationProvider.setPasswordEncoder(passwordEncoder());
        return authenticationProvider;
    }

    @Bean
    AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration)
            throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and().csrf().disable()
                .cors();

        http
                .authorizeHttpRequests((auth) -> auth
                        .requestMatchers("/usuarios/logar").permitAll()
                        .requestMatchers("/usuarios/cadastrar").permitAll()
                        .requestMatchers("/error/**").permitAll()
                        .requestMatchers(HttpMethod.OPTIONS).permitAll()
                        .anyRequest().authenticated())
                .authenticationProvider(authenticationProvider())
                .addFilterBefore(authFilter, UsernamePasswordAuthenticationFilter.class)
                .httpBasic();

        return http.build();

    }

}
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/backend_blogpessoal_v3/tree/13_Spring_Security" target="_blank"><b>Código fonte do projeto</b></a></div>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
