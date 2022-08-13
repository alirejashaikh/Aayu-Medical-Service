<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DaoInterface.QueryInterface"%>
<%@page import="DaoImplement.DbConnectionImpl"%>
<%@page import="java.sql.Connection"%>
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
    <% 
        try{
            Connection con=DbConnectionImpl.getConnection();
            String username1=(String)session.getAttribute("username"); 
            System.out.println("username : "+username1);
            PreparedStatement nurse_details_with_username= con.prepareStatement(QueryInterface.nurse_details_with_username);
            nurse_details_with_username.setString(1, username1);
            System.out.println(nurse_details_with_username);
            ResultSet rs=nurse_details_with_username.executeQuery();
            if(rs.next())
            {
                if(rs.getString("transfer_status").equals("NO RESPONSE"))
                {
    %>
    <section class="doctor-add">
      <div class="container-fluid">
        <div class="row justify-content-center text-center">
          <h3 class="add-doctor">TRANSFER ORDER</h3>
        </div>
      </div>
    </section>
    <%
                PreparedStatement current_hospital_name_with_id= con.prepareStatement(QueryInterface.hospital_name_with_id);
                current_hospital_name_with_id.setString(1, rs.getString("current_hospital_id"));
                
                ResultSet rs1=current_hospital_name_with_id.executeQuery();
                if(rs1.next())
                {
                    PreparedStatement new_hospital_name_with_id= con.prepareStatement(QueryInterface.hospital_name_with_id);
                    new_hospital_name_with_id.setString(1, rs.getString("new_hospital_id"));
                
                    ResultSet rs2=new_hospital_name_with_id.executeQuery();
                    if(rs2.next())
                    {
    %>
    <section class="doctor-details-area doc-trns">
      <div class="container">
        <div class="row">
          <div class="doctor-details-view-part text-center">
            <div class="row doctor-view-sec">
              <div class="col-sm-4 col-md-4 col-lg-4">
                <label for="inputEmail3" class="col-form-label"
                  >Name:
                </label>
              </div>
              <div class="col-sm-6 col-md-6 col-lg-6">
                <div class="view-item-doctor">
                    <span>
                        <%
                            out.println(rs.getString("name").toUpperCase());
                        %>
                    </span>
                </div>
              </div>
            </div>
            <div class="row doctor-view-sec">
              <div class="col-sm-4 col-md-4 col-lg-4">
                <label for="inputEmail3" class="col-form-label"
                  >Current Hospital:
                </label>
              </div>
              <div class="col-sm-6 col-md-6 col-lg-6">
                <div class="view-item-doctor">
                    <span>
                        <%
                            out.println(rs1.getString("Hospital_Name").toUpperCase());
                        %> 
                    </span>
                </div>
              </div>
            </div>
            <div class="row doctor-view-sec">
              <div class="col-sm-4 col-md-4 col-lg-4">
                <label for="inputEmail3" class="col-form-label"
                  >Current Shift :
                </label>
              </div>
              <div class="col-sm-6 col-md-6 col-lg-6">
                <div class="view-item-doctor">
                    <span>
                        <%
                            out.println(rs.getString("current_shift").toUpperCase());
                        %>
                    </span>
                </div>
              </div>
            </div>
            <div class="row doctor-view-sec">
              <div class="col-sm-4 col-md-4 col-lg-4">
                <label for="inputEmail3" class="col-form-label"
                  >Years Since Join:
                </label>
              </div>
              <div class="col-sm-6 col-md-6 col-lg-6">
                <div class="view-item-doctor">
                    <span>
                        <%
                            String joining_date=rs.getString("joining_date");
                            LocalDate dateoj = LocalDate.parse(joining_date);
                            //System.out.println(joining_date);
                            LocalDate curDate = LocalDate.now();
                            int gap = Period.between(dateoj, curDate).getYears();

                            out.println(gap);
                        %>
                    </span>
                </div>
              </div>
            </div>
            <div class="row doctor-view-sec">
              <div class="col-sm-4 col-md-4 col-lg-4">
                <label for="inputEmail3" class="col-form-label"
                  >New Hospital :
                </label>
              </div>
              <div class="col-sm-6 col-md-6 col-lg-6">
                <div class="view-item-doctor">
                    <span>
                        <%
                            out.println(rs2.getString("Hospital_Name").toUpperCase());
                        %> 
                    </span>
                </div>
              </div>
            </div>
            <div class="row doctor-view-sec">
              <div class="col-sm-4 col-md-4 col-lg-4">
                <label for="inputEmail3" class="col-form-label"
                  >New Shift :
                </label>
              </div>
              <div class="col-sm-6 col-md-6 col-lg-6">
                <div class="view-item-doctor">
                    <span>
                        <%
                            out.println(rs.getString("new_shift").toUpperCase());
                        %>
                    </span>
                </div>
              </div>
            </div>
            <div class="row doctor-view-sec">
              <div class="col-sm-4 col-md-4 col-lg-4">
                <label for="inputEmail3" class="col-form-label"
                  >Last Denied Reason:
                </label>
              </div>
              <div class="col-sm-6 col-md-6 col-lg-6">
                <div class="view-item-doctor">
                    <span>
                        <%
                            out.println(rs.getString("last_denied_reason").toUpperCase());
                        %>
                    </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <div class="container">
      <form action="NurseTransferOrderServlet" method="post">
        <input hidden name="username" value="<%=username1%>">
        <div class="form-group row">
          <label for="inputEmail3" class="col-sm-4 col-form-label"
            >Reason</label
          >
          <div class="col-sm-8">
            <textarea
                class="form-control"
                id="exampleFormControlTextarea1"
                rows="3"
                name="reason"
            ></textarea>
          </div>
        </div>
        <div class="row d-flex justify-content-center">
          <div>
            <button
              type="submit"
              name="action" value="ACCEPTED"
              class="btn btn-primary bd-btn mr-3 accept-btn"
            >
              Accept
            </button>
          </div>
          <div>
            <button 
                type="submit" 
                name="action" value="DECLINED" 
                class="btn btn-primary bd-btn decline-btn"
            >
              Decline
            </button>
          </div>
        </div>
      </form>
    </div>
        <%
                }
            }
        }
        else
        {
    %>
    <div class="container-fluid no-transfer mt-2">
        <section class="about-us-banner">
          <img
            src="./images/banner-for-no-transfer-order.jpg"
            alt="No Transfer Order Banner"
            class="img-fluid no-transfer-img"
          />
        </section>
    </div>
    <%
                }
            }
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
    %>
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
              <a href="about-us.jsp">About us</a>
            </li>
            <li class="imp-links-item">
              <a href="#">Privacy Policy</a>
            </li>

            <li class="imp-links-item">
              <a href="#">Visitors : </a>
            </li>
            <!-- Start of CuterCounter Code -->
            <a href="" target="_blank"
              ><img
                src="https://www.cutercounter.com/hits.php?id=huxaapan&nd=6&style=20"
                alt="hit counter"
            /></a>
            <!-- End of CuterCounter Code -->
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
