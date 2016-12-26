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
    
    String obs_name = (String)request.getParameter("obs_name");
    String rvalue = (String)request.getParameter("rvalue");
    String rec_time = (String)request.getParameter("rec_time");
    String pid = (String)request.getParameter("username");
    String rid = (String)request.getParameter("rid");
    String obs_time = (String)request.getParameter("obs_time");
    String sql="select oname from observation where dname IN (select dname from diagnosis where pid='"+pid+"')" ;
    stm.executeQuery(sql);
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
   <%  ResultSet rs = stm.getResultSet();
    String oname = null;
    int count = 0;
    while (rs.next()) {
        oname = rs.getString("oname");
        if (oname.equals(obs_name)) {
            count++;
        }
    }
    if (count == 0) {
        %> The observation for which recording is entered is not present in your diagnosis <%
    } else {
        sql = "insert into recordings values('"+pid+"','"+rid+"','"+obs_name+"','"+obs_time+"','"+rec_time+"','"+rvalue+"',5)";
        stm.executeUpdate(sql);
        c.commit();
        %> Recording inserted successfully!!! <%
    }
  //  stm.close();c.close();c.commit();
    session.setAttribute("username", pid);
    %>
  
    
     
    </div>
								
</body>
</html>
