<h1>Projeto 02 - Blog Pessoal - Relacionamento entre Classes - Recurso Tema - Parte 01</h1>

O que veremos por aqui:

1. Apresentação do Recurso Tema
2. Criar a Classe Model Tema
3. Criar o Relacionamento entre as Classes Postagem e Tema

<br />

<h2>1. O Recurso Tema</h2>

Nesta etapa vamos começar a construir o Recurso Tema. Veja o Diagrama de Classes abaixo: 

<div align="center"><img src="https://i.imgur.com/ocn729z.png" title="source: imgur.com" width="50%"/></div>

A **Classe Tema** servirá de modelo para construir a tabela **tb_temas** (Entidade) dentro do nosso Banco de dados **db_blogpessoal**. Os campos (Atributos) da tabela serão os mesmos que estão definidos no Diagrama de Classes acima. Além de construirmos a Classe Tema, também faremos o Relacionamento com a Classe Postagem, construída anteriormente. 

Na próxima etapa vamos construir a **Interface TemaRepository**, que irá nos auxiliar na interação com o Banco de dados e a **Classe TemaController**, onde serão implementados os 6 Métodos descritos no Diagrama de Classes acima.

Depois de criar a Classe Model Tema, vamos executar o projeto Blog Pessoal no STS. Após a execução veremos que será criado no Banco de dados **db_blogpessoal** a tabela **tb_temass**. Veja abaixo como ficará a estrutura da nossa tabela através do **Diagrama de Entidade e Relacionamentos (DER)**:

<div align="center"><img src="https://i.imgur.com/YKdkCyN.png" title="source: imgur.com" width="50%"/></div>

O Dicionário de dados da nossa tabela tb_temass será o seguinte:

| Atributo      | Tipo de dado | Descrição           | Chave |
| ------------- | ------------ | ------------------- | ----- |
| **id**        | bigint       | Identificador único | PK    |
| **descricao** | varchar(255) | Tema  |       |

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Atenção aos Detalhes ao criar o Recurso Tema. Todas as Camadas (Pacotes: Model, Repository e Controller), já foram criadas no Recurso Postagem.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="100px"/> | <div align="left"> **DICA:** *Caso você tenha alguma dúvida sobre como criar a Classe, executar o projeto, entre outras, consulte a Documentação do Recurso Postagem.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<h2>👣 Passo 01 - Criar a Classe Tema na Camada Model</h2>

Agora vamos criar a segunda Classe Model que chamaremos de **Tema**.

1. Clique com o botão direito do mouse sobre o **Pacote Model** (**com.generation.blogpessoal.model**), na Source Folder Principal (**src/main/java**), e clique na opção **New 🡪 Class**
2. Na janela **New Java Class**, no item **Name**, digite o nome da Classe (**Tema**), e na sequência clique no botão **Finish** para concluir.
3. Observe na imagem abaixo que o Pacote **model** agora terá 2 Classes:

<div align="center"><img src="https://i.imgur.com/AOwW48C.png" title="source: imgur.com" /></div>

Agora vamos criar o código da **Classe Model Tema** conforme o código abaixo:

```java
package com.generation.blogpessoal.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "tb_temas")
public class Tema {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull(message = "O Atributo Descrição é obrigatório")
	private String descricao;

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

}
```

Veja na tabela abaixo a conversão de **Tipo de dados Java 🡪 MySQL, de acordo com o que foi definido no Diagrama de Classes acima:**

| Atributo   | Tipo de dado Java                                            | Tipo de dado MySQL |
| ---------- | ------------------------------------------------------------ | ------------------ |
| **id**     | Long | BIGINT             |
| **descricao** | String | VARCHAR(255)       |

Observe que no Atributo **descricao** utilizamos a anotação **@NotNull**, que **não permite que o Atributo seja Nulo, mas permite que ele contenha apenas Espaços em branco**. Você pode configurar uma mensagem para o usuário através do Atributo **message**.

Caso você tenha alguma dúvida, consulte a **Documentação da Classe Postagem**, pois o código da Classe Tema é muito semelhante.

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**) e verificar se o Projeto está em execução

