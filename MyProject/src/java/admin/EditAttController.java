/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import controller.auth.BaseRoleController;
import dal.GroupDBContext;
import dal.LecturerDBContext;
import dal.SessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import model.Account;
import model.Attandance;
import model.Group;
import model.Lecturer;
import model.Session;
import model.Student;
import util.DateTimeHelper;

/**
 *
 * @author admin
 */
public class EditAttController extends BaseRoleController {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        LecturerDBContext ldb = new LecturerDBContext();
        ArrayList<Lecturer> lecs = ldb.getListUsername();
        req.setAttribute("lecs", lecs);
        req.setAttribute("username", account.getUsername());

        if (req.getParameter("lid") == null) {
        } else {
            int lid = Integer.parseInt(req.getParameter("lid"));
            GroupDBContext gdb = new GroupDBContext();
            ArrayList<Group> groups = gdb.listGroup(lid);
            req.setAttribute("groups", groups);

            if (req.getParameter("gid") == null) {
            } else {
                int gid = Integer.parseInt(req.getParameter("gid"));
                SessionDBContext sesdb = new SessionDBContext();
                ArrayList<Session> sessions = sesdb.getSessionFromGroup(gid);
                req.setAttribute("sessions", sessions);

                if (req.getParameter("sesid") == null) {
                } else {
                    int sesid = Integer.parseInt(req.getParameter("sesid"));
                    SessionDBContext sesDB = new SessionDBContext();
                    Session ses = sesDB.get(sesid);
                    Date today = new Date();
                    java.sql.Date today_sql = DateTimeHelper.toDateSql(today);
                    req.setAttribute("today", today_sql);
                    req.setAttribute("ses", ses);
                }
            }
        }
        req.setAttribute("role", "admin");
        req.getRequestDispatcher("../view/admin/editatts.jsp").forward(req, resp);
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        Session ses = new Session();
        ses.setId(Integer.parseInt(req.getParameter("sesid")));
        String[] stdids = req.getParameterValues("stdid");
        for (String stdid : stdids) {
            Attandance a =new Attandance();
            Student s = new Student();
            a.setStudent(s);
            a.setDescription(req.getParameter("description"+stdid));
            a.setPresent(req.getParameter("present"+stdid).equals("present"));
            s.setId(Integer.parseInt(stdid));
            a.setTaker(account.getUsername());
            ses.getAttandances().add(a);
        }
        SessionDBContext db = new SessionDBContext();
        db.update(ses);
        String lid = req.getParameter("lid");
        String gid = req.getParameter("gid");
        String sesid = req.getParameter("sesid");
        resp.sendRedirect("editatts?lid="+ lid +"&gid="+ gid +"&sesid=" + sesid);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        processRequest(req, resp, account);
    }
}
