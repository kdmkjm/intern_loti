<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script language="JavaScript">
<!--
	function numberFormat(num) {
		var pattern = /(-?[0-9]+)([0-9]{3})/;
		while(pattern.test(num)) {
		num = num.replace(pattern,"$1,$2");
		}
		return num;
	}

	window.onresize = function(){
		//   윈도우 사이즈 변경 셋팅 코드
		tresize(198);
	}
	
	function checkAll()
	{
		var max = Number(document.all.max.value);
		if(max == 0)
		{
			alert("조회된 데이터가 없습니다.");
			return;
		}
		
		if(max == 1)
		{
			if(document.all.checkbox.checked == false)
				document.all.checkbox.checked = true;
			else
				document.all.checkbox.checked = false;
		}
		else
		{
			if(document.all.checkbox[0].checked == false)
				for(var i=0; i<max; i++)
					document.all.checkbox[i].checked = true;
			else
				for(var i=0; i<max; i++)
					document.all.checkbox[i].checked = false;
		}
	}
	
	
 	function doSearch(frm)
 	{
 		
 		if(document.all.searchFrom.value == "")
 		{
 			alert("교육기간 시작일을 입력해주세요.");
 			return;
 		}
 		
 		if(document.all.searchTo.value == "")
 		{
 			alert("교육기간 종료일을 입력해주세요.");
 			return;
 		}
			
 		frm.submit();
 	}
	
	function doSubmit(frm)
	{
		document.all.fromDate.value = document.all.searchFrom.value;
		document.all.toDate.value = document.all.searchTo.value;
		document.all.type.value = document.all.searchType.value;
		
		var max = document.forms[1].max.value;
		var flag = false;
	
		var do_confirm = confirm('저장 하시겠습니까?');
		if(do_confirm != true)
		{
			return;
		}
		
		if(max == 1)
		{
			if(document.forms[1].checkbox.checked == true)
			{
				document.forms[1].arraySelect.value = "Y";
				flag = true;
			}
			else
				document.forms[1].arraySelect.value = "N";
		}
		else
		{
			for(var i=0; i<max; i++)
			{
				if(document.forms[1].checkbox[i].checked == true)
				{
					document.forms[1].arraySelect[i].value = "Y";
					flag = true;
				}
				else
					document.forms[1].arraySelect[i].value = "N";
			}
		}
		if(flag == true)
		{
			frm.submit();
		}
		else
		{
			alert("선택된 데이터가 없습니다.");
		}
	}
		
	function openDetailTravel(daypay,foodpay,staypay,trafficpay) {
		var divTop = event.x - 390; //상단 좌표
    	var divLeft = event.y + 390; //좌측 좌표
    	
    	document.getElementById("divDetailTravel").style.top= divTop;
    	document.getElementById("divDetailTravel").style.left= divLeft;
    	document.getElementById("divDetailTravel").style.position= "absolute";
    	document.getElementById("divDetailTravel").style.display= "block";
    	
    	
    	var text = "";
    	text += "일비 : " + numberFormat(daypay) + "<br /><br />";
    	text += "식비 : " + numberFormat(foodpay) + "<br /><br />";
    	text += "교통비 : " + numberFormat(trafficpay) + "<br /><br />";
    	text += "숙박비 : " + numberFormat(staypay) + "<br /><br />";
    	document.getElementById("divDetailTravelText").innerHTML = text;
	}

	function excelDownload(){
		var frm = document.forms[0];
		var url = "prfWeekPay.act?task=excelDownload";		
		var pars = Form.serialize(frm);
		
		new Ajax.Updater('',url,{method: 'post', parameters: pars});
	}
	
	function doExcel1() {
		if(document.all.searchFrom.value == "" || document.all.searchTo.value == ""){
			alert("교육기간을 선택해주십시오.");			
			return;
		}
		
		var searchFrom =  document.all.searchFrom.value;
		var searchTo   =  document.all.searchTo.value;
		
		document.getElementById("actionFrame").src = '<html:rewrite page="/prfWeekPay.act?task=excelDownload1&searchFrom='+searchFrom+'&searchTo='+searchTo+'"/>';
	}
	
	function doExcel2() {
		if(document.all.searchFrom.value == "" || document.all.searchTo.value == ""){
			alert("교육기간을 선택해주십시오.");
			return;
		}
		
		var searchFrom =  document.all.searchFrom.value;
		var searchTo   =  document.all.searchTo.value;
		
		document.getElementById("actionFrame").src = '<html:rewrite page="/prfWeekPay.act?task=excelDownload2&searchFrom='+searchFrom+'&searchTo='+searchTo+'"/>';
	}
	
	function ozReport()
	{
		if(document.all.size.value == 0){
			alert("검색결과가 없습니다.");
			return;
		}
		
		var totalSumtax = document.all.totalSumtax.value;
		var convertTotalSumtax = document.all.convertTotalSumtax.value;
		var title  = document.all.title.value;
		var title2 = document.all.title2.value;
		var title3 = document.all.title3.value;
		var year   = document.all.year.value;
		
		var url = '<html:rewrite page="/ozMenu.act"/>?report=prf_tax&totalSumtax=' + totalSumtax + '&convertTotalSumtax=' + convertTotalSumtax + '&title=' + title+ '&title2=' + title2+ '&title3=' + title3 + '&year=' + year; 
			
		window.open(url , 'prf_tax', 'scrollbars=no, resizable=yes, menubar=no, width=710, height=550, status=yes');
	}
