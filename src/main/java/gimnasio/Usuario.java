package gimnasio;

public class Usuario {
    int id;
    String user;
    String pass;
    String nombre;

    // Constructor vacío
    public Usuario() {}

    // Getters y Setters        
    public String getUser() { return user; }
    public void setUser(String user) { this.user = user; }
    public String getPass() { return pass; }
    public void setPass(String pass) { this.pass = pass; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
}