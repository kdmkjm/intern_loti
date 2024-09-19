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
  /*
	function doList(juminNo)
	{
		var task = document.all.task.value;
		
		if(task == "create")
		{
			var url = '${pageContext.request.contextPath}/sysUser.act?task=move';
			document.location.href = url;
		}
		else if(task == "modify")
		{
			var searchKeyword = document.all.searchKeyword.value;
			
			var url = '${pageContext.request.contextPath}/sysUser.act?task=list&searchKeywordKR='+searchKeyword;
			document.location.href = url;
		}
	}
	
	// 체크박스의 체크여부를 확인하여 isAdmin에 값 부여
	function checkAdmin(obj)
	{
		if(obj.checked == true)
		{
			document.all.isAdmin.value = 'Y';
		}
		else
		{
			document.all.isAdmin.value = 'N';
		}
	}

	// 체크박스의 체크여부를 확인하여 checkYn 값 부여
	function checkGroup(obj)
	{
		if(obj.checked == true)
		{
			document.all.checkYn.value = 'Y';
		}
		else
		{
			document.all.checkYn.value = 'N';
		}
	}
	*/

	// isAdmin의 값을 체크하여 체크박스 값 부여
	function adminCheck()
	{

		var i = 0;
		while(document.all.isCheck[i])
		{
			if(document.all.isCheck[i].value=='Y')
			{
				document.all.select[i].checked = true;
			}
			i++;
		}
	}
	
	function doSubmit(frm)
	{
		var i = 0;
		while(document.all.isCheck[i])
		{
		
			if(document.all.select[i].checked)
			{
				document.all.isCheck[i].value = 'Y';
			}
			else
			{
				document.all.isCheck[i].value = 'N';
			}
			i++;
		}
		
		if(document.all.isAdmin.checked)	document.all.isAdmin.value = 'Y';
		else	document.all.isAdmin.value = 'N'; 
		
		if(document.all.isEduCharger.checked)	document.all.isEduCharger.value = 'Y';
		else	document.all.isEduCharger.value = 'N'; 
		
		if(document.all.isGuCharger.checked)	document.all.isGuCharger.value = 'Y';
		else	document.all.isGuCharger.value = 'N';
		
		if(document.all.isPlanCharger.checked)	document.all.isPlanCharger.value = 'Y';
		else	document.all.isPlanCharger.value = 'N';
		
		if(document.all.isInUser.checked)	document.all.isInUser.value = 'Y';
		else	document.all.isInUser.value = 'N';
		
		document.forms[0].rowCount.value=i;
		frm.submit();
	}

	function copyAuth()
	{
		var juminNo = document.all.juminNo.value;
		window.open('${pageContext.request.contextPath}/sysUser.act?task=user_copy&juminNo='+juminNo,'searchUser',
		  	'height=450,width=600,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=no,top=300,left=500');
	}
