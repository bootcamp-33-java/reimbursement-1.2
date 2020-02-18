<%-- 
    Document   : headerHome
    Created on : 18-Feb-2020, 05:36:51
    Author     : FIKRI-PC
--%>

 <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <a href="home.jsp" class="logo-wrapper waves-effect">
            <img src="dist/iniParking.png"  class="img-fluid" style="width:15%;height:8%" alt="">
        </a>
    <div class="container">
      
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="homepage.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="vehicle.jsp">Vehicle Data</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="pic.jsp">PIC Approval</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="manager.jsp">MSFC Approval</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
<!-- Sidebar -->
<div class="sidebar-fixed purple-gradient-rgba position-fixed" style="padding-right: 80%; padding-top: 46px">

        

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
        </div>

    </div>
    <!-- Sidebar -->
