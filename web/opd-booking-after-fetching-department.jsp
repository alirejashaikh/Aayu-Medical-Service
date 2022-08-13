<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DaoInterface.QueryInterface"%>
<%@page import="DaoImplement.DbConnectionImpl"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
                 <a href="user-login-step1.jsp"
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
    <!-- login part start -->

    <div class="login-form">
      <div class="row m-0 align-items-center">
        <div class="col-sm-6 col-md-6 col-lg-6 text-center">
          <img src="./images/opd_doctor_patient.png" alt="" class="img-fluid" />
        </div>
        <div class="col-sm-6 col-md-6 col-lg-6 login-form-textplace">
          <h2 class="Loginclass">Book An OPD</h2>
          <form >
            <% 
                try{
                    Connection con=DbConnectionImpl.getConnection(); 
                    String hospital_id = (String)session.getAttribute("hospital_id");
                    String department_id = (String)session.getAttribute("department_id");
                    System.out.println("hospital "+hospital_id+"department : "+department_id);
                    PreparedStatement fetch_hospital_id= con.prepareStatement(QueryInterface.hospital_name_with_id);
                    fetch_hospital_id.setString(1, hospital_id);
                    
                    PreparedStatement fetch_department = con.prepareStatement(QueryInterface.department_name_with_id);
                    fetch_department.setString(1, department_id);
                    
                    PreparedStatement fetch_doctors = con.prepareStatement(QueryInterface.doctor_list_with_hospital_id_department_id);
                    fetch_doctors.setString(1, hospital_id);
                    fetch_doctors.setString(2, department_id);
                    
                    ResultSet rs = fetch_department.executeQuery();
                    ResultSet rs1=fetch_hospital_id.executeQuery();
                    ResultSet rs2=fetch_doctors.executeQuery();
                    
                    if(rs.next() && rs1.next())
                    {
            %>
            <div class="form-group row">
              <label for="inputEmail3" class="col-sm-2 col-form-label form-text"
                >Hospital</label
              >
              <div class="col-sm-10">
                <div class="view-item-doctor"> 
                    <input type="none" hidden name='hospital_id' value="<%=hospital_id%>">
                    <span>
                       <%
                           out.println(rs1.getString("hospital_name"));
                       %> 
                    </span>
                </div>
              </div>
            </div>
            <div class="form-group row">
              <label
                for="inputPassword3"
                class="col-sm-2 col-form-label form-text"
                >Department</label
              >
              <div class="col-sm-7">
                <div class="view-item-doctor"> 
                    <input type="none" hidden name='department_id' value="<%=department_id%>">
                    <span>
                       <%
                           out.println(rs.getString("department_name"));
                       %> 
                    </span>
                </div>
              </div>
                <div class="col-sm-3 col-md-3 col-lg-3">
                      <a href="opd-booking.jsp">
                          <button
                          type="button"
                          id="fetch_bed"
                          class="btn btn-primary fetch-bed-button"
                            >
                          CHANGE
                            </button>
                      </a>
                </div>
            </div>
          <div class="form-group row">
              <label
                for="inputPassword3"
                class="col-sm-2 col-form-label form-text"
                >Doctor</label
              >
              <div class="col-sm-10">
                <select name="department_id" class="form-control form-textplace">
                    <option value="none" selected disabled hidden>Select Doctor</option>
                    <%  while(rs2.next()){ %>
                    <option value="none" selected disabled hidden>Select Doctor</option>
                    <option value="<%=rs2.getString("employee_id")%>"><%=rs2.getString("doctor_name")%></option>
                    <%}%>
                </select>
              </div>
            </div>
            <div class="form-group row">
              <label
                for="inputPassword3"
                class="col-sm-2 col-form-label form-text"
                >Date</label
              >
              <div class="col-sm-10">
                <input
                  type="date"
                  name="date"
                  class="form-control form-textplace"
                  id="inputPassword3"
                />
              </div>
            </div>
            <div class="row m-0 lbtn">
              <div class="col-sm-12 login-button-size">
                <button type="submit" class="btn btn-primary login-button px-3">
                  Book
                </button>
              </div>
            </div>
            <%
                        }
                    }
                    catch(Exception e)
                    {
                         out.println("wrong entry"+e);
                    }
            %>
            </form>
        </div>
      </div>
    </div>

    <!-- login part end -->
    <!-- footer part start -->
    <section class="footer">
      <div class="row m-0">
        <div class="col-sm-4 col-md-4 col-lg-4 m-0 p-0">
          <iframe
            src="https://www.google.com/maps/d/u/1/embed?mid=1nxe0vbej3CDV12b-g_wSe_ajhOEOwezT"
            class="mapss"
          ></iframe>
        </div>
        <div class="col-sm-4 col-md-4 col-lg-4">
          <h2 class="footer-contact">Contact Us</h2>
          <h4 class="footer-email">
            <a href="mailto:aayumedicalservice@gmail.com" class="href"
              ><span class="space pr-2"
                ><i class="fa fa-envelope-o" aria-hidden="true"></i></span
              >Email us</a
            >
          </h4>
          <h4 class="footer-call">
            <a href="tel:033 2995 4686" class="href"
              ><span class="space pr-2"
                ><i class="fa fa-phone" aria-hidden="true"></i></span
              >033 2995 4686</a
            >
          </h4>
          <h2 class="footer-fos">Follow us at :</h2>
          <h2 class="footer-logo">
            <i class="fa fa-facebook fab" aria-hidden="true"></i
            >&nbsp;&nbsp;&nbsp;<i
              class="fa fa-instagram ins"
              aria-hidden="true"
            ></i
            >&nbsp;&nbsp;
            <i class="fa fa-twitter fal" aria-hidden="true"></i>
          </h2>
        </div>
        <div class="col-sm-4 col-md-4 col-lg-4">
          <h3 class="quick">Quick Links</h3>
          <ul class="imp-links">
            <li class="imp-links-item">
              <a href="#">My Profile</a>
            </li>
            <li class="imp-links-item">
              <a href="patient_Status.jsp">patient Status</a>
            </li>
            <li class="imp-links-item">
              <a href="Bed_Booking.jsp">Bed Booking</a>
            </li>
            <li class="imp-links-item">
              <a href="opd.jsp">Opd</a>
            </li>
            <li class="imp-links-item">
              <a href="about-us.jps">About us</a>
            </li>
            <li class="imp-links-item">
              <a href="#">Privacy Policy</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="row m-0 copyborder">
        <div class="col-sm-12 col-md-12 col-lg-12">
          <h3 class="copyrights">
            <i class="fa fa-copyright" aria-hidden="true"></i>
            <script>
              document.write(new Date().getFullYear());
            </script>
            Aayu Medical Service.All Rights Reserved
          </h3>
        </div>
      </div>
    </section>
    <!-- footer part end -->

    <script src="js/star-ratings.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
  </body>
</html>
