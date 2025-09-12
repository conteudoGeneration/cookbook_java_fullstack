
<h1>Guia de Instalação do Spring Tools Suite (STS)</h1>



Criado com base no Eclipse IDE, o **Spring Tool Suite (STS)** é uma distribuição personalizada do Eclipse voltada ao desenvolvimento de aplicações Java Backend com o **Spring Framework**. O STS herda todos os recursos do Eclipse, mas vem pré-configurado com ferramentas, extensões e assistentes que otimizam o trabalho com projetos Spring, como criação automática de projetos, integração com Spring Boot, suporte a configuração de beans, e muito mais.

<br />

<h3>Pré requisitos</h3>



 - **Java Development (JDK)** versão 17 ou superior
 - No Windows utilizar um usuário com direitos de administrador

<br />

<h2>👣 Passo 01 - Instalação</h2>

<br />

<h3><img src="https://i.imgur.com/za4tPUA.png" title="source: imgur.com" width="5%"/> Windows</h3>

<br />

<h3>1.1. Instalação do WinRAR</h3>



1. Acesse o site do **WinRAR** (https://www.win-rar.com/start.html) e faça o download do aplicativo clicando no botão **Baixar WinRAR**.

<div align="center"><img src="https://i.imgur.com/iFD1snm.png" title="source: imgur.com" /></div>

2. Na tela seguinte, clique no botão **Download WinRAR** e aguarde conclusão do download.

<div align="center"><img src="https://i.imgur.com/1c6OeAU.png" title="source: imgur.com" /></div>

3. Execute o instalador do **WinRAR**
4. Na janela de instalação do WinRAR, clique no botão **Install** para iniciar a instalação

<div align="center"><img src="https://i.imgur.com/UTX5jaI.png" title="source: imgur.com" /></div>

5. Após a instalação, será aberta a janela **WinRAR Setup**. Configure como mostra a imagem abaixo e clique no botão **OK**

<div align="center"><img src="https://i.imgur.com/jk3WOgA.png" title="source: imgur.com" /></div>

6. Na próxima janela , clique no botão **Done** para concluir a instalação.

<div align="center"><img src="https://i.imgur.com/XMMpjUZ.png" title="source: imgur.com" /></div>



<br />

<h3>1.2. Instalação do STS</h3>




 1. Acesse o site: **https://spring.io/tools**

<div align="center"><img src="https://i.imgur.com/r616sej.png" title="source: imgur.com" /></div>

 2. Faça o download do STS for Windows, conforme indicado na figura abaixo:

<div align="center"><img src="https://i.imgur.com/6GOEGvH.png" title="source: imgur.com" /></div>

 3. Após a conclusão do download, localize o arquivo **spring-tools-for-eclipse-4.31.0.RELEASE-e4.37.0-win32.win32.x86_64.zip**, que foi baixado (Geralmente na pasta **Downloads**)

<div align="center"><img src="https://i.imgur.com/XBkYhb5.png" title="source: imgur.com" /></div>

<br />

> [!WARNING]
>
> No momento em que este guia foi escrito, a versão mais atual do **STS** era a versão **4.31.0**. Ao utilizar este guia no futuro, pode ser que a versão mais atual seja outra.

4. Descompacte o arquivo dentro da pasta onde você salvou o download, clicando com o botão direito do mouse sobre o arquivo e no menu que será aberto, clique na opção **extract here**.

<div align="center"><img src="https://i.imgur.com/C4UHS39.png" title="source: imgur.com" /></div>

5. Após a extração, será criada uma pasta com o nome semelhante a **sts-4.32.0.RELEASE** (o número da versão pode variar, dependendo da versão baixada).

<div align="center"><img src="https://i.imgur.com/gFHJtjp.png" title="source: imgur.com" /></div>

6. Renomeie esta pasta para **sts**

<div align="center"><img src="https://i.imgur.com/giUTTFU.png" title="source: imgur.com" /></div>

7. **Mova essa pasta** para `C:\Arquivos de Programas\` (`C:\Program Files\`)
8. Ao mover a pasta, o Windows perguntará se você realmente deseja mover a pasta. Confirme a alteração.
9. Acesse a pasta **sts** e **localize o arquivo `SpringToolSuite4.exe`**.

<div align="center"><img src="https://i.imgur.com/8yA4zhE.png" title="source: imgur.com" /></div>

10. Crie um atalho para este arquivo e mova o atalho para a **Área de Trabalho**.

<div align="center"><img src="https://i.imgur.com/QZsu62X.png" title="source: imgur.com" /></div>

<br />

> [!CAUTION]
>
> Não mova o arquivo <b>SpringToolSuite4.exe</b> da pasta do STS para a Área de Trabalho. Para criar um atalho, clique com o botão direito do mouse sobre o arquivo e clique na opção <b>Criar atalho</b>. Em seguida, mova o atalho para Área de Trabalho.

<br />

11. Dê um duplo clique no atalho para iniciar o **STS**.
12. Na próxima janela, mantenha a pasta padrão (<b><i>C:\Users\seu usuário\Documents\workspace-spring-tool-suite-4-4.32.0.RELEASE</i></b>), marque a opção **Use this as the default and do not ask again** e clique no botão **Launch**.

<div align="center"><img src="https://i.imgur.com/S4ViZ95.png" title="source: imgur.com" /></div>

13. Na sequência, será aberta a tela inicial do STS, como vemos na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/WvSptmD.png" title="source: imgur.com" /></div>

14. A instalação está concluída!

<br />

<h3><img src="https://i.imgur.com/9VM3pgl.png" title="source: imgur.com" width="5%"/> macOS</h3>



  1. Acesse o site: **https://spring.io/tools**
  2. Faça o download do STS for macOS ARM_64, conforme indicado na figura abaixo:

<div align="center"><img src="https://i.imgur.com/lBRqi0U.png" title="source: imgur.com" /></div>

<br />

> Selecione a versão correspondente ao processador do MAC:
>
> - **macOS ARM_64** para Macs com M1/M2
> - **macOS X86_64** para Macs com processadores Intel

3. Clique para baixar o arquivo `spring-tools-for-eclipse-4.31.0.RELEASE-e4.36.0-macosx.cocoa.aarch64.dmg`. Ele será salvo normalmente na pasta **Downloads**.
4. Após o download, dê um duplo clique no arquivo `spring-tools-for-eclipse-4.31.0.RELEASE-e4.36.0-macosx.cocoa.aarch64.dmg` para montá-lo.

<br />

> [!WARNING]
>
> No momento em que este guia foi escrito, a versão mais atual do **STS** era a versão **4.31.0**. Ao utilizar este guia no futuro, pode ser que a versão mais atual seja outra.

5. Na janela que será aberta, arraste o ícone do **SpringToolSuite4** para a pasta **Applications** (Aplicativos), como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/D6QGop8.png" title="source: imgur.com" /></div>

6. Aguarde a conclusão da cópia do STS para a pasta Applications

<div align="center"><img src="https://i.imgur.com/TyUwMUm.png" title="source: imgur.com" /></div>

7. Abra o **Launchpad** e localize o STS. Clique no ícone para iniciar.

<div align="center"><img src="https://i.imgur.com/GZT7T3g.png" title="source: imgur.com" /></div>

8. Na primeira execução, o macOS pode exibir uma mensagem de segurança informando que o app é de um desenvolvedor não identificado. Clique no botão **Open**.

<div align="center"><img src="https://i.imgur.com/mQMk0Ul.png" title="source: imgur.com" /></div>

7. Na próxima janela, informe a pasta onde o STS irá criar a **Workspace** (Pasta padrão onde serão salvos os projetos Java e Spring).

<div align="center"><img src="https://i.imgur.com/GjJ5kp1.png" title="source: imgur.com" /></div>

8. Por hora, mantenha a pasta padrão (<b><i>/Users/seu usuário/Documents/workspace-spring-tool-suite-4-4.31.0.RELEASE</i></b>), marque a opção **Use this as the default and do not ask again** e clique no botão **Launch**.

<div align="center"><img src="https://i.imgur.com/5TlKm72.png" title="source: imgur.com" /></div>

9. Na sequência, será aberta a tela inicial do STS, como vemos na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/1NyWD4c.png" title="source: imgur.com" /></div>

10. A instalação está concluída!

<br />

> ### 📝 Dicas úteis
>
> - **Java**: Certifique-se de ter o JDK instalado (Java 17 ou mais recente) — execute `javac -version` no terminal.
> - **Compatibilidade de arquitetura**: Escolha a versão correta (ARM ou Intel).
> - **Permissão do macOS**: Se enfrentar problemas na primeira abertura, use a opção “Abrir mesmo assim” nas configurações de segurança.
> - **Atalhos**: Para facilitar o acesso, você pode adicionar o STS ao Dock após a primeira abertura.

<br />

<h2>👣 Passo 02 - Configurando o Modo Dark</h2>



Por padrão, o **Eclipse IDE** (e também o **Spring Tool Suite**) utiliza o **tema claro (Light)** como configuração visual. No entanto, se preferir uma aparência mais confortável para os olhos, especialmente em ambientes com pouca luz, é possível **alternar para o tema escuro (Dark)** de forma simples pelas configurações da IDE, como veremos a seguir:

1. Clique no **Menu Window 🡪 Preferences**. 

<div align="center">
  <img src="https://i.imgur.com/wZH6hfU.png" title="source: imgur.com" />
</div>

2. Na janela **Preferences**, no menu localizado do lado esquerdo, escolha a opção **General 🡪 Appearance**. 

<div align="center">
  <img src="https://i.imgur.com/3twn5we.png" title="source: imgur.com" />
</div>


3. Na opção **Theme**, escolha **Dark** e depois clique no botão **Apply and Close**

<div align="center">
  <img src="https://i.imgur.com/GmQo6wd.png" title="source: imgur.com" />
</div>


4. Será exibida uma mensagem pedindo para **reiniciar o STS**, clique no botão **Restart** para reiniciar.

<div align="center">
  <img src="https://i.imgur.com/DpNUvP2.png" title="source: imgur.com" />
</div>

5. Após reiniciar, o STS estará no modo Dark:

<div align="center">
  <img src="https://i.imgur.com/MUObY3h.png" title="source: imgur.com" />
</div>

<br />

<h2>👣 Passo 03 - Configurando o STS para utilizar o Java 21</h2>



Vamos configurar o STS para utilizar o Java 21, que foi instalado no seu computador:

 1. Clique no menu **Window 🡒 Preferences**.

<div align="center"><img src="https://i.imgur.com/yGdygtj.png?1" title="source: imgur.com" /></div>

  2. Na janela <b>Preferences</b>, no menu do lado esquerdo, clique na opção <b>Java 🡒 Installed JREs</b>.

<div align="center"><img  src="https://i.imgur.com/nLEwh9M.png" title="source: imgur.com" /></div>

  3. Na janela <b>Installed JREs</b>, clique botão <b>Add...</b>

<div align="center"><img src="https://i.imgur.com/xlXlkzl.png" title="source: imgur.com" /></div>

  4. Na janela <b>Add JRE</b>, selecione a opção **Standard VM** e clique no botão <b>Next</b>.

<div align="center"><img src="https://i.imgur.com/zdzCF3r.png" title="source: imgur.com" /></div>

  5. Na próxima tela, clique no botão <b>Directory...</b>.

<div align="center"><img src="https://i.imgur.com/rAxAIDA.png" title="source: imgur.com" /></div>

  6. Na janela <b>Selecionar pasta</b>, localize a pasta onde o **Java - versão 17** foi instalado (***C:\Program Files\Java\jdk-17.0.3.1***) e clique no botão <b>Selecionar pasta</b>.

<div align="center"><img src="https://i.imgur.com/aauLJoV.png" title="source: imgur.com" /></div>

```Bash
C:\Program Files\Java\jdk-17.0.3.1
```

<br />

<table width="100%">
    <tr>
    	<td width="10%" valign="middle"><img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com"/></td>
        <td width="90%" valign="middle"><p align="justify"> <b>ATENÇÃO:</b> No momento em que este guia foi escrito, a versão mais atual do <b>Java 17</b> era a versão <b>17.0.3.1</b>. Ao utilizar este guia no futuro, pode ser que a versão mais atual do Java 17 seja outra.</p></td>
    </tr>
</table>

<br />


    7. Para finalizar, clique no botão <b>Finish</b>.

<div align="center"><img src="https://i.imgur.com/rg7xnEE.png" title="source: imgur.com" /></div>

  8. Na janela <b>Installed JREs</b>, deixe selecionado o Java - versão 17 que você acabou de adicionar e clique botão <b>Apply and Close</b> para concluir.

<div align="center"><img src="https://i.imgur.com/vCwSN6d.png" title="source: imgur.com" /></div>

<br />

<h2>👣 Passo 04 - Configurar o Git Bash como Terminal</h2>



Vamos configurar o STS para utilizar o **Git Bash** como Terminal padrão:

  1. Clique no menu **Window 🡒 Preferences**.

<div align="center"><img src="https://i.imgur.com/yGdygtj.png?1" title="source: imgur.com" /></div>

  2. Na janela <b>Preferences</b>, no menu do lado esquerdo, clique na opção <b>Terminal🡒 Local Terminal</b>.

<div align="center"><img  src="https://i.imgur.com/595ZAhN.png" title="source: imgur.com" /></div>

  3. Na janela <b>Local Terminal</b>, no item <b>Initial Working directory</b>, mude para **Eclipse Workspace**.

<div align="center"><img  src="https://i.imgur.com/AUrVxpq.png" title="source: imgur.com" /></div>

4. Clique no botão **Apply and Close** para concluir.
5. Para visualizar a janela do <b>Terminal</b>, clique no menu <b>Window 🡒 Show View 🡒 Terminal</b>.

<div align="center"><img  src="https://i.imgur.com/oedwNAK.png" title="source: imgur.com" /></div>

6. A janela do Terminal será aberta na Área de Saída (Output), indicado na imagem abaixo:

<div align="center"><img  src="https://i.imgur.com/ifoNFwd.png" title="source: imgur.com" /></div>

7. Para carregar o Terminal Git Bash, clique no botão **Open a Terminal**, indicado na imagem abaixo:

<div align="center"><img  src="https://i.imgur.com/M8UTO8F.png" title="source: imgur.com" /></div>

8. Na janela **Launch Terminal**, na opção **Choose terminal**, selecione **Git Bash** e clique no botão **OK**.

<div align="center"><img  src="https://i.imgur.com/SDUiKQq.png" title="source: imgur.com" /></div>

9. O **Git Bash** será aberto dentro da janela **Terminal**, apontando para a pasta Workspace do projeto, como vemos na imagem abaixo:

<div align="center"><img  src="https://i.imgur.com/YvRHCrj.png" title="source: imgur.com" /></div>

<br />

<h2>👣 Passo 05 - Configurar o botão Browser</h2>



Na janela Spring Boot Dashboard existe um botão chamado Open Browser <img src="https://i.imgur.com/rRFLAir.png" title="source: imgur.com" />, que permite carregar o projeto em execução no STS no Navegador da Internet de sua preferência. 

<div align="center"><img src="https://i.imgur.com/utn72tm.png" title="source: imgur.com" /></div>

Caso a janela **Spring Boot Dashboard** não esteja visível, clique no botão **Boot Dashboard** <img src="https://i.imgur.com/n1xXnmQ.png" title="source: imgur.com" />, localizado na barra de Ferramentas do STS (abaixo do menu Search).

Para configurar o seu Navegador de preferência, siga os passos abaixo: 

 1. Clique no menu **Window 🡒 Preferences**

<div align="center"><img src="https://i.imgur.com/yGdygtj.png?1" title="source: imgur.com" /></div>

 2. Na janela <b>Preferences</b>, no menu do lado esquerdo, clique na opção <b>General 🡒 Web Browser</b>

<div align="center"><img src="https://i.imgur.com/rmabNB5.png" title="source: imgur.com" /></div>

 3. Na janela que será aberta, marque a opção <b>Use external web browser</b>, escolha o Navegador de sua preferência e clique no botão <b>Apply and Close</b>.

<div align="center"><img src="https://i.imgur.com/LhbFWYU.png" title="source: imgur.com" /></div>

<br />

> [!WARNING]
>
> A lista de navegadores exibirá apenas os navegadores que estiverem instalados na sua máquina.


 4. Após executar o seu projeto Spring, clique no Botão **Open Browser** <img src="https://i.imgur.com/rRFLAir.png" title="source: imgur.com" /> para abrir  a sua aplicação no Navegador configurado.

<br />

<h2>❌ Resolução de Problemas - Spring no STS</h2>



<h3>Erro 01 - Ansi Console</h3>



Ao executar o primeiro projeto no STS, a mensagem de erro abaixo será exibida:

<div align="center"><img src="https://i.imgur.com/FIxhA7h.png" title="source: imgur.com" /></div>

Esta mensagem indica que o tamanho do Buffer do console (O numero de caracteres e dados de cor para gerar uma janela de console) está pequeno. Para corrigir o problema, siga os passos abaixo: 

  1. Clique no menu **Window 🡒 Preferences**

<div align="center"><img src="https://i.imgur.com/yGdygtj.png?1" title="source: imgur.com" /></div>

  2. Na janela <b>Preferences</b>, no menu do lado esquerdo, clique na opção <b>Run/Debug 🡒 Console</b>

<div align="center"><img  src="https://i.imgur.com/KV86gVA.png" title="source: imgur.com" /></div>

  3. Na janela que será aberta, altere a opção Console buffer size (characters) para **1000000** e clique no botão **Apply and Close**

<div align="center"><img  src="https://i.imgur.com/3jerbIb.png" title="source: imgur.com" /></div>

<br />

<h3>Erro 02 - Alertas de Segurança do Windows</h3>



Alerta de Segurança do Windows (janelas abaixo), informa que o STS e o JDK não tem autorização para acessar as redes públicas e privadas. Como o STS em conjunto com o JDK simulam um Servidor WEB é necessário que ambos possuam este acesso.

<div align="center"><img src="https://i.imgur.com/HJyTzfr.png" title="source: imgur.com" /></div>

<br />

<div align="center"><img src="https://i.imgur.com/wBtSvNp.png" title="source: imgur.com" /></div>

Para corrigir o problema, marque as duas opções de acesso (**Redes Privadas e Redes Públicas**) e clique no botão **Permitir Acesso** em ambas as janelas.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
