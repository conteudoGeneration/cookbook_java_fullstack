<h1>Guia de Instalação do Java - Versão 17</h1>

<h2>Passo 01 - Download do instalador</h2>

1) Acesse o site: https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html para efetuar o download do **Java SE 17**.

<div align="center"><img src="https://i.imgur.com/QSYo1Ee.png?1" title="source: imgur.com" /></div>

2) Role a tela para abaixo e localize o link **Windows X64 Installer**, conforme indicado na figura abaixo:

<div align="center"><img src="https://i.imgur.com/hc8Y5G4.png" title="source: imgur.com" /></div>

3. Clique no link par fazer o download
4. Acesse a sua pasta de **Downloads** e localize o arquivo do Instalador do Java (JDK-17), conforme indicado na figura abaixo:

<div align="center"><img src="https://i.imgur.com/1X9OKMw.png" title="source: imgur.com" /></div>

<table width="100%">
    <tr>
    	<td width="10%" valign="middle"><img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com"/></td>
        <td width="90%" valign="middle"><p align="justify"> <b>ATENÇÃO:</b> No momento em que este guia foi escrito, a versão mais atual do <b>Java 17</b> era a versão <b>17.0.3.1</b>. Ao utilizar este guia no futuro, pode ser que a versão mais atual do Java 17 seja outra</p></td>
    </tr>
</table>

5. Dê um duplo clique sobre o arquivo para iniciar o instalador.


<h2>Passo 02 - Instalação e configuração</h2>

1. Na janela **Setup**, clique no botão **Next** para continuar.

<div align="center"><img src="https://i.imgur.com/VRZ52v1.png" title="source: imgur.com" /></div>

2. Na janela **Destination Folder**, clique no botão **Next** para continuar.

<div align="center"><img src="https://i.imgur.com/rwVb6MO.png" title="source: imgur.com" /></div>

3. Na janela **Progress**, aguarde a conclusão da instalação. Caso seja solicitada a confirmação da instalação, clique em **OK** para continuar.

<div align="center"><img src="https://i.imgur.com/oYFXvrt.png" title="source: imgur.com" /></div>

4. Na janela **Complete**, clique no botão **Close** para concluir.

<div align="center"><img src="https://i.imgur.com/wv29AE4.png" title="source: imgur.com" /></div>

<h2>Passo 03 - Configuração das Variáveis de Ambiente</h2>

1. Na Caixa de pesquisas, localize o aplicativo **Editar as varáveis de ambiente do sistema** e clique no botão **Abrir** (Marcado em vermelho na imagem).

<div align="center"><img src="https://i.imgur.com/GDGZC7F.png" title="source: imgur.com" /></div>

2. Na janela **Propriedades do Sistema**, clique no botão **Variáveis de Ambiente** para continuar.

<div align="center"><img src="https://i.imgur.com/fQ8eGZg.png" title="source: imgur.com" /></div>

3. Na janela **Variáveis de Ambiente**, no item **Variáveis do Sistema** e clique no botão **Novo...** para continuar.

<div align="center"><img src="https://i.imgur.com/AhnYtXk.png" title="source: imgur.com" /></div>

4. Na janela **Nova Variável de Sistema**, preencha os campos de acordo a imagem abaixo e clique no botão **OK** para concluir.

<div align="center"><img src="https://i.imgur.com/SHn94A4.png" title="source: imgur.com" /></div>

```bash
JAVA_HOME
C:\Program Files\Java\jdk-17.0.3.1
```

5. Na janela **Variáveis de Ambiente**, no item **Variáveis do Sistema**, localize e selecione a variável **Path**. Na sequência clique no botão **Editar...**

<div align="center"><img src="https://i.imgur.com/AKAyetx.png" title="source: imgur.com" /></div>

6. Na janela **Editar variável de ambiente**, clique no botão **Novo**

<div align="center"><img src="https://i.imgur.com/QItxQVO.png" title="source: imgur.com" /></div>

7. Insira a nova variável, de acordo com a figura abaixo:

<div align="center"><img src="https://i.imgur.com/sYNYuEM.png" title="source: imgur.com" /></div>

```bash
C:\Program Files\Java\jdk-17.0.3.1
```

8. Para verificar se a instalação do Java 17 foi bem sucedida, execute o atalho <img width="80" src="https://i.imgur.com/JpqKaVh.png" title="source: imgur.com" /> para abrir a janela Executar.

<div align="center"><img src="https://i.imgur.com/xj8I3W3.png" title="source: imgur.com" /></div>

9. Digite o comando **cmd** para abrir o **Prompt de comando do Windows**.
10. Verifique se o **Java 17** está instalado corretamente através do comando:

```bash
java -version
```
11. Se estiver tudo OK, será exibida a mensagem abaixo:

<div align="left"><img src="https://i.imgur.com/7YpGPDy.png" title="source: imgur.com" /></div>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
