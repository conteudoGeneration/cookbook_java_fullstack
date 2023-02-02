<h1>Guia de Instalação do MySQL for Windows</h1>

<h2>Passo 01 - Download do instalador</h2>

1) Acesse o site: https://dev.mysql.com/downloads/ para efetuar o download do **MySQL Server - Community**.

2) Clique no link **MySQL installer for Windows**, conforme indicado na figura abaixo:

<div align="center"><img  src="https://i.imgur.com/wP42ICv.png" title="source: imgur.com" /></div>

3)  Clique no segundo link,  **Windows (x86, 32-bit), MSI Installer**, conforme indicado na figura abaixo:

<div align="center"><img src="https://i.imgur.com/CM8f3nz.png" title="source: imgur.com" /></div>

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="120px"/> | <p align="justify"> **ATENÇÃO:** No momento em que este guia foi escrito, a versão mais atual do MySQL era a versão 8.0.26.0. Ao utilizar este guia no futuro, pode ser que a versão mais atual seja outra* </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

4)  Clique no link **No thanks, just start my download**, para iniciar o download imediatamente sem cadastro, conforme indicado na figura abaixo:

<div align="center"><img  src="https://i.imgur.com/lpG1eSl.png" title="source: imgur.com" /></div>

5) Salve o arquivo.

<div align="center"><img src="https://i.imgur.com/zA2drj2.png" title="source: imgur.com" /></div>

6) Abra a pasta de downloads e execute o instalador com um duplo clique sobre o arquivo.

<div align="center"><img src="https://i.imgur.com/SIqI29z.png" title="source: imgur.com" /></div>

<h2>Passo 02 - Instalação e configuração</h2>

1. Na janela **Choosing a Setup Type**, marque a opção **Custom** e clique no botão **Next** para continuar.
<div align="center"><img  src="https://i.imgur.com/FhyD8L8.png" title="source: imgur.com" /></div>

2. Na janela **Select Products**, marque a opção **MySQL Server** (última versão), como mostra a figura abaixo e clique no botão <img src="https://i.imgur.com/GTcQ4fK.png" title="source: imgur.com" /> para adicionar na lista de produtos que serão instalados.
<div align="center"><img  src="https://i.imgur.com/1DNaL8e.png" title="source: imgur.com" /></div>

3. Ainda na janela **Select Products**, marque a opção **MySQL Workbench** (última versão), como mostra a figura abaixo e clique no botão <img src="https://i.imgur.com/GTcQ4fK.png" title="source: imgur.com" /> para adicionar na lista de produtos que serão instalados.
<div align="center"><img  src="https://i.imgur.com/k243e8F.png" title="source: imgur.com" /></div>

4. Verifique se a lista de produtos que serão instalados está correta e clique no botão **Next** para continuar.
<div align="center"><img  src="https://i.imgur.com/eB3OVTP.png" title="source: imgur.com" /></div>

5. Na janela **Installation**, clique no botão **Execute** para iniciar a instalação.
<div align="center"><img  src="https://i.imgur.com/CACoYmO.png" title="source: imgur.com" /></div>

6. Quando a instalação dos produtos for concluída, clique no botão **Next** para continuar.
<div align="center"><img  src="https://i.imgur.com/JKS7dd4.png" title="source: imgur.com" /></div>

7. Na janela **Product Configuration**, clique no botão **Next** para continuar.
<div align="center"><img  src="https://i.imgur.com/4DzBPNl.png" title="source: imgur.com" /></div>

8. Na janela **Type and Networking**, mantenha a configuração padrão clique no botão **Next** para continuar.
<div align="center"><img  src="https://i.imgur.com/Qj9cDvs.png" title="source: imgur.com" /></div>

9. Na janela **Authentication Method**, mantenha a configuração padrão clique no botão **Next** para continuar.
<div align="center"><img  src="https://i.imgur.com/Jy5t7Tt.png" title="source: imgur.com" /></div>

10. Na janela **Accounts and Roles**, digite uma senha para o usuário **root** (Usuário Administrador do MySQL) e clique no botão **Next** para continuar. Recomendamos que você defina a senha do MySQL como **root** (Veja a observação na próxima página).

<div align="center"><img  src="https://i.imgur.com/PAgdDkH.png" title="source: imgur.com" /></div>

<div align="center"><h2> *** Importante *** </h2></div>

Recomendamos o uso da senha **root** como senha do MySQL por se tratar de uma senha padrão, fácil de ser lembrada e que pode ser compartilhada livremente no Github. 
Caso você opte por outra senha, anote a senha em um lugar seguro e/ou utilize uma senha que você não se esquecerá no futuro. 
Outro cuidado importante é **não utilize uma senha de uso pessoal tais como e-mail, redes sociais  e etc**. Lembre-se que você irá compartilhar códigos através do Github e a sua senha ficará exposta nos repositórios do Github. 
**Caso você esqueça a sua senha  será necessário reinstalar o MySQL para cadastrar uma nova senha**.

11. Na janela **Windows Service**, mantenha a configuração padrão clique no botão **Next** para continuar.
<div align="center"><img  src="https://i.imgur.com/jJNGMCi.png" title="source: imgur.com" /></div>

