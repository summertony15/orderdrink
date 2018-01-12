<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<h3>Inventory</h3>
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
		String sql = "select fruit_no,fruit_name,fruit_price,inventory from Fruits order by fruit_no";
		rs = stmt.executeQuery(sql);

	} catch (Exception ex) {
		System.out.println(ex);
	}
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Inventory</title>




<%
	if (rs != null) {
%>
<table border="1">
	<thead>
		<tr>
			<th>Number</th>
			<th>Name</th>
			<th>Price</th>
			<th>Inventory</th>

		</tr>
	</thead>
	<%
		while (rs.next()) {
				String fruit_no = rs.getString(1);
				String fruit_name = rs.getString(2);
				String fruit_price = rs.getString(3);
				String inventory = rs.getString(4);
	%>
	<tbody>
		<tr>
			<td><%=fruit_no%></td>
			<td><%=fruit_name%></td>
			<td><%=fruit_price%></td>
			<td><%=inventory%></td>


		</tr>
	</tbody>
	<%
		}
	%>
</table>
<body bgcolor="#63808F" style="font-family: verdana; font-size: 120%;">
	<br>
	<input type="button" value="進貨"
		onclick="self.location.href='updateInventoryView.jsp'" />
	<input type="button" value="新增品項"
		onclick="self.location.href='insertFruit.html'" />
	<input type="button" value="刪除品項"
		onclick="self.location.href='deleteFruitView.jsp'" />
	<input type="button" value="回首頁"
		onclick="location.href = 'firstpage.html'" />
</body>

<%
	}
%>


