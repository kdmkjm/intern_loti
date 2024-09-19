<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>강사 검색</title>
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
<!--
	function closeWin() 
	{ 
		self.close();
	}
	
	function selectProf(profCode, profName, asSign)
	{
  	opener.document.all.searchCode.value	= profCode;
  	opener.document.all.searchKeyword.value	= profName;
  	opener.document.all.searchKeywordPosition.value	= asSign;
  		  
	  closeWin();
	}
//-->
</script>
<body>
<table width="400" border="0" cellspacing="5" cellpadding="0" height="360" bgcolor="#E7E7E7">
  <tr> 
    <td valign="top"> 
      <table width="390" border="0" cellspacing="1" cellpadding="0" height="290" bgcolor="#D1D1D1">
        <tr> 
          <td bgcolor="#FFFFFF" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/teacher/title_04-4.gif"/>' alt="강사 검색" /></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr height="250" valign="top" align="center"> 
                <td>
									<!--강사검색 테이블 시작-->
									<html:form method="POST" action="prfLectAcom.act?task=getPrf&flag=true">
									<table width="370" border="0" height="35" cellspacing="0" cellpadding="0">
									  <tr> 
											<td width="90" class="pItem">이름/소속</td>
											<td><html:text property="searchKeyword" style="width:92%;" value="${searchKeyword}"/></td>
									    <td width="50"><input type="image" src='<html:rewrite page="/images/board/btn_s_search.gif"/>' alt="검색" /></td>
									  </tr>
									</table>
									</html:form>
									<!--강사검색 테이블 끝-->
							    <!--검색된 강사 헤더 시작-->
									<table width="370" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
									  <tr> 
									    <td class="pt1" width="70">이름</td>
									    <td class="pt1">소속</td>
									    <td class="pt1" width="80">직위</td>
									    <td class="pt1" width="17"></td>
									  </tr>
									</table>
									<!--검색된 강사 헤더 시작-->
									<!--검색된 강사 리스트 시작-->
									<div id="mainList" style="width:370px; height:201px; z-index:1; overflow-y:scroll ;overflow-x:hidden"> 
									  <table id="mainTable" width="353" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
										<c:forEach var="list" items="${rsPrf_LectPrfList}" varStatus="i" >
											<!-- 열 배경 -->
											<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
											<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
											<tr class="${lineBg}">
												<td class="pt2" width="70">&nbsp;<a href="#" onclick="selectProf('${list.profNo}','${list.profName}','${list.asSign}');"><u><c:out value="${list.profName}"/></u></a></td>
												<td class="pt2Left">&nbsp;<c:out value="${list.asSign}"/></td>
												<td class="pt2Left" width="80">&nbsp;<c:out value="${list.position}"/></td>
											</tr>
											<c:set value="${i.count}" var="count"/>
										</c:forEach>
										<input type="hidden" name="max" value="${count}"/>
										<c:if test="${count==null}">
											<tr class="tbg3" height="21">
												<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
											</tr>
										</c:if>
									  </table>
									</div>
									<!--검색된 강사 리스트 끝-->
                </td>
              </tr>
              <tr>
              	<td>
              		<!--하단 버튼 시작-->
									<table width="100%" border="0" cellspacing="0" cellpadding="0" height="28" valign="bottom">
									  <tr> 
									    <td align="right">
									      <img src='<html:rewrite page="/images/board/btn_close.gif"/>' align="absmiddle" alt="닫기" style="cursor:hand" onclick="closeWin();"/>
									    </td>
									  </tr>
									</table>
									<!--하단 버튼  끝-->
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
//-->
</script>
</body>
</html>