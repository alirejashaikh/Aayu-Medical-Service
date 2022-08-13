package DaoImplement;

import DaoImplement.DbConnectionImpl;
import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;

import java.sql.Connection;
import POJO.AddNurseBean;
import java.sql.ResultSet;

public class AddNurseDao {
    public String chkinsrt(AddNurseBean addNurseBean)
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
                
                email = addNurseBean.getEmail_id();
                mob = addNurseBean.getMobile_no();
                
                String[] values=email.split("@");
                username= values[0];
                
                password = mob.substring(0, 8);
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.AddNurseQuery);
                PreparedStatement pst1=conn.prepareStatement(QueryInterface.AddEmployeeNurse);
                PreparedStatement pst2=conn.prepareStatement(QueryInterface.NurseLoginadd);
                
                
                pst.setString (1, addNurseBean.getName() );
                pst.setString (2, addNurseBean.getWard_no());
                pst.setString (3, addNurseBean.getShift());
                pst.setString (4, addNurseBean.getEmail_id());
                pst.setString (5, addNurseBean.getMobile_no());
                pst.setString (6, username);
                pst.setString (7, password);
                
                
                
                pst2.setString(1, username);
                pst2.setString(2, password);
                 
                System.out.println(pst1);
                pst1.executeUpdate();
                
                
                System.out.println(pst);
                pst.executeUpdate();
                pst2.executeUpdate();
                
                PreparedStatement pst3=conn.prepareStatement(QueryInterface.hospital_with_ward);
                pst3.setString(1,addNurseBean.getWard_no());
                ResultSet rs = pst3.executeQuery();
                if(rs.next())
                {
                    hospital_name = rs.getString("hospital_name");
                }
                body="HEY \n";
                body=body.concat(addNurseBean.getName());
                body=body.concat(",\n\nWELCOME TO AAYU MEDICAL SERVICE.\n\n YOU CAN NOW LOG IN WITH YOUR CORRESPNDING USERNAME AND PASSWORD AS FOLLOWING :\n\nUSERNAME : ");
                body = body.concat(username).concat("\nPASSWORD : ").concat(password);
                body = body.concat("\n\nYOU ARE APPOINTED AS NURSE IN ").concat(hospital_name);       
                body = body.concat(" IN WARD NO ").concat(addNurseBean.getWard_no()).concat(" IN ").concat(addNurseBean.getShift().toUpperCase()).concat(" SHIFT.");
                
                 body = body.concat("\n\n\nTHANKING YOU,\nAAYU MEDICAL SERVICE");
                
                System.out.println(body);
                
                toEmail=addNurseBean.getEmail_id();
                
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
