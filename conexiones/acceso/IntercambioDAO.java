package conexiones.acceso;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conexiones.manejo.IntercambioDTO;

public class IntercambioDAO {
    // Los datos que el usuario metera sera reemplazados por ?
    // Manejarlo como un arreglo indice 1 e indice 2
    private static final String SQL_INSERT = "insert into Intercambio (Tema_1, Tema_2, Tema_3, Valor_Max, Fecha_Limi, Fecha_Inter, Comentaros, idUser) values (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SQL_UPDATE = "update Intercambio set Tema_1=?, Tema_2=?, Tema_3=?, Valor_Max=?, Fecha_Limi=?, Fecha_Inter=?, Comentaros=?, idUser=? where idInter = ?";
    private static final String SQL_DELETE = "delete from Intercambio where idInter = ?";
    private static final String SQL_READ = "select idInter, Tema_1, Tema_2, Tema_3, Valor_Max, Fecha_Limi, Fecha_Inter, Comentaros, idUser from Intercambio where idInter = ?";
    private static final String SQL_READ_ALL = "select idInter, Tema_1, Tema_2, Tema_3, Valor_Max, Fecha_Limi, Fecha_Inter, Comentaros, idUser from Intercambio";

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

    public void create(IntercambioDTO dto) throws SQLException {
        // A partir de aqui ya conectamos con el manejor de datos
        conectar();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_INSERT);
            // EL primer argumento hace referencia al nombre de la categoria
            ps.setString(1, dto.getEntidad().getTema_1());
            ps.setString(2, dto.getEntidad().getTema_2());
            ps.setString(3, dto.getEntidad().getTema_3());
            ps.setFloat(4, dto.getEntidad().getValor_Max());
            ps.setDate(5, dto.getEntidad().getFecha_Limi());
            ps.setDate(6, dto.getEntidad().getFecha_Inter());
            ps.setString(7, dto.getEntidad().getComentaros());
            ps.setInt(8, dto.getEntidad().getIdUser());
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

    public void update(IntercambioDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_UPDATE);
            ps.setString(1, dto.getEntidad().getTema_1());
            ps.setString(2, dto.getEntidad().getTema_2());
            ps.setString(3, dto.getEntidad().getTema_3());
            ps.setFloat(4, dto.getEntidad().getValor_Max());
            ps.setDate(5, dto.getEntidad().getFecha_Limi());
            ps.setDate(6, dto.getEntidad().getFecha_Inter());
            ps.setString(7, dto.getEntidad().getComentaros());
            ps.setInt(8, dto.getEntidad().getIdUser());
            ps.setInt(9, dto.getEntidad().getIdInter());
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

    public void delete(IntercambioDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_DELETE);
            ps.setInt(1, dto.getEntidad().getIdInter());
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

    public IntercambioDTO read(IntercambioDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareStatement(SQL_READ);
            ps.setInt(1, dto.getEntidad().getIdInter());
            // Es una consulta de seleccion
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return (IntercambioDTO) resultados.get(0);
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
            IntercambioDTO dto = new IntercambioDTO();
            dto.getEntidad().setIdInter(rs.getInt("idInter"));
            dto.getEntidad().setTema_1(rs.getString("Tema_1"));
            dto.getEntidad().setTema_2(rs.getString("Tema_2"));
            dto.getEntidad().setTema_3(rs.getString("Tema_3"));
            dto.getEntidad().setValor_Max(rs.getFloat("Valor_Max"));
            dto.getEntidad().setFecha_Limi(rs.getDate("Fecha_Limi"));
            dto.getEntidad().setFecha_Inter(rs.getDate("Fecha_Inter"));
            dto.getEntidad().setComentaros(rs.getString("Comentaros"));
            dto.getEntidad().setIdUser(rs.getInt("idUser"));
            resultados.add(dto);
        }
        return resultados;
    }
}
