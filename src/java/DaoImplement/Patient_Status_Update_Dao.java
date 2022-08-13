package DaoImplement;

import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;
import java.sql.Connection;

import POJO.Patient_Status_Update_Bean;

public class Patient_Status_Update_Dao {
    public String chkinsrt(Patient_Status_Update_Bean patient_status_update_Bean)
    {           
        Connection conn=null;
        try {
                conn = DbConnectionImpl.getConnection();
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.NEW_OR_UPDATE_Patient_Status_Update);
                
                pst.setString(1, patient_status_update_Bean.getWard_no());
                pst.setString(2, patient_status_update_Bean.getBed_no());
                pst.setString(3, patient_status_update_Bean.getWard_no());
                pst.setString(4, patient_status_update_Bean.getBed_no());
                pst.setString(5, patient_status_update_Bean.getWard_no());
                pst.setString(6, patient_status_update_Bean.getBed_no());
                pst.setString(7, patient_status_update_Bean.getWard_no());
                pst.setString(8, patient_status_update_Bean.getBed_no());
                pst.setString(9, patient_status_update_Bean.getWard_no());
                pst.setString(10, patient_status_update_Bean.getBed_no());
                pst.setString(11, patient_status_update_Bean.getBlood_Pressure());
                pst.setString(12, patient_status_update_Bean.getOxygen_Level());
                pst.setString(13, patient_status_update_Bean.getPulse_Rate());
                pst.setString(14, patient_status_update_Bean.getRemarks());
                pst.setString(15, patient_status_update_Bean.getWard_no());
                pst.setString(16, patient_status_update_Bean.getBed_no());
                pst.setString(17, patient_status_update_Bean.getWard_no());
                pst.setString(18, patient_status_update_Bean.getBed_no());
                pst.setString(19, patient_status_update_Bean.getWard_no());
                pst.setString(20, patient_status_update_Bean.getBed_no());
                pst.setString(21, patient_status_update_Bean.getWard_no());
                pst.setString(22, patient_status_update_Bean.getBed_no());
                pst.setString(23, patient_status_update_Bean.getBlood_Pressure());
                pst.setString(24, patient_status_update_Bean.getOxygen_Level());
                pst.setString(25, patient_status_update_Bean.getPulse_Rate());
                pst.setString(26, patient_status_update_Bean.getRemarks());
                
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
