<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 

<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>經理人</title>
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
</head>

  <nav id="nav">
    <h1>經理人</h1>
    <button align="left" onclick="location.href='http://localhost:8080/Database/firstpage.html'">首頁</button>
  </nav> 
  
  <aside id="aside">
	<html>
		<head><title>Selling order</title></head>
		<body>
			<h1>經理人頁面</h1>
			<br/>
			<br/>
			<hr>
</body>
</html>
 </aside>
  <section id="section">
    <html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
function function1() {
	// XMLHttpRequest 物件專門用來按伺服器做連接
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     /*  document.getElementById("demo1").innerHTML = this.responseText; */
	      var t = document.createElement("div");
	      t.innerHTML = this.responseText;
	       
	      var s = document.getElementById("demo1");
	      s.appendChild(t);
	    }
	  };
	  xhttp.open("GET", "totalsales.jsp", true);
	  xhttp.send();//送出連線
    }
    
function function2() {
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     /*  document.getElementById("demo2").innerHTML = this.responseText; */
	      var t = document.createElement("div");
	      t.innerHTML = this.responseText;
	       
	      var s = document.getElementById("demo2");
	      s.appendChild(t);
	    }
	  };
	  xhttp.open("GET", "totalcost.jsp", true);	  
	  xhttp.send();
    }
    
function function3() {
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     /*  document.getElementById("demo3").innerHTML = this.responseText; */
	      var t = document.createElement("div");
	      t.innerHTML = this.responseText;
	       
	      var s = document.getElementById("demo3");
	      s.appendChild(t);
	    }
	  };
	  xhttp.open("GET", "topsales.jsp", true);	  
	  xhttp.send();
    }

    </script>
</head>
<body>


  <div class="tab-content">
    <div id="Normal" class="tab-pane fade in active">
    <button onclick="function1()" style="width:300px; height:80px;"><font size="10">總銷售額</font></button>
    </br></br>
    <font size="8"><div id="demo1"></div></font>
    </br>
	<button onclick="function2()" style="width:300px; height:80px;"><font size="10">總成本</font></button>
	</br></br>
	<font size="8"><div id="demo2"></div></font>
	</br> 
	<button onclick="function3()" style="width:300px; height:80px;"><font size="10">銷售排行</font></button>
	<font size="8"><div id="demo3"></div></font>
	
    </div>
</div>

</body>
</html>

  </section>
  
</body>
</html>