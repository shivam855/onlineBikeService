<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Request</title>
</head>
<style>
.abc{
	 box-shadow: 10px 1px 40px 10px black;
 border-radius: 40px 40px 10px 10px ;
}	
body{

	margin-left:20%;
	margin-right: 25%;

	margin-top:5%;
 	color:black;
 	background: url(img.png) no-repeat;
 	background-size: 100%;
 }
 
  h1{
  	color : white;
  	font-family: Times New Roman;
  	font-size:30px;
  	background-color: blue;
  	 border-radius: 10px 10px 0px 0px ;
  
  }
input[type=text]
{
	width:50%;
	border:2px solid #138496;
	border-radius:4px;
	font-size:20px;
	background-color: 	 #e6e6ff;
	padding:8px;
	margin-left:15px;
} 

button{
	width:20%;
	box-sizing:border-box;
	border:2px solid blue;
	border-radius:4px;
	font-color:black;
	font-size:16px;
	background-color: white;
	padding:9px;
	margin-left:20px;
}
button:hover{
border:3px solid black;
	background-color: #138496;	
}
</style>
<body>
<div class="abc">
<h1><center>Tracking Request </center></h1><hr><br>
<pre>
<form action=VehicleStatus.jsp method=get><font size=3px>
   <b> Tracking Id*     :<input type=text name=tf1 required="required"  /><br><br></b>
      
    <center><button type=submit name=submit value=SUBMIT>Submit</button></center>  
    
    		<br><br><center><h6><a href="http://localhost:8080/OurProject/engineerBase.jsp">Back to Engineer Portal </a></h6></center>
                    
</form>
</pre></div>
</body>
</html>