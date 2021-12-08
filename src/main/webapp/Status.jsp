<%@page import="ipn.escom.acceso.ParticipanteDAO"%>
<%@page import="ipn.escom.manejo.ParticipanteDTO"%>
<%@page import="java.sql.Date"%>
<%@page import="ipn.escom.manejo.IntercambioDTO"%>
<%@page import="ipn.escom.acceso.IntercambioDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ipn.escom.acceso.PersonaDAO"%>
<%@page import="ipn.escom.manejo.PersonaDTO"%>
<%@page import="java.util.List"%>
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
            String correo, pass, tema1, tema2, tema3, comentarios, fecha, fecha2;
            float precio;
            correo = request.getParameter("email");
            pass = request.getParameter("password");
            
            PersonaDAO daoPer = new PersonaDAO();
            PersonaDTO dtoPer = new PersonaDTO();
            dtoPer.getEntidad().setCorreo(correo);
            dtoPer.getEntidad().setPassword(pass);
            dtoPer = daoPer.read(dtoPer);
            int id1;
            id1 = dtoPer.getEntidad().getIdUser();            
            
            tema1 = request.getParameter("Tema1");
            tema2 = request.getParameter("Tema2");
            tema3 = request.getParameter("Tema3");
            precio = Float.parseFloat(request.getParameter("costo"));
            fecha = request.getParameter("fechalimi");
            fecha2 = request.getParameter("fechainter");
            comentarios = request.getParameter("comentario");
            Date fechali = Date.valueOf(fecha);
            Date fechaint = Date.valueOf(fecha2);
            
            IntercambioDAO inter = new IntercambioDAO();
            IntercambioDTO interDTO = new IntercambioDTO();
            interDTO.getEntidad().setTema_1(tema1);
            interDTO.getEntidad().setTema_2(tema2);
            interDTO.getEntidad().setTema_3(tema3);
            interDTO.getEntidad().setValor_Max(precio);
            interDTO.getEntidad().setFecha_Limi(fechali);
            interDTO.getEntidad().setFecha_Inter(fechaint);
            interDTO.getEntidad().setComentaros(comentarios);
            interDTO.getEntidad().setIdUser(id1);
        %>
        <nav class="navbar navbar-light navbar-expand-md navigation-clean-search">
            <div class="container"><a class="navbar-brand" href="index.html">TradESCOM</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse text-center" id="navcol-1">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="dashboard.jsp?email=<%=correo%>&password=<%=pass%>">Dashboard</a></li>
                        <li class="nav-item"><a class="nav-link" href="friends.jsp?email=<%=correo%>&password=<%=pass%>">Mis amigos</a></li>
                        <li class="nav-item"><a class="nav-link" href="items.jsp?email=<%=correo%>&password=<%=pass%>">Nuevo Amigo</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <h1 class="text-center">Estatus del intercambio</h1>
        </div>
        <%
            inter.create(interDTO);
            
            interDTO = inter.read(interDTO);
            
            ParticipanteDAO pardao = new ParticipanteDAO();
            ParticipanteDTO pardto = new ParticipanteDTO();
            pardto.getEntidad().setIdInter(interDTO.getEntidad().getIdInter());
            List lista = pardao.invited(pardto);
        %>
        <section class="team-boxed"></section>
        <section class="projects-horizontal">
            <div class="container">
                <div class="intro">
                </div>
                <div class="tarjetas">
                    <div class="card" id="card1" >
                        <div class="card-body">
                            <h5 class="card-title">C&oacute;digo de invitaci&oacute;n</h5>
                            <h5 class="card-subtitle mb-2 text-muted"><%=interDTO.getEntidad().getIdInter() %></h5>
                        </div>
                    </div>
                    <div class="card" id="card2" >
                        <div class="card-body">
                            <h5 class="card-title">Lista de Invitados</h5>
                            <div class="table-responsive">

                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <%
                                                if(lista != null)
                                                {
                                                    for (int i = 0; i < lista.size(); i++) {
                                                        ParticipanteDTO cat = (ParticipanteDTO) lista.get(i);
                                            %>
                                            <th scope="row"><%=i%></th>
                                            <td><%=cat.getEntidad().getNombre() %></td>
                                            <td><%=cat.getEntidad().getInvitacion_Aceptada() %></td>
                                            <%
                                                    }
                                                } else{
                                            %>
                                            <th scope="row">No hay invitados</th>    
                                            <%

                                                }
                                            %>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div>

                </div>
                <div class="controls">
                    <div class="boton"> 
                        <a href="dashboard.jsp?email=<%=correo%>&password=<%=pass%>"><button type="button" class="btn btn-warning" id="medio">  Regresar </button></a>
                    </div>
                </div>
            </div>
        </section>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/Animated-Pretty-Product-List-v12.js"></script>
    </body>
</html>

<style>
                                    .container-md{
                                        color:white;
                                        text-align: center;
                                    }
                                    .Indication{
                                        color:white;
                                    }

                                    .form-label{
                                        color: white;
                                    }
                                    .card{
                                        background-color: #1A18C5;
                                    }
                                    .tarjetas{
                                        display: inline;
                                        position: relative;
                                        width: 100%;
                                    }
                                    .card-text{
                                        color: white;
                                    }
                                    .card-body{
                                        color: aliceblue;
                                    }
                                    #card1{
                                        display: relative;
                                        margin-top: 5%;
                                        margin-right: 3%;
                                        margin-left: 12%;
                                        float:left;
                                        width:40%;
                                    }
                                    #card1 button{
                                        margin-left: 35%;
                                        margin-top: 8%;
                                    }
                                    #card2{
                                        display: relative;
                                        margin-bottom: 1em;
                                        margin-right: 5%;
                                        float: right;
                                        width:28%;
                                        height: auto;
                                    }
                                    #principal{
                                        position: center;
                                        margin-bottom: 2em;
                                        text-align: center;
                                    }
                                    .card-title{
                                        color:white;
                                        text-align: center;
                                        font-size: 2em;
                                    }
                                    .card-subtitle{
                                        color: white;
                                        text-align: center;
                                        font-size: 1.5em;
                                    }


                                    .controls{
                                        position:right;
                                        padding:4em;
                                        display: relative;
                                        margin-top: 10em;
                                        margin-left: auto;
                                    }

                                    button{
                                        margin-left:1em;
                                    }
                                    .boton{
                                        display: inline;
                                        position: relative;
                                        margin-left: 6em;
                                        margin-bottom: 6em;
                                    }
                                    #der{
                                        float:right;
                                        margin-right:18%;
                                    }
                                    #medio{
                                        margin-left: 6.3em;
                                    }
                                    #izq{
                                        margin:auto;
                                    }
                                    td{
                                        color: white;
                                    }
                                    th{
                                        color: white;
                                    }
</style>