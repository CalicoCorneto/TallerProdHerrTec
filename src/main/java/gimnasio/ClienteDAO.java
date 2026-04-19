package gimnasio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List<Cliente> listar() {
        List<Cliente> lista = new ArrayList<>();
        String sql = "select * from cliente";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gimnasio_db", "root", "");
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                c.setApellido(rs.getString("apellido"));
                c.setTelefono(rs.getString("telefono"));
                c.setMensualidad(rs.getString("mensualidad"));
                lista.add(c);
            }
        } catch (Exception e) {
            System.err.println("Error listar clientes: " + e.getMessage());
        }
        return lista;
    }
        
    public void agregar(Cliente c) {
        String sql = "insert into cliente (nombre, apellido, telefono, mensualidad) values (?,?,?,?)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gimnasio_db", "root", "");
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getApellido());
            ps.setString(3, c.getTelefono());
            ps.setString(4, c.getMensualidad());
            ps.executeUpdate(); // Ejecuta el insert
        } catch (Exception e) {
            System.err.println("Error al agregar cliente: " + e.getMessage());
        }
    }
    
    public void eliminar(int id) {
        String sql = "delete from cliente where id=?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gimnasio_db", "root", "");
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error al eliminar cliente: " + e.getMessage());
        }
    }
        
    public Cliente buscar(int id) {
        Cliente c = new Cliente();
        String sql = "select * from cliente where id=?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gimnasio_db", "root", "");
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                c.setApellido(rs.getString("apellido"));
                c.setTelefono(rs.getString("telefono"));
                c.setMensualidad(rs.getString("mensualidad"));
            }
        } catch (Exception e) {
            System.err.println("Error al buscar cliente: " + e.getMessage());
        }
        return c;
    }
    
    public void actualizar(Cliente c) {
        String sql = "update cliente set nombre=?, apellido=?, telefono=?, mensualidad=? where id=?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gimnasio_db", "root", "");
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getApellido());
            ps.setString(3, c.getTelefono());
            ps.setString(4, c.getMensualidad());
            ps.setInt(5, c.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error al actualizar cliente: " + e.getMessage());
        }
    }
}