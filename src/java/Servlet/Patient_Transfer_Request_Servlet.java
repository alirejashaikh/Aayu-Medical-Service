package Servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import POJO.Patient_Transfer_Request_Bean;
import DaoImplement.Patient_Transfer_Request_Dao;

@WebServlet("/patient-transfer-request-after-submitting-bed")

public class Patient_Transfer_Request_Servlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String ward_no = request.getParameter("ward_no") ;
        String bed_no = request.getParameter("bed_no") ;
        String status = request.getParameter("status");
        String reason = request.getParameter("reason");
        
        Patient_Transfer_Request_Bean patient_Transfer_Request_Bean = new Patient_Transfer_Request_Bean();

        patient_Transfer_Request_Bean.setWard_no(ward_no);
        patient_Transfer_Request_Bean.setBed_no(bed_no);
        patient_Transfer_Request_Bean.setStatus(status);
        patient_Transfer_Request_Bean.setReason(reason);
        
        System.out.println(patient_Transfer_Request_Bean);

        Patient_Transfer_Request_Dao patient_Transfer_Request_Dao = new Patient_Transfer_Request_Dao();
       String insertValidate = patient_Transfer_Request_Dao.chkinsrt(patient_Transfer_Request_Bean);
       System.out.print(insertValidate);
       if(insertValidate.equals("SUCCESS"))
       {
           System.out.println("Query run successfully!!");
           RequestDispatcher rd = request.getRequestDispatcher("doctor-login.jsp");
           rd.forward(request, response);
       }
       else{
           request.setAttribute("InsertErrmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("patient-transfer-request.jsp");
           rd.include(request, response);
       }
    }
}
