<%@ page contentType="text/html; charset=Big5" 
   import="java.sql.*"%> 
<HTML> 
<HEAD> 
<TITLE>Insert Database</TITLE> 
</HEAD> 
<BODY> 
<FONT SIZE = 5 >新增成功!</FONT> 
<HR> 

<% 
String member_name = request.getParameter("member_name"); 
String member_gender = request.getParameter("member_gender"); 
String phone_num = request.getParameter("phone_num"); 
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase?useUnicode=true&characterEncoding=big5","root", "12345"); 
	Statement stmt = conn.createStatement(); 
	String sql="insert into member set member_name='"+member_name+"', member_gender='"+member_gender+"', phone_num='"+phone_num+"'"; 
	int result = stmt.executeUpdate(sql);
	stmt.close();
	conn.close(); 
}
catch(Exception a){
	out.print(a);
}

%>   
<form method="POST" name="form2" action="membership.jsp"> 
<p><input type="submit" name="formbutton3" value="回到會員"></p> 
</form> 
</BODY> 
</HTML>