<br />

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://jakarta.ee/specifications/bean-validation/3.0/apidocs/jakarta/validation/constraints/notnull" target="_blank"><b>Documentação: <i>@NotNull</i></b></a></div>


<br />

<h2>👣 Passo 02 - Executar o projeto e Checar o Banco de dados</h2>

1. Execute o projeto e verifique no **MySQL Workbench** se a tabela **tb_temas** foi criada no Banco de dados **db_blogpessoal**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/v9NTzoW.png" title="source: imgur.com" /></div>

<br />

<h2>2. Relacionamento de Classes</h2>

**Mapeamento Objeto-Relacional (ORM)** é o processo de conversão das Classes Java em Tabelas (Entidades) no Banco de dados da aplicação e vice-versa. Em outras palavras, isso nos permite interagir com um Banco de dados Relacional. O **Java Persistence API (JPA)** é uma especificação que define como persistir dados em uma Banco de dados a partir de aplicações Java, sem a necessidade de utilizar código SQL. O foco principal do JPA é a camada **ORM**. O Framework responsável por implementar o ORM no Spring é o **Hibernate**. Para mais detalhes, consulte o Cookbook <a href="03.md" target="_blank"><b>Introdução ao JPA</b></a>.

O **JPA** simplifica o tratamento do modelo de Banco de dados Relacional nos aplicativos Java quando mapeamos cada Tabela para uma única Classe de entidade (Model) e para executar as consultas SQL (INSERT, SELECT, UPDATE e DELETE), o JPA utiliza as **Query Methods**, que são Métodos que fazem o mesmo papel das Queries SQL. 

Da mesma foram que criamos os Relacionamentos entre tabelas no SQL, no JPA, quando estamos trabalhando com um Banco de dados Relacional como o MySQL, também precisamos criar os **Relacionamentos entre as Classes**. A partir do Relacionamento entre as Classes, o **Hibernate** construirá o Relacionamento entre as Tabelas no Banco de dados Relacional. 

Nesta etapa vamos construir o **Relacionamento do Recurso Tema com o Recurso Postagem**. Veja o Diagrama de Classes abaixo: 

<div align="center"><img src="https://i.imgur.com/rE9pUwH.png" title="source: imgur.com" /></div>

<br />

Para construirmos o **Relacionamento entre Classes**, precisamos definir a **Cardinalidade** e a **Direção do Relacionamento**, como veremos a seguir:

<h3>2.1. Direção do Relacionamento</h3>

Quanto ao sentido, podemos definir de uma forma global dois tipos de Relacionamentos:

- **Unidirecional.**
- **Bidirecional.**

Nos **Relacionamentos Unidirecionais**, mapeamos somente uma das entidades  envolvidas no relacionamento. Nestes relacionamentos, temos os conceitos de **Entidade Fonte** e **Entidade Alvo**. A diferença básica é que a **Entidade Fonte** possui o Mapeamento do Relacionamento.

Nos **Relacionamentos Bidirecionais**, as duas entidades são mapeadas e o relacionamento acontece em ambos os sentidos entre as entidades, que se comportam como se existissem dois Relacionamentos Unidirecionais, um para cada entidade envolvida.

Nos Relacionamentos Bidirecionais temos o conceito de **Entidade Proprietária** e **Entidade Inversa**.

- **Entidade Proprietária:** A tabela dessa Entidade será a Proprietária da **Chave Estrangeira - Foreign Key**.
- **Entidade Inversa:** O atributo deve ser anotado e configurado com o comando `mappedBy`.

<br />

<h3>2.2. Cardinalidade de um Relacionamento</h3>

O Mapeamento de uma Entidade é realizado de acordo com a sua Cardinalidade, através das anotações listadas na tabela abaixo:

| Tipo de Relacionamento  |      | Anotação      | Descrição                                                    |
| ----------------------- | :--: | ------------- | ------------------------------------------------------------ |
| Um pra um - 1:1         |  🡪   | `@OneToOne`   | Um Objeto da Classe A se relacionará com apenas um Objeto da Classe B. |
| Um pra muitos - 1:N     |  🡪   | `@OneToMany`  | Um Objeto da Classe A se relacionará com muitos Objetos da Classe B. |
| Muitos pra um - N:1     |  🡪   | `@ManyToOne`  | Muitos Objetos da Classe B se relacionarão com apenas um Objeto da Classe A. Esta anotação é utilizada em conjunto com a anotação `@OneToMany` para criar uma Relação Um para Muitos Bidirecional. |
| Muitos pra muitos - N:M |  🡪   | `@ManyToMany` | Muitos Objetos da Classe A se relacionarão com muitos Objetos da Classe B. |

