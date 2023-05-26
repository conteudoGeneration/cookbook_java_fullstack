<h1>Projeto 02 - Blog Pessoal - Spring Security - Ecossistema da Segurança - Parte 02</h1>

O que veremos por aqui:

1. A Classe JwtService
3. A Classe JwtAuthFilter

Dando continuidade a implementação do **Ecossistema da Segurança**, vamos implementar as Classes de implementação do JWT.

<br />

<h2>👣 Passo 01 - Criar a Classe JwtService</h2>

A **Classe JwtService** é responsável por criar e validar o Token JWT. O Token JWT será criado durante o processo de autenticação (login) do usuário e o mesmo será validado em todas as requisições HTTP enviadas para os endpoints protegidos, que serão definidos na Classe **BasicSecurityConfig**, que será implementada mais à frente. 

Esta Classe deve ser anotada com a anotação **@Component**, que indica que a Classe **JwtService** é uma Classe de Componente, que pode Injetar e Instanciar qualquer Dependência especificada na implementação da Classe, em qualquer outra Classe, sempre que necessário. Vale mencionar que os Métodos definidos nesta Classe são de extrema importância para a Spring Security. 

>**@Component:** é uma anotação genérica para qualquer componente gerenciado pelo Spring. O Spring fornece algumas anotações especializadas, como: **@Controller** e **@Service**. Todas elas fornecem a mesma função que a anotação **@Component**. Todas elas agem da mesma forma, porque são anotações compostas internamente pela anotação **@Component**. Elas são como "alias" (apelido) para a anotação **@Component**, entretanto cada uma possui usos especializados e específicos.
>
>O grande diferencial desta anotação é que ela é detectada automaticamente pelo Spring, ou seja, não é necessário instanciar um Objeto ou indicar um uso específico (Service, Controller, Repository, entre outros).

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ATENÇÃO:** *O uso da Classe de Componente não se restringe apenas a Spring Security, ela pode ser utilizada em qualquer recurso da aplicação, conforme a necessidade.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

Vamos criar e implementar a Classe **JwtService**:

1. Clique com o botão direito do mouse sobre o **Pacote Security** (**com.generation.blogpessoal.security**), na Source Folder Principal (**src/main/java**), e clique na opção **New 🡪 Class**
2. Na janela **New Java Class**, no item **Name**, digite o nome da Classe (**JwtService**), e na sequência clique no botão **Finish** para concluir.

Vejamos abaixo a implementação da Classe **JwtService**:

<div align="center"><img src="https://i.imgur.com/pQzSTYk.png" title="source: imgur.com" /></div>

**Linha 1:** Através do comando **package**, estamos informando o nome do pacote (camada), onde a Classe foi criada. Esta informação é inserida automaticamente pelo STS ao criar a Classe.

**Linhas 3 a 16:** Através do comando **import**, estamos indicando todos os pacotes que contém as Classes que estão sendo utilizadas na Classe **JwtService**.

**Linha 18:** A Classe foi anotada com a anotação **@Component**, o que indica que esta Classe é uma **Classe de Componente**. **Classe de Componente** é uma Classe gerenciada pelo Spring, que permite Injetar e Instanciar qualquer Dependência especificada na implementação da Classe, em qualquer outra Classe, sempre que necessário.

**Linha 21:** Foi criado o atributo **SECRET**. Este atributo armazenará a Chave de assinatura do Token JWT (secret). Este Atributo foi definido com o modificador **final**, porque este valor será constante, ou seja, nunca será modificado. Foi definido também o modificador **static**, porque o atributo deve estar associado <u>**apenas e exclusivamente**</u> a esta Classe, ou seja, é uma variável de Classe e não do Objeto.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** *Variáveis do tipo final são definidas com todas as letras maiúsculas, para indicar que são constantes.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

O valor atribuído ao atributo **SECRET** é uma chave encriptada aleatória, gerada através do algoritmo de Criptografia  **AES**. 

> O **Advanced Encryption Standard (AES)** é uma especificação para a criptografia de dados eletrônicos estabelecida pelo Instituto Nacional de Padrões e Tecnologia (NIST) dos EUA em 2001. AES é amplamente utilizado hoje em dia, pois é um algoritmo que geram chaves muito fortes, difíceis de serem quebradas.

