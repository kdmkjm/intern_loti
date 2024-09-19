<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   ������ ������ ���� ���� �ڵ�
		tresize(205);
	}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="���������" src="/images/resources/title_04.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--��� �˻� ���̺� ����-->
	<html:form method="POST" action="rscRoom.act?task=month">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr>
		<td class="s1" width="75">�� ��</td>
		<td class="sBg" width="1"></td>
	    <td class="s2" width="130"> 
	      <html:text property="searchKeywordDate" style="width:80px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchKeywordDate);">
	    </td>
		<td class="sBg" width="1"></td>
		<td class="s1" width="75">���ǽ�</td>
		<td class="sBg" width="1"></td>
	    <td class="s2"> 
	      <html:select property="searchKeyword" style="width:80px">
			<html:optionsCollection name="roomNoCode" property="beanCollection" />
		  </html:select>
		</td>
	    <td width="60"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" /></td>
	  </tr>
	  </table>
	</html:form>
	<!--��� �˻� ���̺� ��-->
	<table>
	<tr>
      <td height="15"></td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--�޷� ����-->
		<table width="746" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
		<tr> 
		  <td class="t1Sun" width="106">�Ͽ���</td>
		  <td class="t1Mon" width="106">������</td>
		  <td class="t1Mon" width="106">ȭ����</td>
		  <td class="t1Mon" width="106">������</td>
		  <td class="t1Mon" width="106">�����</td>
		  <td class="t1Mon" width="106">�ݿ���</td>
		  <td class="t1Mon" width="123">�����</td>
		</tr>
		</table>
		<html:form method="POST" action="rscRoom.act?task=month">
		  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
			<table id="mainTable" width="729" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
			<c:set var="stWeek" scope="request" value="${startWeek}"/>
			<c:set var="dayNumber" scope="request" value="${startDay}"/>
			<c:forEach var="week" begin="${1}" end="${lengthWeek}">
			  <tr> 
				<c:forEach var="start" begin="${start+1}" end="${start+7}">
				  <td class="t1None" width="106"> 
					<table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
					<tr> 
					  <td class="date">
						<c:if test="${start-startWeek+1 <= lengthDay}">
						  <c:if test="${stWeek == 1}">
							<c:out value="${start-startWeek+1}"/>
							<p align="left">
							  <c:set var="lineNum" scope="request" value="1"/>
							  <c:forEach var="list" items="${rsRscRoomMonthList}" varStatus="i" >
								<c:if test="${dayNumber == list.dateNo}">
								  <c:if test="${lineNum ne 1}">
									<table width="100%" height="5" style="border-bottom:1px solid #D6D6D6"><tr><td></td></tr></table>
									<table width="100%" height="5"><tr><td></td></tr></table>
								  </c:if>
								  <img src='<html:rewrite page="/images/dot.gif"/>' align="absmiddle">&nbsp;${list.lendWhy}
								  <c:set var="lineNum" scope="request" value="${lineNum + 1}"/>
								</c:if>
							  </c:forEach>
							</p>
							<c:set var="dayNumber" scope="request" value="${dayNumber + 1}"/>											
						  </c:if>
						  <c:if test="${stWeek != 1}">
							<c:set var="stWeek" scope="request" value="${stWeek - 1}"/>
						  </c:if>
						</c:if>
					  </td>
					</tr>
					<tr> 
					  <td class="dateText">&nbsp;</td>
					</tr>
				    </table>
				  </td>
			    </c:forEach>
			    <c:set var="start" scope="request" value="${start + 7}"/>
			  </tr>
		    </c:forEach>
		    </table>
		  </div>
	    </html:form>
	    <!--�޷� ��-->
	  </td>
	</tr>
	</table>
	<!--�Խù� �Ʒ� ��ư ����-->
	<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
	<tr valign="bottom">
	  <td align="right">
		<img src='<html:rewrite page="/images/board/btn_room.gif"/>' align="absmiddle" alt="������뿩" style="cursor:hand" onclick="location.href='<html:rewrite page="/rscRoom.act?task=list"/>'"/> 
      </td>
	</tr>
	</table>
	<!--�Խù� �Ʒ� ��ư ��-->
  </td>
</tr>
</table>

<script type="text/javascript">
<!--
	tresize(205);
//-->
</script>
