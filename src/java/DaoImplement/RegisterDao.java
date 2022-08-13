package DaoImplement;

import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;

import java.sql.Connection;

import POJO.RegisterBean;

public class RegisterDao {
       
    public String chkinsrt(RegisterBean registerBean)
    {
        Connection conn=null;
        
        try {
                conn = DbConnectionImpl.getConnection();
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.RegisterQuery);
                PreparedStatement pst1 = conn.prepareStatement(QueryInterface.Loginadd);
                pst.setString(1, registerBean.getFname());
                pst.setString(2, registerBean.getMname());
                pst.setString(3, registerBean.getLname());
                pst.setString(4, registerBean.getGender());
                pst.setString(5, registerBean.getBlood_Group());
                pst.setString(6, registerBean.getMob_Number());
                pst.setString(7, registerBean.getAlternative_mob_Number());
                pst.setString(8, registerBean.getEmail());
                pst.setString(9, registerBean.getPwd());
                pst.setString(10, registerBean.getDob());
                
                pst1.setString(1,registerBean.getEmail());
                pst1.setString(2,registerBean.getPwd());
                
                System.out.println(pst);
                int a = pst.executeUpdate();
                System.out.println("a = "+a);
                pst1.executeUpdate();
                
                pst.close();
                pst1.close();
                conn.close();
                return "SUCCESS";
            }catch(Exception e) {
            e.printStackTrace();
            }
            return "FAIL INSERT";
    }
}