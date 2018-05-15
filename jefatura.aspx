<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jefatura.aspx.cs" Inherits="jefatura" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>JEFATURA DE DIVISIÓN</title>
    <script src="JScript/jquery-3.3.1.min.js"></script>
    <script src="JScript/jquery-ui.min.js"></script>
    <script src="JScript/js.cookie.js"></script>
    <script src="JScript/Chart.js"></script>
    
    <script src="Scripts/graphs1.js"></script>
    
    <link href="Css/normalize.css" rel="stylesheet" />
    <link href="Css/jefatura.css" rel="stylesheet" />
    <link href="Css/jquery-ui.min.css" rel="stylesheet" />
    <link href="Css/animate.css" rel="stylesheet" />
    <link href="Css/wickedcss.min.css" rel="stylesheet" />
    <link href="Css/hover.css" rel="stylesheet" />
    <link href="Icons/style.css" rel="stylesheet" />
    
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet">
    <script>
        var IDoMATRICULA = function () {
            var tmp = null;
            $.ajax({
                async: false,
                type: 'POST',
                url: 'jefatura.aspx/getIDoMatricula',
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

        function autenticar (callback) {
            $.ajax({
                type: 'POST',
                url: 'jefatura.aspx/getIDoMatricula',
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

        function btnLogout(e) {
            onEntCli(e, function(){
                $.ajax({
                    type: 'POST',
                    url: 'jefatura.aspx/logout',
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
            });
        }

        $(document).ready(function () {
            CopyRightYear("footer p");
            if (IDoMATRICULA == null) { alert("VUELVE A INICIAR SESION"); window.location = 'Default.aspx'; } else {
                // INTRODUCIR CODIGO DE INICIALIZACIÓN DEL SISTEMA FRONT
                
                llamarGraficas();
            }
        });
        
        function llamarGraficas(){
            dashboardGraphic_1("dashboardGraphic_1");
            dashboardGraphic_2("dashboardGraphic_2");
            dashboardGraphic_3("dashboardGraphic_3");
            dashboardGraphic_4("dashboardGraphic_4");
            dashboardGraphic_5("dashboardGraphic_5");
        }

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

        /* ========================================== */
        
        /*
        var _toggleMenu = 0;
        function toggleMenu(){
            if(_toggleMenu == 0){ 
                $('#btnMenu').css({ animation: "_toggleMenu_1 0.6s forwards cubic-bezier(0.68, -0.55, 0.265, 1.55)" });
                $('.menu').css({ display: 'block', visibility: 'visible' });
                $('.menu').animate({ opacity: 1 }, 200, 'swing', function(){
                    _toggleMenu = 1;
                });
             }
            else{
                $('#btnMenu').css({ animation: "_toggleMenu_0 0.6s forwards cubic-bezier(0.68, -0.55, 0.265, 1.55)" });
                $('.menu').animate({ opacity: 0 }, 200, 'swing', function(){
                    $('.menu').css({ display: 'none', visibility: 'hidden' });
                    _toggleMenu = 0;
                });
             }
        }
        */


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
            <div class="toolbar">
                <ul>
                    <li onclick="toggleMenu();" id="btnMenu"><p class="icon-dots-horizontal-triple"></p></li>
                    <li><p>JEFATURA DE DIVISIÓN&nbsp;<strong>INGENIERÍA INFORMÁTICA</strong></p></li>
                    <li>
                        <ul>
                            <li><p>USUARIO DE EJEMPLO 1</p></li>
                            <li><p>JEFE DE CARRERA</p></li>
                            <li><p>Ultimo Inicio de Sesión:&nbsp;&nbsp;|&nbsp;01/01/2018 00:00:00 am</p></li>
                            <li><p>Ultimo Cierre de Sesión:&nbsp;|&nbsp;01/01/2018 00:00:00 am</p></li>
                        </ul>
                    </li>
                    <li onclick="btnLogout();" onkeypress="return btnLogout(event);"><p class="icon-stand-by"></p></li>
                </ul>
            </div>
            <div class="menu">
                <section id="opti">
                    <ul>
                        <li>Opción 1</li>
                        <li>Opción 2</li>
                        <li>Opción 3</li>
                        <li>Opción 4</li>
                        <li>Opción 5</li>
                        <li>Opción 6</li>
                        <li>Opción 7</li>
                        <li>Opción 8</li>
                    </ul>
                </section>
                <section id="browser">
                    <div id="buscador-browser">
                        <article>
                            <span><p class="icon-user-solid-circle"></p></span>
                            <input type="text" id="browser-txt" placeholder="Buscar por nombre, apellido, numero de control, grupo o división">
                        </article>
                        <article>
                            <span>
                                <p>Buscar</p>
                            </span>
                        </article>
                    </div>
                    <div id="paginador-browser">
                        <ul>
                            <li class="icon-cheveron-outline-left"></li>
                            <li>&lt;</li>
                            <li>---</li>
                            <li>&gt;</li>
                            <li class="icon-cheveron-outline-right"></li>
                        </ul>
                    </div>
                    <div id="nomenclatura-browser"></div>
                    <div id="resultados-browser"></div>
                </section>
            </div>
            <div class="contain">
                <div id="dashboard">
                    <div>
                       <section><p>SEXUALIDAD ESTUDIANTIL</p></section>
                       <section>
                            <canvas id="dashboardGraphic_1"></canvas>
                       </section>
                    </div>
                    <div>
                       <section><p>ESTUDIANTES INGRESADOS</p></section>
                       <section>
                            <canvas id="dashboardGraphic_2"></canvas>
                       </section>
                    </div>
                    <div>
                        <div>
                            <section>
                                <p>ESTUDIANTES ACTIVOS</p>
                            </section>
                            <section>
                                <p>1234<br>Estudiantes</p>
                            </section>
                        </div>
                        <div>
                            <section>
                                <p>INGLES LIBERADO</p>
                            </section>
                            <section>
                                <p>1234<br>Estudiantes</p>
                                <p>98%</p>
                            </section>
                        </div>
                        <div>
                            <section>
                                <p>ACTIVIDADES COMPLEMENTARIAS LIBERADAS</p>
                            </section>
                            <section>
                                <p>1234 <br>Estudiantes</p>
                                <p>98%</p>
                            </section>
                        </div>
                        <div>
                            <section>
                                <p>SERVICIO SOCIAL LIBERADO</p>
                            </section>
                            <section>
                                <p>1234<br>Estudiantes</p>
                                <p>98%</p>
                            </section>
                        </div>
                        <div>
                            <section>
                                <p>RESIDENCIAS LIBERADAS</p>
                            </section>
                            <section>
                                <p>1234<br>Estudiantes</p>
                                <p>98%</p>
                            </section>
                        </div>
                        <div>
                            <section>
                                <p>CONVALIDACIÓNES</p>
                            </section>
                            <section>
                                <p>1234<br>Estudiantes</p>
                                <p>98%</p>
                            </section>
                        </div>
                    </div>
                    <div>
                       <section><p>ESTUDIANTES EGRESADOS</p></section>
                       <section>
                            <canvas id="dashboardGraphic_3"></canvas>
                       </section>
                    </div>
                    <div>
                       <section><p>ESTUDIANTES DESERTORES</p></section>
                       <section>
                            <canvas id="dashboardGraphic_4"></canvas>
                       </section>
                    </div>
                    <div>
                       <section><p>RENDIMIENTO ESTUDIANTIL</p></section>
                       <section>
                            <canvas id="dashboardGraphic_5"></canvas>
                       </section>
                    </div>
                </div>
            </div>
        </main>
        <footer><p>Tecnológico de Estudios Superiores de Cuautitlán Izcalli | Todos los derechos reservados.</p></footer>
    </form>
    
</body>
</html>