12. Na janela **Apply Configuration**, clique no botão **Execute** para aplicar as configurações.
<div align="center"><img  src="https://i.imgur.com/phCVyrC.png" title="source: imgur.com" /></div>

13. Quando a configuração for concluída, clique no botão **Next** para continuar.
<div align="center"><img  src="https://i.imgur.com/68DkOKZ.png" title="source: imgur.com" /></div>

14. Na janela **Product Configuration**, clique no botão **Next** para aplicar as configurações.
<div align="center"><img  src="https://i.imgur.com/hNomVqz.png" title="source: imgur.com" /></div>

15. Na janela **Installation Complete**, clique no botão **Finish** para finalizar a instalação.
<div align="center"><img  src="https://i.imgur.com/20Odl4I.png" title="source: imgur.com" /></div>

16. Ao finalizar a instalação o **MySQL Workbench** será inicializado.
<div align="center"><img  src="https://i.imgur.com/5BYFXRe.png" title="source: imgur.com" /></div>

<h2>Passo 03 - Testando a conexão no Workbench</h2>

1. No <b>MySQL Workbench</b>, Clique sobre a Conexão <b>Local instance MySQL80</b>

<div align="center"><img src="https://i.imgur.com/HBdNTkU.png" title="source: imgur.com" /></div>

2. Caso seja solicitada a senha, <b>digite a senha do usuário root</b> e marque a opção <b>Save password in vault</b> para gravar a senha e não perguntar novamente.

<div align="center"><img src="https://i.imgur.com/xC6JFoe.png" title="source: imgur.com" /></div>

3. Será aberta a janela principal do <b>MySQL Workbench</b>. Para testar o MySQL digite o comando <b><code>select @@version</code></b> na janela query1, como mostra a figura abaixo (marcado em azul). Em seguida, clique no ícone <img src="https://i.imgur.com/3Bl39ca.png" title="source: imgur.com" /> para executar a instrução. Será exibida a versão do MySQL que está instalada no seu computador, como mostra a figura abaixo (marcado em vermelho).

<div align="center"><img src="https://i.imgur.com/R3rCWjn.png" title="source: imgur.com" /></div>

<h2>Erro: Workbench desconectado</h2>

Caso a Barra de Ferramentas do Editor de Consultas esteja desabilitada, como mostra a figura abaixo, significa que você não efetuou a conexão com o MySQL Server na tela inicial do MySQL Workbench.

<div align="center"><img src="https://i.imgur.com/g85JKEL.png" title="source: imgur.com" /></div>

Observe que na Guia do Editor de consultas aparece a palavra **unconnected** (desconectado), como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/74Wap0e.png" title="source: imgur.com" /></div>

Para Corrigir este problema, clique no ícone <img src="https://i.imgur.com/8hu9zjU.png" title="source: imgur.com" />, ao lado da guia do Editor de consultas para retornar para a tela inicial do Workbench.

<div align="center"><img src="https://i.imgur.com/5CtdmCs.png" title="source: imgur.com" /></div>

Na tela inicial, dê um duplo clique sobre a conexão **Local instance MySQL80** (Conexão local), como mostra a figura abaixo, para efetuar a conexão com o MySQL Server.

<div align="center"><img src="https://i.imgur.com/HBdNTkU.png" title="source: imgur.com" /></div>

Caso seja solicitada a senha do usuário root, como mostra a figura abaixo, digite a senha e marque a opção: **Save password in vault**, para gravar a senha e não solicitar novamente.

<div align="center"><img src="https://i.imgur.com/xC6JFoe.png" title="source: imgur.com" /></div>
 
Observe que após efetuar a conexão com o MySQL Server, a Barra de Ferramentas estará ativada, a palavra **unconnected** será substituída por **Local instance MySQL80** na Guia do Editor de consultas e o MySQL voltará a funcionar normalmente.

<div align="center"><img src="https://i.imgur.com/qNjLvqW.png" title="source: imgur.com" /></div>

<h2>Desabilitar o Update diário à 0h</h2>

O MySQL configura durante a instalação a atualização diária à 0h. Todos os dias neste horário, aparece uma janela do **Prompt de Comando do Windows** executando uma série de comandos e ao finalizar fecha a janela automaticamente. Para desabilitar esta opção, siga os passos abaixo:

1. Na Caixa de pesquisas, localize o <b>Agendador de Tarefas</b> (Marcado em vermelho na imagem), e clique no <b>Agendador de Tarefas</b>  (Marcado em azul na imagem).

<div align="center"><img src="https://i.imgur.com/s5xnlGG.png" title="source: imgur.com" /></div>

2. Na janela do Agendador de Tarefas, Localize a pasta do <b>MySQL</b> como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/OJ1aM3f.png" title="source: imgur.com" /></div>

3. Clique sobre a tarefa <b>ManifestUpdate</b> com o botão direito mouse e clique na opção <b>Excluir</b> ou <b>Desativar</b>.

<div align="center"><img src="https://i.imgur.com/zXuiYZh.png" title="source: imgur.com" /></div>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
