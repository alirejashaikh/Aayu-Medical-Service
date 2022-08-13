<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DaoInterface.QueryInterface"%>
<%@page import="DaoImplement.DbConnectionImpl"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Aayu</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="./css/style.css" class="rel" />
  </head>
  <body>
    <header>
      <!-- top header section -->
      <section class="top-header">
        <div class="container-fluid">
          <div class="row mt-2">
            <div class="col-sm-2 col-md-2 text-center">
              <a href="index.jsp"
                ><img src="./images/logo.png" class="img-fluid" alt="Logo"
              /></a>
            </div>
            <div class="col-sm-6 col-md-6 text-center">
              <h1 class="web-heading">AAYU MEDICAL SERVICE</h1>
            </div>
            <div class="col-sm-4 col-md-4 text-center">
              <div
                class="col-sm-12 col-sm-12 custom-border d-flex justify-content-center"
              >
                <h2 class="customer-care">
                  <span
                    ><img
                      src="./images/24 7.png"
                      alt="24*7 logo"
                      class="img-fluid mr-2 cimg" /></span
                  >Customer Care
                </h2>
              </div>
              <div class="col-sm-12 col-md-12">
                <div class="row">
                  <div
                    class="col-sm-2 col-md-4 col-lg-2 custom-register-border d-flex justify-content-center p-0 mt-1"
                  >
                    <a href=""
                      ><img
                        src="./images/noti-icon.png"
                        alt=""
                        class="img-fluid"
                    /></a>
                  </div>
                  <div
                    class="col-sm-5 col-md-5 custom-register-border d-flex justify-content-center p-0"
                  >
                    <a href="admin-panel-login.jsp"
                      ><button
                        type="button"
                        class="btn btn-outline-primary relo"
                      >
                        Dashboard
                      </button>
                    </a>
                  </div>
                  <div
                    class="col-sm-5 col-md-5 d-flex justify-content-center p-0"
                  >
