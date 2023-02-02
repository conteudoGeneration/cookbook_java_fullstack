<h1>Trabalhando em equipe no Git - Fluxo Git</h1>

Um Fluxo de trabalho do Git é uma receita ou recomendação sobre como usar o Git para realizar o trabalho de maneira consistente e produtiva. Os fluxos de trabalho do Git incentivam os usuários a aproveitar o Git de modo eficiente e consistente.

<h2>1) O que é um fluxo de trabalho bem-sucedido do Git?</h2>

Ao avaliar um fluxo de trabalho para sua equipe, o mais importante é entender a cultura da equipe. O fluxo de trabalho tem como objetivo melhorar a eficácia da equipe e não ser uma carga que limita a produtividade da equipe.

Algumas coisas importantes devem ser questionadas ao avaliar a eficiência de um fluxo de trabalho do Git, entre elas:

- O fluxo de trabalho é dimensionado com o tamanho da equipe?

- O fluxo de trabalho simplifica o processo de desfazer erros?

- O fluxo de trabalho impõe alguma nova sobrecarga cognitiva desnecessária à equipe?
  
<h3>1.1) Tipos de Fluxo </h3>

-   **Fluxo de trabalho centralizado:** A ideia central por trás do Fluxo de trabalho centralizado é que todo o desenvolvimento de recursos deve ocorrer na branch main.

<div align="center"><img src="https://i.imgur.com/hwksZ3o.png" title="source: imgur.com" /></div>

-   **Fluxo de trabalho de ramificação de recurso:**  A ideia central por trás do Fluxo de trabalho de ramificação de recursos é que cada feature deve ocorrer em uma Branch dedicada, que só é enviada para a Branch Main quando se torna parte de uma nova versão.

<div align="center"><img src="https://i.imgur.com/nmRQnQc.png" title="source: imgur.com" /></div>

-   **Fluxo de trabalho Gitflow:** Define um modelo de ramificação rigoroso projetado com base no lançamento do projeto oferecendo uma estrutura robusta para gerenciar grandes projetos. 

<div align="center"><img src="https://i.imgur.com/ia9GWIP.png" title="source: imgur.com" /></div>

<br />

<img width="30px" src="https://i.imgur.com/GQKtp6q.png" title="source: imgur.com" />  Para saber mais sobre o GitFlow, assista ao vídeo *Trabalhando em equipe com Git Flow* no link: <a href="https://www.youtube.com/watch?v=394mc6PV8t8" target="_blank">https://www.youtube.com/watch?v=394mc6PV8t8</a>

<br />

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="80px"/> | <div align="left"> **DICA:** *Existem outros Modelos de Fluxo Git. Os 3 citados acima são os mais populares.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

No projeto Integrador, utilizaremos o modelo <b>Fluxo de trabalho de Ramificação de recurso</b>, conforme a estrutura detalhada nas figuras abaixo, onde cada <b>Task</b> do Projeto Integrador será uma <b>Feature Branch</b> no Repositório Remoto no Github.

<div align="center"><img src="https://i.imgur.com/59o9NhC.png" title="source: imgur.com" width="95%"/></div>

<i>Fluxo de trabalho do Bloco 02 - Backend</i>

<div align="center"><img src="https://i.imgur.com/Ig34RBB.png" title="source: imgur.com" width="95%"/></div>

<i>Fluxo de trabalho do Bloco 03 - Frontend</i>

O Fluxo do Backend acontecerá no repositório do Backend, enquanto o fluxo do Frontend acontecerá no repositório do Frontend. 

<i>Organização proposta dos Repositórios Remotos na Organização</i>

<table border="1" width="100%">
	<tr>
		<td><b>Repositório</b></td>
		<td><b>Conteúdo</b></td>
	</tr>
	<tr>
		<td><b>Documentação</b></td>
		<td>Arquivos contendo a documentação da API: <br />
		- Documentação  do Banco de Dados (DER, SQL e Dicionário de dados)<br />
		- Documentação do Backend (Abertura de projeto, Dicionário de Atributos e PDF do Swagger)<br />
		- Documentação do Frontend
		</td>
	</tr>
	<tr>
		<td><b>Backend</b></td>
		<td>Projeto Spring completo (Bloco 02)</td>
	</tr>
	<tr>
		<td><b>Frontend</b></td>
		<td>Projeto Angular/React Completo (Bloco 03)</td>
	</tr>
</table>

