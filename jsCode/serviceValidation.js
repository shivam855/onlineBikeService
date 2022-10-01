  
function validateform(){  
var name=document.myform.tf2;  
var email=document.myform.tf3;
if((name==null || name=="")&&(email==null || email==""))
{
	  alert("Please Enter the above details carefully");  
	  return false;  	
}
else if(name==null || name=="")
{  
  alert("Bike Modal Reequired");  
  return false;  
}
else if(email==null || email=="")
{  
  alert("Select the service you want");  
  return false;  
}
}