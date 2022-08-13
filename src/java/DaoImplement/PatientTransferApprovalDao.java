package DaoImplement;

import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;
import java.sql.Connection;

import POJO.PatientTransferApprovalBean;
import java.sql.ResultSet;

/**
 *
 * @author Souvik
 */
public class PatientTransferApprovalDao {
    public String chkinsrt(PatientTransferApprovalBean patientTransferApprovalBean)
    {           
        Connection conn=null;
        try {
                conn = DbConnectionImpl.getConnection();
                
                //update patient transfer table
                PreparedStatement pst=conn.prepareStatement(QueryInterface.patient_transfer_request_approval);
                PreparedStatement SQL_safe_update=conn.prepareStatement(QueryInterface.SQL_safe_update);
                SQL_safe_update.executeQuery();
                if(patientTransferApprovalBean.getAction().equals("ACCEPTED"))
                {
                    //find random ward
                    PreparedStatement random_ward=conn.prepareStatement(QueryInterface.random_ward);
                    random_ward.setString(1, patientTransferApprovalBean.getNew_hospital_id());
                    System.out.println(random_ward);
                    
                    ResultSet rs=random_ward.executeQuery();
                    if(rs.next())
                    {
                    //remove patient from previous bed
                        
                        PreparedStatement update_in_bed_table=conn.prepareStatement(QueryInterface.update_in_bed_table);
                        update_in_bed_table.setString(1, patientTransferApprovalBean.getPatient_id());
                        System.out.println(update_in_bed_table);
                    
                        update_in_bed_table.executeUpdate();
                        
                        
                    // increase bed in previous ward
                        
                        PreparedStatement bed_status_available_update_while_transfer=conn.prepareStatement(QueryInterface.bed_status_available_update_while_transfer);
                        bed_status_available_update_while_transfer.setString(1, patientTransferApprovalBean.getPatient_id());
                        System.out.println(bed_status_available_update_while_transfer);
                    
                        bed_status_available_update_while_transfer.executeUpdate();
                        
                        
                    // transfer patient to other hospital
                        
                        String ward=rs.getString("ward_no");
                        PreparedStatement transfer_patient_to_new_hospital=conn.prepareStatement(QueryInterface.transfer_patient_to_new_hospital);
                        transfer_patient_to_new_hospital.setString(1, ward);
                        transfer_patient_to_new_hospital.setString(2, ward);
                        transfer_patient_to_new_hospital.setString(3, patientTransferApprovalBean.getPatient_id());
                        System.out.println(transfer_patient_to_new_hospital);
                    
                        transfer_patient_to_new_hospital.executeUpdate();
                        
                        
                    // add patient to bed
                        
                        PreparedStatement add_patient_in_bed=conn.prepareStatement(QueryInterface.add_patient_in_bed_while_transfer);
                        add_patient_in_bed.setString(1, patientTransferApprovalBean.getPatient_id());
                        add_patient_in_bed.setString(2, patientTransferApprovalBean.getPatient_id());
                        System.out.println(add_patient_in_bed);
                    
                        add_patient_in_bed.executeUpdate();
                        
                        
                    // decrease available bed from ward
                        
                        PreparedStatement bed_status_available_update=conn.prepareStatement(QueryInterface.bed_status_available_update);
                        bed_status_available_update.setString(1, ward);
                        System.out.println(bed_status_available_update);
                    
                        bed_status_available_update.executeUpdate();
                    }
                    pst.setString(1, patientTransferApprovalBean.getAction());
                    pst.setString(2, patientTransferApprovalBean.getReview());
                    pst.setString(3, patientTransferApprovalBean.getPatient_id());
                    System.out.println(pst);
                    
                    pst.executeUpdate();
                }
                else
                {
                // declined msg
                    
                    pst.setString(1, patientTransferApprovalBean.getAction());
                    pst.setString(2, patientTransferApprovalBean.getReview());
                    pst.setString(3, patientTransferApprovalBean.getPatient_id());
                    System.out.println(pst);
                    
                    pst.executeUpdate();
                }
                
                
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
