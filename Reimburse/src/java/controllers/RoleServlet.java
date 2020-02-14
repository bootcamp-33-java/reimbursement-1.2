/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Role;
import tools.HibernateUtil;

/**
 *
 * @author Insane
 */
@WebServlet(name = "RoleServlet", urlPatterns = {"/role"})
public class RoleServlet extends HttpServlet {

    private GeneralDAO<Role> rdao = new GeneralDAO<>(HibernateUtil.getSessionFactory(), Role.class);

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
            request.getSession().setAttribute("roles", rdao.getData(null));
            RequestDispatcher rd = request.getRequestDispatcher("role.jsp");
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
                String id = request.getParameter("id");
                String name = request.getParameter("roleName");
                
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
                Role rolee = new Role(id,name) ;
                rdao.saveOrDelete(rolee, true);
                out.println("} else {\n"
                        + "    swal(\"Your imaginary file is safe!\");\n"
                        + "  }");

                out.println("});");
                out.println("});");
                out.println("</script>");
            } else if (request.getParameter("action").equals("update")) {
                Role role = rdao.getById(request.getParameter("id"));
                request.getSession().setAttribute("role", role);
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
        String name = request.getParameter("roleName");

        PrintWriter out = response.getWriter();
        if (id != null && name != null) {
            out.println("<script src= 'https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'> </script>");
            out.println("<script src= 'https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script src= 'https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");

            if (!id.matches("[A-z]+")) {
                out.println("swal ('Gagal !', 'Data gagal disimpan', 'error');");
            } else{
                rdao.saveOrDelete(new Role(id, name), false);
                out.println("swal ('Sukses !', 'Data berhasil disimpan', 'success');");
            }
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

}
