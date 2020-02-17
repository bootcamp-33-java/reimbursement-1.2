<%-- 
    Document   : vehicle
    Created on : 15-Feb-2020, 17:26:15
    Author     : FIKRI-PC
--%>

<%@page import="models.Employee"%>
<%@page import="models.Vehicle"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS CDN -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <!-- Our Custom CSS -->
        <link rel="stylesheet" href="css/style3.css">
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

        <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>


        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#d_table').DataTable();
            });
        </script>
        <title>JSP Page</title>
    </head>

    <% if (session.getAttribute("vehicles") == null || session.getAttribute("employees") == null) {
            response.sendRedirect("vehicle");

        } else {
            List<Vehicle> vehiclees = (List<Vehicle>) session.getAttribute("vehicles");
            Vehicle vehicle = (Vehicle) session.getAttribute("vehicle");
    %>



    <body>        

        <br>
        <br>
        <br>
        <br>

        <div class="container col-sm-10">
            <!--Trigger/tombol moedal insert-->
            <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#insertModal" >
                Insert Data
            </button>
        </div>
        <br>

        <div class="container col-sm-10">

            <table id="d_table" class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>NO</th>
                        <th>PLAT NUMBER</th>
                        <th>STNK OWNER</th>
                        <th>STNK PHOTO</th>
                        <th>VEHICLE TYPE</th>
                        <th>ACTION</th>
                    </tr>
                </thead>
                <tbody>
                    <% int i = 1;
                        for (Vehicle v : vehiclees) {%>
                    <tr>
                        <td><%= i++%></td>
                        <td><%= v.getId()%></td>
                        <td><%= v.getStnkOwner()%></td>
                        <td><%= v.getPhotoStnk()%></td>
                        <td><%= v.getVehicleType()%></td>
                        <td>
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#updateModal<%
                                out.print(v.getId());
                                    %>"><i class="fas fa-edit"></i></button>
                            <a href="vehicle?action=delete&id=<%=v.getId()%>" ><button type="button" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></button></a>

                            <form action="vehicle" method="POST">
                                <div class="modal fade" id="updateModal<%
                                    out.print(v.getId());
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
                                                            <th>ID</th>
                                                            <th><input type="text" readonly="readonly" name="id" value="<% out.print(v.getId()); %>"  /></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>STNK Owner</td>
                                                            <td><input type="text" name="owner" value="<% out.print(v.getStnkOwner()); %>" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td>PHOTO STNK</td>
                                                            <td><input type="email" name="stnk" value="<% out.print(v.getPhotoStnk()); %>" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Vehicle Type</td>
                                                            <td><input type="text" name="type" value="<% out.print(v.getVehicleType()); %>" /></td>
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
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <form action="vehicle" method="POST">

                <!--Membuat class MODAL INSERT-->
                <div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                    <tbody>
                                        <tr>
                                            <th>PLAT NUMBER</th>
                                            <th><input type="text" name="id" value="" /></th>
                                        </tr>
                                        </thead>
                                    <tbody>
                                        <tr>
                                            <td>STNK Owner</td>
                                            <td><input type="text" name="owner" value="" /></td>
                                        </tr>
                                        <tr>
                                            <td>PHOTO STNK</td>
                                            <td>
                                                <input type = "file" name = "stnk" size = "50" />
                                                <br>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Vehicle Type</td>
                                            <td><input type="radio" id="motorcycle" name="type" value="motorcycle">
                                                <label for="motorcycle">Motorcycle</label>
                                                <input type="radio" id="car" name="type" value="car">
                                                <label for="car">Car</label></td>
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


        </div>

        <!-- script sidebar -->
        <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
        <!-- script sidebar -->

        <!--        <script type="text/javascript">
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
                </script>-->

        <footer id="footer" class="footer">
            <div class="footer-copyright text-center py-3">© 2020 Copyright:
                <a href="https://www.instagram.com/agungld_/?hl=dongaagung_"> AgungLD</a>
            </div>
        </footer>


    </body>

    <% }
        session.removeAttribute("employee");

    %>



</html>
