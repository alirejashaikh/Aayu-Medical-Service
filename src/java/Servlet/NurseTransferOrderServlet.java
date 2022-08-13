package Servlet;

import DaoImplement.NurseTransferOrderDao;
import POJO.NurseTransferOrderBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/nurse-transfer-order")
public class NurseTransferOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String action=request.getParameter("action");
        String reason=request.getParameter("reason");
        String username=request.getParameter("username");
        
        
        NurseTransferOrderBean nurseTransferOrderBean = new NurseTransferOrderBean();
        nurseTransferOrderBean.setAction(action);
        nurseTransferOrderBean.setReason(reason);
        nurseTransferOrderBean.setUsername(username);
        
        System.out.println(nurseTransferOrderBean);

        NurseTransferOrderDao nurseTransferOrderDao = new NurseTransferOrderDao();
       String insertValidate = nurseTransferOrderDao.chkinsrt(nurseTransferOrderBean);
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
           RequestDispatcher rd = request.getRequestDispatcher("nurse-transfer-order.jsp");
           rd.include(request, response);
       }
    }
}
