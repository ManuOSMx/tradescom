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
            <h1 class="text-center">T&eacute;rminos del intercambio</h1>
            <div class="row register-form">
                <div class="col-md-8 offset-md-2">
                    <form class="custom-form" method="get" action="Status.jsp">
                        <div class="row form-group">
                            <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Costo</label></div>
                            <div class="col-sm-6 input-column"><input class="form-control" type="text" name="costo" id="costo" required="required"></div>
                        </div>
                        <div class="row form-group">
                            <p class="Indication"> Selecciona los 3 temas para el intercambio </p>
                            <label class="col-form-label" for="name-input-field">Tema 1 de regalo</label>
                            <select class="form-select form-select-sm" name="Tema1" id="Tema1" required="required">
                                <option selected>Ver opciones de selecci&oacute;n</option>
                                <option value="Libros">Libros</option>
                                <option value="Juguetes">Juguetes</option>
                                <option value="Ropa">Ropa</option>
                                <option value="Gadgets">Gadgets</option>
                                <option value="Licores">Licores</option>
                                <option value="Accesorios">Accesorios</option>
                            </select>
                        </div>
                        <div class="row form-group">
                            <label class="col-form-label" for="name-input-field">Tema 2 de regalo</label>
                            <select class="form-select form-select-sm" name="Tema2" id="Tema2" required="required">
                                <option selected>Ver opciones de selecci&oacute;n</option>
                                <option value="Libros">Libros</option>
                                <option value="Juguetes">Juguetes</option>
                                <option value="Ropa">Ropa</option>
                                <option value="Gadgets">Gadgets</option>
                                <option value="Licores">Licores</option>
                                <option value="Accesorios">Accesorios</option>
                            </select>
                        </div>
                        <div class="row form-group">
                            <label class="col-form-label" for="name-input-field">Tema 3 de regalo</label>
                            <select class="form-select form-select-sm" name="Tema3" id="Tema3" required="required">
                                <option selected>Ver opciones de selecci&oacute;n</option>
                                <option value="Libros">Libros</option>
                                <option value="Juguetes">Juguetes</option>
                                <option value="Ropa">Ropa</option>
                                <option value="Gadgets">Gadgets</option>
                                <option value="Licores">Licores</option>
                                <option value="Accesorios">Accesorios</option>
                            </select>
                        </div>
                        <div style="visibility: hidden" class="row form-group">
                            <div class="col-sm-6 input-column"><input class="form-control" type="text" name="password" id="password" value="<%=pass%>"></div>
                        </div>
                        <div class="Fechas-Mensaje">
                            <div class="mb-3"><br>
                                <div class="form-group row">
                                    <label for="example-datetime-local-input" class="col-2 col-form-label">Fecha Registro</label>
                                    <div class="col-10">
                                        <input class="form-control" type="date" id="fechalimi" name="fechalimi" required="required">
                                    </div>
                                </div>
                                <br>
                                <div class="form-group row">
                                    <label for="example-datetime-local-input" class="col-2 col-form-label">Fecha Intercambio</label>
                                    <div class="col-10">
                                        <input class="form-control" type="date" id="fechainter" name="fechainter" required="required">
                                    </div>
                                </div>
                                <div style="visibility: hidden" class="row form-group">
                                    <div class="col-sm-6 input-column"><input class="form-control" type="text" name="email" id="email" value="<%=correo%>"></div>
                                </div>
                                <br><br><label for="exampleFormControlTextarea1" class="form-label">¿Cual es tu deseo navideño?</label>
                                <textarea class="form-control" id="comentario" name="comentario" rows="4" placeholder="Escribe un mensaje para que lo puedan leer los participantes" required="required"></textarea>
                            </div>
                        </div>
                        <button class="btn btn-warning">Guardar</button>
                    </form>
                </div>
            </div>
        </div>
        
        <div class="costo-prefencias">
            
        
        <div class="controls">
            <div class="boton" align="center"> 
                <a href="dashboard.jsp?email=<%=correo%>&password=<%=pass%>"><button type="button" class="btn btn-warning">  Regresar  </button>
            </div>
        </div>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/Animated-Pretty-Product-List-v12.js"></script>
    </body>
</html>