<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script type="text/javascript" src='<html:rewrite page="/script/Pln_EduSurv.js"/>'></script>
<script language="JavaScript">
	function ozReport()  
	{   //수요조사집계표 
	
		var selPlanYear 	= document.all.selPlanYear.value; 
		var selCrsType 		= document.all.selCrsType.value; 
		var selOrganCode 	= document.all.selOrganCode.value; 
			
 		var winl = (screen.width - 700) / 2;
 		var wint = (screen.height - 750) / 2;  
		window.open('<html:rewrite page="/ozMenu.act"/>?report=surv&selPlanYear='+selPlanYear+'&selCrsType='+selCrsType+'&selOrganCode='+selOrganCode, 'popup', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,width=710,height=550,top='+wint+',left='+winl);
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="교육 수요조사" src="/images/edu/title_01.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <!--검색 테이블 시작-->
	<html:form action='plnSurv.act?task=list'> 									
	  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
	  <tr>
	    <td bgcolor="#FFFFFF">
	      <table width="748" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="74" class="s1">연도</td>
	        <td bgcolor="#E6E6E6" width="1"></td>
	        <td class="s2" width="89">
	          <html:select property="selPlanYear">
	            <html:optionsCollection name="planYearCode" property="beanCollection" />
	          </html:select>
	        </td>
	        <td bgcolor="#E6E6E6" width="1"></td>
	        <td width="74" class="s1">분류</td>
	        <td bgcolor="#E6E6E6" width="1"></td>
	        <td class="s2" width="189">
	          <html:select property="selCrsType">
	            <html:optionsCollection name="crsTypeCode" property="beanCollection" />
	          </html:select>
	        </td>
	        <td bgcolor="#E6E6E6" width="1"></td>
	        <td width="74" class="s1">기관명</td>
	        <td bgcolor="#E6E6E6" width="1"></td>
	        <td class="s2">
	          <html:select property="selOrganCode">
	            <html:optionsCollection name="orgTypeCode" property="beanCollection" />
	          </html:select>
	        <td width="60" align="center"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="검색" /></td>
	      </tr>
	      </table>
	    </td>
	  </tr>
	  </table>
	</html:form>
    <!--검색 테이블 끝-->
  </td>
</tr>
<tr>
  <td height="15"></td>
</tr>
<tr>
  <td>
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tbg2"></td>
    </tr>
    </table>
  </td>
</tr>
<tr>
  <td>
    <!--테이블 헤더 시작-->
	<table width="750" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td class="lbg"></td>
	  <td class="cbg">
	    <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
	      <tr>
	        <td class="t1Line" width="40">번호</td>
	        <td class="t1Line">과정명</td>
	        <td class="t1Line" width="117">교육대상</td>
	        <td class="t1Line" width="50">일수</td>
	        <td class="t1Line" width="50">차시</td>
	        <td class="t1Line" width="50">인정<br>시간</td>
	        <td class="t1Line" width="50">교육<br>인원</td>
	        <td class="t1Line" width="50">수요<br>인원</td>
	        <td class="t1Line" width="99">처리</td>
	      </tr>
	    </table>
	  </td>
	  <td class="lbg"></td>
	</tr>
	</table>
    <!--테이블 헤더 끝-->
  </td>
</tr>
<tr>
  <td>
	<table width="750" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td class="lbg"></td>
	  <td width="746">
	    <table width="746" border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td valign="top">
	<!--리스트 시작-->
	<div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden;">
	<script type="text/javascript">div_size(215);</script>								
	<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
	<c:forEach var="survList" items="${rsPln_EduSurvList}" varStatus="i" ><c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if><c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
		<tr class="${lineBg}">
			<td class="t2Line" width="40" id="num"><c:out value="${i.count}"/></td>
			<td class="t3Line" id="cellCrsName">&nbsp;<c:out value="${survList.crsClumpName}"/></td>
			<td class="t2Line"width="117" id="cellEduTarget"><c:if test="${survList.eduTarget eq null}">&nbsp;</c:if>${survList.eduTarget}</td>
			<td class="t2Line" width="50" id="cellDayCount"><c:if test="${survList.dayCount eq null}">&nbsp;</c:if>${survList.dayCount}</td>
			<td class="t2Line" width="50" id="cellChptCount"><c:if test="${survList.chptCount eq null}">&nbsp;</c:if>${survList.chptCount}</td>
			<td class="t2Line" width="50" id="cellApvHour"><c:if test="${survList.apvHour eq null}">&nbsp;</c:if>${survList.apvHour}</td>
			<td class="t2Line" width="50" id="cellStdNumber"><c:if test="${survList.stdNumber eq null}">&nbsp;</c:if>${survList.stdNumber}</td>
			<td class="t2Line" width="50" id="orgNum"><c:if test="${survList.orgStdNumber eq null}">&nbsp;</c:if>${survList.orgStdNumber}</td>
			<td class="t2Line" width="82">
				<c:if test="${isFix==0}"><img width="34" height="18" align="absmiddle" onclick="modifySurv(${i.count});" src='<html:rewrite page="/images/board/btn_modify.gif"/>' style="cursor:hand"/>&nbsp;<img src='<html:rewrite page="/images/board/btn_del2.gif"/>' onclick="deleteSurv('${survList.crsClumpCode}');" width="34" height="18" align="absmiddle" alt="삭제" style="cursor:hand" /></c:if>
				<c:if test="${isFix>0}"><img width="34" height="18" align="absmiddle"  src='<html:rewrite page="/images/board/btn_modify_off.gif"/>'/>&nbsp;<img src='<html:rewrite page="/images/board/btn_del2_off.gif"/>' width="34" height="18" align="absmiddle" alt="삭제" /></c:if>
			</td>
		</tr>
		<input type="hidden" name="crsClumpCd" id="crsClumpCd" value="${survList.crsClumpCode}"><input type="hidden" name="type" id="type" value="${survList.crsType}" ><c:set var="count" value="${i.count}"/>
	</c:forEach>
	<input type="hidden" name="max" id="max" value="${count}" >
	</table>
	</div>
	<!--게시물 목록 끝-->
	<!--게시물 추가/수정 시작-->
	        <html:form action="/plnSurv.act?task=insert" method="post">
	          <input type="hidden" name="crsClumpCode" id="crsClumpCode" >
	          <input type="hidden" name="organCode" id="organCode" >
	          <input type="hidden" name="planYear" id="planYear" value="${planYear}">
	          <input type="hidden" name="crsType" id="crsType">
	  		  <table width="746" border="0" cellspacing="0" cellpadding="0">
	 		  <tr>
	     		<td class="t2BgRedLine" width="40" id="newNum">&nbsp;</td>
	     		<td class="t2BgRedLine" id="crsClumpNm"><input type="text" name="crsClumpName" id="crsClumpName" style="width:95%;" tabindex="1"></td>
				<td class="t2BgRedLine" width="117" id="eduTgt"><input type="text" name="eduTarget" id="eduTarget" style="width:90%;" tabindex="2"></td>
				<td class="t2BgRedLine" width="50" id="newDayCnt"><input type="text" name="dayCount" id="dayCount" style="width:75%;IME-MODE:disabled" onkeydown="key_num();" tabindex="3"></td>
				<td class="t2BgRedLine" width="50" id="chptCnt"><input type="text" name="chptCount" id="chptCount" style="width:75%;IME-MODE:disabled" onkeydown="key_num();" tabindex="5"></td>
				<td class="t2BgRedLine" width="50" id="apvHr"><input type="text" name="apvHour" id="apvHour" style="width:75%;IME-MODE:disabled" onkeydown="key_num();" tabindex="6"></td>
				<td class="t2BgRedLine" width="50" id="stdNum"><input type="text" name="stdNumber" id="stdNumber" style="width:75%;IME-MODE:disabled" onkeydown="key_num();" tabindex="4"></td>
				<td class="t2BgRedLine" width="50" id="orgNum">&nbsp;</td>
				<td class="t2BgRedLine" width="82">
				  <c:if test="${isFix==0}">
					<img src='<html:rewrite page="/images/board/btn_save3.gif"/>'  width="34" height="19" alt="신규저장" align="absmiddle" onclick="saveSurv();" style="cursor:hand"/>
					<img src='<html:rewrite page="/images/board/btn_cancle3.gif"/>'  width="34" height="19" alt="취소" align="absmiddle" onclick="formReset();" style="cursor:hand"/>
				  </c:if>
				  <c:if test="${isFix!=0}">&nbsp;</c:if>
	       		</td>
				<td class="t2BgRedL" width="17">&nbsp;</td>
	   		  </tr>
			  </table>
	        </html:form>
		  </td>
	    </tr>
	    </table>
	  </td>
	  <td class="lbg" ></td>
	</tr>
	</table>
  </td>
</tr>
<tr>
  <td>
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tbg2"></td>
    </tr>
    </table>
  </td>
</tr>
<tr>
  <td>
	<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
	<tr valign="bottom">
	  <td>
	    <c:if test="${isFix==0}">
	      <c:if test="${sysMgr == 'Y'}">
	        <img src='<html:rewrite page="/images/board/btn_import.gif"/>' width="127" height="25" align="absmiddle" alt="전년도 자료 가져오기" onclick="copySurvey();" style="cursor:hand">
	      </c:if>
	      <img src='<html:rewrite page="/images/board/btn_excel.gif"/>' width="94" height="25" align="absmiddle" alt="엑셀다운로드" onclick="excelDown();" style="cursor:hand">
	      <img src='<html:rewrite page="/images/board/btn_excelup2.gif"/>' align="absmiddle" alt="기관별 엑셀업로드" onclick="excelUpload();" style="cursor:hand">
	    </c:if>
	    <c:if test="${isFix>0}">
	      <c:if test="${sysMgr == 'Y'}">
	        <img src='<html:rewrite page="/images/board/btn_import_off.gif"/>' width="127" height="25" align="absmiddle" alt="전년도 자료 가져오기" style="cursor:hand">
	      </c:if>
	      <img src='<html:rewrite page="/images/board/btn_excel_off.gif"/>' width="94" height="25" align="absmiddle" alt="엑셀다운로드">
	      <img src='<html:rewrite page="/images/board/btn_excelup2_off.gif"/>' align="absmiddle" alt="기관별 엑셀업로드">
	    </c:if>
	    <c:if test="${isFinish ==0 }">
	      <img src='<html:rewrite page="/images/board/btn_ending.gif"/>' width="72" height="25" align="absmiddle" alt="집계마감" onclick="survFinish()" style="cursor:hand">
	    </c:if>
	    <c:if test="${isFinish !=0 }">
	      <img src='<html:rewrite page="/images/board/btn_ending2.gif"/>' width="72" height="25" align="absmiddle" alt="집계마감" onclick="survCancel()" style="cursor:hand">
	    </c:if>												 
	  </td>
	  <td align="right">
	    <img src='<html:rewrite page="/images/board/btn_print6.gif"/>' width="86" height="25" align="absmiddle" alt="집계표 인쇄" onclick="ozReport();" style="cursor:hand">
	  </td>
	</tr>
	</table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	searchList('${key}');
//-->
</script>
