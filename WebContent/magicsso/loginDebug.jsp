<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html  xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>:::: 테스트 ::::</title>
		<style>
		#logArea
		{margin: 0 auto; 
		 width:400px; 
		 height:700px; 
		 background-color:#888888; 
		 border-left:1px solid #333333; 
		 border-right:1px solid #333333; 
		 float:left;
		 overflow-y:scroll;
		}
		</style>
		<script type="text/javascript">
			function pagePaint()
			{
		       var comp = "<iframe src='/magicsso/login.jsp' frameborder='0' border='1' width='800' height='700'></iframe>";
		       var frm = document.getElementById("tar");
		       frm.innerHTML = comp;
			}
			
			var tagMsg="";

			function writeLog(msg, color)
			{
				
				if(color == null || color == 'undefined' )
					color = "black";
				var area = document.getElementById("logArea");
				
				if(area != null || area != undefined){
					
					tagMsg += "<font size='2' color='"+color+"'>"+msg+" [ color : "+color+"] </font><br/>";
					area.innerHTML = tagMsg;
					
				}
			}

			function cleanDiv(){
				var area = document.getElementById("logArea");
				tagMsg="";
				area.innerHTML = tagMsg;
			}
		</script>
	</head>
	<body onload="pagePaint();return false;">
	<table width="1200" border='0'>
	<tr>
	<td width="800">
		<div id="tar"></div>
	</td>
	<td width="400"  height="700">
	    <font><b>DEBUG</b></font>
	    <input type="button" id="cleanDiv" name="cleanDiv" value="지우기" onclick="cleanDiv();return false;"/>
		<div id="logArea"></div>
	</td>
	</tr>
	</table>
	</body>
</html>
