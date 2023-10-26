<h1>Github Actions - Atividade Prática</h1>



Antes de iniciarmos a criação do nosso Pipeline Ci/CD no Github Actions, vamos entender o Workflow, que será construído, através da imagem abaixo:

<div align="center"><img src="https://i.imgur.com/4bB8vXl.png" title="source: imgur.com" /></div>

1. A pessoa desenvolvedora escreve os testes e o código da aplicação da aplicação
2. Ao finalizar, envia o projeto para o Repositório Remoto no Github
3. Ao efetuar o push, o Workflow criado Github Actions, será automaticamente inicializado
4. A 1º tarefa é executar os testes escrito no JUnit 5, para validar o código
5. A 2º tarefa é criar o Build da aplicação e gerar uma imagem Docker. Esta imagem será enviada para o Dockerhub
6. A 3º e ultima tarefa será o Deploy da aplicação no Railway

Nesta atividade prática do Github Actions, vamos utilizar o serviço de hospedagem **Railway**, que na sua versão gratuita oferece integração com o Github Actions.

O projeto guia, que será utilizado nesta atividade, está disponível no link abaixo:

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="30px"/> <a href="https://github.com/rafaelq80/cicd_helloworld" target="_blank"><b>Código fonte do Projeto Guia - cicd_helloworld</b></a>

<br /><br />

Após acessar o repositório, vamos seguir a sequência de passos abaixo:

<br />

<h2>👣 Passo 01 - Clonar o Projeto Guia</h2>



1. Abra o STS
2. Na pasta de qualquer projeto, clique com o botão direito do mouse e na sequência clique na opção: **Show in 🡢 System Explorer**
3. Será aberta a pasta Workspace onde o STS grava os seus projetos.
4. Clique com o botão direito do mouse dentro da pasta Workspace (não clique sobre nenhuma pasta de projeto) e clique na opção: **Git Bash Here**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/JtkNbzr.png" title="source: imgur.com" width="75%"/></div>

5. No **Git Bash**, execute o comando abaixo para clonar o projeto guia **cicd_github_actions**:

```bash
git clone https://github.com/rafaelq80/cicd_helloworld.git
```

6. Após a clonagem, será criada a pasta **cicd_helloworld** dentro da pasta Workspace.
7. Antes de continuarmos, precisamos apagar a pasta **.git**, na pasta **cicd_helloworld**, caso contrário não será possível enviar o projeto para o seu Github ao conluir as atividades.
8. Abra a pasta **cicd_helloworld** e localize a pasta **.git**

<div align="center"><img src="https://i.imgur.com/bKkOto4.png" title="source: imgur.com" width="85%"/></div>

9. Caso esta pasta não esteja sendo exibida, na janela do Windows Explorer, clique na **Guia Exibir** e na sequência no botão **Opções**. Na janela **Opções de Pasta**, na **Guia Modo de Exibição**, no item **Configurações avançadas**, localize a opção: **Pastas e arquivos ocultos** e marque a opção **Mostrar arquivos, pastas e unidades ocultas** (como mostra a figura abaixo). Em seguida clique em **OK** para concluir.

<div align="center"><img src="https://i.imgur.com/n8hQu12.png" title="source: imgur.com" /></div>

10. Apague a pasta **.git**

<h2>👣 Passo 02 - Importar o projeto no STS</h2>

1. No STS, importe o projeto **cicd_helloworld**, através do menu **File 🡢 Import**
2. Será aberta a janela **Import**. Clique na opção **Maven 🡢 Existing Maven Projects**, como mostra a figura abaixo e clique no botão **Next**.

<div align="center"><img src="https://i.imgur.com/OzD5iOi.png" title="source: imgur.com" /></div>

3. Na  janela **Import Maven Projects**, clique no botão **Browse...** e selecione a pasta **cicd_helloworld**, como mostra a figura abaixo e clique no botão **Finish** para concluir.

<div align="center"><img src="https://i.imgur.com/kzyEBfB.png" title="source: imgur.com" width="65%"/></div>

4. Na imagem abaixo, você confere o Projeto **cicd_helloworld** após ser importado para o STS.

<div align="center"><img src="https://i.imgur.com/QkADJVI.png" title="source: imgur.com" /></div>

5. Observe que o projeto possui Teste implementado e já está todo configurado para o Deploy (Dockerfile). Para simplificar o processo, o projeto não possui um Banco de dados, é um simples Hello World!.

<br />

<h2>👣Passo 03 - Envie o projeto para o seu Github</h2>

