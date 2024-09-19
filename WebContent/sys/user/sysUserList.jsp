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
			alert("사용자명을 입력하세요");
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
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="사용자 관리" src="/images/system/title_01.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--검색 -->
	<html:form method="POST" action="/sysUser.act?task=list" >
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr valign="middle">
		<td width="75" class="s1">사용자명</td>
		<td class="s2">
		  <html:text property="searchKeyword" style="width:150px"/>
		</td>
        <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSubmit();" style="cursor:hand"/></td>
	  </tr>
	  </table>
	</html:form>
	<!--검색 끝-->
	<table>
	<tr>
	  <td height="15"></td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--테이블 헤더 시작-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" width="49">번호</td>
		  <td class="sBg"></td>
		  <td class="t1" width="79">이름</td>
		  <td class="sBg"></td>
		  <td class="t1">소속</td>
		  <td class="sBg"></td>
		  <td class="t1" width="129">직급</td>
		  <td class="sBg"></td>
		  <td class="t1" width="179">메뉴 권한</td>
		  <td class="sBg"></td>
		  <td class="t1" width="100">등록일</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--테이블 헤더 끝-->
		<!--리스트 시작-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsSysUserList}" varStatus="i" >
			<!-- 열 배경 -->
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
	  <td align="right">
		<img src='<html:rewrite page="/images/board/btn_up2.gif"/>' alt="신규등록"  onclick="location.href='<html:rewrite page="/sysUser.act?task=create"/>'" style="cursor:hand"> 
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