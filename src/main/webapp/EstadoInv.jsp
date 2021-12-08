<%@page import="ipn.escom.manejo.AmigoDTO"%>
<%@page import="ipn.escom.acceso.AmigoDAO"%>
<%@page import="ipn.escom.manejo.DarRecibirDTO"%>
<%@page import="ipn.escom.acceso.DarRecibirDAO"%>
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
            int interc;
            interc = Integer.parseInt(request.getParameter("idinter"));
            correo = request.getParameter("email");
            pass = request.getParameter("password");
            
            PersonaDAO daoPer = new PersonaDAO();
            PersonaDTO dtoPer = new PersonaDTO();
            dtoPer.getEntidad().setCorreo(correo);
            dtoPer.getEntidad().setPassword(pass);
            dtoPer = daoPer.read(dtoPer);
            int id1;
            id1 = dtoPer.getEntidad().getIdUser();
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
            <h1 class="text-center">Estado del intercambio</h1>
        </div>
        <%    
                       
            ParticipanteDAO pardao = new ParticipanteDAO();
            ParticipanteDTO pardto = new ParticipanteDTO();
            pardto.getEntidad().setIdInter(Integer.parseInt(request.getParameter("idinter")));
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
                            <h5 class="card-subtitle mb-2 text-muted"><%=request.getParameter("idinter") %></h5>
                            <h5 class="card-title">Te toca darle a:</h5>
                            <%
                                int id2, num2, num, num3;
                                num3=0;
                                num2=0;
                                id2=0;
                                String nombre;
                                DarRecibirDAO aux = new DarRecibirDAO();
                                DarRecibirDTO auxdto = new DarRecibirDTO();
                                IntercambioDAO inter = new IntercambioDAO();
                                IntercambioDTO interdto = new IntercambioDTO();
                                interdto.getEntidad().setIdInter(interc);
                                auxdto.getEntidad().setIdInter(interc);
                                auxdto = aux.readOne2(auxdto);
                                if(auxdto != null){
                                    interdto = inter.readOne4(interdto);
                                    id2 = interdto.getEntidad().getIdUser();
                                }
                                AmigoDAO amidao = new AmigoDAO();
                                AmigoDTO amidto = new AmigoDTO();
                                amidto.getEntidad().setIdUser1(id2);
                                amidto.getEntidad().setIdUser2(id1);
                                amidto = amidao.search(amidto);
                                
                                if(amidto != null && id2 == amidto.getEntidad().getIdAmigo()){
                                    num2 = amidto.getEntidad().getIdAmigo() * 100;
                                }
                                else if(amidto != null){
                                    num2 = amidto.getEntidad().getIdAmigo();
                                }
                                
                                
                                DarRecibirDAO sorpresa = new DarRecibirDAO();
                                DarRecibirDTO sorpresadto = new DarRecibirDTO();
                                sorpresadto.getEntidad().setIdDar(num2);
                                sorpresadto = sorpresa.readOne(sorpresadto);
                                if(sorpresadto==null){
                            %>
                            <h5 class="card-subtitle mb-2 text-muted">Aun no inicia el intercambio</h5>
                            <%
                                } else {
                                    System.out.println("--------idUser:");
                                    System.out.println(id2);
                                    if(sorpresadto.getEntidad().getIdRecibir() >= 100){
                                        num3 = sorpresadto.getEntidad().getIdRecibir() / 100;
                                        AmigoDAO amidao2 = new AmigoDAO();
                                        AmigoDTO amidto2 = new AmigoDTO();
                                        amidto2.getEntidad().setIdAmigo(num3);
                                        amidto2 = amidao2.read(amidto2);
                                        nombre = amidto2.getEntidad().getNombre();
                                    } else if(sorpresadto.getEntidad().getIdRecibir() == id2){
                                        System.out.println("--------idRecibir:");
                                        System.out.println(sorpresadto.getEntidad().getIdRecibir());
                                        PersonaDAO daoPer2 = new PersonaDAO();
                                        PersonaDTO dtoPer2 = new PersonaDTO();
                                        dtoPer2.getEntidad().setIdUser(id2);
                                        dtoPer2 = daoPer2.search2(dtoPer2);
                                        nombre = dtoPer2.getEntidad().getNombre();
                                        System.out.println(dtoPer2.getEntidad().getNombre());
                                    }else{
                                        num3 = sorpresadto.getEntidad().getIdRecibir();
                                        AmigoDAO amidao2 = new AmigoDAO();
                                        AmigoDTO amidto2 = new AmigoDTO();
                                        amidto2.getEntidad().setIdAmigo(num3);
                                        amidto2 = amidao2.read(amidto2);
                                        nombre = amidto2.getEntidad().getNombre();
                                    }
                                    
                            %>
                            <h5 class="card-subtitle mb-2 text-muted"><%=nombre %></h5>
                            <%  
                                }
                            %>
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
                                            <%
                                                if(lista != null)
                                                {
                                                    for (int i = 0; i < lista.size(); i++) {
                                                        ParticipanteDTO cat = (ParticipanteDTO) lista.get(i);
                                            %>
                                            <tr>
                                                <th scope="row"><%=i%></th>
                                                <td><%=cat.getEntidad().getNombre() %></td>
                                                <td>
                                                    <%
                                                        Boolean opc = cat.getEntidad().getInvitacion_Aceptada();
                                                        if (opc.equals(true)) {
                                                    %>
                                                        Aceptada
                                                    <%
                                                        } else {
                                                    %>
                                                        Rechazada
                                                    <% 
                                                        }
                                                        
                                                    %>
                                                </td>
                                            </tr>
                                            <%
                                                    }
                                                } else{
                                            %>
                                            <th scope="row">No hay invitados</th>    
                                            <%

                                                }
                                            %>
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

