<%@ page contentType="text/html; charset=utf-8" %>
<%
	String urlName = "returnUrl=";
	String returnUrl = getNextUrl(request.getQueryString(), urlName);
%>
<%!
public String getNextUrl(String fullPath,String urlName){
	if(null == fullPath) return "";
	int idx = fullPath.indexOf(urlName);
	String nextURL = "";
	if(idx > -1)
		nextURL =  fullPath.substring(idx+urlName.length());
	return nextURL;
}
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<object classid='CLSID:AD6870C0-44B7-42FB-A119-C2C6BD9CD005' id='MagicPassDirect' width='1' height='1'></object>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Connect</title>
	<script type="text/javascript" src="./js/MagicPass.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/Connect.js" charset="utf-8"></script>
	<script type="text/javascript">
	//<![CDATA[
		
		var returnUrl = "<%= returnUrl %>";
		var connect = new Connect(returnUrl);

		MagicPass.job("매직패스 로그인 연계", function(){
			connect.start();
		});
		if(Client.browser == "MSIE")
        {
                MagicPass.alias = "MagicPassDirect";
                MagicPass.object = document.getElementById("MagicPassDirect");
                MagicPass.usable = true;
                MagicPass.jobExecute();
        }
		
	//]]>
	</script>
</head>
<body>

</body>
</html>