<br/>

No **Relacionamento Unidirecional**, a anotação é inserida em apenas uma Classe, enquanto no **Relacionamento Bidirecional**, a anotação é inserida em ambas as Classes. No Projeto Blog Pessoal, utilizaremos apenas **Relacionamentos Bidirecionais Um para Muitos**.

Depois de criar o **Relacionamento Bidirecional Um para Muitos entre as Classes Postagem e Tema**, vamos executar o projeto Blog Pessoal no STS. Após executar o projeto, o MySQL criará a Relação entre as tabelas **tb_postagens** e **tb_temas** Unidirecional, porque não existe Relação Bidirecional no SQL. Veja abaixo como ficará a estrutura da nossa tabela através do **Diagrama de Entidade e Relacionamentos (DER)** abaixo:

<div align="center"><img src="https://i.imgur.com/73XEIxe.png" title="source: imgur.com" /></div>

Como o JPA faz o mapeamento das Tabelas em Objetos, caso o Relacionamento Bidirecional esteja habilitado, a Relação funcionará independente do Banco de Dados ser Unidirecional. 

<br />

<h2>👣 Passo 01 - Criar a Relação ManytoOne na Classe Postagem</h2>

A Classe Postagem será o lado N:1 da Relação Bidirecional, ou seja, **Muitas Postagens podem ter apenas Um Tema**. Para criar a Relação vamos inserir depois do último Atributo da Classe Postagem (data), as 3 linhas destacadas em vermelho na figura abaixo:

<div align="left"><img src="https://i.imgur.com/gbRGmVG.png" title="source: imgur.com" /></div>

**Linha 37:** A anotação **@ManyToOne** indica que a Classe Postagem será o lado N:1 e terá um **Objeto da Classe Tema**, que no modelo Relacional será a **Chave Estrangeira na Tabela tb_postagens (tema_id)**.

**Linha 38:** A anotação **@JsonIgnoreProperties** indica que uma parte do JSON será ignorado, ou seja, como a Relação entre as Classes será do tipo Bidirecional, ao listar o Objeto Postagem numa consulta, por exemplo, o Objeto Tema, que será criado na linha 39, será exibido como um **"Sub Objeto"** do Objeto Postagem, como mostra a figura abaixo, devido ao Relacionamento que foi criado.

```json
{
	"id": 1,
	"titulo": "Título da Postagem 01",
	"texto": "Texto da postagem 01",
	"data": "2022-05-02T09:27:11.2221618",
	"tema": {
		"id": 1,
		"descricao": "Tema 01"
	}
}
```

Ao exibir o Objeto Tema, o Objeto Postagem será exibido novamente e na sequência Tema será exibido novamente, criando um looping infinito dentro do JSON, devido a relação Bidirecional. Para impedir o looping infinito e o travamento da nossa aplicação (Vide a imagem abaixo com o erro que será exibido no Insomnia), utilizamos anotação **@JsonIgnoreProperties** para exibir o Objeto da Classe Postagem apenas uma vez, interrompendo a repetição. 

<div align="center"><img src="https://i.imgur.com/LChpd5m.png" title="source: imgur.com" /></div>

**Linha 39:** Será criado um Objeto da Classe Tema, que receberá os dados do Tema associado ao Objeto da Classe Postagem. Este Objeto representa a Chave Estrangeira da Tabela **tb_postagens (tema_id)**.

Depois do último Método Set, vamos acrescentar os Métodos Get e Set para o novo Atributo que foi adicionado na Classe Postagem:

1. Posicione o cursor no final dos Métodos Get e Set criados anteriormente, como mostra a  imagem abaixo:

<div align="center"><img src="https://i.imgur.com/ApwOACH.png" title="source: imgur.com" /></div>

