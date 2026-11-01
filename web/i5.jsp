<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

```
<title>Contact Us - E-Commerce</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, Helvetica, sans-serif;
        background: #f5f7fa;
        color: #333;
    }

    /* Navigation Bar */
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

    /* Main Container */
    .container {
        max-width: 1100px;
        margin: 40px auto;
        padding: 0 20px;
    }

    /* Header */
    .contact-header {
        text-align: center;
        margin-bottom: 35px;
    }

    .contact-header h1 {
        font-size: 36px;
        color: #222;
        margin-bottom: 10px;
    }

    .contact-header p {
        color: #666;
        font-size: 16px;
        line-height: 1.6;
    }

    /* Contact Layout */
    .contact-section {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 30px;
    }

    /* Contact Information */
    .contact-info {
        background: white;
        padding: 35px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    }

    .contact-info h2 {
        color: #222;
        margin-bottom: 20px;
        font-size: 24px;
    }

    .contact-item {
        display: flex;
        align-items: flex-start;
        margin-bottom: 25px;
    }

    .contact-icon {
        font-size: 24px;
        width: 45px;
    }

    .contact-item h3 {
        font-size: 16px;
        margin-bottom: 5px;
        color: #333;
    }

    .contact-item p {
        color: #666;
        line-height: 1.5;
    }

    /* Customer Support */
    .support-box {
        margin-top: 25px;
        padding: 20px;
        background: #f1f7fc;
        border-left: 4px solid #3d85c6;
        border-radius: 6px;
    }

    .support-box h3 {
        margin-bottom: 10px;
        color: #3d85c6;
    }

    .support-box p {
        color: #555;
        line-height: 1.6;
    }

    /* Contact Form */
    .contact-form {
        background: white;
        padding: 35px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    }

    .contact-form h2 {
        margin-bottom: 20px;
        font-size: 24px;
        color: #222;
    }

    .form-group {
        margin-bottom: 18px;
    }

    .form-group label {
        display: block;
        margin-bottom: 7px;
        font-weight: 600;
        color: #444;
    }

    .form-group input,
    .form-group textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
        outline: none;
    }

    .form-group input:focus,
    .form-group textarea:focus {
        border-color: #3d85c6;
        box-shadow: 0 0 4px rgba(61,133,198,0.2);
    }

    .form-group textarea {
        height: 120px;
        resize: vertical;
    }

    .submit-btn {
        width: 100%;
        padding: 13px;
        border: none;
        border-radius: 6px;
        background: #3d85c6;
        color: white;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
    }

    .submit-btn:hover {
        background: #286aa5;
    }

    /* Business Hours */
    .business-hours {
        margin-top: 25px;
        padding-top: 20px;
        border-top: 1px solid #ddd;
    }

    .business-hours h3 {
        margin-bottom: 10px;
    }

    .business-hours p {
        line-height: 1.8;
        color: #555;
    }

    /* Footer */
    footer {
        margin-top: 50px;
        background: #222;
        color: white;
        text-align: center;
        padding: 20px;
    }

    footer p {
        font-size: 14px;
        color: #ccc;
    }

    /* Responsive Design */
    @media screen and (max-width: 768px) {

        .contact-section {
            grid-template-columns: 1fr;
        }

        .contact-header h1 {
            font-size: 28px;
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
<!-- Navigation -->
<div class="navbar">
    <a href="index.jsp">HOME</a>
    <a href="i1.jsp">USER REGISTER</a>
    <a href="i2.jsp">LOGIN</a>
    <a href="i3.jsp">CHATBOT</a>
    <a href="i4.jsp">ABOUT US</a>
    <a href="i5.jsp" class="active">CONTACT US</a>
</div>

<!-- Main Content -->
<div class="container">

    <div class="contact-header">
        <IMG src="images/images.jpeg"/>
        <h1>Contact Us</h1>
        <p>
            We're here to help! If you have questions about our products,
            orders, delivery, payments, or returns, feel free to contact us.
        </p>
    </div>

    <div class="contact-section">

        <!-- Contact Information -->
        <div class="contact-info">

            <h2>Get in Touch</h2>

            <div class="contact-item">
                <div class="contact-icon">📧</div>
                <div>
                    <h3>Email</h3>
                    <p>ecommerce@gmail.com</p>
                </div>
            </div>

            <div class="contact-item">
                <div class="contact-icon">📞</div>
                <div>
                    <h3>Phone</h3>
                    <p>9876543210</p>
                </div>
            </div>

            <div class="contact-item">
                <div class="contact-icon">📍</div>
                <div>
                    <h3>Address</h3>
                    <p>Pollachi, Tamil Nadu, India</p>
                </div>
            </div>

            <div class="support-box">
                <h3>Customer Support</h3>
                <p>
                    Our customer support team is happy to assist you with
                    your questions and concerns. Please include your
                    order number when contacting us about an existing
                    order so we can help you faster.
                </p>
            </div>

            <div class="business-hours">
                <h3>Business Hours</h3>
                <p>
                    Monday – Saturday: 9:00 AM – 6:00 PM<br>
                    Sunday: Closed
                </p>
            </div>

        </div>

        <!-- Contact Form -->
        <div class="contact-form">

            <h2>Send Us a Message</h2>

            <form action="#" method="post">

                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text"
                           id="name"
                           name="name"
                           placeholder="Enter your name"
                           required>
                </div>

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email"
                           id="email"
                           name="email"
                           placeholder="Enter your email"
                           required>
                </div>

                <div class="form-group">
                    <label for="order">Order Number</label>
                    <input type="text"
                           id="order"
                           name="order"
                           placeholder="Enter order number (optional)">
                </div>

                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea id="message"
                              name="message"
                              placeholder="Write your message here..."
                              required></textarea>
                </div>

                <button type="submit" class="submit-btn">
                    Send Message
                </button>

            </form>

        </div>

    </div>

</div>

<!-- Footer -->
<footer>
    <p>
        © 2026 E-Commerce Website. All Rights Reserved.
    </p>
</footer>
```

</body>
</html>
