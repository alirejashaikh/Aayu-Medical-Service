package DaoImplement;

import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;
import java.sql.Connection;

import POJO.Patient_Details_Update_Bean;
import java.sql.ResultSet;

public class Patient_Details_Update_Dao {
    public String chkinsrt(Patient_Details_Update_Bean patient_details_update_Bean)
    {           
        Connection conn=null;
        try {
                conn = DbConnectionImpl.getConnection();
                
                PreparedStatement pst=conn.prepareStatement(QueryInterface.Patient_Details_Update);
                PreparedStatement pst1 = conn.prepareStatement(QueryInterface.bed_status_available_update);
                PreparedStatement pst2 = conn.prepareStatement(QueryInterface.add_patient_in_bed);
                
                
                pst.setString(1, patient_details_update_Bean.getPatient_id());
                pst.setString(2, patient_details_update_Bean.getAdmit_date());
//                pst.setString(3, patient_details_update_Bean.getDischarge_date());
                pst.setString(3, patient_details_update_Bean.getWard_no());
                pst.setString(4, patient_details_update_Bean.getBed_no());
                pst.setString(5, patient_details_update_Bean.getDoctor_id1());
                pst.setString(6, patient_details_update_Bean.getDoctor_name1());
                pst.setString(7, patient_details_update_Bean.getDoctor_id2());
                pst.setString(8, patient_details_update_Bean.getDoctor_name2());
                
                pst.setString(9, patient_details_update_Bean.getAdmit_date());
                pst.setString(10, patient_details_update_Bean.getWard_no());
                pst.setString(11, patient_details_update_Bean.getBed_no());
                pst.setString(12, patient_details_update_Bean.getDoctor_id1());
                pst.setString(13, patient_details_update_Bean.getDoctor_name1());
                pst.setString(14, patient_details_update_Bean.getDoctor_id2());
                pst.setString(15, patient_details_update_Bean.getDoctor_name2());
                
                
                pst1.setString(1,patient_details_update_Bean.getWard_no() );
                
                pst2.setString(1, patient_details_update_Bean.getPatient_id());
                pst2.setString(2, patient_details_update_Bean.getBed_no());
                
                
                System.out.println(pst);
                pst.executeUpdate();
                pst1.executeUpdate();
                pst2.executeUpdate();
                
                pst.close();
                pst1.close();
                pst2.close();
                
                conn.close();
                
                return "SUCCESS";
            }catch(Exception e) {
            e.printStackTrace();
            }
        
            return "FAIL INSERT";
    }
}
