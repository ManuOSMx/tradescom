package ipn.escom.acceso;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ipn.escom.manejo.AmigoDTO;

public class AmigoDAO {
    // Los datos que el usuario metera sera reemplazados por ?
    // Manejarlo como un arreglo indice 1 e indice 2
    private static final String SQL_INSERT = "insert into Amigo (Nombre, Correo, idUser1, idUser2) values (?, ?, ?, ?)";
    private static final String SQL_READ = "select idAmigo, Nombre, Correo, idUser1, idUser2 from Amigo where idAmigo = ?";
    private static final String SQL_READ_ALL = "select idAmigo, Nombre, Correo, idUser1, idUser2 from Amigo";
    private static final String SQL_READ_FRIENDS = "select idAmigo, Nombre, Correo, idUser1, idUser2 from Amigo where idUser1 = ?";
    private static final String SQL_READ_FRIENDS2 = "select idAmigo, Nombre, Correo, idUser1, idUser2 from Amigo where idUser1 = ? and Nombre = ?";
    private static final String SQL_READ_FRIENDS3 = "select idAmigo, Nombre, Correo, idUser1, idUser2 from Amigo where idUser2 = ?";
    private static final String SQL_SEARCH = "select idAmigo, Nombre, Correo, idUser1, idUser2 from Amigo where idUser1 = ? and idUser2 = ?";

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

    public void create(AmigoDTO dto) throws SQLException {
        // A partir de aqui ya conectamos con el manejor de datos
        conectar();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_INSERT);
            // EL primer argumento hace referencia al nombre de la categoria
            ps.setString(1, dto.getEntidad().getNombre());
            ps.setString(2, dto.getEntidad().getCorreo());
            ps.setInt(3, dto.getEntidad().getIdUser1());
            ps.setInt(4, dto.getEntidad().getIdUser2());
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
    
    public AmigoDTO search(AmigoDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareStatement(SQL_SEARCH);
            ps.setInt(1, dto.getEntidad().getIdUser1());
            ps.setInt(2, dto.getEntidad().getIdUser2());
            // Es una consulta de seleccion
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return (AmigoDTO) resultados.get(0);
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

    public AmigoDTO read(AmigoDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareStatement(SQL_READ);
            ps.setInt(1, dto.getEntidad().getIdAmigo());
            // Es una consulta de seleccion
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return (AmigoDTO) resultados.get(0);
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
    
    public List readFriends(AmigoDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareStatement(SQL_READ_FRIENDS);
            ps.setInt(1, dto.getEntidad().getIdUser1());
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
    
    public AmigoDTO readFriends2(AmigoDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareStatement(SQL_READ_FRIENDS2);
            ps.setInt(1, dto.getEntidad().getIdUser1());
            ps.setString(2, dto.getEntidad().getNombre());
            // Es una consulta de seleccion
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return (AmigoDTO) resultados.get(0);
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
    
    public List readFriends3(AmigoDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareStatement(SQL_READ_FRIENDS3);
            ps.setInt(1, dto.getEntidad().getIdUser2());
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
            AmigoDTO dto = new AmigoDTO();
            dto.getEntidad().setIdAmigo(rs.getInt("idAmigo"));
            dto.getEntidad().setNombre(rs.getString("Nombre"));
            dto.getEntidad().setCorreo(rs.getString("Correo"));
            dto.getEntidad().setIdUser1(rs.getInt("idUser1"));
            dto.getEntidad().setIdUser2(rs.getInt("idUser2"));
            resultados.add(dto);
        }
        return resultados;
    }
}
