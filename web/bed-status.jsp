<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DaoInterface.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="DaoImplement.DbConnectionImpl"%>
<%@page import="DaoInterface.QueryInterface"%>

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
                    class="col-sm-6 col-md-6 custom-register-border d-flex justify-content-center p-0"
                  >
                    <a href="user-register.jsp"
                      ><button
                        type="button"
                        class="btn btn-outline-primary relo"
                      >
                        Register
                      </button>
                    </a>
                  </div>
                  <div
                    class="col-sm-6 col-md-6 d-flex justify-content-center p-0"
                  >
                    <a href="login.jsp"
                      ><button
                        type="button"
                        class="btn btn-outline-primary relo"
                      >
                        Login
                      </button></a
                    >
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
    <!-- Bed status part start -->
    <section class="bed-container-img">
      <img
        src="./images/bed-status-banner.jpg"
        alt="bed-status-image"
        class="img-fluid bed-img"
      />
    </section>
    <section class="bed-container">
      <h3 class="bed-status-text">BED STATUS</h3>
      <div class="container">
        <div class="row bed-status-container">
          <div class="col-sm-4 col-md-4 col-lg-4">
            <img
              src="./images/medical-college.png"
              alt="medical-college-image"
              class="img-fluid h-img"
            />
          </div>
          <div class="col-sm-8 col-md-8 col-lg-8">
            <h1 class="hospital-name">
              <span class="h-name">NAME :&nbsp; &nbsp;</span>MEDICAL COLLEGE
              KOLKATA
            </h1>
            <div class="row">
              <div class="col-sm-2">
                <img
                  src="./images/hospital-address-icon.png"
                  alt=""
                  class="img-fluid hp-icon"
                />
              </div>
              <div class="col-sm-10">
                <h3 class="hospital-address">
                  88,College st,&nbsp;College Square,&nbsp;Kolkata,&nbsp;West
                  Bengal 700 073
                </h3>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-2">
                <img
                  src="./images/contact-icon.png"
                  alt=""
                  class="img-fluid co-icon"
                />
              </div>
              <div class="col-sm-10">
                <h3 class="hospital-address">(033)2286 0033</h3>
              </div>
            </div>
            <h3 class="total_bed_count">
              Total Bed: <span class="total-count">20</span>
            </h3>
                      <h3 class="total_bed_count">Available Bed: <span class="total_available_count">
                
                              <%
                try
                {
                Connection con=DbConnectionImpl.getConnection();
                
                PreparedStatement medical_bed= con.prepareStatement(QueryInterface.Bed_status_medical);
                
                ResultSet rs=medical_bed.executeQuery();
                
                if(rs.next()){
                    String medical_bed_val=rs.getString(1);
                    
                    out.println(medical_bed_val);
                }
                
                }catch(Exception e)
                {}
    %>
                  </span></h3>
          </div>
        </div>
        <div class="row bed-status-container">
          <div class="col-sm-8 col-md-8 col-lg-8">
            <h1 class="hospital-name">
              <span class="h-name">NAME :&nbsp; &nbsp;</span>R G KAR MEDICAL
              COLLEGE
            </h1>
            <div class="row">
              <div class="col-sm-2">
                <img
                  src="./images/hospital-address-icon.png"
                  alt=""
                  class="img-fluid hp-icon"
                />
              </div>
              <div class="col-sm-10">
                <h3 class="hospital-address">
                  1,Khudiram Bose Sarani&nbsp;Kolkata,&nbsp;West Bengal 700 004
                </h3>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-2">
                <img
                  src="./images/contact-icon.png"
                  alt=""
                  class="img-fluid co-icon"
                />
              </div>
              <div class="col-sm-10">
                <h3 class="hospital-address">(033)2555 7656/&nbsp;7675</h3>
              </div>
            </div>
            <h3 class="total_bed_count">
              Total Bed: <span class="total-count">20</span>
            </h3>
                      <h3 class="total_bed_count">Available Bed: <span class="total_available_count">
                <%
                try
                {
                Connection con=DbConnectionImpl.getConnection();
                
                PreparedStatement rgkar_bed= con.prepareStatement(QueryInterface.Bed_status_rgkar);
                
                ResultSet rs=rgkar_bed.executeQuery();
                
                if(rs.next()){
                    String rgkar_bed_val=rs.getString(1);
                    
                    out.println(rgkar_bed_val);
                }
                
                }catch(Exception e)
                {}
    %>
                              
                  </span></h3>
          </div>
          <div class="col-sm-4 col-md-4 col-lg-4">
            <img
              src="./images/RG-kar.png"
              alt="medical-college-image"
              class="img-fluid h-img"
            />
          </div>
        </div>
        <div class="row bed-status-container">
          <div class="col-sm-4 col-md-4 col-lg-4">
            <img
              src="./images/NRS.png"
              alt="medical-college-image"
              class="img-fluid h-img"
            />
          </div>
          <div class="col-sm-8 col-md-8 col-lg-8">
            <h1 class="hospital-name">
              <span class="h-name">NAME :&nbsp; &nbsp;</span>NIL RATAN
              SIRCAR MEDICAL COLLEGE
            </h1>
            <div class="row">
              <div class="col-sm-2">
                <img
                  src="./images/hospital-address-icon.png"
                  alt=""
                  class="img-fluid hp-icon"
                />
              </div>
              <div class="col-sm-10">
                <h3 class="hospital-address">
                  138,AJC Bose Road&nbsp;Kolkata,&nbsp;West Bengal 700 014
                </h3>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-2">
                <img
                  src="./images/contact-icon.png"
                  alt=""
                  class="img-fluid co-icon"
                />
              </div>
              <div class="col-sm-10">
                <h3 class="hospital-address">(033)2286 0033</h3>
              </div>
            </div>
            <h3 class="total_bed_count">
              Total Bed: <span class="total-count">20</span>
            </h3>
                      <h3 class="total_bed_count">Available Bed: <span class="total_available_count">
                <%
                try
                {
                Connection con=DbConnectionImpl.getConnection();
                
                PreparedStatement nrs_bed= con.prepareStatement(QueryInterface.Bed_status_nrs);
                
                ResultSet rs=nrs_bed.executeQuery();
                
                if(rs.next()){
                    String nrs_bed_val=rs.getString(1);
                    
                    out.println(nrs_bed_val);
                }
                
                }catch(Exception e)
                {}
    %>
                              
                  </span></h3>
          </div>
        </div>
        <div class="row bed-status-container">
          <div class="col-sm-8 col-md-8 col-lg-8">
            <h1 class="hospital-name">
              <span class="h-name">NAME :&nbsp; &nbsp;</span>SSKM MEDICAL
              COLLEGE
            </h1>
            <div class="row">
              <div class="col-sm-2">
                <img
                  src="./images/hospital-address-icon.png"
                  alt=""
                  class="img-fluid hp-icon"
                />
              </div>
              <div class="col-sm-10">
                <h3 class="hospital-address">
                  Sskm Hospital road&nbsp;Bhowanipore&nbsp;Kolkata 700 020
                </h3>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-2">
                <img
                  src="./images/contact-icon.png"
                  alt=""
                  class="img-fluid co-icon"
                />
              </div>
              <div class="col-sm-10">
                <h3 class="hospital-address">(033)2204 1100</h3>
              </div>
            </div>
            <h3 class="total_bed_count">
              Total Bed: <span class="total-count">20</span>
            </h3>
                      <h3 class="total_bed_count">Available Bed: <span class="total_available_count">
                <%
                try
                {
                Connection con=DbConnectionImpl.getConnection();

                
                PreparedStatement sskm_bed= con.prepareStatement(QueryInterface.Bed_status_sskm);
                
                ResultSet rs=sskm_bed.executeQuery();
                
                if(rs.next()){
                    String sskm_bed_val=rs.getString(1);
                    
                    out.println(sskm_bed_val);
                }
                
                }catch(Exception e)
                {}
    %>
                  </span></h3>
          </div>
          <div class="col-sm-4 col-md-4 col-lg-4">
            <img
              src="./images/RG-kar.png"
              alt="medical-college-image"
              class="img-fluid h-img"
            />
          </div>
        </div>
        <div class="row bed-status-container">
          <div class="col-sm-4 col-md-4 col-lg-4">
            <img
              src="./images/MR-bangur.png"
              alt="medical-college-image"
              class="img-fluid h-img"
            />
          </div>
          <div class="col-sm-8 col-md-8 col-lg-8">
            <h1 class="hospital-name">
              <span class="h-name">NAME :&nbsp; &nbsp;</span>MR BANGUR HOSPITAL
            </h1>
            <div class="row">
              <div class="col-sm-2">
                <img
                  src="./images/hospital-address-icon.png"
                  alt=""
                  class="img-fluid hp-icon"
                />
              </div>
              <div class="col-sm-10">
                <h3 class="hospital-address">
                  241,Despran Sasmal RD,&nbsp;Netajinagar, Rajendra prasad
                  colony,&nbsp;Tollygunge 700 033
                </h3>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-2">
                <img
                  src="./images/contact-icon.png"
                  alt=""
                  class="img-fluid co-icon"
                />
              </div>
              <div class="col-sm-10">
                <h3 class="hospital-address">088207 02070</h3>
              </div>
            </div>
            <h3 class="total_bed_count">
              Total Bed: <span class="total-count">20</span>
            </h3>
                      <h3 class="total_bed_count">Available Bed: <span class="total_available_count">
                <%
                try
                {
                Connection con=DbConnectionImpl.getConnection();
//                String Bed_status_medical = "SELECT SUM(avialable_bed) as medical_bed FROM ward WHERE hospital_id='2021904'";
                
                PreparedStatement bangur_bed= con.prepareStatement(QueryInterface.Bed_status_bangur);
                
                ResultSet rs=bangur_bed.executeQuery();
                
                if(rs.next()){
                    String bangur_bed_val=rs.getString(1);
                    
                    out.println(bangur_bed_val);
                }
                
                }catch(Exception e)
                {}
                %>
                  </span></h3>
          </div>
        </div>
      </div>
    </section>
    <!-- Bed status part end -->
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
              <a href="Bed Status.jsp">Bed Status</a>
            </li>
            <li class="imp-links-item">
              <a href="opd.jsp">Opd</a>
            </li>
            <li class="imp-links-item">
              <a href="about-us.jsp">About us</a>
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
