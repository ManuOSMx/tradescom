package ipn.escom.entidades;

public class Persona {
    private int idUser;
    private String Nombre;
    private String Alias;
    private String Correo;
    private String Password;

    public Persona() {
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getAlias() {
        return Alias;
    }

    public void setAlias(String Alias) {
        this.Alias = Alias;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }
}
