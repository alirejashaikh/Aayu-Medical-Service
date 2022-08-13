package Servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

import POJO.LoginBean;
import DaoImplement.LoginDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            LoginBean loginBean = new LoginBean();
            
            loginBean.setUsername(username);
            loginBean.setPassword(password);
            
            System.out.println(loginBean);
            
            LoginDao loginDao = new LoginDao();
            
            String insertValidate = loginDao.chkinsrt(loginBean);
            System.out.println(insertValidate);
            
//            String false_status = insertValidate;
//            boolean Status_boolean_false = Boolean.parseBoolean(false_status); 
//            System.out.println("status_boolean_false : "+Status_boolean_false);
            
            String[] values=insertValidate.split("\\s");
            String status= values[0];
            String role = values[1];
            String username1 = values[2];
            boolean Status_boolean = Boolean.parseBoolean(status);  
            System.out.println("status_boolean : "+Status_boolean);
            System.out.println("role in servlet :"+role);
            System.out.println("username in servlet :"+username);
            
                
            if(Status_boolean==true)
                {
                    HttpSession session = request.getSession();
                    session.setAttribute("Session_user_login",username);
                    
                    
                    if(role.equals("nurse"))
                    {
//                        RequestDispatcher rd = request.getRequestDispatcher("servlet2");
//                        rd.forward(request, response);
                        session.setAttribute("username",username1);
                        response.sendRedirect("Nurse.jsp"); 
                    }
                    else if(role.equals("doctor"))
                    {
//                        RequestDispatcher rd = request.getRequestDispatcher("servlet2");
//                        rd.forward(request, response);
                        session.setAttribute("username",username1);
                        response.sendRedirect("doctor-login.jsp"); 
                    }
                    else if(role.equals("patient"))
                    {
//                        RequestDispatcher rd = request.getRequestDispatcher("servlet2");
//                        rd.forward(request, response);
                        session.setAttribute("username",username1);
                        response.sendRedirect("user-login-step1.jsp"); 
                    }
                    else if(role.equals("admin"))
                    {
//                        RequestDispatcher rd = request.getRequestDispatcher("servlet2");
//                        rd.forward(request, response);
                        session.setAttribute("username",username1);
                        response.sendRedirect("admin-panel-login.jsp"); 
                    }
                    else
                    {
                        response.sendRedirect("login.jsp");
                    }
            }
            else if(Status_boolean==false)
            {
                     HttpSession session = request.getSession();
                     out.println("login unsuccessful");
                     //session.setAttribute("user", username);
                     response.sendRedirect("login.jsp");
            }
            else
            {
                out.println("login unsuccessful");
                //session.setAttribute("user", username);
                response.sendRedirect("login.jsp"); 
            }
    }
}
