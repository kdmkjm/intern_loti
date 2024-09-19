<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>

<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="������ ������� ��Ȳ" src="/images/operation/title_22.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <!--�˻� ���̺� ����-->
    <html:form action="oprStudent.act?task=cancelHistory" onsubmit="return false">
      <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
      <tr> 
        <td>
		  <table width="748" border="0" cellspacing="0" cellpadding="0">
		  <tr> 
			<td width="99" class="s1">�����Ⱓ</td>
			<td class="sBar"></td>
			<td class="s2"> 
			  <html:text property="courseYear" readonly="true" style="width:70px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].courseYear);">
			</td>
			<td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="document.forms[0].submit();" style="cursor:hand" align="absbottom"/></td>
		  </tr>
		  </table>
		</td>
	  </tr>
	  </table>
	</html:form>
	<!--�˻� ���̺� ��-->
	<table width="750" cellspacing="0" cellpadding="0">
	<tr> 
	  <td height="15">&nbsp; </td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
	    <tr> 
	      <td class="t1" width="34">����</td>
	      <td class="sBg"></td>
	      <td class="t1">����</td>
	      <td class="sBg"></td>
	      <td class="t1" width="159">�Ҽ�</td>
	      <td class="sBg"></td>
	      <td class="t1" width="109">����</td>
	      <td class="sBg"></td>
	      <td class="t1" width="49">����</td>
	      <td class="sBg"></td>
	      <td class="t1" width="59">�������</td>
	      <td class="sBg"></td>
	      <td class="t1" width="109">����</td>
	      <td class="sBg"></td>
	      <td class="t1" width="69">��ҳ�¥</td>
	      <td width="17"></td>
	    </tr>
	    </table>
	    <!--���̺� ��� ��-->
	    <!--����Ʈ ����-->
        <div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden;"> 
          <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
          <c:forEach var="list" items="${rsOpr_CancleHistory}" varStatus="i">
			<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2" width="34" style="border-bottom:1px solid #D6D6D6">${list.stdno}</td>
			  <td class="sBg"></td>
			  <td class="t3" style="border-bottom:1px solid #D6D6D6">&nbsp;${list.courseName}</td>
			  <td class="sBg"></td>
			  <td class="t3" width="159" style="border-bottom:1px solid #D6D6D6">&nbsp;${list.assignname}</td>
			  <td class="sBg"></td>
			  <td class="t3" width="109" style="border-bottom:1px solid #D6D6D6">&nbsp;${list.rankname}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="49" style="border-bottom:1px solid #D6D6D6">${list.stdname}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="59" style="border-bottom:1px solid #D6D6D6">${list.juminno}</td>
			  <td class="sBg"></td>
			  <td class="t3" width="109" style="border-bottom:1px solid #D6D6D6">
			    <div title="${list.canReason}">
				  <c:if test="${fn:length(list.canReason) > 7}">&nbsp;<c:out value="${fn:substring(list.canReason, 0, 7)}��"/></c:if>
				  <c:if test="${fn:length(list.canReason) < 7}">&nbsp;<c:out value="${list.canReason}"/></c:if>
				</div>
			  </td>
			  <td class="sBg"></td>
			  <td class="t2" width="69" style="border-bottom:1px solid #D6D6D6">${list.canDate}</td>
			</tr>
            <c:set var="count" value="${i.count}"/>
          </c:forEach>
          <c:if test="${count==null}">
			<tr class="tbg3">
			  <td class="t2" colspan="99">��ȸ�� �����Ͱ� �����ϴ�.</td>
			</tr>
		  </c:if>
          </table>
        </div>
        <!--����Ʈ ��-->
      </td>
    </tr>
	</table>   
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(182);
//-->
</script>