Para gerar esta chave, utilizamos o site All Keys Generator (**https://www.allkeysgenerator.com/**), que permite gerar chaves encriptadas aleatórias de diversos formatos e tamanhos:

<div align="center"><img src="https://i.imgur.com/3ugs6EB.png" title="source: imgur.com" /></div>

Para gerar a nossa Chave de 256 bits, selecionamos a aba **256-bit** e marcamos a opção **Hex**, para converter a String gerada para o formato **Hexadecimal**. Na sequência, copiamos a Chave e inserimos o valor no atributo **SECRET**.

> **Hexadecimal é o sistema numérico de base 16, que utiliza os símbolos 0–9 e A–F para representar os seus elementos**.
>
> **Exemplo:**
>
> O número decimal 79, representado pelo Sistema Binário é  **01001111** 
>
> No **Sistema Hexadecimal** ele pode ser escrito como **4F** 
>
> ***4** = 0100*
>
> ***F** = 1111*
>
> Cada dígito Hexadecimal consegue representar 4 bits do Sistema Binário.

<div align="center"><img src="https://i.imgur.com/jpvL2k4.png" title="source: imgur.com" /></div>

O Método **Key getSignKey()** é responsável por codificar a **SECRET** em **Base 64** e gerar a Assinatura (**Signature**) do Token JWT, codificada pelo Algoritmo **HMAC SHA256**.

> **Base64** é um método para codificação de dados para transferência de conteúdo na Internet. É utilizado frequentemente para transmitir dados binários por meios de  transmissão que lidam apenas com texto, como por exemplo para enviar, arquivos anexos por e-mail.
>
> **HMAC SHA256 (HS256)** é um tipo de algoritmo de hash, com chave, que é construído a partir da função hash **SHA-256** e usado como um código de autenticação de mensagem baseado em hash (HMAC). 
>
> **HS256** é um método de assinatura simétrica. Isso significa que a mesma chave secreta é usada para criar e verificar a própria assinatura. O emissor anexa o cabeçalho JWT e a carga com a chave secreta e faz o hash do resultado usando SHA256, criando uma assinatura. O destinatário usa suas cópias da chave secreta, cabeçalho JWT e carga útil da mesma maneira para reproduzir a assinatura, verificando se eles correspondem.

**Linha 23:** Observe que o Método **getSignKey()**, retornará um Objeto da Interface **Key**, que é responsável por definir as 3 características compartilhadas por todos os objetos do tipo key (Chave de assinatura): *Algoritmo, Codificação e Formato*.

**Linha 24:** Foi criado um vetor (array), chamado **keyBytes**, tipo Byte para receber o resultado da codificação em Base 64. O vetor (array) **keyBytes** foi definido com o tipo Byte, porque durante o processo de codificação é necessário trabalhar diretamente com os bits (0 e 1) da String. Para codificar a **SECRET**, foi utilizado o Método **decode()**, da Classe **Decoders**.

**Linha 25:** Através do Método ***hmacShaKeyFor*(keyBytes)**, da Classe **Keys**, o método retornará a Chave de assinatura do Token JWT codificada pelo Algoritmo **HMAC SHA256**.

<br />

<div align="left"><img src="https://i.imgur.com/RlHVydi.png" title="source: imgur.com" width="25px"/> <a href="https://pt.wikipedia.org/wiki/Base64" target="_blank"><b>Codificação em Base 64</b></div>

<div align="left"><img src="https://i.imgur.com/RlHVydi.png" title="source: imgur.com" width="25px"/> <a href="https://www.base64url.com" target="_blank"><b>Ferramenta: Codificador Base 64 - Ferramenta online para codificar e decodificar Strings no modelo Base 64</b></a></div>

<div align="left"><img src="https://i.imgur.com/RlHVydi.png" title="source: imgur.com" width="25px"/> <a href="https://pt.wikipedia.org/wiki/HMAC" target="_blank"><b>Algoritmo HMAC.</b></div>

<div align="left"><img src="https://i.imgur.com/RlHVydi.png" title="source: imgur.com" width="25px"/> <a href="https://pt.wikipedia.org/wiki/SHA-2" target="_blank"><b>Algoritmo SHA256.</b></div>

<div align="left"><img src="https://i.imgur.com/RlHVydi.png" title="source: imgur.com" width="25px"/> <a href="https://www.allkeysgenerator.com" target="_blank"><b>Ferramenta: All Keys Generator</b></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.oracle.com/javase/7/docs/api/java/security/Key.html" target="_blank"><b>Documentação: <i>Interface Key</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://javadoc.io/doc/io.jsonwebtoken/jjwt-api/0.11.2/io/jsonwebtoken/security/Keys.html" target="_blank"><b>Documentação: <i>Classe Keys</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://javadoc.io/static/io.jsonwebtoken/jjwt-api/0.11.2/io/jsonwebtoken/io/Decoders.html" target="_blank"><b>Documentação: <i>Classe Decoders</i></b></a></div>

<br />

<div align="center"><img src="https://i.imgur.com/CrymkEP.png" title="source: imgur.com" /></div>

O Método **extractAllClaims(String token)** retorna todas as **claims**, inseridas no **Payload** do Token JWT.

> Claims são declarações inseridas no payload do Token JWT, ou seja, são informações declaradas sobre um assunto. 
>
> **Exemplo:**
>
> ```json
> {
> 	"sub": "admin@email.com.br"
> }
> ```
>
> **sub** é uma **claim**, que contém o e-mail do usuário. 

**Linhas 28:** Observe a assinatura do Método **extractAllClaims(String token)**, que ele retornará um Objeto da Interface  **Claims**. Observe que o Método possui um parâmetro String, chamado **token**, que receberá o Token JWT enviado no Cabeçalho da Requisição HTTP.

**Linhas 29 a 31:** Através do Método **parserBuilder()**, da Classe **Jwts**, será criada uma nova instância da **Interface JWT**. O Método **setSigningKey(getSignKey()).build()**, da Interface **JwtParserBuilder**, verifica se a assinatura do Token JWT é válida. Caso seja válida, o Método **parseClaimsJws(token).getBody()**, da Interface **JwtParser**, extrai todas as claims do corpo do Token e retorna todas as claims encontradas, através do comando **return**.

<br />

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://javadoc.io/static/io.jsonwebtoken/jjwt-api/0.11.2/io/jsonwebtoken/Claims.html" target="_blank"><b>Documentação: <i>Interface Claims</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://javadoc.io/static/io.jsonwebtoken/jjwt-api/0.11.2/io/jsonwebtoken/Jwts.html" target="_blank"><b>Documentação: <i>Classe Jwts</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://javadoc.io/static/io.jsonwebtoken/jjwt-api/0.11.2/io/jsonwebtoken/Jwt.html" target="_blank"><b>Documentação: <i>Interface Jwt</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://javadoc.io/static/io.jsonwebtoken/jjwt-api/0.11.2/io/jsonwebtoken/JwtParserBuilder.html" target="_blank"><b>Documentação: <i>Interface JwtParserBuilder</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://javadoc.io/static/io.jsonwebtoken/jjwt-api/0.11.2/io/jsonwebtoken/JwtParserBuilder.html" target="_blank"><b>Documentação: <i>Interface JwtParser</i></b></a></div>

<br />

<div align="center"><img src="https://i.imgur.com/ZffyTPc.png" title="source: imgur.com" /></div>

O Método **extractClaim(String token, Function< Claims, T > claimsResolver)** retorna uma **claim** específica, inserida no **Payload** do Token JWT.

**Linhas 34:** Observe a assinatura do Método **extractClaim(String token, Function<Claims, T> claimsResolver)**, que ele possui 2 parâmetros. O primeiro é um parâmetro do tipo String, chamado **token**, que receberá o Token JWT enviado no Cabeçalho da Requisição HTTP. O Segundo ele recebe um parâmetro do tipo **Function** com 2 argumentos: **Claims** e T. Observe que **T** é o retorno deste Método também. **Function** é uma Interface Funcional do Java, que neste exemplo receberá 2 parâmetros T. O primeiro é o tipo de entrada, em nosso exemplo ela receberá um Objeto da Classe Claim e o segundo é o tipo de saída, ou seja, receberá o Método get equivalente a claim que se deseja recuperar o valor

**Exemplo:**

```java
extractClaim(token, Claims::getSubject);
```

No exemplo acima, a **Interface Funcional Function** recebeu como entrada a Classe **Claims** e na saída, receberá a execução do Método **getSubject()**, que está sendo chamado através do operador de referência de métodos (**::**), que retorna o valor da claim **sub**. Por isso que o Retorno do Método **extractClaim** será **T**, porque o tipo do parâmetro  **T** vai depender do Método **get** referenciado no parâmetro da Interface Funcional **Function< Claims, T > claimsResolver**.

> **Interfaces Funcionais (Functional Interfaces)** são interfaces que têm um único Método Abstrato a ser  implementado. Isso significa que toda Interface criada que respeite esta premissa, torna-se automaticamente uma Interface Funcional. Um ponto importante que deve ser destacado é que o compilador Java reconhece automaticamente essas Interfaces e a partir da Expressão Lambda enviada, ele sabe exatamente qual Operação será executada pelo Método da Interface.
>
> O **Operador ::** faz parte de uma expressão que faz **Referência a um Método (Method References)**, complementando uma **Expressão Lambda**. Uma **Expressão Lambda** é como um trecho de código que você pode passar como argumento para um método. Só que às vezes esse trecho de código se repete ou já  está implementado em algum método, portanto, você pode simplesmente referenciar um método qualquer.

**Linha 35:** Cria um Objeto final, da Interface Claims, que receberá a execução do Método **extractAllClaims(String token)**, que retornará todas as claims que forem encontradas no corpo do token enviado no parâmetro do Método. 

**Linha 36:** O Método **get** enviado no parâmetro da Interface Funcional **Function< Claims, T > claimsResolver**, será executado, através do Método **claimsResolver.apply(claims)**, da Interface Funcional Function. Como parâmetro do Método **apply()**, será utilizado o Objeto **claims**, que contém todas as claims obtidas através do Método **extractAllClaims(String token)**.

<br />

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/8/docs/api/java/util/function/Function.html" target="_blank"><b>Documentação:</b><i> Interface Funcional Function< T, T ></i></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/java/javaOO/lambdaexpressions.html" target="_blank"><b>Documentação:</b><i> Expressões Lambda</i></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/java/javaOO/methodreferences.html" target="_blank"><b>Documentação:</b><i> Operador de Referência de Métodos</i></a></div>

<br />

<div align="center"><img src="https://i.imgur.com/Fb06XGY.png" title="source: imgur.com" /></div>

O Método **extractUsername(String token)** recupera os dados da Claim **sub**, onde se encontra o usuario (e-mail), através do Método **extractClaim(String token, Function< Claims, T > claimsResolver)**. 

A **Interface Funcional Function** recebeu como entrada a Classe **Claims** e na saída, receberá a execução do Método **getSubject()**, que está sendo chamado através do operador de referência de métodos (**::**), que retorna o valor da claim **sub**. 

<div align="center"><img src="https://i.imgur.com/SHFXJ0c.png" title="source: imgur.com" /></div>

O Método **extractExpiration(String token)** recupera os dados da Claim **exp**, onde se encontra a data e o horário de expiração do Token JWT, através do Método **extractClaim(String token, Function< Claims, T > claimsResolver)**. 

A **Interface Funcional Function** recebeu como entrada a Classe **Claims** e na saída, receberá a execução do Método **getExpiration()**, que está sendo chamado através do operador de referência de métodos (**::**), que retorna o valor da claim **exp**. 

<div align="center"><img src="https://i.imgur.com/UQvsckV.png" title="source: imgur.com" /></div>

O Método **isTokenExpired(String token)** recupera os dados da Claim **exp**, onde se encontra a data e o horário de expiração do Token JWT, através do Método **extractExpiration(String token)** e verifica através do Método **before()**, da Classe **Date**, se o token está ou não expirado (fora da data e hora de validade). Se a data e a hora do token for anterior a data e hora atual, o Token JWT estará expirado, o Método retornará **true** e será necessário autenticar novamente para gerar um novo Token JWT válido. 

<br />

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/8/docs/api/java/util/Date.html" target="_blank"><b>Documentação:</b><i> Classe Date</i></a></div>

<br />

<div align="center"><img src="https://i.imgur.com/IiyVyri.png" title="source: imgur.com" /></div>

O Método **validateToken(String token, UserDetails userDetails)** valida se o Token JWT pertence ao usuário que enviou o token através do Cabeçalho de uma requisição HTTP, na propriedade **Authorization**. O Método recebe 2 parâmetros: O **Token JWT** (token) e o Objeto da Classe **UserDetailsImpl** (implementação da Interface UserDetails), contendo as credenciais, autorizações e propriedades do usuário autenticado. 

Na imagem abaixo, vemos o Cabeçalho de uma Requisição HTTP com o **Token Bearer**, na propriedade **Authorization**:

<div align="center"><img src="https://i.imgur.com/rvvLw2X.png" title="source: imgur.com" /></div>

**Linha 52:** Cria um Objeto final, do tipo String, chamado **username**, que receberá a execução do Método **extractUsername(String token)**, que retornará a claim **sub** (subject), que contém o usuario autenticado (e-mail), que foi inserido no corpo do token, que foi enviado no parâmetro do Método. 

**Linha 53:** O Método retornará **true** se o u**suario que foi extraído do token (claim sub)**, for igual ao **usuario autenticado (atributo username do Objeto da Classe UserDetails)** e o **token não estiver expirado** (**!isTokenExpired(token)**). Para checar o usuario, foi utilizado método **equals()** da Classe String. Para checar se o token expirou, foi utilizado o Método **isTokenExpired(String token)**.

<br />

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/core/userdetails/UserDetails.html" target="_blank"><b>Documentação: <i>Interface UserDetails</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/String.html" target="_blank"><b>Documentação:</b><i> Classe String</i></a></div>

<br />

<div align="center"><img src="https://i.imgur.com/RFBoBVb.png" title="source: imgur.com" /></div>

O Método **createToken(Map<String, Object> claims, String userName)** cria o Token JWT. O Método recebe 2 parâmetros: uma **Collection Map**, chamada **claims**, que será utilizada para receber Claims personalizadas e um Objeto da Classe **String**, chamado **userName**, contendo o usuário autenticado (e-mail). 

> A **Collection Map** define um array associativo, isto é, ao invés de utilizar números inteiros como índices, objetos são utilizados como chaves para recuperar os elementos armazenados nesta Collection.  As chaves não podem se repetir (seguindo o mesmo princípio da interface Set), mas os valores podem ser repetidos para chaves diferentes. Um Map também não possui necessariamente uma ordem definida para percorrer a  coleção.

**Linha 57:** O Método **builder()**, da Classe **Jwts** é responsável por criar o Token, a partir dos Métodos inseridos logo abaixo, que contém os detalhes da construção do Token JWT.

**Linha 58:** O Método **.setClaims(claims)**, da Classe **Jwts** é responsável por inserir as claims personalizadas no Payload do Token JWT.

**Linha 59:** O Método **.setSubject(userName)**, da Classe **Jwts** é responsável por inserir a **claim sub (subject)**, preenchida com o usuario (e-mail), no Payload do Token JWT. 

**Linha 60:** O Método **.setIssuedAt(new Date(System.*currentTimeMillis*()))**, da Classe **Jwts** é responsável por inserir a **claim iat (issued at - data e hora da criação)**, preenchida com a data e a hora (incluindo os milissegundos da hora) exata do momento da criação do token, no Payload do Token JWT. 

**Linha 61:** O Método **.setExpiration(new Date(System.*currentTimeMillis*() + 1000 * 60 * 60))**, da Classe **Jwts** é responsável por inserir a **claim exp (expiration - data e hora da expiração)**, preenchida com a data e a hora (incluindo os milissegundos da hora) exata do momento da criação do token, somada **ao tempo limite do token**, no Payload do Token JWT.  Em nosso exemplo, o limite de expiração do Token é de **60 minutos 🡪 1 hora**.

> **Como chegamos no valor de 60 minutos?**
>
> 1000 🡪 1 ms (milissegundo)
>
> 1000 * 60 = 60.000 ms (milissegundos) 🡪 1 m (minuto)
>
> 60.000 * 60 = 3.600.000 ms (milissegundos) 🡪 60 m (minutos) 🡪 1 h (hora)
>
> 1000 * 60 * 60 = 3.600.000 milissegundos 🡪 1 hora

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** *Em produção, por questões de segurança, o tempo de expiração recomendado para o Token JWT é de no máximo 15 minutos.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

**Linha 62:** O Método **.signWith(getSignKey(), SignatureAlgorithm.HS256).compact()**, da Classe **Jwts**, é responsável por inserir a assinatura do Token (Método **getSignKey()**) e o Algoritmo de Encriptação do Token JWT (**HMAC SHA256 - HS256**) do Token JWT. O Método **.compact()** finaliza a criação do Token JWT e o serializa em uma String compacta e segura para URL, de acordo com as regras do JWT.

O **Algoritmo de Encriptação do Token JWT** será inserido no **Header** (Cabeçalho do Token JWT), na forma de um Objeto JSON, como vemos no exemplo abaixo, retirado de um Token JWT, através da **Ferramenta Debugger do JWT**:

```json
{
  "alg": "HS256"
}
```

A Assinatura, devido aos vários processos de codificação e encriptação, não é possível de visualizar através do **Ferramenta Debugger do JWT**. A  Assinatura não é tão simples de decodificar, porquê além de usar o Algoritmo **HMAC SHA256**, também seria necessário criar um algoritmo específico para checagem de Chave Pública e Chave Privada, além de conhecer a Secret Key previamente.

<br />

<div align="left"><img src="https://i.imgur.com/WeNdbPo.png" title="source: imgur.com" width="35px"/> <a href="https://jwt.io/introduction" target="_blank"><b>Documentação: JWT - JSON WEB Token</b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/tutorial/collections/interfaces/map.html" target="_blank"><b>Artigo:</b><i> Java Tutorials: Collection Map</i></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/8/docs/api/java/util/Map.html" target="_blank"><b>Artigo:</b><i> Documentação: Interface Map</i></a></div>

<br />

<div align="center"><img src="https://i.imgur.com/GdaagMf.png" title="source: imgur.com" /></div>

O Método **generateToken(String userName)** é responsável por gerar um novo Token a partir do usuario (e-mail), que será recebido através do parâmetro **username**. Este Método será utilizado na Classe de Serviço do Usuario (UsuarioService), para criar um Token JWT sempre que o usuário se autenticar e o Token estiver expirado ou ainda não tiver sido gerado.

**Linha 66:** Cria uma Collection **Map**, chamada **claims**, para enviar as claims personalizadas. Como não enviaremos nenhuma claim personalizada em nosso Token JWT, ela permanecerá vazia e será enviada como parâmetro do Método **createToken**.

> A implementação **HashMap**, da **Collection Map**, armazena os objetos em forma de par **chave-valor**. Além disso, a implementação **HashMap** não mantém os Objetos ordenados, chaves duplicadas não são permitidas e permite vários Objetos com valores nulos.

**Linha 67:** Retorna a execução do Método **createToken(claims, userName)**, que criará o Token JWT. O Método recebe 2 parâmetros: a **Collection Map**, chamada **claims** e um Objeto da Classe **String**, chamado **userName**, contendo o usuário autenticado (e-mail), recebido no parâmetro do Método **generateToken(String userName)**. 

O Método **generateToken(String userName)**, ao ser executado, irá gerar um Token JWT, semelhante ao da imagem abaixo:

<div align="center"><img src="https://i.imgur.com/Y4X2KzV.png" title="source: imgur.com" /></div>

O Token acima, está estruturado da seguinte forma:

<div align="center"><img src="https://i.imgur.com/EEoVRt4.png" title="source: imgur.com" /></div>

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**).

