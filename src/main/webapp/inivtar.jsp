<%@page import="ipn.escom.manejo.ParticipanteDTO"%>
<%@page import="ipn.escom.acceso.ParticipanteDAO"%>
<%@page import="java.util.List"%>
<%@page import="ipn.escom.acceso.AmigoDAO"%>
<%@page import="ipn.escom.manejo.AmigoDTO"%>
<%@page import="ipn.escom.manejo.PersonaDTO"%>
<%@page import="ipn.escom.acceso.PersonaDAO"%>
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
    <div class="container">
        <h1 class="text-center">Invitar</h1>
    </div>
    <div class="container">
        <div class="row register-form">
            <div class="col-md-8 offset-md-2">
                <%
                    ParticipanteDAO pardao = new ParticipanteDAO();
                    ParticipanteDTO pardto = new ParticipanteDTO();
                    pardto.getEntidad().setIdInter(Integer.parseInt(request.getParameter("idinter")));
                    List lista2 = pardao.invited(pardto);
                    AmigoDTO dto = new AmigoDTO();
                    AmigoDAO dao = new AmigoDAO();
                    dto.getEntidad().setIdUser1(dto1.getEntidad().getIdUser());
                    List lista = dao.readFriends(dto);
                %>
                <form class="custom-form" method="get" action="invitacionRes.jsp">
                    <div style="visibility: hidden" class="row form-group">
                        <div class="col-sm-6 input-column"><input class="form-control" type="text" name="password" id="password" value="<%=pass%>"></div>
                    </div>
                    <select class="form-select form-select-sm" name="amistadnombre" id="amistadnombre" required="required">
                        <option selected>Ver opciones de amigos</option>
                        <%
                        if (lista != null || lista.equals(lista2)) {
                            for (int i = 0; i < lista.size(); i++) {
                                AmigoDTO cat = (AmigoDTO) lista.get(i);                                   
                                
                        %>
                        <option value="<%=cat.getEntidad().getNombre() %>"><%=cat.getEntidad().getNombre() %></option>
                        <%
                                }
                            } else {
                        %>
                        <option>No hay amigos></option>
                        <%
                            }
                        %>
                    </select>
                    
                    <div style="visibility: hidden" class="row form-group">
                        <div class="col-sm-6 input-column"><input class="form-control" type="text" name="email" id="email" value="<%=correo%>"></div>
                    </div>
                    <div style="visibility: hidden" class="row form-group">
                        <div class="col-sm-6 input-column"><input class="form-control" type="text" name="idinter" id="idinter" value="<%=request.getParameter("idinter")%>"></div>
                    </div>
                    <button class="btn btn-light submit-button">Agregar</button>
                </form>
            </div>
        </div>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/Animated-Pretty-Product-List-v12.js"></script>
</body>

</html>
