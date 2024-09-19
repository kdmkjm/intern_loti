<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script language="JavaScript">
	function modifyPlan(courseName, courseCode, eduCount, plnStdNumber, org6430000, org5710000,org4360000, org4390000, org4400000, org4410000, org4420000, org4430000, org4440000, org4450000, org4460000, org4470000, org4480000, org5570000, org9999999)
	{
		document.all.courseCode.value = courseCode;
		document.all.plnStdNumber.value = eduCount;
		document.all.courseName.innerHTML = courseName;
		document.all.plnStd.innerHTML = eduCount;
		document.all.tot.innerHTML = plnStdNumber;
		document.all.org6430000.value = org6430000;
		document.all.org5710000.value = org5710000;
		document.all.org4360000.value = org4360000;
		document.all.org4390000.value = org4390000;
		document.all.org4400000.value = org4400000;
		document.all.org4410000.value = org4410000;
		document.all.org4420000.value = org4420000;
		document.all.org4430000.value = org4430000;
		document.all.org4440000.value = org4440000;
		document.all.org4450000.value = org4450000;
		document.all.org4460000.value = org4460000;
		document.all.org4470000.value = org4470000;
		document.all.org4480000.value = org4480000;
		document.all.org5570000.value = org5570000;
		document.all.org9999999.value = org9999999;
	}

	function modifyOrg(data, num)
	{
		var plnStdNumber = document.all.plnStdNumber.value;
		var max = Number(document.all.org6430000.value) + Number(document.all.org4360000.value) + Number(document.all.org4390000.value);
		   max += Number(document.all.org4400000.value) + Number(document.all.org4410000.value) + Number(document.all.org4420000.value);
		   max += Number(document.all.org4430000.value) + Number(document.all.org4440000.value) + Number(document.all.org4450000.value);
		   max += Number(document.all.org4460000.value) + Number(document.all.org4470000.value) + Number(document.all.org4480000.value);
		   max += Number(document.all.org5570000.value) + Number(document.all.org9999999.value) + Number(document.all.org5710000.value);

		if(Number(max) > Number(plnStdNumber))
		{
			alert("교육계획인원을 초과하는 값을 입력하셨습니다. 입력값 : " + data);
			return;
		}
		switch(num)
		{
			case 1: document.all.org6430000.value = data; break;
			case 2: document.all.org5710000.value = data; break;
			case 3: document.all.org4360000.value = data; break;
			case 4: document.all.org4390000.value = data; break;
			case 5: document.all.org4400000.value = data; break;
			case 6: document.all.org4410000.value = data; break;
			case 7: document.all.org4420000.value = data; break;
			case 8: document.all.org4430000.value = data; break;
			case 9: document.all.org4440000.value = data; break;
			case 10: document.all.org4450000.value = data; break;
			case 11: document.all.org4460000.value = data; break;
			case 12: document.all.org4470000.value = data; break;
			case 13: document.all.org4480000.value = data; break;
			case 14: document.all.org5570000.value = data; break;
			case 15: document.all.org9999999.value = data; break;
		}
		document.all.tot.innerHTML = max;
	}

	function deletePlan(plnStdNumber)
	{
		var del_confirm = confirm('삭제하시겠습니까?');
		if(del_confirm == true)
		{
			document.location.href = '${pageContext.request.contextPath}/oprOrgStd.act?task=deletePlan&plnStdNumber=' + plnStdNumber;
		}
	}

	function goPlan()
	{
		document.location.href = '${pageContext.request.contextPath}/oprOrgStd.act?task=plan';
	}

	function goStats()
	{
		document.location.href = '${pageContext.request.contextPath}/oprOrgStd.act?task=list';
	}

	function savePlan()
	{
		var plnStdNumber = document.all.plnStdNumber.value;
		var tot = document.all.tot.innerHTML;

		if(document.all.org6430000.value == "") document.all.org6430000.value = 0;
		if(document.all.org5710000.value == "") document.all.org5710000.value = 0;
		if(document.all.org4360000.value == "") document.all.org4360000.value = 0;
		if(document.all.org4390000.value == "") document.all.org4390000.value = 0;
		if(document.all.org4400000.value == "") document.all.org4400000.value = 0;
		if(document.all.org4410000.value == "") document.all.org4410000.value = 0;
		if(document.all.org4420000.value == "") document.all.org4420000.value = 0;
		if(document.all.org4430000.value == "") document.all.org4430000.value = 0;
		if(document.all.org4440000.value == "") document.all.org4440000.value = 0;
		if(document.all.org4450000.value == "") document.all.org4450000.value = 0;
		if(document.all.org4460000.value == "") document.all.org4460000.value = 0;
		if(document.all.org4470000.value == "") document.all.org4470000.value = 0;
		if(document.all.org4480000.value == "") document.all.org4480000.value = 0;
		if(document.all.org5570000.value == "") document.all.org5570000.value = 0;
		if(document.all.org9999999.value == "") document.all.org9999999.value = 0;

		if(plnStdNumber != tot)
		{
			alert("잘못 입력하셨습니다.\n\n계획인원 : " + plnStdNumber + "명 \n입력인원 : " + tot + "명");
			return;
		}

		document.forms[1].searchDate.value = document.forms[0].searchDate.value;
		document.forms[1].searchCrsType.value = document.forms[0].searchCrsType.value;
		document.forms[1].submit();
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="과정별 교육생 계획" src="/images/operation/title_26.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
          	<html:form method="POST" action="oprOrgStd.act?task=course">
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
							<tr>
							  <td width="89" class="s1">기간</td>
							  <td class="sBar"></td>
							  <td class="s2" width="250">
							    <html:text property="searchDate" style="width:75px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchDate);">
								</td>
							  <td class="sBar"></td>
							  <td width="89" class="s1">분류</td>
							  <td class="sBar"></td>
							  <td class="s2">
							  	<html:select property="searchCrsType">
			    					<html:optionsCollection name="crsTypeCode" property="beanCollection" />
									</html:select>
							  </td>
								<td width="60">
									<img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="document.forms[0].submit();" style="cursor:hand" align="absmiddle"/>
								</td>
							</tr>
						</table>
						</html:form>
						<table>
							<tr>
								<td height="15"></td>
							</tr>
						</table>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<!--테이블 헤더 시작-->
									<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr>
											<td class="t1">과정명</td>
											<td class="sBg"></td>
											<td class="t1" width="39">교육<br>기간</td>
											<td class="sBg"></td>
											<td class="t1" width="34">인원</td>
											<td class="sBg"></td>
											<td class="t1" width="34">충북</td>
											<td class="sBg"></td>
											<td class="t1" width="34">청주</td>
											<td class="sBg"></td>
											<td class="t1" width="34">충주</td>
											<td class="sBg"></td>
											<td class="t1" width="34">제천</td>
											<td class="sBg"></td>
											<td class="t1" width="34">보은</td>
											<td class="sBg"></td>
											<td class="t1" width="34">옥천</td>
											<td class="sBg"></td>
											<td class="t1" width="34">영동</td>
											<td class="sBg"></td>
											<td class="t1" width="34">증평</td>
											<td class="sBg"></td>
											<td class="t1" width="34">진천</td>
											<td class="sBg"></td>
											<td class="t1" width="34">괴산</td>
											<td class="sBg"></td>
											<td class="t1" width="34">음성</td>
											<td class="sBg"></td>
											<td class="t1" width="34">단양</td>
											<td class="sBg"></td>
											<td class="t1" width="34">기타</td>
											<td class="sBg"></td>
											<td class="t1" width="34">(구)청주</td>
											<td class="sBg"></td>
											<td class="t1" width="34">청원</td>
											<td class="sBg"></td>
											<td class="t1" width="47">비고</td>
										</tr>
									</table>
									<!--테이블 헤더 끝-->
									<!--리스트 시작-->
									<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
									<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
										<c:forEach var="list" items="${rsOpr_OrgStdCourseList}" varStatus="i" >
										<!-- 열 배경 -->
                    <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
										<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
										<tr class="${lineBg}">
											<td class="t3">&nbsp;<a href="#" onclick="modifyPlan('${list.courseName}',${list.courseCode},${list.eduCount},${list.plnStdNumber},${list.org6430000},${list.org5710000},${list.org4360000},${list.org4390000},${list.org4400000},${list.org4410000},${list.org4420000},${list.org4430000},${list.org4440000},${list.org4450000},${list.org4460000},${list.org4470000},${list.org4480000},${list.org5570000},${list.org9999999});"><u>${list.courseName}</u></a></td>
											<td class="sBg"></td>
											<td class="t2" width="39">${list.eduDate}</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.eduCount}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org6430000}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org5710000}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org4390000}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org4400000}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org4420000}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org4430000}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org4440000}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org5570000}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org4450000}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org4460000}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org4470000}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org4480000}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org9999999}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org4360000}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t4" width="34">${list.org4410000}&nbsp;</td>
											<td class="sBg"></td>
											<td class="t2" width="30"></td>
										</tr>
										<tr>
											<td colspan="99" class="lbg3"></td>
										</tr>
										<c:set var="no" scope="request" value="${i.count}"/>
										</c:forEach>
										<c:if test="${no eq null}">
											<tr class="tbg3" height="21">
												<td class="t2">조회된 데이터가 없습니다.</td>
											</tr>
											<tr>
												<td colspan="99" class="lbg3"></td>
											</tr>
										</c:if>
									</table>
									</div>
									<!--리스트 끝-->
									<c:if test="${no ne null}">
										<!--리스트 계 시작-->
										<html:form method="POST" action="oprOrgStd.act?task=saveCourse">
										<input type="hidden" name="searchDate"/>
										<input type="hidden" name="searchCrsType"/>
										<html:hidden property="courseCode"/>
										<html:hidden property="plnStdNumber"/>
										<table width="746" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="t2BgRed" id="courseName">&nbsp;</td>
												<td class="t2BgRed" width="29" id="plnStd"></td>
												<td class="t2BgRed" width="10">/</td>
												<td class="t2BgRed" width="29" id="tot"></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org6430000" style="width:25px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 1)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org5710000" style="width:25px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 2)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org4390000" style="width:25px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 4)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org4400000" style="width:25px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 5)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org4420000" style="width:25px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 7)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org4430000" style="width:25px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 8)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org4440000" style="width:25px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 9)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org5570000" style="width:25px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 14)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org4450000" style="width:25px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 10)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org4460000" style="width:25px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 11)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org4470000" style="width:25px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 12)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org4480000" style="width:25px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 13)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org9999999" style="width:25px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 15)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org4360000" style="width:25px; direction:rtl; IME-MODE:disabled; background-color:#aaa;" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 3)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="34"><html:text property="org4410000" style="width:25px; direction:rtl; IME-MODE:disabled; background-color:#aaa;" maxlength="3" onkeydown="key_num()" onkeyup="modifyOrg(this.value, 6)"/></td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="47"><img src='<html:rewrite page="/images/board/btn_save3.gif"/>' alt="저장" align="absmiddle" onclick="savePlan()" style="cursor:hand"/></td>
											</tr>
										</table>
										</html:form>
										<!--리스트 계 끝-->
									</c:if>
								</td>
							</tr>
						</table>
						<!--하단버튼 테이블 시작-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
							<tr valign="bottom">
								<td align="right">
									<img src='<html:rewrite page="/images/board/btn_std_stats.gif"/>' alt="교육생 신청자 현황" align="absmiddle" onclick="goStats();" style="cursor:hand"/>
									<img src='<html:rewrite page="/images/board/btn_plan_std.gif"/>' alt="교육생 기준치 입력" align="absmiddle" onclick="goPlan();" style="cursor:hand"/>
								</td>
							</tr>
						</table>
		    		<!--하단버튼 테이블 끝-->
          </td>
  </tr>
</table>
<script type="text/javascript">
<!--
	tresize(235);
//-->
</script>
