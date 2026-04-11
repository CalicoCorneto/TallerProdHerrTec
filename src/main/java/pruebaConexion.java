import utils.conexion;
import java.sql.Connection;

public class pruebaConexion {
    public static void main(String[] args) {
        Connection c = conexion.getConexion();
        if(c != null) {
            System.out.println("El Issue #1 y #2 están completos.");
            System.out.println("Java ya habla con MySQL.");
        }
    }
}