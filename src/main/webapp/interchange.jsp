<%@page import="ipn.escom.manejo.DarRecibirDTO"%>
<%@page import="ipn.escom.acceso.DarRecibirDAO"%>
<%@page import="ipn.escom.manejo.PersonaDTO"%>
<%@page import="ipn.escom.acceso.PersonaDAO"%>
<%@page import="java.util.List"%>
<%@page import="ipn.escom.manejo.ParticipanteDTO"%>
<%@page import="ipn.escom.acceso.ParticipanteDAO"%>
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
        int interc, id1, cantidad;
        interc = Integer.parseInt(request.getParameter("idinter"));
        correo = request.getParameter("email");
        pass = request.getParameter("password");
        PersonaDAO daoPer = new PersonaDAO();
        PersonaDTO dtoPer = new PersonaDTO();
        dtoPer.getEntidad().setCorreo(correo);
        dtoPer.getEntidad().setPassword(pass);
        dtoPer = daoPer.read(dtoPer);
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
        <h1 class="text-center">¡Intercambio iniciado!</h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 list-drink">
                <div class="list-drink-header d-flex"><i class="fa fa-star"></i>
                    <h3 class="mb-4">Participantes</h3>
                </div>
                <%
                    ParticipanteDAO pardao = new ParticipanteDAO();
                    ParticipanteDTO pardto = new ParticipanteDTO();
                    pardto.getEntidad().setIdInter(interc);
                    List lista = pardao.invited(pardto);
                    //Conseguir un número entero entre 0 y cantidad con 0 < cantidad y ambos incluídos, debemos usar esta fórmula
                    cantidad = lista.size()+1;
                    int[ ] participantes = new int[cantidad];
                    int[ ] participantes2 = new int[cantidad];
                    int num;
                    if(lista != null)
                    {
                        for (int i = 0; i < lista.size(); i++) {
                            ParticipanteDTO cat = (ParticipanteDTO) lista.get(i);
                            num = (int) cat.getEntidad().getIdAmigo();
                            if(num == id1){
                                num = num * 100;
                            }
                            participantes[i] = num;
                            participantes2[i] = num;
                            System.out.println("--------Participante: ");
                            System.out.println(num);
                %>
                <ul class="list-unstyled">
                    <li class="media mb-4"><a class="d-flex">
                            <div class="media-thumb me-3" style="background-image: url(https://bootdey.com/img/Content/avatar/avatar7.png);"></div>
                            <div class="media-body align-self-center">
                                <h6><%=cat.getEntidad().getNombre() %></h6>
                            </div>
                    </a></li>
                </ul>
                <%
                        }
                        //num = (int) dtoPer.getEntidad().getIdUser();
                        participantes[cantidad-1] = id1;
                        participantes2[cantidad-1] = id1;
                        System.out.println("--------Participante: ");
                        System.out.println(id1);
                    }
                %>
                <ul class="list-unstyled">
                    <li class="media mb-4"><a class="d-flex">
                            <div class="media-thumb me-3" style="background-image: url(https://bootdey.com/img/Content/avatar/avatar7.png);"></div>
                            <div class="media-body align-self-center">
                                
                                <h6><%=dtoPer.getEntidad().getNombre() %></h6>
                            </div>
                    </a></li>
                </ul>
            </div>
<!-- INICIA EL INTERCAMBIO DESDE AQUI -->
            <%
                int lugar, dd;
                DarRecibirDAO dando = new DarRecibirDAO();
                DarRecibirDTO recibo = new DarRecibirDTO();
                dd=0;
                if (cantidad > 1 || cantidad < 4){
                    int[ ] dar = new int[cantidad];
                    int[ ] recibir = new int[cantidad];
                    while (dd<cantidad){
                        //Un numero entre 0 y 4
                        lugar = (int) (Math.random()*cantidad);
                        if (participantes[lugar] != 0){
                            dar[dd]= participantes[lugar];
                            participantes[lugar] = 0;
                            System.out.println("Posicion dar:");
                            System.out.println(dd);
                            System.out.println("--------Numero:");
                            System.out.println(dar[dd]);
                            dd++;
                        }
                    }
                    dd=0;
                    while (dd<cantidad){
                        //Un numero entre 0 y 4
                        lugar = (int) (Math.random()*cantidad);
                        if (participantes2[lugar] != dar[dd] && participantes2[lugar] != 0){
                            recibir[dd]= participantes2[lugar];
                            participantes[lugar] = participantes2[lugar];
                            num = participantes2[lugar];
                            participantes2[lugar] = 0;
                            System.out.println("Posicion recibir:");
                            System.out.println(dd);
                            System.out.println("--------Numero:");
                            System.out.println(recibir[dd]);
                            recibo.getEntidad().setIdRecibir(num);
                            num = 0;
                            dd++;
                        }
                    }
                    recibo.getEntidad().setIdInter(interc);
                    for(int k=0; k<cantidad; k++){
                        num = dar[k];
                        recibo.getEntidad().setIdDar(num);
                        num =0;
                        num = recibir[k];
                        recibo.getEntidad().setIdRecibir(num);
                        dando.create(recibo);
                    }
                    %>
            <div class="col">
                <section class="team-boxed">
                    <div class="container">
                        <div class="intro">
                            <h2 class="text-center">Lista de intercambios</h2>
                        </div>
                        <%
                            
                        %>
                        <div class="row d-xl-flex justify-content-xl-center people">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Da</th>
                                        <th scope="col">Recibe</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <%
                                        for (int i = 0; i < cantidad; i++) {
                                    %>
                                    <tr>
                                        <th scope="row"><%=i%></th>
                                    <%
                                            if (dar[i] == id1){
                                    %>
                                        <td><%=dtoPer.getEntidad().getNombre()%></td>
                                    <%
                                            } else {
                                                for(int j=0; j < lista.size(); j++ ){
                                                    ParticipanteDTO cat2 = (ParticipanteDTO) lista.get(j);
                                                    if (dar[i] == cat2.getEntidad().getIdAmigo()){
                                    %>
                                                <td><%=cat2.getEntidad().getNombre()%></td>
                                    <%
                                                    } else if(dar[i]/100 == cat2.getEntidad().getIdAmigo()){
                                    %>
                                                        <td><%=cat2.getEntidad().getNombre()%></td>
                                    <%
                                                    }
                                                }
                                            }
                                    %>
                                        <td>
                                    <%
                                            if (recibir[i] == id1){
                                    %>
                                        <%=dtoPer.getEntidad().getNombre() %>
                                    <%
                                            } else {
                                                for(int j=0; j < lista.size(); j++ ){
                                                    ParticipanteDTO cat2 = (ParticipanteDTO) lista.get(j);
                                                    if (recibir[i] == cat2.getEntidad().getIdAmigo()){
                                    %>
                                                        <%=cat2.getEntidad().getNombre() %>
                                    <%
                                                    } else if(recibir[i]/100 == cat2.getEntidad().getIdAmigo()){
                                    %>
                                                        <%=cat2.getEntidad().getNombre()%>
                                    <%
                                                    }
                                                }
                                            }
                                    %>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>
            </div>
                    <%
                }
                //PARA INVITADOR IMPAR
                else{
                    %>
            <div class="container">
                <h1 class="text-center">El minimo de invitados es de 4</h1>
                <h2 class="text-center">Imposible crear intercambio</h2>
            </div>
                    <%
                }
            %>
            
        </div>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/Animated-Pretty-Product-List-v12.js"></script>
</body>

</html>