
<%@page import="java.util.Random"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
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
    <!-- to update current hospital value in nurse  -->
    <%
        try
        {    
            Connection con=DbConnectionImpl.getConnection();    
            PreparedStatement q1= con.prepareStatement(QueryInterface.all_nurse_list);
            
            ResultSet rs5=q1.executeQuery();
            while(rs5.next())
            {
                PreparedStatement q2= con.prepareStatement("select hospital_id from ward where ward_no=(select ward_no from nurse where employee_id=?)");
                q2.setString(1, rs5.getString("employee_id"));
                ResultSet rs6=q2.executeQuery();
                while(rs6.next())
                {
                    PreparedStatement q3= con.prepareStatement("UPDATE nurse SET current_hospital_id = ? where employee_id=?");
                    q3.setString(1, rs6.getString("hospital_id"));
                    q3.setString(2, rs5.getString("employee_id"));
                    q3.executeUpdate();
                }
            }
        }
        catch(Exception e)
        {
            out.println("wrong entry"+e);
        }
    %>
    
    <!-- transfer order set start -->  
    <%
       //DOCTOR
       try
       {
            Connection con=DbConnectionImpl.getConnection();

            PreparedStatement all_doctor_list= con.prepareStatement(QueryInterface.all_doctor_list);

            ResultSet rs=all_doctor_list.executeQuery();
            int yrs_from_deny_date=0;
            while(rs.next())
            { 
                String joining_date=rs.getString("joining_date");
                LocalDate date_of_join = LocalDate.parse(joining_date);
                //System.out.println(joining_date);
                LocalDate currentDate = LocalDate.now();
                int working_yrs = Period.between(date_of_join, currentDate).getYears();
                
                String deny_date = rs.getString("deny_date");
                if(deny_date!=null)
                {
                    LocalDate date_of_deny = LocalDate.parse(deny_date);
                    //System.out.println(joining_date);
                    yrs_from_deny_date = Period.between(date_of_deny, currentDate).getYears();
                }
                
                //System.out.println("working yrs : " + working_yrs +"\nlast_denied_reason  : "+rs.getString("last_denied_reason")+"\ntransfer_status  : "+rs.getString("transfer_status"));
                if (working_yrs>=3 && rs.getString("last_denied_reason").equals("NOT SPECIFIED YET") && rs.getString("deny_date")==null && rs.getString("transfer_status").equals("NO TRANSFER ORDER "))
                {
                    PreparedStatement random_hospital_to_transfer= con.prepareStatement(QueryInterface.random_hospital_to_transfer);
                    random_hospital_to_transfer.setString(1, rs.getString("hospital_id"));

                    ResultSet rs2=random_hospital_to_transfer.executeQuery();
                    if(rs2.next())
                    { 
                        String hospital_id = rs2.getString("hospital_id");
                        //System.out.println("hospital_id : "+hospital_id);
                        PreparedStatement update_hospital_id_transfer_for_doctor=con.prepareStatement(QueryInterface.update_hospital_id_transfer_for_doctor);
                        update_hospital_id_transfer_for_doctor.setString(1, hospital_id);
                        update_hospital_id_transfer_for_doctor.setString(2, rs.getString("employee_id"));
                        //System.out.println(update_hospital_id_transfer_for_doctor);
                        update_hospital_id_transfer_for_doctor.executeUpdate();
                    }
                }
                else if(working_yrs>=3 && rs.getString("last_denied_reason")!= "NOT SPECIFIED YET" && yrs_from_deny_date>=1 )
                {
                    PreparedStatement random_hospital_to_transfer= con.prepareStatement(QueryInterface.random_hospital_to_transfer);
                    random_hospital_to_transfer.setString(1, rs.getString("hospital_id"));

                    ResultSet rs2=random_hospital_to_transfer.executeQuery();
                    if(rs2.next())
                    { 
                        String hospital_id = rs2.getString("hospital_id");
                        //System.out.println("hospital_id : "+hospital_id);
                        PreparedStatement update_hospital_id_transfer_for_doctor=con.prepareStatement(QueryInterface.update_hospital_id_transfer_for_doctor);
                        update_hospital_id_transfer_for_doctor.setString(1, hospital_id);
                        update_hospital_id_transfer_for_doctor.setString(2, rs.getString("employee_id"));
                        //System.out.println(update_hospital_id_transfer_for_doctor);
                        update_hospital_id_transfer_for_doctor.executeUpdate();
                    }
                }
            }
        }
        catch(Exception e)
        {
            out.println("wrong entry"+e);
        }
       //NURSE
       try
       {
            Connection con=DbConnectionImpl.getConnection();

            PreparedStatement all_nurse_list= con.prepareStatement(QueryInterface.all_nurse_list);
            int yrs_from_deny_date=0;
            ResultSet nurse_list=all_nurse_list.executeQuery();
            while(nurse_list.next())
            { 
                String joining_date=nurse_list.getString("joining_date");
                LocalDate date_of_join = LocalDate.parse(joining_date);
                //System.out.println(joining_date);
                LocalDate currentDate = LocalDate.now();
                int working_yrs = Period.between(date_of_join, currentDate).getYears();
                
                String deny_date = nurse_list.getString("deny_date");
                if(deny_date!=null)
                {
                    LocalDate date_of_deny = LocalDate.parse(deny_date);
                    //System.out.println(joining_date);
                    yrs_from_deny_date = Period.between(date_of_deny, currentDate).getYears();
                }
                //System.out.println("working yrs : " + working_yrs +"\nlast_denied_reason  : "+nurse_list.getString("last_denied_reason")+"\ntransfer_status  : "+nurse_list.getString("transfer_status")+"\n deny date  : "+nurse_list.getString("deny_date"));
                if (working_yrs>=3 && nurse_list.getString("last_denied_reason").equals("NOT SPECIFIED YET") && nurse_list.getString("deny_date")==null && nurse_list.getString("transfer_status").equals("NO TRANSFER ORDER "))
                {
                    PreparedStatement random_hospital_to_transfer= con.prepareStatement(QueryInterface.random_hospital_to_transfer);
                    random_hospital_to_transfer.setString(1, nurse_list.getString("current_hospital_id"));

                    ResultSet random_hospital=random_hospital_to_transfer.executeQuery();
                    PreparedStatement pst5 = con.prepareStatement(QueryInterface.fetch_random_shift);
                    ResultSet  rs3 = pst5.executeQuery();
                    if(random_hospital.next() && rs3.next())
                    { 
                        String hospital_id = random_hospital.getString("hospital_id");
                        //System.out.println("hospital_id : "+hospital_id);
                        String shift = rs3.getString(1);
                        //System.out.println("shift : "+shift);
                        PreparedStatement update_hospital_id_transfer_for_nurse=con.prepareStatement(QueryInterface.update_hospital_id_transfer_for_nurse);
                        update_hospital_id_transfer_for_nurse.setString(1, hospital_id);
                        update_hospital_id_transfer_for_nurse.setString(2, shift);
                        update_hospital_id_transfer_for_nurse.setString(3, nurse_list.getString("employee_id"));

                        System.out.println(update_hospital_id_transfer_for_nurse);
                        update_hospital_id_transfer_for_nurse.executeUpdate();
                    }
                }
                else if(working_yrs>=3 && nurse_list.getString("last_denied_reason")!= "NOT SPECIFIED YET" && yrs_from_deny_date>=1 )
                {
                    PreparedStatement random_hospital_to_transfer= con.prepareStatement(QueryInterface.random_hospital_to_transfer);
                    random_hospital_to_transfer.setString(1, nurse_list.getString("current_hospital_id"));

                    ResultSet random_hospital=random_hospital_to_transfer.executeQuery();
                    PreparedStatement pst5 = con.prepareStatement(QueryInterface.fetch_random_shift);
                    ResultSet  rs3 = pst5.executeQuery();
                    if(random_hospital.next() && rs3.next())
                    { 
                        String hospital_id = random_hospital.getString("hospital_id");
                        //System.out.println("hospital_id : "+hospital_id);
                        String shift = rs3.getString(1);
                        //System.out.println("shift : "+shift);
                        PreparedStatement update_hospital_id_transfer_for_nurse=con.prepareStatement(QueryInterface.update_hospital_id_transfer_for_nurse);
                        update_hospital_id_transfer_for_nurse.setString(1, hospital_id);
                        update_hospital_id_transfer_for_nurse.setString(2, shift);
                        update_hospital_id_transfer_for_nurse.setString(3, nurse_list.getString("employee_id"));

                        System.out.println(update_hospital_id_transfer_for_nurse);
                        update_hospital_id_transfer_for_nurse.executeUpdate();
                    }
                }
            }
        }
        catch(Exception e)
        {
            out.println("wrong entry"+e);
        }
    %>
    <!-- transfer order set end -->
    <!-- opd table value set start-->
    
    <!-- opd table value set end-->
    <!-- carousel part start -->
    <div
      id="carouselExampleSlidesOnly"
      class="carousel slide"
      data-ride="carousel"
    >
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img
            src="./images/banner-1.jpg"
            class="d-block w-100"
            alt="banner-1"
          />
        </div>
        <div class="carousel-item">
          <img
            src="./images/banner-2.jpg"
            class="d-block w-100"
            alt="banner-2"
          />
        </div>
        <div class="carousel-item">
          <img
            src="./images/banner-3.jpg"
            class="d-block w-100"
            alt="banner-3"
          />
        </div>
      </div>
    </div>
    <!-- carousel part end -->
    <!-- info part start -->
    <section class="information">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-4 col-md-4 col-lg-4 notice-sec">
            <figure class="info-img">
                <h3 class="sub-heading"><u>Notice</u></h3>
              <img src="./images/notice.jpg" alt="" />
              <h3 class="notice-text">
                  
                <%
                    try
                    {
                    Connection con=DbConnectionImpl.getConnection();

                    PreparedStatement notice= con.prepareStatement(QueryInterface.notice1);

                    ResultSet rs=notice.executeQuery();

                    if(rs.next()){
                        String notice1=rs.getString(1);


                        out.println(notice1);

                    }

                    }catch(Exception e)
                    {}
                %>
    
                </br></br>
                
            <%
                try
                {
                Connection con=DbConnectionImpl.getConnection();
                
                PreparedStatement notice= con.prepareStatement(QueryInterface.notice2);
                
                ResultSet rs=notice.executeQuery();
                
                if(rs.next()){
                    String notice2=rs.getString(1);
                    
                    
                    out.println(notice2);
                    
                }
                
                }catch(Exception e)
                {}
            %>
             </h3>
            
            
            </figure>
          </div>
          <div class="col-sm-4 col-md-4 col-lg-4">
            <figure class="info-img">
                <h3 class="sub-heading"><u>Covid</u></h3>
              <img src="./images/covid-bg.jpg" alt="" />
              <h3 class="notice-text">Wear Mask
                  <br/><br/>Please use Hand Sanitizer always</h3>
            </figure>
          </div>
          <div class="col-sm-4 col-md-4 col-lg-4">
            <figure class="info-img">
                <h3 class="sub-heading"><u>Announcement</u></h3>
              <img src="./images/announcement.jpg" alt="" />
              <h3 class="notice-text">
                <%
                    try
                    {
                    Connection con=DbConnectionImpl.getConnection();

                    PreparedStatement ANNOUNCEMENT= con.prepareStatement(QueryInterface.ANNOUNCEMENT1);

                    ResultSet rs=ANNOUNCEMENT.executeQuery();

                    if(rs.next()){
                        String ANNOUNCEMENT1=rs.getString(1);


                        out.println(ANNOUNCEMENT1);

                    }

                    }catch(Exception e)
                    {}
                %>
    
                </br></br> 
    
                <%
                    try
                    {
                    Connection con=DbConnectionImpl.getConnection();

                    PreparedStatement ANNOUNCEMENT= con.prepareStatement(QueryInterface.ANNOUNCEMENT2);

                    ResultSet rs=ANNOUNCEMENT.executeQuery();

                    if(rs.next()){
                        String ANNOUNCEMENT2=rs.getString(1);


                        out.println(ANNOUNCEMENT2);

                    }

                    }catch(Exception e)
                    {}
                %>
               </h3>
            </figure>
          </div>
        </div>
      </div>
    </section>
    <!-- info part end -->
    <!-- website Information start-->
    <div class="information">
      <a href="#" class="neon">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        Information For You
      </a>
    </div>
    <div class="information-img">
      <img src="./images/info.jpg" alt="" class="img-fluid info-img" />
    </div>
    <!-- wensite information end -->
    <!-- quote Start -->
    <div class="quote-img">
      <img src="./images/doc-tips.jpg" alt="" class="img-fluid quote-img" />
    </div>
    <div class="feedbackform">
      <div class="row m-0">
        <div class="col-sm-6 col-md-6 col-lg-6 m-0 p-0">
          <img
            src="./images/thank-you-icon.png"
            alt=""
            class="img-fluid feedback-img"
          />
        </div>
        <div class="col-sm-6 col-md-6 col-lg-6 m-0 p-0 feed">
          <div class="heading">
            <h2 class="display-4 text-center">Feedback Form</h2>
          </div>
          <form name="form"  action="FeedbackServlet" method="post">
            <div class="form-group row feed-form">
              <label
                for="staticEmail"
                class="col-sm-2 col-form-label display-4 formitem mt-3"
                >Name</label
              >
              <div class="col-sm-10 mt-3">
                <input
                  type="text"
                  name="name"
                  class="form-control"
                  id=""
                  placeholder="Enter Your Full Name"
                />
              </div>
            </div>
            <div class="form-group row feed-form">
              <label
                for="staticEmail"
                class="col-sm-2 col-form-label display-4 formitem mt-3"
                >Email</label
              >
              <div class="col-sm-10 mt-3">
                <input
                  type="email"
                  name="email"
                  class="form-control"
                  id=""
                  placeholder="Enter Your Email"
                />
              </div>
            </div>
            <div class="form-group row feed-form">
              <label
                for="staticEmail"
                class="col-sm-2 col-form-label display-4 formitem mt-3"
                >Mob No</label
              >
              <div class="col-sm-10 mt-3">
                <input
                  type="text"
                  name="mob_number"
                  class="form-control"
                  id=""
                  placeholder="Enter Your Mobile Number"
                />
              </div>
            </div>
            <div class="form-group row feed-form">
              <label
                for="staticEmail"
                class="col-sm-2 col-form-label display-4 formitem mt-3"
                >Rate Us</label
              >
              <div class="col-sm-10 mt-3">
                <div class="rating-wrap">
                  <div class="center">
                    <fieldset class="rating">
                      <input
                        type="radio"
                        id="star5"
                        name="rating"
                        value="5"
                      /><label for="star5" class="full" title="Awesome"></label>
                      <input
                        type="radio"
                        id="star4.5"
                        name="rating"
                        value="4.5"
                      /><label for="star4.5" class="half"></label>
                      <input
                        type="radio"
                        id="star4"
                        name="rating"
                        value="4"
                      /><label for="star4" class="full"></label>
                      <input
                        type="radio"
                        id="star3.5"
                        name="rating"
                        value="3.5"
                      /><label for="star3.5" class="half"></label>
                      <input
                        type="radio"
                        id="star3"
                        name="rating"
                        value="3"
                      /><label for="star3" class="full"></label>
                      <input
                        type="radio"
                        id="star2.5"
                        name="rating"
                        value="2.5"
                      /><label for="star2.5" class="half"></label>
                      <input
                        type="radio"
                        id="star2"
                        name="rating"
                        value="2"
                      /><label for="star2" class="full"></label>
                      <input
                        type="radio"
                        id="star1.5"
                        name="rating"
                        value="1.5"
                      /><label for="star1.5" class="half"></label>
                      <input
                        type="radio"
                        id="star1"
                        name="rating"
                        value="1"
                      /><label for="star1" class="full"></label>
                      <input
                        type="radio"
                        id="star0.5"
                        name="rating"
                        value="0.5"
                      /><label for="star0.5" class="half"></label>
                    </fieldset>
                  </div>
                </div>
              </div>
            </div>
            <button type="submit" class="btn btn-primary feedback-button">
              Submit
            </button>
          </form>
        </div>
      </div>
    </div>
    <!-- feedback form end -->
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

