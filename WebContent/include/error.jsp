<%-- 
- ����: ���α׷� ���(������)
- ����: ���α׷� ����޴�(������)

- �ۼ���: ���� �赿ö
- �ۼ���: 2008.01.22
--%>
<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<html>
<head>
<style type="text/css">
<!--
.styledb {
	font-size: 15px;
	font-weight: bold;
	color: #d26944;
}
-->
</style>
</head>
<!-- ž���� ����-->
<BODY>
<p>
  <!-- ž���� ��-->
  <!-- �ΰ� ����-->
  <!--  �ΰ� ��-->
  <!-- '�������̺�' ����-->
</p>
<table width="625" height="315" cellpadding="0" cellspacing="0">
  <tr>
  	<td height="15" colspan="2"></td>
  </tr>
  <tr valign="top">
    <td width="150"></td>
    <td> 
      <table width="475" height="300" cellpadding="0" cellspacing="0" background="/images/error_back.gif">
        <tr> 
          <td width="152" rowspan="3"><img src="/images/error_map.gif" border="0" usemap="#Map"></td>
          <td width="278" height="105" align="center" valign="middle"><span class="styledb">������ �߻��Ͽ����ϴ�.</span></td>
          <td width="45">&nbsp;</td>
        </tr>        
        <tr> 
          <td class="style1 " >
						���� Sever�� ������ �߻��Ѱ� �����ϴ�.<br>
						����� �ٽ� �õ�(<b>F5Ű</b>)�� �����ðų� �����ڿ��� ������ �ֽʽÿ�. �ٷ� �ذ��� �帮�ڽ��ϴ�.<br>
						������ �߻��� �������� �ּ��� ���Ͽ� �ٷ� <b>������ġ</b> �ϰڽ��ϴ�. �����մϴ�.</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td height="70" align="center">
          	<table width="225" border="0" cellpadding="0" cellspacing="0">
	            <tr>
	              <td width="110"><a href="/index.act" target="_top"><img src="/images/error_01.gif"></a></td>
	              <td width="5">&nbsp;</td>
	              <td width="110"><a href="#" onclick="history.back();"><img src="/images/error_02.gif"></a></td>
	            </tr>
	          </table>
          </td>
		  		<!-- ����/���� ��ư ���� -->
        </tr>
      </table>
    </td>
  </tr>
</table>
<!-- '�������̺�' ��-->
<!-- ���鼳�� ����-->

<DIV id="Layer" style="width:750px; visibility:hidden; overflow:hidden;">
<table width="750" cellpadding="0" cellspacing="0">
	<tr>
  	<td height="15" colspan="2"></td>
  </tr>
  <tr valign="top">
    <td width="150"></td>
    <td> 
		  <table width="600" cellpadding="0" cellspacing="0" bgcolor="#999999">
		    <tr>
		      <td height="2" bgcolor="DDC89D"></td>
		    </tr>
		    <tr>
		      <td height="24" bgcolor="F8F4EC"><b>�����󼼳���</b> </td>
		    </tr>
		    <tr>
		      <td height="1" bgcolor="DDC89D"></td>
		    </tr>
				<tr>
		      <td bgcolor="#FFFFFF" class="bbs_coment07">     
						<%
							java.lang.Exception e=(java.lang.Exception)request.getAttribute("exception"); 
							e.printStackTrace(); 
							StackTraceElement[] trace=e.getStackTrace(); 
							StringBuffer sb=new StringBuffer(); 
							sb.append(e.toString()); 
							sb.append("<p>");
							for(int i=0; i<trace.length; i++){
								sb.append(trace[i]);
								sb.append("<br>"); 			
							}
							sb.append("</p>");
							out.println(sb.toString());
						%>			
					</td>
		    </tr>
				<tr>
		      <td height="2" bgcolor="DDC89D"></td>
		    </tr>
		  </table>
		</td>
	</tr>
</table>
</div>
<!-- ���鼳�� ��-->
<!-- �����󼼳��� ���� -->

<!-- �����󼼳��� �� -->
<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<map name="Map"><area shape="rect" coords="27,185,115,200" href="#" onClick="MM_showHideLayers()">
</map></body>
<script type="text/JavaScript">
var clickyn = "n";
var height = Layer.style.height;
Layer.style.height = "10px";
function MM_showHideLayers() { //v6.0
 	 if (clickyn == "y"){   
    Layer.style.visibility="hidden";
    Layer.style.height = "10px";
    clickyn = "n";
   }else {
    Layer.style.visibility="visible";
    Layer.style.height = height;
    clickyn = "y"
   }
}
</script>
</html>