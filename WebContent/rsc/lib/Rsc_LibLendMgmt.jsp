<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script type="text/javascript" src='<html:rewrite page="/script/Rsc_LibLendMgmt.js"/>'></script>
<script type="text/javascript">
	// 대출자 조회
	function popUser()
	{
		var userName = document.all.lendUser.value;
		var searchTrue = false;

		if(userName == "")
			searchTrue = false;
		else
			searchTrue = "popup";

		window.open('<html:rewrite page="/cmnUser.act?task=list&getType=parent&type=lend&searchTrue=' + searchTrue + '&searchKeywordUserName=' + userName + '"/>', 'lendUser', 'scrollbars=no, menubar=no, width=400, height=361, status=yes');
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="도서관리 - 대출/반납" src="/images/resources/title_03.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--검색 -->
	<html:form method="POST" action="/rscLib.act?task=list&type=true">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr>
		<td class="s1" width="74">도서분류</td>
		<td class="sBg"></td>
		<td class="s2" width="149">
		  <html:select property="searchKeywordBookType1" style="width:132px">
			<html:optionsCollection name="libTypeCode" property="beanCollection" />
		  </html:select>
		</td>
		<td class="sBg"></td>
		<td class="s1" width="74">청구기호</td>
		<td class="sBg"></td>
		<td class="s2" width="149"><html:text property="searchKeywordReqNo" style="width:130" /></td>
		<td class="sBg"></td>
		<td class="s1" width="74">도서명</td>
		<td class="sBg"></td>
		<td class="s2" colspan="7"><html:text property="searchKeywordBookName" style="width:180px"/></td>
	  </tr>
	  <tr>
		<td colspan="13" class="lbg3"></td>
	  </tr>
	  <tr> 
		<td class="s1" width="74">출판사</td>
		<td class="sBg"></td>
		<td class="s2" width="149"><html:text property="searchKeywordPublisher" style="width:130" /></td>
		<td class="sBg"></td>
		<td class="s1" width="74">저자</td>
		<td class="sBg"></td>
		<td class="s2" width="149"><html:text property="searchKeywordAuthor" style="width:130" /></td>
		<td class="sBg"></td>
		<td class="s1" width="74">대출자</td>
		<td class="sBg"></td>
		<td class="s2" width="149"><html:text property="searchKeywordUserName" style="width:130" /></td>
		<td align="right">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSubmit(document.forms[0]);" style="cursor:hand" align="absmiddle"/>
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
	<html:form method="POST" action="/rscLib.act?task=lend">
	  <html:hidden property="searchBookType"/>
	  <html:hidden property="searchReqNo"/>
	  <html:hidden property="searchBookName"/>
	  <html:hidden property="searchPublisher"/>
	  <html:hidden property="searchAuthor"/>
	  <html:hidden property="searchUserName"/>
	  <html:hidden property="bookCode"/>
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	  <tr>
		<td>
		  <!--테이블 헤더 시작-->
		  <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		  <tr> 
			<td class="t1Line" width="35">선택</td>
			<td class="t1Line" width="65">청구기호</td>
			<td class="t1Line">도서명</td>
			<td class="t1Line" width="90">출판사</td>
			<td class="t1Line" width="80">저자</td>
			<td class="t1Line" width="70">대출자</td>
			<td class="t1Line" width="80">반납예정일</td>
			<td class="t1Line" width="81">대출구분</td>
		  </tr>
		  </table>
		  <!--테이블 헤더 끝-->
          <!--리스트 시작-->
          <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			<c:set var="no" scope="request" value="1"/>
	        <c:forEach var="libList" items="${rsRscLibList}" varStatus="i" > 
			  <!-- 열 배경 -->
			  <c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			  <c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			  <tr class="${lineBg}">
				<html:hidden property="arrayBookCode" value="${libList.bookCode}"/>
				<html:hidden property="arrayLendDate" value="${libList.lendDate}"/>
				<html:hidden property="arrayLendType" value="${libList.isLent}"/>
				<html:hidden property="arraySelectLend" value="false"/>
	            <td class="t2Line" width="35"><html:checkbox property="arrayLend"/></td>
				<td class="t2Line" width="65">&nbsp;<c:out value="${libList.reqNo}"/></td> 
				<td class="t3Line">&nbsp;<a href='#' onclick="modifyLib(${libList.bookCode})"><u><c:out value="${libList.bookName}"/></u></a></td> 
				<td class="t2Line" width="90">&nbsp;<c:out value="${libList.publisher}"/></td> 
				<td class="t2Line" width="80">&nbsp;<c:out value="${libList.author}"/></td> 
				<td class="t2Line" width="70">&nbsp;<c:if test="${libList.isLent == '대출중'}"><c:out value="${libList.lendUserName}"/></c:if></td> 
				<td class="t2Line" width="80">&nbsp;<c:if test="${libList.isLent == '대출중'}"><c:out value="${libList.retnPlanDate}"/></c:if></td> 
				<td class="t2Line" width="64">&nbsp;<c:out value="${libList.isLent}"/></td> 
			  </tr>
			  <c:set var="no" scope="request" value="${no + 1}"/>
			</c:forEach>
			<c:if test="${no==1}">
			  <tr class="tbg3">
				<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
			  </tr>
			</c:if>
			<html:hidden property="max" value="${no - 1}"/>
			</table>
          </div>
          <!--리스트 끝-->    
          <!--추가 부분 시작-->                
          <table width="746" border="0" cellspacing="0" cellpadding="0">
		  <tr> 
			<td width="75" class="t2BgRedLine">대출자</td>
			<td width="120" class="t2BgRedLine"> 
			  <input type="text" name="lendUser" title="대출자" style="width:80px;">
			  <img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' align="absmiddle" alt="대출자 검색" onClick="popUser();" style="cursor:hand"/> 
			</td>
			<td width="75" class="t2BgRedLine">소속</td>
			<td width="145" class="t2BgRedLine"><input type="text" name="lendPosition" title="소속" style="width:130px" />	</td>
			<td width="75" class="t2BgRedLine">연락처</td>
			<td class="t2BgRedLine" width="165"><input type="text" name="lendPhone" title="연락처" style="width:150px" /></td>
			<td class="t2BgRedLine">
			  <html:hidden property="arrayBookCode" value="${libList.bookCode}"/>
			  <html:hidden property="lendType"/>
			  <img src='<html:rewrite page="/images/board/btn_borrow.gif"/>' align="absmiddle" alt="대출" onclick="doLend(document.forms[1], 'startLend');" style="cursor:hand"/> 
			  <img src='<html:rewrite page="/images/board/btn_return.gif"/>' align="absmiddle" alt="반납" onclick="doLend(document.forms[1], 'endLend');" style="cursor:hand"/>
			</td>
          </tr>
		  </table>
          <!--추가 부분 끝-->
		</td>
	  </tr>
	  </table>
	</html:form>
	<!--하단버튼 테이블 시작-->
	<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
	<tr valign="bottom"> 
	  <td>
		<img src='<html:rewrite page="/images/board/btn_book_search.gif"/>' align="absmiddle" alt="대출현황조회" onclick="lendLib();" style="cursor:hand"/>
		<img src='<html:rewrite page="/images/board/btn_book_sum.gif"/>' align="absmiddle" alt="도서분류별 통계" onclick="cateLib();" style="cursor:hand"/> 
		<img src='<html:rewrite page="/images/board/btn_book_up2.gif"/>' align="absmiddle" alt="도서등록"  onclick="newLib();" style="cursor:hand"/> 
	  </td>
	  <td align="right">
		<img src='<html:rewrite page="/images/board/btn_reset.gif"/>' align="absmiddle" alt="초기화" onclick="clearText();" style="cursor:hand">
	  </td>
	</tr>
	</table>
	<!--하단버튼 테이블 끝-->
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(245);
	document.forms[0].searchKeywordBookName.focus();
//-->
</script>

