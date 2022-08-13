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
          <h3 class="add-doctor">NURSE DETAILS</h3>
        </div>
      </div>
    </section>
    <!-- heading area end -->
    <!-- NURSE details area part start -->
    <section class="doctor-details-area nurse-view-image">
        
        <%   
            String employee_id = (String)request.getAttribute("employee_id");
            System.out.println(employee_id);
        
            try
            {
                Connection con=DbConnectionImpl.getConnection();
                PreparedStatement pst= con.prepareStatement(QueryInterface.fetch_nurse_details);
                pst.setString(1, employee_id);
                System.out.println(pst);
                ResultSet rs = pst.executeQuery();
                
                PreparedStatement pst1= con.prepareStatement(QueryInterface.fetch_hospital_name);
                pst1.setString(1, employee_id);
                System.out.println(pst1);
                ResultSet rs1 = pst1.executeQuery();
                
                if(rs.next())
                {
        %>
        
      <div class="container">
        <div class="row">
          <div class="doctor-details-view-part">
            <div class="row nurse-view-sec">
              <div class="col-sm-4 col-md-4 col-lg-4">
                <label for="inputEmail3" class="col-form-label"
                  >Nurse Name:
                </label>
              </div>
              <div class="col-sm-6 col-md-6 col-lg-6">
                  <div class="view-item-doctor"><span>
                        <%
                            String name=rs.getString("name");
                            System.out.println(name);
                            out.println(name.toUpperCase());
                        %>
                      </span></div>
                       </div>
            </div>
            <div class="row nurse-view-sec">
              <div class="col-sm-4 col-md-4 col-lg-4">
                <label for="inputEmail3" class="col-form-label"
                  >Hospital Name:
                </label>
              </div>
              <div class="col-sm-6 col-md-6 col-lg-6">
                  <div class="view-item-doctor"><span>
                      <%
                        if(rs1.next())
                            {
                            String hospital_name=rs1.getString("hospital_name");
                            System.out.println(hospital_name);
                            out.println(hospital_name.toUpperCase());
                            }
                        %>
                      </span></div>
              </div>
            </div>
            <div class="row nurse-view-sec">
              <div class="col-sm-4 col-md-4 col-lg-4">
                <label for="inputEmail3" class="col-form-label"
                  >Mobile No:
                </label>
              </div>
              <div class="col-sm-6 col-md-6 col-lg-6">
                  <div class="view-item-doctor"><span>
                        <%
                            String mobile_no=rs.getString("mobile_no");
                            System.out.println(mobile_no);
                            out.println(mobile_no);
                        %>
                      </span></div>
                       </div>
            </div>
            <div class="row nurse-view-sec">
              <div class="col-sm-4 col-md-4 col-lg-4">
                <label for="inputEmail3" class="col-form-label"
                  >Email ID:
                </label>
              </div>
              <div class="col-sm-6 col-md-6 col-lg-6">
                  <div class="view-item-doctor"><span>
                        <%
                            String email_id=rs.getString("email_id");
                            System.out.println(email_id);
                            out.println(email_id);
                        %>
                      </span></div>
                       </div>
            </div>
            <div class="row nurse-view-sec">
              <div class="col-sm-4 col-md-4 col-lg-4">
                <label for="inputEmail3" class="col-form-label"
                  >Ward Number:
                </label>
              </div>
              <div class="col-sm-6 col-md-6 col-lg-6">
                  <div class="view-item-doctor"><span>
                      <%
                            String ward=rs.getString("ward_no");
                            System.out.println(ward);
                            out.println(ward);
                        %>
                      </span></div>
              </div>
            </div>
            
            <div class="row nurse-view-sec">
              <div class="col-sm-4 col-md-4 col-lg-4">
                <label for="inputEmail3" class="col-form-label">Shift: </label>
              </div>
              <div class="col-sm-6 col-md-6 col-lg-6">
                  <div class="view-item-doctor"><span>
                      <%
                            String shift=rs.getString("shift");
                            System.out.println(shift);
                            out.println(shift.toUpperCase());
                        %>
                      </span></div>
              </div>
            </div>
          </div>
        </div>
      </div>
                      <%
                }
            }catch(Exception e)
            {}
        %>
    </section>
    <!-- Nurse details area part end -->
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
              <a href="#">patient Status</a>
            </li>
            <li class="imp-links-item">
              <a href="#">Bed Booking</a>
            </li>
            <li class="imp-links-item">
              <a href="#">Opd</a>
            </li>
            <li class="imp-links-item">
              <a href="#">About us</a>
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
