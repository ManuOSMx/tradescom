package ipn.escom.entidades;

public class Participante {
    private int idInvitado;
    private Boolean Invitacion_Aceptada;
    private Boolean Invitacion_Negada;
    private String nombre;
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

    public Boolean getInvitacion_Aceptada() {
        return Invitacion_Aceptada;
    }

    public void setInvitacion_Aceptada(Boolean Invitacion_Aceptada) {
        this.Invitacion_Aceptada = Invitacion_Aceptada;
    }

    public Boolean getInvitacion_Negada() {
        return Invitacion_Negada;
    }

    public void setInvitacion_Negada(Boolean Invitacion_Negada) {
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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}
