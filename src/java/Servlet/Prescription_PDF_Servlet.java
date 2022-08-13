package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import POJO.Prescription_PDF_Bean;
import DaoImplement.Prescription_PDF_Dao;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

@WebServlet("/doctors-prescription-generate")
public class Prescription_PDF_Servlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String ward_no= request.getParameter("ward_no");
        String bed_no= request.getParameter("bed_no");
        String patient_id= request.getParameter("patient_id");
        String patient_name= request.getParameter("patient_name");
        String Blood_Pressure= request.getParameter("Blood_Pressure");        
        String Oxygen_Level= request.getParameter("Oxygen_Level");
        String Pulse_Rate= request.getParameter("Pulse_Rate");
        
       
        String medicine_name1= request.getParameter("medicine_name1");
        String Power1= request.getParameter("Power1");        
        String Remarks1= request.getParameter("Remarks1");
        
        String medicine_name2= request.getParameter("medicine_name2");
        String Power2= request.getParameter("Power2");
        String Remarks2= request.getParameter("Remarks2");
        
        String medicine_name3= request.getParameter("medicine_name3");
        String Power3= request.getParameter("Power3");
        String Remarks3= request.getParameter("Remarks3");
        
        String medicine_name4= request.getParameter("medicine_name4");
        String Power4= request.getParameter("Power4");
        String Remarks4= request.getParameter("Remarks4");
        
        String medicine_name5= request.getParameter("medicine_name5");
        String Power5= request.getParameter("Power5");
        String Remarks5= request.getParameter("Remarks5");
        
        String medicine_name6= request.getParameter("medicine_name6");
        String Power6= request.getParameter("Power6");
        String Remarks6= request.getParameter("Remarks6");
        
        String medicine_name7= request.getParameter("medicine_name7");
        String Power7= request.getParameter("Power7");
        String Remarks7= request.getParameter("Remarks7");
        
        String medicine_name8= request.getParameter("medicine_name8");
        String Power8= request.getParameter("Power8");
        String Remarks8= request.getParameter("Remarks8");
        
        String medicine_name9= request.getParameter("medicine_name9");
        String Power9= request.getParameter("Power9");
        String Remarks9= request.getParameter("Remarks9");
        
        String medicine_name10= request.getParameter("medicine_name10");
        String Power10= request.getParameter("Power10");
        String Remarks10= request.getParameter("Remarks10");

        String test_id1= request.getParameter("test_id1");
        String test_id2= request.getParameter("test_id2");
        String test_id3= request.getParameter("test_id3");
        String test_id4= request.getParameter("test_id4");
        String test_id5= request.getParameter("test_id5");
        String test_id6= request.getParameter("test_id6");
        String test_id7= request.getParameter("test_id7");
        String test_id8= request.getParameter("test_id8");
        
        
        Prescription_PDF_Bean prescription_PDF_Bean = new Prescription_PDF_Bean();

        prescription_PDF_Bean.setWard_no(ward_no);
        prescription_PDF_Bean.setBed_no(bed_no);
        prescription_PDF_Bean.setPatient_id(patient_id);
        prescription_PDF_Bean.setPatient_name(patient_name);
        prescription_PDF_Bean.setBlood_Pressure(Blood_Pressure);        
        prescription_PDF_Bean.setOxygen_Level(Oxygen_Level);
        prescription_PDF_Bean.setPulse_Rate(Pulse_Rate);
        
       
        prescription_PDF_Bean.setMedicine_name1(medicine_name1);
        prescription_PDF_Bean.setPower1(Power1);                
        prescription_PDF_Bean.setRemarks1(Remarks1);
        
        
        prescription_PDF_Bean.setMedicine_name2(medicine_name2);
        prescription_PDF_Bean.setPower2(Power2);
        prescription_PDF_Bean.setRemarks2(Remarks2);
        
        
        prescription_PDF_Bean.setMedicine_name3(medicine_name3);
        prescription_PDF_Bean.setPower3(Power3);                
        prescription_PDF_Bean.setRemarks3(Remarks3);
        
        
        prescription_PDF_Bean.setMedicine_name4(medicine_name4);
        prescription_PDF_Bean.setPower4(Power4);
        prescription_PDF_Bean.setRemarks4(Remarks4);
        
        
        prescription_PDF_Bean.setMedicine_name5(medicine_name5);
        prescription_PDF_Bean.setPower5(Power5);                
        prescription_PDF_Bean.setRemarks5(Remarks5);
        
        
        prescription_PDF_Bean.setMedicine_name6(medicine_name6);
        prescription_PDF_Bean.setPower6(Power6);
        prescription_PDF_Bean.setRemarks6(Remarks6);
        
       
        prescription_PDF_Bean.setMedicine_name7(medicine_name7);
        prescription_PDF_Bean.setPower7(Power7);                
        prescription_PDF_Bean.setRemarks7(Remarks7);
        
        
        prescription_PDF_Bean.setMedicine_name8(medicine_name8);
        prescription_PDF_Bean.setPower8(Power8);
        prescription_PDF_Bean.setRemarks8(Remarks8);
        
        
        prescription_PDF_Bean.setMedicine_name9(medicine_name9);
        prescription_PDF_Bean.setPower9(Power9);                
        prescription_PDF_Bean.setRemarks9(Remarks9);
        
        
        prescription_PDF_Bean.setMedicine_name10(medicine_name10);
        prescription_PDF_Bean.setPower10(Power10);
        prescription_PDF_Bean.setRemarks10(Remarks10);
               
        prescription_PDF_Bean.setTest_id1(test_id1);
        prescription_PDF_Bean.setTest_id2(test_id2);
        prescription_PDF_Bean.setTest_id3(test_id3);
        prescription_PDF_Bean.setTest_id4(test_id4);
        prescription_PDF_Bean.setTest_id5(test_id5);
        
        prescription_PDF_Bean.setTest_id6(test_id6);
        prescription_PDF_Bean.setTest_id7(test_id7);
        prescription_PDF_Bean.setTest_id8(test_id8);
        
        
        System.out.println(prescription_PDF_Bean);

        Prescription_PDF_Dao prescription_PDF_Dao = new Prescription_PDF_Dao();
       String insertValidate = prescription_PDF_Dao.chkinsrt(prescription_PDF_Bean);
       System.out.print(insertValidate);
       if(insertValidate.equals("SUCCESS"))
       {
           System.out.println("Query run successfully!!");
           request.setAttribute("InsertSuccessmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("doctors-prescription-generate.jsp");
           rd.forward(request, response);
       }
       else{
           request.setAttribute("InsertErrmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
           rd.include(request, response);
       }
    }
}
