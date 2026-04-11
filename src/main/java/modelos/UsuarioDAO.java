package modelos;

import utils.conexion;
import java.sql.*;

public class UsuarioDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public Usuario validar(String user, String pass) {
        Usuario u = null;
        String sql = "SELECT * FROM usuarios WHERE username=? AND password=?";
        try {
            con = conexion.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                u = new Usuario();
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            System.out.println("Error al validar: " + e.getMessage());
        }
        return u;
    }
}