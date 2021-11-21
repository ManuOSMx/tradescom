package conexiones.manejo;

import java.io.Serializable;

import conexiones.entidades.Participante;

public class ParticipanteDTO implements Serializable {
    private Participante entidad;

    public ParticipanteDTO() {
        entidad = new Participante();
    }

    public Participante getEntidad() {
        return entidad;
    }

    public void setEntidad(Participante entidad) {
        this.entidad = entidad;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("idInvitado  : ").append(getEntidad().getIdInvitado()).append("\n");
        sb.append("Invitacion_Aceptada  : ").append(getEntidad().getInvitacion_Aceptada()).append("\n");
        sb.append("Invitacion_Negada : ").append(getEntidad().getInvitacion_Negada()).append("\n");
        sb.append("idAmigo : ").append(getEntidad().getIdAmigo()).append("\n");
        sb.append("idInter: ").append(getEntidad().getIdInter()).append("\n");
        return sb.toString();
    }
}
