/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDAO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import models.Employee;
import models.ParkingLot;
import models.Reimburse;
import models.Status;
import models.Ticket;
import models.Vehicle;
import org.apache.commons.io.IOUtils;
import tools.HibernateUtil;

/**
 *
 * @author yuyun
 */
@WebServlet(name = "ReimburseServlet", urlPatterns = {"/reimburse"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)

public class ReimburseServlet extends HttpServlet {

    private String d;
    private GeneralDAO<ParkingLot> pldao = new GeneralDAO(HibernateUtil.getSessionFactory(), ParkingLot.class);

    private GeneralDAO<Ticket> tdao = new GeneralDAO(HibernateUtil.getSessionFactory(), Ticket.class);

    private GeneralDAO<Vehicle> vdao = new GeneralDAO(HibernateUtil.getSessionFactory(), Vehicle.class);

    private GeneralDAO<Reimburse> redao = new GeneralDAO(HibernateUtil.getSessionFactory(), Reimburse.class);

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

            request.getSession().setAttribute("parklots", pldao.getData(null));
            request.getSession().setAttribute("vehicles", vdao.getData(11));
            request.getSession().setAttribute("reimburses", tdao.getAll());
            RequestDispatcher rd = request.getRequestDispatcher("reimburse.jsp");
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
     * @param image
     * @param type
     * @param request servlet request
     * @param response servlet response
     * @return 
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static String encodeToString(BufferedImage image, String type) {
        String imageString = null;
        ByteArrayOutputStream bos = new ByteArrayOutputStream();

        try {
            ImageIO.write(image, type, bos);
            byte[] imageBytes = bos.toByteArray();

            imageString = Base64.getEncoder().encodeToString(imageBytes);

            bos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return imageString;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String date = request.getParameter("date");

        Part filePart = request.getPart("photo");

        String price = request.getParameter("price");

        String parking = request.getParameter("parking");

        String vehicle = request.getParameter("vehicle");

        // insert to reimburse
        Date dt = Date.valueOf(date);

        try {
            SimpleDateFormat frmt = new SimpleDateFormat("MMMM yyyy");
            d = frmt.format(dt);
        } catch (Exception e) {
        }

//            Employee empl = (Employee) request.getAttribute("idUser");
        List<Reimburse> reim = redao.getData(d);
        if (reim.isEmpty()) {
            Reimburse reimb = new Reimburse(0, dt, dt, new Long(0), d, new Employee("11"), new Status(5));
            redao.saveOrDelete(reimb, false);
        }
        List<Reimburse> reimbur = redao.getData(d);

        //insert to ticket
        BufferedImage image = ImageIO.read(filePart.getInputStream());
        for (Reimburse r : reimbur) {
            Ticket t = new Ticket(0, dt, "yyyy", new Long(price), new ParkingLot(parking), new Reimburse(r.getId()), 
                    new Vehicle(vehicle));
            tdao.saveOrDelete(t, false);
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
