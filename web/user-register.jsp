<%@page import="java.sql.ResultSet"%>
<%@page import="DaoInterface.QueryInterface"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DaoImplement.DbConnectionImpl"%>
<%@page import="java.sql.Connection"%>
<%
    String first_name= (String)session.getAttribute("Session_register");
if(first_name!=null){
%>
<jsp:forward page="login.jsp" />
<%
}
%>


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

    
    <link rel="stylesheet" href="./css/style.css" class="rel" />
    <script> 
</script>

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
    <!-- register page start -->
    <section class="registration">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-6 col-md-6 col-lg-6">
            <img
              src="./images/log-in.jpg"
              alt="Register-banner"
              class="img-fluid"
            />
          </div>
          <div class="col-sm-6 col-md-6 col-lg-6 justify-content-center">
            <h2 class="registerclass">REGISTER</h2>
            <form name="form"  action="RegisterServlet" onsubmit="return validation()" method="post">
              <div class="form-group row">
                <label for="inputEmail3" class="col-sm-4 col-form-label"
                  >Name</label
                >
                <div class="col-sm-3">
                  <input
                    type="text"
                    class="form-control"
                    name="fname"
                    placeholder="First"
                    id="user"
                  />
                  <span id="username" class="text-danger"></span>
                </div>
                <div class="col-sm-2">
                  <input
                    type="text"
                    class="form-control"
                    name="mname"
                    placeholder="Middle"
                  />
                </div>
                <div class="col-sm-3">
                  <input
                    type="text"
                    class="form-control"
                    name="lname"
                    placeholder="Last"
                    id="lastn"
                  />
                  <span id="lastname" class="text-danger"></span>
                </div>
              </div>
              <fieldset class="form-group row">
                <legend class="col-form-label col-sm-4 float-sm-left pt-0">
                  Gender
                </legend>
                <div class="col-sm-8">
                
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="radio"
                      name="gender"
                      id="gridRadios1"
                      value="Male"
                      
                    />
                    <label class="form-check-label" for="gridRadios1">
                      Male
                    </label>
                  </div>
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="radio"
                      name="gender"
                      id="gridRadios2"
                      value="Female"
                    />
                    <label class="form-check-label" for="gridRadios2">
                      Female
                    </label>
                  </div>
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="radio"
                      name="gender"
                      id="gridRadios1"
                      value="Others"
                      
                    />
                    <label class="form-check-label" for="Gender">
                      Others
                    </label>
                  </div>
                    <span id="gender" class="text-danger"></span>
                </div>
              </fieldset>
                
              <div class="form-group row">
                <label for="inputEmail3" class="col-sm-4 col-form-label"
                  >Blood</label
                >
                <div class="col-sm-8">
                  <div class="col-sm-5 bld-grp">
                    <select name="Blood-Grp" class="Blood-Group">
                      <option value="A+">A+</option>
                      <option value="A-">A-</option>
                      <option value="B+">B+</option>
                      <option value="B-">B-</option>
                      <option value="O+">O+</option>
                      <option value="O-">O-</option>
                      <option value="AB+">AB+</option>
                      <option value="AB-">AB-</option>
                      <option value="none" selected>Not Known</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputEmail3" class="col-sm-4 col-form-label"
                  >DOB</label
                >
                <div class="col-sm-8">
                  <input type="date" class="form-control" id="date" name="dob"/>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputEmail3" class="col-sm-4 col-form-label"
                  >Mobile Number</label
                >
                <div class="col-sm-8">
                  <input
                    type="text"
                    class="form-control"
                    name="mob_Number"
                    placeholder="Enter your Mobile Number"
                    id="mob"
                  />
                  <span id="mobileno" class="text-danger"></span>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputEmail3" class="col-sm-4 col-form-label"
                  >Alt Mob Num</label
                >
                <div class="col-sm-8">
                  <input
                    type="text"
                    class="form-control"
                    name="alternative_mob_Number"
                    placeholder="Enter your Alternative Number"
                  />
                </div>
              </div>
              <div class="form-group row">
                <label for="inputEmail3" class="col-sm-4 col-form-label"
                  >Email</label
                >
                <div class="col-sm-8">
                  <input
                    type="email"
                    class="form-control"
                    name="email"
                    placeholder="Enter your Email"
                    id="email"
                  />
                  <span id="emailids" class="text-danger"></span>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputEmail3" class="col-sm-4 col-form-label"
                  >Password</label
                >
                <div class="col-sm-8">
                  <input
                    type="password"
                    class="form-control"
                    name="pwd"
                    placeholder="Enter your Password"
                    id="pass"
                  />
                  <span id="passwords" class="text-danger"></span>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputEmail3" class="col-sm-4 col-form-label"
                  >Confirm Password</label
                >
                <div class="col-sm-8">
                  <input
                    type="password"
                    class="form-control"
                    name="c_password"
                    placeholder="Enter your Password"
                    id="conpass"
                  />
                  <span id="confrmpass" class="text-danger"></span>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-sm-10 offset-sm-2"></div>
              </div>
              <div class="form-group row">
                <div class="col-sm-10">
                  <div class="row justify-content-center align-items-center">
                    <button type="submit"  class="btn btn-primary sub">
                      Register
                    </button>
                  </div>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-sm-10">
                  <div class="row justify-content-center text-center">
                    <h3 class="ahaa">
                      Already have an account?
                      <span class="log"><a href="login.jsp">Login</a></span>
                    </h3>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
      
    
    <!-- register page end -->
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
    </form>
    
    <script type="text/javascript">
        
        function validation(){
            var user =document.getElementById('user').value;
            var lastn =document.getElementById('lastn').value;
            var mob =document.getElementById('mob').value;
            var email =document.getElementById('email').value;
            var pass =document.getElementById('pass').value;
            var conpass =document.getElementById('conpass').value;
          
            if(user ==""){
                document.getElementById('username').innerHTML ="Enter First Name";
                return false;
            }
            
            if((user.length <= 1) || (user.length > 20)){
             document.getElementById('username').innerHTML ="First Name Length Must Be Between 1 And 20";
             return false; 
            }
            if(!isNaN(user)){
             document.getElementById('username').innerHTML ="Only Character Are Allowed";
             return false;
            }
            
            
            
            if(lastn==""){
                document.getElementById('lastname').innerHTML ="Last Name Required";
                return false;
            }
            if((user.length <= 2) || (user.length > 20)){
             document.getElementById('lastname').innerHTML ="Last Name Length Must Be Between 2 And 20";
             return false; 
            }
            if(!isNaN(user)){
             document.getElementById('lastname').innerHTML ="Only Character Are Allowed";
             return false;
            }
            
            if(mob ==""){
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
            if(email==""){
                document.getElementById('emailids').innerHTML ="Please Enter Email";
                return false;
            }
          
         
            if(pass==""){
                document.getElementById('passwords').innerHTML ="Please Enter Password";
                return false;
            }
            if((pass.length <= 7) || (pass.length > 20)){
             document.getElementById('passwords').innerHTML ="Password Length Must Be Between 8 And 20";
             return false; 
            }
            if(pass!=conpass){
             document.getElementById('confrmpass').innerHTML ="Password Are Not Matching!";
             return false; 
            }
            
            if(conpass==""){
             document.getElementById('confrmpass').innerHTML="Enter Confrim Your Password";
             return false;
            }
            
        }
    
        
        
    </script>
        
    
    
  </body>
</html>