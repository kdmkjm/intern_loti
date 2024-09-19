<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script language="JavaScript">
	window.onresize = function(){
		//   윈도우 사이즈 변경 셋팅 코드
		tresize(115);
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">현재경로정보</h2>
				<h1>
					<img alt="강사료 지급 기준" src="/images/teacher/title_03-3.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #50a1f0">
				<tr>
					<td>
						<!--테이블 헤더 시작-->
						<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
							<tr>
								<td class="t1" width="119">구분</td>
								<td class="sBg"></td>
								<td class="t1">세부지급대상</td>
								<td class="sBg"></td>
								<td class="t1" width="49">
									기준<br>시간
								</td>
								<td class="sBg"></td>
								<td class="t1" width="69">기본</td>
								<td class="sBg"></td>
								<td class="t1" width="69">초과</td>
								<td class="sBg"></td>
								<td class="t1" width="50">수정</td>
								<td width="17"></td>
							</tr>
						</table>
						<!--테이블 헤더 끝-->
						<!--리스트 시작-->
						<div id="mainList" style="width: 746px; z-index: 0; overflow-y: scroll; overflow-x: hidden">
							<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
								<c:set var="no" scope="request" value="0" />
								<c:forEach var="list" items="${rsPrf_PayStandardList}" varStatus="i">
									<!-- 열 배경 -->
									<c:if test="${no%2 == 0}">
										<c:set var="lineBg" scope="request" value="tbg3" />
									</c:if>
									<c:if test="${no%2 == 1}">
										<c:set var="lineBg" scope="request" value="" />
									</c:if>
									<tr class="${lineBg}">
										<td class="t2" width="119">
											<c:out value="${list.levelName}" />
										</td>
										<td class="sBg"></td>
										<td class="t3" style="padding: 5px 5px 5px 5px;">
											<bean:write name="list" property="payTarget" filter="false" />
										</td>
										<td class="sBg"></td>
										<td class="t2" width="49">
											<c:out value="${list.stdHour}" />
										</td>
										<td class="sBg"></td>
										<td class="t4" width="69">
											<fmt:formatNumber value="${list.basePay}" pattern="#,##0" />
											&nbsp;
										</td>
										<td class="sBg"></td>
										<td class="t4" width="69">
											<fmt:formatNumber value="${list.exceedPay}" pattern="#,##0" />
											&nbsp;
										</td>
										<td class="sBg"></td>
										<td class="t2" width="50">
											<img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle" alt="수정"
												onclick='location.href="<html:rewrite page="/prfPayStandard.act?task=modify&profLevel=${list.profLevel}"/>"' style="cursor: hand" />
										</td>
									</tr>
									<tr>
										<td colspan="11" class="lbg3"></td>
									</tr>
									<c:set var="no" scope="request" value="${no + 1}" />
								</c:forEach>
							</table>
						</div>
						<!--리스트 끝-->
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
<!--
	tresize(115);
//-->
</script>