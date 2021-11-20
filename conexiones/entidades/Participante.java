package conexiones.entidades;

public class Participante {
    private int idInvitado;
    private String Invitacion_Aceptada;
    private String Invitacion_Negada;
    private int idAmigo;
    private int idInter;

    public Participante() {
    }

    public int getIdInvitado() {
        return idInvitado;
    }

    public void setIdInvitado(int idInvitado) {
        this.idInvitado = idInvitado;
    }

    public String getInvitacion_Aceptada() {
        return Invitacion_Aceptada;
    }

    public void setInvitacion_Aceptada(String Invitacion_Aceptada) {
        this.Invitacion_Aceptada = Invitacion_Aceptada;
    }

    public String getInvitacion_Negada() {
        return Invitacion_Negada;
    }

    public void setInvitacion_Negada(String Invitacion_Negada) {
        this.Invitacion_Negada = Invitacion_Negada;
    }

    public int getIdAmigo() {
        return idAmigo;
    }

    public void setIdAmigo(int idAmigo) {
        this.idAmigo = idAmigo;
    }

    public int getIdInter() {
        return idInter;
    }

    public void setIdInter(int idInter) {
        this.idInter = idInter;
    }
}
