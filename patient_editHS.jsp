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

    <form action="patient_editHS1.jsp" method="post" >
    <table width=600 align="center" cellspacing="40">
    <tr><td><h3> PRIMARY HEALTH SUPPORTER: <td><input type="text" value=<%=primary_hs%> name="hsid_1"/></h3>
            <% session.setAttribute("old_hsid1", primary_hs);
            session.setAttribute("old_hsid2", secondary_hs); %>
              <tr><td><h3> Health Supporter relation: <td><input type="text" name="hsid1_rel"/></h3>
                      <tr><td><h3> Health Supporter Type <td><input type="text" name="hs1type"/></h3>
            <tr><td><h3> Authorization Date: <td><input type="text" name="hs1date"/></h3>
    <tr><td><h3> SECONDARY HEALTH SUPPORTER: <td><input type="text" value=<%=secondary_hs%> name="hsid_2"/></h3>
            
              <tr><td><h3> Health Supporter relation: <td><input type="text" name="hsid2_rel"/></h3>
                      <tr><td><h3> Health Supporter Type <td><input type="text" name="hs2type"/></h3>
            <tr><td><h3> Authorization Date: <td><input type="text" name="hs2date"/></h3>
    </table>
    <center>	<h3><input TYPE="submit" NAME="Submit" VALUE="Submit">
                    <input TYPE="reset" NAME="Clear" VALUE="Clear Form"></h3></center>
    </form>

   
    </div>
    <form>
       <input type="hidden" name="username" value=<%=username%>
   </form>						
</body>
</html>
