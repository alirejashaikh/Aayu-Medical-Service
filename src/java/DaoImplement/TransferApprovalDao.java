package DaoImplement;

import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;
import java.sql.Connection;

import POJO.TransferApprovalBean;

public class TransferApprovalDao {
    public String chkinsrt(TransferApprovalBean transferApprovalBean)
    {           
        Connection conn=null;
        try {
                conn = DbConnectionImpl.getConnection();
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.transfer_request_approval);
                PreparedStatement SQL_safe_update=conn.prepareStatement(QueryInterface.SQL_safe_update);
                if(transferApprovalBean.getAction().equals("ACCEPTED"))
                {
                    PreparedStatement transfer_to_new_hospital=conn.prepareStatement(QueryInterface.transfer_to_new_hospital);
                    transfer_to_new_hospital.setString(1, transferApprovalBean.getNew_hospital_id());
                    transfer_to_new_hospital.setString(2, transferApprovalBean.getEmployee_id());
                    SQL_safe_update.executeQuery();
                    transfer_to_new_hospital.executeUpdate();
                }
                pst.setString(1, transferApprovalBean.getAction());
                pst.setString(2, transferApprovalBean.getReview());
                pst.setString(3, transferApprovalBean.getEmployee_id());
                
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
