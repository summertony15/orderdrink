<%@ page contentType="text/html; charset=Big5" 
    import="java.sql.*"%> 
<HTML> 
<HEAD> 
<TITLE>Membership</TITLE> 
</HEAD> 
<BODY> 
<FONT SIZE = 5 >�|��</FONT> 
<HR> 
<% 
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase?useUnicode=true&characterEncoding=big5","root", "12345"); 
Statement stmt = conn.createStatement(); 
ResultSet rs; 
rs = stmt.executeQuery("SELECT * FROM member"); 

%>  
<TABLE border = "1"> 
<thead>
    <tr> 
    <th>Number</th> 
    <th>Name</th> 
    <th>Gender</th> 
    <th>Phone Number</th>
    <th>Update</th>
    <th>Delete</th>
    </tr>  
    </thead>  
    <% 

    while (rs.next())
    { 
        %> 
        <tbody>
        <tr> 
        <th><%= rs.getString("member_num") %></th> 
        <th><%= rs.getString("member_name") %></th> 
        <th><%= rs.getString("member_gender") %></th> 
        <th><%= rs.getString("phone_num") %></th>
        <th><a href=update.jsp?member_num=<%= rs.getString("member_num") %>>Update</a></th>
        <th><a href=delete_confirm.jsp?member_num=<%= rs.getString("member_num") %>>Delete</a></th>
        </tr> 
        </tbody>
        <% 
    } 
    rs.close();
    stmt.close(); 
    conn.close();
    %>   
</TABLE> <br>
<input type = "submit" value = "�s�W�|��" onclick = "self.location.href = 'insert.html'"/> &nbsp;&nbsp;
<input type = "submit" value = "�^����" onclick = "self.location.href = 'firstpage.html'"/>
<form method="POST" name="form1" action="welcome.jsp"><br>
    �j�M���X: <input type = "text" name = "phone_num" placeholder = "�q�ܸ��X"/>&nbsp;
    <input type="submit" value="�j�M">
</form>
</BODY> 
</HTML>