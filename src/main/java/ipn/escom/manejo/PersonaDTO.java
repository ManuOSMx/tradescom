package ipn.escom.manejo;

import java.io.Serializable;

import ipn.escom.entidades.Persona;

public class PersonaDTO implements Serializable {
    private Persona entidad;

    public PersonaDTO() {
        entidad = new Persona();
    }

    public Persona getEntidad() {
        return entidad;
    }

    public void setEntidad(Persona entidad) {
        this.entidad = entidad;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("idUser : ").append(getEntidad().getIdUser()).append("\n");
        sb.append("Nombre : ").append(getEntidad().getNombre()).append("\n");
        sb.append("Alias : ").append(getEntidad().getAlias()).append("\n");
        sb.append("Correo : ").append(getEntidad().getCorreo()).append("\n");
        sb.append("Password : ").append(getEntidad().getPassword()).append("\n");
        return sb.toString();
    }

}
