<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DaoInterface.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="DaoImplement.DbConnectionImpl"%>
<%@page import="DaoInterface.QueryInterface"%>
<%@page import="DaoImplement.LoginDao"%>

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
                    <a href="Nurse.jsp"
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
                <a class="nav-link" href="bed status.jsp">Bed Status</a>
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
    <!-- Blood banner part start -->
    <section class="blood-banner">
      <img
        src="./images/BLOOD GRP BANNER.jpg"
        alt="Blood group banner"
        class="img-fluid blood-banner-img"
      />
    </section>
    <!-- blood banner part end  -->
    <!-- blood divison part -->
    <section class="blood-category">
       <%   
  
            String username1=(String)session.getAttribute("username");  
              

        %>   
      <div class="container">
        <div class="row">
          <div class="col-sm-3 col-md-3 col-lg-3 text-center">
            <figure class="blood-category-img-part">
              <img src="./images/Ap.jpg" alt="" class="img-fluid" />
            </figure>
            <h4 class="blood-available">Available:
                <span>
                        <%
                            try
                        {
                        Connection con=DbConnectionImpl.getConnection();

                        PreparedStatement a_pos= con.prepareStatement(QueryInterface.A_pos_Blood_Availability);
                        a_pos.setString(1, username1);
                        System.out.println(a_pos);
                        ResultSet rs= a_pos.executeQuery();

                        if(rs.next()){
                            String a_pos_blood_val=rs.getString(1);

                            out.println(a_pos_blood_val);
                        }

                        }catch(Exception e)
                        {}
                        %>
                </span>
            </h4>
          </div>
          <div class="col-sm-3 col-md-3 col-lg-3 text-center">
            <figure class="blood-category-img-part">
              <img src="./images/A-.jpg" alt="" class="src" />
            </figure>
            <h4 class="blood-available">Available:
            <span>
                        <%
                            try
                        {
                        Connection con=DbConnectionImpl.getConnection();

                        PreparedStatement a_neg= con.prepareStatement(QueryInterface.A_neg_Blood_Availability);
                        a_neg.setString(1, username1);
                        System.out.println(a_neg);
                        ResultSet rs= a_neg.executeQuery();

                        if(rs.next()){
                            String a_neg_blood_val=rs.getString(1);

                            out.println(a_neg_blood_val);
                        }

                        }catch(Exception e)
                        {}
                        %>
                </span>
            </h4>
          </div>
          <div class="col-sm-3 col-md-3 col-lg-3 text-center">
            <figure class="blood-category-img-part">
              <img src="./images/Bp.jpg" alt="" class="src" />
            </figure>
            <h4 class="blood-available">Available:
            <span>
                        <%
                            try
                        {
                        Connection con=DbConnectionImpl.getConnection();

                        PreparedStatement b_pos= con.prepareStatement(QueryInterface.B_pos_Blood_Availability);
                        b_pos.setString(1, username1);
                        System.out.println(b_pos);
                        ResultSet rs= b_pos.executeQuery();

                        if(rs.next()){
                            String b_pos_blood_val=rs.getString(1);

                            out.println(b_pos_blood_val);
                        }

                        }catch(Exception e)
                        {}
                        %>
                </span>
            </h4>
          </div>
          <div class="col-sm-3 col-md-3 col-lg-3 text-center">
            <figure class="blood-category-img-part">
              <img src="./images/B-.jpg" alt="" class="src" />
            </figure>
            <h4 class="blood-available">Available:
            <span>
                        <%
                            try
                        {
                        Connection con=DbConnectionImpl.getConnection();

                        PreparedStatement b_neg= con.prepareStatement(QueryInterface.B_neg_Blood_Availability);
                        b_neg.setString(1, username1);
                        System.out.println(b_neg);
                        ResultSet rs= b_neg.executeQuery();

                        if(rs.next()){
                            String b_neg_blood_val=rs.getString(1);

                            out.println(b_neg_blood_val);
                        }

                        }catch(Exception e)
                        {}
                        %>
                </span>
            </h4>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3 col-md-3 col-lg-3 text-center">
            <figure class="blood-category-img-part">
              <img src="./images/ABp.jpg" alt="" class="img-fluid" />
            </figure>
            <h4 class="blood-available">Available:
            <span>
                        <%
                            try
                        {
                        Connection con=DbConnectionImpl.getConnection();

                        PreparedStatement ab_pos= con.prepareStatement(QueryInterface.AB_pos_Blood_Availability);
                        ab_pos.setString(1, username1);
                        System.out.println(ab_pos);
                        ResultSet rs= ab_pos.executeQuery();

                        if(rs.next()){
                            String ab_pos_blood_val=rs.getString(1);

                            out.println(ab_pos_blood_val);
                        }

                        }catch(Exception e)
                        {}
                        %>
                </span>
            </h4>
          </div>
          <div class="col-sm-3 col-md-3 col-lg-3 text-center">
            <figure class="blood-category-img-part">
              <img src="./images/AB-.jpg" alt="" class="src" />
            </figure>
            <h4 class="blood-available">Available:
            <span>
                        <%
                            try
                        {
                        Connection con=DbConnectionImpl.getConnection();

                        PreparedStatement ab_neg= con.prepareStatement(QueryInterface.AB_neg_Blood_Availability);
                        ab_neg.setString(1, username1);
                        System.out.println(ab_neg);
                        ResultSet rs= ab_neg.executeQuery();

                        if(rs.next()){
                            String ab_neg_blood_val=rs.getString(1);

                            out.println(ab_neg_blood_val);
                        }

                        }catch(Exception e)
                        {}
                        %>
                </span>
            </h4>
          </div>
          <div class="col-sm-3 col-md-3 col-lg-3 text-center">
            <figure class="blood-category-img-part">
              <img src="./images/Op.jpg" alt="" class="src" />
            </figure>
            <h4 class="blood-available">Available:
            <span>
                        <%
                            try
                        {
                        Connection con=DbConnectionImpl.getConnection();

                        PreparedStatement o_pos= con.prepareStatement(QueryInterface.O_pos_Blood_Availability);
                        o_pos.setString(1, username1);
                        System.out.println(o_pos);
                        ResultSet rs= o_pos.executeQuery();

                        if(rs.next()){
                            String o_pos_blood_val=rs.getString(1);

                            out.println(o_pos_blood_val);
                        }

                        }catch(Exception e)
                        {}
                        %>
                </span>
            </h4>
          </div>
          <div class="col-sm-3 col-md-3 col-lg-3 text-center">
            <figure class="blood-category-img-part">
              <img src="./images/O-.jpg" alt="" class="src" />
            </figure>
            <h4 class="blood-available">Available:
            <span>
                        <%
                            try
                        {
                        Connection con=DbConnectionImpl.getConnection();

                        PreparedStatement o_neg= con.prepareStatement(QueryInterface.O_neg_Blood_Availability);
                        o_neg.setString(1, username1);
                        System.out.println(o_neg);
                        ResultSet rs= o_neg.executeQuery();

                        if(rs.next()){
                            String o_neg_blood_val=rs.getString(1);

                            out.println(o_neg_blood_val);
                        }

                        }catch(Exception e)
                        {}
                        %>
                </span>
            </h4>
          </div>
        </div>
        <div class="row justify-content-center text-center">
          <a href="./blood-form.jsp"
            ><button type="button" class="bld-req-btn">REQUEST</button></a
          >
        </div>
      </div>
    </section>
    <!-- blood divison part end  -->
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
