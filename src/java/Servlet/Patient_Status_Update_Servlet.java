package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

import POJO.Patient_Status_Update_Bean;
import DaoImplement.Patient_Status_Update_Dao;


@WebServlet("/nurse-patient-status-update")

public class Patient_Status_Update_Servlet extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        
        
        String ward_no = request.getParameter("ward_no");
        String bed_no = request.getParameter("bed_no");
        String Blood_Pressure = request.getParameter("Blood_Pressure");
        String Oxygen_Level = request.getParameter("Oxygen_Level");
        String Pulse_Rate = request.getParameter("Pulse_Rate");
        String Remarks = request.getParameter("Remarks");
       
        Patient_Status_Update_Bean patient_status_update_Bean = new Patient_Status_Update_Bean();

        patient_status_update_Bean.setWard_no(ward_no);
        patient_status_update_Bean.setBed_no(bed_no);
        patient_status_update_Bean.setBlood_Pressure(Blood_Pressure);
        patient_status_update_Bean.setOxygen_Level(Oxygen_Level);
        patient_status_update_Bean.setPulse_Rate(Pulse_Rate);
        patient_status_update_Bean.setRemarks(Remarks);
        
        
        System.out.println(patient_status_update_Bean);

        Patient_Status_Update_Dao patient_status_update_Dao = new Patient_Status_Update_Dao();
       String insertValidate = patient_status_update_Dao.chkinsrt(patient_status_update_Bean);
       System.out.print(insertValidate);
       if(insertValidate.equals("SUCCESS"))
       {
           System.out.println("Query run successfully!!");
           request.setAttribute("InsertSuccessmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("Nurse.jsp");
           rd.forward(request, response);
       }
       else{
           request.setAttribute("InsertErrmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("nurse-patient-status-update.jsp");
           rd.include(request, response);
       }
    }

}
