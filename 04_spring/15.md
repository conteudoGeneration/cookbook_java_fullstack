<h1>Introdução a Spring Security</h1>

<div align="center"><img src="https://i.imgur.com/iyARgVe.png" title="source: imgur.com" /></div>

No mundo da tecnologia, em especial da Internet, nenhuma aplicação em execução na Nuvem pode ficar sem algum tipo de Segurança habilitada, devido aos inúmeros perigos existentes no mundo virtual como ataques Hackers, invasões de Servidores, roubos de dados, entre outros.

Analisando nossos projetos, podemos perceber que nossas API's, até este momento, não possuem nenhuma segurança, ou seja, qualquer pessoa pode acessar todos os nossos endpoints e terem acesso à todos os recursos livremente. Como a maioria das aplicações atuais contém informações vitais como: dados pessoais dos usuários e dos clientes, dados bancários, usuário e senha de acesso, precisamos garantir que a nossa API e estes dados estejam devidamente protegidos. No Ecossistema Spring, podemos contar com a Dependência **Spring Security**, para implementar a segurança da nossa API.

**Spring Security** é um framework para Java, que provê autenticação, autorização, filtros de servlet e diversas outras funcionalidades para aplicações corporativas, com o objetivo de proteger a aplicação contra acessos indevidos. O Projeto da Spring Security foi Iniciado em 2003, por Ben Alex. A Spring Security é distribuída sob a licença Apache License e é parte integrante do Ecossistema Spring.

A Dependência **spring-boot-starter-security** é responsável por todas as dependências relacionadas à segurança do Spring. Dentro desta dependência, existem outras 3 dependências:

- **spring-security-core:** Implementa os principais recursos do Spring Security;

- **spring-security-config:** Fornece o namespace (contexto) Spring Security;

- **spring-security-web:** fornece filtros e outros recursos necessários para proteger aplicativos da web.

