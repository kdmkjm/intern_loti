<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<body>
		<p>
			<object classid='clsid:6D24719C-1FAA-43EA-A1DC-486AAB97B028' id='MPSApiX' width='300' height='100'></object>
		</p>
	</body>
<script type="text/javascript"> 
	function Login() 
	{     
		var ctrl = document.getElementById("MPSApiX");     
	
		ctrl.InitEx(0,"TCS","http://127.0.0.1:8201/magicsso/plugins/sso.conf");
	
		if(ctrl.IsLogonEx("TCS") == true)
		{
			alert("Already Login Status");
			return;
		}
		
		if( ctrl.LogonEx(0,"19553120","2222") == true)
		{
			alert("Login OK");
		}
		
	
	}
	function GetID() 
	{     
		var ctrl = document.getElementById("MPSApiX");     
		var nlen;
		if (ctrl.GetIDEx(nlen) == true) 
		{
			alert("����� ID" + ctrl.Result);
		}
	}  
	function GetToken() 
	{     
		var ctrl = document.getElementById("MPSApiX");     
		var nlen;
		if (ctrl.GetTokenEx() == true) 
		{
			alert("����� Token" + ctrl.Result);
		}
	} 
	</script> 
	
	<input type="button" onclick="Login()" value="Login" /> 
	<input type="button" onclick="GetID()" value="GetID" /> 
	<input type="button" onclick="GetToken()" value="GetToken" /> 
</html>