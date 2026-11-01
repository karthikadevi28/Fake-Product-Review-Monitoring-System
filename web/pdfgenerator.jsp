<%-- 
    Document   : pdfgenerator
    Created on : 31 Oct, 2025, 12:11:26 AM
    Author     : Loginn
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="application/vnd.ms-excel" %>

<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>

<% response.setHeader("content-disposition","attachment; filename=Application.doc");%>
<html>
<head>
<title>Inserting data in Excel Sheet Using JSP</title>
<style type="text/css">
<!--
.style1 {
	color: #66FF00;
	font-weight: bold;
}
-->
</style>
</head>
<body> 	<%												
String FromDate=(String)request.getAttribute("FromDate");
String ToDate=(String)request.getAttribute("ToDate");%>
<table  border="1">
												<tr class="lab-des" bgcolor="#038D8A">
													
														
														<td width="159" height="50" align="center" bgcolor="#000000">
														  <span class="style1">PID</span> </td>
													    <td width="156" align="center" bgcolor="#000000">
														<span class="style1">PRODUCT NAME</span></td>
													    <td width="230" align="center" bgcolor="#000000">
														<span class="style1">PRODUCT DESCRIBTION</span></td>
                                                        <td width="149" align="center" bgcolor="#000000">
														<span class="style1">TYPE</span></td>		
												
														  <td width="192" align="center" bgcolor="#000000">
														<span class="style1">QUANTITY</span></td>	
														 <td width="183" align="center" bgcolor="#000000">
														<span class="style1">DATE</span></td>	
														
												</tr>
												<% 	


		 java.util.Date st11 = new java.util.Date();
                    // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10

                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    String f = formatter.format(st11);
                    System.out.println("Formatted date is ==>" + f);							
												
/*System.out.println(FromDate);
System.out.println(ToDate);
System.out.println(Age1);
System.out.println(Age2);
System.out.println(Occupation);
System.out.println(Qualification);
System.out.println(Category);*/
												
													
 			try {
			int flag = 0;
			String max=null;
			String url = "jdbc:mysql://localhost:3306/online2";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "root");
			Statement st = con.createStatement();
		
			ResultSet rs1 = st.executeQuery("select * from product where pid ='"+FromDate+"' and pname= '"+ToDate+"'");	

				while(rs1.next()) {
				
				String Name= rs1.getString(1);
				String ComplaintSubject= rs1.getString(2);
				String ComplaintMessageBox= rs1.getString(4);
				String MobileNo= rs1.getString(8);
				%>	
	
				
		
                                                     
												<tr>
											
														<td width="159" height="52" align="center">
															<font class="content2"> <%=Name%> </font></td>
															
														<td width="156" align="center">
															<font class="content2"><%=ComplaintSubject%></font></td>
															
                                                        <td width="230" align="center">
															<font class="content2"><%=ComplaintMessageBox%></font></td>	
																		
																		 <td width="149" align="center">
															<font class="content2"><%=MobileNo%></font></td>
															 <td width="192" align="center">
															<font class="content2">10</font></td>	
															
															 <td width="183" align="center">
															<font class="content2"><%=f%></font></td>						
		  </tr>
													
                                                       
</table>
													<% 
	} 
                
	}
	catch (Exception e) {
		out.println(e);
	}
                       
	%>					
			
</body>
</html> 