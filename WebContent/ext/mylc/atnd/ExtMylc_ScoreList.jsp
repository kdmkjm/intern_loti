<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script language="JavaScript">
	$.noConflict();
	jQuery(function(){
		
		jQuery('#centerBlank').height(jQuery(window).height() - jQuery('#mainTable').height() - 80);
	});
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/course/title_02.gif"/>' alt="수강내역조회"/></td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<!--검색 -->
						
						<!--검색 끝-->
						
						<table id="mainTable" width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
							<tr>
								<td>
									<!--테이블 헤더 시작-->
									<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr>
											<td class="t1" width="34">번호</td>
											<td class="sBg"></td>
											<td class="t1">과목명</td>
											<td class="sBg"></td>
											<td class="t1" width="90">취득점수</td>
											<td class="sBg"></td>
											<td class="t1" width="90">기타점수</td>
											<td class="sBg"></td>
											<td class="t1" width="90">과목총점</td>
											<td width="17"></td>
										</tr>
									</table>
									<!--리스트 시작-->
									<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
										<table width="729" border="0" cellspacing="0" cellpadding="0">
											<c:set var="no" scope="request" value="1"/>
											<c:forEach var="list" items="${rsExtMylc_LectureListScoreList}" varStatus="i" >
												<!-- 열 배경 -->
												<c:if test="${!i.last}">
												<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
												<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
												<tr class="${lineBg}">
													<td class="t2" width="34"><c:out value="${no}"/></td>
													<td class="sBg"></td>
													<td class="t3">&nbsp;
														${list.sbnam }
													</td>
													<td class="sBg"></td>
													<td class="t2" width="90">
														<c:choose>
															<c:when test="${list.esetp eq '5110'}">${list.ekotp + list.ekstp}</c:when>
															<c:when test="${list.esetp eq '5120'}">${list.ekevp}</c:when>
															<c:when test="${list.esetp eq '5130'}">${list.ekevp}</c:when>
														</c:choose>
													</td>
													<td class="sBg"></td>
													<td class="t2" width="90">${list.ekrtp + list.ekhwp }</td>
													<td class="sBg"></td>
													<td class="t2" width="90">${list.ektop }</td>
												</tr>
												<tr>
													<td colspan="17" class="lbg3"></td>
												</tr>
												</c:if>
												<c:if test="${i.last && i.count>1}">
												<tr>
													<td colspan="99"><div id="centerBlank"></div></td>
												</tr>
												<tr>
													<td colspan="17" class="lbg3"></td>
												</tr>
												<tr>
													<td class="cbg t1" colspan="3">총  점</td>
													<td class="sBg"></td>
													<td class="t2" colspan="5">${list.ektop }</td>
												</tr>
												</c:if>
												<c:set var="no" scope="request" value="${no + 1}"/>
											</c:forEach>
											<c:if test="${no==2}">
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
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>