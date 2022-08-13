package DaoImplement;

import DaoImplement.DbConnectionImpl;
import DaoInterface.QueryInterface;
import java.sql.PreparedStatement;

import java.sql.Connection;
import POJO.NurseTransferOrderBean;
import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.Period;

public class NurseTransferOrderDao {
    public String chkinsrt(NurseTransferOrderBean nurseTransferOrderBean)
    {           
        Connection conn=null;
        String name="";
        
        try {
                conn = DbConnectionImpl.getConnection();
                
                PreparedStatement nurse_details=conn.prepareStatement(QueryInterface.nurse_details_with_username);
                nurse_details.setString(1, nurseTransferOrderBean.getUsername());
                int status=0;
                ResultSet rs=nurse_details.executeQuery();
                
                if(rs.next())
                {   
                    if(nurseTransferOrderBean.getAction().equals("ACCEPTED"))
                    {
                        PreparedStatement pst1=conn.prepareStatement(QueryInterface.fetch_random_ward);
                        pst1.setString(1, rs.getString("new_hospital_id"));
                        ResultSet rs7 = pst1.executeQuery();
                        if(rs7.next())
                        {
                            PreparedStatement pst=conn.prepareStatement(QueryInterface.nurse_accepting_transfer_order);

                            pst.setString(1, rs.getString("new_hospital_id"));
                            pst.setString(2, rs7.getString(1));
                            pst.setString(3, rs.getString("new_shift"));
                            pst.setString(4, rs.getString("employee_id"));

                            System.out.println(pst);
                            status = pst.executeUpdate();
                            //System.out.println("status of update : "+status);
                            pst.close();
                        }
                    }
                    else if(nurseTransferOrderBean.getAction().equals("DECLINED"))
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
                            PreparedStatement pst=conn.prepareStatement(QueryInterface.report_to_admin_on_deny_of_nurse);

                            pst.setString(1, rs.getString("employee_id"));
                            System.out.println(pst);
                            pst.executeUpdate();
                            pst.close();
                        }
                        else
                        {
                            PreparedStatement pst=conn.prepareStatement(QueryInterface.nurse_denying_transfer_order);
                            
                            pst.setString(1, nurseTransferOrderBean.getReason());
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
