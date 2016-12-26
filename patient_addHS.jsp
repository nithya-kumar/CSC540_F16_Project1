<%@page import="java.text.SimpleDateFormat"%>
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
    String hsid = (String)request.getParameter("hsid");
    String hsid_rel = (String)request.getParameter("hsid_rel");
    String hstype = (String)request.getParameter("hstype");
    String sql = null;
    if (hstype.equals("primary")) {
    sql = "update patient set hsid_1='"+hsid+"' where pid='"+username+"'";
    } else {
          sql = "update patient set hsid_2='"+hsid+"' where pid='"+username+"'";  
    }
    stm.executeUpdate(sql);
    c.commit();
    sql = "insert into healthsupporter (hsid,hsname,hscontactinfo,pid) values ('"+hsid+"','ogan',null,'"+username+"')";
    
    stm.executeUpdate(sql);
    c.commit();
   /* if (!(hsid_1 == null)) {
    sql = "insert into authorization (pid,hsid,date_of_auth,relation_with_patient,hstype) values('"+username+"','"+hsid_1+"','"+date+"','"+hsid_1rel+"','Primary')";
    stm.executeUpdate(sql);
    }
    if (!(hsid_2 == null)) {
       sql = "insert into authorization (pid,hsid,date_of_auth,relation_with_patient,hstype) values('"+username+"','"+hsid_1+"','"+date+"','"+hsid_2rel+"','Secondary')";
    stm.executeUpdate(sql); 
    }*/
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
    Patient record inserted successfully!!!
     
    </div>
								
</body>
</html>