A Implementação completa da **Classe JwtService**, você confere abaixo:

```java
package com.generation.blogpessoal.security;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;

@Component
public class JwtService {

	public static final String SECRET = "5367566B59703373367639792F423F4528482B4D6251655468576D5A71347437";

	private Key getSignKey() {
		byte[] keyBytes = Decoders.BASE64.decode(SECRET);
		return Keys.hmacShaKeyFor(keyBytes);
	}

	private Claims extractAllClaims(String token) {
		return Jwts.parserBuilder()
				.setSigningKey(getSignKey()).build()
				.parseClaimsJws(token).getBody();
	}

	public <T> T extractClaim(String token, Function<Claims, T> claimsResolver) {
		final Claims claims = extractAllClaims(token);
		return claimsResolver.apply(claims);
	}

	public String extractUsername(String token) {
		return extractClaim(token, Claims::getSubject);
	}

	public Date extractExpiration(String token) {
		return extractClaim(token, Claims::getExpiration);
	}

	private Boolean isTokenExpired(String token) {
		return extractExpiration(token).before(new Date());
	}

	public Boolean validateToken(String token, UserDetails userDetails) {
		final String username = extractUsername(token);
		return (username.equals(userDetails.getUsername()) && !isTokenExpired(token));
	}

	private String createToken(Map<String, Object> claims, String userName) {
		return Jwts.builder()
					.setClaims(claims)
					.setSubject(userName)
					.setIssuedAt(new Date(System.currentTimeMillis()))
					.setExpiration(new Date(System.currentTimeMillis() + 1000 * 60 * 60))
					.signWith(getSignKey(), SignatureAlgorithm.HS256).compact();
	}

	public String generateToken(String userName) {
		Map<String, Object> claims = new HashMap<>();
		return createToken(claims, userName);
	}

}
```

