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
    String username = (String)request.getParameter("pid");
    String name = (String)request.getParameter("name");
    String address = (String)request.getParameter("address");
    String cat = (String)request.getParameter("cat");
    String dob = (String)request.getParameter("dob");
    String gender = (String)request.getParameter("gender");
    String sql = "update patient SET pname = '"+name+"', pcontactinfo = '"+address+"', ptype = '"+cat+"', dob = '"+dob+"', gender = '"+gender+"' WHERE pid = '"+username+"'";
    //String sql = "insert into patient (pid,ptype,pname,DOB,Gender,Address) values('"+username+"','"+cat+"','"+name+"','"+dob+"','"+gender+"','"+address+"')";
    stm.executeUpdate(sql);
    session.setAttribute("username", username);
    stm.close();c.commit();c.close();%>
<body>

<div id="header">
	<div id="logo">
		<h1><a href="#"><span>PERSONAL HEALTH MANAGEMENT SYSTEM</span></a></h1>
		<p><br>CSC 540 - Fall '16</p>
	</div>
</div>
	<div id="menu">
		<ul id="main">
			<li><a href="patient_profile1.jsp">Profile</a></li>
			<li><a href="patient_diagnosis.jsp">Diagnosis</a></li>
			<li><a href="patient_alert.jsp">Alert</a></li>
			<li><a href="patient_HI.jsp">Health Indicators</a></li>
                        <li><a href="patient_HS.jsp">Health Supporters</a></li>
                        <li><a href="login.html">Logout</a></li>
		</ul>
	</div>
    <div id="newcontentb">
    Patient record updated successfully!!!
     
    </div>
								
</body>
</html>
