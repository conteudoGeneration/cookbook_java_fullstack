<h1>Guia de Reinstalação do MySQL Server for Windows</h1>

<h2>Passo 01 - Desinstalação do MySQL Server</h2>

1.  Na Caixa de pesquisas, localize o <b>MySQL</b> (Marcado em vermelho na imagem), e clique no <b>MySQL Installer - Community</b>  (Marcado em azul na imagem).

<div align="center"><img src="https://i.imgur.com/WlUINih.png" title="source: imgur.com" /></div>

 2. Na janela <b>MySQL Installer</b>,  clique no botão <b>Remove</b> .

<div align="center"><img  src="https://i.imgur.com/KOG3dxo.png" title="source: imgur.com" /></div>

 3. Na janela <b>Select Products to Remove</b>,  marque a opção **MySQL server** e clique no botão <b>Next</b> .

<div align="center"><img  src="https://i.imgur.com/uB4p6T6.png" title="source: imgur.com" /></div>

 4. Na janela <b>Remove Server</b>,  marque a opção **remove the data directory** e clique no botão <b>Next</b> .

<div align="center"><img src="https://i.imgur.com/BjUh44B.png" title="source: imgur.com" /></div>

 5. Na janela <b>Remove Selected Products</b>,  clique no botão <b>Execute</b> .

<div align="center"><img  src="https://i.imgur.com/OGkDMFr.png" title="source: imgur.com" /></div>

 6. Ao concluir a desinstalação do MySQL Server,  clique no botão <b>Finish</b> .

<div align="center"><img  src="https://i.imgur.com/0I2E1N7.png" title="source: imgur.com" /></div>

 7. Será aberta a janela <b>MySQL Installer</b>. Observe que o MySQL Server foi desinstalado e já não aparece mais na lista de produtos instalados.

<div align="center"><img src="https://i.imgur.com/2EPrQlq.png" title="source: imgur.com" /></div>

<h2>Passo 02 - Reinstalação e configuração</h2>

1. Na janela <b>MySQL Installer</b>,  clique no botão <b>Add</b> .

<div align="center"><img  src="https://i.imgur.com/mnK1Jui.png" title="source: imgur.com" /></div>

2. Na janela <b>Select Products</b>, marque a opção <b>MySQL Server</b> (última versão), como mostra a figura abaixo e clique no botão <img  src="https://i.imgur.com/GTcQ4fK.png" title="source: imgur.com" /> para adicionar na lista de produtos que serão instalados.

<div align="center"><img  src="https://i.imgur.com/g9aKLtH.png" title="source: imgur.com" /></div>

3. Verifique se o <b>MySQL Server</b> foi adicionado na lista e clique no botão <b>Next</b> para continuar.

<div align="center"><img src="https://i.imgur.com/mINLofV.png" title="source: imgur.com" /></div>

4. Na janela <b>Installation ou Download</b>, clique no botão <b>Execute</b> para iniciar a instalação e/ou download do MySQL Server.

<div align="center"><img  src="https://i.imgur.com/ZJAOMZH.png" title="source: imgur.com" /></div>

5. Caso o instalador tenha feito o download de uma nova versão do MySQL, a janela  <b>Download</b> indicará o final do download. Clique no botão <b>Next</b> para iniciar a instalação do MySQL Server.

<div align="center"><img  src="https://i.imgur.com/mzpJ9iz.png" title="source: imgur.com" /></div>

6. Na janela <b>Installation</b>, clique no botão <b>Execute</b> para iniciar a instalação.

<div align="center"><img  src="https://i.imgur.com/0aXvcNW.png" title="source: imgur.com" /></div>

7. Quando a instalação dos produtos for concluída, clique no botão <b>Next</b> para continuar.

<div align="center"><img width="500px" src="https://i.imgur.com/p6TRBlY.png" title="source: imgur.com" /></div>

8. Na janela <b>Product Configuration</b>, clique no botão <b>Next</b> para continuar.

<div align="center"><img  src="https://i.imgur.com/OLd6vbW.png" title="source: imgur.com" /></div>

9. Na janela <b>Type and Networking</b>, mantenha a configuração padrão clique no botão <b>Next</b> para continuar.

<div align="center"><img  src="https://i.imgur.com/Qj9cDvs.png" title="source: imgur.com" /></div>

