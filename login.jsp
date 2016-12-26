
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
</head>
 <%@page import="java.sql.*"%>
    
    <%
    Statement stm=null;
    int count=0;
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection c = DriverManager.getConnection("jdbc:oracle:thin:@orca.csc.ncsu.edu:1521:orcl01","dguttik","200153101");
    System.out.println(c);
    stm=c.createStatement();
    String username= (String)request.getParameter("username");
    String password= (String)request.getParameter("password");
    String loginas= (String)request.getParameter("type");
    session.setAttribute("username", username);
    String sql = null;
    sql="select * from login where username='"+username+"' and pwd='"+password+"' " ;
    ResultSet rs= stm.executeQuery(sql);
    while (rs.next())
        count++;
    if(count==0) { %>
        <jsp:forward page="invalidlogin.html"/>
       <% }
       else { 
            if (loginas.equals("P")) { 
                response.sendRedirect("patient_home.jsp");
            }
            else { 
                response.sendRedirect("hs_home.jsp");
            }
      } 
       stm.close();rs.close();c.close();%>
       <body>
           
           
       </body>
       </html>