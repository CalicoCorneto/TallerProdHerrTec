import org.junit.Test;
import static org.junit.Assert.assertEquals;
import java.time.LocalDate;

public class RenovacionTest {

    @Test
    public void testRenovacionMensualidad() {        
        LocalDate fechaPago = LocalDate.of(2026, 1, 1);            
        LocalDate fechaVencimiento = fechaPago.plusDays(30);                
        LocalDate fechaEsperada = LocalDate.of(2026, 1, 31);
                
        assertEquals(fechaEsperada, fechaVencimiento);
    }
}