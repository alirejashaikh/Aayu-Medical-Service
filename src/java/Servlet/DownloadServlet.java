package Servlet;


import static com.sun.faces.facelets.util.Path.context;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DownloadServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DownloadServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DownloadServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filename=request.getParameter("filename");
        int len=0;
        
        try(ServletOutputStream out= response.getOutputStream())
        {
            ServletContext context=getServletConfig().getServletContext();
            response.setContentType((context.getMimeType(filename)!= null)? context.getMimeType(filename):"application /pdf");
            response.setHeader("content-disposition", "attachment;filename=\""+filename+"\"");
            InputStream is=context.getResourceAsStream("/"+filename);
            byte[] b=new byte[10000];
            while((is!=null)&&((len=is.read(b)) !=-1))
            {
                out.write(b, 0, len);
            }
            out.flush();
            is.close();
            out.close();
        }
    }

}