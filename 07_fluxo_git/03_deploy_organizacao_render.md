<h1>Deploy do Backend no Render - Github Organization</h1>



Quando estamos trabalhando com Organizações, além de conectar o Render com a Conta do Github é necessário autorizar o acesso do Render na Organização, para poder acessar os repositórios.
Neste material, o Passo 09 foi adaptado para o Deploy do Projeto Integrador via Github Organization. Substitua o Passo 09 do Guia do Deploy do Projeto Blog Pessoal pelas instruções abaixo. Os demais passos são iguais.

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="200px"/> | <p align="justify"> **ATENÇÃO:**  *Crie uma nova conta no Render utilizando o e-mail que foi criado para o projeto, ou seja, a mesma conta que o grupo utilizou para criar a conta no Github, onde foi criada a Organização*. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>👣 Passo 09 - Criar o Web Service no Render a partir de uma Organização</h2> 



1. Acesse o **Dashboard do Render**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/sFJy456.png" title="source: imgur.com" /></div>

2. Para adicionar um novo **Web Service**, no **Dashboard** do Render, clique no botão **+ Add new**, localizado no canto superior esquerdo, e em seguida clique na opção **Web Service**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/CZ9YmcY.png" title="source: imgur.com" /></div>

3. Na janela **You are deploying a Web Service**, clique no botão **GitHub**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/7qiuwnM.png" title="source: imgur.com" /></div>

4. Na tela, **Install Render**, clique na **Organização** que foi criada na conta do Github do Projeto Integrador (no exemplo abaixo, **projeto-modelo**), como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/x2SSX5X.png" title="source: imgur.com" /></div>

5. Na próxima tela, clique no botão **Install**, para concordar que o Render acesse a Organização no Github.

<div align="center"><img src="https://i.imgur.com/9u5YeOi.png" title="source: imgur.com" /></div>

6. Caso seja aberta a janela **Confirm access**, digite a senha do Github para confirmar e clique no botão **Confirm**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/XYHRcu9.png" title="source: imgur.com" /></div>

7. Na sequência, clique sobre o Repositório onde você enviou o **Projeto Integrador**, para selecioná-lo e configurar o deploy, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/5tA62Rf.png" title="source: imgur.com" /></div>

8. Role para baixo e informe o nome da sua aplicação na propriedade **Name**, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/ff1QtcN.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="120px"/> | <p align="justify"> **ATENÇÃO:** O NOME DO PROJETO NÃO PODE CONTER LETRAS MAIUSCULAS, NUMEROS OU CARACTERES ESPECIAIS. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

9. Role para baixo e verifique se a propriedade **Language** está com a opção **Docker** selecionada, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/IyHWJwc.png" title="source: imgur.com" /></div>

10. Role a tela para baixo, localize o item **Instance Type** e verifique se o Plano Gratuito (**Free**) está selecionado, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/qj1HUg2.png" title="source: imgur.com" /></div>

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <p align="justify"> **ATENÇÃO:** Caso seja selecionado um plano diferente, o Render exigirá o Cartão de Crédito para emitir a fatura do serviço. </p> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<br /><br />
	

<div align="left"><a href="https://github.com/conteudoGeneration/cookbook_java_fullstack/blob/main/04_spring/README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