No Capítulo 04 vamos compreender como iniciar o Fluxo Git dentro de um Time Scrum. Nos Capítulos seguintes faremos uma breve revisão do Git, onde mostraremos algumas situações corriqueiras do Git e do Github.

<h2>2) Insights</h2>

Um recurso interessante do Github é o **Insights**. Com ele é possível acompanhar através de gráficos e dados estatísticos a colaboração de cada membro da equipe com o projeto e os dados estatísticos do repositório como um todo.

1. Para acessar, clique no link <img width="75px" src="https://i.imgur.com/B2TmWS9.png" title="source: imgur.com" /> do repositório remoto no github. 

2. Na próxima janela, clique em **Contributors**. Você verá uma janela semelhante a figura abaixo:

<div align="center"><img src="https://i.imgur.com/7QDsSko.png" title="source: imgur.com" /></div>

Observe que cada usuário adicionado possui o seu gráfico de colaboração no repositório.

<h2>3) Configurando o VSCode como Editor Oficial do Git</h2>

Vamos configurar o Microsoft VIsual Studio Code como a IDE padrão do Git, desta forma poderemos utilizar os recursos que o VSCode oferece para resolução de conflitos.

1.  Verifique se o **VSCode** está instalado na sua máquina 

2. Caso não esteja, faça o download no link: <a href="https://code.visualstudio.com/download"/> https://code.visualstudio.com/download e faça a instalação

Caso Você tenha alguma dúvida, utilize o **Guia de Instalação do VSCode** e siga o passo a passo da instalação.

3.  Após confirmar ou instalar o VSCode, abra **o Git Bash**
    
4.  Configure o VSCode como o Editor padrão do Git através do comando abaixo:
	```bash
	git config --global core.editor 'code --wait'
	```

<h2>4) Iniciando um Fluxo de Trabalho Git</h2>

Antes de começarmos, todos os integrantes do grupo devem criar o Repositório Local no seu computador, que será conectado ao Repositório Remoto no Github e criaremos a **Workspace no STS**. 

1. Para criar o Repositório Local, crie uma pasta na Área de trabalho chamada **projeto_integrador** 

<h3>4.1) Criando a Worksapce do Projeto Integrador (Todes)</h3>

**Workspace (Espaço de Trabalho)** é a pasta onde você está  trabalhando dentro do STS, ou seja, a pasta onde tudo que você fizer no STS será salvo. 

Quando você inicia o STS pela primeira vez , uma tela semelhante a imagem abaixo é exibida solicitando o caminho da pasta onde o seu  Workspace será criado.

<div align="center"><img src="https://i.imgur.com/3i7udIl.png" title="source: imgur.com" /></div>

Para manter o Projeto Integrador separado dos outros projetos criados em aula, vamos criar uma Workspace exclusiva no STS.

1. Abra o **STS**
2. Clique no Menu **Flile 🡪 Switch Workspace 🡪 Other...**

<div align="center"><img src="https://i.imgur.com/RnVknE1.png?1" title="source: imgur.com" width="600px"/></div

3. No item **Workspace**, adicione a pasta **projeto_integrador**, criada na **Área de Trabalho**. Deixe marcada a opção **Preferences**, para copiar as configurações atuais do STS na nova Workspace. Clique no botão **Launch** para concluir.

<div align="center"><img src="https://i.imgur.com/TQmxZyL.png" title="source: imgur.com" width="500px"/></div>

4. Aguarde o STS reiniciar.

<h3>4.2) Criar o projeto Spring (Product Owner)</h3>

1. No STS, crie o projeto Spring com o nome do seu projeto, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/u6Kewpk.png" title="source: imgur.com" width="50%"/></div>

2. Adicione as **Dependências do Projeto**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/GlgVWZe.png" title="source: imgur.com" width="50%"/></div>

3. Configure o Banco de Dados no arquivo **application.properties**. Não esqueça de configurar o **nome do Banco de dados** com o **nome do seu projeto** e **alterar a senha do usuário root** de acordo com a senha do MySQL do seu computador.

```properties
spring.jpa.hibernate.ddl-auto=update
spring.jpa.database=mysql
spring.datasource.url=jdbc:mysql://localhost/db_nomedoprojeto?
createDatabaseIfNotExist=true&serverTimezone=America/Sao_Paulo&useSSl=false
spring.datasource.username=root
spring.datasource.password=root

spring.jpa.show-sql=true

spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.MySQL8Dialect

spring.jackson.date-format=yyyy-MM-dd HH:mm:ss
spring.jackson.time-zone=Brazil/East
```
**Observação:** A terceira linha do arquivo **application.properties**  está dividida em 2 linhas no pdf. No STS mantenha tudo em uma única linha.

