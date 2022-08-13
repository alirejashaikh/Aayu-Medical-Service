package Servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

@WebServlet("/opd-booking")
public class opd_booking_fetch_doctor_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String hospital_id = request.getParameter("hospital_id") ;
        String department_id = request.getParameter("department_id") ;
        
        String insertValidate="fail";
        if(hospital_id!=null && department_id!=null)
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
           session.setAttribute("hospital_id",hospital_id);
           session.setAttribute("department_id",department_id);
           RequestDispatcher rd = request.getRequestDispatcher("opd-booking-after-fetching-department.jsp");
           rd.forward(request, response);
       }
       else{
           request.setAttribute("InsertErrmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("opd-booking.jsp");
           rd.include(request, response);
       }
    }
}
