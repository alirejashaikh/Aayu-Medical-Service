package Servlet;

import DaoImplement.NurseTransferReqDao;
import POJO.NurseTransferReqBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/nurse_applying_transfer_request")
public class NurseTransferReqServlet extends HttpServlet {

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String hospital = request.getParameter("hospital_name");
        String[] values=hospital.split(":");
        String hospital_id= values[0];
        String hospital_name = values[1];
        String urgent= request.getParameter("urgent");
        String problem= request.getParameter("problem");
        String reason= request.getParameter("reason");
        String username=request.getParameter("username"); 
        
        
        NurseTransferReqBean nurseTransferReqBean = new NurseTransferReqBean();
        nurseTransferReqBean.setHospital_name(hospital_name);
        nurseTransferReqBean.setUrgent(urgent);
        nurseTransferReqBean.setProblem(problem);
        nurseTransferReqBean.setReason(reason);
        nurseTransferReqBean.setUsername(username);
        nurseTransferReqBean.setHospital_id(hospital_id);
        
        
        System.out.println(nurseTransferReqBean);

        NurseTransferReqDao nurseTransferReqDao = new NurseTransferReqDao();
       String insertValidate = nurseTransferReqDao.chkinsrt(nurseTransferReqBean);
       System.out.print(insertValidate);
       if(insertValidate.equals("SUCCESS"))
       {
           System.out.println("Query run successfully!!");
           request.setAttribute("InsertSuccessmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("Nurse.jsp");
           rd.forward(request, response);
       }
       else{
           request.setAttribute("InsertErrmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("nurse-applying-transfer-request.jsp");
           rd.include(request, response);
       }
    }
}
