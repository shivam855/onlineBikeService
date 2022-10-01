function validate()
{

	var name=document.myform.tf1.value;  
	if((name==null || name==""))
	{
	  alert("No one option left");  
	  return false;  
	}
}
