<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>���ĸ��</title>

<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>

<script language="JavaScript">
<!--
window.onresize = function(){
//   ������ ������ ���� ���� �ڵ�
	tresize_pop(398, 195);
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

function getJobName(rCode, rName)
{
	opener.document.forms[0].jobkind.value=rCode;
	opener.document.forms[0].jobname.value=rName;
 
  top.window.close();
}

function doSearch(frm)
{
	if(frm.searchKeyword.value == "")
	{
		alert("���ĸ�Ī�� �Է��ϼ���.");
		frm.searchKeyword.focus();
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
			                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/resources/title_03-6.gif"/>' alt="���ĸ��"/></td>
			              </tr>
			              <tr> 
			                <td height="10"></td>
			              </tr>
			              <tr valign="top" align="center"> 
			                <td>
												<!--�˻� ���̺� ����-->
												<html:form method="POST" action="/cmnRankJob.act?task=popjob&flag=search">
												<table width="360" border="0" height="35" cellspacing="0" cellpadding="0">
													<tr>
														<td width="85" class="pItem">���ĸ�Ī</td>
													  <td align="left" width="150"><html:text property="searchKeyword" style="width:150px;" onkeydown="pressEnter(document.forms[0]);" /></td>
														<td align="left">&nbsp;<img src='<html:rewrite page="/images/board/btn_s_search.gif"/>' alt="�˻�" onclick="doSearch(document.forms[0])" style="cursor:hand" align="absmiddle"/></td>
													</tr>
												</table>
												</html:form>
												<!--�˻� ���̺� ��-->
												<!--�˻� ��� ����-->
												<table width="360" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
												  <tr>
												    <td class="pt1" width="100">�����ڵ�</td>
												    <td class="pt1" width="150">���ĸ�Ī</td>			
												    <td class="pt1">����ǥ�ø�Ī</td>										    
												  </tr>
												</table>
												<!--�˻� ��� ��-->    
												<!--�˻� ����Ʈ ����-->
												<div id="mainList" style="width:360px;z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
											  <table id="mainTable" width="343" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
												<c:set var="no" scope="request" value="1"/>
													<c:forEach var="list" items="${sysJobList}" varStatus="i">
														<!-- �� ��� -->
														<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
														<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
														<tr class="${lineBg}">
															<td class="pt2" width="100" >
												  			<a href="#" onclick="getJobName('${list.code}','${list.codename}');"><u><c:out value="${list.code}"/></u></a>
											  			</td>
															<td class="pt2" width="150"><c:out value="${list.codename}"/></td>		
															<td class="pt2"><c:out value="${list.displayname}"/></td>													
														</tr>
														<c:set var="no" scope="request" value="${no + 1 }"/>																							
													</c:forEach>
													<c:if test="${no==1}">
														<tr class="tbg3" height="21">
															<td class="t2" colspan="3">��ȸ�� �����Ͱ� �����ϴ�.</td>
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
	tresize_pop(398, 195);
//-->
</script>
</body>
</html>
