<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="�����/������ ��" src="/images/system/title_01-7.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <td colspan="2">
		<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
		<tr>
		  <td>
			<!--���̺� ��� ����-->
			<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
			<tr>
			  <td class="t1" width="49">����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="90">��üŰ</td>
			  <td class="sBg"></td>
			  <td class="t1" width="80">����</td>
			  <td class="sBg"></td>
			  <td class="t1">�Ҽ�</td>
			  <td class="sBg"></td>
			  <td class="t1" width="80">����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="170">����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="100">����</td>
			  <td width="17"></td>
			</tr>
			</table>
			<!--���̺� ��� ��-->
			<!--����Ʈ ����-->
			<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			  <c:forEach var="list" items="${rsStudentList}" varStatus="i" >
				<!-- �� ��� -->
				<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				<tr class="${lineBg}">
				  <td class="t2" width="49"><c:out value="${i.count}"/></td>
				  <td class="sBg"></td>
				  <td class="t2" width="90"><c:out value="${list.juminNo}"/></td>
				  <td class="sBg"></td>
				  <td class="t3" width="80">&nbsp;<c:out value="${list.userName}"/></td>
				  <td class="sBg"></td>
				  <td class="t3">&nbsp;<c:out value="${list.assignName}"/></td>
				  <td class="sBg"></td>
				  <td class="t3" width="80">&nbsp;<c:out value="${list.gradeName}"/></td>
				  <td class="sBg"></td>
				  <td class="t3" width="170">&nbsp;<c:out value="${list.rankName}"/></td>
				  <td class="sBg"></td>
				  <td class="t3" width="100">&nbsp;<c:out value="${list.jobName}"/></td>																							
				</tr>
				<tr>
				  <td colspan="19" class="lbg3"></td>
				</tr>
				<c:set var="no" scope="request" value="${i.count}"/>
			  </c:forEach>
			  <c:if test="${no == null}">
				<tr class="tbg3">
				  <td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
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
	<tr>
	  <td height="30">
		�� �����(LDAP) ���̺� �������� �ʴ� �������� ǥ���մϴ�.
	  </td>
	  <td align="right"><img src='<html:rewrite page="/images/board/btn_refresh.gif"/>' alt="���ΰ�ħ" style="cursor:hand" onclick="document.location.reload();"/></td>
	</tr>
	</table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(170);
//-->
</script>