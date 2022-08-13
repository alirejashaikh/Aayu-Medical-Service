package DaoImplement;

import DaoImplement.DbConnectionImpl;
import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;

import java.sql.Connection;
import POJO.NurseTransferReqBean;
import java.sql.ResultSet;

public class NurseTransferReqDao {
    public String chkinsrt(NurseTransferReqBean nurseTransferReqBean)
    {           
        Connection conn=null;
        String doctor_name="";
        
        try {
                conn = DbConnectionImpl.getConnection();
                
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.nurse_transfer_req_insertion);
                PreparedStatement pst5 = conn.prepareStatement(QueryInterface.fetch_random_shift);
                ResultSet  rs3 = pst5.executeQuery();
                if( rs3.next())
                { 
                    String shift = rs3.getString(1);
                    
                    pst.setString(1, nurseTransferReqBean.getUsername());
                    pst.setString(2, nurseTransferReqBean.getHospital_name());
                    pst.setString(3, nurseTransferReqBean.getUrgent());
                    pst.setString(4, nurseTransferReqBean.getProblem());
                    pst.setString(5, nurseTransferReqBean.getReason());
                    pst.setString(6, "PENDING");
                    pst.setString(7, "REQUEST");
                    pst.setString(8, nurseTransferReqBean.getHospital_id());
                    pst.setString(9, shift);
                    
                    System.out.println(pst);
                    pst.executeUpdate();

                    pst.close();
                    conn.close();
                    return "SUCCESS";
                }
            }catch(Exception e) {
            e.printStackTrace();
            }
            return "FAIL INSERT";
    }
}
