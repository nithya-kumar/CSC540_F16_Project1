<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Personal Health Management System</title>

<link href="default.css" rel="stylesheet" type="text/css" media="screen" />


</head>
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
    <div id="newcontenth">
    <h2> Welcome!!!!</h2>
    </div>
    <%@page import="java.sql.*"%>
    
    <%
    String username = (String)session.getAttribute("username");
    session.setAttribute("username", username);
    %>
</body>
</html>
