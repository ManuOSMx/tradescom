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
                    <li class="nav-item"><a class="nav-link active" href="items.jsp?email=<%=correo%>&password=<%=pass%>">Nuevo Amigo</a></li>
                </ul><a class="btn btn-light action-button" role="button" href="Especificaciones.jsp?email=<%=correo%>&password=<%=pass%>">Crea un intercambio!</a>
            </div>
        </div>
    </nav>
    <div class="container">
        <h1 class="text-center">Agregar Amigo</h1>
    </div>
    <div class="container">
        <div class="row register-form">
            <div class="col-md-8 offset-md-2">
                <form class="custom-form" method="get" action="agregarAmigo.jsp">
                    <div style="visibility: hidden" class="row form-group">
                        <div class="col-sm-6 input-column"><input class="form-control" type="text" name="password" id="password" value="<%=pass%>"></div>
                    </div>
                    <div class="row form-group">
                        <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Nombre </label></div>
                        <div class="col-sm-6 input-column"><input class="form-control" type="text" name="nombreAmigo" id="nombreAmigo" required="required"></div>
                    </div>
                    <div class="row form-group">
                        <div class="col-sm-4 label-column"><label class="col-form-label" for="email-input-field">Email </label></div>
                        <div class="col-sm-6 input-column"><input class="form-control" type="email" name="emailAmigo" id="emailAmigo" required="required"></div>
                    </div>
                    <div style="visibility: hidden" class="row form-group">
                        <div class="col-sm-6 input-column"><input class="form-control" type="text" name="email" id="email" value="<%=correo%>"></div>
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