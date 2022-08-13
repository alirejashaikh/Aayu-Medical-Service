package Servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import POJO.AddDoctorBean;
import DaoImplement.AddDoctorDao;

public class AddDoctorServlet extends HttpServlet 
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String role = request.getParameter("role") ;
        String doctor_name = request.getParameter("doctor_name") ;
        String specialization = request.getParameter("specialization") ;
        String qualification = request.getParameter("qualification") ;
        String email_id = request.getParameter("email_id");
        String mob_number = request.getParameter("mob_number");
        String hospital_id = request.getParameter("hospital_id");
        
        
        
        AddDoctorBean addDoctorBean = new AddDoctorBean();

        addDoctorBean.setDoctor_name(doctor_name);
        addDoctorBean.setQualification(qualification);
        addDoctorBean.setSpecialization(specialization);
        addDoctorBean.setRole(role);
        addDoctorBean.setEmail_id(email_id);
        addDoctorBean.setMob_number(mob_number);
        addDoctorBean.setHospital_id(hospital_id);
        
        System.out.println(addDoctorBean);

        AddDoctorDao addDoctorDao = new AddDoctorDao();
       String insertValidate = addDoctorDao.chkinsrt(addDoctorBean);
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
