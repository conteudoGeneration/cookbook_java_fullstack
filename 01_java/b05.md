<h1>Debug de código no Eclipse/STS</h1>



*O Debug (depuração)* de código permite executar um programa de forma interativa enquanto a pessoa desenvolvedora observa o código-fonte e as mudanças que as variáveis sofrem durante a execução.

Um *Breakpoint (ponto de interrupção)* no código-fonte especifica onde a execução do programa deve parar durante a depuração. Uma vez que a execução para o programa no ponto indicado, você pode executar linha a linha, passo a a passo e investigar variáveis, alterar seu conteúdo, entre outros.

Para exemplificar o funcionamento do Debug, crie um novo Projeto Java e insira o código abaixo:

```java
package debug;

import java.util.Scanner;

public class TestaDebug {

	public static void main(String[] args) {

		Scanner leia = new Scanner(System.in);

		int[] vetorInteiros = new int[5];

		for (int indice = 0; indice < vetorInteiros.length; indice++) {
			System.out.println("Digite um valor para a posição [" + indice + "]");
			vetorInteiros[indice] = leia.nextInt();
		}

		for (int contador = 0; contador < vetorInteiros.length; contador++)
			System.out.println("posição " + contador + " = " + vetorInteiros[contador]);
		
		leia.close();
	}

}
```

Se você executar o código acima pelo modo tradicional, você observará que será solicitada a entrada de dados no vetor e ao final, será exibido todos os dados inseridos no vetor, como vemos abaixo: 

```bash
Digite um valor para a posição [0]
10
Digite um valor para a posição [1]
20
Digite um valor para a posição [2]
30
Digite um valor para a posição [3]
40
Digite um valor para a posição [4]
50
posição 0 = 10
posição 1 = 20
posição 2 = 30
posição 3 = 40
posição 4 = 50
```

<br />

<h2>1. Executando o código no Debug</h2>



Primeiro precisamos definir um Breakpoint. Vamos inserir um Breakpoint na linha 13, ou seja, no Laço de Repetição responsável por inserir dados no vetor:

1. Na linha 13, em cima do número 13, clique com o botão direito do mouse. 

<div align="center"><img src="https://i.imgur.com/KOoPF2p.png" title="source: imgur.com" /></div>

2. No menu que será aberto, clique na opção **Toggle Breakpoint**.

<div align="center"><img src="https://i.imgur.com/Txz9Tit.png" title="source: imgur.com" /></div>

3. Observe que será adicionada uma bolinha ao lado do número 13, indicando que o Breakpoint foi adicionado.

<div align="center"><img src="https://i.imgur.com/S3b7Bhe.png" title="source: imgur.com" /></div>



Na sequência, vamos executar o código em modo **Debug**:

1. Na Barra de Ferramentas principal, clique no ícone do **Debug** (desenho de um besouro), como indicado na imagem abaixo:

<div align="center"><img src="https://i.imgur.com/PJQ5JHP.png" title="source: imgur.com" /></div>

2. Na sequência, será exibida a mensagem abaixo, perguntando se você deseja executar o Debug. Clique no botão **Switch**.

<div align="center"><img src="https://i.imgur.com/M7PSZLm.png" title="source: imgur.com" /></div>

3. Será aberta a janela abaixo:

<div align="center"><img src="https://i.imgur.com/jV40JsO.png" title="source: imgur.com" /></div>

4. A principal mudança do modo Debug é a janela **Variables**:

<div align="center"><img src="https://imgur.com/SCWhXGY.png" title="source: imgur.com" /></div>

5. Na janela acima, é possível acompanhar todas as alterações de todas as variáveis do nosso programa e identificar eventuais erros.

6. O Eclipse fornece botões na Barra de Ferramentas principal (veja na imagem abaixo), para controlar a execução do programa que você está depurando. Normalmente, é mais fácil usar as teclas de atalho correspondentes para controlar essa execução.

<div align="center"><img src="https://i.imgur.com/UYAx3RE.png" title="source: imgur.com" /></div>

| Tecla  | Comando         | Descrição                                                    |
| ------ | --------------- | ------------------------------------------------------------ |
| **F5** | **Step into**   | Executa a linha atualmente selecionada e vai para a próxima linha em seu programa. Se a linha selecionada for um método, ele executará todas as etapas do depurador no código associado. |
| **F6** | **Step over**   | F6 passa por cima da chamada, ou seja, executa um método sem depurar. |
| **F7** | **Step return** | F7 avança para o chamador do método atualmente executado. Isso finaliza a execução do método atual e retorna ao chamador desse método. |
| **F8** | **Resume**      | F8 informa ao depurador do Eclipse para retomar a execução do código do  programa até atingir o próximo ponto de interrupção ou ponto de  controle. |

7. Na animação abaixo, veremos a execução do nosso código no Debug. Observe que foi utilizado o comando F6 (Step Over), para executar o código passo a passo a partir do Breakpoint:

<div align="center"><img src="https://i.imgur.com/QDt1gk8.gif" title="source: imgur.com" /></div>

Observe na animação acima, na janela **Variables**, que a cada número digitado, uma nova posição do vetor é preenchida.

8. Para retornar para o modo Java (janela padrão do Eclipse), clique no botão **Java**, localizado no final da Barra de Ferramentas principal, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/e20qxQb.png" title="source: imgur.com" /></div>

<br />

<br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div> 
