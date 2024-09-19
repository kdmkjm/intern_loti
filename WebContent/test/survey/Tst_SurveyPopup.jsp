
<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>설문지 연결</title>

<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script language="JavaScript">
<!--
	//////////////////////////////////////////////////////////////////////////////////////////
 	/////////////        호출 시   getType=onlyCrs 호출 할 경우 과정명, 과정코드만 가져옴  ///////////////
 	//////////////////////////////////////////////////////////////////////////////////////////
	window.onresize = function(){
	//   윈도우 사이즈 변경 셋팅 코드
		tresize_pop(398, 200);
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
	
	function selectSurvey1(surveyno, coursecode)
	{
		document.location.href = '<html:rewrite page="/tstSurvey.act?task=match&surveyno='+surveyno+'&coursecode='+coursecode+'"/>'
	}

//-->
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
			                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/poll/title_02-5.gif"/>' alt="설문지 목록" /></td>
			              </tr>
			              <tr> 
			                <td height="10"></td>
			              </tr>
			              <tr valign="top" align="center"> 
			                <td>
											<!--과정검색 테이블 시작-->
											<html:form method="POST" action="tstSurvey.act?task=popup">
											<table width="360" border="0" height="35" cellspacing="0" cellpadding="0">
											  <input type="hidden" name="coursecode" value="${coursecode }">
											  <tr> 
											    <td width="35" class="pItem">연도</td>
											    <td width="55"> 
		                 				<html:select property="searchdate">
		    											<html:optionsCollection name="applyYear" property="beanCollection" />
		    										</html:select>
													</td>
													<td width="53" class="pItem">제목</td>
													<td width="110"><input type="text" name="searchKeyword" style="width:92%;" value="${searchKeyword}"></td>
											    <td width="34"><input type="image" src='<html:rewrite page="/images/board/btn_s_search.gif"/>' alt="검색" /></td>
											  </tr>
											</table>
											</html:form>
											<!--과정검색 테이블 끝-->
									    <!--검색된 과정 헤더 시작-->
											<table width="360" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
											  <tr> 
											    <td class="pt1" width="80">기간</td>
											    <td class="pt1">설문명</td>
											    <td class="pt1" width="60">진행중</td>
											    <td class="pt1" width="17"></td>
											  </tr>
											</table>
											<!--검색된 과정 헤더 시작-->
											<!--검색된 과정 리스트 시작-->
											<div id="mainList" style="width:360px; height:201px; z-index:1; overflow-y:scroll ;overflow-x:hidden"> 
										  <table id="mainTable" width="343" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
												<c:forEach var="surveyList" items="${rsTst_SurveyPopup}" varStatus="i" >
													<fmt:parseDate var="fromdate" value="${surveyList.fromdate}" pattern="yyyymmdd"></fmt:parseDate>
		                  		<fmt:parseDate var="todate" value="${surveyList.todate}" pattern="yyyymmdd"></fmt:parseDate>
													<!-- 열 배경 -->
													<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
													<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
													<tr class="${lineBg}">
														<td class="pt2" width="80">
															<c:if test="${fromdate != null}">
																<fmt:formatDate value="${fromdate}" pattern="mm.dd"/> ~ <fmt:formatDate value="${todate}" pattern="mm.dd"/>
															</c:if>
															<c:if test="${fromdate == null}">
																상시
															</c:if>															
														</td>
														<td class="pt2Left">
															<a href="#" onclick="selectSurvey1('${surveyList.surveyno}','${coursecode }');"><u><c:out value="${surveyList.title}"/></u></a>
														</td>
		                        <c:if test="${surveyList.statflag eq '1'}">
		                        	<td class="pt2" width="60"><span class="lend1">진행중</span></td>												
														</c:if>
		                        <c:if test="${surveyList.statflag ne '1'}">
		                        	<td class="pt2" width="60">진행완료</td>												
														</c:if>												
													</tr>
													<c:set var="no" scope="request" value="${i.count }"/>
												</c:forEach>
												<input type="hidden" name="max" value="${no - 1}"/>
												<c:if test="${no==null}">
													<tr class="tbg3" height="21">
														<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
													</tr>
												</c:if>												
										  </table>
											</div>
			                </td>
										</tr>
									</table>
									<table width="100%" border="0" cellspacing="0" cellpadding="0" height="28" valign="bottom">
									  <tr valign="bottom">
									    <td align="right"><input type="image" src='<html:rewrite page="/images/board/btn_close.gif"/>' align="absmiddle" alt="닫기" onclick='closeWin()' style="cursor:hand"/></td>
									    <td align="right" width="10"></td>
									  </tr>
									  <tr><td colspan="2" height="2"></td></tr>
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
//-->
</script>
</body>
</html>
