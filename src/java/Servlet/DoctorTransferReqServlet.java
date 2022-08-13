
package Servlet;

import DaoImplement.DoctorTransferReqDao;
import POJO.DoctorTransferReqBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/doctor_applying_transfer_request")
public class DoctorTransferReqServlet extends HttpServlet {

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
        
        
        DoctorTransferReqBean doctorTransferReqBean = new DoctorTransferReqBean();
        doctorTransferReqBean.setHospital_name(hospital_name);
        doctorTransferReqBean.setUrgent(urgent);
        doctorTransferReqBean.setProblem(problem);
        doctorTransferReqBean.setReason(reason);
        doctorTransferReqBean.setUsername(username);
        doctorTransferReqBean.setHospital_id(hospital_id);
        
        
        System.out.println(doctorTransferReqBean);

        DoctorTransferReqDao doctorTransferReqDao = new DoctorTransferReqDao();
       String insertValidate = doctorTransferReqDao.chkinsrt(doctorTransferReqBean);
       System.out.print(insertValidate);
       if(insertValidate.equals("SUCCESS"))
       {
           System.out.println("Query run successfully!!");
           request.setAttribute("InsertSuccessmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("doctor-login.jsp");
           rd.forward(request, response);
       }
       else{
           request.setAttribute("InsertErrmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("doctor-applying-transfer-request.jsp");
           rd.include(request, response);
       }
    }
}
