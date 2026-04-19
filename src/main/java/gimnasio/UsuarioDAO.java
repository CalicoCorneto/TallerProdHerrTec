package gimnasio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public Usuario validar(String user, String pass) {
        Usuario u = null;
        String sql = "select * from usuario where User=? and Pass=?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gimnasio_db", "root", "");
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                u = new Usuario();
                u.setUser(rs.getString("User"));
                u.setPass(rs.getString("Pass"));
                u.setNombre(rs.getString("Nombre"));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error en DAO: " + e.getMessage());
        }
        return u;
    }
}