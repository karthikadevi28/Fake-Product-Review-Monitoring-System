<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

```
<title>About Us - E-Commerce</title>

<script type="text/javascript" src="js/datetimepicker_css.js"></script>
<script type="text/javascript" src="js/general.js"></script>
<script type="text/javascript" src="js/security.js"></script>

<style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: Arial, Helvetica, sans-serif;
        background: #f4f6f8;
        color: #333;
    }

    /* ================= NAVIGATION ================= */

    .navbar {
        background: #222;
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        box-shadow: 0 2px 8px rgba(0,0,0,0.15);
    }

    .navbar a {
        color: white;
        text-decoration: none;
        padding: 16px 22px;
        font-size: 15px;
        font-weight: 600;
        transition: 0.3s;
    }

    .navbar a:hover {
        background: #3d85c6;
    }

    .navbar a.active {
        background: #3d85c6;
    }

    /* ================= SLIDESHOW ================= */

    .slideshow-container {
        max-width: 1000px;
        position: relative;
        margin: auto;
        overflow: hidden;
    }

    .mySlides {
        display: none;
    }

    .mySlides img {
        width: 100%;
        height: 350px;
        object-fit: cover;
        display: block;
    }

    .prev,
    .next {
        cursor: pointer;
        position: absolute;
        top: 50%;
        padding: 15px;
        margin-top: -22px;
        color: white;
        font-weight: bold;
        font-size: 20px;
        transition: 0.3s;
        user-select: none;
        background: rgba(0,0,0,0.3);
    }

    .next {
        right: 0;
    }

    .prev:hover,
    .next:hover {
        background: rgba(0,0,0,0.7);
    }

    .numbertext {
        position: absolute;
        top: 10px;
        left: 10px;
        color: white;
        background: rgba(0,0,0,0.5);
        padding: 6px 10px;
        border-radius: 4px;
        font-size: 13px;
    }

    .text {
        position: absolute;
        bottom: 10px;
        width: 100%;
        text-align: center;
        color: white;
        font-size: 18px;
        font-weight: bold;
        text-shadow: 1px 1px 4px #000;
    }

    .dot-container {
        text-align: center;
        padding: 15px;
        background: white;
    }

    .dot {
        cursor: pointer;
        height: 12px;
        width: 12px;
        margin: 0 4px;
        background-color: #bbb;
        border-radius: 50%;
        display: inline-block;
        transition: 0.3s;
    }

    .dot:hover,
    .dot.active {
        background-color: #3d85c6;
    }

    .fade {
        animation: fade 1s;
    }

    @keyframes fade {
        from {
            opacity: .4;
        }

        to {
            opacity: 1;
        }
    }

    /* ================= MAIN CONTENT ================= */

    .container {
        max-width: 1100px;
        margin: 40px auto;
        padding: 0 20px;
    }

    .about-header {
        text-align: center;
        margin-bottom: 35px;
    }

    .about-header h1 {
        font-size: 36px;
        color: #222;
        margin-bottom: 12px;
    }

    .about-header p {
        color: #666;
        font-size: 16px;
        line-height: 1.7;
        max-width: 750px;
        margin: auto;
    }

    /* ================= ABOUT SECTION ================= */

    .about-section {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 30px;
        margin-bottom: 35px;
    }

    .about-card {
        background: white;
        padding: 35px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    }

    .about-card h2 {
        font-size: 24px;
        margin-bottom: 18px;
        color: #222;
    }

    .about-card p {
        color: #666;
        line-height: 1.8;
        font-size: 15px;
    }

    /* ================= WHY CHOOSE US ================= */

    .why-section {
        background: white;
        padding: 35px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        margin-bottom: 35px;
    }

    .why-section h2 {
        text-align: center;
        font-size: 26px;
        margin-bottom: 30px;
        color: #222;
    }

    .features {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
    }

    .feature {
        padding: 25px;
        text-align: center;
        border: 1px solid #e2e2e2;
        border-radius: 10px;
        transition: 0.3s;
    }

    .feature:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }

    .feature-icon {
        font-size: 35px;
        margin-bottom: 12px;
    }

    .feature h3 {
        font-size: 18px;
        margin-bottom: 10px;
        color: #333;
    }

    .feature p {
        color: #666;
        line-height: 1.6;
        font-size: 14px;
    }

    /* ================= MISSION ================= */

    .mission {
        background: #3d85c6;
        color: white;
        padding: 40px;
        text-align: center;
        border-radius: 12px;
        margin-bottom: 35px;
    }

    .mission h2 {
        font-size: 26px;
        margin-bottom: 15px;
    }

    .mission p {
        max-width: 800px;
        margin: auto;
        line-height: 1.8;
        font-size: 15px;
    }

    /* ================= FOOTER ================= */

    footer {
        background: #222;
        color: white;
        text-align: center;
        padding: 20px;
        margin-top: 30px;
    }

    footer p {
        color: #ccc;
        font-size: 14px;
    }

    /* ================= RESPONSIVE ================= */

    @media screen and (max-width: 768px) {

        .about-section {
            grid-template-columns: 1fr;
        }

        .features {
            grid-template-columns: 1fr;
        }

        .about-header h1 {
            font-size: 28px;
        }

        .mySlides img {
            height: 250px;
        }

        .navbar a {
            padding: 12px 14px;
            font-size: 14px;
        }
    }
</style>
```

</head>

<body>

