/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package lecturer;

import dal.AttendanceDBContext;
import dal.GroupDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.Attandance;
import model.Group;
import model.Session;
import model.Student;


/**
 *
 * @author admin
 */
public class AttStatusController extends HttpServlet {

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
        int lid = Integer.parseInt(request.getParameter("lid"));
        int gid = Integer.parseInt(request.getParameter("gid"));
        GroupDBContext gdb = new GroupDBContext();
        ArrayList<Group> groups = gdb.listGroup(lid);
        Group group = gdb.get(gid);
        
        SessionDBContext sesdb = new SessionDBContext();
        ArrayList<Session> sessions = sesdb.getSessionFromGroup(gid);
        
        StudentDBContext sdb = new StudentDBContext();
        ArrayList<Student> students = sdb.getListStudent(gid);
        
        AttendanceDBContext attdb = new AttendanceDBContext();
        ArrayList<Attandance> atts = attdb.listAtt(gid);
        
        request.setAttribute("sessions", sessions);
        request.setAttribute("group", group);
        request.setAttribute("groups", groups);
        request.setAttribute("students", students);
        request.setAttribute("atts", atts);
        request.getRequestDispatcher("../view/lecturer/attstatus.jsp").forward(request, response);
        
       
        
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
