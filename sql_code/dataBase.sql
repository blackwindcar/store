DROP TABLE IF EXISTS userencomenda;
DROP TABLE IF EXISTS coment;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS encomenda;
DROP TABLE IF EXISTS carrinhoproduto;
DROP TABLE IF EXISTS carrinho;
DROP TABLE IF EXISTS categoria;
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS subcategoria;

CREATE TABLE carrinho (
  ref          int(9) NOT NULL AUTO_INCREMENT, 
  datacriacao  timestamp DEFAULT CURRENT_TIMESTAMP() NOT NULL, 
  encomendaref int(9) NOT NULL, 
  PRIMARY KEY (ref), 
  UNIQUE INDEX (ref));
CREATE TABLE carrinhoproduto (
  carrinhoref int(9) NOT NULL, 
  produtoref  int(9) NOT NULL, 
  datacriacao timestamp DEFAULT CURRENT_TIMESTAMP() NOT NULL, 
  PRIMARY KEY (carrinhoref, 
  produtoref));
CREATE TABLE categoria (
  nome varchar(255) NOT NULL, 
  img  varchar(255) NOT NULL, 
  PRIMARY KEY (nome), 
  INDEX (nome));
CREATE TABLE coment (
  id           int(10) NOT NULL AUTO_INCREMENT, 
  coment       varchar(511) NOT NULL, 
  datacriacao  timestamp DEFAULT CURRENT_TIMESTAMP() NOT NULL, 
  tipo         int(1) NOT NULL, 
  produtoref   int(9), 
  encomendaref int(9), 
  useruser     varchar(50) NOT NULL, 
  PRIMARY KEY (id), 
  UNIQUE INDEX (id));
CREATE TABLE encomenda (
  ref         int(9) NOT NULL AUTO_INCREMENT, 
  carrinhoref int(9) NOT NULL, 
  datacriacao timestamp DEFAULT CURRENT_TIMESTAMP() NOT NULL, 
  dataestado  timestamp DEFAULT CURRENT_TIMESTAMP() NOT NULL, 
  estado      int(1) DEFAULT 0 NOT NULL, 
  dataentrega timestamp DEFAULT NULL NULL, 
  PRIMARY KEY (ref), 
  UNIQUE INDEX (ref));
CREATE TABLE produto (
  ref                       int(9) NOT NULL AUTO_INCREMENT comment 'referencia dos produtos', 
  subcategorianome          varchar(255) NOT NULL, 
  nome                      varchar(255) NOT NULL, 
  `desc`                    varchar(2047) NOT NULL, 
  img                       varchar(255) NOT NULL, 
  preco                     real NOT NULL, 
  quatidade                 int(5), 
  subcategoriacategorianome varchar(255) NOT NULL, 
  encomendas                tinyint(1) NOT NULL, 
  datacriacao               timestamp DEFAULT CURRENT_TIMESTAMP() NOT NULL, 
  tempoproducao             timestamp DEFAULT NULL NULL, 
  PRIMARY KEY (ref), 
  UNIQUE INDEX (ref));
CREATE TABLE subcategoria (
  nome          varchar(255) NOT NULL, 
  categorianome varchar(255) NOT NULL, 
  img           varchar(255) NOT NULL, 
  PRIMARY KEY (nome), 
  INDEX (nome));
CREATE TABLE `user` (
  `user`  varchar(50) NOT NULL, 
  pass    varchar(50) NOT NULL, 
  email   varchar(255) NOT NULL, 
  tipo    int(1) NOT NULL, 
  nome    varchar(255) NOT NULL, 
  morada  varchar(1023) NOT NULL, 
  nif     int(10) NOT NULL, 
  tel     int(9) NOT NULL, 
  confirm tinyint(1) DEFAULT 0 NOT NULL, 
  PRIMARY KEY (`user`));
  
CREATE TABLE userencomenda (
  encomendaref int(9) NOT NULL, 
  useruser     varchar(50) NOT NULL, 
  PRIMARY KEY (encomendaref, 
  useruser));
  
ALTER TABLE userencomenda ADD CONSTRAINT FKuserencome215457 FOREIGN KEY (useruser) REFERENCES `user` (`user`);
ALTER TABLE userencomenda ADD CONSTRAINT FKuserencome354248 FOREIGN KEY (encomendaref) REFERENCES encomenda (ref);
ALTER TABLE coment ADD CONSTRAINT FKcoment113559 FOREIGN KEY (useruser) REFERENCES `user` (`user`);
ALTER TABLE coment ADD CONSTRAINT FKcoment974767 FOREIGN KEY (encomendaref) REFERENCES encomenda (ref);
ALTER TABLE coment ADD CONSTRAINT FKcoment394424 FOREIGN KEY (produtoref) REFERENCES produto (ref);
ALTER TABLE encomenda ADD CONSTRAINT FKencomenda216879 FOREIGN KEY (carrinhoref) REFERENCES carrinho (ref);
ALTER TABLE carrinhoproduto ADD CONSTRAINT FKcarrinhopr939737 FOREIGN KEY (produtoref) REFERENCES produto (ref);
ALTER TABLE carrinhoproduto ADD CONSTRAINT FKcarrinhopr558680 FOREIGN KEY (carrinhoref) REFERENCES carrinho (ref);
ALTER TABLE subcategoria ADD CONSTRAINT FKsubcategor171543 FOREIGN KEY (categorianome) REFERENCES categoria (nome);
ALTER TABLE produto ADD CONSTRAINT FKproduto389586 FOREIGN KEY (subcategorianome) REFERENCES subcategoria (nome);
