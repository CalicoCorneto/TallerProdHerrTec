package gimnasio;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;

@Controller
public class LoginController {
    UsuarioDAO udao = new UsuarioDAO();

    @GetMapping("/login")
    public String mostrarLogin() {
        return "login"; 
    }

    @PostMapping("/Validar")
    public String validar(@RequestParam("txtuser") String user, 
                         @RequestParam("txtpass") String pass, 
                         HttpSession session, 
                         Model model) {
        
        Usuario u = udao.validar(user, pass);
        
        if (u != null) {
            session.setAttribute("usuario", u);
            return "redirect:/panel"; 
        } else {
            return "login"; 
        }
    }
    
    @GetMapping("/Salir")
    public String salir(HttpSession session) {
        session.invalidate();
        return "redirect:/login"; 
    }
    
    @GetMapping("/panel")
    public String panelPrincipal(HttpSession session, Model model) {       
        
        if (session.getAttribute("usuario") == null) {
            return "redirect:/login";
        }
                
        ClienteDAO cdao = new ClienteDAO();
        List<Cliente> clientes = cdao.listar();       
 
        model.addAttribute("listaClientes", clientes);
        
        return "principal"; 
    }
        
    @PostMapping("/AgregarCliente")
    public String agregarCliente(@RequestParam("nombre") String nombre,
                                 @RequestParam("apellido") String apellido,
                                 @RequestParam("telefono") String telefono,
                                 @RequestParam("mensualidad") String mensualidad,
                                 RedirectAttributes flash) {
        
        Cliente c = new Cliente();
        c.setNombre(nombre);
        c.setApellido(apellido);
        c.setTelefono(telefono);
        c.setMensualidad(mensualidad);
        
        ClienteDAO cdao = new ClienteDAO();
        cdao.agregar(c);
                
        flash.addFlashAttribute("mensaje", "Cliente registrado con éxito");
        flash.addFlashAttribute("color", "success");
        
        return "redirect:/panel"; 
    }
        
    @GetMapping("/Editar")
    public String editar(@RequestParam("id") int id, Model model) {
        ClienteDAO cdao = new ClienteDAO();
        Cliente c = cdao.buscar(id); 
        model.addAttribute("cliente", c);
        return "editar";
    }
    
    @PostMapping("/Actualizar")
    public String actualizar(@RequestParam("id") int id,
                             @RequestParam("nombre") String nombre,
                             @RequestParam("apellido") String apellido,
                             @RequestParam("telefono") String telefono,
                             @RequestParam("mensualidad") String mensualidad,
                             RedirectAttributes flash) {
        
        Cliente c = new Cliente();
        c.setId(id);
        c.setNombre(nombre);
        c.setApellido(apellido);
        c.setTelefono(telefono);
        c.setMensualidad(mensualidad);
        
        ClienteDAO cdao = new ClienteDAO();
        cdao.actualizar(c); 
                
        flash.addFlashAttribute("mensaje", "Datos actualizados correctamente.");
        flash.addFlashAttribute("color", "primary");
        
        return "redirect:/panel"; 
    }
        
    @GetMapping("/EliminarCliente")
    public String eliminarCliente(@RequestParam("id") int id, RedirectAttributes flash) {
        ClienteDAO cdao = new ClienteDAO();
        cdao.eliminar(id);
        
        flash.addFlashAttribute("mensaje", "Cliente eliminado del sistema.");
        flash.addFlashAttribute("color", "danger");
        
        return "redirect:/panel";
    }
}