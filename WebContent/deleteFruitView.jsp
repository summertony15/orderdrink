<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		String url = "jdbc:mysql://localhost:3306/mydatabase";
		String user = "root";
		String password = "12345";
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		stmt = con.createStatement();
		String sql = "select fruit_name from Fruits order by fruit_no";
		rs = stmt.executeQuery(sql);

	} catch (Exception ex) {
		System.out.println(ex);
	}
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete</title>
<%
	if (rs != null) {
%>
</head>
<body bgcolor="#63808F" style = "font-family: verdana; font-size: 120%;">
	<form action="deleteFruit.jsp" method="POST">
<fieldset>
<legend>Delete Fruit:</legend>
		Fruit name: <select name="fruit_name">
			<%
				while (rs.next()) {
						String fruit_name = rs.getString(1);
			%>

			<option value="<%=fruit_name%>"><%=fruit_name%>

			</option>
<%
	}
%>
		</select><br>
		<input type="submit" name=submitButton value="submit" style="font-family: verdana; font-size: 120%;">
		<input type="button" value="Home" style="font-family: verdana; font-size: 120%;"
		onclick="self.location.href='inventoryView.jsp'" />
</fieldset>

	</form>

</body>
<%
	}
%>

</html>