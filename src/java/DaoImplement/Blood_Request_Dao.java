package DaoImplement;


import DaoImplement.DbConnectionImpl;
import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;

import java.sql.Connection;
import POJO.Blood_Request_Bean;

public class Blood_Request_Dao {
    public String chkinsrt(Blood_Request_Bean blood_request_Bean)
    {           
        Connection conn=null;
        
        try {
                conn = DbConnectionImpl.getConnection();
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.Blood_Available_Update);
                PreparedStatement pst1=conn.prepareStatement(QueryInterface.SQL_safe_update);
                
                
                pst.setString(1, blood_request_Bean.getUnit());
                pst.setString(2, blood_request_Bean.getPatient_id());
                pst.setString(3, blood_request_Bean.getBlood_group());
                
                
                System.out.println(pst);
                pst1.executeQuery();
                pst.executeUpdate();
                
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
