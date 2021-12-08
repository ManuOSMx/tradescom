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
        PersonaDAO dao1 = new PersonaDAO();
        PersonaDTO dto1 = new PersonaDTO();
        String correo, pass;
        correo = request.getParameter("email");
        pass = request.getParameter("password");
        dto1.getEntidad().setCorreo(correo);
        dto1.getEntidad().setPassword(pass);
        dto1 = dao1.read(dto1);
        if (dto1 != null) {
    %>
    <nav class="navbar navbar-light navbar-expand-md navigation-clean-search">
        <div class="container"><a class="navbar-brand" href="index.html">TradESCOM</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse text-center" id="navcol-1">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="dashboard.jsp?email=<%=correo%>&password=<%=pass%>">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link active" href="friends.jsp?email=<%=correo%>&password=<%=pass%>">Mis amigos</a></li>
                    <li class="nav-item"><a class="nav-link" href="items.jsp?email=<%=correo%>&password=<%=pass%>">Nuevo Amigo</a></li>
                </ul><a class="btn btn-light action-button" role="button" href="Especificaciones.jsp?email=<%=correo%>&password=<%=pass%>">Crea un intercambio!</a>
            </div>
        </div>
    </nav>
    <div class="container">
        <h1 class="text-center">Lista de Amigos</h1><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@2.0.7/css/boxicons.min.css">
        <%
            AmigoDTO dto = new AmigoDTO();
            AmigoDAO dao = new AmigoDAO();
            dto.getEntidad().setIdUser1(dto1.getEntidad().getIdUser());
            List lista = dao.readFriends(dto);
            if(lista != null){
                for (int i = 0; i < lista.size(); i++) {
                    AmigoDTO cat = (AmigoDTO) lista.get(i);
            
            
        %>
        <div class="container" align="center">
            <div class="row row-cols-1 row-cols-lg-2 row-cols-xl-4">
                <div class="col">
                    <div class="card radius-15">
                        <div class="card-body text-center">
                            <div class="p-4 border radius-15">
                                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" width="110" height="110" class="rounded-circle shadow" alt="">
                                <h5 class="mb-0 mt-5"><%= cat.getEntidad().getNombre()%></h5>
                                <p class="mb-3"><%= cat.getEntidad().getCorreo()%></p>
                                <div class="list-inline contacts-social mt-3 mb-3"> <a href="javascript:;" class="list-inline-item bg-facebook text-white border-0"><i class="bx bxl-facebook"></i></a>
                                    <a href="javascript:;" class="list-inline-item bg-twitter text-white border-0"><i class="bx bxl-twitter"></i></a>
                                    <a href="javascript:;" class="list-inline-item bg-linkedin text-white border-0"><i class="bx bxl-linkedin"></i></a>
                                </div>
                                <div class="d-grid"> <a href="#" class="btn btn-outline-primary radius-15">Añadir al grupo</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
                    }
                }
                else {
        %>
                    <h2 class="text-center">No hay amigos</h2><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@2.0.7/css/boxicons.min.css">
        <%
                }
            }
            else {
        %>
        <div class='alert alert-danger alert-dismissible fade show' role='alert' align="center">
        <strong>Usuario No Encontrado</strong>
        </div>
        <%
            }
        %>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/Animated-Pretty-Product-List-v12.js"></script>
</body>

</html>