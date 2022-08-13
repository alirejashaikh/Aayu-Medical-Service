package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

import POJO.Patient_Details_Update_Bean;
import DaoImplement.Patient_Details_Update_Dao;

@WebServlet("/update-patient-details-after-fetching-bed")

public class Patient_Details_Update_Servlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String patient_id = request.getParameter("patient_id");
        String admit_date = request.getParameter("admit_date");
        String discharge_date = request.getParameter("discharge_date");
        String ward_no = request.getParameter("ward_no");
        String bed_no = request.getParameter("bed_no");
        String doctor_id1 = request.getParameter("doctor_id");
        String doctor_id2 = request.getParameter("doctor_id1");
        String[] doctor=doctor_id1.split("_");
        doctor_id1= doctor[0];
        String doctor_name1 = doctor[1];
        
        doctor=doctor_id2.split("_");
        doctor_id2= doctor[0];
        String doctor_name2 = doctor[1];
        
       
        Patient_Details_Update_Bean patient_details_update_Bean = new Patient_Details_Update_Bean();

        patient_details_update_Bean.setPatient_id(patient_id);
        patient_details_update_Bean.setAdmit_date(admit_date);
        patient_details_update_Bean.setDischarge_date(discharge_date);
        patient_details_update_Bean.setWard_no(ward_no);
        patient_details_update_Bean.setBed_no(bed_no);
        patient_details_update_Bean.setDoctor_id1(doctor_id1);
        patient_details_update_Bean.setDoctor_id2(doctor_id2);
        patient_details_update_Bean.setDoctor_name1(doctor_name1);
        patient_details_update_Bean.setDoctor_name2(doctor_name2);
        
        
        
        System.out.println(patient_details_update_Bean);

        Patient_Details_Update_Dao patient_details_update_Dao = new Patient_Details_Update_Dao();
       String insertValidate = patient_details_update_Dao.chkinsrt(patient_details_update_Bean);
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
           RequestDispatcher rd = request.getRequestDispatcher("update_patient_details.jsp");
           rd.include(request, response);
       }
    }
}
