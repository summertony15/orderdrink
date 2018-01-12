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

		String name = request.getParameter("fruit_name");
		String price = request.getParameter("fruit_price");
		
		try {

			String url = "jdbc:mysql://localhost:3306/mydatabase";
			String user = "root";
			String password = "12345";
			String driver = "com.mysql.jdbc.Driver";
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			stmt = con.createStatement();
			
			String sql = "select fruit_name from Fruits WHERE fruit_name = '"+name+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				
				out.print("資料庫裡已有品項: "+rs.getString(1));
				
			}else{
				String maxFruitId = "";
				sql = "select fruit_no from Fruits order by fruit_no";
				rs = stmt.executeQuery(sql);
				if (rs != null) {
					while (rs.next()) {
						String fruit_no = rs.getString(1);
						maxFruitId = fruit_no;
					}
				}
				int newFruitId = Integer.parseInt(maxFruitId)+1;
				Double fruitPrice = Double.parseDouble(price);
				if(fruitPrice<=0.0){
					out.print("更新失敗！水果價格必須為正值！");
					
				}else{
					sql = "INSERT INTO `mydatabase`.`Fruits` (`fruit_no`, `fruit_name`, `fruit_price`, `inventory`) VALUES ('"+newFruitId+"', '"+name+"', '"+price+"', '0')";
					stmt.executeUpdate(sql);
					out.print("新增完成！<br><br>新增品項:" + name + "<br><br>新品價格:" + price	);
					
				}
				

			}
			
					} catch (Exception a) {
			out.print("更新失敗！水果價格必須是數字！");
		}
		
	%>
	<br>
	<br>
	<input type="button" value="返回主頁"
		onclick="self.location.href='inventoryview.jsp'" />



</body>
</html>