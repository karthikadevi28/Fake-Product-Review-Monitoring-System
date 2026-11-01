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
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
</style>
    </head>
    <body background="images/bg-footer-intro.jpg">
     <form action="purchase" method="post">
           	<%
   String ok=(String)request.getAttribute("ok");
   String msg="";
 String a11="";
 String a12="";
    if(ok!=null)
   {
   msg=(String)request.getAttribute("msg");
   a11=(String)request.getAttribute("a1");
   a12=(String)request.getAttribute("a2");
   
   

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
<a class="prev" onClick="plusSlides(-1)">â®</a>
<a class="next" onClick="plusSlides(1)">â¯</a>

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
    <td height="516" align="center" ><table width="992" border="0" align="center">
      <%
	  HttpSession so = request.getSession(true);
	  String a=(String)so.getAttribute("un");
	 %>
  <tr>
    <td width="986" height="56">Welcome <%=a%> ,</td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td height="404" align="center"><table width="674" border="0">
		   <%
                   int v,v1,v2=0,v3=0,v4=0,v5=0;
String b1=null,b2=null,b3=null,b4=null,b5=null,b6,b7;
String amt=null,dis=null;
	try
	{
	   
            
                 
 System.out.println(  so.getAttribute("a1"));

		int flag=0;
		String url="jdbc:mysql://localhost:3306/online2";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st=con.createStatement();
                Statement st1=con.createStatement();
                Statement st2=con.createStatement();
                Statement st3=con.createStatement();
                
		ResultSet rs = st.executeQuery("select * from product where  pid='"+ so.getAttribute("a1")+"'");

    if(rs.next())
		{	
       	b1=rs.getString(1);
        	b2=rs.getString(2);
                	b3=rs.getString(5);
                        	b4=rs.getString(7);
                                	
                                        
                                        
            v1=Integer.parseInt(rs.getString(5));
                v2=Integer.parseInt(rs.getString(6));
                v3=(v1*v2)/100;
                v4=v1-v3;
                dis=v3+"";
                amt=v4+"";
                            
	 %>
            <tr>
			         <td width="668" height="35" align="center"></td>
              
              </tr>
			    <tr>
			         <td width="668" height="716" align="center"><table width="649" height="29" border="0">
                       <tr>
                         <td width="386"><img src="product//<%=b1%>.jpg" width="262" height="211" /><table width="386" border="0" cellspacing="10px">
                           <tr>
                             <td width="144">Product Id </td>
                             <td width="6">&nbsp;</td>
                        <td width="190"><label>
                                     <input type="text" name="a1" value="<%=b1%>">
                             </label></td>
                           </tr>
                           <tr>
                             <td>Product Name </td>
                             <td>&nbsp;</td>
                             <td><label>
                               <input type="text" name="a2" value="<%=b2%>">
                             </label></td>
                           </tr>
                           <tr>
                             <td>Price </td>
                             <td>&nbsp;</td>
                             <td><label>
                               <input type="text" name="a3" value="<%=b3%>">
                             </label></td>
                           </tr>
                           <tr>
                             <td>Discount</td>
                             <td>&nbsp;</td>
                             <td><label>
                               <input type="text" name="a4" value="<%=dis%>">
                             </label></td>
                           </tr>
						       <tr>
                             <td>Amount</td>
                             <td>&nbsp;</td>
                             <td><label>
                                     <input type="text" name="a5" value="<%=amt%>">
                             </label></td>
                           </tr>
                                <tr>
                             <td>Stock Available</td>
                             <td>&nbsp;</td>
                             <td><label>
                             <input type="text" name="a32" value="<%=b4%>" />
                             </label></td>
                           </tr>
                           <tr>
                             <td>No of Product </td>
                             <td>&nbsp;</td>
                             <td><label>
                               <input type="text" name="a6" value="<%=a11%>">
                             </label></td>
                           </tr>
						     
						       <tr>
                             <td>&nbsp;</td>
                             <td>&nbsp;</td>
                             <td>&nbsp;</td>
                           </tr>  <tr>
                             <td>&nbsp;</td>
                             <td>&nbsp;</td>
                             <td><label>
                                <input name="s1" type="submit" class="style1" style="width:80px; height:30px; background:#336633" value="Submit">
                                &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" name="s2" value="Cancel" class="style1" style="width:80px; height:30px; background:#336633">
                             </label></td>
                           </tr>  </table><%if(request.getParameter("s1")!=null){%><table align="center">
                           <tr>
                             <td width="133">Total Cost </td>
                             <td width="10">&nbsp;</td>
                             <td width="195"><label>
                                     <input type="text" name="a7" value="<%=a12%>">
                             </label></td>
                           </tr>
                         <tr>
                             <td>Credit Card </td>
                             <td>&nbsp;</td>
                             <td><label>
                               <input type="text" name="a8" value="">
                             </label></td>
                           </tr>
						   <tr>
                             <td>CV </td>
                             <td>&nbsp;</td>
                             <td><label>
                               <input type="text" name="a9" value="">
                             </label></td>
                           </tr>
						     <tr>
                             <td>Credit Card </td>
                             <td>&nbsp;</td>
                             <td><label>
                               <input type="text" name="a10" value="">
                             </label></td>
                           </tr>
						   <tr>
                             <td>&nbsp;</td>
                             <td>&nbsp;</td>
                             <td><label>
                                <input name="s3" type="submit" class="style1" style="width:80px; height:30px; background:#336633" value="Payment">
                                &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" name="s4" value="Cancel" class="style1" style="width:80px; height:30px; background:#336633">
                             </label></td>
                           </tr> 
                           <tr>
                             <td>&nbsp;</td>
                             <td>&nbsp;</td>
                             <td>&nbsp;</td>
                           </tr>
                                     </table><%}%><p><%=msg%></p></td>
                         <td width="253"><table width="288" border="0">
  <tr>
    <td width="282"></td>
  </tr>

    <tr>
    <td height="36"><table width="303" border="0">
      <tr>
        <td width="293" bgcolor="">RECOMMENDED PRODUCT</td>
      </tr>
      <tr>
        <td><table width="296" border="0">
		<%try
	{
	   
            
             	   
                 
         String f1=request.getParameter("f1");
String cc="";
		int flag1=0;
		String url1="jdbc:mysql://localhost:3306/online2";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con1=DriverManager.getConnection(url1,"root","root");
		Statement st11=con.createStatement();
                Statement st21=con.createStatement();
                Statement st12=con.createStatement();
                Statement st13=con.createStatement();
                System.out.print("select * from product where pname like '%"+b2+"%' ");
		ResultSet rs1 = st11.executeQuery("select * from product where pname like '%"+b2+"%' ");

   while(rs1.next())
		{	
		
		cc=rs1.getString(1);
		
		%>
          <tr>
            <td width="286"><img src="product\\<%=cc%>.jpg" width="287" height="234" /></td>
          </tr>
          <tr>
            <td align="center"><BUTTON name="f2" value="<%=cc%>" type="submit" class="style3 style1" style="width:120px; height:30px; background:#336633" >CLICK TO PURCHASE </BUTTON></td>
          </tr>           <%
 
                               							
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
    <tr>
    <td height="36">&nbsp;</td>
  </tr>
    <tr>
    <td height="219">&nbsp;</td>
  </tr>
</table>
</td>
                       </tr>
                     </table><table width="684" border="0">
  <tr>
    <td width="634" height="25" align="center"><strong>FEEDBACK</strong></td>
  </tr>
  <tr>
    <td><table width="763" border="0">
		
		   <% 
	try
	{
	   
        
             	  
 System.out.println(a11);

		
	
                
		ResultSet rs1 = st.executeQuery("select * from feedback where pid='"+b1+"'");

    while(rs1.next())
		{	
       		
	 %>
           <tr>
			
               <td width="757"> Customer Name : <%=rs1.getString(7)%></td></tr>
		    <tr>
			
               <td width="757"> Rating : <%=rs1.getString(5)%></td></tr>
           <tr>
		   <td width="757">Feedback: <%=rs1.getString(8)%></td>
            </tr>
			  <tr>
		   <td width="757">Description: <%=rs1.getString(6)%></td>
            </tr>  <tr>
		   <td width="757">Status: <%=rs1.getString(10)%></td>
            </tr>  <%
 
                                     } 								
													
													}
	catch (Exception e) {
		out.println(e);
	}
	%>
          </table></td>
  </tr>
</table>
</td>
              
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
  <tr>
    <td >&nbsp;</td>
  </tr>
</table>

	 </form>
    </body>
</html>

