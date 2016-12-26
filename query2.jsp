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
    String sql = "select count(distinct(r.pid)) from recordings r ,observation  o, diagnosis d where r.oname=o.oname and r.interval> o.frequency and o.dname=d.dname and r.pid=d.pid";
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
       <h1>Query 2 </h1> <br>
           Give the number of patients who were not complying with the recommended frequency of recording observations.
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
