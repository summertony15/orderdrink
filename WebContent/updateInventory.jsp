<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#63808F" style="font-family: verdana; font-size: 120%;">
	<%
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		Double weight = 0.0;
		String targetFruitNo = "";

		String name = request.getParameter("fruit_name");
		String inventory = "";
		try {

			String url = "jdbc:mysql://localhost:3306/mydatabase";
			String user = "root";
			String password = "12345";
			String driver = "com.mysql.jdbc.Driver";
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			stmt = con.createStatement();

			String sql = "select fruit_no,fruit_name,inventory from Fruits order by fruit_no";
			rs = stmt.executeQuery(sql);

			if (rs != null) {
				while (rs.next()) {
					String fruit_no = rs.getString(1);
					String fruit_name = rs.getString(2);
					String tempInventory = rs.getString(3);
					if (name.equals(fruit_name)) {
						targetFruitNo = fruit_no;
						inventory = tempInventory;
					}
				}
			}

			weight = Double.parseDouble(request.getParameter("weight")) + Double.parseDouble(inventory);
			if(Double.parseDouble(request.getParameter("weight"))<=0.0){
				out.print("更新資料失敗！進貨數量需為正值！");
			}else{
			sql = "UPDATE `mydatabase`.`Fruits` SET `inventory`=" + weight + " WHERE `fruit_no`=" + targetFruitNo;
			int a = stmt.executeUpdate(sql);
			out.print("新增完成!<br><br>進貨品項:"+name+"<br><br>進貨量:"+Integer.parseInt(request.getParameter("weight"))+"<br><br>現有庫存:"+weight);
			}
		} catch (Exception a) {
			out.print("更新資料失敗！請輸入數字！");
		}
	%>
	<br><br>
	<input type="button" value="返回主頁"
		onclick="self.location.href='inventoryview.jsp'" />


</body>



</html>