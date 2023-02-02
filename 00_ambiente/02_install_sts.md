
<h1>Guia de Instalação do Spring Tools Suite (STS)</h1>

O Spring Tool Suite (STS) é uma IDE baseada no Eclipse, que facilita o uso de Spring de modo geral. Ela já vem com o Spring configurado e praticamente pronta para uso.

<h3>Requisitos</h3>

 - Java Development (JDK) Versão 17 ou superior
 - Winrar caso dê erro na descompactação via Java

<h2>Passo 01 - Instalação</h3>

 1. Acesse o site: https://spring.io/tools

<div align="center"><img src="https://i.imgur.com/i6hVnE6.png" title="source: imgur.com" /></div>

 2. Faça o download do STS for Windows, conforme indicado na figura abaixo:

<div align="center"><img src="https://i.imgur.com/3bOECqe.png" title="source: imgur.com" /></div>

 3. Após a conclusão do download, localize o arquivo que foi baixado (Geralmente na pasta **Downloads**)

<div align="center"><img src="https://i.imgur.com/Oqdzszt.png" title="source: imgur.com" /></div>

4. Abra o arquivo: **spring-tool-suite-4-4.14.1.RELEASE-e4.23.0-win32.win32.x86_64.self-extracting.jar** 

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="120px"/> | <p align="justify"> **ATENÇÃO:** No momento em que este guia foi escrito, a versão mais atual do STS era a versão 4.14.1. Ao utilizar este guia no futuro, pode ser que a versão mais atual seja outra* </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

5. Será perguntado com qual programa você deseja abrir o arquivo do tipo Jar. Selecione o **Java Platform(TM) SE Binary**, marque a opção **Sempre usar este aplicativo para abrir arquivos Jar** e clique em **OK** para continuar.

<div align="center"><img src="https://i.imgur.com/nKyk0Tm.png" title="source: imgur.com" /></div>

6. Enquanto o STS é descompactado, será exibida a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/Kz3Htnb.png" title="source: imgur.com" /></div>

7. Caso seja exibida a mensagem abaixo, significa que você já descompactou o STS na pasta onde você fez o download. Siga para o passo 9.

<div align="center"><img src="https://i.imgur.com/x0fnPV9.png" title="source: imgur.com" /></div>

8. Observe que na pasta onde você salvou o instalador do STS, será criada uma pasta com o nome: **sts-4.14.1.RELEASE** (a versão pode ser diferente)

9. Mova esta pasta para dentro de C:\Program Files\ ou C:\Arquivos de Programas\

10. Abra a pasta e execute o arquivo: **SpringToolSuite4.exe**

11. Na próxima janela, informe a pasta onde o STS irá criar a **Workspace** (Pasta onde serão salvos os projetos Spring).

<div align="center"><img src="https://i.imgur.com/0GZqiau.png" title="source: imgur.com" /></div>

12. Mantenha a pasta padrão (<b><i>C:\Users\seu usuário\Documents\workspace-spring-tool-suite-4-4.14.1.RELEASE</i></b>), marque a opção **Use this as the default and do not ask again** e clique no botão **Launch** (a versão pode ser diferente).
13. A instalação está concluída!

<table width="100%">
    <tr>
    	<td width="15%" valign="middle"><img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com"/></td>
        <td width="90%" valign="middle"><p align="justify"> <b>ATENÇÃO:</b>Não mova o arquivo <b>SpringToolSuite4.exe</b> da pasta do STS para a Área de Trabalho. Para criar um atalho, clique com o botão direito do mouse sobre o arquivo e clique na opção <b>Criar atalho</b>. Em seguida, mova o atalho para Área de Trabalho.</p></td>
    </tr>
</table>

<h3>Erro de descompactação - item 6</h3>

Caso ocorra algum erro no processo de descompactação do STS através do Java, você pode utilizar o aplicativo **Winrar** para descompactar o STS. 

  1. Faça o download do **Winrar** (https://www.win-rar.com/) e instale o aplicativo

  3. Descompacte o arquivo: **spring-tool-suite-4-4.14.1.RELEASE-e4.23.0-win32.win32.x86_64.self-extracting.jar** (a versão pode ser diferente) clicando com o botão direito do mouse sobre o arquivo e no menu que será aberto, clique na opção **extract here**. 

<div align="center"><img src="https://i.imgur.com/XupoR15.png" title="source: imgur.com" /></div>

  4. Observe que será descompactado um arquivo chamado **contents.zip**. 

<div align="center"><img src="https://i.imgur.com/3YzmuvY.png" title="source: imgur.com" /></div>

  5. Descompacte este arquivo clicando com o botão direito do mouse sobre ele, e no menu, clique na opção **extract here**.

<div align="center"><img src="https://i.imgur.com/PStC7ow.png" title="source: imgur.com" /></div>

5. Siga as instruções do passo a passo da instalação a partir do item 8

<h2>Passo 02 - Configurando o STS para utilizar o Java 17</h2>

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

<table width="100%">
    <tr>
    	<td width="10%" valign="middle"><img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com"/></td>
        <td width="90%" valign="middle"><p align="justify"> <b>ATENÇÃO:</b> No momento em que este guia foi escrito, a versão mais atual do <b>Java 17</b> era a versão <b>17.0.3.1</b>. Ao utilizar este guia no futuro, pode ser que a versão mais atual do Java 17 seja outra.</p></td>
    </tr>
</table>

  7. Para finalizar, clique no botão <b>Finish</b>.

<div align="center"><img src="https://i.imgur.com/rg7xnEE.png" title="source: imgur.com" /></div>

 8. Na janela <b>Installed JREs</b>, deixe selecionado o Java - versão 17 que você acabou de adicionar e clique botão <b>Apply and Close</b> para concluir.

<div align="center"><img src="https://i.imgur.com/vCwSN6d.png" title="source: imgur.com" /></div>

<h2>Passo 03 - Configurar o botão Browser</h2>

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

<table width="100%">
    <tr>
    	<td width="10%" valign="middle"><img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com"/></td>
        <td width="90%" valign="middle"><p align="justify"> <b>ATENÇÃO:</b> A lista de navegadores exibirá apenas os navegadores que estiverem instalados na sua máquina.</p></td>
    </tr>
</table>

 4. Após executar o seu projeto Spring, clique no Botão **Open Browser** <img src="https://i.imgur.com/rRFLAir.png" title="source: imgur.com" /> para abrir  a sua aplicação no Navegador configurado.

<h2>Resolução de Problemas - Spring no STS</h2>

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

<h3>Erro 02 - Alertas de Segurança do Windows</h3>

Alerta de Segurança do Windows (janelas abaixo), informa que o STS e o JDK não tem autorização para acessar as redes públicas e privadas. Como o STS em conjunto com o JDK simulam um Servidor WEB é necessário que ambos possuam este acesso.

<div align="center"><img src="https://i.imgur.com/HJyTzfr.png" title="source: imgur.com" /></div>

<br />

<div align="center"><img src="https://i.imgur.com/wBtSvNp.png" title="source: imgur.com" /></div>

Para corrigir o problema, marque as duas opções de acesso (**Redes Privadas e Redes Públicas**) e clique no botão **Permitir Acesso** em ambas as janelas.

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
