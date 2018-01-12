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
      String sql = "SELECT 組成.fruit_no, fruit_name, Fruits.fruit_price, sum(qty) as fruitqty, Fruits.fruit_price*sum(qty) as fruitcost FROM 組成,fruits  WHERE Fruits.fruit_no = 組成.fruit_no group by 組成.fruit_no ";
      rs = stmt.executeQuery(sql);
    } catch (Exception ex) {
      System.out.println(ex);
    }
    String totalcost = "";
    if(rs!=null){
		int total = 0;
		int fruitcost=0;
       while(rs.next()){
          String fruit_name = rs.getString(2);
           fruitcost = rs.getInt(5);          
          total+=fruitcost;          
        }
       System.out.println(total + "元");
    	}
  	%>