# INICIO

Primeiro eu preparei o banco de dados no meu ambiente **SGDB** para utilizar eles como referências no java.

Usei exemplo da documentação e preparei o seguinte BD:

 ```
CREATE DATABASE vmda;
USE vmda;

CREATE TABLE usuario (
  idusuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(20) NOT NULL,
  data_nascimento DATE NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  UNIQUE INDEX cpf_UNIQUE (cpf ASC) VISIBLE);
  ```

Dentro da IDE de java eu criei o projeto neste caso podemos da git clone mas caso queira fazer só seguir os próximos
passos.

- Faça a ligação do arquivo jar da pasta depedencias com o projeto, no **IntelliJ** aperte **Ctrl+Alt+Shift+S** vai em
   **Libraries** pressione **Alt+Insert** e adicione o arquivo que está em depedencias ele é uma biblioteca responsavel
   por dar os objetos que vai permitir a integração.
- Crie um pacote dentro de src chamado **"Conexao"** com uma java class **Conexao**.
  ```java
  package Conexao;
  
  // BIBLIOTECAS USADAS
  import java.sql.Connection;
  import java.sql.DriverManager;
  import java.sql.SQLException;
  
  public class Conexao {
  //DEFINI A CONEXÃO ESTATICA COM BASE NO MEU CADASTRO DO SQL
    private static final String url = "jdbc:mysql://localhost:3306/NOME DO BANCO"; 
    // SE VOCÊ ALTEROU A PORTA COLOQUE ELA NO ESPAÇO: "3306".
    private static final String user = "root"; // GERALMENTE "root" é o padrão de instalação.
    private static final String password = ""; // A SENHA QUE VOCÊ DEFINIU NA INSTALAÇÃO.
  
    private static Connection con; // CHAMEI A BIBLIOTECA SQL CONNECTION

    public static Connection getConexao() {
        try { //TRY CATCH 
            if (con == null) { // VERIFICA SE A MINHA CONEXÃO É NULA
                con = DriverManager.getConnection(url, user, password); // SE SIM ADICIONA ISSO A ELA.
                return con; // E ENTÃO RETORNA A CONEXÃO
            } else {
                return con; // CASO SEJA OUTRA COISA RETORNA A CONEXÃO
            }
        } catch (SQLException e) { // CASO NÃO SEJA POSSÍVEL CONECTAR ENVIARA MENSAGEM DE ERRO
            e.printStackTrace();
            return null;
        }
    }
  }
  ```
  Com isso já estamos conectados ao banco de dados mas vamos testar né.