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
    
    String pid=null,name=null,address=null,dob=null,cat=null,gender=null;
    //PrintWriter out = response.getWriter();
    while(rs.next())
    {
        pid = rs.getString("PID");
        name = rs.getString("PNAME");
        address = rs.getString("PCONTACTINFO");
        dob = rs.getString("DOB");
        cat = rs.getString("PTYPE");
        gender = rs.getString("GENDER");
        session.setAttribute("username", username);
        
    }           
    stm.close();rs.close();c.close();
        
    %>

    <form action="patient_editprofile.jsp" >
    <table width=600 align="center" cellspacing="40">
    <tr><td><h3> USERNAME: <td><input type="text" value=<%=pid%> name="pid"/></h3>
    <tr><td><h3> NAME: <td><input type="text" value=<%=name%> name="name"/></h3>
    <tr><td><h3> ADDRESS: <td><input type="text" value=<%=address%> name="address"/></h3>
    <tr><td><h3> PATIENT CATEGORY: <td><input type="text" value=<%=cat%> name="cat"/></h3>
    <tr><td><h3> DOB: <td><input type="text" value=<%=dob%> name="dob"/></h3>
    <tr><td><h3> GENDER: <td><input type="text" value=<%=gender%> name="gender"/></h3>
    </table>
<center>	<h3><input TYPE="submit" NAME="Submit" VALUE="Update">
                    <input TYPE="reset" NAME="Clear" VALUE="Clear Form"></h3></center>
    
    </form>
    </div>						
</body>
</html>
