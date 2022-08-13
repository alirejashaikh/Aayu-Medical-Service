package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

import POJO.PatientTransferApprovalBean;
import DaoImplement.PatientTransferApprovalDao;

@WebServlet("/patient-transfer")
/**
 *
 * @author Souvik
 */
public class PatientTransferApprovalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String patient_id = request.getParameter("patient_id");
        String action = request.getParameter("action");
        String review = request.getParameter("review");
        String new_hospital_id = request.getParameter("hospital_id");
        System.out.println("review : "+review);
        
        PatientTransferApprovalBean patientTransferApprovalBean = new PatientTransferApprovalBean();

        patientTransferApprovalBean.setAction(action);
        patientTransferApprovalBean.setPatient_id(patient_id);
        patientTransferApprovalBean.setReview(review);
        patientTransferApprovalBean.setNew_hospital_id(new_hospital_id);
        
        System.out.println(patientTransferApprovalBean);

        PatientTransferApprovalDao patientTransferApprovalDao = new PatientTransferApprovalDao();
       String insertValidate = patientTransferApprovalDao.chkinsrt(patientTransferApprovalBean);
       System.out.print(insertValidate);
       if(insertValidate.equals("SUCCESS"))
       {
           System.out.println("Query run successfully!!");
           request.setAttribute("InsertSuccessmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("patient-transfer.jsp");
           rd.forward(request, response);
       }
       else
       {
           request.setAttribute("InsertErrmsg",insertValidate);
           RequestDispatcher rd = request.getRequestDispatcher("admin-panel-login.jsp");
           rd.include(request, response);
       }
    }
}