10. Na janela **Authentication Method**, mantenha a configuração padrão clique no botão <b>Next</b> para continuar.

<div align="center"><img  src="https://i.imgur.com/Jy5t7Tt.png" title="source: imgur.com" /></div>

11. Na janela <b>Accounts and Roles</b>, digite uma senha para o usuário <b>root</b> (Usuário Administrador do MySQL) e clique no botão <b>Next</b> para continuar. Recomendamos que você defina a senha do MySQL como <b>root</b> (Veja a observação na próxima página).

<div align="center"><img  src="https://i.imgur.com/PAgdDkH.png" title="source: imgur.com" /></div>

<div align="center"><h2> *** Importante *** </h2></div>

Recomendamos o uso da senha **root** como senha do MySQL por se tratar de uma senha padrão, fácil de ser lembrada e que pode ser compartilhada livremente no Github. 
Caso você opte por outra senha, anote a senha em um lugar seguro e/ou utilize uma senha que você não se esquecerá no futuro. 
Outro cuidado importante é **não utilize uma senha de uso pessoal tais como e-mail, redes sociais  e etc**. Lembre-se que você irá compartilhar códigos através do Github e a sua senha ficará exposta nos repositórios do Github. 
**Caso você esqueça a sua senha  será necessário reinstalar o MySQL para cadastrar uma nova senha**.

12. Na janela <b>Windows Service</b>, mantenha a configuração padrão clique no botão <b>Next</b> para continuar.

<div align="center"><img width="500px" src="https://i.imgur.com/jJNGMCi.png" title="source: imgur.com" /></div>

13. Na janela **Apply Configuration**, clique no botão **Execute** para aplicar as configurações.

<div align="center"><img  src="https://i.imgur.com/phCVyrC.png" title="source: imgur.com" /></div>

14. Quando a configuração for concluída, clique no botão <b>Next</b> para continuar.

<div align="center"><img  src="https://i.imgur.com/68DkOKZ.png" title="source: imgur.com" /></div>

15. Na janela **Product Configuration**, clique no botão <b>Next</b> para aplicar as configurações.

<div align="center"><img  src="https://i.imgur.com/hNomVqz.png" title="source: imgur.com" /></div>

16. Na janela <b>Installation Complete</b>, clique no botão <b>Finish</b> para finalizar a instalação.

<div align="center"><img  src="https://i.imgur.com/20Odl4I.png" title="source: imgur.com" /></div>

17. Ao finalizar a instalação, o instalador retornará para a janela **MySQL Installer**. Feche a janela para concluir.

<div align="center"><img  src="https://i.imgur.com/ZrsgSMS.png" title="source: imgur.com" /></div>

<h2>Passo 03 - Testando a conexão no Workbench</h2>

1. Na Caixa de pesquisas, localize o <b>MySQL</b> (Marcado em vermelho na imagem), e clique no <b>MySQL Workbench</b>  (Marcado em azul na imagem).

<div align="center"><img src="https://i.imgur.com/zsr8Om7.png" title="source: imgur.com" /></div>

2. No <b>MySQL Workbench</b>, Clique sobre a <b>Conexão Local instance MySQL80</b>

<div align="center"><img  src="https://i.imgur.com/HBdNTkU.png" title="source: imgur.com" /></div>

3. Caso seja solicitada a senha, <b>digite a senha do usuário root</b> e marque a opção <b>Save password in vault</b> para gravar a senha e não perguntar novamente.

<div align="center"><img src="https://i.imgur.com/xC6JFoe.png" title="source: imgur.com" /></div>
<i>Não esqueça de anotar a senha para não esquecer</i>

4. Será aberta a janela principal do <b>MySQL Workbench</b>. Para testar o MySQL digite o comando <b><code>select @@version</code></b> na janela query1, como mostra a figura abaixo (marcado em azul). Em seguida, clique no ícone <img src="https://i.imgur.com/3Bl39ca.png" title="source: imgur.com" /> para executar a instrução. Será exibida a versão do MySQL que está instalada no seu computador, como mostra a figura abaixo (marcado em vermelho).

<div align="center"><img src="https://i.imgur.com/R3rCWjn.png" title="source: imgur.com" /></div>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
