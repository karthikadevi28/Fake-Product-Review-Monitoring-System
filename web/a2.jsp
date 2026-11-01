
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
  <form action="aproduct" method="post">
<%
   String ok=(String)request.getAttribute("ok");
   String msg="",a1="",a2="",a3="",a4="",a5="",a6="",a7="",a8="",a9="",a10="";
  int v,v1,v2=0;
    if(ok!=null)
   {
   msg=(String)request.getAttribute("msg");

     }
     String ok1=(String)request.getAttribute("ok1");
     if(ok1!=null)
   {
   a10=(String)request.getAttribute("a1");
   v2=Integer.parseInt(a10);
    a2=(String)request.getAttribute("a2");
     a3=(String)request.getAttribute("a3");
      a4=(String)request.getAttribute("a4");
       a5=(String)request.getAttribute("a5");
        a6=(String)request.getAttribute("a6");
         a7=(String)request.getAttribute("a7");
		  a8=(String)request.getAttribute("a8"); a9=(String)request.getAttribute("a9");
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
    <td height="516" align="center" bgcolor="#FFFFFF"><table width="692" border="1" align="center" bordercolor="#003366">
            
        <tr>
          <td width="686" height="41" align="center" nowrap="nowrap" ><span class="style2">ADD PRODUCT</span></td>
        </tr>
        <tr>
          <td height="475" align="center"><table width="624" border="0">
            <% int index=0;
	try
	{
            String a11=null;
             	   HttpSession so = request.getSession(true);
 System.out.println(a11);

		int flag=0;
		String url="jdbc:mysql://localhost:3306/online2";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st=con.createStatement();
                Statement st1=con.createStatement();
                Statement st2=con.createStatement();
                Statement st3=con.createStatement();
                
		ResultSet rs = st.executeQuery("select max(pid) from product");

    if(rs.next())
		{	
       		v1=Integer.parseInt(rs.getString(1));	
                            
                v2=v1+1;
                	}	
	 %><tr>
              <td width="216" height="31">Product Id </td>
              <td width="9">&nbsp;</td>
      <td width="385" align="left"><label>
                      <input type="text" name="a1" value="<%=v2%>" >
              </label><input name="s4" type="submit"  value="Search"/></td>
            </tr>
              <%
 
                           								
													
													}
	catch (Exception e) {
		out.println(e);
	}
	%>
            <tr>
              <td height="39">Product Name </td>
              <td>&nbsp;</td>
              <td align="left"><label>
                <input type="text" name="a2" value="<%=a2%>">
              </label></td>
            </tr>
			<tr>
              <td height="38">Category</td>
              <td>&nbsp;</td>
              <td align="left"><label>
                <input type="text" name="a8" value="<%=a8%>">
              </label></td>
            </tr>
            <tr>
              <td height="34">Product image </td>
              <td>&nbsp;</td>
              <td align="left"><label>
                <input type="file" name="a3" style="width:80%" value="<%=a3%>">
              </label></td>
            </tr>
            <tr>
              <td height="98">Details</td>
              <td>&nbsp;</td>
              <td align="left"><label>
              <textarea name="a4" cols="25" rows="5"><%=a4%></textarea>
              </label></td>
            </tr>
            <tr>
              <td height="38">Price</td>
              <td>&nbsp;</td>
              <td align="left"><label>
                <input type="text" name="a5" value="<%=a5%>">
              </label></td>
            </tr>
            <tr>
              <td height="34">Discount</td>
              <td>&nbsp;</td>
              <td align="left"><label>
                <input type="text" name="a6" value="<%=a6%>">
              </label></td>
            </tr>
              <tr>
              <td height="34">No of Stock</td>
              <td>&nbsp;</td>
              <td align="left"><label>
                <input type="text" name="a7" value="<%=a7%>">
              </label></td>
            </tr>   <tr>
              <td height="34">Type</td>
              <td>&nbsp;</td>
              <td align="left"><label>
                <input type="text" name="a9" value="<%=a9%>">
              </label></td>
            </tr>
            <tr>
              <td height="30">&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td><label>
          <input name="s1" type="submit"  value="Added">
          &nbsp;&nbsp;&nbsp;&nbsp;<input name="s3" type="submit"  value="Updated">
          &nbsp;&nbsp;&nbsp;&nbsp;<input name="s5" type="submit"  value="Deleted">
          &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" name="s2" value="Cancel" >
        </label></td>
            </tr>
          </table>
          <%=msg%></td>
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