```
<!-- ================= SLIDESHOW ================= -->

<div class="slideshow-container">

    <div class="mySlides fade">
        <div class="numbertext">1 / 5</div>
        <img src="slideshow/home1-slideshow-1.jpg">
        <div class="text">Quality Products</div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">2 / 5</div>
        <img src="slideshow/home1-slideshow-2.jpg">
        <div class="text">Simple & Easy Shopping</div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">3 / 5</div>
        <img src="slideshow/home1-slideshow-3.jpg">
        <div class="text">Great Value</div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">4 / 5</div>
        <img src="slideshow/home1-slideshow-4.jpg">
        <div class="text">Customer Satisfaction</div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">5 / 5</div>
        <img src="slideshow/home1-slideshow-5.jpg">
        <div class="text">Shop With Confidence</div>
    </div>

    <a class="prev" onclick="plusSlides(-1)">❮</a>
    <a class="next" onclick="plusSlides(1)">❯</a>

</div>

<div class="dot-container">
    <span class="dot" onclick="currentSlide(1)"></span>
    <span class="dot" onclick="currentSlide(2)"></span>
    <span class="dot" onclick="currentSlide(3)"></span>
    <span class="dot" onclick="currentSlide(4)"></span>
    <span class="dot" onclick="currentSlide(5)"></span>
</div>


<!-- ================= NAVIGATION ================= -->

<div class="navbar">

    <a href="index.jsp">HOME</a>

    <a href="i1.jsp">USER REGISTER</a>

    <a href="i2.jsp">LOGIN</a>

    <a href="i3.jsp">CHATBOT</a>

    <a href="i4.jsp" class="active">ABOUT US</a>

    <a href="i5.jsp">CONTACT US</a>

</div>


<!-- ================= MAIN CONTENT ================= -->

<div class="container">

    <!-- Header -->
   
    <div class="about-header">
        <IMG src="images/images (1).jpeg"/><br>
        <h1>About Us</h1>

        <p>
            Welcome to our E-Commerce Store, your trusted destination
            for quality products, great value, and a simple and
            convenient online shopping experience.
        </p>

    </div>


    <!-- About Cards -->

    <div class="about-section">

        <div class="about-card">

            <h2>Who We Are</h2>

            <p>
                We are an online shopping platform created with the goal
                of making shopping easier, faster, and more convenient.
                Our store brings a variety of useful and quality products
                together in one place.
            </p>

            <br>

            <p>
                We carefully focus on product quality, affordability,
                and customer satisfaction so that every customer can
                shop with confidence.
            </p>

        </div>


        <div class="about-card">

            <h2>Our Goal</h2>

            <p>
                Our goal is to provide customers with a smooth and
                reliable shopping experience from product selection
                to checkout and delivery.
            </p>

            <br>

            <p>
                We continuously work to improve our services and make
                online shopping simple, secure, and enjoyable for
                everyone.
            </p>

        </div>

    </div>


    <!-- Why Choose Us -->

    <div class="why-section">

        <h2>Why Choose Us?</h2>

        <div class="features">

            <div class="feature">

                <div class="feature-icon">✓</div>

                <h3>Quality Products</h3>

                <p>
                    We focus on providing products that meet our
                    standards for quality and value.
                </p>

            </div>


            <div class="feature">

                <div class="feature-icon">₹</div>

                <h3>Affordable Prices</h3>

                <p>
                    We aim to offer competitive prices while
                    maintaining good product quality.
                </p>

            </div>


            <div class="feature">

                <div class="feature-icon">♥</div>

                <h3>Customer First</h3>

                <p>
                    Customer satisfaction is our priority and
                    we are always ready to support you.
                </p>

            </div>


            <div class="feature">

                <div class="feature-icon">🛒</div>

                <h3>Easy Shopping</h3>

                <p>
                    Browse products, select what you need, and
                    enjoy a simple shopping experience.
                </p>

            </div>


            <div class="feature">

                <div class="feature-icon">🔒</div>

                <h3>Secure Experience</h3>

                <p>
                    We aim to provide a safe and dependable
                    environment for online shopping.
                </p>

            </div>


            <div class="feature">

                <div class="feature-icon">🚚</div>

                <h3>Reliable Service</h3>

                <p>
                    We are committed to providing a smooth and
                    dependable service to our customers.
                </p>

            </div>

        </div>

    </div>


    <!-- Mission -->

    <div class="mission">

        <h2>Our Mission</h2>

        <p>
            At our E-Commerce Store, we believe that a great shopping
            experience is built on quality, trust, convenience, and
            customer satisfaction. Our mission is to make online
            shopping simple, reliable, and accessible to everyone.
        </p>

    </div>

</div>


<!-- ================= FOOTER ================= -->

<footer>

    <p>
        © 2026 E-Commerce Store. All Rights Reserved.
    </p>

</footer>


<!-- ================= SLIDESHOW SCRIPT ================= -->

<script>

    let slideIndex = 1;

    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {

        let i;

        let slides =
            document.getElementsByClassName("mySlides");

        let dots =
            document.getElementsByClassName("dot");

        if (n > slides.length) {
            slideIndex = 1;
        }

        if (n < 1) {
            slideIndex = slides.length;
        }

        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }

        for (i = 0; i < dots.length; i++) {
            dots[i].className =
                dots[i].className.replace(" active", "");
        }

        slides[slideIndex - 1].style.display = "block";

        dots[slideIndex - 1].className += " active";
    }

    /* Automatic slideshow */

    setInterval(function() {
        plusSlides(1);
    }, 4000);

</script>
```

</body>
</html>
