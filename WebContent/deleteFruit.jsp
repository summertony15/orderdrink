<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#63808F" style = "font-family: verdana; font-size: 120%;">
<%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;

String name = request.getParameter("fruit_name");
try {

	String url = "jdbc:mysql://localhost:3306/mydatabase";
	String user = "root";
	String password = "12345";
	String driver = "com.mysql.jdbc.Driver";
	Class.forName(driver);
	con = DriverManager.getConnection(url, user, password);
	stmt = con.createStatement();

	String fruit_no = "";
	String sql = "select fruit_no from Fruits where fruit_name = '"+name+"'";
	rs = stmt.executeQuery(sql);
	if (rs != null) {
		while (rs.next()) {
			fruit_no = rs.getString(1);
			
		}
	}
	
	sql = "DELETE FROM `mydatabase`.`Fruits` WHERE `fruit_no`='"+fruit_no+"'";
	stmt.executeUpdate(sql);
	out.print("刪除完成！<br><br>刪除品項:" + name);
	
} catch (Exception a) {
	out.print(a);
}


%>
	<br><br>
	<input type="button" value="返回主頁"
		onclick="self.location.href='inventoryview.jsp'" />
	


</body>
</html>