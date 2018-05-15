<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Culture="es-MX" UICulture="es" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/ >
    <title>Sistema de Gestión Interna para Divisiónes [SGID] - TESCI</title>

    <script src="JScript/jquery-3.3.1.min.js"></script>
    <script src="JScript/jquery-ui.min.js"></script>
    <script src="JScript/js.cookie.js"></script>
    
    <link href="Css/normalize.css" rel="stylesheet" />
    <link href="Css/default.css" rel="stylesheet" />
    <link href="Css/jquery-ui.min.css" rel="stylesheet" />
    <link href="Css/animate.css" rel="stylesheet" />
    <link href="Css/wickedcss.min.css" rel="stylesheet" />
    <link href="Css/hover.css" rel="stylesheet" />
    
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet">
   
    <script type="text/javascript" charset="utf-8">

        function btnLogin(e) {
            onEntCli(e, function(){
                var user = $("#txtUser").val();
                var pass = $("#txtPass").val();
                $.ajax({
                    type: 'POST',
                    url: 'Default.aspx/peticionLogin',
                    data: "{'user': '" + user + "', 'pass': '" + pass + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (data) {
                        if (data.d.length > 0) {
                                switch(data.d){
                                    case '1':
                                        window.location = 'jefatura.aspx';
                                        break;
                                    case '2':
                                        window.location = 'docentes.aspx';
                                        break;
                                    case '3':
                                        window.location = 'alumnos.aspx';
                                        break;
                                    default:
                                        alert(data.d);
                                        break;
                                }
                        }
                        else {
                            alert('D: ERROR DE CONEXION CON LA BASE DE DATOS, CONSULTE AL ADMINISTRADOR');
                        }
                    },
                    failure: function (response) {
                        alert('D: ERROR DE CONEXION CON LA BASE DE DATOS, CONSULTE AL ADMINISTRADOR');
                    }
                });
            });
        }

        $(document).ready(function () {
            // INTRODUCIR CODIGO DE INICIALIZACIÓN DEL SISTEMA FRONT
            CopyRightYear("footer p");
        });

        function CopyRightYear(element) {
            var y = new Date();
            $(element).append(' ' + y.getFullYear());
        }

        function onEntCli(e, callback) {
            /* ----- CONTROLA Y EJECUTA SI EL EVENTO SE REALIZA POR UN CLICK O POR UN KEYPRESS ENTER -----*/
            if (e) {
                if (e.keyCode == 13) {
                    F();
                    return true;
                }
            }
            else {
                F();
            }

            /* ----- FUNCION A EJECUTAR -----*/
            function F() {
                if (callback) {
                    callback();
                }
            }
        } 
        
        

    </script>

</head>
<body>
    <form id="form1" runat="server">        
        <header>
            <div class="headerSEP delay_05s">
                <section class="logoSEP_ logoSEP_1 delay_05s"></section>
                <section class="logoSEP_ logoSEP_2 delay_05s">
                    <p>
                        TECNOLÓGICO NACIONÁL DE MÉXICO <br>
                        <strong>TECNOLÓGICO DE ESTUDIOS SUPERIORES DE CUAUTITLÁN IZCALLI</strong>
                    </p>
                </section>
                <section class="logoSEP_ logoSEP_3 delay_05s"></section>
            </div>
        </header>
        <main>
            <div>
                <ul>
                    <li>
                        <p>Sistema de Gestión Interna de Divisiónes</p>
                    </li>
                    <li>
                        <input type="text" placeholder="usuario" id="txtUser" tabindex="1">
                    </li>
                    <li>
                        <input type="password" placeholder="contraseña" id="txtPass" onkeypress="return btnLogin(event);" tabindex="2">
                    </li>
                    <li>
                        <span onclick="btnLogin();" onkeypress="return btnLogin(event);" tabindex="3"><p>Entrar</p></span>
                    </li>
                    <li>
                        <p tabindex="4">Haz olvidado tu contraseña?</p>
                    </li>
                </ul>
            </div>
        </main>
        <footer><p>Tecnológico de Estudios Superiores de Cuautitlán Izcalli | Todos los derechos reservados.</p></footer>
    </form>
</body>
</html>

