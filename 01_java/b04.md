<h1>Formatando Numeros Reais no Java</h1>



Na Linguagem Java, nós temos 2 tipos de dados Reais: **float e double**. Por padrão, o Java utiliza o formato Inglês Americano, ou seja, o separador de milhar é a virgula (,) e o separador de decimal é o ponto (.) para exibir um número real. Observe que na Língua Portuguesa utilizamos o inverso do padrão Americano, ou seja, o separador de milhar é o ponto (.) e o separador de decimal é a virgula (,).

Para formatar a saída de dados para o formato Português Brasil ou outros formatos, o Java nos oferece duas Classes:

- **NumberFormat**
- **DecimalFormat**

<br />

| <img src="https://i.imgur.com/hOgWvSc.png" title="source: imgur.com" width="80px"/> | <div align="left"> **ATENÇÃO:** *As Classes de Formatação de números Reais do Java não alteram o valor ou a formatação original/padrão do número em uma variável ou Objeto, elas apenas exibem o número na tela, através dos métodos de saída de dados, com a formatação personalizada.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>1. NumberFormat</h2>

A Classe **NumberFormat**, faz parte do pacote  **java.text** e permite formatar números conforme a localização geográfica, definida no seu Sistema Operacional. A classe realiza a distinção entre o sinal de ponto, milhar e decimal, e também identifica a posição do sinal do número e identifica o prefixo, que indica a moeda em caso de valores monetários.

A Classe  **NumberFormat** possui 4 Métodos principais:

| Método                    | Descrição                                                    |
| ------------------------- | ------------------------------------------------------------ |
| **getNumberInstance()**   | Retorna a instância de um objeto com base no formato da localidade padrão. É utilizado para números. |
| **getCurrencyInstance()** | Usado para formatar moedas. Este Método identifica a partir do Sistema Operacional qual é a localidade (país). |
| **getIntegerInstance()**  | Usado para formatar números ignorando casas decimais.        |
| **getPercentInstance()**  | Usado para formatar frações pro exemplo 0,15 é formatado e mostrado como 15%. |

<br />

Para aplicar a formatação em um número Real ou variável dos tipos float u double, utilizaremos o Método **.format()**.

<br />

**Sintaxe:**

**Criar o Objeto da Classe NumberFormat:**

```java
NumberFormat nome_objeto = NumberFormat.metodo();
```

**Onde:**

- **metodo** é um dos 4 Métodos descritos na tabela acima.

**Aplicar a formatação:**

```java
nome_objeto.format(numero_real)
```

**Onde:**

- **numero_real** pode ser um número ou uma variável do tipo float ou double.

<br />

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/> Exemplo 01: Classe NumberFormat

```java
package formatacao;

import java.text.NumberFormat;

public class NF {

	public static void main(String[] args) {
		
		NumberFormat nfNumero = NumberFormat.getNumberInstance();
		NumberFormat nfMoeda = NumberFormat.getCurrencyInstance();
		NumberFormat nfInteiro = NumberFormat.getIntegerInstance();
		NumberFormat nfPercentual = NumberFormat.getPercentInstance();
		
		System.out.println("Numero Real: " + nfNumero.format(2.5));
		System.out.println("Valor Monetário: " + nfMoeda.format(2750.00));
		System.out.println("Numero sem a parte decimal: " + nfInteiro.format(23.5));
		System.out.println("Porcentagem: " + nfPercentual.format(0.15));
	}

}
```

<br />

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Numero Real: 2,5
Valor Monetário: R$ 2.750,00
Numero sem a parte decimal: 24
Porcentagem: 15%
```

Observe que os números foram exibidos na tela, seguindo o padrão de formatação do idioma Português Brasil, configurado no seu Sistema Operacional.

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/8/docs/api/java/text/NumberFormat.html" target="_blank"><b>Documentação: Classe NumberFormat</b></a></div>

<br />

<h2>2. DecimalFormat</h2>



A Classe **DecimalFormat** também faz parte do pacote **java.text** e permite formatar números reais, personalizando a formatação, ao invés de pegar a formatação padrão do seu Sistema Operacional. Você pode usar a classe  DecimalFormat para formatar números decimais e controlar a exibição de dígitos à esquerda e a quantidade de zeros à direita, prefixos e sufixos e ainda agrupar separadores de milhar e o separador decimal. 

Para personalizar a formatação, você precisa especificar as propriedades de formatação através de uma cadeia de caracteres padrão. O padrão determina a formatação. Para criar a formatação, utilizaremos a tabela de símbolos abaixo:

| Caractere | Descrição                                                    |
| --------- | ------------------------------------------------------------ |
| **0**     | Um dígito. Caso não esteja presente adiciona 0.              |
| **#**     | Um dígito. Caso não esteja presente ou seja o dígito zero, este digito não será exibido. |
| **.**     | Separador de Decimal                                         |
| **,**     | Separador de Milhar                                          |

<br />

Para aplicar a formatação em um número Real ou variável dos tipos float u double, utilizaremos o Método **.format()**.

<br />

**Sintaxe:**

**Criar o Objeto da Classe NumberFormat:**

```java
DecimalFormat nome_objeto = new DecimalFormat(padrão);
```

**Onde:**

- **padrão** é o padrão de formatação, que será criado através do caracteres descritos na tabela acima.

**Aplicar a formatação:**

```java
nome_objeto.format(numero_real)
```

**Onde:**

- **numero_real** pode ser um número ou uma variável do tipo float ou double.

<br />

## <img src="https://i.imgur.com/gsSDe7P.png" title="source: imgur.com" width="3%"/> Exemplo 02: Classe DecimalFormat

```java
package formatacao;

import java.text.DecimalFormat;

public class DF {

	public static void main(String[] args) {
		
		DecimalFormat df = new DecimalFormat("###,##0.00");
		
		System.out.println("Numero Real: " + df.format(2.5));
		System.out.println("Valor Monetário: " + df.format(2750.00));
		System.out.println("Numero com zeros à esquerda: " + df.format(0023.55789));

	}

}
```

<br />

<img src="https://i.imgur.com/V2ReOnx.png" title="source: imgur.com" width="3%"/>**Resultado do Código:**

```bash
Numero Real: 2,50
Valor Monetário: 2.750,00
Numero com zeros à esquerda: 23,56
```

Observe que os números foram exibidos na tela, seguindo o padrão de formatação criado. No padrão criado no exemplo acima, o caractere cerquilha (**#**) indica que o dígito será exibido apenas se for diferente de zero, enquanto o caractere zero (**0**) indica que o dígito obrigatoriamente será exibido, mesmo sendo zero. 

Na segunda linha, embora o valor esteja no formato de moeda, diferente da Classe **NumberFormat**, a Classe **DecimalFormat** não adicionou o símbolo da moeda brasileira, o Real (**R$**).

Na terceira linha, observe que as casas decimais foram arredondadas e os zeros à esquerda foram ignorados.

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/javase/8/docs/api/java/text/DecimalFormat.html" target="_blank"><b>Documentação: Classe DecimalFormat</b></a></div>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>	
