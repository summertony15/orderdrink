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
      String sql = "SELECT COUNT(*) AS TOTAL , record.drink_number, drink_name FROM record,drink WHERE record.drink_number = drink.drink_number GROUP BY drink_number  ORDER BY TOTAL DESC";
      rs = stmt.executeQuery(sql);
    } catch (Exception ex) {
      System.out.println(ex);
    }
   
    if(rs!=null){
	%>
	
      <table>       
          <tr>
            <th>Top Rank</th>                       
          </tr>
        
<%
       while(rs.next()){
          String drink_name = rs.getString(3);          
                    
	%>
                
          <tr>
            <td><%=drink_name%></td>
                                                
          </tr>
       
    <%
        }
    %>
      </table>     
    <%
    	}
  	%>