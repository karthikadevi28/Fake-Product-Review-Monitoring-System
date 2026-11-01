<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<link href="style.css" rel="stylesheet" type="text/css" />
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
     <form action="update" method="post">
          <%
   String ok=(String)request.getAttribute("ok");
   String msg="";
 
    if(ok!=null)
   {
   msg=(String)request.getAttribute("msg");

     }
    %><table width="1160" border="0" align="center" bgcolor="#FFFFFF">

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
    <span class="dot" onClick="currentSlide(5)"></span></div>

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
    <td><div class="navbar">
    <a href="u1.jsp" class="active">HOME</a>
	<a href="u2.jsp">PROFILE</a>
<div class="dropdown">
    <button class="dropbtn" disabled="true">PRODUCT   </button>
    <div class="dropdown-content">     <% int index=0;
	
	String aa=request.getParameter("aa1");
	try
	{
	   
            String a11=null;
             	 
 System.out.println(a11);

		int flag=0;
		String url="jdbc:mysql://localhost:3306/online2";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st=con.createStatement();
                Statement st1=con.createStatement();
                Statement st2=con.createStatement();
                Statement st3=con.createStatement();
                
		ResultSet rs = st.executeQuery("select distinct type from product " );

    while(rs.next())
		{	
       		
	 %>
    <a href="u3.jsp?pname=<%=rs.getString(1)%>"><%=rs.getString(1)%></a>
	  <%
 
                                     } 								
													
													}
	catch (Exception e) {
		out.println(e);
	}
	%>
     </div>
  </div> 
	<a href="u5.jsp">ORDER_DETAIL</a>
	<a href="u6.jsp">FEEDBACK</a>

 

  <a href="i2.jsp">LOGOUT</a>
 
</div></td>
  </tr>
  <tr>
    <td height="516" align="center" ><table width="967" border="0" align="center">
      <%
	  HttpSession so = request.getSession(true);
	  String a=(String)so.getAttribute("un");
	 %>
  <tr>
    <td width="961" height="56">Welcome <%=a%> ,</td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td height="404"><table width="649" border="1" align="center"  bordercolor="#003366">
  <tr>
    <td width="639" height="38" align="center"><h2>Profile Updation </h2></td>
  </tr>
  <tr>
    <td height="257"><table width="509" border="0" align="center"> <% 
	try
	{
	   
            String a11=null;
             	   
 System.out.println(a11);
java.util.Date st11 = new java.util.Date();
                // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String f = formatter.format(st11);
                System.out.println("Formatted date is ==>" + f);
		int flag=0;
		String url="jdbc:mysql://localhost:3306/online2";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st=con.createStatement();
                Statement st1=con.createStatement();
                Statement st2=con.createStatement();
                Statement st3=con.createStatement();
                
		ResultSet rs = st.executeQuery("Select * from register where username='"+so.getAttribute("un")+"'");

    if(rs.next())
		{	
       		
	 %>
    
      <tr>
        <td width="189" height="29">Full Name</td>
        <td width="13">&nbsp;</td>
        <td width="293"><label>
          <input type="text" name="a1" value="<%=rs.getString(3)%>">
        </label></td>
      </tr>
      <tr>
        <td height="30">Address</td>
        <td>&nbsp;</td>
        <td><label>
          <input type="text" name="a2" value="<%=rs.getString(4)%>">
        </label></td>
      </tr>
      <tr>
        <td height="30">Contact No </td>
        <td>&nbsp;</td>
        <td><label>
          <input type="text" name="a3" value="<%=rs.getString(5)%>">
        </label></td>
      </tr>
      <tr>
        <td height="32">Email-Id</td>
        <td>&nbsp;</td>
        <td><label>
          <input type="text" name="a4" value="<%=rs.getString(6)%>">
        </label></td>
      </tr>
        <tr>
        <td height="38">Gender</td>
        <td>&nbsp;</td>
        <td><label>
                <input type="text" name="a5" value="<%=rs.getString(7)%>" readonly="true">
     
        </label></td>
      </tr>
      <tr>
        <td height="30">Age</td>
        <td>&nbsp;</td>
        <td><label>
          <select name="a6" style="width:70%">
            <option value="<%=rs.getString(8)%>"><%=rs.getString(8)%></option>
            <option value="Select"> Select</option>
            <option value="20-30">20-30</option>
            <option value="30-40">30-40</option>
            <option value="40-50">40-50</option>
          </select>
        </label></td>
      </tr>   <tr>
        <td height="32">New Password </td>
        <td>&nbsp;</td>
        <td><label>
          <input type="password" name="a7" >
        </label></td>
      </tr>
        <tr>
        <td height="38">Retype Password </td>
        <td>&nbsp;</td>
        <td><label>
                <input type="password" name="a8" >
     
        </label></td>
      </tr>
	 <tr>
        <td height="29">&nbsp;</td>
        <td>&nbsp;</td>
        <td><label></label></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td><label>
          <input name="s1" type="submit" class="style3" style="width:80px; height:30px; background:#336633" value="Update">
          &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" name="s2" value="Cancel" class="style3" style="width:80px; height:30px; background:#336633">
        </label></td>
      </tr>
   <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td><%=msg%></td>
      </tr><%
 
                                     } 								
													
													}
	catch (Exception e) {
		out.println(e);
	}
	%>
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

