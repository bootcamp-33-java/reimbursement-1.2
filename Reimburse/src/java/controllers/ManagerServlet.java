/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Reimburse;
import models.Status;
import tools.HibernateUtil;

/**
 *
 * @author yuyun
 */
@WebServlet(name = "ManagerServlet", urlPatterns = {"/manager"})
public class ManagerServlet extends HttpServlet {

            private GeneralDAO<Reimburse> rdao = new GeneralDAO(HibernateUtil.getSessionFactory(), Reimburse.class);

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
             List<Reimburse> approvemsfc = rdao.getAll().stream().filter(h->h.getCurrentStatus().getId()==6).collect(Collectors.toList());
            request.getSession().setAttribute("msfcs", approvemsfc);
            RequestDispatcher rd = request.getRequestDispatcher("manager.jsp");
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
        if (request.getParameter("action") != null) {
            if (request.getParameter("action").equals("approved")) {
                String note = request.getParameter("note");
                String id = request.getParameter("id");
                Reimburse reim = rdao.getById(id);
                reim.setNotes(note);
                reim.setCurrentStatus(new Status(2));
                rdao.saveOrDelete(reim, false);
                

            } else if (request.getParameter("action").equals("reject")) {
                String note = request.getParameter("note");
                String id = request.getParameter("id");
                Reimburse reim = rdao.getById(id);
                reim.setNotes(note);
                reim.setCurrentStatus(new Status(4));
                rdao.saveOrDelete(reim, false);
            }
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