1. Crie um novo repositório no seu Github chamado **github_actions**
1. Na pasta do projeto no STS, clique com o botão direito do mouse e na sequência clique na opção:  **Show in 🡢 System Explorer**

<div align="center"><img src="https://i.imgur.com/72JjCAi.png" title="source: imgur.com" /></div>

3. Abra a pasta **cicd_helloworld**

<div align="left"><img src="https://i.imgur.com/Tibtn4y.png" title="source: imgur.com" /></div>

4. Dentro da pasta **cicd_helloworld**, clique com o botão direito do mouse e clique na opção: **Git Bash Here**


<div align="center"><img src="https://i.imgur.com/A93QtUn.png" title="source: imgur.com" /></div>

5. No **Git Bash**, execute a sequência de comandos abaixo para conectar  a sua pasta **nomedoprojeto** com o Repositório Remoto **backend**.

```bash
git init
 
git branch -M master main

git remote add origin https://github.com/PIGeneration/github_actions.git

git pull origin main
 
git remote -v
```

<table width=100%>
	<tr>
        <td width=30%><b>Comando</b></td>
		<td width=70%><b>Descrição
	</tr>
	<tr>
        <td><i>git init</i></td>
        <td>Inicializa um repositório git local dentro da pasta projeto_integrador.</td>
	</tr>
	<tr>
        <td><i>git branch -M master main</i></td>
		<td>Renomeia a branch local master para main.</td>
	</tr>
	<tr>
        <td><i> git remote add origin endereço_remoto</i></td>
        <td>Associa o repositório local ao repositório remoto. O endereço_remoto será o endereço do seu repositório.</td>
	</tr>
	<tr>
        <td><i>git pull origin main</i></td>
        <td>Atualiza o seu repositório local com todos os arquivos disponíveis no repositório remoto.</td>
	</tr>
	<tr>
        <td><i>git remote -v </i></td>
        <td>Checa se o seu repositório local está conectado ao repositório remoto</td>
	</tr>
</table>

6. Ainda no **Git Bash**, execute a sequência de comandos abaixo para enviar o seu projeto para o Repositório Remoto **github_actions**.

```bash
 git add .
 
 git commit -m “Projeto Github Actions”
 
 git push -u origin main
```

7. O seu Repositório estará semelhante a imagem abaixo: 

<div align="center"><img src="https://i.imgur.com/zMPyede.png" title="source: imgur.com" /></div>

<br />

<h2>👣Passo 04 - Criar a conta no serviço de hospedagem Railway</h2>



<h3>4.1. Serviço de hospedagem Railway</h3>



O **Railway.app** é uma plataforma de hospedagem, inspirada no Heroku, que foi desenvolvida com o objetivo de tornar as ferramentas de desenvolvimento de aplicativos mais fáceis de acessar para os desenvolvedores. 

Você pode selecionar sua própria escolha de banco de dados, ou seja, MySQL, Redis ou Postgres SQL, de acordo com a melhor opção para o seu projeto. Para implantar um aplicativo no Railway, você precisará apenas de uma conta GitHub. 

O **Railway.app** é classificado como um **PaaS**  (plataforma como serviço), ou seja, é um conjunto de serviços para criar e gerenciar  aplicativos na nuvem. PaaS fornece os componentes de  infraestrutura, que permitem que as pessoas Desenvolvedoras criem,  integrem, migrem,  implementem, protejam e gerenciem aplicativos móveis e da web, de forma simples e rápida.

> **Modelos de Serviços na Nuvem:**
>
> - **Plataforma como um serviço (PaaS):** Um provedor de   serviços oferece acesso a um ambiente baseado em cloud no qual os   usuários podem desenvolver e fornecer aplicativos. Além do **Render**, o **Render** e o **Azure** da Microsoft também utilizam este modelo.
> - **Infraestrutura como um serviço (IaaS):**  Um provedor de serviços fornece aos clientes acesso Pay As You Go (Pague pelo que   você usar), para  armazenamento, rede, servidores e outros recursos de   computação na  cloud. O **AWS da Amazon e a Digital Ocean** seguem este modelo.
> - **Software como um serviço (SaaS):** Um provedor de   serviços oferece softwares e aplicativos por meio da  Internet. Os   usuários subscrevem ao software e o acessam por meio da web ou de API's  do fabricante. o **Google Apps e do Microsoft Office 365** seguem este modelo.

Um grande diferencial do **Railway.app** é que ele oferece **contas gratuítas**, com algumas limitações, que permitem hospedar aplicações desenvolvidas em diversas linguagens com **Banco de dados incluso**, além de possuir integração com o Github Actions.

