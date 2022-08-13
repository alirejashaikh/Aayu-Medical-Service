package DaoImplement;


import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;
import java.sql.Connection;

import POJO.AddNoticeBean;

public class AddNoticeDao {
    public String chkinsrt(AddNoticeBean addnoticeBean)
    {           
        Connection conn=null;
        try {
                conn = DbConnectionImpl.getConnection();
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.Publish_Notice);
                
                pst.setString(1, addnoticeBean.getNotice());
                
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