<!--                    &nbsp;&nbsp;
                    &nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
                    <a href="logout.jsp"
                      ><button
                        type="submit"
                        class="btn btn-outline-primary relo"
                      >
                        Log Out
                      </button>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </header>
    <!-- top header end -->
    <!-- navbar start -->
    <div class="nav-container">
      <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <button
            class="navbar-toggler ml-auto"
            type="button"
            data-toggle="collapse"
            data-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div
            class="collapse navbar-collapse justify-content-center"
            id="navbarNav"
          >
            <ul class="navbar-nav d-flex align-items-center nav-fill w-100">
              <li class="nav-item">
                <a class="nav-link" href="index.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about-us.jsp">About us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="blog.jsp">Blog</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="opd.jsp">Opd</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="bed-status.jsp">Bed Status</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="gallery.jsp">Gallery</a>
              </li>
            </ul>
          </div>
        </nav>
      </div>
    </div>
    <!-- navbar end -->
    <!-- heading area -->
    <section class="doctor-add">
      <div class="container-fluid">
        <div class="row justify-content-center text-center">
          <h3 class="add-doctor">EMPLOYEE TRANSFER</h3>
        </div>
      </div>
    </section>
    <!-- heading area end -->
    <!-- transfer area -->
    <div class="prescription-table">
        <div class="container-fluid">
          <section class="row justify-content-center text-center">
              <%   
                    try
                    {
                        String role="";
                        String employee_name="";
                        String hospital_name="";
                        Connection con=DbConnectionImpl.getConnection();
                        PreparedStatement fetch_transfer_request= con.prepareStatement(QueryInterface.fetch_transfer_request);
                        
                        System.out.println(fetch_transfer_request);
                        ResultSet rs = fetch_transfer_request.executeQuery();
            %>
              <table class="table p-table">
                    <thead class="tbl-head">
                        <tr class="tbl-head">
                            <th scope="col" class="tbl-head">EMPLOYEE ID</th>
                            <th scope="col" class="tbl-head">EMPLOYEE NAME</th>
                            <th scope="col" class="tbl-head">CURRENT HOSPITAL</th>
                            <th scope="col" class="tbl-head">NEW HOSPITAL</th>
                            <th scope="col" class="tbl-head">URGENCY</th>
                            <th scope="col" class="tbl-head">PROBLEM</th>
                            <th scope="col" class="tbl-head">REASON</th>
                            <th scope="col" class="tbl-head">TRANSFER TYPE</th>
                            <th scope="col" class="tbl-head">REVIEW</th>
                            <th scope="col" class="tbl-head">ACTION</th>
                            
                        </tr>
                    </thead>
                    <form name="form"  action="TransferApprovalServlet" method="post">
                    <tbody class="tbl-head">
                        <%
                            if(rs.next())
                            {
                                rs.previous();
                                while(rs.next())
                                {
                                String employee_id = rs.getString("employee_id");
                                PreparedStatement fetch_role = con.prepareStatement(QueryInterface.fetch_role_with_emp_id);
                                fetch_role.setString(1, employee_id);
                                
                                System.out.println(fetch_role);
                                ResultSet rs1 = fetch_role.executeQuery();
                                if(rs1.next())
                                {
                                    role = rs1.getString("job_role");
                                }
                                if(role.equals("doctor"))
                                {
                                    PreparedStatement fetch_employee = con.prepareStatement(QueryInterface.fetch_doctor_details);
                                    fetch_employee.setString(1, employee_id);

                                    System.out.println(fetch_employee);
                                    ResultSet rs2 = fetch_employee.executeQuery();
                                    if(rs2.next())
                                    {
                                        employee_name = rs2.getString("doctor_name");
                                    }
                                    
                                    PreparedStatement fetch_hospital_name = con.prepareStatement(QueryInterface.fetch_hospital_name_with_doctor_emp_id);
                                    fetch_hospital_name.setString(1, employee_id);

                                    System.out.println(fetch_hospital_name);
                                    ResultSet rs3 = fetch_hospital_name.executeQuery();
                                    if(rs3.next())
                                    {
                                        hospital_name = rs3.getString("hospital_name");
                                    }
                                }
                                else if(role.equals("nurse"))
                                {
                                    PreparedStatement fetch_employee = con.prepareStatement(QueryInterface.fetch_nurse_details);
                                    fetch_employee.setString(1, employee_id);

                                    System.out.println(fetch_employee);
                                    ResultSet rs2 = fetch_employee.executeQuery();
                                    
                                    PreparedStatement fetch_hospital_name = con.prepareStatement(QueryInterface.fetch_hospital_name);
                                    fetch_hospital_name.setString(1, employee_id);

                                    System.out.println(fetch_hospital_name);
                                    ResultSet rs3 = fetch_hospital_name.executeQuery();
                                    if(rs2.next())
                                    {
                                        employee_name = rs2.getString("name");
                                    }
                                    if(rs3.next())
                                    {
                                        hospital_name = rs3.getString("hospital_name");
                                    }
                                }
                        %>
                    
                        <tr class="tbl-head">
                            <td class="tbl-head">
                                <input type="none" hidden name="employee_id" value=<%=employee_id%>>
                                <span>
                                    <%
                                        System.out.println(employee_id);
                                        out.println(employee_id);
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <span>
                                    <%
                                        System.out.println(employee_name);
                                        out.println(employee_name);
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <span>
                                    <%
                                        System.out.println(hospital_name);
                                        out.println(hospital_name);
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <span>
                                    <input type="none" hidden name="new_hospital_id" value=<%=rs.getString("new_hospital_id")%>>
                                    <%
                                        System.out.println(rs.getString("new_hospital_name"));
                                        out.println(rs.getString("new_hospital_name"));
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <span>
                                    <%
                                        System.out.println(rs.getString("urgent"));
                                        out.println(rs.getString("urgent"));
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <span>
                                    <%
                                        System.out.println(rs.getString("problem"));
                                        out.println(rs.getString("problem"));
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <span>
                                    <%
                                        System.out.println(rs.getString("reason"));
                                        out.println(rs.getString("reason"));
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <span>
                                    <%
                                        System.out.println(rs.getString("transfer_type"));
                                        out.println(rs.getString("transfer_type"));
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <input type="text" name="review" placeholder="              Write a review" class="transfer-review">
                            </td>
                            <td class="tbl-head">
                                
                                <button type="submit" name="action" value="ACCEPTED" class="transfer-review">
                                    <img src="./images/accept icon.png" alt="">
                                </button>
                                <button type="submit" name="action" value="DECLINED" class="transfer-review">
                                    <img src="./images/decline-icon.png" alt="">
                                </button>
                            </td>
                        </tr>
                        <%}%>
                    
                        <%
                            }
                            else{
                        %>
                        <tr class="tbl-head">
                            <td class="tbl-head">
                                <span>
                                    <%
                                        out.println("NIL");
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <span>
                                    <%
                                        out.println("NIL");
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <span>
                                    <%
                                        out.println("NIL");
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <span>
                                    <%
                                        out.println("NIL");
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <span>
                                    <%
                                        out.println("NIL");
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <span>
                                    <%
                                        out.println("NIL");
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <span>
                                    <%
                                        out.println("NIL");
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <span>
                                    <%
                                        out.println("NIL");
                                    %>
                                </span>
                            </td>
                            <td class="tbl-head">
                                <%
                                    out.println("NIL");
                                %>
                            </td>
                            <td class="tbl-head">
                              <button type="submit" name="action" value="ACCEPTED" class="transfer-review">
                                    <img src="./images/accept icon.png" alt="">
                                </button>
                                <button type="submit" name="action" value="DECLINED" class="transfer-review">
                                    <img src="./images/decline-icon.png" alt="">
                                </button>
                            </td>
                        </tr>
                    </tbody>
                    </form>
                </table>
                <%
                    }
                    }catch(Exception e)
                    {}
                %>
          </section>
        </div>
    </div>
    <!-- footer part start -->
    

    <!-- footer part end -->
    <script src="js/main.js"></script>
    <script src="js/star-ratings.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
  </body>
</html>
