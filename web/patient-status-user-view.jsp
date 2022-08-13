<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DaoInterface.QueryInterface"%>
<%@page import="DaoImplement.DbConnectionImpl"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
              <a href="index.html"
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
    <!-- patient-status part -->
    <section class="doctor-add">
        <%   
            String username1=(String)session.getAttribute("username");  
        
            try
            {
                Connection con=DbConnectionImpl.getConnection();
                PreparedStatement username= con.prepareStatement(QueryInterface.fetch_patient_id_with_mail);
                username.setString(1, username1);
                System.out.println(username);
                ResultSet rs1 = username.executeQuery();
                if(rs1.next())
                {
                    String p_id=rs1.getString(1);

                PreparedStatement status= con.prepareStatement(QueryInterface.Patient_Status_view);
                PreparedStatement birth = con.prepareStatement(QueryInterface.dob);
                birth.setString(1, p_id);
                ResultSet rs9= birth.executeQuery();
                status.setString(1, p_id);
                
                System.out.println(status);
                ResultSet rs= status.executeQuery();

                
        %>    
       <div class="container-fluid">
        <div class="row justify-content-center text-center">
          <h3 class="add-doctor">PATIENT STATUS</h3>
        </div>
      </div>
    </section>
    <section class="patient-statusform">
        <%
            if(rs.next())
                {
        %>
      <div class="row m-0">
        <div class="container">
          <div class="col-sm-12 col-md-12 col-lg-12 patient-status-img">
            <div class="row">
              <div class="col-sm-4 col-md-4 col-lg-4"></div>
              <div class="col-sm-8 col-md-8 col-lg-8 patient-status-con">
                <div class="row mt-2 patient-c">
                  <span class="potext">Ward Number :</span>
                  <span class="pobox"> 
                  <%
                        String ward=rs.getString("ward_no");
                        System.out.println(ward);
                        out.println(ward);
                  %>
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <span class="potext">Bed Number :</span>
                  <span class="pobox">
                      <%
                        String bed=rs.getString("bed_no");
                        
                        System.out.println(bed);
                        out.println(bed);
                  %>
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <span class="potext">Patient ID :</span>
                  <span class="pobox">
                     <%
                        
                        System.out.println(p_id);
                    
                        out.println(p_id);
                  %> 
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <span class="potext">Patient Name :</span>
                  <span class="pobox">
                    <%
                        String full_name=rs.getString("full_name");
                        System.out.println(full_name);
                        out.println(full_name.toUpperCase());
                        
                  %>  
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <span class="potext">Patient Age :</span>
                  <span class="pobox">
                      <%
                          
                        if(rs9.next())
                        {
                            String dob=rs9.getString("dob");
                            LocalDate dateob = LocalDate.parse(dob);
                            System.out.println(dob);
                            LocalDate curDate = LocalDate.now();
                            int age = Period.between(dateob, curDate).getYears();

                            out.println(age);
                        }

                        
                  %>
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <h3 class="patient-obs">OBSERVATION</h3>
                </div>
                <div class="row mt-5 patient-c">
                  <span class="potext">Blood Pressure :</span>
                  <span class="pobox">
                      <%
                                
                        String blood_pressure=rs.getString("blood_pressure");
                        System.out.println(blood_pressure);
                        out.println(blood_pressure);
                  %>
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <span class="potext">Oxygen level :</span>
                  <span class="pobox">
                      <%
                        String oxygen_level=rs.getString("oxygen_level");
                        System.out.println(oxygen_level);
                        out.println(oxygen_level);
                  %>
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <span class="potext">Pulse Rate :</span>
                  <span class="pobox">
                      <%
                        String pulse_rate=rs.getString("pulse_rate");
                        System.out.println(pulse_rate);
                        out.println(pulse_rate);
                  %>
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <span class="potext">Remarks :</span>
                  <span class="pobox">
                      <%
                        String remarks=rs.getString("remarks");
                        System.out.println(remarks);
                        out.println(remarks.toUpperCase());
                        %>
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
        <%
                }
                else{
        %>
        <section class="patient-statusform">
      <div class="row m-0">
        <div class="container">
          <div class="col-sm-12 col-md-12 col-lg-12 patient-status-img">
            <div class="row">
              <div class="col-sm-4 col-md-4 col-lg-4"></div>
              <div class="col-sm-8 col-md-8 col-lg-8 patient-status-con">
                <div class="row mt-2 patient-c">
                  <span class="potext">Ward Number :</span>
                  <span class="pobox"> 
                  <%
                        out.println("NIL");
                  %>
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <span class="potext">Bed Number :</span>
                  <span class="pobox">
                  <%
                        out.println("NIL");
                  %>
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <span class="potext">Patient ID :</span>
                  <span class="pobox">
                    <%
                        out.println("NIL");
                  %> 
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <span class="potext">Patient Name :</span>
                  <span class="pobox">
                    <%
                        out.println("NIL");
                  %>  
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <span class="potext">Patient Age :</span>
                  <span class="pobox">
                      <%
                        out.println("NIL");
                  %>
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <h3 class="patient-obs">OBSERVATION</h3>
                </div>
                <div class="row mt-5 patient-c">
                  <span class="potext">Blood Pressure :</span>
                  <span class="pobox">
                      <%
                        out.println("NIL");
                  %>
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <span class="potext">Oxygen level :</span>
                  <span class="pobox">
                      <%
                        out.println("NIL");
                  %>
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <span class="potext">Pulse Rate :</span>
                  <span class="pobox">
                      <%
                        out.println("NIL");
                  %>
                  </span>
                </div>
                <div class="row mt-2 patient-c">
                  <span class="potext">Remarks :</span>
                  <span class="pobox">
                      <%
                        out.println("NIL");
                  %>
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>                
        <%
        }
            }

            }catch(Exception e)
            {}
        %>
    <!-- patient status part end -->
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
    <script src="js/main.js"></script>
    <script src="js/star-ratings.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
  </body>
</html>