2. No menu **Source**, clique na opção **Generate Getters and Setters...**

<div align="center"><img src="https://i.imgur.com/FcDinZ2.png" title="source: imgur.com" /></div>

3. Na tela **Generate Getters and Setters**, clique no botão **Select All** para selecionar todos os Atributos e clique no botão **Generate**.

<div align="center"><img src="https://i.imgur.com/5H4Jlwq.png" title="source: imgur.com" /></div>

4. Os dois Métodos gerados ficarão semelhantes a imagem abaixo, posicionados no final dos demais Métodos Get e Set gerados na construção da Classe:

<div align="center"><img src="https://i.imgur.com/ZwQXovM.png" title="source: imgur.com" /></div>

Depois de Criar o Relacionamento, observe que foram importados mais 2 pacotes, como mostra a imagem abaixo (indicados pelas Setas vermelhas):

<div align="left"><img src="https://i.imgur.com/JvPhiqK.png" title="source: imgur.com" /></div>

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**) e verificar se o Projeto está em execução.

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Atenção aos Detalhes ao criar o Relacionamento entre as Classes. Um erro muito comum é não criar os Métodos Get e Set para o novo Atributo que foi criado no Relacionamento.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="100px"/> | <div align="left"> **DICA:** *Toda vez que você adicionar um novo Atributo na sua Classe, não esqueça de criar os Métodos GET e SET do Atributo. Caso contrário, você não conseguirá visualizar ou atualizar os dados do Atributo.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://jakarta.ee/specifications/persistence/3.0/apidocs/jakarta.persistence/jakarta/persistence/manytoone" target="_blank"><b>Documentação: <i>@ManyToOne</i></b></a></div>

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://fasterxml.github.io/jackson-annotations/javadoc/2.6/com/fasterxml/jackson/annotation/JsonIgnoreProperties.html" target="_blank"><b>Documentação: <i>@JsonIgnoreProperties</i></b></a></div>

<br />

<h2>👣 Passo 02 - Criar a Relação OneToMany na Classe Tema</h2>

A Classe Tema será o lado 1:N, ou seja, **Um Tema pode ter Muitas Postagens**. Para criar a Relação vamos inserir depois do último Atributo da Classe Tema (descricao), as linhas abaixo, destacadas em vermelho na figura abaixo:

<div align="left"><img src="https://i.imgur.com/4Lc613l.png" title="source: imgur.com" /></div>

**Linha 28:** A anotação **@OneToMany** indica que a Classe Tema será o lado 1:N e terá **uma Collection List contendo Objetos da Classe Postagem**. Como a Relação entre as Classes será Bidirecional, a Collection List trará a lista com todos os Objetos da Classe Postagem relacionados com cada Objeto da Classe Tema. Como a Classe Tema será a **Classe Proprietária** da Relação, precisamos adicionar alguns parâmetros:

- **fetch:** A propriedade **fetch** define a estratégia de busca e carregamento dos dados das entidades relacionadas  durante uma busca. Ao trabalhar com um ORM como o Hibernate, a busca e carregamento de dados pode ser classificada em dois tipos: **Eager** (ansiosa) e **Lazy** (preguiçosa).

- **FetchType.LAZY:** No projeto Blog Pessoal utilizaremos o tipo LAZY (preguiçosa), ou seja, ao carregarmos os dados de uma Postagem, ele não carregará os dados do Tema associado a cada Postagem até que os dados sejam solicitados.

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="80px"/> | <div align="left"> **DICA:** *Consulte o <a href="#anexo2">Anexo II</a> para conhecer outras configurações para a propriedade fetch.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

- **mappedBy:** Uma vez que definimos o lado Proprietário do Relacionamento (Classe Tema), o Hibernate já possui todas as informações necessárias para mapear o relacionamento em nosso Banco de dados, criar a Chave Estrangeira e o Relacionamento propriamente dito. Para tornar essa associação Bidirecional no modelo Orientado a Objetos, informamos no parâmetro **mappedBy** o nome do Atributo da Classe Proprietária (Tema), que foi criado na Classe filha **Postagem (Tema tema)**, que será o Objeto de referência na Relação. 

