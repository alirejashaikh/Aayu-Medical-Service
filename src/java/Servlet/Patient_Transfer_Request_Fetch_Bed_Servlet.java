package Servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

@WebServlet("/patient-transfer-request")
public class Patient_Transfer_Request_Fetch_Bed_Servlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String ward_no = request.getParameter("ward_no") ;
        
        String insertValidate="fail";
        if(ward_no!=null)
        {
            insertValidate="SUCCESS";
        }
        else
        {
            insertValidate="FAILED";
        }
       if(insertValidate.equals("SUCCESS"))
       {
           System.out.println("Query run successfully!!");
           HttpSession session = request.getSession();
           //request.setAttribute("ward_no",ward_no);
           session.setAttribute("ward_no",ward_no);
           RequestDispatcher rd = request.getRequestDispatcher("patient-transfer-request-after-fetching-bed.jsp");
           rd.forward(request, response);
       }
       else{
           request.setAttribute("InsertErrmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("patient-transfer-request.jsp");
           rd.include(request, response);
       }
    }
}
