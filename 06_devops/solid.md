<h1>Introdução ao SOLID</h1>



Aprender Orientação a Objetos não nos previne de escrever um **código confuso** ou, pior ainda, um software complexo, não preparado para crescer e/ou receber manutenção de forma simples. Escrever um bom código, usando de maneira correta os conceitos da Orientação a Objetos requer muita prática e experiência. Felizmente, muitos projetistas de software documentam o que chamamos de padrões de projeto, que nada mais são do que as famosas "Boas Práticas" de Orientação a Objetos para determinados problemas.

Um grupo de princípios de desenvolvimento de software muito famoso entre as pessoas desenvolvedoras é o **SOLID**. Os **cinco princípios do SOLID** são guias de como podemos criar softwares Orientados a Objetos legíveis e sustentáveis. Eles serão apresentados na ordem das letras do acrônimo, entretanto é importante ressaltar que não existe uma ordem para entendê-los, muito menos para aplicá-los, ou uma regra que determina que os 5 princípios devem ser aplicados em todos os projetos, então fique a vontade para estudar na sua ordem de preferência.

<h2>1. O que é SOLID?</h2>

**SOLID**, como citado anteriormente, são cinco princípios da programação Orientada a Objetos que facilitam no desenvolvimento de softwares, tornando-os fáceis de manter e estender. Esses princípios podem ser aplicados a qualquer linguagem Orientada a Objetos. 

Um ponto importante a ser destacado é que alguns deles podem parecer semelhantes, mas **não possuem a mesma finalidade**. Por exemplo, é possível satisfazer um princípio enquanto viola outro (mesmo que sejam parecidos), por isso em uma parte do projeto pode ser necessário aplicar um principio e em outra parte do projeto pode ser necessário aplicar outro.

<br />

<h3>1.2. A origem do acrônimo SOLID</h3>

O SOLID é uma junção de **princípios e boas práticas que visam melhorar a** **arquitetura e design de um projeto**, além de ter como intuito facilitar sua manutenção e compreensão.

O termo SOLID surgiu após seu criador, *Michael Feathers*, observar que era possível unificar os **cinco princípios da orientação a objeto na sigla SOLID**. 

<div align="center"><img src="https://i.imgur.com/fNbIbW9.png" title="source: imgur.com" /></div>

<br />

O acrônimo SOLID significa:

<div align="center"><img src="https://i.imgur.com/OOqHu5Y.png" title="source: imgur.com" /></div>

Esses princípios ajudam a pessoa desenvolvedora a escrever códigos mais limpos, separando responsabilidades, diminuindo acoplamentos, facilitando a refatoração e estimulando o reaproveitamento do código.

> **Acoplamento** significa o quanto uma Classe depende da outra para funcionar. E quanto maior for esta dependência entre ambas, dizemos que as 2 Classes estão fortemente acopladas e quanto menor for esta dependência entre ambas, dizemos que as 2 Classes estão fracamente acopladas. O forte acoplamento traz muitos problemas, especialmente em relação a manutenção e o gerenciamento, pois qualquer mudança em uma Classe impacta diretamente a outra Classe, e às vezes até uma Cadeia de Classes.

<br />
<br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>