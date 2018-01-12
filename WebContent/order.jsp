<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 

<html>
	<head>
 		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   		 <title>點餐</title>
			<style type="text/css">
	    	 body{
		     width: 1300px;
		     color: #FFF;
		     margin:0 auto;
		     font-family: sans-serif, "微軟正黑體";
		     }    
	
		     #nav{
		     background-color: #20292F;
		     padding: 5px;
		     }
		
		     #aside{
		     width:400px;
		     height: 700px;
		     text-align: center;
		     background-color: #63808F;
		     padding:20px 10px;
		     float: left;
		     }
		
		     #section{
		     width: 900px;
		     height: 700px;
		     background-color: #849DAA;
		     line-height: 1.5em;
		     padding: 20px;
		     float: right;
		     }
		
		     h1{
		     font-family: sans-serif, "微軟正黑體";
		     font-size: 18px;
		     color: #FFF;
		     text-align: center;
		     }
	
	     	</style>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>	
	var total = 0;
    
	function getdrink(id,name,price) {
		var clicks = 0;
		var currentClicks;
		if(document.getElementById("qty-" + id).innerHTML === "") {
			name = name.replace("_", " ");
			document.getElementById("name" + id).innerHTML = name;
			document.getElementById("price" + id).innerHTML = price;
			clicks += 1;
			document.getElementById("qty-" + id).innerHTML = clicks;
			document.getElementById("qty" + id).value = clicks;
		}
		else {
			currentClicks = Number(document.getElementById("qty-" + id).innerHTML);
			document.getElementById("qty-" + id).innerHTML = currentClicks + 1;
			
			document.getElementById("qty" + id).value = currentClicks + 1;
		}
		
		total += price;
		document.getElementById("totalprice").innerHTML = total;
		document.getElementById("total_price").value = total;
			
	}		
    </script>

</head>


  			<nav id="nav">
    		<h1>點餐</h1>
    		<button align="left" onclick="location.href='http://localhost:8080/Database/firstpage.html'">首頁</button>
 			 </nav> 
  
  			<aside id="aside">
			<h1>Detailed Bill</h1>
			Time:<%=new java.util.Date()%>			
			<br/>
			<hr>
		<table> 
			<thead>      
	          <tr>
	            <th>Drink Name &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</th>
	            <th>Price &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</th>                   
	            <th>Quantity</th>  
	          </tr>
	        </thead>
	        <tbody>
		        <%
		        Connection conn = null;
		        Statement stmt = null;
		        Statement stmt2 = null;
		        ResultSet rs = null ;
		
		        String url = "jdbc:mysql://localhost:3306/mydatabase";
		        String user = "root";
		        String password = "12345";
		        String driver = "com.mysql.jdbc.Driver";
		        Class.forName(driver);
		        conn = DriverManager.getConnection(url, user, password);
		        stmt = conn.createStatement();
		        stmt2 = conn.createStatement();		        
		        String sql = "Select drink_number from drink";
				rs = stmt.executeQuery(sql);	
		        
		        while (rs.next()){
		        	int id = rs.getInt("drink_number");
		         out.println("<tr>");
		         out.println("<td id='name" +  id + "'></td>");
		         out.println("<td id='price" + id + "'></td>");
		         out.println("<td id='qty-" + id + "'></td>");
		         out.println("</tr>");                       
		         
		        }
		          %>
	       </tbody>      
   		</table>
   	<br/>
	<hr>

 	Total Price:<p id="totalprice"></p>
	
	
	</aside>
	
 	<section id="section">


	<div class="container">
	  <ul class="nav nav-tabs">
	    <li class="active"><a data-toggle="tab" href="#Normal">一般價(N)</a></li>
	    <li><a data-toggle="tab" href="#Member">會員價(M)</a></li>
	    <li><a data-toggle="tab" href="#Sales">促銷價(S)</a></li>
	  </ul>


  <div class="tab-content">





		<%
				
		for(int i = 1 ; i <= 3 ; i++)
		{
			String [] classname = {"Normal", "Member","Sales"};
			sql = " select * from drink where class = '" + i + "'";
			if(i==1)
			
				out.println("<div id='" + classname[i - 1] +  "' class='tab-pane fade in active'>");
			
			else
			out.println("<div id='" + classname[i - 1] +  "' class='tab-pane fade'>");
			rs = stmt.executeQuery(sql);
		
			while(rs.next())
			{
				int id = rs.getInt("drink_number");
				String name = rs.getString("drink_name");
				name = name.replace(" ", "_");
				int price = rs.getInt("drink_price");
				String pic = rs.getString("pic"); 
				out.println("<button onclick = getdrink(" + id +",'" + name + "',"+ price + ")><img src='"+ pic +"'></button");
				out.println("<input type ='hidden' id='qty" + id + "' name='qty"+ id +"' />");
				
			}
				out.println("</div>");
				
		}		
		
		%>
	
		 </div>
  </div>
  <form method="Post" action="send.jsp">
	<input type="hidden" id="total_price" name="total_price" value="">
	<% 
		sql = " select drink_number from drink";
			rs = stmt.executeQuery(sql);
		
			while(rs.next())
			{
				int id = rs.getInt("drink_number");
				
				out.println("<input type ='hidden' id='qty" + id + "' name='qty"+ id +"' />");
				
			}
			
				
		
		
	
	%>
	<input type="submit" value="送出">
</form>

 
   

</section>
  
</body>
</html>