4. Execute a aplicação e verifique se o Banco de dados foi criado.

<h3>4.3) Enviar o projeto para o Github (Product Owner)</h3>

1. Na pasta do projeto no STS, clique com o botão direito do mouse e na sequência clique na opção:  **Show in 🡢 System Explorer**

<div align="center"><img src="https://i.imgur.com/H6FZeu8.png" title="source: imgur.com" /></div>

2. A pasta **Workspace projeto_integrador** estará semelhante a imagem abaixo:

<div align="left"><img src="https://i.imgur.com/cSGOKR5.png" title="source: imgur.com" /></div>

3. Abra a pasta **nomedoprojeto**

4. Dentro da pasta **nomedoprojeto**, clique com o botão direito do mouse e clique na opção: **Git Bash Here**

<div align="center"><img src="https://i.imgur.com/A93QtUn.png" title="source: imgur.com" /></div>

5. No **Git Bash**, execute a sequência de comandos abaixo para conectar  a sua pasta **nomedoprojeto** com o Repositório Remoto **backend**.

```bash
git init
 
git branch -M master main

git remote add origin https://github.com/Projeto-Integrador-Modelo/backend.git
 
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

6. Ainda no **Git Bash**, execute a sequência de comandos abaixo para enviar o seu projeto para o Repositório Remoto **backend**.

```bash
 git add .
 
 git commit -m “Criar o Projeto Spring”
 
 git push -u origin main
```

7. Verifique se o Repositório Remoto no Github foi atualizado. O Repositório estará semelhante a imagem abaixo: 

<div align="center"><img src="https://i.imgur.com/fYeKho4.png" title="source: imgur.com" /></div>

<h3>4.4) Criar a Branch Task 03 (Product Owner)</h3>

Antes de criar a primeira Classe Model, vamos criar a nossa primeira **Branch** , onde será Desenvolvida a **Task3** do **Projeto Integrador**. 

1. No GitBash, crie uma nova Branch com o nome **task3**

```bash
 git checkout -b task3
```

2. Repare no prompt do Gitbash que ele mudou para a Branch Task3

<div align="left"><img src="https://i.imgur.com/CyHb0KE.png" title="source: imgur.com" /></div>

3. Ainda no **Git Bash** e execute o comando abaixo para enviar a **Branch Task 03** para o Repositório Remoto **backend**.

```bash
 git push -u origin task3
```

6. Verifique se o repositório remoto no Github foi atualizado e possui **2 Branches**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/YDGENwn.png" title="source: imgur.com" /></div>

<h3>4.5) Atualizar o Repositório Local (Scrum Master, Developers e Tester)</h3>

As Pessoas Desenvolvedoras, o Scrum Master e o Tester, antes de começarem a implementar o código da primeira Model, deverão criar o Repositório Local com todas as alterações do Repositório Remoto.

1.  Abra a pasta **projeto_integrador**, que foi criada na Área de Trabalho
2.  Crie uma pasta chamada **nomedoprojeto**.
3.  Dentro da pasta **nomedoprojeto**, clique com o botão direito do mouse e clique na opção: **Git Bash Here**

<div align="center"><img src="https://i.imgur.com/A93QtUn.png" title="source: imgur.com" /></div>

5. No **Git Bash**, execute a sequência de comandos abaixo para conectar a sua pasta **nomedoprojeto** com o repositório remoto **backend** e trazer todo o conteúdo das 2 Branches.

```bash
git init
 
git branch -M master main

git remote add origin https://github.com/Projeto-Integrador-Modelo/backend.git
 
git pull origin main

git pull origin task3

git checkout task3
 