<br />

<h2>👣 Passo 02 - Criar a Classe JwtAuthFilter</h2>

A **Classe JwtAuthFilter** é responsável por pré-processar todas as Requisições HTTP, em busca do Token JWT enviado no Cabeçalho (header) da Requisição, na propriedade **Authorization**, criar a autenticação e inserir o usuário  autenticado na **SecurityContext**. A **SecurityContext** é responsável por manter a Autenticação e solicitar informações de segurança específicas, quando o usuário envia uma Requisição HTTP solicitando acesso em algum endpoint da aplicação.

A **Classe JwtAuthFilter** é o que chamamos no Spring Security de **Filtro de Servlet Personalizado (Custom Servlet Filter)**, que em nossa implementação, foi criado para interceptar e validar o Token JWT em toda e qualquer Requisição HTTP.

Esta Classe deve ser anotada com a anotação **@Component**, que indica que a Classe **JwtAuthFilter** é uma Classe de Componente, que pode Injetar e Instanciar qualquer Dependência especificada na implementação da Classe, em qualquer outra Classe, sempre que necessário. Vale mencionar que os Métodos definidos nesta Classe são de extrema importância para a Spring Security. 

Vamos criar e implementar a Classe **JwtAuthFilter**:

1. Clique com o botão direito do mouse sobre o **Pacote Security** (**com.generation.blogpessoal.security**), na Source Folder Principal (**src/main/java**), e clique na opção **New 🡪 Class**
2. Na janela **New Java Class**, no item **Name**, digite o nome da Classe (**JwtAuthFilter**), e na sequência clique no botão **Finish** para concluir.

