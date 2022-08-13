package DaoImplement;

import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;
import java.sql.Connection;

import POJO.Patient_Transfer_Request_Bean;
import java.sql.ResultSet;

public class Patient_Transfer_Request_Dao {
    public String chkinsrt(Patient_Transfer_Request_Bean patient_Transfer_Request_Bean)
    {           
        Connection conn=null;
        try {
                conn = DbConnectionImpl.getConnection();
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.update_patient_transfer);
                
                pst.setString(1, patient_Transfer_Request_Bean.getWard_no());
                pst.setString(2, patient_Transfer_Request_Bean.getBed_no());
                pst.setString(3, patient_Transfer_Request_Bean.getWard_no());
                pst.setString(4, patient_Transfer_Request_Bean.getBed_no());
                pst.setString(5, patient_Transfer_Request_Bean.getStatus());
                pst.setString(6, patient_Transfer_Request_Bean.getReason());
                pst.setString(7, patient_Transfer_Request_Bean.getWard_no());
                pst.setString(8, patient_Transfer_Request_Bean.getBed_no());
                pst.setString(9, patient_Transfer_Request_Bean.getStatus());
                pst.setString(10, patient_Transfer_Request_Bean.getReason());
                
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