**Principais Limitações do Plano Gratuito:**

- Os planos iniciais recebem **US$ 5 em créditos** que não se acumulam. 
- Os planos iniciais também têm um limite de execução, os usuários recebem **500 horas de execução por mês**. 
- As horas são consumidas se você tiver pelo menos um serviço ativo. Se você tiver um serviço, ele esgotará a reserva de 500 horas em uma taxa normal. Se você tiver dois serviços, o cronômetro também se esgotará em uma taxa normal. 
- Depois de esgotar as horas desse mês, sua implantação será suspensa até o próximo mês, onde você terá que reiniciá-la manualmente.
- Máximo de 512 MB de RAM Capacidade 
- vCPU compartilhada 
- Até 1 GB de disco (compartilhado entre plugins) 
- As strings de conexão do plug-in são alteradas e ocultadas quando o uso é atingido (seus dados não são excluídos) 

Agora que conhecemos o serviço Railway.app, vamos começar a criar o nosso Workflow no Github Actions:

<br />

<div align="left"><img src="https://i.imgur.com/hVHv7NO.png" title="source: imgur.com" width="5%"/> <a href="https://docs.railway.app/" target="_blank"><b>Documentação: Railway.app</b></a></div>

<br />

1. Acesse o endereço do serviço de hospedagem **Railway.app**: **http://railway.app** e clique no link **Login** para criar uma nova conta:

<div align="center"><img src="https://i.imgur.com/uWlxD2R.png" title="source: imgur.com" /></div>

2. Vamos criar a conta no Railway através da conta do Github, clicando no botão **GitHub**

<div align="center"><img src="https://i.imgur.com/WOte8a0.png" title="source: imgur.com" /></div>

3. Faça o login na sua conta (caso seja solicitado) e autorize o acesso do Railway no seu Github, clicando no botão **Authorize Railway App**

<div align="center"><img src="https://i.imgur.com/EDPeUrF.png" title="source: imgur.com" /></div>

4. Clique no link: **Please agree to the new terms to keep on using Railway**, para concordar com os termos de uso do serviço.

<div align="center"><img src="https://i.imgur.com/tzNHmqW.png" title="source: imgur.com" /></div>

5. Na próxima tela, clique no botão **I agree with Railway's Terms of service**, para aceitar as **Regras de Privacidade e Segurança**.

<div align="center"><img src="https://i.imgur.com/jYJBLv0.png" title="source: imgur.com" /></div>

6. Na próxima tela, clique no botão **I will not deploy any of that**, para aceitar as **Regras de conteúdos que não devem ser hospedados no Railway**.

<div align="center"><img src="https://i.imgur.com/c6myEWE.png" title="source: imgur.com" /></div>

7. Será exibida a mensagem abaixo, indicando que a conta no Railway está pronta para uso.

<div align="center"><img src="https://i.imgur.com/QOdYOlE.png" title="source: imgur.com" /></div>

8. Na sequência será exibida a tela do **Dashboard do Railway**.

<div align="center"><img src="https://i.imgur.com/CUsTXgM.png" title="source: imgur.com" /></div>

<br />

<h2>👣Passo 04 - Criar um novo Projeto no Railway</h2>



1. Para criar uma novo projeto, clique no botão **New Project**.

<div align="center"><img src="https://i.imgur.com/DCHO4JF.png" title="source: imgur.com" /></div>

2. Na próxima tela, clique na opção: **Deploy from GitHub repo**.

<div align="center"><img src="https://i.imgur.com/V3Rr5BS.png" title="source: imgur.com" /></div>

3. Para configurar o acesso ao Github, clique na opção: **Configure GitHub App**.

<div align="center"><img src="https://i.imgur.com/9DpY1x4.png" title="source: imgur.com" /></div>

4. Clique na conta do Github, como indicado na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/JHj8Iy0.png" title="source: imgur.com" /></div>

5. Na janela **Install & Authorize Railway App**, marque a opção **All repositories** e clique no botão **Install & Authorize** para autorizar o acesso à todos os repositórios da sua conta do Github.

<div align="center"><img src="https://i.imgur.com/tFsNBKS.png" title="source: imgur.com" /></div>

6. Clique no Repositório onde o **projeto github_actions** foi hospedado.

<div align="center"><img src="https://i.imgur.com/svIJdFW.png" title="source: imgur.com" /></div>

7. Clique no link **Deploy Now**, para iniciar o deploy.

<div align="center"><img src="https://i.imgur.com/pH9mTAE.png" title="source: imgur.com" /></div>

