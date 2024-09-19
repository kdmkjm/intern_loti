<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script type="text/javascript" src='<html:rewrite page="/script/Crs_Org.js"/>'></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script language="JavaScript">
	//엑셀 다운로드
	function excelDown()
	{
		var form = document.forms[0];
		var url = '${pageContext.request.contextPath}/crsOrg.act?task=excel&';
    var pars = Form.serialize(form);
    
		document.location.href = url+pars;
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="교육과정편성" src="/images/edu/title_05.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action='crsOrg.act?task=list'>
 	  <!--검색 테이블 시작-->
 	  <html:hidden property="searchCode"/>
	  <html:hidden property="modifyFlag"/>
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr>
        <td bgcolor="#FFFFFF">
		  <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="74" class="s1">연도</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td class="s2" width="89">
			  <html:select property="selPlanYear">
			    <html:optionsCollection name="applyYearCode" property="beanCollection" />
			  </html:select>
			</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td width="74" class="s1">분류</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td class="s2" width="189">
			  <html:select property="selCrsType">
			    <html:optionsCollection name="crsTypeSearch" property="beanCollection" />
			  </html:select>
			</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td width="74" class="s1">과정명</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td class="s2"><html:text property="searchKeyword" style="width:150px;"/></td>
			<td width="60" align="center"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="검색" /></td>
          </tr>
          </table>
        </td>
      </tr>
      </table>
      <!--검색 테이블 끝-->
	</html:form>
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
          <td class="t1Line" width="40">선택</td>
          <td class="t1Line" width="55">연월</td>
          <td class="t1Line">과정명</td>
          <td class="t1Line" width="90">교육대상</td>
          <td class="t1Line" width="50">일수</td>
          <td class="t1Line" width="70">교육인원</td>
          <td class="t1Line" width="85">교육기간</td>
          <td class="t1Line" width="67">처리</td>
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
        <form name="fixForm" id="fixForm" action="crsOrg.act?task=fix_course" method="post">
          <input type="hidden" name="count" id="count">
          <input type="hidden" name="year" id="year">
          <table width="746" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td valign="top">
<!--리스트 시작-->
<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden;">
<script type="text/javascript">div_size(205);</script>		
<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
<c:forEach var="crsList" items="${rsCrs_OrgList}" varStatus="i" ><c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if><c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
  <fmt:parseDate var="eduFrom" value="${crsList.eduFrom}" pattern="yyyymmdd"/><fmt:parseDate var="eduTo" value="${crsList.eduTo}" pattern="yyyymmdd"/>											
	<tr class="${lineBg}">
		<td class="t2Line" width="40">
			<%--
			<c:if test="${crsList.modifyFlag eq 'N'}"><input type="checkbox" name="check" id="check" disabled="disabled"></c:if>
			<c:if test="${crsList.modifyFlag eq 'Y' or crsList.modifyFlag eq null}"><input type="checkbox" name="check" id="check"></c:if>
			--%>
			<input type="checkbox" name="check" id="check">
		</td>
		<td class="t2Line" width="55"><c:out value="${crsList.baseYYMM}"/></td>
		<td class="t3Line"><c:if test="${crsList.modifyFlag eq 'Y' or crsList.modifyFlag eq null}"><B></c:if>&nbsp;<c:out value="${crsList.courseName}"/></td>
		<td class="t2Line" width="90"><c:out value="${crsList.eduTarget}"/></td>
		<td class="t2Line" width="50">${crsList.dayCount}</td>
		<td class="t2Line" width="70"><c:out value="${crsList.eduCount}"/></td>
		<td class="t2Line" width="85"><fmt:formatDate value="${eduFrom}" pattern="mm.dd"/>~<fmt:formatDate value="${eduTo}" pattern="mm.dd"/></td>
		<td class="t2Line" width="50"><img src='<html:rewrite page="/images/board/btn_modify.gif"/>' width="34" height="18" align="absmiddle" alt="수정" onclick="modify('${crsList.courseCode}','${crsList.isCyber}', '${crsList.modifyFlag}');" style="CURSOR: hand"/></td>
	</tr>
	<input type="hidden" name="isCheck" id="isCheck"><input type="hidden" name="insCourseCode" id="insCourseCode" value="${crsList.courseCode}"><c:set value="${i.count}" var="count"/><c:set value="${total_day + crsList.dayCount}" var="total_day"/><c:set value="${total_std + crsList.eduCount}" var="total_std"/>
</c:forEach>
<input type="hidden" name="searchYear">
</table>
</div>
		      <c:if test="${count>0}">
				<table width="746" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td class="t2BgRedLine">총계</td>
				  <td class="t2BgRedLine" width="50"><fmt:formatNumber value="${total_day}" pattern="#,##0"></fmt:formatNumber></td>
				  <td class="t2BgRedLine" width="70"><fmt:formatNumber value="${total_std}" pattern="#,##0"></fmt:formatNumber></td>
				  <td class="t2BgRedLine" width="85">&nbsp;</td>
				  <td class="t2BgRedLine" width="67">&nbsp;</td>
				</tr>
			    </table>
		      </c:if>
              <!--리스트 끝-->
            </td>
          </tr>
          </table>
        </form>
      </td>
      <td class="lbg"></td>
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
        <img src='<html:rewrite page="/images/board/btn_send2.gif"/>' alt="교육과정 확정 전송" align="absmiddle" onclick="fixCourse();" style="CURSOR: hand" />
      </td>
      <td align="right">
	    <img src='<html:rewrite page="/images/board/btn_excel.gif"/>' alt="엑셀 다운로드" align="absmiddle" onclick="excelDown();" style="CURSOR: hand"/>
	    <img src='<html:rewrite page="/images/board/btn_new_up.gif"/>' alt="집합과정 신규등록" align="absmiddle"  onclick="createCourse();" style="CURSOR: hand"/>
	    <img src='<html:rewrite page="/images/board/btn_new_cyberup.gif"/>' alt="사이버과정 신규등록" align="absmiddle"  onclick="createCyber();" style="CURSOR: hand"/>
      </td>
    </tr>
    </table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	document.all.searchYear.value = document.all.selPlanYear.value;
	document.forms[0].searchKeyword.focus();
//-->
</script>