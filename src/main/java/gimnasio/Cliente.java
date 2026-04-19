package gimnasio;

public class Cliente {
    int id;
    String nombre;
    String apellido;
    String telefono;
    String mensualidad;

    public Cliente() {}

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getApellido() { return apellido; }
    public void setApellido(String apellido) { this.apellido = apellido; }
    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }
    public String getMensualidad() { return mensualidad; }
    public void setMensualidad(String mensualidad) { this.mensualidad = mensualidad; }
}