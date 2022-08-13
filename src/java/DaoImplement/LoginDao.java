package DaoImplement;

import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

import POJO.LoginBean;

public class LoginDao {
    public String role="";
    public String username1="";
    String status_role_username="";
    
    
    public String chkinsrt(LoginBean loginBean)
    {
        Connection conn=null;
        
        try {
                conn = DbConnectionImpl.getConnection();
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.LoginSQL);
                pst.setString(1, loginBean.getUsername());
                pst.setString(2, loginBean.getPassword());

                System.out.println(pst);
                ResultSet rs = pst.executeQuery();
                
                boolean status = rs.next();
                System.out.println("Status :"+status);
                
                if(status==true)
                {   
                    role=" ";
                    role=role.concat(rs.getString(1));
                    System.out.println("Role :"+role);
                    username1=" ";
                    username1=username1.concat(rs.getString(2));
                    System.out.println("username :"+ username1);
                    String status_role_username="";
                    status_role_username=Boolean.toString(status);
                    System.out.println("Status_Role before adding role :"+status_role_username);
                    status_role_username=status_role_username.concat(role).concat(username1);
                    System.out.println("Status_Role after adding role:"+status_role_username);
                    
                    return status_role_username;
                }
                
                pst.close();
                conn.close();
                
                String status_role_username=Boolean.toString(status);
                status_role_username = status_role_username.concat(" role username");
                return status_role_username; 
            }catch(Exception e) {
            e.printStackTrace();
            }
            return status_role_username;
    }

}

