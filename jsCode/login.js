function validateform()
{	
	var name=document.myform.tf1.value;  
	var password=document.myform.tf2.value;  
	if((name==null || name=="")&&(password==null || password==""))
		{
		  alert("All details must be their");  
		  return false;  
		}
	else if (name==null || name=="")
		{  
		  alert("Id should be provided");  
		  return false;  
		}
	else if(password==null || password=="")
		{  
		  alert("Password must be required");  
		  return false;  
		  }  
}  