8. Ao finalizar o deploy, será exibida a mensagem **Sucess**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/MBTotjK.png" title="source: imgur.com" /></div>

<br />

<h2>👣Passo 05 - Configurar o Projeto no Railway</h2>



1. Na Guia **Settings**, clique no botão **Disable trigger**.

<div align="center"><img src="https://i.imgur.com/2BPKpPD.png" title="source: imgur.com" /></div>

2. Ainda na Guia **Settings**, clique no botão **Generate Domain**.

<div align="center"><img src="https://i.imgur.com/g6IYmdu.png" title="source: imgur.com" /></div>

3. Observe que será gerado o endereço de acesso da aplicação, como mostra na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/YPeUJYn.png" title="source: imgur.com" /></div>

4. Na Guia **Variables**, clique no botão **New Variable**.

<div align="center"><img src="https://i.imgur.com/zHVVaQT.png" title="source: imgur.com" /></div>

5. Configure a variável **PORT** com o valor **8080**. Esta variável serve para liberar o acesso na porta padrão do Spring.

<div align="center"><img src="https://i.imgur.com/B9xmjnE.png" title="source: imgur.com" /></div>

6. Observe que o Deploy será refeito, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/nsoZZpt.png" title="source: imgur.com" /></div>

7. Ao concluir o Deploy, será exibido o endereço da aplicação. Clique no link para abrir a aplicação.

<div align="center"><img src="https://i.imgur.com/XITKteP.png" title="source: imgur.com" /></div>

8. Será exibida a página abaixo:

<div align="center"><img src="https://i.imgur.com/UmCQWHt.png" title="source: imgur.com" /></div>

9. Feche a janela do projeto e clique no botão **Settings**.

<div align="center"><img src="https://i.imgur.com/4i83sQ0.png" title="source: imgur.com" /></div>

10. Na janela **Project Settings**, Configure o nome do projeto: **Pipeline Ci CD** e clique no botão **Update**.

<div align="center"><img src="https://i.imgur.com/EsoevAZ.png" title="source: imgur.com" /></div>

11. Clique no item **Tokens**. Na janela **New Token**, na propriedade **Name**, Informe o nome do Token: **Pipeline CI CD** e na sequência clique no botão **Create**, para gerar o Token da aplicação.

<div align="center"><img src="https://i.imgur.com/73iaAum.png" title="source: imgur.com" /></div>

12. Este Token será utilizado pelo Github Actions para acessar a sua conta no Railway e efetuar o Deploy. Copie o Token e guarde em um arquivo. Após sair desta janela, não será possível recuperar, ou seja, você terá que criar novamente.

<div align="center"><img src="https://i.imgur.com/MtWax4a.png" title="source: imgur.com" /></div>

<br />

<h2>👣Passo 06 - Adicionar as Secrets no Repositório do Github</h2>

Secrets do Github, são variáveis de ambiente, utilizadas para proteger dados confidenciais (usuário, senha, token, entre outros) que serão utilizadas no Workflow do Github Actions.

No Nosso Workflow serão criadas 3 secrets:

| Nome                   | Descrição              | Exemplo      |
| ---------------------- | ---------------------- | ------------ |
| **DOCKERHUB_USERNAME** | Usuário do Dockerhub   | pigeneration |
| **DOCKERHUB_TOKEN**    | Senha do Dockerhub     |              |
| **RAILWAY_TOKEN**      | Token geradono Railway |              |

<br />

1. No seu repositório **github_actions**, clique na **Guia Settings**.

<div align="center"><img src="https://i.imgur.com/zMPyede.png" title="source: imgur.com" /></div>

2. Em **Settings**, no menu lateral esquerdo, clique na opção **Secrets**.

<div align="center"><img src="https://i.imgur.com/KmRXEsn.png" title="source: imgur.com" /></div>

3. Em **Secrets**, clique na opção **Actions**.

<div align="center"><img src="https://i.imgur.com/nPBwHJ1.png" title="source: imgur.com" /></div>

4. Na janela **Actions secrets**, clique no botão **New repository secret**.

<div align="center"><img src="https://i.imgur.com/dVc2AlD.png" title="source: imgur.com" /></div>

5. Na janela, **New secret**, configure a primeira secret, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/7XJCZtI.png" title="source: imgur.com" /></div>

6. Repita os passos 4 e 5 para criar as demais secrets. Ao final, você terá 3 secrets criadas no seu repositório remoto, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/lWaKkJC.png" title="source: imgur.com" /></div>

