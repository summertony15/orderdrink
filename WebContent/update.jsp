<%@ page contentType="text/html; charset=Big5" 
    import="java.sql.*"%> 
<HTML> 
<HEAD> 
<meta http-equiv="content-type" content="text/html; charset=big5"> 
<TITLE>Update Member Data</TITLE> 
</HEAD> 
<BODY> 
<FONT SIZE = 5 >Update Member Data</FONT> 
<HR> 
<% 

Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase?useUnicode=true&characterEncoding=big5","root","12345"); 
Statement stmt = conn.createStatement(); 
ResultSet rs; 

String sql="SELECT * FROM member WHERE member_num='"+request.getParameter("member_num")+"'"; 
rs = stmt.executeQuery(sql); 
if(!rs.next()) { 
    out.println("Find NO Data"); 
} else { 
%> 

<FORM method="POST" action="update_confirm.jsp"> 
  <p>Number:<%= rs.getString("member_num") %></p> 
  <input type="hidden" name="member_num" value="<%= rs.getString("member_num") %>" > 
  <p>Name:<input type="text" name="member_name" size="20" value="<%= rs.getString("member_name") %>" ></p> 
  <p>Gender:<input type="text" name="member_gender" size="20" value="<%= rs.getString("member_gender") %>" ></p> 
  <p>Phone Number:<input type="text" name="phone_num" size="20" value="<%= rs.getString("phone_num") %>" ></p> 
  <p><input type="submit" value="update" name="B1"></p> 
</FORM> 

<% 
} 
rs.close();
stmt.close();
conn.close(); 
%> 
</BODY> 
</HTML>