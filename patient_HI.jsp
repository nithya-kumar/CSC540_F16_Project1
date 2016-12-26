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
    String sql="select * from Recordings where pid='"+username+"'" ;
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
        <table width=900 align="center" cellspacing="40">
            <tr><th> <h3> Recording ID</th>
                <th> <h3> Observation Name</th>
                <th> <h3> Observation Time</th>
                <th> <h3> Recording Time</th>
                <th> <h3> Recording Value</th>
            </tr>
                
   
    <% 
    String PId=null,RId=null,OName=null,Obs_Time=null,Rec_Time=null,RValue=null,DName=null,RecogId=null,SRe=null, TimeStamp=null;

    
    //PrintWriter out = response.getWriter();
    while(rs.next())
    {
        

        RId = rs.getString("RID");
        OName = rs.getString("OName");
        Obs_Time = rs.getString("OBS_TIME");
        Rec_Time = rs.getString("REC_TIME");
        RValue = rs.getString("RValue");
       %>    
 <tr><td>  <%=RId%> </td>
                <td>  <%=OName%> </td>
                <td>  <%=Obs_Time%> </td>
                <td>  <%=Rec_Time%> </td>
                <td> <%=RValue%> </td>
                 <%       }   %> 
      <%  stm.close();rs.close();c.close();
%>

        </table>
<br>
<form action="patient_alert_action.html" method="post">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="Add Recording" name="add">
</form>
    <form action="patient_editHI.html" method="post">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="Edit Recording" name="add">
</form>
    <form action="patient_deleteHI.html" method="post">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="Delete Recording" name="add">
</form>
    <br><br>
    </div>
								
</body>
</html>