<br />

<h2>👣Passo 07 - Criar o Workflow</h2>

Vamos criar o nosso Workflow dentro do repositório remoto **github_actions**, num arquivo no formato yml. 

1. No seu repositório **github_actions**, clique na **Guia Actions**.

<div align="center"><img src="https://i.imgur.com/NjuWI3a.png" title="source: imgur.com" /></div>

2. Na sequência, clique no link: **set up a workflow yourself**, para entrar no Editor de arquivos.

<div align="center"><img src="https://i.imgur.com/1qdqQKu.png" title="source: imgur.com" /></div>

3. Observe que será gerado um novo arquivo chamado **main.yml**. Neste arquivo iremos inserir todas as etapas do nosso Pipeline CI/CD. 
4. Observe que no canto direito da tela do editor, temos o **Github Actions Marketplace**, que é um repositório contendo vários templates (receitas prontas) de Actions, que podemos utilizar em nossos Workflows.

<div align="center"><img src="https://i.imgur.com/9P2bgdy.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="80px"/> | <div align="left"> **DICA:** *Para explorar o repositório de templates do Github Actions, consulte o link <a href="https://github.com/marketplace?type=actions><b>Github Actions Marketplace</b></a>.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

5. Para criar o nosso Workflow, vamos utilizar o código abaixo:

```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main
    
jobs:
  run_test:
    name: CI - Testes da Aplicação
    runs-on: ubuntu-22.04
    steps:
      - run: echo "Iniciando a execução dos Testes"
      - uses: actions/checkout@v3
      - name: Setup JDK 17
        uses: actions/setup-java@v3
        with:
         java-version: 17
         distribution: 'adopt'
      - name: Maven Verify  
        run: mvn clean verify
      - name: Test with Maven
        run: mvn -B test --file pom.xml

  run_build:
   name: CI - Build da aplicação
   runs-on: ubuntu-22.04
   needs: run_test
   steps:
    - run: echo "Iniciando a construção do Pacote da Aplicação"
    - uses: actions/checkout@v3
    - name: Setup JDK 17
      uses: actions/setup-java@v3
      with:
        java-version: 17
        distribution: 'adopt'
    - name: Maven Build
      run: mvn clean package -Dmaven.test.skip=true
    - name: Login to docker hub
      uses: docker/login-action@v2.1.0
      with:
        username: ${{ secrets.DOCKERHUB_USERNAME }}
        password: ${{ secrets.DOCKERHUB_TOKEN }}
    - name: Build docker image
      uses: docker/build-push-action@v3.2.0
      with:
        context: .
        push: true
        tags: |
          ${{ secrets.DOCKERHUB_USERNAME }}/hellocicd:${{ github.run_number }}
          ${{ secrets.DOCKERHUB_USERNAME }}/hellocicd:latest
  
  run_deploy:
    name: CD - Deploy no Railway 
    runs-on: ubuntu-22.04
    needs: run_build
    steps:
      - run: echo "Iniciando o Deploy da Aplicação"
      - name: Checkout
        uses: actions/checkout@v3

      - name: Use Node 18
        uses: actions/setup-node@v3.5.1
        with:
          node-version: 18.x

      - name: Install Packages
        run: yarn install
        
      - name: Install Railway
        run: npm i -g @railway/cli

      - name: Deploy
        run: railway up
        env:
          RAILWAY_TOKEN: ${{ secrets.RAILWAY_TOKEN }}
```

Vamos entender o código acima:

<div align="center"><img src="https://i.imgur.com/dXpXTTr.png" title="source: imgur.com" /></div>

**Linha 01:** Nome do Workflow.

**Linha 02:** A palavra-chave **on** permite definir os eventos que são disparados quando o fluxo de trabalho é executado.

**Linhas 04 a 06:** Adicionamos o evento **push** (git push) para que o fluxo de trabalho seja executado automaticamente sempre que um commit for enviado para a branch **main**. Poderia ser adicionadas outras Branches ou outros eventos, como um **pull_request**, por exemplo.

<div align="center"><img src="https://i.imgur.com/pCUeExu.png" title="source: imgur.com" /></div>

**Linha 08:** Agrupa todos os jobs executados no arquivo yaml, contendo o Workflow.

**Linha 09:** Inicia o primeiro job que será executado, com o identificador **run_test**. Esse job será responsável por executar os testes da aplicação.

**Linha 10:** A palavra-chave **name** indica o nome que será exibido durante a execução do job.

