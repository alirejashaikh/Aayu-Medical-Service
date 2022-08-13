package DaoImplement;

import DaoImplement.DbConnectionImpl;
import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;

import java.sql.Connection;
import POJO.FeedbackBean;

public class FeedbackDao {
    
    public String chkinsrt(FeedbackBean feedbackBean)
    {           
        Connection conn=null;
        
        try {
                conn = DbConnectionImpl.getConnection();
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.feedback);
                
                pst.setString(1, feedbackBean.getName());
                pst.setString(2, feedbackBean.getEmail());
                pst.setString(3, feedbackBean.getMob_no());
                pst.setString(4, feedbackBean.getRate());
                         
                System.out.println(pst);
                pst.executeUpdate();
                
                pst.close();
                conn.close();
                return "SUCCESS";
            }catch(Exception e) {
            e.printStackTrace();
            }
            return "FAIL INSERT";
    }
}
