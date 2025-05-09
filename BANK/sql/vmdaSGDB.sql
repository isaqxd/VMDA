CREATE TABLE `vmda`.`usuario` (
  idusuario INT NOT NULL 
  PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(20) NOT NULL,
  data_nascimento DATE NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  UNIQUE INDEX cpf_UNIQUE (cpf ASC) VISIBLE);
  
  select * from usuario;