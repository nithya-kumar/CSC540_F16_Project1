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
    String pid = (String)session.getAttribute("username");
    String hsid_1 = (String)request.getParameter("hsid_1");
    String hsid_2 = (String)request.getParameter("hsid_2");
    String old_hsid1 = (String) session.getAttribute("old_hsid1");
    String old_hsid2 = (String) session.getAttribute("old_hsid2");
    String sql = "update patient set hsid_1='"+hsid_1+"',hsid_2='"+hsid_2+"' where pid='"+pid+"'";
    stm.executeUpdate(sql);
    c.commit();
    if (old_hsid1 != null) {
        sql = "update healthsupporter set hsid='"+hsid_1+"' where hsid='"+old_hsid1+"' and pid='"+pid+"'";  
    }
    if (old_hsid2 != null) {
        sql = "update healthsupporter set hsid='"+hsid_2+"' where hsid='"+old_hsid2+"' and pid='"+pid+"'";  
    }
    c.commit();
  //  stm.close();c.close();c.commit();
    session.setAttribute("username", pid);
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
			<li><a href="patient_profile1.jsp">Profile</a></li>
			<li><a href="patient_diagnosis.jsp">Diagnosis</a></li>
			<li><a href="patient_alert.jsp">Alert</a></li>
			<li><a href="patient_HI.jsp">Health Indicators</a></li>
                        <li><a href="patient_HS.jsp">Health Supporters</a></li>
                        <li><a href="login.html">Logout</a></li>
		</ul>
	</div>
    <div id="newcontentb">
    Recording updated successfully!!!
     
    </div>
								
</body>
</html>
