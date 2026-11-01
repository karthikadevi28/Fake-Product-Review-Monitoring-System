<%-- 
    Document   : a9
    Created on : 30 Oct, 2025, 10:14:01 PM
    Author     : Loginn
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
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
.style1 {color: #FFFFFF}
.style2 {font-weight: bold}
.style3 {color: #000000}
</style>
    </head>
    <body background="images/bg-footer-intro.jpg">
    <form action="chatbot" method="post"><%
   String ok=(String)request.getAttribute("ok");
   String msg="";
   String a="";
   String b="";
    if(ok!=null)
   {
   msg=(String)request.getAttribute("msg");
    a=(String)request.getAttribute("a");
   b=(String)request.getAttribute("b");
     }
    %>
    <%
String flag1=(String)request.getAttribute("ss1");
	 String s1 = "";
		String s2 = "";
		String s3 = "";
                                         
 String s4 = "";
		String s5 = "";
		String s6 = "";                         
		String s7 = "";    


	if(flag1!=null)
	{		
		s1=(String)request.getAttribute("s1");
		s2=(String)request.getAttribute("s2");
		s3=(String)request.getAttribute("s3");
		s4=(String)request.getAttribute("s4");
		s5=(String)request.getAttribute("s5");
		s6=(String)request.getAttribute("s6");
        		s7=(String)request.getAttribute("s7");
                  
	

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
    <td height="516" align="center" bgcolor="#FFFFFF"><table width="951" height="428" border="0">
              <tr>
                <td height="424"><table width="729" border="1" align="center" bordercolor="#006666">
                    <tr>
                      <td width="723" height="61" ><div align="center" class="style69 style63 style27 style3"><strong> CHATBOT INPUT </strong></div></td>
                    </tr>
                    <tr>
                      <td height="175"><table width="507" border="0" align="center">
		     <tr>
              <td width="93" height="34"><span class="style67 style26 style6"><strong>Chat ID </strong></span></td>	
               <%
 int pro=0;
 int pro1=0;
 		try {
			int flag = 0;

			String url = "jdbc:mysql://localhost:3306/online2";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select max(cid) from chatbot");


          if (rs!=null) {  while(rs.next()){
				pro=Integer.parseInt(rs.getString(1));
				pro1=pro+1;
					s1=pro1+"";
                                                                               }
				}else{
				pro1=1000;
				s1=pro1+"";
				}
           %>
              <td width="300"><span class="style25">
                <label>
                <input type="text" name="a1" id="a1" class="displayValue" maxlength="10"  style="width:180px" onKeyPress="return numbersonly();" onChange="return val_zero('a1','err_a1');" 
											onblur="return val_mobile('a1','err_a1');" value="<%=s1%>"/>
&nbsp;&nbsp;&nbsp;                </label>
              </span></td>
              <td><span class="style25">&nbsp;&nbsp;
                  <input type="submit" name="search" value="Search" class="style71" onClick="return validatePage('a1','err_a1','Should Not Be Blank');"  />  
                  </span></td>
              <%
        }
        catch(Exception e)
        {
        out.println(e);
        } %>            </tr>
            <tr>
              <td width="93" height="30"><span class="style67 style26 style6"><strong>Question</strong></span></td>
              <td width="300"><span class="style25">
                <label>
                <textarea name="a2" class="displayValue" id="a2" style="width:180px" onBlur="return txt_empty('a2','err_a2','Should Not Be Blank');" onChange="return val_zero('a2','err_a2');" ><%=s2%></textarea>
&nbsp;&nbsp;&nbsp;                </label>
              </span></td>
              <td><span class="style25">&nbsp;&nbsp;  </span></td>
            </tr>


            <tr>
              <td height="30"><span class="style67 style26 style6"><strong>Answer</strong></span></td>
              <td><span class="style25">
                <label>
                 <textarea name="a3" class="displayValue" id="a3" style="width:180px" onBlur="return txt_empty('a3','err_a3','Should Not Be Blank');" onChange="return val_zero('a3','err_a3');"><%=s3%></textarea>
&nbsp;&nbsp;                </label>
              </span></td>
              <td><span class="style25">&nbsp;&nbsp;  </span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td><span class="style25">&nbsp;&nbsp;  </span></td>
            </tr>
          <tr>
                      <td class="style2 style25">
                        </td>
                      <td class="style2 style25"><input type="submit" name="Add" value="Add" class="style71" onClick="return validatePage('a1|a2|a3','err_a1|err_a2|err_a3','Should Not Be Blank|Should Not Be Blank|Should Not Be Blank');"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="update" value="Update" class="style71" onClick="return validatePage('a1|a2|a3|a4|a5','err_a1|err_a2|err_a3|err_a4|err_a5','Should Not Be Blank|Should Not Be Blank|Should Not Be Blank|Should Not Be Blank|Should Not Be Blank');"  />&nbsp;&nbsp;  &nbsp;&nbsp;  <input type="submit" name="Delete" value="Delete" class="style71" onClick="return validatePage('a1','err_a1','Should Not Be Blank|Should Not Be Blank|Should Not Be Blank|Should Not Be Blank|Should Not Be Blank');"  />
                      &nbsp;&nbsp;  &nbsp;&nbsp;
                        <input name="cancel" type="reset" class="style71" value="Cancel" /></td>
                      <td width="100" class="style2"><span class="style25">
                        <label>
                        
                        
                        </label>
                      </span></td>
              </tr>
          </table></td>
                    </tr>
                  </table>
                  <p>&nbsp;</p>
                 <table width="936" border="1" align="center" bordercolor="#006666">
        <tr>
          <td width="930" height="35" align="center" bgcolor="#006600"><span class="style1 style65"><strong>CHATBOT DETAIL </strong></span></td>
        </tr>
        <tr>
          <td height="84" align="center" bgcolor="#FFFFFF"><table width="931" height="89" border="0">
  <tr>
			   
              <td width="120" height="38" align="center" ><span class="style4 style67 style69 style1 style3"><strong>CID</strong></span></td>
              <td width="396" align="center" ><span class="style4 style67 style69 style1 style3"><strong>QUESTION</strong></span></td>
              <td width="401" align="center" ><span class="style4 style67 style69 style1 style3"><strong>ANSWER</strong></span></td>
		      </tr>

		
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
                
		ResultSet rs = st.executeQuery("select * from chatbot");

    while(rs.next())
		{	
       		
	 %>
            <tr>
			    <td width="119" height="45" align="center"><%=rs.getString(1)%></td>
              <td width="395" align="center"><%=rs.getString(2)%></td>
          <td width="402" align="center"><%=rs.getString(3)%></td>
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

