<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>

<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   윈도우 사이즈 변경 셋팅 코드
	tresize(200);
	}


//-->
</script>
<table width="780" border="0" cellspacing="0" cellpadding="0">
<tr valign="top">
	<td width="20">&nbsp;</td>
	<td width="760">
		<table width="760" border="0" cellspacing="0" cellpadding="0">
	    <tr>
			<td background='<html:rewrite page="/images/board/title_bg.gif"/>' height="48" colspan="2"><img src='<html:rewrite page="/images/resources/title_04.gif"/>' alt="교육장관리" /></td>
	    </tr>
	    <tr>
			<td height="15"></td>
	    </tr>
	    <tr>
			<td>
				<table width="760" border="0" cellspacing="0" cellpadding="0">
	       		<tr>
	         		<td height="25" class="stitle">
	         			<img src="../images/board/dot.gif" width="20" height="8" align="absmiddle">교육장 월 사용현황
	         		</td>
	       		</tr>
	     		</table>
				<!--검색 -->
				<html:form method="POST"  action='sysUser.act?task=list'>
				<table width="760" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
			  	<tr>
			       	<td width="75" class="s1">사용자명</td>
			       	<td colspan="5" class="s2">
			         	<html:text property="searchKeyword" title="사용자명"  />
			       	</td>
	    		</tr>
				</table>
				<table width="760" border="0" cellspacing="0" cellpadding="0" height="35">
				<tr>
					<td align="right"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="23" alt="검색" /></td>
				</tr>
				</table>
				<table width="760" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="tbg2"></td>
				</tr>
				</table>
				</html:form>
				<!--검색 끝-->
		
				<!--게시물 목록 시작-->
				<table width="760" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
				<caption>사용자 목록</caption>
				<tr bgcolor="#FFFFFF" height="27" align="center">
					<td class="t1" width="50">NO</td>
					<td class="t1" width="150">대체키</td>
					<td class="t1" width="200">이름</td>
					<td class="t1" width="200">사용자 구분</td>
					<td class="t1" width="160">등록일</td>
				</tr>
				</table>
				<div id="mainList"  style='width:760px;  z-index:0; overflow-y:scroll ;overflow-x:hidden'>
				<table id="mainTable" width="743" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
				<c:forEach var="userList" items="${rsSysUserList}" varStatus="i" >
			  	<tr >
					<td class="t2" width="50"><c:out value="${userList.num}"/></td>
					<td class="t2" width="150"><c:out value="${userList.juminNo}"/></td>
					<td class="t2" width="200">
						<a href='<html:rewrite page="/sysUser.act?task=modify&juminNo=${userList.juminNo} "/>'><span><c:out value="${userList.userName}"/></span></a></td>
					<td class="t2" width="200"><c:out value="${userList.isAdmin}"/></td>
					<td class="t2" width="143"><c:out value="${userList.insDate}"/></td>
				</tr>
				</c:forEach>
				</table>
				</div>
		   		<!--게시물 목록 끝-->
		
				<!--게시물 아래 버튼 시작-->
				<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
		      	<tr valign="bottom">
		          	<td align="right">
		              <img src='<html:rewrite page="/images/board/btn_up2.gif"/>' alt="신규등록"  onclick="location.href='<html:rewrite page="/sysUser.act?task=create"/>'">
		              </td>
				</tr>
				</table>
				
				<!--게시물 아래 버튼 끝-->
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>

<script type="text/javascript">
<!--
	tresize('200');

//-->
</script>
