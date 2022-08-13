package DaoImplement;

import DaoImplement.DbConnectionImpl;
import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;

import java.sql.Connection;
import POJO.AddDoctorBean;
import DaoImplement.SendEmailDao;
import java.sql.ResultSet;

public class AddDoctorDao {
    public String chkinsrt(AddDoctorBean addDoctorBean)
    {           
        Connection conn=null;
        String email;
        String username;
        String password;
        String mob;
        String toEmail = "";
        String subject="LOGIN CREEDENTIAL UPDATE";
        String body="";
        String filepath=null;
        String hospital_name="";
        
        try {
                conn = DbConnectionImpl.getConnection();
                email = addDoctorBean.getEmail_id();
                mob = addDoctorBean.getMob_number();
                
                String[] values=email.split("@");
                username= values[0];
                
                password = mob.substring(0, 8);
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.AddDoctorQuery);
                PreparedStatement pst1=conn.prepareStatement(QueryInterface.AddEmployeeDoctor);
                PreparedStatement pst2=conn.prepareStatement(QueryInterface.DoctorLoginadd);
                PreparedStatement pst3=conn.prepareStatement(QueryInterface.hospital_name_with_id);
                
                pst.setString(1, addDoctorBean.getDoctor_name());
                pst.setString(2, addDoctorBean.getSpecialization());
                pst.setString(3, addDoctorBean.getQualification());
                pst.setString(4, addDoctorBean.getMob_number());
                pst.setString(5, addDoctorBean.getEmail_id());
                pst.setString(6, username);
                pst.setString(7, password);
                pst.setString(8, addDoctorBean.getHospital_id());
                
                pst2.setString(1, username);
                pst2.setString(2, password);
                
                pst3.setString(1, addDoctorBean.getHospital_id());
                
                System.out.println(pst1);
                pst1.executeUpdate();
                
                System.out.println(pst);
                pst.executeUpdate();
                
                pst2.executeUpdate();
                ResultSet rs = pst3.executeQuery();
                
                if(rs.next())
                {
                    hospital_name = rs.getString("hospital_name");
                }
                
                body="HEY \n";
                body=body.concat(addDoctorBean.getDoctor_name().toUpperCase());
                body=body.concat(", \n\nWELCOME TO AAYU MEDICAL SERVICE.\n\nYOU CAN NOW LOG IN WITH YOUR CORRESPONDING USERNAME AND PASSWORD AS FOLLOWING:\n\n"
                        + "USERNAME : ");
                body = body.concat(username).concat("\nPASSWORD : ").concat(password);
                body = body.concat("\n\nYOU ARE APPOINTED IN ").concat(hospital_name).concat(" IN ").concat(addDoctorBean.getSpecialization().toUpperCase()).concat(" DEPARTMENT. WISH YOU ALL THE BEST FOR YOUR FUTURE.\n\n");
                body = body.concat("\nTHANKING YOU,\nAAYU MEDICAL SERVICE");
                System.out.println(body);
                
                toEmail=addDoctorBean.getEmail_id();
                
                SendEmailDao.SendEmail(subject, body, filepath, toEmail);
                
                pst1.close();
                pst.close();
                pst2.close();
                conn.close();
                return "SUCCESS";
            }catch(Exception e) {
            e.printStackTrace();
            }
            return "FAIL INSERT";
    }
}
