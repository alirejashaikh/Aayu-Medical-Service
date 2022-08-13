package Servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import POJO.AddNurseBean;
import DaoImplement.AddNurseDao;

@WebServlet("/add-employee")
public class AddNurseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        
        String name =request.getParameter("name");
        String ward_no =request.getParameter("ward_no");
        String shift =request.getParameter("shift");
        String email_id =request.getParameter("email");
        String mobile_no =request.getParameter("mob_no");
        String username =request.getParameter("uname");
        String password =request.getParameter("pwd");
        
        AddNurseBean addNurseBean = new AddNurseBean();

        addNurseBean.setName(name);
        addNurseBean.setWard_no(ward_no);
        addNurseBean.setShift(shift);
        addNurseBean.setEmail_id(email_id);
        addNurseBean.setMobile_no(mobile_no);
        addNurseBean.setUsername(username);
        addNurseBean.setPassword(password);
       
        
        System.out.println(addNurseBean);

        AddNurseDao addNurseDao = new AddNurseDao();
       String insertValidate = addNurseDao.chkinsrt(addNurseBean);
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
           RequestDispatcher rd = request.getRequestDispatcher("add-employee.jsp");
           rd.include(request, response);
       }
    }
}
