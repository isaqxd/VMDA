package DAO;

import Conexao.Conexao;
import Entity.User;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {
    public void cadastrarUser(User user) {
        String sql = "INSERT INTO usuario (nome, cpf, data_nascimento, telefone) VALUES (?, ?, ?, ?)";

        PreparedStatement ps = null;

        try {
            ps = Conexao.getConexao().prepareStatement(sql);
            ps.setString(1, user.getNome());
            ps.setString(2, user.getCpf());
            ps.setDate(3, java.sql.Date.valueOf(user.getDataNascimento()));
            ps.setString(4, user.getTelefone());

            ps.execute();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