//-->
</script>
<html:form method="POST" action="/sysUser.act?task=insert" >
<html:hidden property="oldJuminNo"/>
<html:hidden property="task" value="${task}"/>
<!--<html:hidden property="searchKeyword" value="${searchKeyword}"/>-->
<html:hidden property="rowCount" value="${rowCount}"/>
<!--<html:hidden property="userName"/>-->
<!--<html:hidden property="juminNo"/>-->
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="16" background='/images/sub_bg.gif'></td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/system/title_01-6.gif"/>' alt="사용자 관리 - 등록 및 수정"/></td>
				</tr>
				<tr><td height="15"></td></tr>
				<tr>
					<td>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<table width="746" border="0" cellspacing="0" cellpadding="0">
										<tr height="25"> 
											<td class="t1 cbg4" width="99">성명</td>
											<td class="sBg"></td>
											<td class="t3" width="270">&nbsp;<html:text property="userName" value="${sysUserForm.userName}" style="width:95%"/></td>
											<td class="sBg"></td>
											<td class="t1 cbg4" width="99">주민등록번호</td>
											<td class="sBg"></td>
											<td class="t3">&nbsp;<html:text property="juminNo" style="width:95%"/></td>						
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr height="25"> 
											<td class="t1 cbg4" width="99">직급코드</td>
											<td class="sBg"></td>
											<td class="t3" width="270">&nbsp;<html:text property="grade" value="${sysUserForm.grade }" style="width:95%"/></td>
											<td class="sBg"></td>
											<td class="t1 cbg4" width="99">직위코드</td>
											<td class="sBg"></td>
											<td class="t3">&nbsp;<html:text property="rank" value="${sysUserForm.rank}" style="width:95%"/></td>						
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr height="25"> 
											<td class="t1 cbg4" width="99">휴대폰</td>
											<td class="sBg"></td>
											<td class="t3" width="270">&nbsp;<html:text property="cellPhone" value="${sysUserForm.cellPhone}" style="width:95%"/></td>
											<td class="sBg"></td>
											<td class="t1 cbg4" width="99"><!--사무실연락처--></td>
											<td class="sBg"></td>
											<td class="t3">&nbsp;<!--<html:text property="telPhone" value="${sysUserForm.telPhone}" style="width:95%"/>--></td>						
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr height="25"> 
											<td class="t1 cbg4" width="99">이메일</td>
											<td class="sBg"></td>
											<td class="t3" colspan="5">&nbsp;<html:text property="email" value="${sysUserForm.email}" style="width:95%"/></td>						
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr height="25"> 
										  <td class="t1 cbg4" width="99">사용자 구분</td>
											<td class="sBg"></td>
										  <td class="t3" colspan="5">&nbsp;
										  	<input type="checkbox" name="isAdmin" 			<c:if test="${sysUserForm.isAdmin == 'Y'}">checked</c:if>>관리자&nbsp;&nbsp;&nbsp;&nbsp;
										  	<input type="checkbox" name="isEduCharger" 	<c:if test="${sysUserForm.isEduCharger == 'Y'}">checked</c:if>>교육담당자&nbsp;&nbsp;&nbsp;
										  	<input type="checkbox" name="isGuCharger" 	<c:if test="${sysUserForm.isGuCharger == 'Y'}">checked</c:if>>구군 담당자&nbsp;&nbsp;&nbsp;
										  	<input type="checkbox" name="isPlanCharger" <c:if test="${sysUserForm.isPlanCharger == 'Y'}">checked</c:if>>계획담당자&nbsp;&nbsp;&nbsp;
										  	<input type="checkbox" name="isInUser" 			<c:if test="${sysUserForm.isInUser == 'Y'}">checked</c:if>>원내 사용자
										  </td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table border="0" cellspacing="0" cellpadding="0">
							<tr><td height="15"></td></tr>
						</table>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<!--테이블 헤더 시작-->
									<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr>
											<td class="t1" width="49">선택</td>
											<td class="sBg"></td>
											<td class="t1" width=132>그룹명</td>
											<td class="sBg"></td>
											<td class="t1" width="49">선택</td>
											<td class="sBg"></td>
											<td class="t1" width="132">그룹명</td>
											<td class="sBg"></td>
											<td class="t1" width="49">선택</td>
											<td class="sBg"></td>
											<td class="t1" width="132">그룹명</td>
											<td class="sBg"></td>
											<td class="t1" width="49">선택</td>
											<td class="sBg"></td>
											<td class="t1" width="132">그룹명</td>
											<td width="18"></td>
										</tr>
									</table>
									<!--테이블 헤더 끝-->
									<!--리스트 시작-->
									<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
									<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
										<c:forEach var="list" items="${rsSysGroupList}" varStatus="i">
											<!-- 열 배경 -->
											<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
											<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
											<c:if test="${i.count%4 == 1}">
											<tr class="${lineBg}">
											</c:if>
												<td class="t2" width="49">
													<input type="checkbox" name="select" id="select" <c:if test="${list.juminNo != 'N'}">checked</c:if>>
													<input type="hidden" name="isCheck" value="${list.juminNo}"  >
													<input type="hidden" name="insGroupNo" value="${list.groupNo}" >
												</td>
												<td class="sBg"></td>
												<td class="pt2left" width="132">&nbsp;<c:out value="${list.groupName}"/></td>
											<c:if test="${i.count%4 == 0}">
												<td width="1"></td>
											<tr>
												<td colspan="99" class="lbg3"></td>
											</tr>
											</c:if>
											<c:if test="${i.count%4 != 0}">		
												<td class="sBg"></td>	
											</c:if>
											<c:set var="no" scope="request" value="${i.count}"/>
										</c:forEach>
										<c:if test="${no==null}">
											<tr class="tbg3" height="21">
												<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
											</tr>
										</c:if>
									</table>
									</div>
									<!--리스트 끝-->
								</td>
							</tr>
						</table>
						<!--하단버튼 테이블 시작-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
						  <tr valign="bottom"> 
						    <!-- 
						  	<td>
						    	<img src='<html:rewrite page="/images/board/btn_del.gif"/>'	alt="삭제" style="cursor:hand">
						    	<img src='<html:rewrite page="/images/board/btn_copy.gif"/>' alt="권한복사" style="cursor:hand" onclick="copyAuth();">
						  	</td>
						  	 -->
						    <td align="right">
						    	<img src='<html:rewrite page="/images/board/btn_list.gif"/>' alt="목록" style="cursor:hand" align="absmiddle" onclick="document.location.href=document.referrer;"> 
						    	<img src='<html:rewrite page="/images/board/btn_save.gif"/>' alt="저장" style="cursor:hand" align="absmiddle" onclick="doSubmit(document.forms[0]);"> 
						    </td>
						  </tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
  </tr>
</table>
</html:form>
<script>
adminCheck();
</script>