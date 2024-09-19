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
		tresize(210);
	}
	function doDelete(num)
	{
		var del_confirm = confirm('삭제하시겠습니까?');
		if(del_confirm == true)
		{
			document.forms[0].facsNo.value = num;
			document.forms[0].action = 'rscInst.act?task=delete';
			document.forms[0].submit();
		}
		else
		{
			return;
		}
	}
	function doDetl()
	{
		document.forms[0].action = 'rscInst.act?task=detl';
		document.forms[0].submit();
	}
	function newFacs()
	{
		document.forms[0].action = 'rscInst.act?task=create';
		document.forms[0].submit();
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="기자재 관리" src="/images/resources/title_01.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--검색 -->
	<html:form method="POST" action="rscInst.act?task=list">
	  <html:hidden property="facsNo"/>
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr>
		<td width="119" class="s1">물품명</td>
		<td class="sBg"></td>
		<td class="s2">
		  <html:select property="searchFacsType" style="width:150px">
			<html:optionsCollection name="facsTypeCode" property="beanCollection" />
		  </html:select>
		</td>
		<td width="60">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="document.forms[0].submit();" style="cursor:hand" align="absbottom"/>
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
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--테이블 헤더 시작-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1">물품명</td>
		  <td class="sBg"></td>
		  <td class="t1" width="209">설치장소</td>
		  <td class="sBg"></td>
		  <td class="t1" width="69">수량</td>
		  <td class="sBg"></td>
		  <td class="t1" width="109">AS 업체명</td>
		  <td class="sBg"></td>
		  <td class="t1" width="109">AS 연락처</td>
		  <td class="sBg"></td>
		  <td class="t1" width="60">처리</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--테이블 헤더 끝-->
		<!--리스트 시작-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:set var="no" scope="request" value="1"/>
		  <c:forEach var="instList" items="${rsRscInstList}" varStatus="i" >
			<!-- 열 배경 -->
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t3">
				&nbsp;<a href='<html:rewrite page="/rscInst.act?task=modify&facsNo=${instList.facsNo}"/>'><u><c:out value="${instList.facsType}"/></u></a>
			  </td>
			  <td class="sBg"></td>
			  <td class="t3" width="209">		
				<div title="${instList.place}">		
				  <c:if test="${fn:length(instList.place) > 20}">&nbsp;<c:out value="${fn:substring(instList.place, 0, 20)} …"/></c:if>
				  <c:if test="${fn:length(instList.place) < 20}">&nbsp;<c:out value="${instList.place}"/></c:if>
				</div>
			  </td>
			  <td class="sBg"></td>
			  <td class="t4" width="69"><c:out value="${instList.count}"/>&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t3" width="109">&nbsp;<c:out value="${instList.as_Corp}"/></td>
			  <td class="sBg"></td>
			  <td class="t2" width="109"><c:out value="${instList.as_Phone}"/></td>
			  <td class="sBg"></td>
			  <td class="t2" width="60">
			    <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle" alt="삭제" onclick="doDelete(${instList.facsNo});" style="cursor:hand"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="13" class="lbg3"></td>
			</tr>
			<c:set var="total" scope="request" value="${total+instList.count}"/>
			<c:set var="no" scope="request" value="${no + 1}"/>
		  </c:forEach>
		  <c:if test="${no==1}">
			<tr class="tbg3" height="21">
			  <td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
			</tr>
		  </c:if>
		  </table>
		</div>
		<!--리스트 끝-->
		<!--리스트 계 시작-->
		<c:if test="${total!=null}">
		  <table width="746" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td class="t2BgRed"	>계</td>
			<td class="sBg"></td>
			<td class="t2BgRedR" width="69"><b>${total}</b>&nbsp;</td>
			<td class="sBg"></td>
			<td class="t2BgRed" width="109"></td>
			<td class="sBg"></td>
			<td class="t2BgRed" width="109"></td>
			<td class="sBg"></td>
			<td class="t2BgRed" width="77"></td>
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
		<img src='<html:rewrite page="/images/board/btn_sum3.gif"/>' alt="기자재별 통계" align="absmiddle" onclick="doDetl();" style="cursor:hand"/>
	  </td> 
	  <td align="right">
		<img src='<html:rewrite page="/images/board/btn_up2.gif"/>' alt="신규등록" align="absmiddle" onclick="newFacs();" style="cursor:hand"/>
	  </td>
	</tr>
	</table>
	<!--하단버튼 테이블 끝-->
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(210);
//-->
</script>