<%@page import="ipn.escom.acceso.PersonaDAO"%>
<%@page import="ipn.escom.manejo.PersonaDTO"%>
<%@page import="java.util.List"%>
<%@page import="ipn.escom.acceso.AmigoDAO"%>
<%@page import="ipn.escom.manejo.AmigoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>tradESCOM</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/Animated-Pretty-Product-List-v12.css">
    <link rel="stylesheet" href="assets/css/Color-Contact-List.css">
    <link rel="stylesheet" href="assets/css/Highlight-Phone.css">
    <link rel="stylesheet" href="assets/css/HTML-layout-with-an-unordered-list.css">
    <link rel="stylesheet" href="assets/css/Light-Contact-List.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean-1.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="assets/css/Notes-Dashboard.css">
    <link rel="stylesheet" href="assets/css/Pretty-Registration-Form.css">
    <link rel="stylesheet" href="assets/css/Pretty-User-List.css">
    <link rel="stylesheet" href="assets/css/Projects-Horizontal.css">
    <link rel="stylesheet" href="assets/css/Registration-Form-with-Photo.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/Team-Boxed.css">
</head>

<body>
    <%
        String pas1, pas2;
        pas1 = request.getParameter("password");
        pas2 = request.getParameter("repassword");
        PersonaDAO dao1 = new PersonaDAO();
        PersonaDTO dto1 = new PersonaDTO();
        dto1.getEntidad().setCorreo(request.getParameter("email"));
        dto1.getEntidad().setPassword(request.getParameter("password"));
        dto1 = dao1.read(dto1);
        if (dto1 != null){
    %>
    <div class='alert alert-danger alert-dismissible fade show' role='alert' align="center">
    <strong>Usuario Ya Registrado</strong>
    </div>
    <%
        }
        else if(pas1.equals(pas2)){
        PersonaDAO dao = new PersonaDAO();
        PersonaDTO dto = new PersonaDTO();
        dto.getEntidad().setNombre(request.getParameter("nombre"));
        dto.getEntidad().setAlias(request.getParameter("alias"));
        dto.getEntidad().setCorreo(request.getParameter("email"));
        dto.getEntidad().setPassword(request.getParameter("password"));
        dao.create(dto);
    %>
    <div class='alert alert-success alert-dismissible fade show' role='alert' align="center">
    <strong>Registro Exitoso</strong>
    </div>
    <div align="center">
        <a href="index.html" class="btn btn-light submit-button">Iniciar Sesion</a>
    </div>
    <%
        }
        else {
    %>
    <div class='alert alert-danger alert-dismissible fade show' role='alert' align="center">
    <strong>Las contraseñas no coinciden</strong>
    </div>
    <%
        }
    %>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/Animated-Pretty-Product-List-v12.js"></script>
</body>

</html>