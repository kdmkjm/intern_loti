<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>시스템 관리 - 메뉴관리</title>

<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
<!--
	function doSubmit(frm)
	{
		var do_confirm = confirm('저장하시겠습니까?');
		if(do_confirm == true)
			frm.submit();
	}
//-->
</script>
</head>
<body>
<html:form method="POST" action="/sysMenu.act?task=insert" >
<html:hidden property="oldMenuNo"/>
<html:hidden property='menuNo'/>
<html:hidden property='menuType' value="${menuType}" />
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/system/title_02.gif"/>' alt="메뉴 관리"/></td>
				</tr>
				<tr><td height="15"></td></tr>
				<tr>
					<td>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<table width="746" border="0" cellspacing="0" cellpadding="0">
											<tr>
													<td class="t1 cbg4" width="97" height="25">메뉴구분</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<c:if test="${menuType == 'M'}">프로그램</c:if>
									      	<c:if test="${menuType == 'F'}">폴더</c:if></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="97" height="25">메뉴표시명</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<html:text property='menuName' /></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">부모폴더</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<html:text property='parent' /></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">실행경로</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;
									      	<%-- <c:if test="${menuType == 'M'}"><html:text property='execPath' size="70"/></c:if>--%>
									      	<html:text property='execPath' size="70"/>
									      	</td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">실행파일</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<c:if test="${menuType == 'M'}"><html:text property='progId' /></c:if></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">Parameter</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<c:if test="${menuType == 'M'}"><html:text property='parms' /></c:if></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">프로그램명</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<c:if test="${menuType == 'M'}"><html:text property='progName' /></c:if></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">ICON경로</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<html:text property='iconPath' size="70"/></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">ICON경로 Over</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<html:text property='iconPathOn' size="70"/></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">SUB ICON경로</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<c:if test="${menuType == 'F'}"><html:text property='iconPathSub' size="70"/></c:if></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
											<tr>
									        <td class="t1 cbg4" width="107" height="25">화면표시순서</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<html:text property='dispOrder' /></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">실행구분</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<html:radio property="execType" value="T">현재창</html:radio>
									      		<html:radio property="execType" value="N">새창</html:radio>
											</td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">사용구분</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<html:radio property="use" value="Y">사용</html:radio>
										      	<html:radio property="use" value="N">미사용</html:radio>
										      	<html:radio property="use" value="T">테스트</html:radio>
						
											</td>
									    </tr>
									</table>
								</td>
							</tr>
							</table>
							<!--하단버튼 테이블 시작-->
							<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
								<tr valign="bottom"> 
									<td align="right">
										<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록" onclick="document.location.href=document.referrer;" style="cursor:hand"/>
					  				<img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="저장" onclick="doSubmit(document.forms[0]);" style="cursor:hand"/>
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
</body>
</html>