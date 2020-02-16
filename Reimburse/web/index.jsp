<%-- 
    Document   : index
    Created on : Feb 14, 2020, 10:41:05 AM
    Author     : Insane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page= "dashboard/head.jsp" />
    </head>
  
    <body class="hold-transition skin-blue sidebar-mini">

        <div class="wrapper">

            <!-- Main Header -->
            <header class="main-header">
                <jsp:include page= "dashboard/header.jsp" />
            </header>

            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <jsp:include page= "dashboard/sidebar.jsp" />
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Page Header
                        <small>Optional description</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
                        <li class="active">Here</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Your Page Content Here -->

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <!-- Main Footer -->
            <footer class="main-footer">
                <jsp:include page= "dashboard/footer.jsp" />
            </footer>

            
            <div class="control-sidebar-bg"></div>
        </div>

        <!-- jQuery 2.2.3 -->
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <!-- Material Design -->
        <script src="dist/js/material.min.js"></script>
        <script src="dist/js/ripples.min.js"></script>
        <script>
            $.material.init();
        </script>
        <!-- AdminLTE App -->
        <script src="dist/js/app.min.js"></script>

    </body>
</html>
