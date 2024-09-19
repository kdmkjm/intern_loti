<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
	function ozReport()
	{
		var searchFromDate = document.all.searchFromDate.value;
		var searchToDate = document.all.searchToDate.value;
		
		window.open('<html:rewrite page="/ozMenu.act"/>?report=prof_grade&searchFromDate=' + searchFromDate + '&searchToDate=' + searchToDate, 'prof_grade', 'scrollbars=no, resizable=yes, menubar=no, width=710, height=550, status=yes');
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="�����޺� ��ȸ" src="/images/teacher/title_06.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--�˻� -->
	<html:form method="POST" action="prfGradeInfo.act?task=list">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr valign="middle"> 
		<td width="99" class="s1">�Ⱓ</td>
		<td class="sBar"></td>
		<td class="s2"> 
		  <html:text property="searchFromDate" style="width:70px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, document.forms[0].searchFromDate, 'yyyy-mm-dd')">&nbsp;~
		  <html:text property="searchToDate" style="width:70px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, document.forms[0].searchToDate, 'yyyy-mm-dd')">
		</td>
		<td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="document.forms[0].submit();" style="cursor:hand" align="absbottom"/></td>
	  </tr>
	  </table>
	  <!--�˻� ��-->
	  <table>
	  <tr>
		<td height="15"></td>
	  </tr>
	  </table>
	  <!-- ���� ���� -->
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	  <tr>
		<td>
		  <!--���̺� ��� ����-->
		  <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		  <tr>
			<td class="t1" width="119">��޺�</td>
			<td class="sBg"></td>
			<td class="t1">�ܰ�</td>
			<td class="sBg"></td>
			<td class="t1" width="129">�����ο�</td>
			<td class="sBg"></td>
			<td class="t1" width="129">���޽ð���</td>
			<td class="sBg"></td>
			<td class="t1" width="130">���޾�(õ��)</td>
		  </tr>
		  </table>
		  <!--���̺� ��� ��-->
		  <!--����Ʈ �հ� ����-->
		  <table width="746" border="0" cellspacing="0" cellpadding="0">
		  <tr height="30">
			<td class="t2BgRed" width="355">�հ�</td>
			<td class="sBg"></td>
			<td class="t2BgRedR" width="129"><fmt:formatNumber value="${rsPrf_ProfGradeTotalList.countProf}" pattern="#,##0"/>&nbsp;</td>
			<td class="sBg"></td>
			<td class="t2BgRedR" width="129"><fmt:formatNumber value="${rsPrf_ProfGradeTotalList.lectHour}" pattern="#,##0"/>&nbsp;</td>
			<td class="sBg"></td>
			<td class="t2BgRedR" width="130"><fmt:formatNumber value="${rsPrf_ProfGradeTotalList.lectPay}" pattern="#,##0"/>&nbsp;</td>
		  </tr>
		  <tr>
			<td colspan="13" class="lbg3"></td>
		  </tr>
		  </table>
		  <!--����Ʈ �հ� ��-->
		  <!--����Ʈ ����-->
		  <table  width="746" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsPrf_ProfGradeList}" varStatus="i" >
			<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2" width="119">${list.levelName}</td>
			  <td class="sBg"></td>
			  <td class="t3">&nbsp;${list.price1}<br>&nbsp;${list.price2}</td>	
			  <td class="sBg"></td>
			  <td class="t4" width="129"><fmt:formatNumber value="${list.countProf}" pattern="#,##0"/>&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t4" width="129"><fmt:formatNumber value="${list.lectHour}" pattern="#,##0"/>&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t4" width="130"><fmt:formatNumber value="${list.lectPay}" pattern="#,##0"/>&nbsp;</td>
			</tr>
			<tr>
			  <td colspan="13" class="lbg3"></td>
			</tr>
			<c:set value="${i.count}" var="count"></c:set>
		  </c:forEach>
		  </table>
		  <!--����Ʈ ��-->
		</td>
	  </tr>
	  </table>
	  <!-- ���� �� -->
	  <!--�ϴܹ�ư ���̺� ����-->
	  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
	  <tr valign="middle"> 
		<td align="right">
		  <img src='<html:rewrite page="/images/board/btn_print.gif"/>' alt="�μ�" align="absmiddle" onclick="ozReport();" style="cursor:hand"/>
		</td>
	  </tr>
	  </table>
	  <!--�ϴܹ�ư ���̺� ��-->
	</html:form>
  </td>
</tr>
</table>