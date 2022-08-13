<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DaoInterface.QueryInterface"%>
<%@page import="DaoInterface.QueryInterface"%>
<%@page import="DaoImplement.DbConnectionImpl"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Aayu</title>
    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    
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
    <!-- Add doctor -->
    <section class="doctor-add">
      <div class="container-fluid">
        <div class="row justify-content-center text-center">
          <h3 class="add-doctor">ADD DOCTOR</h3>
        </div>
      </div>
    </section>
    <section class="doctor-add-form">
      <div class="container doc-frm">
        <form name="form"  action="AddDoctorServlet" onsubmit="return validation()" method="post">

            <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="name" class="doc-label">Name :</label>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-8">
              <input type="text" name="doctor_name" class="doc-in" />
              
            </div>
          </div>
          
          <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="spl" class="doc-label">Specialization :</label>              
            </div>
            <div class="col-sm-8 col-md-8 col-lg-8">
              <input type="text" name="specialization" class="doc-in" />
              
            </div>
          </div>
            
          <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="qfl" class="doc-label">Qualification :</label>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-8">
              <input type="text" name="qualification" class="doc-in" />
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="email" class="doc-label">Email :</label>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-8">
              <input type="email" name="email_id" class="doc-in" />
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="mob" class="doc-label">Mobile Number :</label>
              
            </div>
            <div class="col-sm-8 col-md-8 col-lg-8">
              <input type="text" name="mob_number" class="doc-in" id="mob"/>
              <span id="mobileno" class="text-danger"></span>
            </div>
          </div>
             <div class="row">
             <% 
                    try{
                        Connection con=DbConnectionImpl.getConnection(); 
                        
                        PreparedStatement pst= con.prepareStatement(QueryInterface.fetch_hospital_id);
                        
                        ResultSet rs = pst.executeQuery();
                        
                
                %>
            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="hospital" class="doc-label">Hospital :</label>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-8">
                    <select name="hospital_id" class="doc-in">
                        <%  while(rs.next()){ %>
                        <option value="none" selected disabled hidden>Select Hospital</option>
                        <option value="<%=rs.getString("hospital_id")%>"><%=rs.getString("hospital_name")%></option>
                    <%}%>
                    </select> 
            </div>
            <%
                    }
                    catch(Exception e)
                    {
                         out.println("wrong entry"+e);
                    }
            %>
          </div>
<!--          <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="pwd" class="doc-label">Password :</label>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-8">
              <input type="password" name="password" class="doc-in" id="pass" />
              <span id="passwords" class="text-danger"></span>
            </div>
          </div> -->
          <div class="form-group row justify-content-center text-center">
            <div class="col-sm-10">
              <button type="submit" class="btn btn-primary doc-add-btn">
                ADD
              </button>
            </div>
          </div>
        </form>
      </div>
    </section>
    <!-- Add doctor end -->
    <!-- Add nurse -->
    <section class="doctor-add">
      <div class="container-fluid">
        <div class="row justify-content-center text-center">
          <h3 class="add-doctor">ADD NURSE</h3>
        </div>
      </div>
    </section>
    <section class="doctor-add-form mb-5">
      <div class="container doc-frm nurse">
        <form name="form"  action="AddNurseServlet" onsubmit="return validation1()" method="post">
          
            <div class="row">
                <div class="col-sm-4 col-md-4 col-lg-4">
                  <label for="name" class="doc-label">Name:</label>
                </div>
                <div class="col-sm-8 col-md-8 col-lg-8">
                  <input type="text" name="name" class="doc-in" />
                </div>
            </div>
            
            <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="wn" class="doc-label">Ward Number:</label>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-8">
              <input type="text" name="ward_no" class="doc-in" />
            </div>
          </div>
            
          <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="shift" class="doc-label">Shift:</label>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-8">
                <select name="shift" class="doc-in">
                            
                    <option value="none" selected disabled hidden>Select Shift</option>
                    <option value="Day">Day</option>
                    <option value="Night">Night</option>
                </select>
            </div>
          </div>
            
        <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="email" class="doc-label">Email: </label>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-8">
              <input type="email" name="email" class="doc-in" />
            </div>
        </div>
            
          <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="mob" class="doc-label">Mobile Number:</label>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-8">
              <input type="text" name="mob_no" class="doc-in" id="mob1" />
              <span id="mobileno1" class="text-danger"></span>
            </div>
          </div>
          <!--  
          <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="uname" class="doc-label">Username:</label>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-8">
              <input type="text" name="uname" class="doc-in" />
            </div>
          </div>

          <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="pwd" class="doc-label">Password:</label>
            </div>
            <div class="col-sm-8 col-md-8 col-lg-8">
                <input type="password" name="pwd" class="doc-in" id="pass1" />
              <span id="passwords1" class="text-danger"></span>
            </div>
          </div>
            -->
          <div class="form-group row justify-content-center text-center">
            <div class="col-sm-10">
              <button type="submit" class="btn btn-primary doc-add-btn">
                ADD
              </button>
            </div>
          </div>
        </form>
      </div>
    </section>
    <!-- Add nurse end -->
    <!-- footer part start -->
    <section class="footer nurse-part">
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
              <a href="admin-panel-login.jsp">My Profile</a>
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
    
    
    <script type="text/javascript">
        
        
            function validation(){
            var mob =document.getElementById('mob').value;
            var pass =document.getElementById('pass').value;
           
        
        
           //Doctor validation
           
            if(mob ==" "){
            document.getElementById('mobileno').innerHTML ="Please Enter your Mobile No.";
            return false;
            }
            
           if(isNaN(mob)){
           document.getElementById('mobileno').innerHTML ="User Must Write Digits Only!";
           return false;
            }
            
           if(mob.length!=10){
           document.getElementById('mobileno').innerHTML ="Mobile Number Must Be 10 Digit!";
           return false;
           }
           
           if(pass ==" "){
           document.getElementById('passwords').innerHTML ="Please Enter Password";
           return false;
            }
            
            if((pass.length <= 7) || (pass.length > 20)){
            document.getElementById('passwords').innerHTML ="Password Length Must Be Between 8 And 20";
            return false; 
            }
        }
        
    </script>
            
        <script type="text/javascript">
            
            function validation1(){
            var mob1 =document.getElementById('mob1').value;
            var pass1 =document.getElementById('pass1').value;
            
            //Nurse validation
            
            if(mob1==""){
            document.getElementById('mobileno1').innerHTML ="Please Enter your Mobile No.";
            return false;
            }
            
           if(isNaN(mob1)){
           document.getElementById('mobileno1').innerHTML ="User Must Write Digits Only!";
           return false;
            }
            
           if(mob1.length!=10){
           document.getElementById('mobileno1').innerHTML ="Mobile Number Must Be 10 Digit!";
           return false;
           }
           
           if(pass1==""){
           document.getElementById('passwords1').innerHTML ="Please Enter Password";
           return false;
            }
            
            if((pass1.length <= 7) || (pass1.length > 20)){
            document.getElementById('passwords1').innerHTML ="Password Length Must Be Between 8 And 20";
            return false;
            }
        }
        </script>
        
        
    
    
  </body>
</html>
