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
    String sql = "select count(*) from recordings where obs_time not like rec_time";
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
   
    
    <form action="#" >
    <table width=600 align="center" cellspacing="40">
       <h1>Query 5 </h1> <br>
           How many patients have different observation time and recording time (of the observation)?
           <%
    
    int count = 0;
    //PrintWriter out = response.getWriter();
    while(rs.next())
    {
        count = rs.getInt(1);
       

    }                
    stm.close();rs.close();c.close();
        
    %>
    <tr><td><b>RESULT: <%=count%> </b>

           

 
    </form>
    </div>						
</body>
</html>