Vejamos abaixo a implementação da Classe **JwtAuthFilter**:

<div align="center"><img src="https://i.imgur.com/F3zX4KR.png" title="source: imgur.com" /></div>

**Linha 1:** Através do comando **package**, estamos informando o nome do pacote (camada), onde a Classe foi criada. Esta informação é inserida automaticamente pelo STS ao criar a Classe.

**Linhas 3 a 22:** Através do comando **import**, estamos indicando todos os pacotes que contém as Classes que estão sendo utilizadas na Classe **JwtAuthFilter**.

<div align="center"><img src="https://i.imgur.com/OziVzmW.png" title="source: imgur.com" /></div>

**Linha 24:** A Classe foi anotada com a anotação **@Component**, o que indica que esta Classe é uma **Classe de Componente**. **Classe de Componente** é uma Classe gerenciada pelo Spring, que permite Injetar e Instanciar qualquer Dependência especificada na implementação da Classe, em qualquer outra Classe, sempre que necessário.

**Linha 25:** Observe que a Classe **JwtAuthFilter** estende (herda) a **Classe OncePerRequestFilter**. 

> **Entendendo a Classe OncePerRequestFilter**
>
> Primeiro vamos entender como os Filtros de Servlet funcionam na prática em linhas gerais: 
>
> Um filtro pode ser chamado antes ou depois da Resposta da Requisição. Quando uma Requisição HTTP é enviada para uma aplicação, esta mesma Requisição pode ser encaminhada para outra aplicação. Logo, existe a possibilidade de várias aplicações também usarem o mesmo filtro. Nesse cenário, o mesmo filtro é invocado várias vezes. 
>
> Porém, em algumas situações específicas, precisaremos que um filtro específico seja invocado apenas uma vez por Requisição HTTP. Para conseguirmos criar este cenário, iremos criar uma Classe que definirá um filtro personalizado para validar o Token JWT (**JwtAuthFilter**), que estenderá (herdará) a **Classe Abstrata OncePerRequestFilter**, que garante que um filtro seja executado apenas uma vez por Requisição HTTP.
>

