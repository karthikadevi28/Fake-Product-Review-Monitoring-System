<%-- 
    Document   : Stemming
    Created on : 25 Jul, 2026, 7:49:01 PM
    Author     : asvpp
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%-- 
    Document   : Stemming
    Created on : 25 Jul, 2026, 7:49:01 PM
    Author     : asvpp
--%>

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
     <table width="1160" border="0" align="center" bgcolor="#FFFFFF">

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
<a href="index.jsp">HOME</a><a href="i1.jsp">USER REGISTER </a><a href="i2.jsp">LOGIN</a><a href="i3.jsp">CHATBOT</a><a href="i4.jsp">ABOUTUS</a><a href="i5.jsp" class="active">CONTACTUS</a>

</div></td>
  </tr>
  <tr>
    <td height="516" align="center" bgcolor="#FFFFFF"><form id="form1" method="post" action="Annota"><table width="900" border="1" align="center" bgcolor="#FFFFFF" bordercolor="#0099CC">

  <tr>
    <td height="84" align="center" bgcolor="#006699">STOPWORD AND PREPOCESSING</td>
  </tr>
  <tr>
    <td height="171">
                      <%

String chk=(String)request.getAttribute("chk");
String line=(String)request.getAttribute("ok");
String line1=(String)request.getAttribute("ok2");
//Arrayli u=(String)request.getAttribute("ok1");
  
String mes="";
if(chk!=null)
{ 
    mes=(String)request.getAttribute("mes");
    
    
    
}  

%>
		    <p>
		    
		      <button class="button button1" name="button2" >Stopwords</button>
<button class="button button2" name="button3">Stemmer</button><button name="pos" >POS TAG</button>
		   <!--   <input type="submit" name="button2" id="stop" value="Stopwords" />
		      <input type="submit" name="button3" id="stemm" value="Stemmer" /> -->
		     
	        <label><br>
	        <br>
	        STEMMING WORDS</label>
		      <label for="textfield"></label>
            </p>
		    <p>
		      <%if(request.getParameter("button2")!=null){%>
		      <label for="textarea2"></label>
		      <textarea name="textarea2" id="stop" cols="45" rows="5" ><%=line%></textarea>
		      <%}%>
	    </p>
		    <p>
		      <label for="textarea3"></label>
		      <%
                      ArrayList al=(ArrayList)request.getAttribute("ok1");
			if(al!=null)
			{
			Iterator it;
			it=al.iterator();
			
                      %>
              <textarea name="textarea3" id="stemm" cols="45" rows="5"><%while(it.hasNext())
			{%><%=it.next()%><%}}%>
		              </textarea>
            </p>
		    <p>
		      <label for="textarea4"></label>
                       <%if(request.getParameter("button4")!=null){%>
		      <textarea name="textarea4" id="syn" cols="45" rows="5"><%=line1%></textarea>
                       <%}%>
		      <label for="textarea5"></label>
		    </p>
                    <%=mes%>
                    <%
            String lines="",lines1="";
            int pcount=0;
            int ncount=0;
            
            if(request.getParameter("pre")!=null)
            {
           
         String srs="";
           BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\Karthika Devi\\OneDrive\\Documents\\output.txt"));
            while ((srs = br.readLine()) != null) {
               lines=lines +""+srs;
            }
            out.println(lines);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/anntoating?","root","root");
            Statement st=con.createStatement();
            
                ResultSet rs1=st.executeQuery("select * from posword1");
                while(rs1.next())
                {
                  //  if(lines.contains(rs1.getString(1)+"/NN") )
                   if(lines.contains(rs1.getString(1)) )
                   {
                       pcount=pcount+1;
                       out.println(rs1.getString(1));
                   }
                }
                Statement st2=con.createStatement();
                ResultSet rs2=st.executeQuery("select * from negword1");
                while(rs2.next())
                {
                   if(lines.contains(rs2.getString(1).trim()+"/NN") )
                   {
                       ncount=ncount+1;
                       out.println(rs2.getString(1));
                       
                   }
                }
            
            if(pcount>ncount){
                lines1="positive";
            }else if(pcount<ncount){
                lines1="negative";
            }else if(pcount==ncount){
                lines1="Intermediate";
            }else{
                lines1="no Comments";
            }
            
            
            }
            
            %>

            <table align="center" width="500">
                <tr><td height="50"><div align="center"><input type="submit" name="pre" value="Preprocess"></div></td>
              <tr><td><div align="center">
                                        <table align="center" width="500">
                                            <tr><td bgcolor="#006699"><div align="center" class="style1">Positive</div></td>
                                            <td bgcolor="#006699"><div align="center" class="style1">Negative</div></td>
                                            </tr>
                                                <tr><td><div align="center"><%=pcount%></div></td><td><div align="center"><%=ncount%></div></td></tr>
                                              <tr><td  bgcolor="#006699"><div align="center" class="style1">Result</div></td><td  bgcolor="#006699"><div align="center" class="style1">Negative</div></td></tr>
                                                <tr><td><div align="center"><%=lines1%></div></td><td><div align="center"><%=ncount%></div></td></tr>   
                                        </table>
                        </div>
            </table>
	  </td>
  </tr>
</table></form></td>
  </tr>
  <tr>
    <td >&nbsp;</td>
  </tr>
</table>


    </body>
</html>



