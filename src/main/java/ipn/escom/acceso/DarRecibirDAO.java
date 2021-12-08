package ipn.escom.acceso;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ipn.escom.manejo.DarRecibirDTO;

public class DarRecibirDAO {
    // Los datos que el usuario metera sera reemplazados por ?
    // Manejarlo como un arreglo indice 1 e indice 2
    private static final String SQL_INSERT = "insert into DarRecibir (idDar, idRecibir, idInter) values (?, ?, ?)";
    private static final String SQL_READ = "select idRegalo, idDar, idRecibir, idInter from DarRecibir where idInter = ?";
    private static final String SQL_READ_ALL = "select idRegalo, idDar, idRecibir, idInter from DarRecibir";
    private static final String SQL_READ_ONE = "select idRegalo, idDar, idRecibir, idInter from DarRecibir where idDar = ?";

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

    public void create(DarRecibirDTO dto) throws SQLException {
        // A partir de aqui ya conectamos con el manejor de datos
        conectar();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_INSERT);
            // EL primer argumento hace referencia al nombre de la categoria
            ps.setInt(1, dto.getEntidad().getIdDar());
            ps.setInt(2, dto.getEntidad().getIdRecibir());
            ps.setInt(3, dto.getEntidad().getIdInter());
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

    public List read(DarRecibirDTO dto) throws SQLException {
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
    
    public DarRecibirDTO readOne(DarRecibirDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareStatement(SQL_READ_ONE);
            ps.setInt(1, dto.getEntidad().getIdDar());
            // Es una consulta de seleccion
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return (DarRecibirDTO) resultados.get(0);
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
    
    public DarRecibirDTO readOne2(DarRecibirDTO dto) throws SQLException {
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
                return (DarRecibirDTO) resultados.get(0);
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
            DarRecibirDTO dto = new DarRecibirDTO();
            dto.getEntidad().setIdRegalo(rs.getInt("idRegalo"));
            dto.getEntidad().setIdDar(rs.getInt("idDar"));
            dto.getEntidad().setIdRecibir(rs.getInt("idRecibir"));
            dto.getEntidad().setIdInter(rs.getInt("idInter"));
            resultados.add(dto);
        }
        return resultados;
    }
}
