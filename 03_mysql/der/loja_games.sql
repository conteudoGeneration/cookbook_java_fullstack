-- Cria o Banco de dados
CREATE DATABASE db_games;

-- Seleciona o Banco de dados para uso
USE db_games;

-- Cria a tabela Categorias
CREATE TABLE tb_categorias (
  id BIGINT NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
  );

-- Insere dados na tabela Categorias
INSERT INTO tb_categorias (tipo) VALUES ("E-Sports");
INSERT INTO tb_categorias (tipo) VALUES ("Ação");
INSERT INTO tb_categorias (tipo) VALUES ("Aventura");
INSERT INTO tb_categorias (tipo) VALUES ("Estratégia");
INSERT INTO tb_categorias (tipo) VALUES ("RPG");
INSERT INTO tb_categorias (tipo) VALUES ("Simulação");
INSERT INTO tb_categorias (tipo) VALUES ("Outros");

-- Lista todas as Categorias
Select * from tb_categorias;

-- Cria a tabela Usuários
CREATE TABLE tb_usuarios (
  id BIGINT NOT NULL AUTO_INCREMENT,
  usuario VARCHAR(255) NOT NULL,
  nome VARCHAR(255) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  foto VARCHAR(255),
  data_nascimento DATE NOT NULL,
  PRIMARY KEY (`id`)
  );

-- Insere dados na tabela Usuários
insert into tb_usuarios(usuario, nome, senha, foto, data_nascimento) values ("admin@email.com.br", "Administrador", "123a456*78", "https://i.imgur.com/FETvs2O.jpg", "2001-11-22");
insert into tb_usuarios(usuario, nome, senha, foto, data_nascimento) values ("mariana@email.com.br", "Mariana Maria da Silva", "123@456&78", "https://i.imgur.com/mB3VM2N.jpg", "2001-11-22");
insert into tb_usuarios(usuario, nome, senha, foto, data_nascimento) values ("adriana@email.com.br", "Adriana Kaylany de Souza", "123l456t78", "https://i.imgur.com/5M2p5Wb.jpg", "2002-12-26");
insert into tb_usuarios(usuario, nome, senha, foto, data_nascimento) values ("quico@email.com.br", "Frederico Santos", "123b456#78", "https://i.imgur.com/Sk5SjWE.jpg", "2003-12-26");
insert into tb_usuarios(usuario, nome, senha, foto, data_nascimento) values ("florinda@email.com.br", "Florinda Mezza", "123!456?78", "https://i.imgur.com/NtyGneo.jpg", "2002-12-26");
insert into tb_usuarios(usuario, nome, senha, foto, data_nascimento) values ("evelise@email.com.br", "Evelise Franco", "123f456v78", "https://i.imgur.com/EcJG8kB.jpg", "2001-12-26");
insert into tb_usuarios(usuario, nome, senha, foto, data_nascimento) values ("julmiara@email.com.br", "Julmiara Correa", "123@!456g78", "https://i.imgur.com/T12NIp9.jpg", "2000-12-26");

-- Lista todos os Usuários
Select * from tb_usuarios;

-- Cria a tabela Produtos
CREATE TABLE tb_produtos (
  id BIGINT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descricao VARCHAR(500),
  console VARCHAR(255) NOT NULL,
  quantidade INT,
  preco DECIMAL(19,2) NOT NULL,
  foto VARCHAR(255),
  categoria_id BIGINT,
  usuario_id BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (usuario_id) REFERENCES tb_usuarios (id),
  FOREIGN KEY (categoria_id) REFERENCES tb_categorias (id)
  );

-- Insere dados na tabela Produtos
INSERT INTO tb_produtos (nome, descricao, console, quantidade, preco, foto, categoria_id, usuario_id) 
VALUES ("Kena: Bridge of Spirits", "Kena: Bridge of Spirits é o projeto de estreia da Ember Lab e impressiona ainda mais a cada replay do trailer. O estilo único de arte mistura elementos marcantes da Pixar e do Studio Ghibli, resultando em uma incrível animação.", "PS5", 50, 500.00, "https://i.imgur.com/YqasKzX.jpg", 3, 2);

INSERT INTO tb_produtos (nome, descricao, console, quantidade, preco, foto, categoria_id, usuario_id) 
VALUES ("Returnal", "um shooter com uma pegada um pouco diferente do habitual. A visão da câmera um pouco mais próxima da protagonista promete uma experiência singular com narrativa assustadora", "PS5", 10, 400.00, "https://i.imgur.com/Xd9vF7t.jpg", 6, 3);

INSERT INTO tb_produtos (nome, descricao, console, quantidade, preco, foto, categoria_id, usuario_id) 
VALUES ("Resident Evil Village", "Novo game da franquia de zumbis da Capcom e promete dar uma continuação majestosa ao legado do survival horror. Mais uma vez estaremos no controle de Ethan Winters e devemos escapar com vida de um misterioso vilarejo do interior europeu.", "PS5", 20, 800.00, "https://i.imgur.com/iQMTaVC.jpg", 3, 4);

INSERT INTO tb_produtos (nome, descricao, console, quantidade, preco, foto, categoria_id, usuario_id) 
VALUES ("God of War Ragnarok", "God of War Ragnarok promete dar continuidade à história de Kratos e Atreus. O Deus da Guerra se encaixou muito bem nos moldes da mitologia nórdica e conquistou até o GoTY em 2018 — em disputa acirrada contra Red Dead Redemption 2.", "PS5", 100,  700.00, "https://i.imgur.com/8qnAKwO.jpg", 3, 5);

INSERT INTO tb_produtos (nome, descricao, console, quantidade, preco, foto, categoria_id) 
VALUES ("Halo Infinite", "O jogo colocará os jogadores de volta na sagrada armadura espartana de Master Chief, enquanto ele combate os Banidos, uma nova ameaça à humanidade, e promete mais liberdade do que qualquer jogo recente da série, com níveis enormes.", "XBOX", 80, 1000.00, "https://i.imgur.com/ZnDckc2.jpg", 3);

INSERT INTO tb_produtos (nome, descricao, console, quantidade, preco, foto) 
VALUES ("Flight Simulator", "O Flight Simulator promete aos jogadores a liberdade de criar seus próprios planos de vôo e decolar em qualquer lugar do mundo, voando dia e noite em condições climáticas realistas.", "XBOX", 15, 250.00, "https://i.imgur.com/cYl5vhh.jpg");

-- Lista todos os Produtos
Select * from tb_produtos;

-- Lista todos os Produtos com a categoria
select tb_produtos.nome, tb_categorias.tipo 
from tb_produtos inner join tb_categorias
on tb_categorias.id = tb_produtos.categoria_id;

-- Lista todos os Produtos com o nome do vendedor
select tb_produtos.nome, tb_usuarios.nome as vendedor
from tb_produtos inner join tb_usuarios
on tb_usuarios.id = tb_produtos.usuario_id;

-- Lista todos os Produtos com a categoria e o vendedor
select tb_produtos.nome, 
CONCAT('R$ ',FORMAT(tb_produtos.preco, 2,'pt_BR')) as preço, 
tb_categorias.tipo, 
tb_usuarios.nome as vendedor 
from tb_produtos 
inner join tb_categorias on tb_categorias.id = tb_produtos.categoria_id
inner join tb_usuarios on tb_usuarios.id = tb_produtos.usuario_id;
