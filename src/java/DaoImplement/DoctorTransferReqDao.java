package DaoImplement;

import DaoImplement.DbConnectionImpl;
import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;

import java.sql.Connection;
import POJO.DoctorTransferReqBean;
import java.sql.ResultSet;

public class DoctorTransferReqDao {
    public String chkinsrt(DoctorTransferReqBean doctorTransferReqBean)
    {           
        Connection conn=null;
        String doctor_name="";
        
        try {
                conn = DbConnectionImpl.getConnection();
                
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.doc_transfer_req_insertion);
                
                pst.setString(1, doctorTransferReqBean.getUsername());
                pst.setString(2, doctorTransferReqBean.getHospital_name());
                pst.setString(3, doctorTransferReqBean.getUrgent());
                pst.setString(4, doctorTransferReqBean.getProblem());
                pst.setString(5, doctorTransferReqBean.getReason());
                pst.setString(6, "PENDING");
                pst.setString(7, "REQUEST");
                pst.setString(8, doctorTransferReqBean.getHospital_id());
                         
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
