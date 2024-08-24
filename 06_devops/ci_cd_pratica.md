<h1>Github Actions - Atividade Prática</h1>



Antes de iniciarmos a criação do nosso Pipeline Ci/CD no Github Actions, vamos entender o Workflow, que será construído, através da imagem abaixo:

<div align="center"><img src="https://i.imgur.com/h3KXYdm.png" title="source: imgur.com" /></div>

1. A pessoa desenvolvedora escreve os testes e o código da aplicação da aplicação
2. Ao finalizar, envia o projeto para o Repositório Remoto no Github
3. Ao efetuar o push, o Workflow criado no Github Actions, será automaticamente inicializado
4. A 1º tarefa é executar os testes escrito no JUnit 5, para validar o código
5. A 2º tarefa é criar o Build da aplicação e gerar uma imagem Docker. Esta imagem será enviada para o Dockerhub
6. A 3º e ultima tarefa será o Deploy da aplicação no Render

Nesta atividade prática do Github Actions, vamos utilizar o serviço de hospedagem **Render**, que na sua versão gratuita oferece integração com o Github Actions.

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

5. No **Git Bash**, execute o comando abaixo para clonar o projeto guia **cicd_helloworld**:

```bash
git clone https://github.com/conteudoGeneration/cicd_helloworld.git
```

6. Após a clonagem, será criada a pasta **cicd_helloworld** dentro da pasta Workspace.
7. Antes de continuarmos, precisamos apagar a pasta **.git**, na pasta **cicd_helloworld**, caso contrário não será possível enviar o projeto para o seu Github ao conluir as atividades.
8. Abra a pasta **cicd_helloworld** e localize a pasta **.git**

<div align="center"><img src="https://i.imgur.com/bKkOto4.png" title="source: imgur.com" width="85%"/></div>

9. Caso esta pasta não esteja sendo exibida, na janela do Windows Explorer, clique na **Guia Exibir** e na sequência no botão **Opções**. Na janela **Opções de Pasta**, na **Guia Modo de Exibição**, no item **Configurações avançadas**, localize a opção: **Pastas e arquivos ocultos** e marque a opção **Mostrar arquivos, pastas e unidades ocultas** (como mostra a figura abaixo). Em seguida clique em **OK** para concluir.

<div align="center"><img src="https://i.imgur.com/n8hQu12.png" title="source: imgur.com" /></div>

10. Apague a pasta **.git**

<br />

<h2>👣 Passo 02 - Importar o projeto no STS</h2>



1. No STS, importe o projeto **cicd_helloworld**, através do menu **File 🡢 Import**
2. Será aberta a janela **Import**. Clique na opção **Maven 🡢 Existing Maven Projects**, como mostra a figura abaixo e clique no botão **Next**.

<div align="center"><img src="https://i.imgur.com/OzD5iOi.png" title="source: imgur.com" /></div>

3. Na  janela **Import Maven Projects**, clique no botão **Browse...** e selecione a pasta **cicd_helloworld**, como mostra a figura abaixo e clique no botão **Finish** para concluir.

<div align="center"><img src="https://i.imgur.com/kzyEBfB.png" title="source: imgur.com" width="65%"/></div>

4. Na imagem abaixo, você confere o Projeto **cicd_helloworld** após ser importado para o STS.

<div align="center"><img src="https://i.imgur.com/QkADJVI.png" title="source: imgur.com" /></div>

5. Observe que o projeto já possui um Teste Unitário implementado e já está todo configurado para ser feito o Deploy no Render via Dockerfile. Para simplificar o processo, o projeto não possui um Banco de dados, é um simples Hello World!.

<br />

<h2>👣Passo 03 - Envie o projeto para o seu Github</h2>



1. Crie um novo repositório no seu Github chamado **cicd_helloworld**
1. Na pasta do projeto no STS, clique com o botão direito do mouse e na sequência clique na opção:  **Show in 🡢 System Explorer**

<div align="center"><img src="https://i.imgur.com/72JjCAi.png" title="source: imgur.com" /></div>

3. Abra a pasta **cicd_helloworld**

