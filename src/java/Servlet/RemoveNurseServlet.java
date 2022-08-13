package Servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import POJO.RemoveNurseBean;
import DaoImplement.RemoveNurseDao;

@WebServlet("/remove-employee-nurse")
public class RemoveNurseServlet extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String nurse_employee_id = request.getParameter("nurse_employee_id");
        
        
        RemoveNurseBean removenurseBean = new RemoveNurseBean();

        removenurseBean.setNurse_employee_id(nurse_employee_id);
        
        System.out.println(removenurseBean);

        RemoveNurseDao removenurseDao = new RemoveNurseDao();
       String insertValidate = removenurseDao.chkinsrt(removenurseBean);
       System.out.print(insertValidate);
       if(insertValidate.equals("SUCCESS"))
       {
           System.out.println("Query run successfully!!");
           request.setAttribute("InsertSuccessmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("admin-panel-login.jsp");
           rd.forward(request, response);
       }
       else{
           request.setAttribute("InsertErrmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("remove-employee.jsp");
           rd.include(request, response);
       }
    }
}