```

6. No STS, importe o projeto **nomedoprojeto**, através do menu **File 🡢 Import**

7. Será aberta a janela **Import**. Clique na opção **Maven 🡢 Existing Maven Projects**, como mostra a figura abaixo e clique no botão **Next**.

<div align="center"><img src="https://i.imgur.com/feigT28.png" title="source: imgur.com" width="70%"/></div>

8. Na  janela **Import Maven Projects**, Clique no botão Browse e selecione a pasta **nomedoprojeto**, como mostra a figura abaixo e clique no botão **Finish** para concluir.

<div align="center"><img src="https://i.imgur.com/37EnyR2.png" title="source: imgur.com" width="70%"/></div>

<h3>4.6) Criar a Primeira Classe (Developers)</h3>

As pessoas Desenvolvedoras, estão prontas para trabalhar no código.

1. Verifique no Gitbash se a Branch atual é a Branch **task3**

<div align="left"><img src="https://i.imgur.com/CyHb0KE.png" title="source: imgur.com" /></div>

2. Crie no STS a primeira **Classe Model** no pacote (package) model

3. Execute a aplicação e verifique se a tabela foi criada no Banco de dados

4. No Gitbash, execute a sequência de comandos abaixo para enviar a primeira Classe Model para o **Repositório Remoto backend**:

```bash
git add .
    
git commit -m “Criar a primeira Classe Model”
    
git push -u origin task3
```

4. Observe que a **Classe Model** estará disponível apenas na **Branch Task 03**.

<div align="center"><img src="https://i.imgur.com/4MTxlx5.png" title="source: imgur.com" /></div>

<h3>4.7) Testes da Aplicação (Tester)</h3>

Quando as Pessoas Desenvolvedoras finalizarem o código, o Tester deverá atualizar o seu Repositório Local e testar a aplicação.

1.  Abra a pasta **projeto_integrador**, que foi criada na Área de Trabalho
2.  Abra a pasta chamada **nomedoprojeto**.
3.  Dentro da pasta **nomedoprojeto**, clique com o botão direito do mouse e clique na opção: **Git Bash Here**
5. No **Git Bash**, execute a sequência de comandos abaixo para atualizar  o Repositório Local com as atualizações do Repositório Remoto **backend**.

```bash
git pull origin main

git pull origin task3

git checkout task3 
```

6. Importe o projeto no STS e execute.
7. Faça todos os testes necessários. Dependendo da Tarefa, utilize o **Insomnia** para criar as requisições HTTP.
8. Ao concluir, se todos os testes passaram, avise ao Product Owner para ele fazer a Integração.
9. Se algum teste não passou, comunique as Pessoas Desenvolvedoras e solicite a correção do código.

<h3>4.8) Integrando a Branch Task 03 com a Branch Main (Product Owner)</h3>

Agora vamos finalizar a **Branch Task 03**, ou seja, após finalizar e testar todos os códigos implementados na Task 03, vamos integrar todo o conteúdo da Branch Task 03 com a Branch Main através do comando **git merge**.

1. No Gitbash, execute a sequência de comandos abaixo para atualizar o Repositório Local


```bash
git pull origin main

git pull origin task3

git checkout main 
```

2. Verifique no Gitbash se a Branch atual é a Branch **main**

<div align="center"><img width="900px" src="https://i.imgur.com/zUk4FgC.png" title="source: imgur.com" /></div>

3. Atualize a Branch Main com o conteúdo da Branch Task 03, atrvés do comando **Merge**

```bash
 git merge task3
```
4. Envie as atualizações para o Repositório Remoto no Github

```bash
 git push origin main
```

5. Observe que a **branch main** agora possui o mesmo conteúdo da **branch task3**

<div align="left"><img src="https://i.imgur.com/s37elHw.png" title="source: imgur.com" /></div>

6. Após a Integração, todes os Integrantes do grupo, exceto o Product Owner devem executar o comando **git pull** para atualizar o Repositório Local.

```bash
git pull origin task3

