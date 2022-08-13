
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
    <!-- blog section part start -->
    <section class="blog-image">
      <div class="container-fluid">
        <div class="row">
          <img
            src="./images/blog-banner.jpg"
            alt=""
            class="img-fluid blog-banner-image"
          />
        </div>
      </div>
    </section>
    <div class="tips-part">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-12">
            <h1 class="health-tips">HEALTH TIPS</h1>
          </div>
        </div>
      </div>
    </div>
    <!-- blog section part end -->
    <!-- Blog tips Start -->
    <div class="blog-tips-section">
      <div class="container-fluid">
        <div class="row d-flex justify-content-around mt-5">
          <div class="col-sm-5 col-md-5 col-lg-5 tipspart_1">
            <img src="./images/yoga.jpg" alt="" class="img-fluid tips-image" />
            <h2 class="tips-head">Ward off stress with yoga</h2>
            <h4 class="tips-body-text">
              A few minutes of yoga can relax both your body and mind,by
              releasing tention that accumulates in the muscles and pacifying
              your overworked
            </h4>
          </div>

          <div class="col-sm-5 col-md-5 col-lg-5 tipspart_1">
            <img
              src="./images/sanitizer.jpg"
              alt=""
              class="img-fluid tips-image"
            />
            <h2 class="tips-head">Hand Sanitization is Essential</h2>
            <h4 class="tips-body-text">
              Dirty hands are the primary route that the germs, viruses and
              bacteria take to enter and harm your immune system. It is
              important that you wash your hands with antiseptic liquid hand
              washes or use a sanitizer before touching any food
            </h4>
          </div>
        </div>
        <div class="row d-flex justify-content-around mt-5">
          <div class="col-sm-5 col-md-5 col-lg-5 tipspart_1">
            <img
              src="./images/depression.jpg"
              alt=""
              class="img-fluid tips-image"
            />
            <h2 class="tips-head">Signs of Depression</h2>
            <h4 class="tips-body-text">
              loss of interest in any pleasure activities, feelings of guilt,
              hopelessness, worthlessness, suicidal thoughts, appetite and
              weight changes, sleep disturbance, lack of energy and fatigue.
            </h4>
          </div>

          <div class="col-sm-5 col-md-5 col-lg-5 tipspart_1">
            <img src="./images/cold.jpg" alt="" class="img-fluid tips-image" />
            <h2 class="tips-head">Diet in Cold and Cough</h2>
            <h4 class="tips-body-text">
              More often seasonal change showers us with cold and flu resulting
              running nose. Probably it’s just our body’s way of saying you are
              way to awesome and need to slow down so that everyone else can
              catch up. Due to common cold and influenza, we mostly lose our
              appetite so eating adequate nutritious food may be challenging.
            </h4>
          </div>
        </div>
        <div class="row d-flex justify-content-around mt-5">
          <div class="col-sm-5 col-md-5 col-lg-5 tipspart_1">
            <img
              src="./images/blood-donate.jpg"
              alt=""
              class="img-fluid tips-image"
            />
            <h2 class="tips-head">Donate Blood</h2>
            <h4 class="tips-body-text">
              Every year our nation requires about 4 Crore units of blood, out
              of which only a meager 40 Lakh units of blood are available.
              Donate Blood.
            </h4>
          </div>

          <div class="col-sm-5 col-md-5 col-lg-5 tipspart_1">
            <img src="./images/tea.jpg" alt="" class="img-fluid tips-image" />
            <h2 class="tips-head">Herbal Tea for Monsoon Blues</h2>
            <h4 class="tips-body-text">
              Drink herbal tea to combat monsoon diseases. Herbal tea has
              curative properties for coughs, colds and sore throat — common
              ailments during the rainy season. To make it healthier, you can
              add body warming ingredients like cloves, ginger, pepper, basil
              and mint.
            </h4>
          </div>
        </div>
        <div class="row d-flex justify-content-around mt-5">
          <div class="col-sm-5 col-md-5 col-lg-5 tipspart_1">
            <img
              src="./images/dry-fruits.jpg"
              alt=""
              class="img-fluid tips-image"
            />
            <h2 class="tips-head">Benefits of Dates</h2>
            <h4 class="tips-body-text">
              Dates are one of the very best sweet and versatile foods that can
              regulate the digestive process. It can significantly boost energy
              levels and provide a good source of various vitamins and minerals.
              Munch on them when sugar cravings arise.
            </h4>
          </div>

          <div class="col-sm-5 col-md-5 col-lg-5 tipspart_1">
            <img
              src="./images/lichee.jpg"
              alt=""
              class="img-fluid tips-image"
            />
            <h2 class="tips-head">Benefits of Lychee</h2>
            <h4 class="tips-body-text">
              Lychee offers more than 100% of the daily requirement of ascorbic
              acid in a single serving. This delicious fruit is cholesterol-free
              and contains vitamin C as a major antioxidant compound which helps
              in strengthening the immune system
            </h4>
          </div>
        </div>
        <div class="row d-flex justify-content-around mt-5"></div>
      </div>
    </div>
    <!-- Blog tips end -->

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
    <script src="js/star-ratings.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
  </body>
</html>
