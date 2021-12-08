<%@page import="ipn.escom.manejo.ParticipanteDTO"%>
<%@page import="ipn.escom.acceso.ParticipanteDAO"%>
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
        String correo, pass, nombre;
        int inter;
        correo = request.getParameter("email");
        pass = request.getParameter("password");
        nombre = request.getParameter("amistadnombre");
        inter = Integer.parseInt(request.getParameter("idinter"));
    %>
    <nav class="navbar navbar-light navbar-expand-md navigation-clean-search">
        <div class="container"><a class="navbar-brand" href="index.html">TradESCOM</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse text-center" id="navcol-1">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="dashboard.jsp?email=<%=correo%>&password=<%=pass%>">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="friends.jsp?email=<%=correo%>&password=<%=pass%>">Mis amigos</a></li>
                    <li class="nav-item"><a class="nav-link" href="items.jsp?email=<%=correo%>&password=<%=pass%>">Nuevo Amigo</a></li>
                </ul><a class="btn btn-light action-button" role="button" href="Especificaciones.jsp?email=<%=correo%>&password=<%=pass%>">Crea un intercambio!</a>
            </div>
        </div>
    </nav>
    <%
        
        PersonaDAO dao1 = new PersonaDAO();
        PersonaDTO dto1 = new PersonaDTO();
        dto1.getEntidad().setCorreo(correo);
        dto1.getEntidad().setPassword(pass);
        dto1 = dao1.read(dto1);
        
        AmigoDAO amixdao1 = new AmigoDAO();
        AmigoDTO amixdto1 = new AmigoDTO();
        amixdto1.getEntidad().setIdUser1(dto1.getEntidad().getIdUser());
        amixdto1.getEntidad().setNombre(nombre);
        amixdto1 = amixdao1.readFriends2(amixdto1);
        
        ParticipanteDAO partdao = new ParticipanteDAO();
        ParticipanteDTO partdto = new ParticipanteDTO();
        partdto.getEntidad().setIdAmigo(amixdto1.getEntidad().getIdAmigo());
        partdto.getEntidad().setIdInter(inter);
        partdto = partdao.search(partdto);
        if (partdto != null){
    %>
    <div class='alert alert-danger alert-dismissible fade show' role='alert' align="center">
    <strong>Amigo Ya Invitado</strong>
    </div>
    <%
        }
        else {
        boolean ver, fal;
        ver = true;
        fal = false;
        ParticipanteDAO partdao2 = new ParticipanteDAO();
        ParticipanteDTO partdto2 = new ParticipanteDTO();
        partdto2.getEntidad().setInvitacion_Aceptada(ver);
        partdto2.getEntidad().setIdAmigo(amixdto1.getEntidad().getIdAmigo());
        partdto2.getEntidad().setIdInter(inter);
        partdto2.getEntidad().setInvitacion_Negada(fal);
        partdao2.create(partdto2);
    %>
    <div class='alert alert-success alert-dismissible fade show' role='alert' align="center">
    <strong>Registro Exitoso</strong>
    </div>
    <%
        }
    %>
    <div align="center">
        <a href="dashboard.jsp?email=<%=correo%>&password=<%=pass%>" class="btn btn-light submit-button">Regresar</a>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/Animated-Pretty-Product-List-v12.js"></script>
</body>

</html>
