  
function validateform(){  
var name=document.myform.tf1.value;  
var email=document.myform.tf3.value;
var phone=document.myform.tf4.value;
var adhaar=document.myform.tf5.value;
var track=document.myform.tf6.value;
if((name==null || name=="")&&(email==null || email=="")&&(phone==null || phone=="")&&(adhaar==null || adhaar=="")&&(track==null || track==""))
{
	  alert("Please Enter the above details carefully");  
	  return false;  	
}
else if (name==null || name=="")
{  
  alert("plz fill bill_amount");  
  return false;  
}
else if(email==null || email=="")
{  
  alert("plz fill debit number");  
  return false;  
}
else if(phone==null || phone=="")
{  
  alert("plz fill cvv number");  
  return false;  
}
else if(adhaar==null || adhaar=="")
{  
  alert("plz fill expire date");  
  return false;  
}
else if(adhaar==null || adhaar=="")
{  
  alert("track id not selected");  
  return false;  
}
}  