<%@ page contentType="text/html; charset=Big5" 
    import="java.sql.*"%> 
<HTML> 
<HEAD> 
<meta http-equiv="content-type" content="text/html; charset=big5"> 
<TITLE>Confirm</TITLE> 
</HEAD> 
<BODY> 
<FONT SIZE = 5 >Delete Confirm</FONT> 
<HR> 
<% 

Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase?useUnicode=true&characterEncoding=big5","root", "12345"); 
Statement stmt = conn.createStatement(); 
ResultSet rs; 

String sql="SELECT * FROM member where member_num='"+request.getParameter("member_num")+"'"; 

rs = stmt.executeQuery(sql);       
if(!rs.next()) { 
    out.println("Find No Data"); 
} else { 
%> 
  <p>Number:<%= rs.getString("member_num") %></p> 
  <p>Name:<%= rs.getString("member_name") %></p> 
  <p>Gender:<%= rs.getString("member_gender") %></p> 
  <p>Phone Number:<%= rs.getString("phone_num") %></p> 
<% 
String sqldel="delete from member where member_num='"+rs.getString("member_num")+"'"; 
int result = stmt.executeUpdate(sqldel); 
} 
rs.close();
stmt.close();
conn.close();
%> 
<form method="POST" name="form2" action="delete_db.jsp"> 
<p><input type="submit" name="formbutton3" value="submit"></p> 
</form> 
</BODY> 
</HTML>