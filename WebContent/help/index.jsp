<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>온라인 도움말</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
</head>
<body>
<table width="930" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
    		<tr valign="bottom">
    			<td align="left"><a href='<html:rewrite page="/onHelp.act?task=index"/>'><img src='<html:rewrite page="/images/help/logo.gif"/>'></a><img src='<html:rewrite page="/images/help/help_all.gif"/>' onclick="location.href='<html:rewrite page="/onHelp.act?task=left"/>'"></td>
					<td width="100" align="center"></td>
				</tr>
			</table>
  </tr>
  <tr>
    <td colspan="3" height="22"></td>
  </tr>
  <tr height="420">
    <td width="21"></td>
    <td width="887">
    	<table width="818" border="0" cellspacing="0" cellpadding="0" height="354" align="center">
    		<tr>
    			<td background='<html:rewrite page="/images/help/help_bg.gif"/>'>
			    	<table width="755" border="0" cellspacing="0" cellpadding="0" align="center">
			        <tr valign="top"> 
			          <td height="135" align="center"><a href='<html:rewrite page="/onHelp.act?task=left01"/>' onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<html:rewrite page="/images/help/help_01_over.gif"/>',1)"><img name="Image1" border="0" src='<html:rewrite page="/images/help/help_01.gif"/>' width="179" height="118" alt="훈련계획" /></a></td>
			          <td height="135" align="center"><a href='<html:rewrite page="/onHelp.act?task=left02"/>' onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<html:rewrite page="/images/help/help_02_over.gif"/>',1)"><img name="Image2" border="0" src='<html:rewrite page="/images/help/help_02.gif"/>' width="179" height="118" alt="과정운영" /></a></td>
			          <td height="135" align="center"><a href='<html:rewrite page="/onHelp.act?task=left03"/>' onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','<html:rewrite page="/images/help/help_03_over.gif"/>',1)"><img name="Image3" border="0" src='<html:rewrite page="/images/help/help_03.gif"/>' width="179" height="118" alt="교무" /></a></td>
			          <td height="135" align="center"><a href='<html:rewrite page="/onHelp.act?task=left04"/>' onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','<html:rewrite page="/images/help/help_04_over.gif"/>',1)"><img name="Image4" border="0" src='<html:rewrite page="/images/help/help_04.gif"/>' width="179" height="118" alt="교육비" /></a></td>
			        </tr>
			        <tr valign="top"> 
			          <td height="135" align="center"><a href='<html:rewrite page="/onHelp.act?task=left05"/>' onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<html:rewrite page="/images/help/help_05_over.gif"/>',1)"><img name="Image5" border="0" src='<html:rewrite page="/images/help/help_05.gif"/>' width="179" height="118" alt="평가" /></a></td>
			          <td height="135" align="center"><a href='<html:rewrite page="/onHelp.act?task=left06"/>' onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','<html:rewrite page="/images/help/help_06_over.gif"/>',1)"><img name="Image6" border="0" src='<html:rewrite page="/images/help/help_06.gif"/>' width="179" height="118" alt="기자재" /></a></td>
			          <td height="135" align="center"><a href='<html:rewrite page="/onHelp.act?task=left07"/>' onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image7','','<html:rewrite page="/images/help/help_07_over.gif"/>',1)"><img name="Image7" border="0" src='<html:rewrite page="/images/help/help_07.gif"/>' width="179" height="118" alt="도서관리" /></a></td>
			          <td height="135" align="center"><a href='<html:rewrite page="/onHelp.act?task=left08"/>' onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image8','','<html:rewrite page="/images/help/help_08_over.gif"/>',1)"><img name="Image8" border="0" src='<html:rewrite page="/images/help/help_08.gif"/>' width="179" height="118" alt="장소대여" /></a></td>
			        </tr>
		        </table>
					</td>
				</tr>
			</table>
		</td>
    <td width="22"></td>
  </tr>
  <tr>
    <td colspan="3" width="19"></td>
  </tr>
</table>
</body>
</html>