<div align="left"><img src="https://i.imgur.com/Tibtn4y.png" title="source: imgur.com" /></div>

4. Dentro da pasta **cicd_helloworld**, clique com o botão direito do mouse e clique na opção: **Git Bash Here**


<div align="center"><img src="https://i.imgur.com/A93QtUn.png" title="source: imgur.com" /></div>

5. No **Git Bash**, execute a sequência de comandos abaixo para conectar  a sua pasta **nomedoprojeto** com o Repositório Remoto **cicd_helloworld**.

```bash
git init
 
git remote add origin https://github.com/PIGeneration/cicd_helloworld.git

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


6. Ainda no **Git Bash**, execute a sequência de comandos abaixo para enviar o seu projeto para o Repositório Remoto **cicd_helloworld**.

```bash
 git add .
 
 git commit -m “Projeto CI CD - Github Actions”
 
 git push -u origin main
```

7. O seu Repositório estará semelhante a imagem abaixo: 

<div align="center"><img src="https://i.imgur.com/eALUYpN.png" title="source: imgur.com" /></div>

<br />

<h2>👣Passo 04 - Criar a conta no serviço de hospedagem Render</h2>



<br />


| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <p align="justify"> **ATENÇÃO:**  *Caso você já possua ou já tenha criado a sua Conta Grátis no Render, pode ignorar este Passo*. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h3>4.1 O que é o Render?</h3>



O Render é uma plataforma unificada para criar e executar todos os seus aplicativos e sites. O Render permite criar e executar todos os seus aplicativos e sites com SSL gratuito, um CDN global, redes privadas e implantações automáticas do Git. 

> Uma **CDN** (Rede de Entrega de Conteúdo) é um grupo de servidores geograficamente distribuídos que aceleram a entrega do conteúdo da Web, aproximando-o de onde os usuários estão. 

O Render é classificado como um **PaaS** (plataforma como serviço), ou seja, é um conjunto de serviços para criar e gerenciar  aplicativos na nuvem. PaaS fornece os componentes de infraestrutura, que permitem que as pessoas Desenvolvedoras criem, integrem, migrem,   implementem, protejam e gerenciem aplicativos móveis e da web, de forma  simples e rápida.

> **Modelos de Serviços na Nuvem:**
>
> - **Plataforma como um serviço (PaaS):** Um provedor de  serviços oferece acesso a um ambiente baseado em cloud no qual os  usuários podem desenvolver e fornecer aplicativos. Além do **Render**, o **Render** e o **Azure** da Microsoft também utilizam este modelo.
> - **Infraestrutura como um serviço (IaaS):**  Um provedor de serviços fornece aos clientes acesso Pay As You Go (Pague pelo que  você usar), para  armazenamento, rede, servidores e outros recursos de  computação na  cloud. O **AWS da Amazon e a Digital Ocean** seguem este modelo.
> - **Software como um serviço (SaaS):** Um provedor de  serviços oferece softwares e aplicativos por meio da  Internet. Os  usuários subscrevem ao software e o acessam por meio da web ou de API's  do fabricante. o **Google Apps e do Microsoft Office 365** seguem este modelo.

Um grande diferencial do Render é que ele oferece **contas gratuítas**, com algumas limitações, que permitem hospedar aplicações desenvolvidas em diversas linguagens e **01 Banco de dados PostgreSQL**.

**Principais Limitações do Plano Gratuito:**

- Se a aplicação ficar **15 minutos sem receber nenhuma requisição**, o aplicativo é finalizado e será reiniciado somente quando receber outra requisição, para economizar os recursos da plataforma.
- Os servidores do Render estão disponíveis apenas na Europa, Ásia e nos Estados Unidos.
- Os recursos de Memória, Disco e Processamento são  limitados, logo a aplicação e principalmente o Banco de dados não podem  ser muito grandes.
- Aceita **apenas um Banco de dados por conta**;
- O **tráfego mensal é limitado a 750 horas somando todas as aplicações e o Banco de dados**, ou seja, se ultrapassar este valor antes do mês acabar, sua conta ficará suspensa até o mês seguinte;
- Dependendo da linguagem, o Deploy da aplicação deverá ser realizado via Docker.

<br />

<div align="left"><img src="https://i.imgur.com/nnCZtX8.png" title="source: imgur.com" width="25px"/> <a href="https://render.com/docs/free" target="_blank"><b>Documentação: Render - Plano Gratuíto</b></a></div>

<br />

Vamos criar a conta no Render para fazermos o Deploy:

1) Acesse o endereço: **https://www.render.com**

<div align="center"><img src="https://i.imgur.com/1VVzxQD.png" title="source: imgur.com" width="90%"/></div>

2. Existem diversas formas de criar uma conta no Render. Neste Guia utilizaremos a conta do Github. Clique no link **GitHub**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/xfjXrJ8.png" title="source: imgur.com" /></div>

3. Na próxima janela, digite o endereço do e-mail e a senha da sua conta do Github, e em seguida clique no botão **Sign in**

<div align="center"><img src="https://i.imgur.com/gOhiPeU.png" title="source: imgur.com" /></div>

4. Na próxima janela, autorize o Render a acessar a sua conta do Github, clicando no botão **Authorize Render**.

<div align="center"><img src="https://i.imgur.com/H3q1w18.png" title="source: imgur.com" /></div>

5. Na próxima janela, confirme se o endereço do e-mail está correto e clique no botão **COMPLETE SIGN UP**

<div align="center"><img src="https://i.imgur.com/AA50W1E.png" title="source: imgur.com" /></div>

6. Na próxima janela, será exibida uma mensagem solicitando que você verifique se recebeu uma mensagem no seu e-mail para validar a sua conta no Render. Abra a sua conta de e-mail e verifique se o e-mail foi recebido. Caso não tenha recebido, clique no botão **RESEND VERIFICATION EMAIL**.

<div align="center"><img src="https://i.imgur.com/rZGSHqM.png" title="source: imgur.com" /></div>

7. Abra o e-mail enviado pelo Render (semelhante a imagem abaixo) e **clique no link para validar a sua conta**.

<div align="center"><img src="https://i.imgur.com/wlXD6G8.png" title="source: imgur.com" /></div>

8. Depois de clicar no link, sua conta será validada e será redirecionada para a tela do **Dashboard**.

<div align="center"><img src="https://i.imgur.com/AusmZfX.png" title="source: imgur.com" /></div>

<br />


| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <p align="justify"> **ATENÇÃO:**  *Conclua todas etapas do processo de criação da conta no Render antes de avançar para o próximo passo do Deploy*. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>👣Passo 05 - Criar um novo Webservice no Render</h2>



1. Na barra de menus principal do Render, clique no item Dashboard, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/AYQts2Z.png" title="source: imgur.com" /></div>

2. Para adicionar um novo Web Service, no Dashboard do Render, clique no botão **New +** e em seguida clique na opção **Web Service**.

<div align="center"><img src="https://i.imgur.com/FVGlwLN.png" title="source: imgur.com" /></div>

3. Na janela **Create a new Web Service**, mantenha a primeira opção selecionada **Build and deploy from a Git repository** e clique no botão **Next** para continuar.

<div align="center"><img src="https://i.imgur.com/riRmjXa.png" title="source: imgur.com" /></div>

4. No item **GitHub**, clique no link **+ Connect account**, para conectar a sua conta do Render com a sua Conta do Github.

<div align="center"><img src="https://i.imgur.com/xaffIQz.png" title="source: imgur.com" /></div>

5. Na tela, **Install Render**, clique no seu usuário do Github (no exemplo, rafaelproinfo), como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/hfSfPEx.png" title="source: imgur.com" /></div>

6. Na próxima tela, clique no botão **Install**, para concordar que o Render acesse a sua Conta do Github.

<div align="center"><img src="https://i.imgur.com/Mvp1eX5.png" title="source: imgur.com" /></div>

7. Conecte o Render com o Repositório onde você enviou o projeto **cicd_helloworld**, clicando no botão **Connect**, localizado ao lado do Repositório.

<div align="center"><img src="https://i.imgur.com/j69qScH.png" title="source: imgur.com" /></div>

8. Na próxima tela, informe o nome da sua aplicação na propriedade **Name** (hellocicd) e verifique se a propriedade **Runtime** está com a opção **Docker** selecionada.

<div align="center"><img src="https://i.imgur.com/LYVmDk1.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="120px"/> | <p align="justify"> **ATENÇÃO:** O NOME DO PROJETO NÃO PODE CONTER LETRAS MAIUSCULAS, NUMEROS OU CARACTERES ESPECIAIS. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

9. Role a tela para baixo e verifique se o Plano Gratuito (**Free**) está selecionado.

<div align="center"><img src="https://i.imgur.com/ZUU3Et2.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <p align="justify"> **ATENÇÃO:** Caso seja selecionado um plano diferente, o Render exigirá o Cartão de Crédito para emitir a fatura do serviço. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

10. Clique no botão **Create Web Service** para criar o Web Service e iniciar o Deploy.

<div align="center"><img src="https://i.imgur.com/3IFof7N.png" title="source: imgur.com" /></div>

11. Acompanhe o processo do Deploy no **Log do Web Service**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/9IDFRMP.png" title="source: imgur.com" /></div>

12. Ao **finalizar a criação da imagem e do Container Docker**, será exibida a mensagem: **DONE**, como mostra a imagem abaixo e na sequência a aplicação será iniciada.

<div align="center"><img src="https://i.imgur.com/9dmvu47.png" title="source: imgur.com" /></div>

13. Observe na imagem abaixo, que caso a aplicação inicialize sem erros, será exibida a mensagem informando que a aplicação está em execução. A mensagem é a mesma que é exibida no **Console do STS**.

<div align="center"><img src="https://i.imgur.com/alHaOeb.png" title="source: imgur.com" /></div>

14. Para **confirmar que o Deploy foi concluído com êxito**, verifique na parte superior da tela de **Log do Webservice**, se apareceu a mensagem **Live**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/7vRNY3x.png" title="source: imgur.com" /></div>

15. Para abrir a aplicação no Navegador da Internet, clique no link da aplicação, indicado na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/imw3c5q.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <p align="justify"> **ATENÇÃO:** Ao clicar no link da aplicação, o projeto pode não abrir automaticamente no navegador. Como o Docker precisa finalizar alguns processos, ele pode demorar alguns minutos para abrir. O tempo médio do processo de deploy completo do Blog Pessoal pode demorar um pouco.</p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <p align="justify"> **ALERTA DE BSM:** *Mantenha a atenção aos detalhes. Caso o nome do projeto já seja um endereço em uso no Render, ele acrescentará caracteres aleatórios depois do nome do projeto ao criar o endereço da aplicação. Exemplo: blogpessoal-wrtc.onrender.com*. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

16. Ao abrir o deploy no Navegador da Internet, o resultado será semelhante a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/krWjAPf.png" title="source: imgur.com" /></div>

<br />

<h2>❌ O Deploy não Abriu!</h2>



❌**O Deploy não abre no Navegador**

-  Se o **Console** indica que a aplicação subiu, mas ao abrir a aplicação no Navegador aparece a mensagem abaixo:

<div align="center"><img src="https://i.imgur.com/AlKoYkc.png" title="source: imgur.com" /></div>

- Clique no botão **Manual Deploy** e em seguida, clique na opção **Clear build cache & deploy** para refazer o deploy, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/3zTUQrU.png" title="source: imgur.com" /></div>

- Aguarde a conclusão e tente abrir novamente

<br />

❌**O Deploy Falhou**

- Se aparecer a mensagem **Failed**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/7SaAc4l.png" title="source: imgur.com" /></div>

- Caso não tenha aparecido mensagens de erro no **Console, na tela Log do Webservice** (O projeto Spring inicializou, mas o deploy falhou), clique no botão **Manual Deploy** e em seguida, clique na opção **Clear build cache & deploy** para refazer o deploy, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/3zTUQrU.png" title="source: imgur.com" /></div>

- Se o erro persistir, verifique se todos os passos foram executados

<br />

<h2>👣Passo 06 - Obter o Service ID do seu Deploy</h2>



Antes de criarmos o Pipeline CI-CD, precisamos configurar o projeto para conectar com o Github Actions. Primeiro vamos obter a chave de conexão com o Webservice criado no Render, chamada **Service ID**:

1. No menu lateral do Serviço **hellocicd**, do lado esquerdo da tela, clique na opção **Settings**:

<div align="center"><img src="https://i.imgur.com/P2VuHwx.png" title="source: imgur.com" /></div>

2. Role a tela para baixo e localize a opção **Deploy Hook**:

<div align="center"><img src="https://i.imgur.com/msOQKcb.png" title="source: imgur.com" /></div>

3. Na opção **Deploy Hook**, copie apenas o trecho do endereço marcado em vermelho, como mostra na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/49UQXlT.png" title="source: imgur.com" /></div>

4. No exemplo acima, a **Service ID** do serviço seria: **srv-cl0qu72s1bgc73ad9b80**.

<br />

<h2>👣Passo 07 - Criar uma API Key</h2>



Neste passo, vamos criar uma chave de conexão com a conta do Render, chamada **API-KEY**:

1. A lado botão **New**, clique no seu **Perfil**:

<div align="center"><img src="https://i.imgur.com/iKUzaWN.png" title="source: imgur.com" /></div>

2. No menu que será aberto, clique na opção **Account Settings**:

<div align="center"><img src="https://i.imgur.com/ZImcbRZ.png" title="source: imgur.com" /></div>

3. No menu laterla, do lado esquerdo da tela, clique na opção **API Keys**:

<div align="center"><img src="https://i.imgur.com/m6B8dbq.png" title="source: imgur.com" /></div>

4. Na opção **API Keys**, clique no botão **Create API Key**:

<div align="center"><img src="https://i.imgur.com/pxh9IFd.png" title="source: imgur.com" /></div>

5. Na janela **Create API Key**, dê um nome para a API Key (Github Actions) e clique no botão **Create API Key**:

<div align="center"><img src="https://i.imgur.com/QyVd7NO.png" title="source: imgur.com" /></div>

6. Na janela **API Key Created**, copie a Chave que foi criada clicando no botão **Copy**, cole o conteúdo em um arquivo do Bloco de Notas e Salve. **Caso você não faça a cópia da Chave neste momento, você terá repetir este processo novamente.** Uma vez que você clicar no botão **Done** não será possível recuperar a Chave.
7. Na sequência, clique no botão **Done** para finalizar.

<div align="center"><img src="https://i.imgur.com/CEXJLMN.png" title="source: imgur.com" /></div>

8. Caso você tenha esquecido de copiar, clique no botão **Revoke** para cancelar a Chave e crie novamente.

<div align="center"><img src="https://i.imgur.com/wmy7diw.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="100px"/> | <p align="justify"> **ATENÇÃO:** Não compartilhe a API Key com terceiros. Através desta Chave, pessoas não autorizadas poderão acessar todos os Deploys na sua conta no Render.</p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>👣Passo 08 - Adicionar as Secrets no Repositório do Github</h2>



**Secrets do Github**, são variáveis de ambiente, utilizadas para proteger dados confidenciais (usuário, senha, token, entre outros) que serão utilizadas no Workflow do Github Actions.

No Nosso Workflow serão criadas 4 secrets:

| Nome                   | Descrição                       |
| ---------------------- | ------------------------------- |
| **DOCKERHUB_USERNAME** | Usuário do Dockerhub            |
| **DOCKERHUB_TOKEN**    | Senha do Dockerhub              |
| **RENDER_SERVICE_ID**  | ID copiado do Serviço do Render |
| **RENDER_API_KEY**     | Chave gerada no Render          |

<br />

1. No seu repositório **cicd_helloworld**, clique na **Guia Settings**.

<div align="center"><img src="https://i.imgur.com/psY71Yp.png" title="source: imgur.com" /></div>

2. Em **Settings**, no menu lateral esquerdo, clique na opção **Secrets**.

<div align="center"><img src="https://i.imgur.com/PnmK1zj.png" title="source: imgur.com" /></div>

3. Em **Secrets**, clique na opção **Actions**.

<div align="center"><img src="https://i.imgur.com/Fh5pFOu.png" title="source: imgur.com" /></div>

4. Na janela **Actions secrets**, clique no botão **New repository secret**.

<div align="center"><img src="https://i.imgur.com/dVc2AlD.png" title="source: imgur.com" /></div>

5. Na janela, **New secret**, configure a primeira secret, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/7XJCZtI.png" title="source: imgur.com" /></div>

6. Repita os passos 4 e 5 para criar as demais secrets. Ao final, você terá 4 secrets criadas no seu repositório remoto, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/Dd70jS8.png" title="source: imgur.com" /></div>

<br />

<h2>👣Passo 09 - Criar o Workflow</h2>



Vamos criar o nosso Workflow dentro do repositório remoto **github_actions**, num arquivo no formato yml. 

1. No seu repositório, clique na **Guia Actions**.

<div align="center"><img src="https://i.imgur.com/NjuWI3a.png" title="source: imgur.com" /></div>

2. Na sequência, clique no link: **set up a workflow yourself**, para entrar no Editor de arquivos.

<div align="center"><img src="https://i.imgur.com/1qdqQKu.png" title="source: imgur.com" /></div>

3. Observe que será gerado um novo arquivo chamado **main.yml**. Neste arquivo iremos inserir todas as etapas do nosso Pipeline CI/CD. 
4. Observe que no canto direito da tela do editor, temos o **Github Actions Marketplace**, que é um repositório contendo vários templates (receitas prontas) de Actions, que podemos utilizar em nossos Workflows.

<div align="center"><img src="https://i.imgur.com/gj3X5JN.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="80px"/> | <div align="left"> **DICA:** *Para explorar o repositório de templates do Github Actions, consulte o link <a href="https://github.com/marketplace?type=actions"><b>Github Actions Marketplace</b></a>.* </div> |
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
    name: CD - Deploy no Render
    runs-on: ubuntu-22.04
    needs: run_build
    steps:
      - name: Deploy to production
        uses: johnbeynon/render-deploy-action@v0.0.8
        with:
          service-id: ${{ secrets.RENDER_SERVICE_ID }}
          api-key: ${{ secrets.RENDER_API_KEY }}

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

<div align="center"><img src="https://i.imgur.com/bkoZDHW.png" title="source: imgur.com" /></div>

**Linha 53:** Inicia o segundo job que será executado, com o identificador **run_deploy**. Esse job será responsável por efetuar o deploy da aplicação no serviço de hospedagem Render.

**Linha 54:** A palavra-chave **name** indica o nome que será exibido durante a execução do job.

**Linha 55:** A palavra-chave **runs-on** indica onde o job será executado. No nosso exemplo, o job **run_build** será executado no **Ubuntu Linux**, **versão 22.04**, que está hospedado dentro do Github.

**Linha 56:** A palavra-chave **needs** indica que o job **run_deploy** será executado somente depois que o job **run_build** for concluído com sucesso.

**Linha 57:** A palavra-chave **steps** agrupa todas as etapas que serão executadas durante o job **run_test**. Cada job em um Workflow tem a sua própria seção **steps**.

**Linha 58:** A palavra-chave **name** indica o nome do step. Em nosso exemplo, Deploy Production.

**Linha 59:** A palavra-chave **uses** usa a ação **johnbeynon/render-deploy-action@v0.0.8**, versão 0.0.8, para conectar com o Render e iniciar um novo Deploy.

**Linhas 60 a 62:**  A palavra-chave **with** indica o Service ID e o API Key do Render, que estão armazenadas nas Secrets do Github **RENDER_SERVICE_ID** e **RENDER_API_KEY**.

<br />

Agora que compreendemos o código, vamos prosseguir a construção do Workflow:

6. Insira o código acima no arquivo **main.yml**, e clique no botão **Start commit**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/sjS7hPZ.png" title="source: imgur.com" /></div>

7. Clique no botão **Commit new file**, para adicionar o arquivo **main.yml** no repositório.

<div align="center"><img src="https://i.imgur.com/ze2Gs3F.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="110px"/> | <div align="left"> **ATENÇÃO:** O arquivo main.yml ficará armazenado na pasta .github/workflows. Caso você crie novos Workflows, os arquivos também serão armazenados nesta pasta.</div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

8. Clique na **Guia Actions**, para acompanhar a execução do Workflow:

<div align="center"><img src="https://i.imgur.com/x6cNZqz.png" title="source: imgur.com" /></div>

9. Observe que o **job** que estiver em execução estará com uma animação na cor amarela:

<div align="center"><img src="https://i.imgur.com/Dqpm4fO.png" title="source: imgur.com" /></div>

10. O **job** que for concluído com sucesso estará um check na cor verde:

<div align="center"><img src="https://i.imgur.com/Hfl7hEE.png" title="source: imgur.com" /></div>

11. O **job** que apresentou falha de execução estará com um X vermelho e os próximos jobs não serão executados:

<div align="center"><img src="https://i.imgur.com/QXYy563.png" title="source: imgur.com" /></div>

12. Ao iniciar o terceiro job (Deploy no Render), um novo deploy será iniciado no serviço do Render. Toda vez que o seu repositório receber uma nova atualização, automaticamente o Workflow será executado e o deploy será atualizado. 
12. Volte no serviço **hellocicd**, na sequência, no menu lateral do Serviço, do lado esquerdo da tela, clique na opção **Events**:

<div align="center"><img src="https://i.imgur.com/1yeSHtx.png" title="source: imgur.com" /></div>

14. Observe que um novo Deploy foi inicializado:

<div align="center"><img src="https://i.imgur.com/ykcB9o7.png" title="source: imgur.com" /></div>

15. Você poderá acompanhar o Deploy através da tela de log, clicando sobre o link **Deploy started**.

<div align="center"><img src="https://i.imgur.com/4SUkj4R.png" title="source: imgur.com" /></div>

16. Na imagem abaixo, vemos o Pipeline CI/CD concluído com êxito!

<div align="center"><img src="https://i.imgur.com/2P6973z.png" title="source: imgur.com" /></div>

17. Observe que na sua conta do **Dockerhub**, que as 2 versões da imagem da aplicação foram criadas com sucesso!

<div align="center"><img src="https://i.imgur.com/3fA44Jl.png" title="source: imgur.com" /></div>

18. Note que o Deploy também está funcionando!

<div align="center"><img src="https://i.imgur.com/krWjAPf.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/L338M2G.png" title="source: imgur.com" width="138px"/> | **DESAFIO:** Faça alguma alteração no texto do Método hello(), da Classe HelloController, atualize o seu Repositório Remoto e acompanhe a execução do Workflow. A melhor forma de aprender e compreender como funciona um pipeline CI/CD é praticando! |
| ------------------------------------------------------------ | :----------------------------------------------------------- |

<br />

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://docs.github.com/pt/actions" target="_blank"><b>Documentação: <i>Github Actions</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://github.com/marketplace?type=actions" target="_blank"><b>Github Actions - Marketplace</b></a></div>

<br />


<h3>Github Actions Templates Utilizadas neste Cookbook</h3>

<br />

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://github.com/marketplace/actions/checkout" target="_blank"><b>Documentação: <i>Github Actions - Github Checkout Template</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://github.com/marketplace/actions/setup-java-jdk" target="_blank"><b>Documentação: <i>Github Actions - Java Template</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://github.com/marketplace/actions/docker-login" target="_blank"><b>Documentação: <i>Github Actions - Dockerhub Login Template</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://github.com/marketplace/actions/build-and-push-docker-images" target="_blank"><b>Documentação: <i>Github Actions - Dockerhub Push Template</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/NUt6bS8.png" title="source: imgur.com" width="4%"/> <a href="https://github.com/marketplace/actions/render-deploy-action" target="_blank"><b>Documentação: <i>Github Actions - Render Template</i></b></a></div>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
