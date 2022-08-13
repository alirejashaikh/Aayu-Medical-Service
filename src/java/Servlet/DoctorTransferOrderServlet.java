package Servlet;

import DaoImplement.DoctorTransferOrderDao;
import POJO.DoctorTransferOrderBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/doctor-transfer-order")
public class DoctorTransferOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String action=request.getParameter("action");
        String last_denied_reason=request.getParameter("last_denied_reason");
        String reason=request.getParameter("reason");
        String username=request.getParameter("username");
        
        
        DoctorTransferOrderBean doctorTransferOrderBean = new DoctorTransferOrderBean();
        doctorTransferOrderBean.setAction(action);
        doctorTransferOrderBean.setLast_denied_reason(last_denied_reason);
        doctorTransferOrderBean.setReason(reason);
        doctorTransferOrderBean.setUsername(username);
        
        
        
        System.out.println(doctorTransferOrderBean);

        DoctorTransferOrderDao doctorTransferOrderDao = new DoctorTransferOrderDao();
       String insertValidate = doctorTransferOrderDao.chkinsrt(doctorTransferOrderBean);
       System.out.print(insertValidate);
       if(insertValidate.equals("SUCCESS"))
       {
           System.out.println("Query run successfully!!");
           request.setAttribute("InsertSuccessmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("doctor-login.jsp");
           rd.forward(request, response);
       }
       else{
           request.setAttribute("InsertErrmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("doctor-transfer-order.jsp");
           rd.include(request, response);
       }
    }
}