**Linhas 27 a 31:** Foram inseridas 2 Injeções de Dependências: a primeira, da Classe **JwtService**, para ter acesso aos Métodos relativos a validação do Token JWT e a segunda, da Classe **UserDetailsServiceImpl**, para ter acesso aos dados do usuário autenticado.

<br />

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/filter/OncePerRequestFilter.html" target="_blank"><b>Documentação: <i>Classe OncePerRequestFilter</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/core/userdetails/UserDetailsService.html" target="_blank"><b>Documentação: <i>Interface UserDetailsService</i></b></a></div>

<br />

<div align="center"><img src="https://i.imgur.com/9L4LB2k.png" title="source: imgur.com" /></div>

**Linhas 33 a 36:** Implementa o Método **doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)**, responsável por implementar um Filtro de Servlet personalizado. Observe que o Método está anotado com a anotação **@Override**, o que indica que este Método está sendo **Sobrescrito** (Polimorfismo de Sobrescrita), ou seja, é um Método da **Classe Abstrata OncePerRequestFilter**, que obrigatoriamente deve ser implementado.

O Método **doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)**, possui 3 parâmetros:

- **HttpServletRequest request:** É a Requisição HTTP que será analisada pelo filtro.
- **HttpServletResponse response:** É a Resposta da Requisição HTTP que foi analisada pelo Filtro de Servlet anterior à este. Esta Resposta será construída e enviada pelo Filtro de Servlet que chamou o Filtro de Servlet **JwtAuthFilter**. Como este é o primeiro filtro da lista, a resposta estará vazia.
- **FilterChain filterChain:** É um Objeto fornecido pela Spring Security, indicando qual será o próximo filtro que será executado.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left"> **ATENÇÃO:** *Não se preocupe com os 3 parâmetros do Método doFilterInternal, porque eles serão gerados e enviados pela Spring Security.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

O Método **doFilterInternal** também pode lançar (**trows**) 2 tipos de **Exceptions** (exceções) durante o processo de execução do Método:

