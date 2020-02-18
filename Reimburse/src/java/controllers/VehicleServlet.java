package controllers;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import daos.GeneralDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Employee;
import models.Vehicle;
import tools.HibernateUtil;

/**
 *
 * @author HENSTECH
 */
@WebServlet(urlPatterns = {"/vehicle"})
public class VehicleServlet extends HttpServlet {

    private GeneralDAO<Vehicle> vdao = new GeneralDAO<>(HibernateUtil.getSessionFactory(), Vehicle.class);
    private GeneralDAO<Employee> edao = new GeneralDAO<>(HibernateUtil.getSessionFactory(), Employee.class);

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
            
            Employee empl = (Employee) request.getAttribute("idUser");
            request.getSession().setAttribute("vehicles", vdao.getData(null));
//            request.getSession().setAttribute("vehicles", vdao.getAll());
            RequestDispatcher rd = request.getRequestDispatcher("vehicle.jsp");
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
                
                vdao.saveOrDelete(new Vehicle(request.getParameter("id")), true);
                
            } else if (request.getParameter("action").equals("update")) {
                
                Vehicle vehicle = vdao.getById(request.getParameter("id"));
                request.getSession().setAttribute("vehicles", vehicle);
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
        
        String owner = request.getParameter("owner");
        
        String stnk = request.getParameter("stnk");
        
        String type = request.getParameter("type");
        
        String nik = request.getParameter("nik");
        
        PrintWriter out = response.getWriter();

        Employee employee = (Employee) request.getAttribute("idUser");
        if (id != null && owner != null && stnk != null && type != null && nik != null) {

            out.println("<script src= 'https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'> </script>");
            out.println("<script src= 'https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script src= 'https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");

            if (id.matches("[0-9]+")) {
                
                out.println("swal ('Gagal !', 'Data gagal disimpan1', 'error');");
                
            } else if (id.matches("[A-z]+")) {
                
                out.println("swal ('Gagal !', 'Data gagal disimpan2', 'error');");
                
            } else if (vdao.saveOrDelete(new Vehicle(id, owner, stnk, type, new Employee(employee.getId())), false)) {
                
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