**Linha 11:** A palavra-chave **runs-on** indica onde o job será executado. No nosso exemplo, o job **run_test** será executado no **Ubuntu Linux**, **versão 22.04**, que está hospedado dentro do Github.

**Linha 12:** A palavra-chave **steps** agrupa todas as etapas que serão executadas durante o job **run_test**. Cada job em um Workflow tem a sua própria seção **steps**.

**Linha 13:** A palavra-chave **run** instrui o job a executar um comando no executor (Ubuntu Linux). O comando **echo** exibe uma mensagem na tela.

**Linha 14:** A palavra-chave **uses** informa que o job deve recuperar a ação chamada **actions/checkout** na versão 3. Esta é uma ação que verifica seu repositório e faz o download do executor (Ubuntu Linux), permitindo que você execute ações no seu código (como, por  exemplo, ferramentas de teste). Você deve usar a ação de checkout sempre que o Workflow for executado no código do repositório ou você estiver usando uma ação definida no repositório.

**Linha 15:** A palavra-chave **name** indica o nome do **step** que será executado. Em nosso exemplo, instalar o JDK versão 17

**Linhas 16 a 19:** A palavra-chave **uses** usa a ação **actions/setup-java**, versão 3, para instalar a versão especificada do pacote de software Java no executor, o que permite que você acesse o instalador do Java. A palavra-chave **with** indica a versão do Java (17) e a distribuição (adopt - Open JDK).

**Linha 20:** A palavra-chave **name** indica o nome do **step** que será executado. Em nosso exemplo, Executar o comando **maven clean**.

**Linha 21:** A palavra-chave **run** instrui o job a executar um comando no executor (Ubuntu Linux). O comando **mvn clean verify**, do Maven, primeiro limpa pasta onde será gerado o Build (executável) da aplicação e em seguida gera o Build do projeto e verifica se deu tudo certo.

**Linha 22:** A palavra-chave **name** indica o nome do **step** que será executado. Em nosso exemplo, Executar os testes da aplicação.

**Linha 23:** A palavra-chave **run** instrui o job a executar um comando no executor (Ubuntu Linux). O comando **mvn -B test --file pom.xml**, do Maven, executa todos os testes da aplicação de uma única vez.

<div align="center"><img src="https://i.imgur.com/RHGZS7F.png" title="source: imgur.com" /></div>

**Linha 25:** Inicia o segundo job que será executado, com o identificador **run_build**. Esse job será responsável por gerar o Build da aplicação, gerar uma imagem Docker e enviar para o seu Repositório no Dockerhub.

**Linha 26:** A palavra-chave **name** indica o nome que será exibido durante a execução do job.

**Linha 27:** A palavra-chave **runs-on** indica onde o job será executado. No nosso exemplo, o job **run_build** será executado no **Ubuntu Linux**, **versão 22.04**, que está hospedado dentro do Github.

**Linha 28:** A palavra-chave **needs** indica que o job **run_build** será executado somente depois que o job **run_test** for concluído com sucesso.

**Linha 29:** A palavra-chave **steps** agrupa todas as etapas que serão executadas durante o job **run_test**. Cada job em um Workflow tem a sua própria seção **steps**.

**Linha 30:** A palavra-chave **run** instrui o job a executar um comando no executor (Ubuntu Linux). O comando **echo** exibe uma mensagem na tela.

**Linha 31:** A palavra-chave **uses** informa que o job deve recuperar a ação chamada **actions/checkout** na versão 3. Esta é uma ação que verifica seu repositório e faz o download do executor (Ubuntu Linux), permitindo que você execute ações no seu código (como, por  exemplo, ferramentas de teste). Você deve usar a ação de checkout sempre que o Workflow for executado no código do repositório ou você estiver usando uma ação definida no repositório.

**Linha 32:** A palavra-chave **name** indica o nome do **step** que será executado. Em nosso exemplo, instalar o JDK versão 17

**Linhas 33 a 36:** A palavra-chave **uses** usa a ação **actions/setup-java**, versão 3, para instalar a versão especificada do pacote de software Java no executor, o que permite que você acesse o instalador do Java. A palavra-chave **with** indica a versão do Java (17) e a distribuição (adopt - Open JDK).

**Linha 37:** A palavra-chave **name** indica o nome do **step** que será executado. Em nosso exemplo, Executar o comando **maven clean package**.

**Linha 38:** A palavra-chave **run** instrui o job a executar um comando no executor (Ubuntu Linux). O comando **mvn clean package -Dmaven.test.skip=true**, do Maven, Gera o Build (executável) da aplicação, ignorando os testes.

