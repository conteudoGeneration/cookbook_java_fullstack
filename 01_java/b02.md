<h1>Classe String</h1>

Cadeias de caracteres ou Strings são objetos, ou seja, instâncias da classe String do pacote java.lang e assim como a classe Math, existem vários métodos para manipularmos Strings.

| Método                                        | Descrição                                                    | Exemplo                                                      |
| --------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **String.length()**                           | Retorna  o tamanho da String.                                | String texto = "Teste"  <br />texto.length() = 5             |
| **String.charAt(indice)**                     | Retorna  o caractere em uma posição específica de uma String. | String s = "Teste"  <br />texto.charAt(2) = 'S'              |
| **String.valueOf()**                          | Converte  diversos tipos de dados em String.                 | int  numero = 11  <br />String.valueOf(numero) = "11"        |
| **String.substring(inicio)**                  | Retorna  uma cópia de caracteres a partir do índice inicio até o final da String. | String texto = "Teste" <br />texto.substring(2) = "ste"      |
| **String.substring(inicio,  fim)**            | Retorna  uma cópia de caracteres a partir de 2 índices inteiros: índice inicio até o  índice final. | String texto = "Teste" <br /> texto.substring(0, 2)= "Tes"   |
| **String.trim()**                             | Retorna  a String  sem todos os espaços em branco que aparecem no inicio e no final da String. | String texto  =  " Teste trim " <br /> texto.trim()=  "Teste trim" |
| **String.compareTo(String)**                  | Compara  2 Strings retornando 0 se forem iguais e 1 se forem diferentes. | String texto1 = "teste" <br />String texto2 = "TESTE" <br />String texto3 = "teste" <br />texto1.compareTo(texto2) = 1 <br />texto1.compareTo(texto3) = 0 |
| **String.replace(‘caracter’,  ‘substituto’)** | Substitui  caracteres individuais na String.                 | String texto = "Teste"  <br />texto.replace(‘e’,  ‘a’) = "Tasta" |
| **String.concat()**                           | Concatena  2 Strings e retorna um novo objeto String.        | String texto1 = "Olá" <br />String texto2 = "Mundo" <br />texto1.concat(texto2) = "OláMundo" |
| **String.toUpperCase()**                      | Transforma  todas as letras de uma String em maiúsculas.     | String texto = "Teste" <br />texto.toUpperCase() = "TESTE"   |
| **String.toLowerCase()**                      | Transforma  todas as letras de uma String em minúsculas.     | String texto = "Teste" <br />texto.toLowerCase() =  "teste"  |
| **String.equals(String)**                     | Compara  2 Strings verificando se são iguais considerando inclusive se as letras são  maiúsculas ou minúsculas. | String texto1 = "teste" <br />String texto2 = "TESTE" <br />String texto3 = "teste" <br />texto1.equals(texto2) = false  <br />texto1.equals(texto3) = true |
| **String.equalsIgnoreCase(String)**           | Compara  2 Strings verificando se são iguais ignorando se as letras são maiúsculas ou minúsculas. | String texto1 = "teste"<br />String texto2 = "TESTE"<br />String texto3 = "teste"<br />texto1.equalsIgnoreCase(texto2) = true<br />texto1.equalsIgnoreCase(texto3) = true |
| **String.startsWith(String)**                 | Verifica se uma String inicia com a String passada como parâmetro. | String texto = "Teste" <br />texto.startsWith(T) = true      |
| **String.endsWith(String)**                   | Verifica se uma String termina com a String passada como parâmetro. | String texto = "Teste" <br />texto.endsWith(T) = false       |
| **String.contains(String)**                   | Verifica se uma String contém a String passada como parâmetro. | String texto = "Teste" <br />texto.contains(es) = true       |

<br />

<div align="left"><img src="https://i.imgur.com/JSfXyzm.png" title="source: imgur.com" width="30px"/> <a href="https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/String.html" target="_blank"><b>Documentação: Classe String</b></a></div>

<br /><br />


<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>	
