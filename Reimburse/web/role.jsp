<%-- 
    Document   : role
    Created on : Jan 30, 2020, 10:00:01 PM
    Author     : Insane
--%>

<%@page import="models.Role"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS CDN -->

        <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

        <%@include file="/newDashboard/head.jsp" %>
    </head>

    <% if (session.getAttribute("roles") == null) {
            response.sendRedirect("role");

        } else {
            List<Role> roless = (List<Role>) session.getAttribute("roles");

    %>




    <body class="grey lighten-3">        
        <header>
            <%@include file="/newDashboard/header.jsp" %>
        </header>
        <br>
        <br>
        <br>
        <!--FORM SEARCH-->
        <div style="padding-left: 188px" class="container col-sm-10">
            <form action="role" method="GET" class="form-inline">
                <div class="form-group">
                    <!--Trigger/tombol modal insert-->
                    <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal" >
                        Insert Data
                    </button>
                </div>
            </form>
        </div>
        <br>

        <div style="padding-left: 11%; margin-right: 5%" class="container col-sm-10">

            <table id="d_table" class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>NO</th>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>ACTION</th>
                    </tr>
                </thead>
                <tbody>
                    <% int i = 1;
                        for (Role r : roless) {%>
                    <tr>
                        <td><%= i++%></td>
                        <td><%= r.getId()%></td>
                        <td><%= r.getName()%></td>
                        <td>
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#updateModal<%
                                out.print(r.getId());
                                out.print(r.getName());

                                    %>"><i class="fas fa-edit"></i></button>
                            <a href="role?action=delete&id=<%=r.getId()%>&name=<%=r.getName()%>" ><button type="button" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></button></a>

                            <form action="role" method="POST">
                                <div class="modal fade" id="updateModal<%
                                    out.print(r.getId());
                                    out.print(r.getName());

                                     %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Update</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>

                                            <div class="modal-body">
                                                <table border="0" >
                                                    <thead>
                                                        <tr>
                                                            <th>Role ID</th>
                                                            <th><input type="text" readonly="" name="id" value="<% out.print(r.getId()); %>" /></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Name</td>
                                                            <td><input type="text" name="roleName" value="<% out.print(r.getName()); %>" /></td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <!--Button Update pada modal Update-->
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Update </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <form action="role" method="POST">

                                <!--Membuat class MODAL INSERT-->
                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Insert</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>

                                            <div class="modal-body">

                                                <!--Isi method Insert Modal-->
                                                <table border="0" >
                                                    <thead>
                                                        <tr>
                                                            <th>Site ID</th>
                                                            <th><input type="text" name="id" value="" /></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Site Name</td>
                                                            <td><input type="text" name="roleName" value="" /></td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <!--Button pada modal Insert-->
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Save </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                        </td>

                    </tr>
                    <% }%>
                </tbody>

            </table>



        </div>

        <!-- script sidebar -->
        <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
        <!-- script sidebar -->

        <script type="text/javascript">
            $(document).ready(function () {
                $("#sidebar").mCustomScrollbar({
                    theme: "minimal"
                });

                $('#dismiss, .overlay').on('click', function () {
                    $('#sidebar').removeClass('active');
                    $('.overlay').removeClass('active');
                });

                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').addClass('active');
                    $('.overlay').addClass('active');
                    $('.collapse.in').toggleClass('in');
                    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
                });
            });
        </script>

        <footer id="footer" class="footer">
            <div class="footer-copyright text-center py-3">© 2020 Copyright:
                <a href="https://www.instagram.com/agungld_/?hl=dongaagung_"> AgungLD</a>
            </div>
        </footer>


    </body>

    <% }
        session.removeAttribute("roles");

    %>



</html>
