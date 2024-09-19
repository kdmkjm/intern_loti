<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src='<html:rewrite page="/common/js/prototype.js"/>'></script>
<script language="JavaScript">
	function selectMenu(menuNo, obj)
	{
		$('selMenuNo').value = menuNo;

	}


	function addMenu(menuType)
	{
		if($('selMenuNo').value)
		{
			var menuNo = $('selMenuNo').value;
			var url = '${pageContext.request.contextPath}/sysMenu.act?task=create&parent='+menuNo+'&menuType='+menuType;
			document.location.href = url;
		}
		else
		{
			alert('������ ������ �ּ���');
		}
	}

	function deleteMenu(menuNo)
	{
		if(confirm('�����Ͻðڽ��ϱ�?'))
		{
			var url = '${pageContext.request.contextPath}/sysMenu.act?task=delete&menuNo='+menuNo;
			document.location.href = url;
		}
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="�޴� ����" src="/images/system/title_02.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <td>
		<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
		<tr>
		  <td>
			<!--���̺� ��� ����-->
			<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
			<tr>
			  <td class="t1" width="60">�޴�<br>�ڵ�</td>
              <td class="sBg"></td>
			  <td class="t1" width="50">����</td>
              <td class="sBg"></td>
			  <td class="t1" width="170">�޴���</td>
              <td class="sBg"></td>
			  <td class="t1" width="200">������</td>
              <td class="sBg"></td>
			  <td class="t1" width="80">���α׷�ID</td>
              <td class="sBg"></td>
			  <td class="t1" width="50">ǥ��<br>����</td>
              <td class="sBg"></td>
			  <td class="t1" width="50">����</td>
              <td class="sBg"></td>
			  <td class="t1" width="50">����</td>
			  <td width="17"></td>
			</tr>
			<tr><td colspan="99" class="sBg"></td></tr>
			<c:if test="${parent > 0 }">
			  <tr>
				<td class="t2BgRed"></td>
                <td class="t2BgRed"></td>
				<td class="t2BgRed"><img src='<html:rewrite page="/images/icon/folder.gif"/>'></td>
                <td class="t2BgRed"></td>
				<td class="t2BgRed">
				  <a href='<html:rewrite page="/sysMenu.act?task=list&parent=${upFolder}"/>'><span>����������...</span></a>
				</td>
                <td class="t2BgRed"></td>
				<td class="t2BgRed"></td>
                <td class="t2BgRed"></td>
				<td class="t2BgRed"></td>
                <td class="t2BgRed"></td>
				<td class="t2BgRed"></td>
                <td class="t2BgRed"></td>
				<td class="t2BgRed"></td>
                <td class="t2BgRed"></td>
				<td class="t2BgRed"></td>
				<td width="17" class="t2BgRed"></td>
			  </tr>
			</c:if>
			</table>
			<!--���̺� ��� ��-->
			<!--����Ʈ ����-->
			<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			  <c:set var="no" scope="request" value="0"/>
			  <c:forEach var="list" items="${rsSysMenuList}" varStatus="i" >
				<!-- �� ��� -->
				<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				<tr class="${lineBg}">
				  <td class="t2" width="60"><c:out value="${list.menuNo}"/></td>
                  <td class="sBg"></td>
				  <td class="t2" width="50">
					<c:if test="${list.menuType=='F'}">
					  <img src='<html:rewrite page="/images/icon/folder.gif"/>'>
					</c:if>
					<c:if test="${list.menuType=='M'}">
					  <img src='<html:rewrite page="/images/icon/html.gif"/>'>
					</c:if>
				  </td>
                  <td class="sBg"></td>
				  <td class="t3"  width="170">&nbsp;
				    <c:if test="${list.menuType=='F'}">
					  <a href='<html:rewrite page="/sysMenu.act?task=list&parent=${list.menuNo}&upFolder=${list.parent}"/>'><span><c:out value="${list.menuName}"/></span></a>
				    </c:if>
				    <c:if test="${list.menuType=='M'}">
					  <span><c:out value="${list.menuName}"/></span>
				    </c:if>
				  </td>
                  <td class="sBg"></td>
				  <td class="t3" width="200">&nbsp;<c:out value="${list.execPath}"/></td>
                  <td class="sBg"></td>
				  <td class="t2" width="80"><c:out value="${list.progId}"/></td>
                  <td class="sBg"></td>
				  <td class="t2" width="50"><c:out value="${list.dispOrder}"/></td>
                  <td class="sBg"></td>
				  <td class="t2" width="50"><a href='<html:rewrite page="/sysMenu.act?task=modify&menuNo=${list.menuNo}&menuType=${list.menuType}"/>'><img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle" alt="����"/></a></td>
                  <td class="sBg"></td>
				  <td class="t2" width="50"><a href='#' onclick="deleteMenu('${list.menuNo}')"><img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle" alt="����"/></a></td>
				</tr>
				<tr><td colspan="99" class="lbg3"></td></tr>
				<c:set var="no" scope="request" value="${no + 1}"/>
			  </c:forEach>
			  <c:if test="${no==0}">
				<tr class="tbg3" height="21"><td class="t2" colspan="99">��ȸ�� �����Ͱ� �����ϴ�.</td></tr>
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
			<input id="selMenuNo" type="hidden" disabled="disabled" name="selMenuNo" value="${parent}">
			<img src='<html:rewrite page="/images/board/btn_folderadd.gif"/>' align="absbottom" style="cursor:hand" onclick="addMenu('F');" alt="���������߰�">
			<img src='<html:rewrite page="/images/board/btn_pgadd.gif"/>' align="absbottom" style="cursor:hand" onclick="addMenu('M');" alt="���α׷��߰�"> 
		  </td>
		</tr>
		</table>
	  </td>
	</tr>
	</table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(145);
//-->
</script>