Vamos adicionar a **Dependência Spring Security** no Projeto Blog Pessoal, adicionando as linhas abaixo no arquivo **pom.xml**:

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>
```

Na imagem abaixo, vemos a Dependência inserida no arquivo **pom.xml**:

<div align="center"><img src="https://i.imgur.com/VQAw5S8.png" title="source: imgur.com" /></div>

Salve o arquivo e Execute a aplicação.

Abra a sua aplicação no Navegador da Internet através do endereço: **http://localhost:8080** e veja o que acontece.

<div align="center"><img src="https://i.imgur.com/k19Ci4j.png?2" title="source: imgur.com" /></div>

Como num passe de mágica...

- … Você tem uma página de login gerada automaticamente.
- … Você não consegue mais executar Requisições HTTP (GET, POST, PUT e DELETE).
- … Todo o seu aplicativo está bloqueado e solicita que você insira um nome de usuário e uma senha.

Tendo sobrevivido ao susto inicial, você deve ter pensado: Como tudo isso aconteceu?

Depois de inserir a Dependência **spring-boot-starter-security**, o Spring habilitará alguns padrões de configuração de segurança automática, incluindo a segurança de todos os endpoints, bem como a definição da estratégia de autenticação no formato **httpBasic** (Autenticação básica através de usuário e senha). 

Além disso, sem fazer nenhuma configuração adicional, ele vai criar um nome de usuário padrão (**user**) e uma senha, que foi gerada aleatoriamente e pode ser visualizada no console do Spring, como mostra a imagem abaixo. Esses dados podem ser utilizados para fazer login na aplicação, através da tela de login (veja a imagem anterior) gerada pela Spring Security.

<div align="center"><img src="https://i.imgur.com/dI2DdEm.png" title="source: imgur.com" /></div>

A partir do momento que a Spring Security foi habilitada, foi criado um endpoint de login, que será utilizado para redirecionar a solicitação não autenticada. O redirecionamento aponta para a página de login padrão. No entanto, em um serviço REST, exibir uma página de login em todas as situações não faz o menor sentido, pois os serviços REST, na maioria das vezes, não serão chamados de forma direta. Serviços REST são chamados por aplicativos clientes personalizados, como um Front-end ou um App Mobile, em vez de solicitações diretas do navegador da Internet. 

Nos serviços REST é altamente recomendado enviar a resposta HTTP Status **401 - Unauthorized**, quando a solicitação vier sem autenticação, em vez de redirecionar para a página de login gerada por padrão para obter a autenticação. Esteja ciente de que, nesse caso, o Status **401 - Unauthorized** significa, não autenticado.

Desta forma, para deixarmos de utilizar esta tela de login padrão, precisaremos customizar a implementação da Spring Secuity, mas antes precisamos entender alguns conceitos fundamentais utilizados pela Spring Security e pela maioria dos sistemas de segurança.

<br />

<h2>1. Segurança da Aplicação - Conceitos</h2>

Antes de estudarmos a Spring Security, vamos compreender alguns conceitos importantes da Segurança da Informação:

<h3>1.1. Autenticação</h3>

<div align="center"><img src="https://i.imgur.com/oljXzoD.png" title="source: imgur.com" /></div>

É o primeiro processo da Segurança da Informação, popularmente conhecido como Login no sistema. É o momento em que o usuário informa o seu usuário de login (e-mail) e a sua senha (criptografada), e o sistema fará a checagem se estas informações estão corretas.

<br />

<h3>1.2. Autorização</h3>

<div align="center"><img src="https://i.imgur.com/kazNpLz.png" title="source: imgur.com" /></div>

É o segundo processo da Segurança da Informação, popularmente conhecido como Direitos de acesso (Roles) no sistema. É o momento em que o sistema checará o que o usuário pode e não pode fazer no sistema, ou seja, as suas permissões dentro do sistema (Quais Recursos e Endpoints podem ser acessados?). Estas permissões são chamada de **Roles**.

<br />

<h3>1.3. Filtros de Servlet</h3>

<div align="center"><img src="https://i.imgur.com/Hn9NSd6.png" title="source: imgur.com" /></div>

Qualquer aplicativo da Spring WEB é apenas um **Servlet** (é uma Classe Java usada para criar aplicações WEB), que redireciona todas as Requisições HTTP recebidas, para as suas respectivas Classes Controladoras (**@RestControllers**). 

> O nome “Servlet” vem do inglês e dá uma ideia de **servidor pequeno, cujo objetivo basicamente é receber requisições HTTP, processar e responder ao cliente**, essa resposta pode ser um JSON, um XML, um HTML, entre outros.

Como nestas Requisições HTTP não existe uma segurança e os processos de autenticação e autorização devem ser efetuadas antes das Requisições HTTP chegarem na Classe Controladora, a Spring Security oferece como solução para estes problemas os **Filtros de Servlet**, que na prática são Objetos Java que interceptam toda e qualquer Requisição HTTP recebida antes de chegarem na Classe Controladora e efetuam algum tipo de processamento. Por isso que o seu Blog Pessoal está "trancado" após a inserção da Dependência Spring Security.

A figura acima, ilustra o filtro **UsernamePasswordAuthenticationFilter** checando se a Requisição possui os Atributos  usuario (e-mail) e a senha. Se os dados estiverem corretos, o **Filtro de Servlet** autentica o usuário e libera o acesso ao sistema. Caso contrário, ele retorna o Status **401 - Unauthorized**.

Ao adicionar a Dependência Spring Security, 15 Filtros de Servlet são habilitados por padrão, onde cada um tem uma função específica. Ao customizar as configurações da Spring Security você pode definir quais filtros serão habilitados, quais filtros serão desabilitados e ainda criar e habilitar filtros personalizados criados pela pessoa desenvolvedora. Não abordaremos este assunto em detalhes por ser muito extenso, por demandar muito tempo e dedicação, mas de qualquer forma criaremos um **Filtro de Servlet** personalizado para validar as Requisições HTTP. 

<br />

<h3>1.4. Token</h3>

<div align="center"><img src="https://i.imgur.com/13LBzxE.png" title="source: imgur.com" /></div>

Parte integrante da Autenticação, um **Token** é um dado, que aparentemente não tem significado ou uso por si só, mas quando combinado com o sistema de segurança correto, torna-se parte vital da segurança de seu aplicativo. A autenticação baseada em token garante que cada solicitação a um servidor seja acompanhada por um token assinado,  que o servidor verifica a sua autenticidade e só então responde à solicitação. Um bom exemplo do uso do Token, são os aplicativos de Internet Banking, que em todas as transações financeiras gera um novo token para autorizar a operação.

A imagem acima, ilustra um **Token no formato Bearer**. Para cada usuário autenticado no sistema, será gerado um Token, com prazo de validade, que posteriormente será enviado no Cabeçalho de todas Requisições HTTP. Requisições HTTP sem um Token válido serão rejeitadas pelos endpoints protegidos da aplicação. A validação de um Token funciona como um funil (Filtro de Servlet), onde só passam as Requisições que possuem um Token válido, mesmo com o usuário estando autenticado.

<h4>1.4.1. Por que precisamos do Token?</h4>

Quando você envia uma Requisição HTTP para uma API, se o recurso precisar de autorização para acessar, primeiro você precisa provar que possui a autorização e faz isso enviando seu nome de usuário e senha. Agora, imagine que você precise acessar os recursos desse servidor várias vezes. Nessa situação, você precisaria enviar o seu nome de usuário e senha em todas as tentativas de acessar o recurso.

Você não precisaria fazer isso se a sua aplicação guardasse o estado atual da autenticação. Entretanto, vamos relembrar que uma API REST não guarda o estado, ou seja, uma Requisição não depende e/ou utiliza dados de uma Requisição anterior, logo é necessário encontrar outra maneira de autorizar os usuários, em vez de solicitar o nome de usuário e a senha em todas as solicitações.

Como solução para este problema, surge a **Autorização Baseada em Token**. Quando você entra em um sistema fornecendo seu nome de usuário e senha, o sistema gera um Token para você com os dados de autorização necessários dentro dele. Esse Token é enviado a você como resposta à sua Requisição de autenticação. Para qualquer Requisição de acesso a recursos do servidor, você pode enviar esse Token em vez de enviar o seu nome de usuário e senha.

<br />

<h2>2. Conhecendo o HTTP Authentication</h2>

O **IETF (*Internet Engineering Task Force*)** tem como missão identificar e propor soluções para as questões/problemas relacionados à utilização da Internet, além de propor a padronização das tecnologias e protocolos envolvidos. O mesmo define a estrutura de autenticação HTTP que pode ser usada por um servidor para definir uma solicitação do cliente. Numa autenticação por token, o servidor responde ao cliente com uma mensagem do tipo **HTTP Status 401 (Não autorizado)** e fornece informações de como autorizar com um cabeçalho de resposta **WWW-Authenticate** contendo ao menos uma solicitação. Um cliente que deseja autenticar-se com um servidor pode fazer isso incluindo um campo de cabeçalho de solicitação **WWW-Authenticate** com as credenciais. No Diagrama de Sequência abaixo pode se observar este relacionamento:

<div align="center"><img src="https://i.imgur.com/skGtKqr.png" title="source: imgur.com" /></div>

No caso de uma **Autorização “Bearer”** (como a mostra a figura acima), a troca deve acontecer por meio de uma conexão HTTP (TLS) para ser segura. Se um servidor recebe credenciais válidas, mas que não são adequadas para ter acesso a um determinado recurso, o servidor responderá com o código de status **HTTP Status 403 (Proibido!)**.  Ao contrário de **HTTP Status 401(Não autorizado)**, a autenticação é impossível para este usuário. 

Essa Autorização é enviada no **Cabeçalho da Requisição HTTP**, na chave **Authorization**, através de uma String que contém as credenciais para autenticar um agente usuário em um servidor.  Aqui o tipo é novamente necessário, seguido pelas credenciais, que podem ser codificadas ou criptografadas dependendo do esquema de autenticação usado. No caso acima foi utilizado o **Esquema de Autenticação Bearer** que será explicado na sequencia.

> **Cabeçalho HTTP:** Os cabeçalhos HTTP permitem que o cliente e o servidor passem  informações adicionais com a solicitação ou a resposta HTTP. Um  cabeçalho de solicitação é composto por seu nome *case-insensitive* (não diferencia letras maiúsculas e minúsculas), chamada de **key** (chave), seguido por dois pontos ':' e pelo seu valor (sem quebras de linha), chamado **value** (valor). 
>
> **WWW-Authenticate:** Define o método de autenticação que deve ser utilizado para conseguir acesso ao recurso.
>
> **Authorization:** Contém as credenciais (token) para autenticar um User-Agent com o servidor.

<div align="left"><img src="https://i.imgur.com/cDPH4tl.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Status/401" target="_blank"><b>Documentação: HTTP Status Code 401 - Unauthorized</b></a></div>

<div align="left"><img src="https://i.imgur.com/cDPH4tl.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Status/403" target="_blank"><b>Documentação: HTTP Status Code 403 - Forbidden</b></a></div>

<div align="left"><img src="https://i.imgur.com/cDPH4tl.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Headers/WWW-Authenticate" target="_blank"><b>Documentação: Cabeçalho HTTP WWW-Authenticate</b></a></div>

<div align="left"><img src="https://i.imgur.com/cDPH4tl.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Headers/Authorization" target="_blank"><b>Documentação: Cabeçalho de Requisição HTTP Authorization</b></a></div>

<div align="left"><img src="https://i.imgur.com/cDPH4tl.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Headers" target="_blank"><b>Documentação: Cabeçalhos HTTP</b></a></div>

<br />

<h3>2.1. Esquema Bearer</h3>

A estrutura geral de autenticação HTTP é usado por vários esquemas de autenticação. Os esquemas podem divergir na força da segurança e na disponibilidade do software cliente ou servidor. Os esquemas mais comuns de autenticação são o **Basic** e o **Bearer**, mas existem outros esquemas oferecidos por serviços de hospedagem, como AWS, Google ou Microsoft.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left">**ATENÇÃO:** Para melhor compreensão no momento, vamos focar apenas no entendimento do formato Bearer, que é considerado um dos esquemas mais populares. Vale mencionar que para aprender os demais é necessário tempo e muita dedicação.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

No projeto Blog Pessoal utilizaremos o esquema **Bearer**, que segundo a sua documentação, consiste em um conjunto de caracteres codificados posicionados após a palavra **"Bearer "** (o espaço em branco após a palavra Bearer é obrigatório), formando um ***Authorization Token*** para ser passado ao sistema. No trecho de código abaixo, podemos ver um exemplo simples de um **Token Bearer**:

<div align="center"><img src="https://i.imgur.com/13LBzxE.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="100px"/> | ALERTA DE BSM: Mantenha a Atenção aos Detalhes ao escrever o Token no formato Bearer, o mesmo é representado pela palavra "*Bearer* " com um espaço em branco na frente + um conjunto de caracteres codificados, que são fornecidos ao se autenticar no sistema. |
| ------------------------------------------------------------ | :----------------------------------------------------------- |

<br />

<div align="left"><img src="https://i.imgur.com/cDPH4tl.png" title="source: imgur.com" width="30px"/> <a href="https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Headers/Authorization" target="_blank"><b>Documentação: Cabeçalho de Requisição HTTP Authorization</b></a></div>

<div align="left"><img src="https://i.imgur.com/RlHVydi.png" title="source: imgur.com" width="25px"/> <a href="https://www.rfc-editor.org/rfc/rfc6750.html" target="_blank"><b>Documentação: Esquema de autenticação Bearer</b></a></div>

<br />

<h2>3. O Token JWT</h2>

Existem diversas maneiras de gerar um **Token Bearer**, no Projeto Blog Pessoal, utilizaremos o padrão **JWT - JSON WEB Token**. O JWT é um padrão de mercado, muito popular e amplamente utilizado, que define como transmitir e armazenar objetos JSON de forma compacta e segura entre diferentes aplicações. Os dados nele contidos  podem ser validados a qualquer momento pois o token é assinado digitalmente. Na imagem abaixo, vemos a estrutura de um Token JWT:

<div align="center"><img src="https://i.imgur.com/EEoVRt4.png" title="source: imgur.com" /></div>

Um Token JWT é formado por três seções: **Header, Payload e Signature.**

O **Header** (cabeçalho do token) é um objeto JSON que define as informações sobre o tipo do token (typ), nesse caso JWT, e o algorítmo de criptografia usado em sua  assinatura (alg), normalmente **HMAC SHA256**. No código abaixo, vemos um exemplo de cabeçalho:

```json
{
  "alg": "HS256"
}
```

O **Payload** é um objeto JSON que contém as **claims** (informações) da entidade tratada, normalmente o usuário autenticado.

Essas claims podem ser de 3 tipos:

| Tipo         | Descrição                                                    |
| ------------ | ------------------------------------------------------------ |
| **Reserved** | São os atributos não obrigatórios (mas recomendados), que são usados na validação do token pelos protocolos de segurança das APIs. |
| **Public**   | São os atributos que usamos em nossas aplicações. Normalmente armazenamos as informações do usuário autenticado na aplicação. |
| **Private**  | São os atributos definidos especialmente para compartilhar informações entre aplicações, tais como nome do usuário e os direitos de acesso (**Roles:** admin, usuario comum, entre outros). |

Na tabela abaixo, temos a lista com as principais Claims utilizadas no payload:

| Claim                | Descrição                                                    |
| -------------------- | ------------------------------------------------------------ |
| **sub (subject)**    | Entidade à quem o token pertence.                            |
| **iss (issuer)**     | Emissor do token.                                            |
| **exp (expiration)** | Timestamp de quando o token irá expirar. Observe que a data e hora estão em milissegundos. |
| **iat (issued at)**  | Timestamp de quando o token foi criado. Observe que a data e hora estão em milissegundos. |
| **aud (audience)**   | Destinatário do token, representa a aplicação que irá usá-lo. |

<br />

No código abaixo, vemos um exemplo de payload:

```json
{
  "sub": "admin@email.com.br",
  "iat": 1677556617,
  "exp": 1677560217
}
```

Observe que a Claim iat e a Claim exp são inseridas pelo gerador do Token.

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="100px"/> | ALERTA DE BSM: Mantenha a Atenção aos Detalhes ao criar o Token JWT. Por segurança recomenda-se não armazenar informações confidenciais ou sensíveis no payload do token como a senha, por exemplo. |
| ------------------------------------------------------------ | :----------------------------------------------------------- |

<br />

A **Signature** (assinatura) é a concatenação da String gerada a partir da **codificação do Header** através do algoritmo de codificação **base64UrlEncode**, um **ponto final** (.), a String gerada a partir da **codificação do Payload** através do algoritmo de codificação **base64UrlEncode**, um **ponto final** (.) e a String gerada a partir da **codificação da SECRET** (Uma String de 256 bits, aleatória, gerada através de um Algoritmo hash), através do algoritmo de codificação **base64UrlEncode**. A String Gerada a partir desta concatenação, será criptografada com o algoritmo **HMAC SHA256** ou outro Algoritmo indicado no Header do Token, gerando a assinatura do Token JWT. Veja o modelo de geração da assinatura na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/VJfphbU.png" title="source: imgur.com" /></div>

Observe que as sessões são concatenadas com um ponto (.), separando as sessões, seguindo a estrutura: **header.payload.secretKey**. Observe que a Codificação em Base 64 da SECRET está habilitada no Debugger.

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left">**ATENÇÃO:** Não se preocupe em aprender como cada um destes algoritmos de codificação e criptografia funcionam internamente. O mais importante agora é saber que eles existem e como usá-los.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

A assinatura do Token JWT é usada para verificar se o remetente do JWT é quem diz ser e para garantir que a mensagem não foi alterada ao longo do caminho. Juntando tudo a saída são **três Strings Codificadas em Base64 separadas por pontos**, que podem ser facilmente passadas em ambientes HTML e HTTP, por serem bem compactas.

Na imagem abaixo vemos o Token JWT da primeira imagem deste tópico decodificado:

<div align="center"><img src="https://i.imgur.com/QJwmhLQ.png" title="source: imgur.com" /></div>

Para decodificar o Token JWT, foi utilizada a **Ferramenta Debugger do JWT**. Com ela é possível **decodificar o cabeçalho e o payload**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/CrxE97t.png" title="source: imgur.com" /></div>

Para decodificar o Token JWT, insira a parte **encriptada do Token** (tudo menos a palavra Bearer) no campo **Encoded**, marque o item **secret base64 encoded** e conferir o resultado no campo **Decoded**. A  Assinatura não é tão simples de decodificar, porquê além de usar o Algoritmo **HMAC SHA256**, também seria necessário criar um algoritmo específico para checagem de Chave Pública e Chave Privada, além de conhecer a Secret Key previamente.

Para implementar o Token JWT no Spring, precisamos adicionar as 3 Dependências abaixo no arquivo **pom.xml**:

```xml
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

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <div align="left">**ATENÇÃO:** No momento em que este conteúdo foi escrito, a versão atual da Dependência JWT era 0.11.5. Ao acessar este conteúdo a versão mais atual da Dependência pode ser outra.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<div align="left"><img src="https://i.imgur.com/WeNdbPo.png" title="source: imgur.com" width="35px"/> <a href="https://jwt.io/introduction" target="_blank"><b>Documentação: JWT - JSON WEB Token</b></a></div>

