package conexiones.manejo;

import java.io.Serializable;

import conexiones.entidades.Intercambio;

public class IntercambioDTO implements Serializable {
    private Intercambio entidad;

    public IntercambioDTO() {
        entidad = new Intercambio();
    }

    public Intercambio getEntidad() {
        return entidad;
    }

    public void setEntidad(Intercambio entidad) {
        this.entidad = entidad;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("idInter : ").append(getEntidad().getIdInter()).append("\n");
        sb.append("Tema_1 : ").append(getEntidad().getTema_1()).append("\n");
        sb.append("Tema_2 : ").append(getEntidad().getTema_2()).append("\n");
        sb.append("Tema_3 : ").append(getEntidad().getTema_3()).append("\n");
        sb.append("Valor_Max : ").append(getEntidad().getValor_Max()).append("\n");
        sb.append("Fecha_Limi : ").append(getEntidad().getFecha_Limi()).append("\n");
        sb.append("Fecha_Inter : ").append(getEntidad().getFecha_Inter()).append("\n");
        sb.append("Comentaros : ").append(getEntidad().getComentaros()).append("\n");
        sb.append("idUser  : ").append(getEntidad().getIdUser()).append("\n");
        return sb.toString();
    }
}
