<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>������ ��ܼ��� ��� - ����</title>
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
</head>
<body>
<table width="700" border="0" cellspacing="5" cellpadding="0" height="360" bgcolor="#E7E7E7">
  <tr> 
    <td valign="top"> 
      <table width="690" border="0" cellspacing="1" cellpadding="0" height="350" bgcolor="#D1D1D1">
        <tr> 
          <td bgcolor="#FFFFFF" valign="top"> 
		      	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          		<tr>
          			<td>
			            <table width="100%" border="0" cellspacing="0" cellpadding="0">
			              <tr> 
			                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/operation/title_24.gif"/>' alt="������ ��ܼ��� ��� - ����"/></td>
			              </tr>
			              <tr> 
			                <td height="10"></td>
			              </tr>
			              <tr>
			              	<td height="25" class="stitle">&nbsp;&nbsp;&nbsp;&nbsp;������ : ${courseName}, ����� : ${organName}</td>
			              </tr>
			              <tr valign="top" align="center"> 
			                <td>
												<table width="660" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
												  <tr> 
												    <td class="pt1" width="50">����</td>
												    <td class="pt1" width="90">��üŰ</td>
												    <td class="pt1">�Ҽ�</td>
												    <td class="pt1" width="100">����</td>
												    <td class="pt1" width="90">�޴���</td>
												    <td class="pt1" width="100">�̸���</td>
												    <td class="pt1" width="17"></td>
												  </tr>
												</table>
												<!--�˻��� ���� ����Ʈ ����-->
												<div id="mainList" style="width:660px; height:201px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
												<table id="mainTable" width="643" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
												<c:set var="no" scope="request" value="1"/>
												<c:forEach var="list" items="${rsOpr_StudentRcvFileInfo}" varStatus="i" >
													<tr>
												    <td class="pt2" width="50">${list.stdName}</td>
												    <td class="pt2" width="90">${list.juminNo}</td>
												    <td class="pt2Left">&nbsp;${list.stdDeptName}</td>
												    <td class="pt2" width="100">${list.rankName}</td>
												    <td class="pt2" width="90">${list.cellPhone}</td>
												    <td class="pt2" width="101">${list.email}</td>
													</tr>
													<c:set value="${no+1}" var="no"/>
												</c:forEach>
												<c:if test="${no==1}"><tr class="tbg3" height="21"><td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td></tr></c:if>
												</table>
												</div>
			                </td>
										</tr>
									</table>
									<!--�ϴ� ��ư ����-->
								  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="28">
									  <tr valign="bottom">
									    <td align="right">
									    	<img src='<html:rewrite page="/images/board/btn_close.gif"/>' align="absmiddle" alt="�ݱ�" onclick="self.close();" style="cursor:hand"/>
									    </td>
									    <td align="right" width="13"></td>
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
</body>
</html>
