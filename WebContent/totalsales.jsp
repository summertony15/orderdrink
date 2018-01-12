<%@page contentType="text/html" pageEncoding="BIG5"%>
<%@page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null ;
    try {
      String url = "jdbc:mysql://localhost:3306/mydatabase";
      String user = "root";
      String password = "12345";
      String driver = "com.mysql.jdbc.Driver";
      Class.forName(driver);
      conn = DriverManager.getConnection(url, user, password);
      stmt = conn.createStatement();
      String sql = "SELECT sum(price) as totalsales FROM Bill";
      rs = stmt.executeQuery(sql);
    } catch (Exception ex) {
      System.out.println(ex);
    }
   String totalsales = "";
    if(rs!=null){
       while(rs.next()){
          totalsales = rs.getString(1);        
        }
    	out.println(totalsales + "元");
    	}
  	%>