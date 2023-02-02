<h1>Introdução ao Github Actions</h1>



O **Github Actions** permite que você crie fluxos de trabalho de ciclo de vida de desenvolvimento de software personalizados diretamente em seu repositório Github. Esses fluxos de trabalho são compostos de diferentes tarefas chamadas ações (actions), que podem ser executadas automaticamente em determinados eventos.

Isso permite incluir recursos de integração contínua (CI) e implantação contínua (CD) e muitos outros recursos diretamente em seu repositório.

<h2>1. Conceitos básicos</h2>

Vamos conhecer os principais conceitos usados no Github Actions com os quais você deve estar familiarizado ao usá-lo ou ao ler a documentação:

<h3>1.1. Actions</h3>

As ações são o menor bloco de construção portátil de um fluxo de trabalho e podem ser combinadas como etapas para criar um trabalho. Você pode criar suas próprias ações ou usar ações compartilhadas publicamente no Marketplace.

<h3>1.2. Event</h3>

Os eventos são atividades específicas que acionam a execução de um fluxo de trabalho. Por exemplo, um fluxo de trabalho é acionado quando alguém envia para o repositório ou quando uma solicitação pull é criada. Os eventos também podem ser configurados para ouvir eventos externos usando Webhooks.

<h3>1.3. Run</h3>

Um executor é uma máquina com o aplicativo executor do Github Actions instalado. Em seguida, o executor aguarda os trabalhos disponíveis que pode executar. Depois de escolher um trabalho, eles executam as ações do trabalho e relatam o progresso e os resultados de volta ao Github. Os executores podem ser hospedados no Github ou auto-hospedados em suas próprias máquinas/servidores.

<h3>1.4. Job</h3>

Uma tarefa é composta de várias etapas e é executada em uma instância do ambiente virtual. As tarefas podem ser executadas independentemente umas das outras ou sequencialmente se a tarefa atual depender da tarefa anterior para ser bem-sucedida.

<h3>1.5. Step</h3>

Uma etapa é um conjunto de tarefas que podem ser executadas por um trabalho. As etapas podem executar comandos ou ações.

<h3>1.6. Workflow</h3>

Um fluxo de trabalho é um processo automatizado composto por um ou vários trabalhos e pode ser acionado por um evento. Os fluxos de trabalho são definidos usando um arquivo YAML no diretório .github/workflows. Na prática, o Workflow é um Pipeline CI/CD.

<h2>2. Github Marketplace</h2>

A maneira mais fácil de iniciar seu fluxo de trabalho é usando um dos muitos modelos de fluxo de trabalho e ação disponíveis no Github Marketplace. Se você não tiver certeza de quais ações podem ser úteis, dê uma olhada nas sugestões fornecidas pelo Github, que são exclusivas para cada repositório.

<br />

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="30px"/> <a href="https://github.com/marketplace?category=&query=&type=actions&verification=" target="_blank"><b>Github Marketplace</b></a>

<br /><br />

Neste repositório existem modelos de actions para diversas tarefas de um pipeline CI/CD, como executar o Java, fazer o Deploy no Azure, entre outras.

<h2>3. A Linguagem YAML</h2>

**YAML** é uma linguagem de serialização legível por humanos orientada a dados, que tem sido adotada em muitos projetos, incluindo OpenAPI (Documentação - Swagger), Docker, Kubernetes, entre outros. YAML era originalmente um acrônimo para 'Yet Another Markup Language' (Mais uma linguagem de marcação), mas agora é mais comumente referido como 'YAML Ain't Markup Language' (Ainda não é uma linguagem de marcação). Por isso se tornou também a linguagem utilizada pelo Github Actions para criar o Workflow, ou seja, o arquivo onde serão armazenadas as configurações do nosso Workflow será um arquivo yml.

Documentos YAML são basicamente uma coleção de pares chave-valor onde o valor pode ser tão simples quanto uma string. Aqui estão algumas notas sobre a sintaxe YAML:      

- A indentação é usada para denotar a estrutura. 
- Tabs não são permitidas
- A quantidade de espaço em branco não importa
- O nó filho obrigatoriamente deve estar mais recuado que o nó pai. 

