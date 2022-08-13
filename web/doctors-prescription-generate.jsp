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
                    <a href="doctor-login.jsp"
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
    <!-- doctor panel start -->
    <section class="doctor-panel">
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <h4 class="doc-text">DOCTOR'S PANEL</h4>
        </div>
      </div>
    </section>

    <form name="form"  action="Prescription_PDF_Servlet" method="post">
      <section class="prescription-part">
        <div class="container-fluid">
          <div class="row">
<!--            <div class="col-sm-4 col-md-4 col-lg-4 justify-content-center">
              <label for="p_id" class="pres-head">Prescription ID: </label>
              <input type="text" id="p_id" name="p_id" class="pres-text" />
            </div>-->
            <div class="col-sm-6 col-md-6 col-lg-6">
              <label for="ward" class="pres-head">Ward No:</label>
              <input type="text" id="ward" name="ward_no" class="pres-text" />
            </div>
            <div class="col-sm-6 col-md-6 col-lg-6">
              <label for="bed" class="pres-head">Bed No:</label>
              <input type="text" id="bed" name="bed_no" class="pres-text" />
            </div>
          </div>
        </div>
      </section>
      <section class="patient-part">
        <div class="container-fluid">
          <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="p_id" class="pres-head">Patient ID: </label>
              <input type="text" id="p_id" name="patient_id" class="pres-text" />
            </div>
            <div class="col-sm-4 col-md- 4 col-lg-4">
              <label for="p_name" class="pres-head">Patient Name:</label>
              <input type="text" id="p_name" name="patient_name" class="pres-text" />
            </div>
