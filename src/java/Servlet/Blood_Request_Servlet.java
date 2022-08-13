package Servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import POJO.Blood_Request_Bean;
import DaoImplement.Blood_Request_Dao;

@WebServlet("/blood-form")
public class Blood_Request_Servlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String patient_id = request.getParameter("patient_id") ;
        String blood_group = request.getParameter("Blood_Grp") ;
        String unit = request.getParameter("unit") ;
        
        
        
        Blood_Request_Bean blood_request_Bean = new Blood_Request_Bean();

        blood_request_Bean.setPatient_id(patient_id);
        blood_request_Bean.setBlood_group(blood_group);
        blood_request_Bean.setUnit(unit);
        
        
        System.out.println(blood_request_Bean);

        Blood_Request_Dao blood_request_Dao = new Blood_Request_Dao();
       String insertValidate = blood_request_Dao.chkinsrt(blood_request_Bean);
       System.out.print(insertValidate);
       if(insertValidate.equals("SUCCESS"))
       {
           System.out.println("Query run successfully!!");
           request.setAttribute("InsertSuccessmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("blood-list.jsp");
           rd.forward(request, response);
       }
       else{
           request.setAttribute("InsertErrmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("blood-form.jsp");
           rd.include(request, response);
       }
    }
}
