<%-- 
    Document   : headerHome
    Created on : 18-Feb-2020, 05:36:51
    Author     : FIKRI-PC
--%>


<!-- Sidebar -->
<div class="container"  ></div>

<nav class="navbar navbar-expand-lg bg-dark fixed-top"   >
    <style>

        body {
            font-family: "Lato", sans-serif;

        }

        .sidenav {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #373737;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

        .sidenav a {
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 20px;
            color: white;
            display: block;
            transition: 0.3s;
        }

        .sidenav a:hover {
            color: #62d542;
        }

        .sidenav .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }

        #main {
            transition: margin-left .5s;
            padding: 16px;
        }

        @media screen and (max-height: 450px) {
            .sidenav {padding-top: 15px;}
            .sidenav a {font-size: 18px;}
        }
        .navbar-brand{
            color: white;
        }
    </style>
    <body>

        <div id="mySidenav" class="sidenav" style="width: 200px" >
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
             <a  href="register.jsp">Register</a>
             <a  href="vehicle.jsp">Vehicle Data</a>
            <a  href="reimburse.jsp">Reimburse</a>
            <a  href="pic.jsp">PIC</a>
            <a  href="manager.jsp">MSFC</a>
            <a  href="history.jsp">History</a>
<!--            <a  href="role.jsp">Role</a>
            <a  href="site.jsp">Site</a>
            <a  href="status.jsp">Status</a>-->
        </div>

        <div id="main">

            <span style="font-size: 20px;cursor:pointer; color: whitesmoke" onclick="openNav()"> &#9776;</span>
        </div>

        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "250px";
                document.getElementById("main").style.marginLeft = "250px";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
                document.getElementById("main").style.marginLeft = "0";
            }
        </script>

        <a href="homepage.jsp" >
            <img src="dist/iniParking.png"  class="img-fluid" style="width:10%;height:8%" alt="">
        </a>
        <a class="navbar-brand" href="homepage.jsp">Home</a>
        <a class="navbar-brand" href="register.jsp">Register</a>
        <a class="navbar-brand" href="vehicle.jsp">Vehicle Data</a>
        <a class="navbar-brand" href="reimburse.jsp">Reimburse</a>
        <a class="navbar-brand" href="pic.jsp">PIC</a>
        <a class="navbar-brand" href="manager.jsp">MSFC</a>
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">

<!--                <li class="nav-item active">
                    <a class="nav-link" href="region.jsp">Home <span class="sr-only">(current)</span></a>
                </li>-->

                </li>
            </ul>
        </div>
</nav><!--

-->
</body>
<!--<div class="sidebar-fixed purple-gradient-rgba position-fixed" style="padding-right: 80%; padding-top: 46px">

        

        <div class="list-group list-group-flush">
            <a href="http://localhost:8084/Reimburse/register" class="hoverable  list-group-item list-group-item-action waves-effect">
                <i class="fa fa-pie-chart mr-3"></i>Register
            </a>
            <a href="http://localhost:8084/Reimburse/role" class="hoverable list-group-item list-group-item-action waves-effect">
                <i class="fa fa-user mr-3"></i>Role</a>
            <a href="vehicle.jsp" class="hoverable list-group-item list-group-item-action waves-effect">
                <i class="fa fa-table mr-3"></i>Vehicle Data</a>
            <a href="employeerole.jsp" class="hoverable list-group-item list-group-item-action waves-effect">
                <i class="fa fa-map mr-3"></i>Employee Role</a>
            <a href="reimburse.jsp" class="hoverable list-group-item list-group-item-action waves-effect">
                <i class="fa fa-money mr-3"></i>Reimburse</a>
            <a href="pic.jsp" class="hoverable list-group-item list-group-item-action waves-effect">
                <i class="fa fa-money mr-3"></i>Approval PIC</a>
            <a href="manager.jsp" class="hoverable list-group-item list-group-item-action waves-effect">
                <i class="fa fa-money mr-3"></i>Approval MSFC</a>
            <a href="history.jsp" class="hoverable list-group-item list-group-item-action waves-effect">
                <i class="fa fa-money mr-3"></i>History</a>
        </div>

    </div>-->
    <!-- Sidebar -->