//-->		
</script>

<style type="text/css">

#divDetailTravel {
 position:absolute;
 display:none;
 background-color:#ffffff;
 border:solid 2px #d0d0d0;
 width:100px;
 height:120px;
 padding:25px;
}
</style>

<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">현재경로정보</h2>
				<h1>
					<img alt="강사 수당" src="/images/teacher/title_02-2.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<!--검색 -->
			<html:form method="post" action="/prfWeekPay.act?task=list">
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 1px solid #D6D6D6">
					<tr valign="middle">
						<td width="86" class="s1">교육기간</td>
            			<td class="sBar"></td>
						<td class="s2" width="420">
							<html:text property="searchFrom" style="width:100px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchFrom, 'yyyy-mm-dd');">
              				~<html:text property="searchTo" style="width:100px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchTo, 'yyyy-mm-dd');">
						</td>
						<td width="74" class="s1">구분</td>
            			<td class="sBar"></td>
						<td class="s2" width="420">
							<html:select property="searchType">
								<html:option value="0">기타</html:option>
								<html:option value="1">장기교육</html:option>
							</html:select>
						</td>
						<td width="60" align="center">
							<img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch(document.forms[0]);" style="cursor: hand" align="absbottom" />
						</td>
					</tr>
				</table>
			</html:form>
			<!--검색 끝-->
			<table>
				<tr>
					<td height="15"></td>
				</tr>
			</table>
			<html:form method="POST" action="/prfWeekPay.act?task=insert">
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #50a1f0">
					<tr>
						<td>
							<!--테이블 헤더 시작-->
							<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
								<tr>
									<td class="t1" rowspan="3" width="39">
										<a href="#" onclick="checkAll();">
											<u>선택</u>
										</a>
									</td>
									<td class="sBg"></td>
									<td class="t1" rowspan="3" width="188">과정명</td>
									<td class="sBg"></td>
									<!-- <td class="t1" rowspan="3" width="84">강사구분</td>
									<td class="sBg"></td> -->
									<td class="t1" rowspan="3">성명</td>
									<td class="sBg"></td>
									<td class="t1" colspan="11">지급대상</td>
									<td class="sBg"></td>
									<td class="t1" rowspan="3" width="50">지급</td>
									<td rowspan="3" width="17"></td>
								</tr>
								<tr>
									<td class="sBg"></td>
									<td class="sBg"></td>
									<td class="sBg"></td>
									<!-- <td class="sBg"></td> -->
									<td class="lbg3" colspan="12"></td>
								</tr>
								<tr>
									<td class="sBg"></td>
									<td class="sBg"></td>
									<!-- <td class="sBg"></td> -->
									<td class="sBg"></td>
									<td class="t1" width="64">강사료</td>
									<td class="sBg"></td>
									<td class="t1" width="64">소득세</td>
									<td class="sBg"></td>
									<td class="t1" width="64">주민세</td>
									<td class="sBg"></td>
									<td class="t1" width="64">여비</td>
									<td class="sBg"></td>
									<td class="t1" width="64">원고료</td>
									<td class="sBg"></td>
									<td class="t1" width="64">합계</td>
									<td class="sBg"></td>
								</tr>
							</table>
							<!--테이블 헤더 끝-->
							<!--리스트 시작-->
							<div id="mainList" style="width: 746px; z-index: 0; overflow-y: scroll; overflow-x: hidden">
								<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
									<c:set var="no" scope="request" value="0" />
									<c:forEach var="list" items="${rsPrf_WeekPayList}" varStatus="i">
										<!-- 열 배경 -->
										<c:if test="${no%2 == 0}">
											<c:set var="lineBg" scope="request" value="tbg3" />
										</c:if>
										<c:if test="${no%2 == 1}">
											<c:set var="lineBg" scope="request" value="" />
										</c:if>
										
										<html:hidden property="arraySelect" value="N" />
										<html:hidden property="arrayCourseCode" value="${list.coursecode}" />
										<html:hidden property="arrayLectDate" value="${list.lectdate}" />
										<html:hidden property="arrayProfNo" value="${list.profno}" />
										
										<tr class="${lineBg}">
											<td class="t2" width="39">
												<input type="checkbox" name="checkbox" value="${list.profno}" />
											</td>
											<td class="sBg"></td>
											<td class="t2" width="188">
												<c:set var="courseName" value="${fn:split(list.coursename,',')}" />
												
												<c:forEach var="courseList" items="${courseName }" varStatus="i">
													<c:out value="${courseList }" /> <br /> 
												</c:forEach>
											</td>
											<td class="sBg"></td>
											<td class="t2">
												<c:out value="${list.profname}" />
											</td>
											<td class="sBg"></td>
											<td class="t4" width="64">
												<fmt:formatNumber value="${list.lectpay}" pattern="#,##0" />
												&nbsp;
											</td>
											<td class="sBg"></td>
											<td class="t4" width="64">
												<fmt:formatNumber value="${list.incometax}" pattern="#,##0" />
												&nbsp;
											</td>
											<td class="sBg"></td>
											<td class="t4" width="64">
												<fmt:formatNumber value="${list.inhabtax}" pattern="#,##0" />
												&nbsp;
											</td>
											<td class="sBg"></td>
											<td class="t4" width="64">
												<a href="#none" class="imgSelect" onclick="openDetailTravel('${list.daypay}','${list.foodpay}','${list.staypay}','${list.trafficpay}');">
												<fmt:formatNumber value="${list.travel}" pattern="#,##0" />
												</a>
												<%-- <html:text property="travel" value="${list.travel}" style="width:50px; IME-MODE:disabled; direction:rtl;" maxlength="9" onkeydown="key_num();" onkeyup="this.value=setComma(this.value); inTravel(${no});" /> --%>
												&nbsp;
											</td>
											<td class="sBg"></td>
											<td class="t4" width="64">
												<fmt:formatNumber value="${list.msctfee}" pattern="#,##0" />
												<%-- <html:text property="msctFee" value="${list.msctFee}" style="width:50px; IME-MODE:disabled; direction:rtl;" maxlength="9" onkeydown="key_num();" onkeyup="this.value=setComma(this.value); inMsctFee(${no});" /> --%>
												&nbsp;
											</td>
											<td class="sBg"></td>
											<td class="t4" width="64" id="cellTotal">
												<fmt:formatNumber value="${list.netpay}" pattern="#,##0" />
												&nbsp;
											</td>
											<td class="sBg"></td>
											<td class="t2" width="50">
												<c:choose>
													<c:when test="${fn:contains(list.payflag,'N') }">
														미지급	
													</c:when>
													<c:otherwise>
														완료
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td colspan="21" class="lbg3"></td>
										</tr>
										<c:set var="no" scope="request" value="${no + 1}" />
									</c:forEach>
									<html:hidden property="max" value="${no}" />
									<html:hidden property="fromDate" />
									<html:hidden property="toDate" />
									<html:hidden property="type" />
									<c:if test="${no==0}">
										<tr class="tbg3">
											<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
										</tr>
										<tr>
											<td colspan="21" class="lbg3"></td>
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
					<tr valign="middle" class="stitle">
						<td align="right">
							<img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="middle" alt="저장" style="cursor: hand" onclick="doSubmit(document.forms[1]);" />
							<img src='<html:rewrite page="/images/board/btn_data.gif"/>' width="94" height="25"  alt="다운로드" align="middle" onclick="ozReport()" style="cursor: hand"/>
							<img src='<html:rewrite page="/images/board/btn_excel.gif"/>' width="94" height="25" alt="엑셀다운" align="absmiddle" onclick="doExcel1()" style="cursor:hand"/>
							<img src='<html:rewrite page="/images/board/btn_excel.gif"/>' width="94" height="25" alt="엑셀다운" align="absmiddle" onclick="doExcel2()" style="cursor:hand"/>
						</td>
					</tr>
				</table>
			</html:form>
		</td>
	</tr>
</table>
<div id="divDetailTravel">
<div style="position:absolute;top:5px;right:5px">
<span onClick="javascript:document.getElementById('divDetailTravel').style.display='none'" style="cursor:pointer;font-size:1.5em" title="닫기">X</span>
</div>
<div id="divDetailTravelText">
</div>
</div>
<iframe id="actionFrame" width="0" height="0"></iframe>

<input type="hidden" id="totalSumtax" name="totalSumtax" value="${totalSumtax}"/>
<input type="hidden" id="convertTotalSumtax" name="convertTotalSumtax" value="${convertTotalSumtax}"/>
<input type="hidden" id="title" name="title" value="${title}"/>
<input type="hidden" id="title2" name="title2" value="${title2}"/>
<input type="hidden" id="title3" name="title3" value="${title3}"/>
<input type="hidden" id="year" name="year" value="${year}"/>
<input type="hidden" id="size" name="size" value="${size}"/>