<div align="left"><img src="https://i.imgur.com/WeNdbPo.png" title="source: imgur.com" width="35px"/> <a href="https://jwt.io/#debugger-io" target="_blank"><b>Ferramenta: JWT Debugger</b></a></div>

<div align="left"><img src="https://i.imgur.com/RlHVydi.png" title="source: imgur.com" width="25px"/> <a href="https://pt.wikipedia.org/wiki/Base64" target="_blank"><b>Artigo: Modelo Base 64</b></a> - Como funciona o modelo de Codificação Base 64.</div>

<div align="left"><img src="https://i.imgur.com/RlHVydi.png" title="source: imgur.com" width="25px"/> <a href="https://pt.wikipedia.org/wiki/HMAC" target="_blank"><b>Artigo: Modelo HMAC SHA256</b></a> - Como funciona o modelo de Codificação HMAC SHA256.</div>

<br />

O Token gerado será enviado no Header (cabeçalho) de todas as Requisições com endpoints protegidos. Sem o token não for enviado, todos os endpoints protegidos por autenticação retornarão como resposta o status acesso negado (**UNAUTHORIZED 🡪 401**).

<br />

<h2>4. Spring Security</h2>

Veja na imagem abaixo, um resumo sobre como a Spring Security funciona:

<div align="center"><img src="https://i.imgur.com/VpBVvOv.png" title="source: imgur.com" /></div>

