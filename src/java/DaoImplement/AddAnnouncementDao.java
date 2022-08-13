package DaoImplement;


import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;
import java.sql.Connection;

import POJO.AddAnnouncementBean;

public class AddAnnouncementDao {
    public String chkinsrt(AddAnnouncementBean addAnnouncementBean)
    {           
        Connection conn=null;
        try {
                conn = DbConnectionImpl.getConnection();
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.Publish_Announcement);
                
                pst.setString(1, addAnnouncementBean.getAnnouncement());
                
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