- **ServletException**: Erros específicos nas Operações dos Filtros de Servlet. 
- **IOException:** Erro nas Operações de Entrada e Saída da aplicação.

**Linha 38:** Criamos a variável do tipo String, chamada **authHeader**, que receberá o Token JWT presente no Cabeçalho da Requisição HTTP, na propriedade **Authorization**, através do Método **getHeader("Authorization")**, da Interface **HttpServletRequest**.

**Linha 39 e 40:** Criamos as variáveis do tipo String, **token** e **username**. A variável **token** receberá o Token JWT presente no Cabeçalho da Requisição HTTP, da propriedade **Authorization**, sem a palavra **Bearer**. A variável **username** receberá o usuario (e-mail) presente no Payload do Token JWT.

> **Bearer**
>
> Para enviar um Token JWT através do Cabeçalho da Requisição HTTP, na propriedade **Authorization**, é necessário acrescentar a palavra **Bearer** (ao portador), seguido de um espaço em branco, e na sequência o Token JWT. Veja o Exemplo abaixo:
>
> **Token JWT:**
>
> <div align="center"><img src="https://i.imgur.com/Y4X2KzV.png" title="source: imgur.com" /></div>
>
> **Token com a palavra Bearer**
>
> <div align="center"><img src="https://i.imgur.com/13LBzxE.png" title="source: imgur.com" /></div>
>
> Para validar o Token JWT é necessário retirar a palavra Bearer.

<br />

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="4%"/> <a href="https://docs.oracle.com/javaee/6/api/javax/servlet/http/HttpServletRequest.html" target="_blank"><b>Documentação: <i>Interface HttpServletRequest</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="4%"/> <a href="https://docs.oracle.com/javaee/6/api/javax/servlet/http/HttpServletResponse.html" target="_blank"><b>Documentação: <i>Interface HttpServletResponse</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="4%"/> <a href="https://docs.oracle.com/javaee/7/api/javax/servlet/FilterChain.html" target="_blank"><b>Documentação: <i>Interface FilterChain</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="4%"/> <a href="https://docs.oracle.com/javase/7/docs/api/java/io/IOException.html" target="_blank"><b>Documentação: <i>Classe IOException</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="4%"/> <a href=https://docs.oracle.com/javaee/7/api/javax/servlet/ServletException.html" target="_blank"><b>Documentação: <i>Classe ServletException</i></b></a></div>

<br />

<div align="center"><img src="https://i.imgur.com/9ohpRVD.png" title="source: imgur.com" /></div>

**Linha 42:** Foi inicializado o bloco try...catch, para capturar as Exceptions (Exceções), do processo de validação do Token JWT.

**Linhas 43 a 46:** Foi criado um laço condicional que verifica se o Token JWT foi encontrado no Cabeçalho da Requisição e se ele inicia com a palavra **"Bearer "**, através do Método **startsWith()** da Classe String.

Se as 2 condições forem verdadeiras, a variável **token** receberá o Token JWT, sem a palavra Bearer, através do Método **substring()**, da Classe String, que irá ignorar os 7 primeiros caracteres do Token, ou seja a **palavra Bearer seguida de um espaço em branco**, e a variável **username** receberá o usuario (e-mail), que será obtido através do Método **extractUsername()**, da Classe **JwtService**.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** *O espaço em branco entre a palavra Bearer e o Token JWT é obrigatório.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

**Linha 48:** Verifica se a variável **username** é diferente de nulo, ou seja, se foi encontrado o usuario (e-mail) no Payload do Token JWT e Checa o **Security Context** (Contexto de Segurança), através do Método **getContext()** da Classe **SecurityContextHolder**, que retornará o Contexto de Segurança atual, para verificar se o usuario não está autenticado na **Security Context**, através do Método **getAuthentication()** da Interface **SecurityContext**.

**Linha 49:** Se a condição for verdadeira, inicia o processo de construção do Objeto da Classe **UserDetails**, que armazenará as informações do usuário autenticado, através da Classe **UserDetailsServiceImpl**, que checará se o usuário existe no Banco de dados.

**Linha 51:** Valida Token JWT através do Método **validateToken()**, da Classe **JwtService**.

**Linhas 52 a 54:** Se o Token JWT for validado, construiremos um novo objeto da Classe **UsernamePasswordAuthenticationToken**, chamado **authToken**, que será responsável por autenticar um usuário na **Spring Security** e definir um Objeto **Authentication**, que será itilizado para autenticar o Usuário na **Security Context**, com o objetivo de manter o usuário conectado na **Security Context** até o Token JWT expirar. O Construtor da Classe **UsernamePasswordAuthenticationToken** solicita 3 parâmetros:

- **userDetails:** Objeto da Classe UserDetails, que contém os dados do usuário autenticado na Spring Security.
- **credentials:** Senha do usuário. Geralmente enviamos **null** neste parâmetro, porque o Objeto UserDetails já possui a senha criptografada.
- **authorities:** São as Autorizações do usuário (Roles), que será obtida através do Método **getAuthorities()** da Classe **UserDetails**, implementado na Classe **UserDetailsImpl**. Como não estamos implementando as Autorizações, será enviada uma Collection vazia.

