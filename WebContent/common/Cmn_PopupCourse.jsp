<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>과정연결</title>
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
<!--
function closeWin() 
{ 
	self.close();
}
// 팝업창 호출 화면에서 년도, 과정명, 과정코드, 담당자 값이 필요한 경우
function selectCourse(num, year, csName, csCode, crsUser)
{
	var rowNumber = Number(num);
	if(rowNumber == 0)
	{
  	opener.document.all.courseYear.value	= year;
  	opener.document.all.courseName.value	= csName;
  	opener.document.all.courseCode.value	= csCode;
  	opener.document.all.crsUser.value 		= crsUser;
  } 
  else
  {
  	opener.document.all.courseYear[rowNumber].value = year;
  	opener.document.all.courseName[rowNumber].value = csName;
  	opener.document.all.courseCode[rowNumber].value = csCode;
  	opener.document.all.crsUser[rowNumber].value 		= crsUser;
  }
  self.close();
}
// 팝업창 호출 화면에서 과정명, 과정코드 값이 필요한 경우
function selectOnlyCourse(csName, csCode)
{
 	opener.document.all.searchCourseName.value	= csName;
 	opener.document.all.searchCourseCode.value	= csCode;	  
  self.close();
}
//-->
</script>
</head>
<body>
<table width="500" border="0" cellspacing="5" cellpadding="0" height="360" bgcolor="#E7E7E7">
  <tr> 
    <td valign="top"> 
      <table width="490" border="0" cellspacing="1" cellpadding="0" height="290" bgcolor="#D1D1D1">
        <tr> 
          <td bgcolor="#FFFFFF" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/resources/title_02-4.gif"/>' width="100" height="42" alt="과정연결" /></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr height="250" valign="top" align="center"> 
                <td>
									<!--과정검색 테이블 시작-->
									<html:form method="POST" action="cmnCourse.act?task=list&rowNumber=${rowNumber}">
									<html:hidden property="getType"/>
									<table width="460" border="0" height="35" cellspacing="0" cellpadding="0">
									  <tr> 
									    <td width="35" class="pItem">연도</td>
									    <td width="70"><html:select property="searchDateKeyword" value="${thisYear}"><html:optionsCollection name="applyYearCode" property="beanCollection" /></html:select></td>
									    <td width="50" class="pItem">담당자</td>
									    <td width="85"><html:select property="searchCharger"><html:optionsCollection name="crsUserCode" property="beanCollection" /></html:select></td>
											<td width="53" class="pItem">과정명</td>
											<td><html:text property="searchKeyword" style="width:92%;"/></td>
									    <td width="34"><input type="image" src='<html:rewrite page="/images/board/btn_s_search.gif"/>' alt="검색" /></td>
									  </tr>
									</table>
									</html:form>
									<!--과정검색 테이블 끝-->
							    <!--검색된 과정 헤더 시작-->
									<table width="460" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
									  <tr> 
									    <td class="pt1" width="60">연월</td>
									    <td class="pt1" width="320">과정명</td>
									    <td class="pt1" width="63">담당자</td>
									    <td class="pt1" width="17"></td>
									  </tr>
									</table>
<!--검색된 과정 리스트 시작-->
<div id="mainList" style="width:460px; height:201px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
<table id="mainTable" width="443" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
<c:set var="no" scope="request" value="1"/>
<c:forEach var="list" items="${rsCmn_PopupCourseList}" varStatus="i" >
	<tr>
		<td class="pt2" width="60"><c:out value="${list.courseYear}"/></td>
		<td class="pt2Left" width="320">&nbsp;<c:if test="${getType != 'onlyCrs'}"><a href="#" onclick="selectCourse(${rowNumber},${list.year},'${list.courseName}','${list.courseCode}','${list.charger}');"><u><c:out value="${list.courseName}"/></u></a></c:if><c:if test="${getType == 'onlyCrs'}"><a href="#" onclick="selectOnlyCourse('${list.courseName}','${list.courseCode}');"><u><c:out value="${list.courseName}"/></u></a></c:if></td>
		<td class="pt2" width="63"><c:out value="${list.crsUser}"/></td>
	</tr>
	<c:set value="${no+1}" var="no"/>
</c:forEach>
<input type="hidden" name="max" value="${no-1}"/>
<c:if test="${no==1}"><tr class="tbg3" height="21"><td class="t2" colspan="13">조회된 데이터가 없습니다.</td></tr></c:if>
</table>
</div>
									<table width="443" cellspacing="0" cellpadding="0" height="35" valign="bottom">
									  <tr> 
									    <td align="right">
									      <img src='<html:rewrite page="/images/board/btn_close.gif"/>' align="absmiddle" alt="닫기" style="cursor:hand" onclick="closeWin();"/>
											</td>
									  </tr>
									</table>
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
	document.all.searchKeyword.focus();
	document.all.searchKeyword.value=document.all.searchKeyword.value;
//-->
</script>
</body>
</html>
