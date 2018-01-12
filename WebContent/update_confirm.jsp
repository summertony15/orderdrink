<%@ page contentType="text/html; charset=Big5" 
   import="java.sql.*"%> 
<html> 
<head> 
<meta http-equiv="content-type" content="text/html; charset=big5"> 
<title>Confirm</title> 
</head> 
<body>
<FONT SIZE = 5 >更新確認</FONT> 
<HR> 
<% 
String member_num = request.getParameter("member_num");
String member_name = request.getParameter("member_name"); 
String member_gender = request.getParameter("member_gender"); 
String phone_num = request.getParameter("phone_num"); 
%>
<p>Number:<%= request.getParameter("member_num") %></p>
<p>Name: <%= member_name %></p> 
<p>Gender: <%= member_gender %></p> 
<p>Phone Number: <%= phone_num %></p> 
<form method="POST" name="form1" action="update_db.jsp"> 
<input type="hidden" name="member_num" value="<%= member_num %>"> 
<input type="hidden" name="member_name" value="<%= member_name %>"> 
<input type="hidden" name="member_gender" value="<%= member_gender %>"> 
<input type="hidden" name="phone_num" value="<%= phone_num %>"> 
<input type = "submit" value = "送出更新" onclick = "self.location.href = 'update_db.jsp'"/>
</form> 
</body> 
</html>