- **cascade:** Os relacionamentos de entidade geralmente dependem da existência de outra entidade, por exemplo, o relacionamento **Tema 🡪 Postagem**. Sem o Tema, a entidade Postagem não tem nenhum significado próprio. Quando excluímos a entidade Tema, nossa entidade Postagem também deve ser excluída. **"Cascatear" (cascade)**, é a maneira de conseguir isso. Quando executamos alguma ação na entidade de destino (Tema), a mesma ação será aplicada à entidade associada (Postagem). 
- **CascadeType.REMOVE:** Quando um Objeto da Classe Tema for apagado, todos os Objetos da Classe Postagem associados ao Tema apagado, também serão apagados. O Inverso não é verdadeiro.

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="80px"/> | <div align="left"> **DICA:** *Consulte o <a href="#anexo3">Anexo III</a> para conhecer outras configurações para a propriedade cascade.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

**Linha 29:** A anotação **@JsonIgnoreProperties** indica que uma parte do JSON será ignorado, ou seja, assim como fizemos na Classe Postagem, também faremos na Classe Tema para impedir o looping infinito.

**Linha 30:** Será criada uma Collection List contendo Objetos da Classe Postagem, que receberá todos os Objetos da  Classe Postagem associadas a cada Objeto da Classe Tema. 

Depois do último Método Set, vamos acrescentar os Métodos Get e Set para o novo Atributo que foi adicionado na Classe Postagem:

1. Posicione o cursor no final dos Métodos Get e Set criados anteriormente, como mostra a imagem abaixo:

<div align="center"><img src="https://i.imgur.com/45901R5.png" title="source: imgur.com" /></div>

2. No menu **Source**, clique na opção **Generate Getters and Setters...**

<div align="center"><img src="https://i.imgur.com/FcDinZ2.png" title="source: imgur.com" /></div>

3. Na tela **Generate Getters and Setters**, clique no botão **Select All** para selecionar todos os Atributos e clique no botão **Generate**.

<div align="center"><img src="https://i.imgur.com/0IIisPP.png" title="source: imgur.com" /></div>

4. Os dois Métodos gerados ficarão semelhantes a imagem abaixo, posicionados no final dos demais Métodos Get e Set gerados na construção da Classe:

<div align="center"><img src="https://i.imgur.com/7gqQMnR.png" title="source: imgur.com" /></div>

Depois de Criar o Relacionamento, observe que foram importados mais 4 pacotes, como mostra a imagem abaixo (indicados pelas Setas vermelhas):

<div align="left"><img src="https://i.imgur.com/o8gTPCa.png" title="source: imgur.com" /></div>

Para concluir, não esqueça de Salvar o código (**File 🡪 Save All**) e verificar se o Projeto está em execução.

<br />

| <img src="https://i.imgur.com/vVDBDG0.png" title="source: imgur.com" width="150px"/> | <div align="left"> **ALERTA DE BSM:** *Mantenha a Atenção aos Detalhes ao criar o Relacionamento entre as Classes. Um erro muito comum é não criar os Métodos Get e Set para o novo Atributo que foi criado no Relacionamento.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

| <img src="https://i.imgur.com/RfjtOFi.png" title="source: imgur.com" width="100px"/> | <div align="left"> **DICA:** *Toda vez que você adicionar um novo Atributo na sua Classe, não esqueça de criar os Métodos GET e SET do Atributo. Caso contrário, você não conseguirá visualizar ou atualizar os dados do Atributo.* </div> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

<br />

<div align="left"><img src="https://i.imgur.com/wDz2IzB.png" title="source: imgur.com" width="25px"/> <a href="https://jakarta.ee/specifications/persistence/3.0/apidocs/jakarta.persistence/jakarta/persistence/onetomany" target="_blank"><b>Documentação: <i>@OneToMany</i></b></a></div>

<br />

<h2>👣 Passo 03 - Executar o projeto e Checar o Banco de dados</h2>

1. Execute o projeto e observe o Console do STS
1. No Console do STS, serão exibidas as linhas abaixo, indicando que a Tabela **tb_temas** e o Relacionamento com a Tabela **tb_postagens** foram criados:

<div align="left"><img src="https://i.imgur.com/pgqWLGQ.png" title="source: imgur.com" /></div>

