package Servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import POJO.FeedbackBean;
import DaoImplement.FeedbackDao;

@WebServlet("/index")
public class FeedbackServlet extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String name = request.getParameter("name");
        String email= request.getParameter("email");
        String mob_number = request.getParameter("mob_number");
        String rating = request.getParameter("rating");
        
        FeedbackBean feedbackBean = new FeedbackBean();

        feedbackBean.setName(name);
        feedbackBean.setEmail(email);
        feedbackBean.setMob_no(mob_number);
        feedbackBean.setRate(rating);
        
        System.out.println(feedbackBean);

        FeedbackDao feedbackDao = new FeedbackDao();
       String insertValidate = feedbackDao.chkinsrt(feedbackBean);
       System.out.print(insertValidate);
       if(insertValidate.equals("SUCCESS"))
       {
           System.out.println("Query run successfully!!");
           request.setAttribute("InsertSuccessmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
           rd.forward(request, response);
       }
       else{
           request.setAttribute("InsertErrmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
           rd.include(request, response);
       }
    }
}
