<%@page import="java.sql.PreparedStatement"%>
<%@page import="DaoInterface.QueryInterface"%>
<%@page import="DaoImplement.DbConnectionImpl"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aayu</title>
    </head>
    <body>
        <div id="msg"></div>

        <select name="state" id="state" >
            <option value="none" selected disabled hidden>Select Bed No</option>
            <%
                String username1=(String)session.getAttribute("username"); 
                String ward_no=request.getParameter("id");
                System.out.println(ward_no);
                //int id = Integer.parseInt(request.getParameter("id"));
                Connection con=DbConnectionImpl.getConnection();
                PreparedStatement pst = con.prepareStatement(QueryInterface.bed_list);
                pst.setString(1, ward_no);
                
                ResultSet rs = pst.executeQuery();
                
                while (rs.next()) {
            %>
            <option value="<%=rs.getString("bed_no")%>"><%=rs.getString("bed_no")%></option>
            <%
                }
            %>
        </select>

    </body>
</html>
<script>
    $(document).ready(function() {
        $("#bed_no").on("change", function() {
            var bed = $("#bed_no").val();
            if (bed === "")
            {
                $("#msg").html("this is a required.");
                return false;
            }
            else
            {
                $("#msg").html("");
                $.ajax({
                    url: "fetch2.jsp",
                    method: "POST",
                    data: {bed: bed},
                    success: function(data)
                    {
                        $("#suc_msg").html(data);
                    }
                });
            }

        });
    });
</script>