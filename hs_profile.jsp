<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Personal Health Management System</title>

<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
<link href="calendarview.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="prototype.js"></script>
    <script type="text/javascript" src="calendarview.js"></script>


</head>
    <%@page import="java.sql.*"%>
    
    <%
    Statement stm = null;
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection c = DriverManager.getConnection("jdbc:oracle:thin:@orca.csc.ncsu.edu:1521:orcl01","dguttik","200153101");
    stm=c.createStatement();
    String username = (String)session.getAttribute("username");
    String sql="select * from healthsupporter where hsid='"+username+"'" ;
    ResultSet rs= stm.executeQuery(sql);
    session.setAttribute("username", username);
    //ResultSetMetaData r=rs.getMetaData();
    %>
<body>

<div id="header">
	<div id="logo">
		<h1><a href="#"><span>PERSONAL HEALTH MANAGEMENT SYSTEM</span></a></h1>
		<p><br>CSC 540 - Fall '16</p>
	</div>
</div>
	<div id="menu">
		<ul id="main">
			<li><a href="hs_profile.jsp">Profile</a></li>
			<li><a href="hs_patient.jsp">Patients</a></li>
                        <li><a href="HS_alert.html">Alerts</a></li>
                        <li><a href="login.html">Logout</a></li>
		</ul>
	</div>
    <div id="newcontentb">
   
    <%
    int count = 0;
    while (rs.next())
        count++;
    if(count==0) { response.sendRedirect("hs_buildprofile.html"); }
    else { response.sendRedirect("hs_showprofile.jsp");} 
    stm.close();rs.close();c.close();%>
    <form>
        <input type="hidden" name="username" value=<%=username%>
    </form>
								
</body>
</html>