Observando o Diagrama acima, podemos associar esses componentes com o processo de autenticação do Spring Security: receber solicitação HTTP, filtrar, autenticar, armazenar os dados de autenticação, gerar token, obter detalhes do usuário, autorizar e tratar exceções.

- A Classe **SecurityFilterChain** é o ponto crucial da nossa implementação de segurança. Ele configura o CORS (Cross-origin resource sharing), o CSRF (Cross-site request forgery), o gerenciamento da sessão de autenticação e as regras para os Recursos protegidos e não protegidos, que veremos mais adiante. Também podemos estender e personalizar a configuração padrão que contém os elementos a seguir.
- A **SecurityContextHolder** fornece acesso ao **SecurityContext** atual. 
- A **SecurityContext** é responsável por manter a Autenticação (até a expiração do Token) e solicitar informações de segurança específicas, como o Token JWT, por exemplo.
- A **Autenticação** representa o usuário com a autorização para acessar o sistema, que inclui as **Granted Authorities** (autorizações). 
- A Interface **GrantedAuthority** será representada por uma Collection, que armazena as permissões que o usuário possui no aplicativo, concedidas na criação do usuário, chamadas de **Roles**. Em nossa implementação da Security, não iremos implementar os Roles, para deixar o nosso código mais simples, mas de qualquer forma não podemos deixar de criar os Objetos desta Interface.
- A Interface **UserDetails** contém todas as informações necessárias (como: usuário (e-mail), senha e as  autorizações) para construir um objeto **Authentication DAO** (Data Access Object), que permite utilizar um Banco de dados como meio de validação do usuário. Além disso, é responsável por definir algumas propriedades do usuário como bloqueio do usuário, expiração da senha, entre outras. 
- A Interface **UserDetailsService** é responsável por criar o Objeto **UserDetails**, a partir dos dados do usuário autenticado através da **AuthenticationProvider**, que define qual tipo de autenticação será utilizada. Em nosso projeto, utilizaremos a autenticação por Banco de dados (DAO - Data Access Object).
- A Interface **UserDetailsService** funciona em conjunto com o Banco de dados da aplicação através do **Spring Data JPA**, utilizando a Interface **UsuarioRepository**. Ela possui um método para carregar o usuário e retornar um Objeto da Interface **UserDetails**, que o Spring Security utilizará para a autenticação e validação.
- A Classe **JwtAuthFilter** herda a Classe **OncePerRequestFilter**. Esta Classe é responsável por pré-processar todas as Requisições HTTP, o Token enviado no Cabeçalho (header) da Requisição, criar e inserir a autenticação na **SecurityContext**. 
- A Classe **OncePerRequestFilter** garante que um **Filtro de Servlet** específico seja executado apenas uma vez por Requisição HTTP. Ela possui o Método **doFilterInternal()**, que implementaremos com a responsabilidade de validar o **Token JWT** recebido no Cabeçalho da Requisição através da Classe **JwtService**, carregando os detalhes do usuário (através da Interface **UserDetailsService**) e gerando uma Autenticação através da Classe **UsernamePasswordAuthenticationFilter**, que posteriormente será adicionada na **SecurityContext**. 
- A Classe **JwtService** valida, valida e gera o **Token JWT**, a partir do Objeto da Classe **UserDetails**. Esta Classe será utilizada tanto nas Classes da Camada Security, quanto na Classe **UsuarioService** para gerar o Token JWT de cada usuário durante a autenticação.
- O **UsernamePasswordAuthenticationFilter** obtém as credenciais (usuário e senha) da Requisição de login e o combina em uma instância do **AutheticationManager**. 
- O **AuthenticationManager** gerencia os autenticadores da aplicação. Em nosso projeto ele usará o **DaoAuthenticationProvider** em conjunto com **UserDetailsService** e **PasswordEncoder**, para validar a instância da Classe **UsernamePasswordAuthenticationFilter** e, em seguida, retornará uma instância de autenticação totalmente preenchida na autenticação bem-sucedida. 
- A Classe **PasswordEncoder** é responsável por criptografar a senha do usuário, através do Algoritmo Hash **BCrypt.** Esta Classe será utilizada tanto na Security, quanto na Classe **UsuarioService** para criptografar a senha do usuário antes de persistir o Objeto no Banco de dados.
- A **SecurityContext** é estabelecida chamando **SecurityContextHolder.getContext().setAuthentication(…)** com o Objeto de autenticação retornado acima. 
- A **AuthenticationEntryPoint** lida com as Exceptions através da **AuthenticationException**, detectando os erros de autenticação.
- A Classe **UsuarioController** será responsável por nos oferecer os endpoints do CRUD do Usuário e o endpoint de autenticação.
- A Classe **UsuarioService** será responsável pelas regras de negócio do usuário, como por exemplo, não permitir usuários duplicados.

