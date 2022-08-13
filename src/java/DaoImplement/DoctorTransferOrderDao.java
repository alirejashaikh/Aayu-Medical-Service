package DaoImplement;

import DaoImplement.DbConnectionImpl;
import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;

import java.sql.Connection;
import POJO.DoctorTransferOrderBean;
import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.Period;

public class DoctorTransferOrderDao {
    public String chkinsrt(DoctorTransferOrderBean doctorTransferOrderBean)
    {           
        Connection conn=null;
        String doctor_name="";
        
        try {
                conn = DbConnectionImpl.getConnection();
                
                PreparedStatement doctor_details=conn.prepareStatement(QueryInterface.doctor_details_with_username);
                doctor_details.setString(1, doctorTransferOrderBean.getUsername());
                int status=0;
                ResultSet rs=doctor_details.executeQuery();
                
                if(rs.next())
                {   
                    if(doctorTransferOrderBean.getAction().equals("ACCEPTED"))
                    {
                        String old_hospital_id=rs.getString("hospital_id");
                        PreparedStatement pst=conn.prepareStatement(QueryInterface.doctor_accepting_transfer_order);

                        pst.setString(1, rs.getString("new_hospital_id"));
                        pst.setString(2, rs.getString("employee_id"));

                        System.out.println(pst);
                        status = pst.executeUpdate();
                        //System.out.println("status of update : "+status);
                        
            // PATIENT SHIFT TO OTHER DOCTOR AS HE ACCEPTED TRANSFER ORDER
                        
                        if(status==1)
                        {
                            PreparedStatement pst1=conn.prepareStatement(QueryInterface.fetch_random_employee_id_on_accepting_transfer_order_by_doctor, Statement.RETURN_GENERATED_KEYS);

                            pst1.setString(1, rs.getString("employee_id"));
                            pst1.setString(2, old_hospital_id);
                            pst1.setString(3, rs.getString("employee_id"));
                            
                            System.out.println(pst1);
                            
                            PreparedStatement pst2=conn.prepareStatement(QueryInterface.SQL_safe_update);
                            pst2.executeUpdate();
                            ResultSet rs1=pst1.executeQuery();
                            if (rs1.next())
                            {
                                String new_employee_id = rs1.getString("employee_id");
                                System.out.println("new employee : "+new_employee_id);
                                
                                PreparedStatement pst3=conn.prepareStatement(QueryInterface.update_employee_id_1_on_accepting_transfer_order_by_doctor);
                                pst3.setString(1, new_employee_id);
                                pst3.setString(2, new_employee_id);
                                pst3.setString(3, rs.getString("employee_id"));
                                System.out.println(pst3);
                                
                                int update_status_1 = pst3.executeUpdate();
                                System.out.println("update_status_1   :   "+update_status_1);
                                
                                
                                PreparedStatement pst4=conn.prepareStatement(QueryInterface.update_employee_id_2_on_accepting_transfer_order_by_doctor);
                                pst4.setString(1, new_employee_id);
                                pst4.setString(2, new_employee_id);
                                pst4.setString(3, rs.getString("employee_id"));
                                System.out.println(pst4);
                                
                                int update_status_2 = pst4.executeUpdate();
                                System.out.println("update_status_2   :   "+update_status_2);
                                
                                    PreparedStatement pst5=conn.prepareStatement(QueryInterface.update_transfer_status_back_to_normal_on_accepting_transfer_order_by_doctor);
                                    pst5.setString(1, rs.getString("employee_id"));
                                    System.out.println(pst5);
                                    pst5.executeUpdate();
                            }
                            else
                            {
                                //email to admin with patient ids that there are no extra doctor to check the patients
                                
                                PreparedStatement pst5=conn.prepareStatement(QueryInterface.update_transfer_status_back_to_normal_on_accepting_transfer_order_by_doctor);
                                pst5.setString(1, rs.getString("employee_id"));
                                System.out.println(pst5);
                                pst5.executeUpdate();
                            }
                        }
                        pst.close();
                    }
                    else if(doctorTransferOrderBean.getAction().equals("DECLINED"))
                    {
                        String joining_date=rs.getString("joining_date");
                        LocalDate dateoj = LocalDate.parse(joining_date);
                        //System.out.println(joining_date);
                        LocalDate curDate = LocalDate.now();
                        int gap = Period.between(dateoj, curDate).getYears();
                        System.out.println("gap :"+gap);
                        if(gap>=5)
                        {
                            //mail to admin
                            PreparedStatement pst=conn.prepareStatement(QueryInterface.report_to_admin_on_deny_of_doctor);

                            pst.setString(1, rs.getString("employee_id"));
                            System.out.println(pst);
                            pst.executeUpdate();
                            pst.close();
                        }
                        else
                        {
                            PreparedStatement pst=conn.prepareStatement(QueryInterface.doctor_denying_transfer_order);
                            
                            pst.setString(1, doctorTransferOrderBean.getReason());
                            pst.setString(2, rs.getString("employee_id"));
                            System.out.println(pst);
                            pst.executeUpdate();
                            pst.close();
                        }
                    }
                }
                
                conn.close();
                return "SUCCESS";
            }catch(Exception e) {
            e.printStackTrace();
            }
            return "FAIL INSERT";
    }
}