**Linha 39:** A palavra-chave **name** indica o nome do **step** que será executado. Em nosso exemplo, Login no Dockerhub.

**Linhas 40 a 43:** A palavra-chave **uses** usa a ação **docker/login-action**, versão 2.1.0, para efetuar o login no Dockerhub. A palavra-chave **with** indica o usuário (username) e a senha (password) do Dockerhub, que estão armazenadas nas secrets **DOCKERHUB_USERNAME** e **DOCKERHUB_TOKEN**.

**Linha 44:** A palavra-chave **name** indica o nome do **step** que será executado. Em nosso exemplo, Criar a imagem Docker.

**Linhas 45 a 51:** A palavra-chave **uses** usa a ação **docker/build-push-action**, versão 3.2.0, para criar a imagem Docker a partir do Dockerfile e enviar para o Dockerhub. A palavra-chave **with** utiliza as seguintes palavras-chave:

- **context:** Indica a localização do arquivo Dockerfile. O ponto (.) indica que o arquivo Dockerfile está na raiz do repositório
- **push:** Indica que após a imagem ser gerada ela deve ser enviada para o Dockerhub
- **tags:** Indica que devem ser enviadas 2 cópias da imagem, identificadas pelas tags: **run_number** (guarda quantas vezes a imagem foi gerada via Workflow, funcionando com uma versão da imagem) e **latest** (indicando que esta é a versão mais atual, ou seja, a cada nova execução do Workflow essa imagem será substituída). Para identificar a conta do Dockerhub, foi utilizada a secret  **DOCKERHUB_USERNAME** e o nome da imagem será **hellocicd**. Observe que depois da palavra-chave tags foi adicionado uma barra vertical (|), para indicar que este comando possui mais de uma linha.

<div align="center"><img src="https://i.imgur.com/ncZRdcd.png" title="source: imgur.com" /></div>

**Linha 53:** Inicia o segundo job que será executado, com o identificador **run_deploy**. Esse job será responsável por efetuar o deploy da aplicação no serviço de hospedagem Railway.

**Linha 54:** A palavra-chave **name** indica o nome que será exibido durante a execução do job.

**Linha 55:** A palavra-chave **runs-on** indica onde o job será executado. No nosso exemplo, o job **run_build** será executado no **Ubuntu Linux**, **versão 22.04**, que está hospedado dentro do Github.

**Linha 56:** A palavra-chave **needs** indica que o job **run_deploy** será executado somente depois que o job **run_build** for concluído com sucesso.

**Linha 57:** A palavra-chave **steps** agrupa todas as etapas que serão executadas durante o job **run_test**. Cada job em um Workflow tem a sua própria seção **steps**.

**Linha 58:** A palavra-chave **run** instrui o job a executar um comando no executor (Ubuntu Linux). O comando **echo** exibe uma mensagem na tela.

**Linha 59:** A palavra-chave **name** indica o nome do step. Em nosso exemplo, Checkout.

**Linha 60:** A palavra-chave **uses** informa que o job deve recuperar a ação chamada **actions/checkout** na versão 3. Esta é uma ação que verifica seu repositório e faz o download do executor (Ubuntu Linux), permitindo que você execute ações no seu código (como, por  exemplo, ferramentas de teste). Você deve usar a ação de checkout sempre que o Workflow for executado no código do repositório ou você estiver usando uma ação definida no repositório.

**Linha 62:** A palavra-chave **name** indica o nome do **step** que será executado. Em nosso exemplo, instalar o Node versão 18.

**Linhas 63 a 65:** A palavra-chave **uses** usa a ação **actions/setup-node**, versão 3.5.1, para Instalar a versão especificada do pacote de software Node no executor, o que permite que você acesse o instalador do Node. A palavra-chave **with** indica a versão do Node (18).

**Linha 67:** A palavra-chave **name** indica o nome do **step** que será executado. Em nosso exemplo, Instalar o Yarn.

**Linha 68:** A palavra-chave **run** instrui o job a executar um comando no executor (Ubuntu Linux). O comando **yarn install**, instala tudo que for necessário para o yarn.

**Linha 70:** A palavra-chave **name** indica o nome do **step** que será executado. Em nosso exemplo, Instalar o Cliente (CLI) do Railway.

**Linha 71:** A palavra-chave **run** instrui o job a executar um comando no executor (Ubuntu Linux). O comando **npm i -g @railway/cli**, instala o cliente do Railway.

**Linha 73:** A palavra-chave **name** indica o nome do **step** que será executado. Em nosso exemplo, Deploy no Railway.

