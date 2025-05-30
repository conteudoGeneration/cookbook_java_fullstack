﻿<h1>Guia de Instalação do Node</h1>

1.  Acesse o site do node: **https://nodejs.org/en/** e clique no link para efetuar o download da versão **LTS** .

<div align="center"><img src="https://i.imgur.com/AixlDJE.png" title="source: imgur.com" /></div>

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="120px"/> | <p align="justify"> **ATENÇÃO:** No momento em que este guia foi escrito, a versão LTS mais atual do Node era a versão 16.15.0 LTS. Ao utilizar este guia no futuro, pode ser que a versão mais atual seja outra* </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

2. Após efetuar o download, execute o instalador do Node.

3. Ao abrir o instalador, caso seja exibida a mensagem abaixo, clique em **OK** para continuar.

<div align="center"><img src="https://i.imgur.com/TdwimxP.png" title="source: imgur.com" /></div>

4. Na janela **Welcome to Node.js Setup Wizard**, clique no botão **Next** para continuar.

<div align="center"><img src=https://i.imgur.com/wgaEajw.png" title="source: imgur.com" /></div>

5. Na janela **End-User License Agreement**, marque a opção **I accept the terms in the License Agreement** e  clique no botão **Next** para continuar.

<div align="center"><img src="https://i.imgur.com/x16Xijj.png" title="source: imgur.com" /></div>

6. Na janela **Destination Folder**, clique no botão **Next** para continuar.

<div align="center"><img src="https://i.imgur.com/bUdrqe2.png" title="source: imgur.com" /></div>

7. Na janela **Custom Setup**, clique no botão **Next** para continuar.

<div align="center"><img src="https://i.imgur.com/IzTjPnw.png" title="source: imgur.com" /></div>

8. Na janela **Tools for Native Modules**, clique no botão **Next** para continuar.

<div align="center"><img src="https://i.imgur.com/ORAmFj7.png" title="source: imgur.com" /></div>

9. Na janela **Ready to install Node.js**, clique no botão **Install** para continuar.

<div align="center"><img src="https://i.imgur.com/kUBz86T.png" title="source: imgur.com" /></div>

10. Aguarde a conclusão da Instalação. Caso seja solicitada a confirmação da instalação, clique no botão **OK**  para continuar.

<div align="center"><img src="https://i.imgur.com/7jWII3W.png" title="source: imgur.com" /></div>

11. Na janela **Completed the Node.js Setup Wizard**, clique no botão **Finish** para concluir.

<div align="center"><img src="https://i.imgur.com/azIxB0s.png" title="source: imgur.com" /></div>

12. Para verificar se a instalação do Node foi bem sucedida, execute o atalho <img width="80" src="https://i.imgur.com/JpqKaVh.png" title="source: imgur.com" /> para abrir a janela Executar.

<div align="center"><img src="https://i.imgur.com/xj8I3W3.png" title="source: imgur.com" /></div>

13. Digite o comando **cmd** para abrir o **Prompt de comando do Windows**.
  
14. Verifique se o **Node** está instalado através do comando:

```bash
node -v
```
<div><img src="https://i.imgur.com/auSYSHI.png" title="source: imgur.com" /></div>

15. Verifique também se o **NPM** está instalado através do comando:

```bash
npm -v
```

<div><img src="https://i.imgur.com/miyTLAW.png" title="source: imgur.com" /></div>

<br /><br />

# Como instalar o Node.js no macOS

Siga os passos abaixo para instalar o **Node.js** no seu macOS.

## 1. Baixar e instalar o Node.js

### Passo 1: Acesse o site oficial do Node.js

1. Vá até a página de downloads do Node.js:
   [Node.js Downloads](https://nodejs.org/)

2. Você verá duas versões disponíveis:
   - **LTS (Long Term Support)**: Versão estável recomendada para a maioria dos usuários.
   - **Current**: A versão mais recente com as últimas funcionalidades.

   Para a maioria dos usuários, é recomendado baixar a versão **LTS**.

### Passo 2: Baixar o instalador

1. Clique no botão **macOS** para baixar o instalador `.pkg` da versão **LTS** (ou **Current**, se preferir).

### Passo 3: Instalar o Node.js

1. Após o download, localize o arquivo `.pkg` na pasta de downloads e clique duas vezes para abrir o instalador.

2. Siga as instruções do instalador:
   - Aceite os termos de licença.
   - Clique em **Continuar** até concluir a instalação.

3. O instalador irá configurar o Node.js e o **npm** (Node Package Manager) automaticamente no seu sistema.

## 2. Verificar a instalação

1. Após a instalação, abra o **Terminal** e verifique se o Node.js foi instalado corretamente.

   - Para verificar a versão do **Node.js**:

     ```bash
     node -v
     ```

     Isso deve retornar a versão instalada do Node.js, por exemplo:

     ```
     v16.14.0
     ```

   - Para verificar a versão do **npm** (Node Package Manager):

     ```bash
     npm -v
     ```

     Isso deve retornar a versão instalada do npm, por exemplo:

     ```
     8.3.1
     ```

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
