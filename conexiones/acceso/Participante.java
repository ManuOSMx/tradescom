package conexiones.acceso;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conexiones.manejo.ParticipanteDTO;

public class Participante {
    // Los datos que el usuario metera sera reemplazados por ?
    // Manejarlo como un arreglo indice 1 e indice 2
    private static final String SQL_INSERT = "insert into Participante (Invitacion_Aceptada, Invitacion_Negada, idAmigo, idInter) values (?, ?, ?, ?)";
    private static final String SQL_UPDATE = "update Participante set Invitacion_Aceptada=?, Invitacion_Negada=?, idAmigo=?, idInter=? where idInvitado = ?";
    private static final String SQL_DELETE = "delete from Participante where idInvitado = ?";
    private static final String SQL_READ = "select idInvitado, Invitacion_Aceptada, Invitacion_Negada, idAmigo, idInter from Participante where idInvitado = ?";
    private static final String SQL_READ_ALL = "select idInvitado, Invitacion_Aceptada, Invitacion_Negada, idAmigo, idInter from Participante";

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

    public void create(ParticipanteDTO dto) throws SQLException {
        // A partir de aqui ya conectamos con el manejor de datos
        conectar();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_INSERT);
            // EL primer argumento hace referencia al nombre de la categoria
            ps.setString(1, dto.getEntidad().getInvitacion_Aceptada());
            ps.setString(2, dto.getEntidad().getInvitacion_Negada());
            ps.setInt(3, dto.getEntidad().getIdAmigo());
            ps.setInt(4, dto.getEntidad().getIdInter());
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

    public void update(ParticipanteDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_UPDATE);
            ps.setString(1, dto.getEntidad().getInvitacion_Aceptada());
            ps.setString(2, dto.getEntidad().getInvitacion_Negada());
            ps.setInt(3, dto.getEntidad().getIdAmigo());
            ps.setInt(4, dto.getEntidad().getIdInter());
            ps.setInt(5, dto.getEntidad().getIdInvitado());
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

    public void delete(ParticipanteDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_DELETE);
            ps.setInt(1, dto.getEntidad().getIdInvitado());
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

    public ParticipanteDTO read(ParticipanteDTO dto) throws SQLException {
        conectar();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conexion.prepareStatement(SQL_READ);
            ps.setInt(1, dto.getEntidad().getIdInvitado());
            // Es una consulta de seleccion
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return (ParticipanteDTO) resultados.get(0);
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
            ParticipanteDTO dto = new ParticipanteDTO();
            dto.getEntidad().setIdInvitado(rs.getInt("idInvitado"));
            dto.getEntidad().setInvitacion_Aceptada(rs.getString("Invitacion_Aceptada"));
            dto.getEntidad().setInvitacion_Negada(rs.getString("Invitacion_Negada"));
            dto.getEntidad().setIdAmigo(rs.getInt("idAmigo"));
            dto.getEntidad().setIdInter(rs.getInt("idInter"));
            resultados.add(dto);
        }
        return resultados;
    }
}
