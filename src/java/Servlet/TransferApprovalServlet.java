package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

import POJO.TransferApprovalBean;
import DaoImplement.TransferApprovalDao;


@WebServlet("/employee-transfer")

public class TransferApprovalServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String employee_id = request.getParameter("employee_id");
        String action = request.getParameter("action");
        String review = request.getParameter("review");
        String new_hospital_id = request.getParameter("new_hospital_id");
        
        TransferApprovalBean transferApprovalBean = new TransferApprovalBean();

        transferApprovalBean.setAction(action);
        transferApprovalBean.setEmployee_id(employee_id);
        transferApprovalBean.setReview(review);
        transferApprovalBean.setNew_hospital_id(new_hospital_id);
        
        System.out.println(transferApprovalBean);

        TransferApprovalDao transferApprovalDao = new TransferApprovalDao();
       String insertValidate = transferApprovalDao.chkinsrt(transferApprovalBean);
       System.out.print(insertValidate);
       if(insertValidate.equals("SUCCESS"))
       {
           System.out.println("Query run successfully!!");
           request.setAttribute("InsertSuccessmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("employee-transfer.jsp");
           rd.forward(request, response);
       }
       else
       {
           request.setAttribute("InsertErrmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("admin-panel-login.jsp");
           rd.include(request, response);
       }
    }
}