<!--            <div class="col-sm-4 col-md-4 col-lg-4">
              <label for="bed" class="pres-head">Age:</label>
              <input type="text" id="age" name="age" class="pres-text" />
            </div>-->
          </div>
        </div>
      </section>
      <div class="observation-part">
        <div class="container-fluid">
          <div class="row text-center justify-content-center">
            <h2 class="obsr-text">OBSERVATION</h2>
          </div>
        </div>
      </div>
      <section class="observation-container">
        <div class="container">
          <div class="row">
            <div class="col-sm-6 col-md-6 col-lg-6">
              <img
                src="./images/observation-image.png"
                alt="observation-image"
                class="img-fluid"
              />
            </div>
            <div class="col-sm-6 col-md-6 col-lg-6 obco">
              <div class="row justify-content-center text-center">
                <div class="col-sm-5 col-md-5 col-lg-5">
                  <label for="bed" class="obc">Blood Pressure</label>
                </div>
                <div class="col-sm-7 col-md-7 col-lg-7">
                  <input type="text" id="age" name="Blood_Pressure" class="obc-text" />
                </div>
              </div>
                
              <div class="row justify-content-center text-center">
                <div class="col-sm-5 col-md-5 col-lg-5">
                  <label for="bed" class="obc">Oxygen Level</label>
                </div>
                <div class="col-sm-7 col-md-7 col-lg-7">
                  <input type="text" id="age" name="Oxygen_Level" class="obc-text" />
                </div>
              </div>
                
              <div class="row justify-content-center text-center">
                <div class="col-sm-5 col-md-5 col-lg-5">
                  <label for="bed" class="obc">Pulse Rate</label>
                </div>
                <div class="col-sm-7 col-md-7 col-lg-7">
                  <input type="text" id="age" name="Pulse_Rate" class="obc-text" />
                </div>
              </div>
                
            </div>
          </div>
        </div>
      </section>
      <section class="prescription">
        <div class="row justify-content-center align-items-center m-0">
          <h3 class="prescription-text">PRESCRIPTION</h3>
        </div>
      </section>
      <div class="prescription-table">
        <div class="container-fluid">
          <div class="row justify-content-center text-center">
            <table class="table p-table">
              <thead class="tbl-head">
                <tr class="tbl-head">
                  <th scope="col" class="tbl-head">Serial No</th>
                  
                  <th scope="col" class="tbl-head">Medicine Name</th>
                  <th scope="col" class="tbl-head">Power</th>
                  <th scope="col" class="tbl-head">Remarks</th>
                </tr>
              </thead>
              <tbody class="tbl-head">
                  
                  <% 
                    try{
                        Connection con=DbConnectionImpl.getConnection();
                        String username1=(String)session.getAttribute("username"); 
                        
                      //  PreparedStatement fetch_medicine_id1= con.prepareStatement(QueryInterface.Fetch_Medicine_ID);
                      //  PreparedStatement fetch_medicine_id2= con.prepareStatement(QueryInterface.Fetch_Medicine_ID);
                      //  PreparedStatement fetch_medicine_id3= con.prepareStatement(QueryInterface.Fetch_Medicine_ID);
                      //  PreparedStatement fetch_medicine_id4= con.prepareStatement(QueryInterface.Fetch_Medicine_ID);
                     //   PreparedStatement fetch_medicine_id5= con.prepareStatement(QueryInterface.Fetch_Medicine_ID);
                     //   PreparedStatement fetch_medicine_id6= con.prepareStatement(QueryInterface.Fetch_Medicine_ID);
                     //   PreparedStatement fetch_medicine_id7= con.prepareStatement(QueryInterface.Fetch_Medicine_ID);
                     //   PreparedStatement fetch_medicine_id8= con.prepareStatement(QueryInterface.Fetch_Medicine_ID);
                       // PreparedStatement fetch_medicine_id9= con.prepareStatement(QueryInterface.Fetch_Medicine_ID);
                       // PreparedStatement fetch_medicine_id10= con.prepareStatement(QueryInterface.Fetch_Medicine_ID);
                        
                        PreparedStatement fetch_medicine_name1= con.prepareStatement(QueryInterface.Fetch_Medicine_Name);
                        PreparedStatement fetch_medicine_name2= con.prepareStatement(QueryInterface.Fetch_Medicine_Name);
                        PreparedStatement fetch_medicine_name3= con.prepareStatement(QueryInterface.Fetch_Medicine_Name);
                        PreparedStatement fetch_medicine_name4= con.prepareStatement(QueryInterface.Fetch_Medicine_Name);
                        PreparedStatement fetch_medicine_name5= con.prepareStatement(QueryInterface.Fetch_Medicine_Name);
                        PreparedStatement fetch_medicine_name6= con.prepareStatement(QueryInterface.Fetch_Medicine_Name);
                        PreparedStatement fetch_medicine_name7= con.prepareStatement(QueryInterface.Fetch_Medicine_Name);
                        PreparedStatement fetch_medicine_name8= con.prepareStatement(QueryInterface.Fetch_Medicine_Name);
                        PreparedStatement fetch_medicine_name9= con.prepareStatement(QueryInterface.Fetch_Medicine_Name);
                        PreparedStatement fetch_medicine_name10= con.prepareStatement(QueryInterface.Fetch_Medicine_Name);
                        
                        
                        PreparedStatement fetch_medicine_power1= con.prepareStatement(QueryInterface.Fetch_Medicine_Power);
                        PreparedStatement fetch_medicine_power2= con.prepareStatement(QueryInterface.Fetch_Medicine_Power);
                        PreparedStatement fetch_medicine_power3= con.prepareStatement(QueryInterface.Fetch_Medicine_Power);
                        PreparedStatement fetch_medicine_power4= con.prepareStatement(QueryInterface.Fetch_Medicine_Power);
                        PreparedStatement fetch_medicine_power5= con.prepareStatement(QueryInterface.Fetch_Medicine_Power);
                        PreparedStatement fetch_medicine_power6= con.prepareStatement(QueryInterface.Fetch_Medicine_Power);
                        PreparedStatement fetch_medicine_power7= con.prepareStatement(QueryInterface.Fetch_Medicine_Power);
                        PreparedStatement fetch_medicine_power8= con.prepareStatement(QueryInterface.Fetch_Medicine_Power);
                        PreparedStatement fetch_medicine_power9= con.prepareStatement(QueryInterface.Fetch_Medicine_Power);
                        PreparedStatement fetch_medicine_power10= con.prepareStatement(QueryInterface.Fetch_Medicine_Power);
                        
                        
//                        ResultSet mid1=fetch_medicine_id1.executeQuery();
//                        ResultSet mid2=fetch_medicine_id2.executeQuery();
//                        ResultSet mid3=fetch_medicine_id3.executeQuery();
//                        ResultSet mid4=fetch_medicine_id4.executeQuery();
//                        ResultSet mid5=fetch_medicine_id5.executeQuery();
//                        ResultSet mid6=fetch_medicine_id6.executeQuery();
//                        ResultSet mid7=fetch_medicine_id7.executeQuery();
//                        ResultSet mid8=fetch_medicine_id8.executeQuery();
//                        ResultSet mid9=fetch_medicine_id9.executeQuery();
//                        ResultSet mid10=fetch_medicine_id10.executeQuery();
                        
                        
                        ResultSet mnam1=fetch_medicine_name1.executeQuery();
                        ResultSet mnam2=fetch_medicine_name2.executeQuery();
                        ResultSet mnam3=fetch_medicine_name3.executeQuery();
                        ResultSet mnam4=fetch_medicine_name4.executeQuery();
                        ResultSet mnam5=fetch_medicine_name5.executeQuery();
                        ResultSet mnam6=fetch_medicine_name6.executeQuery();
                        ResultSet mnam7=fetch_medicine_name7.executeQuery();
                        ResultSet mnam8=fetch_medicine_name8.executeQuery();
                        ResultSet mnam9=fetch_medicine_name9.executeQuery();
                        ResultSet mnam10=fetch_medicine_name10.executeQuery();
                        
                        
                        ResultSet pow1=fetch_medicine_power1.executeQuery();
                        ResultSet pow2=fetch_medicine_power2.executeQuery();
                        ResultSet pow3=fetch_medicine_power3.executeQuery();
                        ResultSet pow4=fetch_medicine_power4.executeQuery();
                        ResultSet pow5=fetch_medicine_power5.executeQuery();
                        ResultSet pow6=fetch_medicine_power6.executeQuery();
                        ResultSet pow7=fetch_medicine_power7.executeQuery();
                        ResultSet pow8=fetch_medicine_power8.executeQuery();
                        ResultSet pow9=fetch_medicine_power9.executeQuery();
                        ResultSet pow10=fetch_medicine_power10.executeQuery();
                        
                %>
                  
                <tr class="tbl-head">
                  <th class="tbl-head">1</th>
             
                  <td class="tbl-head">
                    <select name="medicine_name1" class="Blood-Group">
                        <%  while(mnam1.next()){ %>
                        <option value="<%=mnam1.getString(1)%>"><%=mnam1.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <select name="Power1" class="Blood-Group">
                        <%  while(pow1.next()){ %>
                        <option value="<%=pow1.getString(1)%>"><%=pow1.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <input name="Remarks1" type="text" class="prescription-text-add" />
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">2</th>
            
                  <td class="tbl-head">
                    <select name="medicine_name2" class="Blood-Group">
                        <%  while(mnam2.next()){ %>
                        <option value="<%=mnam2.getString(1)%>"><%=mnam2.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <select name="Power2" class="Blood-Group">
                        <%  while(pow2.next()){ %>
                        <option value="<%=pow2.getString(1)%>"><%=pow2.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <input name="Remarks2" type="text" class="prescription-text-add" />
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">3</th>
                  
                  <td class="tbl-head">
                    <select name="medicine_name3" class="Blood-Group">
                        <%  while(mnam3.next()){ %>
                        <option value="<%=mnam3.getString(1)%>"><%=mnam3.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <select name="Power3" class="Blood-Group">
                        <%  while(pow3.next()){ %>
                        <option value="<%=pow3.getString(1)%>"><%=pow3.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <input name="Remarks3" type="text" class="prescription-text-add" />
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">4</th>
                  
                  <td class="tbl-head">
                    <select name="medicine_name4" class="Blood-Group">
                        <%  while(mnam4.next()){ %>
                        <option value="<%=mnam4.getString(1)%>"><%=mnam4.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <select name="Power4" class="Blood-Group">
                        <%  while(pow4.next()){ %>
                        <option value="<%=pow4.getString(1)%>"><%=pow4.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <input name="Remarks4" type="text" class="prescription-text-add" />
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">5</th>
                  
                  <td class="tbl-head">
                    <select name="medicine_name5" class="Blood-Group">
                        <%  while(mnam5.next()){ %>
                        <option value="<%=mnam5.getString(1)%>"><%=mnam5.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <select name="Power5" class="Blood-Group">
                        <%  while(pow5.next()){ %>
                        <option value="<%=pow5.getString(1)%>"><%=pow5.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <input name="Remarks5" type="text" class="prescription-text-add" />
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">6</th>
                  
                  <td class="tbl-head">
                    <select name="medicine_name6" class="Blood-Group">
                        <%  while(mnam6.next()){ %>
                        <option value="<%=mnam6.getString(1)%>"><%=mnam6.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <select name="Power6" class="Blood-Group">
                        <%  while(pow6.next()){ %>
                        <option value="<%=pow6.getString(1)%>"><%=pow6.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <input name="Remarks6" type="text" class="prescription-text-add" />
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">7</th>
                  
                  <td class="tbl-head">
                    <select name="medicine_name7" class="Blood-Group">
                        <%  while(mnam7.next()){ %>
                        <option value="<%=mnam7.getString(1)%>"><%=mnam7.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <select name="Power7" class="Blood-Group">
                        <%  while(pow7.next()){ %>
                        <option value="<%=pow7.getString(1)%>"><%=pow7.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <input name="Remarks7" type="text" class="prescription-text-add" />
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">8</th>
                  
                  <td class="tbl-head">
                    <select name="medicine_name8" class="Blood-Group">
                        <%  while(mnam8.next()){ %>
                        <option value="<%=mnam8.getString(1)%>"><%=mnam8.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <select name="Power8" class="Blood-Group">
                        <%  while(pow8.next()){ %>
                        <option value="<%=pow8.getString(1)%>"><%=pow8.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <input name="Remarks8" type="text" class="prescription-text-add" />
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">9</th>
                  
                  <td class="tbl-head">
                    <select name="medicine_name9" class="Blood-Group">
                        <%  while(mnam9.next()){ %>
                        <option value="<%=mnam9.getString(1)%>"><%=mnam9.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <select name="Power9" class="Blood-Group">
                        <%  while(pow9.next()){ %>
                        <option value="<%=pow9.getString(1)%>"><%=pow9.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <input name="Remarks9" type="text" class="prescription-text-add" />
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">10</th>
                  
                  <td class="tbl-head">
                    <select name="medicine_name10" class="Blood-Group">
                        <%  while(mnam10.next()){ %>
                        <option value="<%=mnam10.getString(1)%>"><%=mnam10.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <select name="Power10" class="Blood-Group">
                        <%  while(pow10.next()){ %>
                        <option value="<%=pow10.getString(1)%>"><%=pow10.getString(1)%></option>
                    <%}%>
                    </select>
                  </td>
                  <td class="tbl-head">
                    <input name="Remarks10" type="text" class="prescription-text-add" />
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="diagonostic">
        <div class="container-fluid">
          <div class="row justify-content-center text-center">
            <h3 class="diagonostic-text">DIAGONOSTIC</h3>
          </div>
        </div>
      </div>
      <div class="diagonostic-table">
        <div class="container-fluid">
          <div class="row justify-content-center text-center">
            <table class="table p-table">
              <thead class="tbl-head">
                <tr class="tbl-head">
                  <th scope="col" class="tbl-head">Serial No</th>
                  <th scope="col" class="tbl-head">Test ID</th>
                  <th scope="col" class="tbl-head">Test Name</th>
                  <th scope="col" class="tbl-head">Select</th>
                </tr>
              </thead>
              <tbody class="tbl-head">
                <tr class="tbl-head">
                  <th class="tbl-head">1</th>
                  <td class="tbl-head">10000</td>
                  <td class="tbl-head">HEMOGRAM</td>
                  <td class="tbl-head">
                    <input name="test_id1" value="HEMOGRAM" type="checkbox" class="chkbx"/>
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">2</th>
                  <td class="tbl-head">20000</td>
                  <td class="tbl-head">LIPID PROFILE</td>
                  <td class="tbl-head">
                    <input name="test_id2" value="LIPID PROFILE" type="checkbox" class="chkbx" />
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">3</th>
                  <td class="tbl-head">30000</td>
                  <td class="tbl-head">LIVER FUNCTION PROFILE</td>
                  <td class="tbl-head">
                    <input name="test_id3" value="LIVER FUNCTION PROFILE" type="checkbox" class="chkbx" />
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">4</th>
                  <td class="tbl-head">40000</td>
                  <td class="tbl-head">GLYCOSYLATED HAEMOGLOBIN</td>
                  <td class="tbl-head">
                    <input name="test_id4" value="GLYCOSYLATED HAEMOGLOBIN" type="checkbox" class="chkbx" />
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">5</th>
                  <td class="tbl-head">50000</td>
                  <td class="tbl-head">LIVER AND KIDNEY PROFILE</td>
                  <td class="tbl-head">
                    <input name="test_id5" value="LIVER AND KIDNEY PROFILE" type="checkbox" class="chkbx" />
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">6</th>
                  <td class="tbl-head">60000</td>
                  <td class="tbl-head">COMPLETE BLOOD COUNT</td>
                  <td class="tbl-head">
                    <input name="test_id6" value="COMPLETE BLOOD COUNT" type="checkbox" class="chkbx" />
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">7</th>
                  <td class="tbl-head">70000</td>
                  <td class="tbl-head">IMMUNOGLOBULIN PANEL</td>
                  <td class="tbl-head">
                    <input name="test_id7" value="IMMUNOGLOBULIN PANEL" type="checkbox" class="chkbx"/>
                  </td>
                </tr>
                <tr class="tbl-head">
                  <th class="tbl-head">8</th>
                  <td class="tbl-head">80000</td>
                  <td class="tbl-head">COMPLETE URINE EXAMINATION</td>
                  <td class="tbl-head">
                    <input name="test_id8" value="COMPLETE URINE EXAMINATION" type="checkbox" class="chkbx" />
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="row justify-content-center text-center m-0">
        <button type="submit" class="btn btn-primary doctor-button">
          SUBMIT
        </button>
      </div>
                    <%
                            }
                            catch(Exception e)
                            {
                                 out.println("wrong entry"+e);
                            }
                    %>
    </form>
    <div class="blank-space"></div>
    <!-- doctor panel end -->
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
