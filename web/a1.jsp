
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%><%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%><%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.jfree.chart.plot.PlotOrientation"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="js/datetimepicker_css.js"></script>
		<script type="text/javascript" src="js/general.js"></script>
  <script language="JavaScript" src="js/security.js"></script><meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
</style>
<link rel="stylesheet" type="text/css" href="style.css" />
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #3d85c6;
}
</style><style type="text/css">
#slider { margin:0; padding:0; list-style:none; }
#slider ul,
#slider li { margin:0; padding:0; list-style:none; }
/* 
    define width and height of list item (slide)
    entire slider area will adjust according to the parameters provided here
*/
#slider li { width:966px; height:348px; overflow:hidden; }
p#controls { margin:0; position:relative; }
#prevBtn,
#nextBtn { display:block; margin:0; overflow:hidden; width:13px; height:28px; position:absolute; left: -13px; top:-210px; }
#nextBtn { left:966px; }
#prevBtn a { display:block; width:13px; height:28px; background:url(images/l_arrow.gif) no-repeat 0 0; }
#nextBtn a { display:block; width:13px; height:28px; background:url(images/r_arrow.gif) no-repeat 0 0; }
</style><style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

.navbar {
  overflow: hidden;

  background-color: #333;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 18px;  
  font-weight: bold;
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}
.active {
  background-color: red;
  color: white;
}
.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
    </head>
    <body background="images/bg-footer-intro.jpg">
     <form action="" method="post"><table width="1160" border="0" align="center" bgcolor="#FFFFFF">

  <tr>
      <td><div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="slideshow/home1-slideshow-1.jpg" style="width:100%">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="slideshow/home1-slideshow-2.jpg" style="width:100%">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="slideshow/home1-slideshow-3.jpg" style="width:100%">
  <div class="text">Caption Three</div>
</div>
 <div class="mySlides fade">
  <div class="numbertext">4/ 4</div>
  <img src="slideshow/home1-slideshow-4.jpg" style="width:100%">
  <div class="text">Caption Three</div>
</div>
<div class="mySlides fade">
  <div class="numbertext">5 / 5</div>
  <img src="slideshow/home1-slideshow-5.jpg" style="width:100%">
  <div class="text">Caption Three</div>
</div>
<a class="prev" onClick="plusSlides(-1)">❮</a>
<a class="next" onClick="plusSlides(1)">❯</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onClick="currentSlide(1)"></span> 
  <span class="dot" onClick="currentSlide(2)"></span> 
  <span class="dot" onClick="currentSlide(3)"></span> 
   <span class="dot" onClick="currentSlide(4)"></span> 
    <span class="dot" onClick="currentSlide(5)"></span> 
</div>

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
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script></td>
  </tr>
    <tr>
    <td> <div class="navbar">
    <a href="a1.jsp" class="active"><strong>HOME</strong></a>
    <div class="dropdown">
    <button class="dropbtn" disabled="true">STOCK_DETAIL    </button>
    <div class="dropdown-content">
    <a href="a2.jsp">Product</a>
    <a href="a3.jsp">Supplier </a>
	 <a href="a9.jsp">Add Chat  </a>
	   <a href="a7.jsp">Verify_Product</a>    </div>
  </div> 
   <div class="dropdown">
    <button class="dropbtn" disabled="true">REGISTER</button>
    <div class="dropdown-content">
   <a href="a4.jsp">Customer</a> 
   <a href="a8.jsp">Supplier</a>    </div>
  </div> 
     <div class="dropdown">
    <button class="dropbtn" disabled="true">TRANSACTION</button>
    <div class="dropdown-content">
   <a href="a5.jsp">Transaction</a>
   <a href="a6.jsp">Feedback </a>    </div>
  </div> 


 

  <a href="i2.jsp"><strong>LOGOUT</strong></a></div></td>
  </tr>
  <tr>
    <td height="516" align="center" bgcolor="#FFFFFF"><table width="902" border="0" align="center">
  <tr>
    <td width="896" height="56">HAI ADMIN ,</td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td height="404"><table width="896" border="0" align="center">
  <tr>
  
    <td width="435"><table width="435" height="264" border="0" align="center">
    
      <tr>
        <td width="429" height="225" align="center"><%
           
            
JDBCCategoryDataset dataset1 = new JDBCCategoryDataset("jdbc:mysql://localhost:3306/online2","com.mysql.jdbc.Driver","root","root");
try{
String query1="SELECT pname,count(nproduct) as p1 FROM purchase where status='Accept' group by pname";



dataset1.executeQuery(query1);
           // ResultSet res = sta.executeQuery("select products,rating,count(*) from details  group by rating");
         //int count;
            //String subject;

           // while (res.next())
           // {
              //  count = res.getInt("rating");
              //  subject = res.getString("products");
              //dataset.addValue(count,"enrollment count statistics", subject);  
           // }
        }
        catch (Exception e) { 
            System.err.println(e.getMessage());
        }   

       JFreeChart bar1 = ChartFactory.createBarChart3D("PURCHASE ORDER", "Name","Product",dataset1, PlotOrientation.HORIZONTAL,true, false, false);   
      //BarRenderer renderer = (BarRenderer) bar.getCategoryPlot().getRenderer();

        String fileName1 = "img/chart1.jpg";
        String file1 = application.getRealPath("/") + fileName1;

        try
        {
            FileOutputStream fileOut1 = new FileOutputStream(file1);
            ChartUtilities.writeChartAsPNG(fileOut1, bar1,493, 247);
            
        }
        catch (IOException e)
        {
             out.print(e);
        }




%>
            <img src="img/chart1.jpg" alt="subject Bar Chart" width="381" height="202" />
            <center>
          </center></td>
      </tr>
    </table></td>

    <td width="529"><table width="451" height="258" border="0" align="center">
    >
      <tr>
        <td width="445" height="219" align="center"><%
           
            
JDBCCategoryDataset dataset11 = new JDBCCategoryDataset("jdbc:mysql://localhost:3306/online2","com.mysql.jdbc.Driver","root","root");
try{
String query11="SELECT pname,sum(stock) as p1 FROM product  group by pname";



dataset11.executeQuery(query11);
           // ResultSet res = sta.executeQuery("select products,rating,count(*) from details  group by rating");
         //int count;
            //String subject;

           // while (res.next())
           // {
              //  count = res.getInt("rating");
              //  subject = res.getString("products");
              //dataset.addValue(count,"enrollment count statistics", subject);  
           // }
        }
        catch (Exception e) { 
            System.err.println(e.getMessage());
        }   

       JFreeChart bar11 = ChartFactory.createBarChart3D("STOCK REPORT", "Name","Product",dataset11, PlotOrientation.HORIZONTAL,true, false, false);   
      //BarRenderer renderer = (BarRenderer) bar.getCategoryPlot().getRenderer();

        String fileName11 = "img/chart2.jpg";
        String file11 = application.getRealPath("/") + fileName11;

        try
        {
            FileOutputStream fileOut11 = new FileOutputStream(file11);
            ChartUtilities.writeChartAsPNG(fileOut11, bar11,493, 247);
            
        }
        catch (IOException e)
        {
             out.print(e);
        }




%>
            <img src="img/chart2.jpg" alt="subject Bar Chart" width="311" height="218" />
            <center>
          </center></td>
      </tr>
    </table></td>
  </tr>
</table></td>
  </tr>
</table></td>
  </tr>
  <tr>
    <td >&nbsp;</td>
  </tr>
</table>

	 </form>
    </body>
</html>

