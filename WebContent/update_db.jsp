<%@ page contentType="text/html; charset=Big5" 
    import="java.sql.*"%> 
<HTML> 
<HEAD> 
<meta http-equiv="content-type" content="text/html; charset=big5"> 
<TITLE>Update Database</TITLE> 
</HEAD> 
<BODY> 
<FONT SIZE = 5 >更新成功!</FONT> 
<HR> 

<% 
String member_num = request.getParameter("member_num");
String member_name = request.getParameter("member_name"); 
String member_gender = request.getParameter("member_gender"); 
String phone_num = request.getParameter("phone_num"); 

Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase?useUnicode=true&characterEncoding=big5","root", "12345"); 
Statement stmt = conn.createStatement(); 

String sql="update member set member_name='"+member_name+"', member_gender='"+member_gender+"', phone_num='"+phone_num+"' where member_num='"+member_num+"'"; 
int result = stmt.executeUpdate(sql); 
stmt.close();
conn.close();
%>   
<form method="POST" name="form2" action="membership.jsp"> 
<p><input type="submit" name="formbutton3" value="回到會員"></p> 
</form> 
</BODY> 
</HTML>