O esquema de autenticação descrito acima é o **HTTP Basic**, o esquema de autenticação mais comum em uma API REST, onde o usuário digita o **e-mail (usuário) e a senha** e através de um endpoint não protegido, que a Spring Security checará se o usuário existe em nosso Banco de dados e na sequência validará a senha. 

O principal Objetivo do **AuthenticationProvider** é autenticar um usuário por meio de seu método de autenticação e fornecer um Objeto autenticado, incluindo credenciais e um Token de autenticação. O **AuthenticationProvider**, após uma autenticação bem-sucedida, resulta em um objeto contendo os detalhes do usuário, incluindo as autoridades (**GrantedAuthority**), que foram concedidas ao usuário. 

Para criar este Objeto autenticado, o **AuthenticationProvider** utiliza Interface **UserDetailsService**, que além de buscar o usuário no Banco de dados, também é responsável por criar um objeto da Interface **UserDetails**, que é o Objeto autenticado. A Interface **UserDetails** é muito importante para a configuração do Spring Security, porque ela é responsável por controlar o acesso aos recursos da aplicação. 

A Classe **JwtService** gera o Token no formato JWT durante a autenticação e envia no corpo da Resposta HTTP. Nas próximas Requisições, o usuário deverá enviar o Token JWT gerado no cabeçalho da Requisição, que serão validados pelas Classes **JwtAuthFilter e JwtService**. Se as Requisições não possuírem um Token válido, o acesso será negado. Caso não seja enviado um Token JWT, o sistema tentará autenticar, se os dados do usuário forem enviados o corpo da Requisição. Caso contrário o acesso será negado.

Nos próximos tópicos veremos todos estes elementos em detalhes.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>



