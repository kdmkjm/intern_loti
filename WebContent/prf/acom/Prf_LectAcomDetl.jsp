<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   윈도우 사이즈 변경 셋팅 코드
		tresize(320);
	}
	function goList()
	{
		document.forms[0].submit();
	}
	function ozReport(data,data1)
	{
		var year = data;
		var issueSeq = data1;
		
		window.open('<html:rewrite page="/ozMenu.act"/>?report=lec&year='+ year +'&issueSeq=' + issueSeq,'popup', 'scrollbars = no,resizable=yes, menubar = no, width = 710 height =550, status = yes');
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/teacher/title_04-2.gif"/>' alt="강의실적확인-상세"/></td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<html:form method="POST" action="prfLectAcom.act?task=list">
						<html:hidden property="searchKeyword" value="${searchKeyword}"/>
						<html:hidden property="searchKeywordYear" value="${searchKeywordYear}"/>
						<table>
							<tr>
			        	<td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />인적사항</td>
							</tr>
						</table>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<!--인적사항 시작-->
									<table width="746" border="0" cellspacing="0" cellpadding="0">
										<tr> 
										  <td class="t1 cbg4" width="99">발행번호</td>
											<td class="sBg"></td>
										  <td class="t3" width="272">&nbsp;<c:out value="제 ${rsPrf_LectAcom.year}-${rsPrf_LectAcom.issueSeq}호"/></td>
											<td class="sBg"></td>
										  <td class="t1 cbg4" width="99">발행일자</td>
											<td class="sBg"></td>
										  <td class="t3">&nbsp;<c:out value="${rsPrf_LectAcom.issueDate}"/></td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr> 
										  <td class="t1 cbg4" width="99">소속</td>
											<td class="sBg"></td>
										  <td class="t3" width="272">&nbsp;<c:out value="${rsPrf_LectAcom.asSign}"/></td>
											<td class="sBg"></td>
										  <td class="t1 cbg4" width="99">직위</td>
											<td class="sBg"></td>
										  <td class="t3">&nbsp;<c:out value="${rsPrf_LectAcom.position}"/></td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr> 
										  <td class="t1 cbg4" width="99">성명</td>
											<td class="sBg"></td>
										  <td class="t3" width="272">&nbsp;<c:out value="${rsPrf_LectAcom.profName}"/></td>
											<td class="sBg"></td>
										  <td class="t1 cbg4" width="99">생년월일</td>
											<td class="sBg"></td>
										  <td class="t3">&nbsp;<c:out value="${rsPrf_LectAcom.profBirth}"/></td>
										</tr>
									</table>
									<!--인적사항 끝-->
								</td>
							</tr>
						</table>	
						<table>
							<tr>
			        	<td height="15"></td>
							</tr>
							<tr>
			        	<td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />강의내역</td>
							</tr>
						</table>					
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<!--테이블 헤더 시작-->
									<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr>
											<td class="t1" width="49">연도</td>
											<td class="sBg"></td>
											<td class="t1">과정명</td>
											<td class="sBg"></td>
											<td class="t1" width="79">교육일</td>
											<td class="sBg"></td>
											<td class="t1" width="89">교육시간</td>
											<td class="sBg"></td>
											<td class="t1" width="199">주제</td>
											<td class="sBg"></td>
											<td class="t1" width="90">강의시간</td>
											<td width="17"></td>
										</tr>
									</table>
									<!--테이블 헤더 끝-->
									<!--리스트 시작-->
									<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
										<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
											<c:set var="total" scope="request" value="0"/>
											<c:forEach var="list" items="${rsPrf_LectAcomDetlList}" varStatus="i" >
												<!-- 열 배경 -->
												<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
												<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
												<tr class="${lineBg}">
													<td class="t2" width="49"><c:out value="${list.lectYear}"/></td>
													<td class="sBg"></td>
													<td class="t3">&nbsp;<c:out value="${list.courseName}"/></td>
													<td class="sBg"></td>
													<td class="t2" width="79"><c:out value="${list.lectDate}"/></td>
													<td class="sBg"></td>
													<td class="t2" width="89"><c:out value="${list.lectTime}"/></td>
													<td class="sBg"></td>
													<td class="t3" width="199">&nbsp;<c:out value="${list.subjName}"/></td>
													<td class="sBg"></td>
													<td class="t2" width="90"><c:out value="${list.lectHour}"/> 시간</td>
												<tr>
													<td colspan="13" class="lbg3"></td>
												</tr>
												<c:set var="total" scope="request" value="${total + list.lectHour}"/>
											</c:forEach>
										</table>
									</div>
									<!--리스트 끝-->
									<!--리스트 계 시작-->
									<c:if test="${total != 0}">
										<table width="746" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="t2BgRed">계 </td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="90"><c:out value="${total}"/> 시간 </td>
												<td class="t2BgRed" width="17"></td>
											</tr>
										</table>
									</c:if>
									<!--리스트 계 끝-->
								</td>
							</tr>
						</table>
						<!--하단버튼 테이블 시작-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
							<tr valign="bottom">
								<td>
									<img src='<html:rewrite page="/images/board/btn_print.gif"/>' align="absmiddle" alt="인쇄" style="cursor:hand" onclick="ozReport(${rsPrf_LectAcom.year},${rsPrf_LectAcom.issueSeq});"/>
								</td> 
								<td align="right">
                  <img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록" onclick="goList();" style="cursor:hand"/>
								</td>
							</tr>
						</table>
		    		<!--하단버튼 테이블 끝-->
		    		</html:form>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
<!--
	tresize(320);
//-->
</script>