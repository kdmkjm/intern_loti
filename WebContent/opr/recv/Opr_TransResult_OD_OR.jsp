<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>교육확정/이수명단 송신 결과 - 세부</title>
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
			                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42">
												<c:if test="${transType eq 'OD'}">
			                		<img src='<html:rewrite page="/images/operation/title_29.gif"/>' alt="교육확정명단 송신 결과 - 세부"/>
			                	</c:if>
			                	<c:if test="${transType eq 'OR'}">
			                		<img src='<html:rewrite page="/images/operation/title_30.gif"/>' alt="교육이수명단 송신 결과 - 세부"/>
			                	</c:if>
			                </td>
			              </tr>
			              <tr> 
			                <td height="10"></td>
			              </tr>
			              <tr valign="top" align="center"> 
			                <td>
												<table width="660" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
												  <tr> 
												    <td class="pt1">과정명</td>
												    <td class="pt1" width="55">교육<br>시작일</td>
												    <td class="pt1" width="55">교육<br>종료일</td>
												    <td class="pt1" width="35">교육<br>시간</td>
												    <td class="pt1" width="50" title="확정상태 - 집합:1, 사이버:2, 집합+사이버:3, 기타:4">학습<br>방법</td>
												    <td class="pt1" width="45">성명</td>
												    <td class="pt1" width="45">생년<br>월일</td>
												    <td class="pt1" width="50">기관명</td>
												    <td class="pt1" width="40" title="확정상태 - 미확정:0  확정:1">확정<br>상태</td>
												    <td class="pt1" width="40" title="이수상태 - 미이수:0  이수:1">이수<br>상태</td>
												    <td class="pt1" width="42">교육<br>점수</td>
												  </tr>
												</table>
												<!--검색된 과정 리스트 시작-->
												<div id="mainList" style="width:660px; height:201px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
												<table id="mainTable" width="643" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
												<c:set var="no" scope="request" value="1"/>
												<c:forEach var="list" items="${rsOpr_TransResultFileInfo}" varStatus="i" >
													<tr>											    
												    <td class="pt2Left" title="${list.courseCode}">&nbsp${list.courseName}</td>
												    <td class="pt2" width="55">${list.eduFrom}</td>
												    <td class="pt2" width="55">${list.eduTo}</td>
												    <td class="pt2" width="35">${list.eduHour}</td>
												    <td class="pt2" width="50" title="확정상태 - 집합:1, 사이버:2, 집합+사이버:3, 기타:4">${list.eduMethod}</td>
												    <td class="pt2" width="45">${list.stdName}</td>
												    <td class="pt2" width="45">${list.juminNo}</td>
												    <td class="pt2" width="50">${list.organName}</td>
												    <td class="pt2" width="40" title="확정상태 - 미확정:0  확정:1">${list.isSelected}</td>
												    <td class="pt2" width="40" title="이수상태 - 미이수:0  이수:1">${list.isFinished}</td>
												    <td class="pt2" width="25">${list.score}</td>
													</tr>
													<c:set value="${no+1}" var="no"/>
												</c:forEach>
												<c:if test="${no==1}"><tr class="tbg3" height="21"><td class="t2" colspan="13">조회된 데이터가 없습니다.</td></tr></c:if>
												</table>
												</div>
			                </td>
										</tr>
									</table>
									<!--하단 버튼 시작-->
								  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="28">
									  <tr valign="bottom">
									    <td align="right">
									    	<img src='<html:rewrite page="/images/board/btn_close.gif"/>' align="absmiddle" alt="닫기" onclick="self.close();" style="cursor:hand"/>
									    </td>
									    <td align="right" width="13"></td>
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
</body>
</html>
