package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

import POJO.SearchEmployeeBean;
import DaoImplement.SearchEmployeeDao;
import javax.servlet.http.HttpSession;


@WebServlet("/search-employee")

public class SearchEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String employee_id = request.getParameter("employee_id");
        
        SearchEmployeeBean searchEmployeeBean = new SearchEmployeeBean();

        searchEmployeeBean.setEmployee_id(employee_id);
        
        System.out.println(searchEmployeeBean);

        SearchEmployeeDao searchEmployeeDao = new SearchEmployeeDao();
        
            String insertValidate = searchEmployeeDao.chkinsrt(searchEmployeeBean);
            System.out.print(insertValidate);
       
            String[] values=insertValidate.split("\\s");
            String status= values[0];
            String role = values[1];
            System.out.println("role in servlet :"+role);
            
                
            if(status.equals("SUCCESS"))
                {
                 if(role.equals("nurse"))
                    {
                        request.setAttribute("employee_id",employee_id);
                        RequestDispatcher rd = request.getRequestDispatcher("nurse-view.jsp");
                        rd.forward(request,response);
                        response.sendRedirect("nurse-view.jsp"); 
                    }
                    else if(role.equals("doctor"))
                    { 
                        request.setAttribute("employee_id",employee_id);
                        RequestDispatcher rd = request.getRequestDispatcher("doctor-patient.jsp");
                        rd.forward(request,response);
                        response.sendRedirect("doctor-patient.jsp"); 
                    }
                    else
                    {
                        response.sendRedirect("search-employee.jsp");
                    }
            }
            else if(status=="FAIL_INSERT")
            {
                     response.sendRedirect("search-employee.jsp");
            }  
    }   
}
