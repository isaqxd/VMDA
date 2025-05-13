CREATE DATABASE vmda;
USE vmda;

CREATE TABLE `vmda`.`usuario` (
    `id_usuario` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `cpf` VARCHAR(11) NOT NULL,
    `data_nascimento` DATE NOT NULL,
    `telefone` VARCHAR(15) NOT NULL,
    `tipo_usuario` ENUM('FUNCIONARIO', 'PESSOA') NOT NULL,
    `senha_hash` VARCHAR(32) NOT NULL,
    `otp_ativo` VARCHAR(6) NULL,
    `otp_expiracao` DATETIME NULL,
    PRIMARY KEY (`id_usuario`),
    UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE
);

CREATE TABLE `vmda`.`funcionario` (
    `id_funcionario`INT NOT NULL AUTO_INCREMENT,
    `usuario_id` INT,
    `codigo_funcionario` VARCHAR(20) NOT NULL,
    `cargo` ENUM('ESTAGIARIO', 'ATENDENTE', 'GERENTE') NOT NULL,
    `id_supervisor` INT,
    PRIMARY KEY (`id_funcionario`),
    FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(id_usuario),
    FOREIGN KEY (`id_supervisor`) REFERENCES `funcionario`(id_funcionario),
    UNIQUE INDEX `codigo_funcionario_UNIQUE` (`codigo_funcionario` ASC) VISIBLE
);

CREATE TABLE `vmda`.`pessoa` (
    `id_cliente` INT NOT NULL AUTO_INCREMENT,
    `usuario_id` INT,
    `score_credito` DECIMAL(5,2) DEFAULT 0,
    PRIMARY KEY (`id_cliente`),
    FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(id_usuario)
);

CREATE TABLE `vmda`.`endereco` (
    `id_endereco` INT NOT NULL AUTO_INCREMENT,
    `usuario_id` INT,
    `cep` VARCHAR(10) NOT NULL,
    `local` VARCHAR(100) NOT NULL,
    `numero_casa` INT NOT NULL,
    `bairro` VARCHAR(50) NOT NULL,
    `cidade` VARCHAR(50) NOT NULL,
    `estado` CHAR(2) NOT NULL,
    `complemento` VARCHAR(50),
    PRIMARY KEY (`id_endereco`),
    FOREIGN KEY (`usuario_id`) REFERENCES `usuario`(id_usuario),
    INDEX `cep_idx` (`cep`)
);

CREATE TABLE `vmda`.`agencia`(
    `id_agencia` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) NOT NULL,
    `codigo_agencia` VARCHAR(10),
    `endereco_id` INT,
    PRIMARY KEY (`id_agencia`),
    FOREIGN KEY (`endereco_id`) REFERENCES `endereco`(id_endereco),
    UNIQUE INDEX `codigo_agencia_UNIQUE` (`codigo_agencia` ASC) VISIBLE
);

CREATE TABLE `vmda`.`conta`(
    `id_conta` INT NOT NULL AUTO_INCREMENT,
    `numero_conta` VARCHAR(20) NOT NULL,
    `agencia_id` INT,
    `saldo` DECIMAL(15,2) NOT NULL DEFAULT 0,
    `tipo_conta` ENUM('POUPANCA','CORRENTE', 'INVESTIMENTO') NOT NULL,
    `cliente_id` INT,
    `data_abertura` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `status` ENUM('ATIVA','ENCERRADA','BLOQUEADA') not null default 'ATIVA',
    PRIMARY KEY (`id_conta`),
    FOREIGN KEY (`agencia_id`) REFERENCES `agencia`(id_agencia),
    FOREIGN KEY (`cliente_id`) REFERENCES `pessoa`(id_cliente),
    UNIQUE INDEX `numero_conta_UNIQUE` (`numero_conta` ASC) VISIBLE,
    INDEX `numero_conta_idx` (`numero_conta`)
);

CREATE TABLE `vmda`.`conta_poupanca` (
    `id_conta_poupanca` INT NOT NULL AUTO_INCREMENT,
    `conta_id` INT,
    `taxa_rendimento` DECIMAL(5,2) NOT NULL,
    `ultimo_rendimento` DATETIME,
    PRIMARY KEY (`id_conta_poupanca`),
    FOREIGN KEY (`conta_id`) REFERENCES `conta`(id_conta),
    UNIQUE (`conta_id`)
);

CREATE TABLE `vmda`.`conta_corrente`(
    `id_conta_corrente` INT NOT NULL AUTO_INCREMENT,
    `conta_id` INT,
    `limite` DECIMAL(15,2) NOT NULL DEFAULT 0,
    `data_vencimento` DATE NOT NULL,
    `taxa_manutencao` DECIMAL (5,2) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id_conta_corrente`),
    FOREIGN KEY (`conta_id`) REFERENCES `conta`(id_conta),
    UNIQUE (`conta_id`)
);

CREATE TABLE `vmda`.`conta_investimento`(
    `id_conta_investimento` int not null auto_increment,
    `conta_id` int,
    `perfil_risco` enum('BAIXO','MEDIO','ALTO') not null,
    `valor_minimo` decimal(15,2) not null,
    `taxa_rendimento` decimal (5,2) not null,
    PRIMARY KEY (`id_conta_investimento`),
    FOREIGN KEY (`conta_id`) REFERENCES `conta`(id_conta),
    unique (`conta_id`)
);

CREATE TABLE `vmda`.`transacao`(
    `id_transacao` int not null auto_increment,
    `id_conta_origem` int,
    `id_conta_destino` int,
    `tipo_transacao` enum('DEPOSITO', 'SAQUE', 'TRANSFERENCIA', 'TAXA', 'RENDIMENTO') not null,
    `valor` decimal(15,2) not null,
    `data_hora` timestamp not null default current_timestamp,
    `descricao` varchar(100),
    PRIMARY KEY (`id_transacao`),
    FOREIGN KEY (`id_conta_origem`) REFERENCES `conta`(id_conta),
    FOREIGN KEY (`id_conta_destino`) references `conta` (id_conta),
    INDEX `data_hora_idx` (`data_hora`)
);

CREATE TABLE `vmda`.`auditoria`(
    `id_auditoria` int not null auto_increment,
    `usuario_id` int,
    `acao` varchar(50) not null,
    `data_hora` timestamp not null default current_timestamp,
    `detalhes` text,
    PRIMARY KEY (`id_auditoria`),
    foreign key (`usuario_id`) references `usuario`(id_usuario)
);

CREATE TABLE `vmda`.`relatorio`(
    `id_relatorio` int not null auto_increment,
    `funcionario_id` int,
    `tipo_relatorio` varchar(50) not null,
    `data_geracao` timestamp not null default current_timestamp,
    `conteu` text not null,
    PRIMARY KEY (`id_relatorio`),
    foreign key (`funcionario_id`) references `funcionario`(id_funcionario)
);