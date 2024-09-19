<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script language="JavaScript">
<!--
	function checkGroup()
	{
		var f = $('insert');
		var groupName = f.groupName.value;
		if(groupName=='')
		{
			alert('그룹명이 없습니다.');
			f.groupName.focus();
			return;
		}
		f.submit();
	}

	function userList(groupNo) 
	{
		if(groupNo == '')
			if(document.all.listGroupNo)
				groupNo = document.all.listGroupNo[0].value;
				
		document.all.selGroupNo.value = groupNo;
		var url = '${pageContext.request.contextPath}/sysGroup.act?task=user_list';
		var pars = 'groupNo='+groupNo;
		
	  var myAjax = new Ajax.Request(
	                     url,
	                      {    asynchronous: "true",
														method: 'post',
	                          parameters: pars,
	                        	onComplete: user_List                     
	                      });
	}
	
	function user_List(originalRequest)
	{	
		$('mainList2').innerHTML = originalRequest.responseText;
	}
 
	function insertUser()
	{
		var groupNo = document.all.selGroupNo.value;

		if(groupNo=='')
		{
			alert('선택된 그룹이 없습니다.');
			return;
		}

 		window.open('${pageContext.request.contextPath}/sysGroup.act?task=user_add&groupNo='+groupNo,'searchUser',
 		'height=651,width=480,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=no,top=300,left=700');
	}

	function modGroup(groupNo, groupName)
	{
		var f = document.insert;
		
		insert.groupName.value = groupName;
		insert.groupNo.value = groupNo;
	}

	function delGroup(groupNo)
	{
		if(confirm('삭제하시겠습니까?'))
		{
			document.location.href = '${pageContext.request.contextPath}/sysGroup.act?task=delete&groupNo='+groupNo;
		}
	}

	function delUser(juminNo, groupNo)
	{
		if(confirm('삭제하시겠습니까?'))
		{
			document.all.selGroupNo.value = groupNo;
			var url = '${pageContext.request.contextPath}/sysGroup.act?task=del_user';
			var pars = 'juminNo='+juminNo+'&groupNo='+groupNo;
			
		  var myAjax = new Ajax.Request(
		                     url,
		                      {    asynchronous: "true",
															method: 'post',
		                          parameters: pars,
		                        	onComplete: goUserList                 
		                      });
		}
	}
	function goUserList(originalRequest)
	{	
		var groupNo = document.all.selGroupNo.value;
		userList(groupNo);
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="그룹 관리" src="/images/system/title_01-4.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--게시물 목록 시작-->
	<table width="750" cellspacing="0" cellpadding="0">
	<tr valign="top">
	  <td>
		<table width="385" cellspacing="0" cellpadding="0">
		<tr>
		  <td height="25">
			<img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle"/><b>그룹관리</b>
		  </td>
		</tr>
		</table>
		<table width="365" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
		<tr>
		  <td>
			<form name="form1">
			  <input type="hidden" name="groupNo" value=''>
			  <table width="361" border="0" cellspacing="0" cellpadding="0" class="cbg">
			  <caption>사용자 목록</caption>
			  <tr>
				<td class="t1">그룹명</td>
				<td class="sBg"></td>
				<td class="t1" width="100">관리</td>
				<td width="17"></td>
			  </tr>
			  </table>
			  <div id="mainList1" style="width:361px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
				<c:set var="no" scope="request" value="1"/>
				<table id="mainTable1" width="344" border="0" cellspacing="0" cellpadding="0">
				<c:forEach var="groupList" items="${rsSysGroupList}" varStatus="i" >
				  <input type="hidden" name="listGroupNo" value="${groupList.groupNo}"/>
				  <!-- 열 배경 -->
				  <c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				  <c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				  <tr class="${lineBg}">
					<td class="t3">&nbsp;<a href="#" onclick="userList('${groupList.groupNo}');" ><u><c:out value="${groupList.groupName}"/></u></a></td>
					<td class="sBg"></td>
					<td class="t2" width="100">
					  <img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle" style="cursor:hand" alt="수정" onclick="modGroup('${groupList.groupNo}','${groupList.groupName}')"/> 
					  <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle" style="cursor:hand" alt="삭제" onclick="delGroup('${groupList.groupNo}')"/>
					</td>
				  </tr>
				  <tr><td class="lbg3" colspan="3"></td></tr>
				  <c:set var="no" scope="request" value="${no + 1}"/>
				</c:forEach>
			  	</table>
			  </div>
			</form>
			<!--그룹 등록 -->
			<form id="insert" name="insert" method="POST"  action='<html:rewrite page="/sysGroup.act?task=insert"/>'>
			  <table width="361" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td class="t2BgRed">
				  <input type="text" name="groupName" title="그룹명" class="inputText" value=""  size="38" onkeyup="checkLength(this,20);"/>
				  <input type="hidden" name="groupNo" value=''>
				</td>
				<td class="sBg"></td>
				<td class="t2BgRed" width="100"><img src='<html:rewrite page="/images/board/btn_modify2.gif"/>' alt="등록/수정" style="cursor:hand" align="absmiddle" onclick="checkGroup();"/></td>
				<td class="t2BgRed" width="17"></td>
			  </tr>
			  </table>
			</form>
			<!--검색 끝-->
		  </td>
		</tr>
		</table>
	  </td>
	  <td>
		<table width="365" cellspacing="0" cellpadding="0">
		<tr>
		  <td height="25">
			<img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" /><b>그룹별 사용자 관리</b>
		  </td>
		</tr>
		</table>
		<table width="365" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
		<tr>
		  <td>
			<table width="361" border="0" cellspacing="0" cellpadding="0" class="cbg">
			<caption>사용자 목록</caption>
			<tr>
			  <td width=200 class="t1">사용자</td>
			  <td class="sBg"></td>
			  <td width=100 class="t1">관리</td>
			  <td width="17"></td>
			</tr>
			</table>
			<div id="mainList2" style="width:361px; z-index:0; overflow-y:scroll; overflow-x:hidden"> 
			</div>
		  </td>
		</tr>
		</table>
		<table width="365" cellspacing="0" cellpadding="0" height="30">
		<tr valign="bottom">
		  <td align="right">
			<input type="hidden" name="selGroupNo" >
			<img src='<html:rewrite page="/images/board/btn_user_add.gif"/>' align="absmiddle" alt="사용자 추가" style="cursor:hand" onclick="insertUser();"/> 
			<!-- <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="저장" style="cursor:hand" /> -->
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
	double_tresize(175);
	userList('');
//-->
</script>