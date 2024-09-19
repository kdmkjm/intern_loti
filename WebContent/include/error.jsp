<%-- 
- 모듈명: 프로그램 헤더(관리자)
- 설명: 프로그램 헤더메뉴(관리자)

- 작성자: 과장 김동철
- 작성일: 2008.01.22
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
<!-- 탑여백 시작-->
<BODY>
<p>
  <!-- 탑여백 끝-->
  <!-- 로고 시작-->
  <!--  로고 끝-->
  <!-- '에러테이블' 시작-->
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
          <td width="278" height="105" align="center" valign="middle"><span class="styledb">에러가 발생하였습니다.</span></td>
          <td width="45">&nbsp;</td>
        </tr>        
        <tr> 
          <td class="style1 " >
						내부 Sever에 에러가 발생한것 같습니다.<br>
						잠시후 다시 시도(<b>F5키</b>)를 누르시거나 관리자에게 연락을 주십시오. 바로 해결해 드리겠습니다.<br>
						에러가 발생한 페이지는 최선을 다하여 바로 <b>수정조치</b> 하겠습니다. 감사합니다.</td>
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
		  		<!-- 이전/메인 버튼 시작 -->
        </tr>
      </table>
    </td>
  </tr>
</table>
<!-- '에러테이블' 끝-->
<!-- 여백설정 시작-->

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
		      <td height="24" bgcolor="F8F4EC"><b>오류상세내역</b> </td>
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
<!-- 여백설정 끝-->
<!-- 오류상세내역 시작 -->

<!-- 오류상세내역 끝 -->
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