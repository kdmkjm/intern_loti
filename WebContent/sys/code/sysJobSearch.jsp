<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>직렬목록</title>

<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>

<script language="JavaScript">
<!--
window.onresize = function(){
//   윈도우 사이즈 변경 셋팅 코드
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
		alert("직렬명칭을 입력하세요.");
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
			                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/resources/title_03-6.gif"/>' alt="직렬목록"/></td>
			              </tr>
			              <tr> 
			                <td height="10"></td>
			              </tr>
			              <tr valign="top" align="center"> 
			                <td>
												<!--검색 테이블 시작-->
												<html:form method="POST" action="/cmnRankJob.act?task=popjob&flag=search">
												<table width="360" border="0" height="35" cellspacing="0" cellpadding="0">
													<tr>
														<td width="85" class="pItem">직렬명칭</td>
													  <td align="left" width="150"><html:text property="searchKeyword" style="width:150px;" onkeydown="pressEnter(document.forms[0]);" /></td>
														<td align="left">&nbsp;<img src='<html:rewrite page="/images/board/btn_s_search.gif"/>' alt="검색" onclick="doSearch(document.forms[0])" style="cursor:hand" align="absmiddle"/></td>
													</tr>
												</table>
												</html:form>
												<!--검색 테이블 끝-->
												<!--검색 헤더 시작-->
												<table width="360" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
												  <tr>
												    <td class="pt1" width="100">직렬코드</td>
												    <td class="pt1" width="150">직렬명칭</td>			
												    <td class="pt1">직렬표시명칭</td>										    
												  </tr>
												</table>
												<!--검색 헤더 끝-->    
												<!--검색 리스트 시작-->
												<div id="mainList" style="width:360px;z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
											  <table id="mainTable" width="343" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
												<c:set var="no" scope="request" value="1"/>
													<c:forEach var="list" items="${sysJobList}" varStatus="i">
														<!-- 열 배경 -->
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
															<td class="t2" colspan="3">조회된 데이터가 없습니다.</td>
														</tr>
													</c:if>
												</table>
												</div>
			                	<!--검색 리스트 끝-->
			                </td>
										</tr>
									</table>
									<!--하단 버튼 시작-->
								  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="28">
									  <tr valign="bottom">
									    <td align="right"><input type="image" src='<html:rewrite page="/images/board/btn_close.gif"/>' align="absmiddle" alt="닫기" onclick='closeWin()' style="cursor:hand"/></td>
									    <td align="right" width="10"></td>
									  </tr>
									  <tr><td colspan="2" height="2"></td></tr>
									</table>
									<!--하단 버튼 끝-->
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
