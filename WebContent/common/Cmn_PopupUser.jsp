<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>������ �˻�</title>
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
<!--
window.onresize = function(){
//   ������ ������ ���� ���� �ڵ�
	tresize_pop(398, 200);
}
function pressEnter(frm)
{
	if(event.keyCode == 13)
	{
		doSearch(frm);
	}
}
function closeWin()
{
   self.close();
}

function getPersoname(uName, sName, cPhone, jNo)
{
	var type = document.all.type.value;
	
	if(type != 'notLend')
	{
	  opener.document.all.lendUser.value=uName;
	  opener.document.all.lendPosition.value=sName;
	  opener.document.all.lendPhone.value=cPhone;
	}
	else if(type == 'notLend')
	{ 
	  opener.document.all.searchCode.value=jNo;
	  opener.document.all.searchName.value=uName;
	  opener.document.all.searchPosition.value=sName;
	}
 
  top.window.close();
}

function doSearch(frm)
{
	if(frm.searchKeywordUserName.value == "")
	{
		alert("�̸��� �Է��ϼ���.");
		frm.searchKeywordUserName.focus();
		return;
	}
	frm.submit();
}
-->
</script>
</head>
<body>
<table width="400" border="0" cellspacing="5" cellpadding="0" height="360" bgcolor="#E7E7E7">
  <tr> 
    <td valign="top"> 
      <table width="390" border="0" cellspacing="1" cellpadding="0" height="350" bgcolor="#D1D1D1">
        <tr> 
          <td bgcolor="#FFFFFF" valign="top"> 
		      	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          		<tr>
          			<td>
			            <table width="100%" border="0" cellspacing="0" cellpadding="0">
			              <tr> 
			                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/resources/title_03-4.gif"/>' alt="������ �˻�" /></td>
			              </tr>
			              <tr> 
			                <td height="10"></td>
			              </tr>
			              <tr valign="top" align="center"> 
			                <td>
												<!--�˻� ���̺� ����-->
												<html:form method="POST" action="cmnUser.act?task=list&searchTrue=true&type=${type}">
												<table width="360" border="0" height="35" cellspacing="0" cellpadding="0">
													<tr>
														<td width="85" class="pItem">�̸�/�Ҽ�</td>
													  <td align="left" width="150"><html:text property="searchKeywordUserName" style="width:150px;" onkeydown="pressEnter(document.forms[0]);" /></td>
														<td align="left">&nbsp;<img src='<html:rewrite page="/images/board/btn_s_search.gif"/>' alt="�˻�" onclick="doSearch(document.forms[0])" style="cursor:hand" align="absmiddle"/></td>
													</tr>
												</table>
												</html:form>
												<!--�˻� ���̺� ��-->
												<!--�˻� ��� ����-->
												<table width="360" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
												  <tr>
												    <td class="pt1" width="50">�̸�</td>
												    <td class="pt1" width="190">�Ҽ�</td>
												    <td class="pt1">�������</td>
												  </tr>
												</table>
												<!--�˻� ��� ��-->    
<!--�˻� ����Ʈ ����-->
<div id="mainList" style="width:360px;z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
<table id="mainTable" width="343" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
<c:set var="no" scope="request" value="1"/>
<c:forEach var="list" items="${rsCmn_PopupUserList}" varStatus="i">
	<tr>
		<td class="pt2" width="50" ><a href="#" onclick="getPersoname('${list.userName}','${list.simpleName}','${list.cellPhone}','${list.juminNo}');"><u><c:out value="${list.userName}"/></u></a></td>
		<td class="pt2Left" width="190">&nbsp;<c:out value="${list.simpleName}"/></td>
		<td class="pt2"><c:out value="${fn:substring(list.juminNo,0,6)}"/></td>
	</tr>
	<c:set var="no" scope="request" value="${no + 1 }"/>
</c:forEach>
<html:hidden property="type" value="${type}"/>
<input type="hidden" name="max" value="${no - 1}"/>
<c:if test="${no==1}">
	<tr class="tbg3" height="21">
		<td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
	</tr>
</c:if>
</table>
</div>
			                	<!--�˻� ����Ʈ ��-->
			                </td>
										</tr>
									</table>
									<!--�ϴ� ��ư ����-->
								  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="28">
									  <tr valign="bottom">
									    <td align="right"><input type="image" src='<html:rewrite page="/images/board/btn_close.gif"/>' align="absmiddle" alt="�ݱ�" onclick='closeWin()' style="cursor:hand"/></td>
									    <td align="right" width="10"></td>
									  </tr>
									  <tr><td colspan="2" height="2"></td></tr>
									</table>
									<!--�ϴ� ��ư ��-->
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
	tresize_pop(398, 200);
	document.all.searchKeywordUserName.focus();
	document.all.searchKeywordUserName.value=document.all.searchKeywordUserName.value;
//-->
</script>
</body>
</html>