**Exemplo:**

```yaml
# Strings não requerem aspas duplas ou simples (Opcional)
titulo: Introdução a YAML

# Strings com multiplas linhas obrigatoriamente são inicializadas com |
execute: |
    npm ci
    npm build
    npm test

# Inteiros
idade: 29

# Float:
preco: 15.99

# Boolean aceita duas formas
publicado: false
publicado: FALSE

# Nulo aceita várias formas
publicado: 
publicado: null
publicado: Null
publicado: NULL

# Listas aceita 2 formatos
numeros:
    - um
    - dois
    - tres

numeros: [ um, dois, tres ]

```

<br />

<div align="left"><img src="https://i.imgur.com/VKWcUsU.png" title="source: imgur.com" width="4%"/> <a href="https://yaml.org" target="_blank"><b>Site Oficial: <i>YAML</i></b></a>
<br />

<h2>4. Palavras Chave do Github Actions</h2>

Os arquivos do Github Actions são escritos usando a linguagem YAML. Na sequência, vamos entender como implementar os conceitos mais importantes no arquivo de fluxo de trabalho:

<h3>4.1. Name<h3>

O nome do seu fluxo de trabalho que é exibido na página de ações do Github. Se você omitir esse campo, ele será definido como o nome do arquivo.

**Exemplo:**

```yaml
name: Pipeline CI-CD
```

<h3>4.2. on</h3>

A palavra-chave **on** define os eventos do Github que acionam o fluxo de trabalho. Você pode fornecer um único evento ou um array de eventos que aciona um fluxo de trabalho.

**Exemplo:**

```yaml
on: push 
# ou 
on: [pull_request, issues]
```

<h3>4.3. jobs</h3>

A execução de um fluxo de trabalho é composta por um ou mais trabalhos. Os trabalhos definem a funcionalidade que será executada no fluxo de trabalho e executada em paralelo por padrão.

**Exemplo:**

```yaml
jobs: 
  my-job: 
    name: My Job 
    runs-on: ubuntu-latest 
    steps: 
    - name: Imprimir uma saudação 
      run: | 
        echo Olá!
```

<h3>4.4. Env</h3>

A palavra chave Env define um conjunto de variáveis de ambiente, que estão disponíveis para todos os trabalhos e etapas do fluxo de trabalho. Você também pode definir variáveis de ambiente que estão disponíveis apenas para uma tarefa ou etapa.

**Exemplo:**

```yaml
env: 
  CI: true
```

<h3>4.5. Runs-on</h3>

É importante executar seus fluxos de trabalho nos ambientes certos para garantir que eles sejam bem-sucedidos nas circunstâncias de produção. Através da palavra chave Runs-on você pode definir as versões de sistema operacional e software em que seu fluxo de trabalho será executado.

**Exemplo:**

```yaml
run-on: ubuntu-latest
```

<h3>4.6. Steps</h3>

Agrupa todas as etapas executadas na tarefa. Cada item aninhado nesta seção é uma ação da tarefa.

**Exemplo:**

```yaml
steps:
    - run: echo "Iniciando o Build da Aplicação"
    - uses: actions/checkout@v3
    - name: Setup JDK 17
      uses: actions/setup-java@v3
      with:
        java-version: 17
        distribution: 'adopt'
```

Você deve usar a ação de actions/checkout@v3 sempre que seu fluxo de trabalho for executado no código do repositório.

<h3>4.7. Uses</h3>

A palavra-chave Uses especifica que esta etapa executará uma versão específica de uma ação. Esta é uma ação que verifica seu repositório no executor, permitindo que você execute scripts ou outras ações em seu código (como ferramentas de teste). 

**Exemplo:**

```yaml
uses: actions/setup-java@v3
```

<h3>4.8. With</h3>

A palavra-chave With indica a versão especifica que deve ser instalada de um determinado software.

**Exemplo:**

```yaml
uses: actions/setup-java@v3
      with:
        java-version: 17
        distribution: 'adopt'
```

<br />

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://docs.github.com/pt/actions" target="_blank"><b>Documentação: <i>Github Actions</i></b></a>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>

