package DaoImplement;

import DaoImplement.DbConnectionImpl;
import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;

import java.sql.Connection;
import POJO.RemoveDoctorBean;
import java.sql.ResultSet;

public class RemoveDoctorDao {
    public String chkinsrt(RemoveDoctorBean removedoctorBean)
    {           
        Connection conn=null;
        String toEmail = "";
        String subject="EMPLOYMENT UPDATE";
        String body="";
        String filepath=null;
        String doctor_name="";
        try {
                conn = DbConnectionImpl.getConnection();
                
                PreparedStatement pst3=conn.prepareStatement(QueryInterface.fetch_doctor_details);
                pst3.setString(1, removedoctorBean.getDoctor_employee_id());  
                ResultSet rs =pst3.executeQuery();
                if(rs.next())
                {
                   doctor_name = rs.getString("doctor_name");
                   toEmail= rs.getString("email_id");
                }
                PreparedStatement pst=conn.prepareStatement(QueryInterface.RemoveDoctorFromDoctor);
                PreparedStatement pst1=conn.prepareStatement(QueryInterface.RemoveDoctorFromLogin);
                PreparedStatement pst2=conn.prepareStatement(QueryInterface.RemoveDoctorFromEmployee);
                
                
                pst.setString(1, removedoctorBean.getDoctor_employee_id());
                pst1.setString(1, removedoctorBean.getDoctor_employee_id());
                pst2.setString(1, removedoctorBean.getDoctor_employee_id());  
                
                System.out.println(pst);
                System.out.println(pst1);
                System.out.println(pst2);
                
                pst1.executeUpdate();
                pst.executeUpdate();
                pst2.executeUpdate();
                
                body="HEY \n";
                body=body.concat(doctor_name.toUpperCase());
                body=body.concat(", \n\nWE ARE VERY SORRY TO INFORM YOU THAT YOU ARE NO LONGEER A PART OF OUR JOURNEY.\n\n WE WISH BEST OF LUCK FOR YOUR FUTURE.");
                body = body.concat("\n\nTHANKING YOU,\nAAYU MEDICAL SERVICE");
                System.out.println(body);
                
                
                SendEmailDao.SendEmail(subject, body, filepath, toEmail);
                
                pst.close();
                pst1.close();
                pst2.close();
                conn.close();
                return "SUCCESS";
            }catch(Exception e) {
            e.printStackTrace();
            }
            return "FAIL INSERT";
    }
}
