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
    String sql = "SELECT count(*) from authorization where pid IN (select distinct(pid) from diagnosis where DName like 'Heart Disease') AND date_of_auth like '%SEP-16%'";
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
	
    <div id="newcontentb">
   
    <%
    
    int count = 0;
    //PrintWriter out = response.getWriter();
    while(rs.next())
    {
        count = rs.getInt(1);
        session.setAttribute("username", username);
       

    }           
     stm.close();rs.close();c.close();
        
    %>

    <form action="#" >
    <table width=600 align="center" cellspacing="40">
       <h1>Query 1 </h1> <br>
           List the number of health supporters that were authorized in the month of September 2016 by patients suffering from heart disease.
           <tr><td><b>RESULT: <%=count%> </b>

 
    </form>
    </div>						
</body>
</html>
