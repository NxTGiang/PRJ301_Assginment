/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attandance;
import model.Session;
import model.Student;

/**
 *
 * @author admin
 */
public class AttendanceDBContext extends DBContext<Attandance> {

    public ArrayList<Attandance> listAtt(int gid) {
        ArrayList<Attandance> atts = new ArrayList<>();
        try {
            String sql = "SELECT S.stdid, S.stdname\n"
                    + "		,SS.sesid, attanded\n"
                    + "		,ISNULL(A.present, 0) present\n"
                    + "	FROM Student S\n"
                    + "		INNER JOIN Student_Group SG ON S.stdid = SG.stdid\n"
                    + "		INNER JOIN [Group] G ON SG.gid = G.gid\n"
                    + "		INNER JOIN [Session] SS ON SS.gid = G.gid\n"
                    + "		LEFT JOIN Attandance A ON A.stdid = S.stdid AND SS.sesid = A.sesid\n"
                    + "		WHERE G.gid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attandance a = new Attandance();
                Student s = new Student();
                Session ses = new Session();

                s.setId(rs.getInt("stdid"));
                s.setName(rs.getString("stdname"));
                a.setStudent(s);

                ses.setId(rs.getInt("sesid"));
                ses.setAttandated(rs.getBoolean("attanded"));
                a.setSession(ses);
                
                a.setPresent(rs.getBoolean("present"));

                atts.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

    public boolean isAttend(Student student, Session session) {
        try {
            String sql = "SELECT \n"
                    + "		sesid, stdid, present\n"
                    + "	FROM Attandance\n"
                    + "	WHERE sesid = ? AND stdid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, session.getId());
            stm.setInt(2, student.getId());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getBoolean("present");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public void insert(Attandance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Attandance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Attandance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attandance get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Attandance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
