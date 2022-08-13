package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

import POJO.AddNoticeBean;
import DaoImplement.AddNoticeDao;


@WebServlet("/add-notice")

public class Publish_Notice_Servlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String notice1 = request.getParameter("notice");
        String notice = notice1.toUpperCase();
        
        AddNoticeBean addNoticeBean = new AddNoticeBean();

        addNoticeBean.setNotice(notice);
        
        System.out.println(addNoticeBean);

        AddNoticeDao addNoticeDao = new AddNoticeDao();
       String insertValidate = addNoticeDao.chkinsrt(addNoticeBean);
       System.out.print(insertValidate);
       if(insertValidate.equals("SUCCESS"))
       {
           System.out.println("Query run successfully!!");
           request.setAttribute("InsertSuccessmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("admin-panel-login.jsp");
           rd.forward(request, response);
       }
       else
       {
           request.setAttribute("InsertErrmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("add-notice.jsp");
           rd.include(request, response);
       }
    }
}
