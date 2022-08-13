package DaoImplement;

import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;
import java.sql.Connection;

import POJO.SearchEmployeeBean;
import java.sql.ResultSet;

public class SearchEmployeeDao {
    public String chkinsrt(SearchEmployeeBean searchemployeebean)
    {
        String role="";
        
        Connection conn=null;
        try {
                conn = DbConnectionImpl.getConnection();
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.job_role);
                
                pst.setString(1, searchemployeebean.getEmployee_id());
                
                System.out.println(pst);
                ResultSet rs = pst.executeQuery();
                
                boolean status = rs.next();
                System.out.println("Status :"+status);
                
                if(status==true)
                {   
                    role="SUCCESS ";
                    role=role.concat(rs.getString(1));
                    System.out.println("Role :"+role);
                    
                    return role;
                }
                pst.close();
                conn.close();
                return "SUCCESS";
            }catch(Exception e) {
            e.printStackTrace();
            }
        
            return "FAIL_INSERT";
    }
}
