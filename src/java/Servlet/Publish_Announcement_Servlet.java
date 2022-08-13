package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

import POJO.AddAnnouncementBean;
import DaoImplement.AddAnnouncementDao;


@WebServlet("/add-announcement")

public class Publish_Announcement_Servlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String Announcement1 = request.getParameter("announcement");
        String Announcement = Announcement1.toUpperCase();
        
        AddAnnouncementBean addAnnouncementBean = new AddAnnouncementBean();

        addAnnouncementBean.setAnnouncement(Announcement);
        
        System.out.println(addAnnouncementBean);

        AddAnnouncementDao addAnnouncementDao = new AddAnnouncementDao();
       String insertValidate = addAnnouncementDao.chkinsrt(addAnnouncementBean);
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
           RequestDispatcher rd = request.getRequestDispatcher("add-announcement.jsp");
           rd.include(request, response);
       }
    }

}
