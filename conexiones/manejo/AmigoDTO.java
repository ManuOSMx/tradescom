package conexiones.manejo;

import java.io.Serializable;

import conexiones.entidades.Amigo;

public class AmigoDTO implements Serializable {
    private Amigo entidad;

    public AmigoDTO() {
        entidad = new Amigo();
    }

    public Amigo getEntidad() {
        return entidad;
    }

    public void setEntidad(Amigo entidad) {
        this.entidad = entidad;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("idAmigo : ").append(getEntidad().getIdAmigo()).append("\n");
        sb.append("Nombre: ").append(getEntidad().getNombre()).append("\n");
        sb.append("Correo : ").append(getEntidad().getCorreo()).append("\n");
        sb.append("idUser1 : ").append(getEntidad().getIdUser1()).append("\n");
        sb.append("idUser2: ").append(getEntidad().getIdUser2()).append("\n");
        return sb.toString();
    }
}
