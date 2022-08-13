package Servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import POJO.RegisterBean;
import DaoImplement.RegisterDao;

@WebServlet("/user-register")
public class RegisterServlet extends HttpServlet 
{
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
            String first_name = request.getParameter("fname");
            String middle_name= request.getParameter("mname");
            String last_name = request.getParameter("lname");
            String Gender = request.getParameter("gender");
            String Blood_Group = request.getParameter("Blood-Grp");
            String dateob = request.getParameter("dob");
            String Mob_Number = request.getParameter("mob_Number");
            String Alternative_mob_Number = request.getParameter("alternative_mob_Number");
            String email_id = request.getParameter("email");
            String password = request.getParameter("pwd");
            
            RegisterBean registerBean = new RegisterBean();

            registerBean.setFname(first_name);
            registerBean.setMname(middle_name);
            registerBean.setLname(last_name);
            registerBean.setGender(Gender);
            registerBean.setBlood_Group(Blood_Group);
            registerBean.setDob(dateob);
            registerBean.setMob_Number(Mob_Number);
            registerBean.setAlternative_mob_Number(Alternative_mob_Number);
            registerBean.setEmail(email_id);
            registerBean.setPwd(password);
            
            System.out.println(registerBean);
            
            RegisterDao registerDao = new RegisterDao();
           String insertValidate = registerDao.chkinsrt(registerBean);
           System.out.print(insertValidate);
           if(insertValidate.equals("SUCCESS"))
           {
               request.setAttribute("InsertSuccessmsg",insertValidate);
               RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
               rd.forward(request, response);
           }
           else{
               request.setAttribute("InsertErrmsg",insertValidate);
               RequestDispatcher rd = request.getRequestDispatcher("user-register.jsp");
               rd.include(request, response);
           }
            

    }
}