1. Após a aplicação inicializar, verifique no **MySQL Workbench** se a **Chave Estrangeira (tema_id)** foi criada na Tabela **tb_Postagens**, no Banco de dados **db_blogpessoal**, como mostra a figura abaixo:

<div align="center"><img src="https://i.imgur.com/tFAl0La.png" title="source: imgur.com" /></div>

<br />

Na sequência, vamos implementar a Interface TemaRepository, a Classe TemaController e atualizar a Classe Postagem Controller.

<br />

<h2 id="anexo1">Anexo I - Principais Mensagens de Erro</h2>

| Erro                        | Descrição                                                    |
| --------------------------- | ------------------------------------------------------------ |
| ***BeanCreationException*** | Ao criar o Relacionamento Bidirecional, você criou apenas um lado da Relação (**@OneToMany**). Faltou criar o outro lado da Relação (**@ManyToOne**).<br />**Exemplo:** <br/>Habilitou o Relacionamento na Classe Tema, mas não habilitou na Classe Postagem. |

<br />

<h2 id="anexo2">Anexo II - Tipos de Fetch</h2>

| Tipo      | Descrição                                                    |
| --------- | ------------------------------------------------------------ |
| **EAGER** | A estratégia EAGER diz ao Hibernate para obter todas as entidades relacionadas com a consulta inicial, ou seja, ao carregarmos os dados de uma Entidade, ele também carregará os dados de todas as Entidades associadas e armazenará na memória. |
| **LAZY**  | A estratégia LAZY diz ao Hibernate para obter todas as entidades relacionadas somente quando for necessário, ou seja, ao carregarmos os dados de uma Entidade, ele não carregará os dados de todas as Entidades associadas até precisarmos destes dados. A estratégia LAZY é a estratégia padrão do Hibernate. |

<br />

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="3%"/> <a href="https://docs.oracle.com/javaee/7/api/javax/persistence/FetchType.html" target="_blank"><b>Documentação: <i>FetchType</i></b></a></div>

<br />

<h2 id="anexo3">Anexo III - Tipos de Cascade</h2>

| Tipo        | Descrição                                                    |
| ----------- | ------------------------------------------------------------ |
| **PERSIST** | Ele propaga a operação de persistir um objeto **Pai** para um objeto **Filho**, assim quando salvar a Entidade Cliente, também será salvo todas as Entidades Telefone associadas. |
| **MERGE**   | Ele propaga a operação de atualização de um objeto **Pai** para um objeto **Filho**, assim quando atualizadas as informações da Entidade Cliente, também  será atualizado no banco de dados todas as informações das Entidades  Telefone associadas. |
| **REMOVE**  | Ele propaga a operação de remoção de um objeto **Pai** para um objeto **Filho**, assim quando remover a Entidade Cliente, também será removida todas as entidades Telefone associadas. |
| **REFRESH** | Ele propaga a operação de recarregar de um objeto **Pai** para um objeto **Filho**, assim, quando houver atualização no banco de dados na Entidade Cliente, todas as entidades Telefone associadas serão recarregadas do banco de  dados. |
| **ALL**     | Corresponde a todas as operações acima (MERGE, PERSIST, REFRESH e REMOVE). |
| **DETACH**  | A operação de desanexação remove a entidade do contexto persistente.  Quando usamos CascaseType.DETACH, a entidade filha também é removida do contexto persistente |

<br />

<div align="left"><img src="https://i.imgur.com/wMe2uG1.png" title="source: imgur.com" width="3%"/> <a href="https://docs.oracle.com/javaee/7/api/javax/persistence/CascadeType.html" target="_blank"><b>Documentação: <i>CascadeType</i></b></a></div>

<br />

<div align="left"><img src="https://i.imgur.com/JACNZiR.png" title="source: imgur.com" width="25px"/> <a href="https://github.com/rafaelq80/backend_blogpessoal_v3/tree/10_Classe_Tema_Relacionamentos" target="_blank"><b>Código fonte do Projeto</b></a></div>

<br /><br />

<div align="left"><a href="README.md"><img src="https://i.imgur.com/XMgF3gl.png" title="source: imgur.com" width="3%"/>Voltar</a></div>
