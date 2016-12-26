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
    String sql="select * from patient where pid='"+username+"'" ;
    ResultSet rs= stm.executeQuery(sql);
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
			<li><a href="patient_profile1.jsp">Profile</a></li>
			<li><a href="patient_diagnosis.jsp">Diagnosis</a></li>
			<li><a href="patient_alert.jsp">Alert</a></li>
			<li><a href="patient_HI.jsp">Health Indicators</a></li>
                        <li><a href="patient_HS.jsp">Health Supporters</a></li>
                        <li><a href="login.html">Logout</a></li>
		</ul>
	</div>
    <div id="newcontentb">
   
    <%
    
    String primary_hs=null,secondary_hs=null;
    //PrintWriter out = response.getWriter();
    while(rs.next())
    {
        primary_hs = rs.getString("HSID_1");
        secondary_hs = rs.getString("HSID_2");
        
    }           
    stm.close();rs.close();c.close();
        
    %>

    <form action="#" method="post" >
    <table width=600 align="center" cellspacing="40">
    <tr><td><h3> PRIMARY HEALTH SUPPORTER: <td><%=primary_hs%> 
    <tr><td><h3> SECONDARY HEALTH SUPPORTER: <td><%=secondary_hs%> 
    </table>
    </form>
   <form action="patient_editHS.jsp" method="post">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="Edit Health Supporter" name="add">
</form>
    <form action="patient_deleteHS.html" method="post">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="Unauthorize Health Supporter" name="add">
</form>

    </div>
    <form>
       <input type="hidden" name="username" value=<%=username%>
   </form>						
</body>
</html>
