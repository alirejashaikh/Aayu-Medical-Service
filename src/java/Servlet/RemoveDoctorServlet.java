package Servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import POJO.RemoveDoctorBean;
import DaoImplement.RemoveDoctorDao;

@WebServlet("/remove-employee-doctor")
public class RemoveDoctorServlet extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String doctor_employee_id = request.getParameter("doctor_employee_id");
        
        
        RemoveDoctorBean removedoctorBean = new RemoveDoctorBean();

        removedoctorBean.setDoctor_employee_id(doctor_employee_id);
        
        
        System.out.println(removedoctorBean);

        RemoveDoctorDao removedoctorDao = new RemoveDoctorDao();
       String insertValidate = removedoctorDao.chkinsrt(removedoctorBean);
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
