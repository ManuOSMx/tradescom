package ipn.escom.manejo;

import ipn.escom.entidades.Correo;
import java.io.Serializable;

public class CorreoDTO{
    private Correo entidad;
    
    public CorreoDTO() {
        entidad = new Correo();
    }
    
    public Correo getEntidad() {
        return entidad;
    }

    public void setEntidad(Correo entidad) {
        this.entidad = entidad;
    }
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("remitente: ").append(getEntidad().getRemitente()).append("\n");
        sb.append("receptor : ").append(getEntidad().getReceptor()).append("\n");
        sb.append("contra : ").append(getEntidad().getContra()).append("\n");
        return sb.toString();
    }
}