git pull origin main 
```

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="300px"/> | <div align="left"> **ALERTA DE BSM:** *Antes de começar a implementar um novo código em um projeto em grupo, não esqueça de executar o comando, git pull em todas as Branches atualizadas. Desta forma você estará evitando os famosos Conflitos Git, além de ter a certeza que você está trabalhando em cima da última versão funcional do Projeto * </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>5) Trabalhando com o Fork</h2>

O **Fork** é um recurso do Github,  que permite fazer a cópia integral de um repositório de uma pessoa desenvolvedora para o seu repositório no Github. Após você efetuar o Fork de uma repositório, você poderá editar os arquivos e posteriormente enviar para o repositório original as suas implementações e melhorias do projeto. Caso a pessoa desenvolvedora aceite as suas implementações, seus códigos passaram a fazer parte do repositório original. O processo de enviar contribuições para o repositório de origem do Fork é chamado de **Pull Request**.

Para manter o repositório atualizado com os últimos commits realizados no repositório origem, utilizamos o recurso chamado **Fetch upstream**.

<h3>5.1) Adicionando um Repositório via Fork</h3>

1. Acesse o repositório que você deseja adicionar no seu repositório remoto

2. Clique no botão <img width="90px" src="https://i.imgur.com/th2v8D1.png" title="source: imgur.com" />, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/yRqK09f.png" title="source: imgur.com" /></div>

3. Após a conclusão do Fork, o Github redirecionará para o repositório copiado. Observe que abaixo do nome do repositório está indicado a origem do repositório.

<div align="left"><img src="https://i.imgur.com/gLIwonY.png" title="source: imgur.com" /></div>

<h3>5.2) Pull Request</h3>

Agora vamos enviar uma contribuição para o repositório origem.

1. Vamos fazer uma alteração no arquivo README.md

2. Em seguida, clique no botão <img src="https://i.imgur.com/ORr7pQF.png" title="source: imgur.com" />para enviar uma contribuição

<div align="center"><img src="https://i.imgur.com/OtRz5Eb.png" title="source: imgur.com" /></div>

3. Será aberto um menu informando que existe um commit pronto para ser enviado. Clique no botão **Open pull request** para iniciar o processo de envio da contribuição.

<div align="center"><img src="https://i.imgur.com/apDhJbd.png" title="source: imgur.com" /></div>

4. O Github checará se o seu commit está apto para ser enviado para o repositório origem do Fork. Se estiver tudo OK, será exibida a mensagem **Able to merge** (marcado em verde na figura abaixo). Para continuar, clique no botão **Create pull request**.

<div align="center"><img src="https://i.imgur.com/vj2SfFo.png" title="source: imgur.com" /></div> 
5.  Será exibida uma janela para você documentar a alteração proposta. Preencha os dados e clique no botão **Create pull request** para concluir.

<div align="center"><img src="https://i.imgur.com/OB0vzVx.png" title="source: imgur.com" /></div> 

6. Em nosso exemplo, a pessoa desenvolvedora que fez o Fork é também uma pessoa colaboradora do projeto. Nesta situação específica, após o envio do pull request, o Github exibirá a área de aprovação do pull request. Para aceitar o pull request, clique no botão **Merge pull request** para adicionar o novo código no projeto.

<div align="center"><img src="https://i.imgur.com/mGJ9TKa.png" title="source: imgur.com" /></div> 

7. Será exibida uma janela para você documentar a alteração proposta. Preencha os dados e clique no botão **Confirm merge** para concluir.

<div align="center"><img src="https://i.imgur.com/YYPJgzQ.png" title="source: imgur.com" /></div> 

8. Observe que na parte superior da janela será exibida a mensagem **Merged**, indicando que as alterações foram adicionadas e na parte inferior será exibida a mensagem **Pull request closed**, indicando que a Pull request foi finalizada.

<div align="center"><img src="https://i.imgur.com/hCFiVAR.png" title="source: imgur.com" /></div>

<h3>5.3) Fetch upstream</h3>

Agora vamos atualizar o repositório Fork com todos os commits recentes do repositório origem

1. No repositório Fork, clique no botão <img src="https://i.imgur.com/HqykewR.png" title="source: imgur.com" /> para iniciar a atualização.

<div align="center"><img src="https://i.imgur.com/lcWvTNZ.png" title="source: imgur.com" /></div> 
2.  Clique no botão **Fetch and merge** para concluir.

<div align="center"><img src="https://i.imgur.com/HMnRoAX.png" title="source: imgur.com" /></div> 

3.  Ao concluir será exibida a mensagem abaixo:

<div align="center"><img src="https://i.imgur.com/TA4wgjZ.png" title="source: imgur.com" /></div> 

<h2>6) Comandos úteis</h2>

  1. Criar uma Branch no Github
```bash
git push origin task3:new-branch
```

 2. Apagar uma Branch no github
```bash
git push origin:task3
```

 3. Renomear uma Branch
```bash
git branch -m novonome
```
4. Apagar uma Branch no Repositório Local

```bash
git branch -d nome_da_branch
```

5. Clonar um Repositório Remoto

```bash
git clone https://github.com/rafaelproinfo/projeto_integrador.git
```

6. Forçar uma atualização no Repositório Remoto

```bash
git push -f origin main
```

7. Forçar uma atualização no Repositório Local

```bash
git pull -f origin main
```

<br /><br />
	
<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
