package conexiones.entidades;

import java.sql.Date;

public class Intercambio {
    private int idInter;
    private String Tema_1;
    private String Tema_2;
    private String Tema_3;
    private float Valor_Max;
    private Date Fecha_Limi;
    private Date Fecha_Inter;
    private String Comentaros;
    private int idUser;

    public Intercambio() {
    }

    public int getIdInter() {
        return idInter;
    }

    public void setIdInter(int idInter) {
        this.idInter = idInter;
    }

    public String getTema_1() {
        return Tema_1;
    }

    public void setTema_1(String Tema_1) {
        this.Tema_1 = Tema_1;
    }

    public String getTema_2() {
        return Tema_2;
    }

    public void setTema_2(String Tema_2) {
        this.Tema_2 = Tema_2;
    }

    public String getTema_3() {
        return Tema_3;
    }

    public void setTema_3(String Tema_3) {
        this.Tema_3 = Tema_3;
    }

    public float getValor_Max() {
        return Valor_Max;
    }

    public void setValor_Max(float Valor_Max) {
        this.Valor_Max = Valor_Max;
    }

    public Date getFecha_Limi() {
        return Fecha_Limi;
    }

    public void setFecha_Limi(Date Fecha_Limi) {
        this.Fecha_Limi = Fecha_Limi;
    }

    public Date getFecha_Inter() {
        return Fecha_Inter;
    }

    public void setFecha_Inter(Date Fecha_Inter) {
        this.Fecha_Inter = Fecha_Inter;
    }

    public String getComentaros() {
        return Comentaros;
    }

    public void setComentaros(String Comentaros) {
        this.Comentaros = Comentaros;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
}
