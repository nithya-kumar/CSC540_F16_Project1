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
    String hsid = (String)request.getParameter("hsid_1");
    String htype = (String)request.getParameter("htype");
    String sql = null;
    sql = "select ptype from patient where pid='"+pid+"'";
    ResultSet rs= stm.executeQuery(sql);
    String ptype = null;
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
    
	<%	  while(rs.next()) {
        ptype = rs.getString("PTYPE");
    }
    if (htype.equals("primary") && ptype.equals("sick")) {
        %>
        <div id="newcontentb">
    Sick patient cannot delete primary health supporter!!
     
    </div><%
    } else if (htype.equals("primary") && ptype.equals("well")) {
           sql = "update patient set hsid_1 = null where pid='"+pid+"'";%>
           Health supporter unauthorized successfully!!
   <% }
    else if (htype.equals("secondary")) {
        sql = "update patient set hsid_2 = null where pid='"+pid+"'";%>
        Health supporter unauthorized successfully!!
  <%  }
    stm.executeUpdate(sql);
    c.commit();
  //  stm.close();c.close();c.commit();
    session.setAttribute("username", pid);
    %>						
</body>
</html>
