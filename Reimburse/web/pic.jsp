<%-- 
    Document   : vehicle
    Created on : 15-Feb-2020, 17:26:15
    Author     : FIKRI-PC
--%>

<%@page import="models.Employee"%>
<%@page import="models.Reimburse"%>
<%@page import="models.Status"%>
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
    <!------ INI SESSION NYA BELUM YUN----->
    <%  if (session.getAttribute("reimburses") == null || session.getAttribute("employees") == null || session.getAttribute("status") == null) {
            response.sendRedirect("pic");
//
        } else {
            List<Reimburse> reimbursees = (List<Reimburse>) session.getAttribute("reimburses");
            List<Employee> employeees = (List<Employee>) session.getAttribute("employees");
            List<Status> statusees = (List<Status>) session.getAttribute("statuses");
            Reimburse reimburse = (Reimburse) session.getAttribute("reimburse");
    %>



    <body>        
        <%@include file="/newDashboard/headerHome.jsp" %>
        <br>
        <br>
        <br>
        <br>

        <div class="container col-sm-10" style="padding-left:8%; padding-top: 2%  ">

                <table id="d_table" class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>NO</th>
                            <th>EMPLOYEE</th>
                            <th>PERIOD</th>
                            <th>TOTAL</th>
                            <th>NOTES</th>
                            <th>ACTION</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% int i = 1;
                            for (Reimburse r : reimbursees) {%>
                        <tr>
                            <td><%= i++%></td>
                            <td><%= r.getId()%></td>
                            <td><%= r.getEmployee()%></td>
                            <td><%= r.getEmployee()%></td>
                            <td><%= r.getPeriod()%></td>
                            <td><%= r.getTotal()%></td>
                            <td><%= r.getNotes()%></td>
                            <td>
                                <!--REJECTED DAN APPROVED-->

                                <a href="reimburse?action=approved&id=<%=r.getId()%>" ><button type="button" class="btn btn-danger btn-sm">Approved</button></a>
                                <a href="reimburse?action=rejected&id=<%=r.getId()%>" ><button type="button" class="btn btn-danger btn-sm">Rejected</button></a>
                                <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#updateModal">  Notes </button>

                                <form action="reimburse" method="POST">
                                    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Notes</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>

                                                <div class="modal-body">
                                                    <table border="0" >
                                                        <thead>
                                                            <tr>
                                                                <th>Notes</th>
                                                                <th><input type="text"  name="notes" value="<% out.print(r.getNotes()); %>"  /></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Input Notes for employee</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="modal-footer">
                                                    <!--Button Update pada modal Update-->
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Add </button>
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

              <!-- Footer -->
  <footer class="fixed-bottom py-5 bg-dark "style="padding-top: 0rem!important; padding-bottom: 1rem!important">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &team; Reimbursement 2020</p>
    </div>
    <!-- /.container -->
  </footer>


    </body>

    <% }
        session.removeAttribute("employee");

    %>



</html>
;