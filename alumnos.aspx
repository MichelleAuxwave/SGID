<%@ Page Language="C#" AutoEventWireup="true" CodeFile="alumnos.aspx.cs" Inherits="alumnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ALUMNOS</title>
    <script src="JScript/jquery-3.3.1.min.js"></script>
    <script src="JScript/jquery-ui.min.js"></script>

    <script>
        var IDoMATRICULA = function () {
            var tmp = null;
            $.ajax({
                async: false,
                type: 'POST',
                url: 'alumnos.aspx/getIDoMatricula',
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data) {
                    tmp = data.d;
                },
                failure: function (response) {
                    tmp = null;
                    window.location = 'Default.aspx';
                }
            });
            return tmp;
        }();

        function autenticar(callback) {
            $.ajax({
                type: 'POST',
                url: 'alumnos.aspx/getIDoMatricula',
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data) {
                    if (data.d != null || data.d != 'null') {
                        if (callback) { callback(); }
                    }
                    else {
                        alert("POR FAVOR, VUELVE A INICIAR SESION.");
                        window.location = 'Default.aspx';
                    };
                },
                failure: function (response) {
                    alert("POR FAVOR, VUELVE A INICIAR SESION.");
                    window.location = 'Default.aspx';
                },
                error: function (result) {
                    alert("POR FAVOR, VUELVE A INICIAR SESION.");
                    window.location = 'Default.aspx';
                }
            });
        }

        function btnLogout() {
            $.ajax({
                type: 'POST',
                url: 'alumnos.aspx/logout',
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data) {
                    alert('SESION TERMINADA');
                    window.location = 'Default.aspx';
                },
                failure: function (response) {
                    alert('SESION TERMINADA CON ERRORORES');
                    window.location = 'Default.aspx';
                }
            });
        }

        $(document).ready(function () {
            if (IDoMATRICULA == null) { alert("VUELVE A INICIAR SESION"); window.location = 'Default.aspx'; } else {
                // INTRODUCIR CODIGO DE INICIALIZACIÓN DEL SISTEMA FRONT

            }
        });

        function accion1() {
            autenticar(function () {
                // LO QUE SE QUIERA PONER EN ESTA FUNCIÓN
            });
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span onclick="btnLogout();">Salir</span>
            <span onclick="accion1();">Accion 1</span>
        </div>
    </form>
</body>
</html>
