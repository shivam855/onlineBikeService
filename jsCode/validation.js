  
function validateform(){  
var name=document.myform.tf2.value;  
var email=document.myform.tf3.value;
var phone=document.myform.tf4.value;
var adhaar=document.myform.tf5.value;
var address=document.myform.tf6.value;
var city=document.myform.tf7.value;
var password=document.myform.tf9.value;
var confpassword=document.myform.tf10.value;
if((name==null || name=="")&&(email==null || email=="")&&(phone==null || phone=="")&&(adhaar==null || adhaar=="")&&(password==null || password=="")&&(confpassword==null || confpassword==""))
{
	  alert("Please Enter the above details carefully");  
	  return false;  	
}
else if (name==null || name=="")
{  
  alert("Name can't be blank");  
  return false;  
}
else if(email==null || email=="")
{  
  alert("email can't be blank");  
  return false;  
}
else if(phone==null || phone=="")
{  
  alert("phone can't be blank.");  
  return false;  
}
else if(adhaar==null || adhaar=="")
{  
  alert("adhaar can't be blank");  
  return false;  
}
else if(address==null || address=="")
{  
  alert("address can't be blank");  
  return false;  
}

else if(city==null || city=="")
{  
  alert("city can't be blank");  
  return false;  
}

else if(password==null || password=="")
{  
  alert("Password must be required");  
  return false;  
}
else if(confpassword==null || confpassword=="")
{  
  alert("Confirm Password must be confirm required");  
  return false;  
}
else if(password != confpassword)
{  
  alert("password does not match");  
  return false;  
}
}  