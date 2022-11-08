/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package student;

import controller.auth.BaseRoleController;
import dal.AttendanceDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Student;

/**
 *
 * @author admin
 */
public class ActivityDetailsController extends BaseRoleController {
    
    protected void processRequest(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException{
        int sesid = Integer.parseInt(req.getParameter("sesid"));
        StudentDBContext stddb = new StudentDBContext();
        Student s = stddb.getStudent(account.getUsername());
        int stdid = s.getId();
        SessionDBContext db = new SessionDBContext();
        req.setAttribute("ses", db.get(sesid, stdid));
        req.setAttribute("account", account);
        req.getRequestDispatcher("../view/student/activitydetails.jsp").forward(req, resp);
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        processRequest(req, resp, account);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        processRequest(req, resp, account);
    }

}
