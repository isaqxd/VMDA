import DAO.UserDAO;
import Entity.User;

import java.time.LocalDate;

public class Main {
    public static void main(String[] args) {
        User user = new User();

        user.setNome("Isaque");
        user.setCpf("077.612.071-94");
        user.setDataNascimento(LocalDate.of(1999, 07, 11));
        user.setTelefone("+55 (61) 99999-9999");

        new UserDAO().cadastrarUser(user);
    }
}
