/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import models.Employee;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Account;
import org.mindrot.jbcrypt.BCrypt;
import tools.HibernateUtil;

/**
 *
 * @author Insane
 */
@WebServlet(name = "EmployeeServlet", urlPatterns = {"/register"})
public class EmployeeServlet extends HttpServlet {

    private GeneralDAO<Employee> edao = new GeneralDAO<>(HibernateUtil.getSessionFactory(), Employee.class);
    private GeneralDAO<Account> adao = new GeneralDAO<>(HibernateUtil.getSessionFactory(), Account.class);

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            request.getSession().setAttribute("employee", edao.getAll());
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.include(request, response);

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        if (request.getParameter("action") != null && request.getParameter("id") != null) {
            if (request.getParameter("action").equals("delete")) {
                out.println("<script src= 'https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'> </script>");
                out.println("<script src= 'https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                out.println("<script src= 'https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                out.println("<script>");
                out.println("$(document).ready(function(){");
                out.println("swal({");
                out.println("title: \"Are you sure?\",");
                out.println("text: \"Once deleted, you will not be able to recover this imaginary file!\",");
                out.println(" icon: \"warning\",");
                out.println("buttons: true,");
                out.println("dangerMode: true, \n})");
                out.println(".then((willDelete) => {\n"
                        + "  if (willDelete) {\n"
                        + "    swal(\"Poof! Your imaginary file has been deleted!\", {\n"
                        + "      icon: \"success\",\n"
                        + "    });");
                edao.saveOrDelete(new Employee(request.getParameter("id")), true);
                out.println("} else {\n"
                        + "    swal(\"Your imaginary file is safe!\");\n"
                        + "  }");

                out.println("});");
                out.println("});");
                out.println("</script>");
            } else if (request.getParameter("action").equals("update")) {
                Employee employee = edao.getById(request.getParameter("id"));
                request.getSession().setAttribute("register", employee);
            }
        }

        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("employeeName");
        String email = request.getParameter("employeeEmail");
        String phoneNumber = request.getParameter("employeePhoneNumber");
        String hireDate = request.getParameter("employeeHireDate");
        String password = request.getParameter("accountPassword");
        int n = 60;
        String pass = BCrypt.hashpw(password, BCrypt.gensalt());
        PrintWriter out = response.getWriter();
        if (id != null && name != null && email != null && phoneNumber != null && hireDate != null) {
            out.println("<script src= 'https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'> </script>");
            out.println("<script src= 'https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script src= 'https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");

            if (!id.matches("[0-9]+")) {
                out.println("swal ('Gagal !', 'Data gagal disimpan', 'error');");
            } else if (edao.saveOrDelete(new Employee(id, name, email, false, Date.valueOf(hireDate), phoneNumber), false)) {
                adao.saveOrDelete(new Account(id, pass, EmployeeServlet.getAlphaNumericString(n), false, new Employee(id)), false);
                out.println("swal ('Sukses !', 'Data berhasil disimpan', 'success');");
            }
//            public Account(String id, String password, String token, String isVerify, Employee employee) {
            out.println("});");
            out.println("</script>");

        }
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    static String getAlphaNumericString(int n) {

        // chose a Character random from this String 
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";

        // create StringBuffer size of AlphaNumericString 
        StringBuilder sb = new StringBuilder(n);

        for (int i = 0; i < n; i++) {

            // generate a random number between 
            // 0 to AlphaNumericString variable length 
            int index
                    = (int) (AlphaNumericString.length()
                    * Math.random());

            // add Character one by one in end of sb 
            sb.append(AlphaNumericString
                    .charAt(index));
        }

        return sb.toString();
    }

}