**Linha 58:** A palavra-chave **run** instrui o job a executar um comando no executor (Ubuntu Linux). O comando **railway up** faz o deploy da aplicação.

**Linhas 75 e 76:** A palavra-chave **env** permite configurar variáveis de ambiente no seu Workflow. Em nosso exemplo criamos a variável **RAILWAY_TOKEN**, que recebe o valor da secret **RAILWAY_TOKEN**. A partir do token armazenada nesta secret, o Cliente do Railway sabe exatamente para qual conta do Railway o deploy será efetuado.

<br />

Agora que compreendemos o código, vamos prosseguir a construção do Workflow:

6. Insira o código acima no arquivo **main.yml**, e clique no botão **Start commit**, como mostra a imagem abaixo:


<div align="center"><img src="https://i.imgur.com/HycId21.png" title="source: imgur.com" /></div>

7. Clique no botão **Commit new file**, para adicionar o arquivo **main.yml** no repositório.

<div align="center"><img src="https://i.imgur.com/ze2Gs3F.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="110px"/> | <div align="left"> **ATENÇÃO:** O arquivo main.yml ficará armazenado na pasta .github/workflows. Caso você crie novos Workflows, os arquivos também serão armazenados nesta pasta.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

8. Clique na **Guia Actions**, para acompanhar a execução do Workflow:

<div align="center"><img src="https://i.imgur.com/BhxAsWP.png" title="source: imgur.com" /></div>

9. Observe que o **job** que estiver em execução estará com uma animação na cor amarela:

<div align="center"><img src="https://i.imgur.com/eN9FZCG.png" title="source: imgur.com" /></div>

10. O **job** que for concluído com sucesso estará um check na cor verde:

<div align="center"><img src="https://i.imgur.com/E6cGN6M.png" title="source: imgur.com" /></div>

11. O **job** que apresentou falha de execução estará com um X vermelho e os próximos jobs não serão executados:

<div align="center"><img src="https://i.imgur.com/gbMBwWz.png" title="source: imgur.com" /></div>

12. Ao iniciar o terceiro job (Deploy no Railway), ao acessar o Dashboard da aplicação, você verá que um novo deploy foi iniciado na aplicação. Toda vez que o seu repositório **github_actions** receber uma nova atualização, automaticamente o Workflow será executado e o deploy será atualizado.

<div align="center"><img src="https://i.imgur.com/bywZBzN.png" title="source: imgur.com" /></div>

13. Na imagem abaixo, vemos o Pipeline CI/CD concluído com êxito!

<div align="center"><img src="https://i.imgur.com/tMa36um.png" title="source: imgur.com" /></div>

14. No Dockerhub, as 2 versões da imagem da aplicação foram criadas com sucesso!

<div align="center"><img src="https://i.imgur.com/mpHlUDz.png" title="source: imgur.com" /></div>

15. O Deploy está funcionando!

<div align="center"><img src="https://i.imgur.com/UmCQWHt.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/L338M2G.png" title="source: imgur.com" width="138px"/> | **DESAFIO:** Faça alguma alteração no texto do Método hello(), da Classe HelloController, atualize o seu Repositório Remoto github_actions e acompanha a execução do Workflow. A melhor forma de aprender e compreender como funciona um pipeline CI/CD é praticando! |
| ------------------------------------------------------------ | :----------------------------------------------------------- |

<br />

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://docs.github.com/pt/actions" target="_blank"><b>Documentação: <i>Github Actions</i></b></a>

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://github.com/marketplace?type=actions" target="_blank"><b>Github Actions - Marketplace</b></a>
<br />

<h3>Github Actions Templates Utilizadas neste Cookbook</h3>

<br />

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://github.com/marketplace/actions/checkout" target="_blank"><b>Documentação: <i>Github Actions - Github Checkout Template</i></b></a>

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://github.com/marketplace/actions/setup-java-jdk" target="_blank"><b>Documentação: <i>Github Actions - Java Template</i></b></a>

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://github.com/marketplace/actions/docker-login" target="_blank"><b>Documentação: <i>Github Actions - Dockerhub Login Template</i></b></a>

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://github.com/marketplace/actions/build-and-push-docker-images" target="_blank"><b>Documentação: <i>Github Actions - Dockerhub Push Template</i></b></a>

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://github.com/marketplace/actions/setup-node-js-environment" target="_blank"><b>Documentação: <i>Github Actions - Node Template</i></b></a>

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://blog.railway.app/p/github-actions" target="_blank"><b>Documentação: <i>Github Actions - Railway Template</i></b></a>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
