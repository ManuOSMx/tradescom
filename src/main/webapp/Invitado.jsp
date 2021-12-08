<%@page import="ipn.escom.manejo.IntercambioDTO"%>
<%@page import="ipn.escom.acceso.IntercambioDAO"%>
<%@page import="ipn.escom.acceso.PersonaDAO"%>
<%@page import="ipn.escom.manejo.PersonaDTO"%>
<%@page import="ipn.escom.acceso.ParticipanteDAO"%>
<%@page import="ipn.escom.manejo.ParticipanteDTO"%>
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
        String correo, pass;
        correo = request.getParameter("email");
        pass = request.getParameter("password");
        PersonaDAO daoPer = new PersonaDAO();
        PersonaDTO dtoPer = new PersonaDTO();
        dtoPer.getEntidad().setCorreo(correo);
        dtoPer.getEntidad().setPassword(pass);
        dtoPer = daoPer.read(dtoPer);
        int id1, idUser, idAmix, idinter;
        //Recupero idPersona de Persona
        id1 = dtoPer.getEntidad().getIdUser();
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
        <h1 class="text-center">Intercambios</h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col">
                <section class="team-boxed"></section>
                <section class="projects-horizontal">
                    <div class="container">
                        <div class="intro">
                            <h2 class="text-center">Participas en estos intercambios</h2>
                        </div>
                        <%
                            AmigoDAO amix = new AmigoDAO();
                            AmigoDTO amixDTO = new AmigoDTO();
                            //Busco en Amigo el idPersona en idUser2
                            amixDTO.getEntidad().setIdUser2(id1);
                            List lista = amix.readFriends3(amixDTO);
                        %>
			<a href="friends.jsp?email=<%=correo%>&password=<%=pass%>"> </a>
                        <a href="dashboard.jsp?email=<%=correo%>&password=<%=pass%>" class="btn btn-warning">Regresar</a>
                        <%
                            if (lista != null) {
                                    for (int i = 0; i < lista.size(); i++) {
                                        AmigoDTO cat = (AmigoDTO) lista.get(i);
                                        idUser = 0;
                                        idAmix = 0;
                                        //Recuper idUSer1 e idAmigo
                                        idUser = cat.getEntidad().getIdUser1();
                                        idAmix = cat.getEntidad().getIdAmigo();
                                        //Buscamos idAmigo en participante
                                        ParticipanteDAO parti = new ParticipanteDAO();
                                        ParticipanteDTO partiDTO = new ParticipanteDTO();
                                        partiDTO.getEntidad().setIdAmigo(idAmix);
                                        List lista2 = parti.search2(partiDTO);
                                        if (lista2 != null) {
                                            for (int j = 0; j < lista2.size(); j++) {
                                                ParticipanteDTO cat2 = (ParticipanteDTO) lista2.get(j);
                                                idinter = 0;
                                                //Recuperar el idinter de participante
                                                idinter = cat2.getEntidad().getIdInter();
                                                //Buscamos el idinter en Intercambio
                                                IntercambioDAO inter = new IntercambioDAO();
                                                IntercambioDTO interDTO = new IntercambioDTO();
                                                interDTO.getEntidad().setIdInter(idinter);
                                                List lista3 = inter.readOne3(interDTO);
                                                for (int k = 0; k < lista3.size(); k++) {
                                                    IntercambioDTO cat3 = (IntercambioDTO) lista3.get(k);

                        %>
                        <div class="row projects">
                            <div class="col-sm-6 item">
                                <div class="row">
                                    <div class="col">
                                        <h3 class="name" >Intercambio: <%=cat3.getEntidad().getIdInter()%></h3>
                                        <ol class="description">
                                            <li>Tema 1: <%=cat3.getEntidad().getTema_1()%></li>
                                            <li>Tema 2: <%=cat3.getEntidad().getTema_2()%></li>
                                            <li>Tema 3: <%=cat3.getEntidad().getTema_3()%></li>
                                            <li>Costo: $<%=cat3.getEntidad().getValor_Max()%></li>
                                            <li>Fecha de Intercambio: <%=cat3.getEntidad().getFecha_Inter()%></li>
                                        </ol>
                                        <a href="EstadoInv.jsp?email=<%=correo%>&password=<%=pass%>&idinter=<%=cat3.getEntidad().getIdInter()%>">
                                            <button class="btn btn-primary" type="button">Ver</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                                            }
                                        }
                                    }
                                }
                            }
                        %>
                </section>
            </div>
        </div>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/Animated-Pretty-Product-List-v12.js"></script>
</body>

</html>
