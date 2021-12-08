package ipn.escom.acceso;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ipn.escom.manejo.PersonaDTO;

public class PersonaDAO {
    // Los datos que el usuario metera sera reemplazados por ?
    // Manejarlo como un arreglo indice 1 e indice 2
    private static final String SQL_INSERT = "insert into Persona (Nombre, Alias, Correo, Password) values (?, ?, ?, ?)";
    private static final String SQL_READ = "select idUser, Nombre, Alias, Correo, Password from Persona where Correo = ? and Password=?";
    private static final String SQL_READ_ALL = "select idUser, Nombre, Alias, Correo, Password from Persona";
    private static final String SQL_SEARCH = "select idUser, Nombre, Alias, Correo, Password from Persona where Nombre = ? and Correo=?";
    private static final String SQL_SEARCH2 = "select idUser, Nombre, Alias, Correo, Password from Persona where idUser = ?";

    // Para ocupar esta variable importamos java.sql.Connection
    private Connection conexion;

    private void conectar() {
        String user = "kffltzjijmhwtr";
        String pwd = "064aee87e361825d06ea479c8d30fea296d0893295b6012bc6ddcc3bef311584";
        String url = "jdbc:postgresql://ec2-52-207-47-210.compute-1.amazonaws.com:5432/dblnkkkpm8onbq"; // ?sslmode=require
        String pgDriver = "org.postgresql.Driver";
        try {
            Class.forName(pgDriver);
            conexion = DriverManager.getConnection(url, user, pwd);
            // Solo trabjamos con 2 excepciones:
            // -Que no encuentre el paquete de pgDriver
            // -Algun dato esta mal y no puede
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void create(PersonaDTO dto) throws SQLException {
        // A partir de aqui ya conectamos con el manejor de datos
        conectar();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_INSERT);
            // EL primer argumento hace referencia al nombre de la categoria
            ps.setString(1, dto.getEntidad().getNombre());
            ps.setString(2, dto.getEntidad().getAlias());
            ps.setString(3, dto.getEntidad().getCorreo());
            ps.setString(4, dto.getEntidad().getPassword());
            // Como son consultas de actualizacion se pone
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }
    
    public PersonaDTO search(PersonaDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareStatement(SQL_SEARCH);
            ps.setString(1, dto.getEntidad().getNombre());
            ps.setString(2, dto.getEntidad().getCorreo());
            // Es una consulta de seleccion
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return (PersonaDTO) resultados.get(0);
            } else {
                return null;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }
    
    public PersonaDTO search2(PersonaDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareStatement(SQL_SEARCH2);
            ps.setInt(1, dto.getEntidad().getIdUser());
            // Es una consulta de seleccion
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return (PersonaDTO) resultados.get(0);
            } else {
                return null;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    public PersonaDTO read(PersonaDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareStatement(SQL_READ);
            ps.setString(1, dto.getEntidad().getCorreo());
            ps.setString(2, dto.getEntidad().getPassword());
            // Es una consulta de seleccion
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return (PersonaDTO) resultados.get(0);
            } else {
                return null;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    public List readAll() throws SQLException {
        conectar();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareStatement(SQL_READ_ALL);
            // Es una consulta de seleccion
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return resultados;
            } else {
                return null;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    private List obtenerResultados(ResultSet rs) throws SQLException {
        List resultados = new ArrayList();
        while (rs.next()) {
            PersonaDTO dto = new PersonaDTO();
            dto.getEntidad().setIdUser(rs.getInt("idUser"));
            dto.getEntidad().setNombre(rs.getString("Nombre"));
            dto.getEntidad().setAlias(rs.getString("Alias"));
            dto.getEntidad().setCorreo(rs.getString("Correo"));
            dto.getEntidad().setPassword(rs.getString("Password"));
            resultados.add(dto);
        }
        return resultados;
    }
}