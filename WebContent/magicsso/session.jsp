<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
//	session.setAttribute("USER_ID", "12345"  );
//	session.setAttribute("USER_ssD", "123123232345"  );

	%>

<html >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>MagicSSO Login Session view </title>
	<style type="text/css" media="screen">
		dl.row{border-top:1px dotted #777; magin:0; padding:0;clear:left;}
		dl.row dt{float:left; margin:0; padding:0; width:200px; height:25px; font-weight: bold; border-right:1px solid #AAA;}
		dl.row dd{float:left; margin:0; padding-left:2em;}
	</style>
	

	<script type="text/javascript">
		
	</script>
</head>
<body>
<form id="sView" name="sView">
	<dl>
	</dl>
	<dl>
	</dl>
	<dl>
	</dl>
<table border='1'>
<tr>
<th>SESSION FIELD NAME</th>
<th>SESSION FIELD VALUE</th>
</tr>
<tr>
<td>File Encoding</td>
<td><%=System.getProperty("file.encoding") %></td>
</tr>
<tr>
<td>SESSION ID</td>
<td><%=session.getId() %></td>
</tr>
<%
	Enumeration sNames = session.getAttributeNames();
    //List<String> li = new ArrayList<String>();
	while(sNames.hasMoreElements())
	{
		Object so = sNames.nextElement();
		if(so != null){
			out.println("<tr><td>"+(String)so+"</td>");
			out.println("<td>"+session.getAttribute((String)so)+"</td></tr>");
		}
	}
%>
</table>

</form>
<div id="MagicLineArea"></div>
</body>
</html>
