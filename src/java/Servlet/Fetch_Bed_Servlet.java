package Servlet;

import DaoImplement.DbConnectionImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

import POJO.Patient_Details_Update_Bean;
import DaoImplement.Patient_Details_Update_Dao;
import DaoInterface.QueryInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet("/update-patient-details")

public class Fetch_Bed_Servlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String patient_id = "";
        String admit_date ="";
        String ward_no = "";
        ArrayList bed = new ArrayList();
        try{
        Connection con=DbConnectionImpl.getConnection();
        
        
        ward_no = request.getParameter("ward_no");
        patient_id = request.getParameter("patient_id");
        admit_date = request.getParameter("admit_date");
        
        System.out.println(ward_no);
        PreparedStatement pst = con.prepareStatement(QueryInterface.bed_list);
        pst.setString(1, ward_no);

        System.out.println(pst);

        ResultSet rs = pst.executeQuery();
        while(rs.next())
        {
            bed.add(rs.getString("bed_no"));
        }
        System.out.println(bed);
        }
        catch(Exception e)
        {
             System.out.println("wrong entry"+e);
        }
       
       if(bed.isEmpty()==false)
       {
           System.out.println("Query run successfully!!");
//           request.setAttribute("bed",bed);
           request.setAttribute("patient_id",patient_id);
           request.setAttribute("admit_date",admit_date);
           request.setAttribute("ward_no",ward_no);
           
           RequestDispatcher rd = request.getRequestDispatcher("update-patient-details-after-fetching-bed.jsp");
           rd.forward(request, response);
       }
       else{
           request.setAttribute("bed",bed);
           RequestDispatcher rd = request.getRequestDispatcher("update-patient-details.jsp");
           rd.include(request, response);
       }
    }
}
