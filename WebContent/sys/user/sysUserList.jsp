<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script language="JavaScript">
	function modify(juminNo)
	{
		var searchKeyword = document.all.searchKeyword.value;
		
		var url = '${pageContext.request.contextPath}/sysUser.act?task=modify&juminNo='+juminNo +'&searchKeyword='+searchKeyword;
		document.location.href = url;
	}
	function doSubmit()
	{
		if(document.forms[0].searchKeyword.value == "")
		{
			alert("����ڸ��� �Է��ϼ���");
			document.forms[0].searchKeyword.focus();
			return;
		}
		document.forms[0].submit();
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="����� ����" src="/images/system/title_01.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--�˻� -->
	<html:form method="POST" action="/sysUser.act?task=list" >
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr valign="middle">
		<td width="75" class="s1">����ڸ�</td>
		<td class="s2">
		  <html:text property="searchKeyword" style="width:150px"/>
		</td>
        <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="doSubmit();" style="cursor:hand"/></td>
	  </tr>
	  </table>
	</html:form>
	<!--�˻� ��-->
	<table>
	<tr>
	  <td height="15"></td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" width="49">��ȣ</td>
		  <td class="sBg"></td>
		  <td class="t1" width="79">�̸�</td>
		  <td class="sBg"></td>
		  <td class="t1">�Ҽ�</td>
		  <td class="sBg"></td>
		  <td class="t1" width="129">����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="179">�޴� ����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="100">�����</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsSysUserList}" varStatus="i" >
			<!-- �� ��� -->
			<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2" width="49"><c:out value="${i.count}"/></td>
			  <td class="sBg"></td>
			  <td class="t2" width="79">
				<a href='#' onclick="modify(${list.juminNo})"><u><c:out value="${list.userName}"/></u></a>
			  </td>
			  <td class="sBg"></td>
			  <td class="t3">&nbsp;<c:out value="${list.assignName}"/></td>
			  <td class="sBg"></td>
			  <td class="t3" width="129">&nbsp;<c:out value="${list.rankName}"/></td>
			  <td class="sBg"></td>
			  <td class="t2" width="179"><c:out value="${list.isAdmin}"/></td>
			  <td class="sBg"></td>
			  <td class="t2" width="100"><c:out value="${list.insDate}"/></td>												
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
	<!--�ϴܹ�ư ���̺� ����-->
	<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
	<tr valign="bottom"> 
	  <td align="right">
		<img src='<html:rewrite page="/images/board/btn_up2.gif"/>' alt="�űԵ��"  onclick="location.href='<html:rewrite page="/sysUser.act?task=create"/>'" style="cursor:hand"> 
	  </td>
	</tr>
	</table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	document.all.searchKeyword.focus();
	tresize(170);
//-->
</script>