**Linha 56:** Através do Método **setDetails()** da Classe **UsernamePasswordAuthenticationToken**, vamos adicionar a Requisição HTTP dentro do Objeto **authToken**. Antes de adicionarmos a Requisição HTTP, precisamos converter o Objeto **request** da Classe **HttpServletRequest** em uma instância da Classe **WebAuthenticationDetailsSource**, que é uma Classe interna do Spring Security, usada pelos Filtros de Servlet para tratar Requisições HTTP. Como não podemos enviar os dados da Requisição HTTP da forma como ela chega pra o Filtro de Servlet, o Spring utiliza a Classe **WebAuthenticationDetailsSource** para converter a Requisição HTTP para um formato compreensível pelo Filtro de Servlet.

**Linha 57:** Com o Objeto **authToken** configurado, ele será utilizado para autenticar o usuário na **Security Context**, através do Método **setAuthentication()**.

**Linha 62:** Chamamos o próximo **Filtro de Servlet** através do método **doFilter()**.

<br />

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-security/site/docs/3.0.x/apidocs/org/springframework/security/core/context/SecurityContext.html" target="_blank"><b>Documentação: <i>Classe SecurityContext</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-security/site/docs/3.0.x/apidocs/org/springframework/security/core/context/SecurityContextHolder.html" target="_blank"><b>Documentação: <i>Classe SecurityContextHolder</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-security/site/docs/4.0.x/apidocs/org/springframework/security/authentication/UsernamePasswordAuthenticationToken.html" target="_blank"><b>Documentação: <i>Classe UsernamePasswordAuthenticationToken</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-security/site/docs/4.0.x/apidocs/org/springframework/security/web/authentication/WebAuthenticationDetailsSource.html" target="_blank"><b>Documentação: <i>Classe WebAuthenticationDetailsSource</i></b></a></div>


<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.oracle.com/javaee/7/api/javax/servlet/FilterChain.html" target="_blank"><b>Documentação: <i>Interface FilterChain</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/String.html" target="_blank"><b>Documentação: Classe String</b></a></div>

<br />

<div align="center"><img src="https://i.imgur.com/q5dklpq.png" title="source: imgur.com" /></div>

**Linha 64:** Se o processo de validação do Token JWT falhar, uma das 5 Exceptions abaixo será lançada:

- **ExpiredJwtException:** O Token JWT Expirou!
- **UnsupportedJwtException:** O Token não está no formato JWT.
- **MalformedJwtException:** A construção do Token está errada e ele deve ser rejeitado. 
- **SignatureException:** A assinatura do Token JWT não confere.
- **ResponseStatusException:** Retorna um HTTP Status em conjunto com uma Exception.

**Linha 66:** O Filtro Retornará o **HTTP Status 403 🡪 FORBIDDEN**. Este Status indica que o Token é inválido e por isso o acesso não foi permitido. Neste caso, o usuário deve se autenticar novamente no sistema e gerar um novo Token.

**Linha 67:** Observe que a palavra **return** foi inserida sozinha, sem nenhum valor, indicando que após retornar  o **HTTP Status 403 🡪 FORBIDDEN**, a execução do Filtro de Servlet **JwtAuthFilter** deve ser finalizada imediatamente.

<br />

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://javadoc.io/doc/io.jsonwebtoken/jjwt/latest/io/jsonwebtoken/ExpiredJwtException.html" target="_blank"><b>Documentação: <i>Classe ExpiredJwtException</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://javadoc.io/static/io.jsonwebtoken/jjwt/0.2/io/jsonwebtoken/UnsupportedJwtException.html" target="_blank"><b>Documentação: <i>Classe UnsupportedJwtException</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://javadoc.io/doc/io.jsonwebtoken/jjwt/0.2/io/jsonwebtoken/MalformedJwtException.html" target="_blank"><b>Documentação: <i>Classe MalformedJwtException</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://javadoc.io/doc/io.jsonwebtoken/jjwt/0.2/io/jsonwebtoken/SignatureException.html" target="_blank"><b>Documentação: <i>Classe SignatureException</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/9B46Slv.png" title="source: imgur.com" width="4%"/> <a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/server/ResponseStatusException.html" target="_blank"><b>Documentação: <i>Classe ResponseStatusException</i></b></a></div>

<br />

A Implementação completa da **Classe JwtAuthFilter**, você confere abaixo:

```java
package com.generation.blogpessoal.security;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.server.ResponseStatusException;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.UnsupportedJwtException;
import io.jsonwebtoken.security.SignatureException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class JwtAuthFilter extends OncePerRequestFilter {

    @Autowired
    private JwtService jwtService;

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String authHeader = request.getHeader("Authorization");
        String token = null;
        String username = null;
    
        try{
            if (authHeader != null && authHeader.startsWith("Bearer ")) {
                token = authHeader.substring(7);
                username = jwtService.extractUsername(token);
            }

            if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
                UserDetails userDetails = userDetailsService.loadUserByUsername(username);
                    
                if (jwtService.validateToken(token, userDetails)) {
                    UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                    authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                    SecurityContextHolder.getContext().setAuthentication(authToken);
                }
            
            }
            filterChain.doFilter(request, response);

        }catch(ExpiredJwtException | UnsupportedJwtException | MalformedJwtException 
                | SignatureException | ResponseStatusException e){
            response.setStatus(HttpStatus.FORBIDDEN.value());
            return;
        }
    }
}
```

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/backend_blogpessoal_v3/tree/13_Spring_Security" target="_blank"><b>Código fonte do projeto</b></a></div>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
