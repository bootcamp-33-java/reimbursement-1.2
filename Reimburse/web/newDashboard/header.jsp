<%-- 
    Document   : header
    Created on : Feb 16, 2020, 12:48:55 PM
    Author     : Insane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


    <!-- Navbar -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-light purple-gradient-rgba scrolling-navbar">
        <div class="container-fluid">

            <!-- Collapse -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Links -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">

                <!-- Left -->
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="hoverable text-light nav-link waves-effect" href="home.jsp">Home
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="hoverable text-light nav-link waves-effect" href="reimburse.jsp" target="_blank">Reimburse</a>
                    </li>
                    <li class="nav-item">
                        <a class="hoverable text-light nav-link waves-effect" href="pic.jsp" target="_blank">Approval PIC</a>
                    </li>
                    <li class="nav-item">
                        <a class="hoverable text-light nav-link waves-effect" href="manager.jsp" target="_blank">Approval Manager</a>
                    </li>
                    <li class="nav-item">
                        <a class="hoverable text-light nav-link waves-effect" href="vehicle.jsp" target="_blank">Vehicle Data</a>
                    </li>
                </ul>

                <!-- Right -->
                <ul class="navbar-nav nav-flex-icons">
                    
                    <li class="nav-item">
                        <a href="https://github.com/mdbootstrap/bootstrap-material-design" class="nav-link border border-light rounded waves-effect"
                           target="_blank">
                            <i class="fa fa-github mr-2"></i>Logout
                        </a>
                    </li>
                </ul>

            </div>

        </div>
    </nav>
    <!-- Navbar -->

    <!-- Sidebar -->
    <div class="sidebar-fixed purple-gradient-rgba position-fixed">

        <a href="home.jsp" class="logo-wrapper waves-effect">
            <img src="dist/iniParking.png"  class="img-fluid" style="width:100%;height:100%" alt="">
        </a>

        <div class="list-group list-group-flush">
            <a href="http://localhost:8084/Reimburse/register" class="hoverable list-group-item active waves-effect">
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
                <i class="fa fa-money mr-3"></i>Approval Manager</a>
        </div>

    </div>
    <!-- Sidebar -->


</html>
