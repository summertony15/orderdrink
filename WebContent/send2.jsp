<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
Connection conn = null;
Statement stmt = null;
Statement stmt2 = null;
ResultSet rs = null ;
String totalprice1 = request.getParameter("total_price");
int[] qtys = new int[101];
for(int i = 1; i <= 100; i++){
	try{
	qtys[i] = Integer.parseInt(request.getParameter("qty"+(i)));
	}
	catch(Exception e){
		qtys[i]=0;
		
	}
}
    try {
    	int billNo = 0;
    	
     
      String url = "jdbc:mysql://localhost:3306/mydatabase";
      String user = "root";
      String password = "12345";
      String driver = "com.mysql.jdbc.Driver";
      Class.forName(driver);
      conn = DriverManager.getConnection(url, user, password);
      stmt = conn.createStatement();
      stmt2 = conn.createStatement();
       String sql = "INSERT INTO `mydatabase`.`Bill` (`price`) VALUES ('"+totalprice1+"')";        
       stmt.executeUpdate(sql); 
       
      /*  sql = "UPDATE `mydatabase`.`Fruits` SET inventory = inventory -  WHERE `fruit_no`='1';";     
       stmt.executeUpdate(sql); */
       
       sql = "SELECT max(bill_no) from Bill order by bill_no";
       rs = stmt.executeQuery(sql);
      
       while(rs.next()){
    	   billNo = rs.getInt(1);

    	   
       }
     
       
       for(int i = 1; i < qtys.length; i++){
    	   System.out.println(qtys[i]);
    	   if(qtys[i] != 0){
    		   sql = "INSERT INTO `mydatabase`.`record` (`bill_no`, `drink_number`, `quantity`) VALUES ('"+billNo+"','"+ i + "','"+qtys[i]+"')";
    		   stmt.executeUpdate(sql);
    		   System.out.println(qtys[2]);
    	   }
       }
   
    out.print("已完成訂單！");
   
    
    
    
    } catch (Exception ex) {
      System.out.println(ex);
      out.println(ex);
    }
    
    
%>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bill</title>
    <html>
    <body>
   
     <button onclick="location.href='http://localhost:8080/Database/firstpage.html'">回首頁</button>
     </body>
     </html>
