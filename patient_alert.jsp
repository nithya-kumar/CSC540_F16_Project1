kk<html xmlns="http://www.w3.org/1999/xhtml">
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
   // String username = (String)session.getAttribute("username");
       // String sql="(select r.oname,r.rec_time,r.rvalue from recordings r, patient_specific_limits l where l.dname = (select dname from diagnosis where pid='"+username+"') and r.pid=l.pid and r.pid='"+username+"' and r.rvalue<l.lowerlimit or r.rvalue>l.upperlimit and r.rec_time =(select max(rec_time) from recordings where pid='"+username+"')) UNION  ALL(select k.oname ,k.rec_time from recordings k,observation o where o.dname =(select dname from diagnosis where pid='"+username+"') and k.pid='"+username+"' and k.rvalue<o.lowerlimit or k.rvalue>o.upperlimit and  k.rec_time =(select max(rec_time) from recordings where pid='P2'));";

    String username = (String)session.getAttribute("username");;
    //String sql = "(select r.oname ,r.rec_time,r.rvalue from recordings r,patient_specific_limits l where l.dname =(select dname from diagnosis where pid='"+username+"') and r.pid=l.pid and r.pid='P2' and r.rvalue<l.lowerlimit or r.rvalue>l.upperlimit and r.rec_time =(select max(rec_time) from recordings where pid='"+username+"')) UNION (select k.oname ,k.rec_time,k.rvalue from recordings k,observation o where o.dname =(select dname from diagnosis where pid='"+username+"') and k.pid='"+username+"' and k.rvalue<o.lowerlimit or k.rvalue>o.upperlimit and  k.rec_time =(select max(rec_time) from recordings where pid='"+username+"'))";
    String sql = "(select r.oname ,r.rec_time,r.rvalue from recordings r,patient_specific_limits l where l.dname =(select dname from diagnosis where pid='"+username+"') and r.pid=l.pid and r.pid='P2' and r.rvalue<l.lowerlimit or r.rvalue>l.upperlimit and r.rec_time =(select max(rec_time) from recordings where pid='"+username+"'))";
  //  String sql1 = "select r.oname from recordings r ,observation o , diagnosis d where r.oname=o.oname and r.interval> o.frequency and o.dname=d.dname and r.pid=d.pid UNION select k.oname from  recordings k, patient_specific_limits l where k.oname=l.oname and k.interval>l.frequency and  k.pid=l.pid";
    ResultSet rs= stm.executeQuery(sql);
    session.setAttribute("username", username);
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
   
    
<h1><b><font align="center"> ALERTS!!! </font></b></h1>
	<table width=600 align="center" cellspacing="40">
            <tr><th> <h3> Health Indicator</th>
                <th> <h3> Alert Type</th>
                <th> <h3> Existing Value</th>
                <th> <h3> Recording Date</th>
                <th> <h3> Action Required</th>
            </tr>
                <% 
        String obs_name=null,rec_time=null;
        int rvalue = 0;

        //PrintWriter out = response.getWriter();
        while(rs.next())
        {
            obs_name = rs.getString("ONAME");
            rec_time = rs.getString("REC_TIME");
            rvalue = rs.getInt("RVALUE");   
                %>
            <tr><td> <h3> <%=obs_name%> </td>
                <td> <h3> Outside the limit threshold </td>
                <td> <h3> <%=rvalue%> </td>
                <td> <h3> <%=rec_time%> </td>
                <td> <h3> <form action="patient_alert_action.html" method="post"> <input type="submit" name="submit" value="Enter new recording"> </td>
                </table>
<form>
</form>
     <% }           
     stm.close();rs.close();c.close();

    %>
        
    </div>
								
</body>
</html>
