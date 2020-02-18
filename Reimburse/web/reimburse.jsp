<%-- 
    Document   : employee
    Created on : Jan 30, 2020, 10:00:01 PM
    Author     : Insane
--%>

<%@page import="models.Vehicle"%>
<%@page import="models.ParkingLot"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.Ticket"%>
<%@page import="models.Employee"%>
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

    <% if (session.getAttribute("reimburses") == null) {
            response.sendRedirect("reimburse");

        } else {
            List<Ticket> tickets = (List<Ticket>) session.getAttribute("reimburses");
            List<ParkingLot> parklot = (List<ParkingLot>) session.getAttribute("parklots");
            List<Vehicle> vehicles = (List<Vehicle>) session.getAttribute("vehicles");
    %>



    <body>        

        <br>
        <br>
        <br>
        <br>
        <!--FORM SEARCH-->
        <div class="container col-sm-10">

            <div class="form-group">
                <!--Trigger/tombol modal insert-->
                <button type="button" class="btn btn-lg text-white" style="background-color: #be0e0e"  data-toggle="modal" data-target="#applyModal" >
                    Apply Reimburse
                </button>
            </div>

        </div>
        <br>

        <div class="container col-sm-10">

            <table id="d_table" class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>NO</th>
                        <th>DATE</th>
                        <th>TICKET PHOTO</th>
                        <th>PRICE</th>
                        <th>PARKING LOT</th>
                        <th>VEHICLE</th>
                        <th>ACTION</th>
                    </tr>
                </thead>
                <tbody>
                    <% int i = 1;
                        for (Ticket t : tickets) {%>
                    <tr>
                        <td><%= i++%></td>

                        <%try {
                                SimpleDateFormat simple = new SimpleDateFormat("dd MMMM yyyy");%>
                        <td><%= simple.format(t.getUploadDate())%></td>
                        <%
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                        <td><%= t.getPhotoTicket()%></td>
                        <td><%= t.getPrice()%></td>
                        <td><%= t.getParkingLot().getName()%></td>
                        <td><%= t.getVehicle().getVehicleType() + " " + t.getVehicle().getId()%></td>
                        <td>
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#updateModal<%
                                out.print(t.getId());
                                    %>"><i class="fas fa-edit"></i></button>
                            <a href="reimburse?action=delete&id=<%=t.getId()%>" ><button type="button" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></button></a>

                            <form action="reimburse" method="POST">
                                <div class="modal fade" id="updateModal<%
                                    out.print(t.getId());
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

                                                            <th colspan="2"><input type="hidden" readonly="" name="id" value="<% out.print(t.getId()); %>" /></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>

                                                            <td colspan="2"><input type="hidden" name="reimburse" value="<% out.print(t.getReimburse().getId()); %>" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Date</td>
                                                            <td><input type="text" name="date" value="<% out.print(t.getUploadDate()); %>" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Ticket Photo</td>
                                                            <td><input type="file" name="photo" value="<% out.print(t.getPhotoTicket()); %>" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Price</td>
                                                            <td><input type="text" name="price" value="<% out.print(t.getPrice());%>" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Parking Lot</td>
                                                            <td><select name="parking"   id="parking" class="custom-select">
                                                                    <option selected value="<%=t.getParkingLot().getId()%>"><%=t.getParkingLot().getName()%></option>
                                                                    <%for (ParkingLot p : parklot) {%>
                                                                    <option value="<%=p.getId()%>"><%=p.getLocation()%></option>
                                                                    <% }%>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Vehicle</td>
                                                            <td><select name="vehicle"   id="vehicle" class="custom-select">
                                                                    <option selected value="<%=t.getVehicle().getId()%>"><%=t.getVehicle().getVehicleType()+" "+t.getVehicle().getId()%></option>
                                                                    <%for (Vehicle v : vehicles) {%>
                                                                    <option value="<%=v.getId()%>"><%=v.getVehicleType()+" "+v.getId()%></option>
                                                                    <% }%>
                                                                </select></td>
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
        </div>

        <form action="reimburse" method="POST" enctype="multipart/form-data">

            <!--Membuat class MODAL INSERT-->
            <div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Apply Reimburse</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body">

                            <!--Isi method Insert Modal-->
                            <table border="0" >
                                <tbody>

                                    <tr>
                                        <td>Date</td>
                                        <td><input class="form-control" type="date" name="date" value="" /></td>
                                    </tr>

                                    <tr>
                                        <td>Ticket Photo</td>
                                        <td><input class="form-control" id="customFile" type="file" name="photo" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Price</td>
                                        <td><input class="form-control" type="text" name="price" value="" /></td>
                                    </tr>

                                    <tr>
                                        <td>Parking Lot</td>
                                        <td>
                                            <select name="parking"   id="parking" class="custom-select">
                                                <option selected>Select Parking Lot</option>
                                                <%for (ParkingLot p : parklot) {%>
                                                <option value="<%=p.getId()%>"><%=p.getLocation()%></option>
                                                <% }%>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Vehicle</td>
                                        <td>
                                            <select name="vehicle" id="vehicle"  class="custom-select">
                                                <option selected>Select Vehicle</option>
                                                <%for (Vehicle v : vehicles) {%>
                                                <option value="<%=v.getId()%>"><%=v.getVehicleType() + " " + v.getId()%></option>
                                                <% }%>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <!--Button pada modal Insert-->
                            <button type="button" class="btn btn-sm text-white" style="background-color: #776969" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-sm text-white" style="background-color: #be0e0e">Save </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
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
        session.removeAttribute("employee");

    %>



</html>
