<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   윈도우 사이즈 변경 셋팅 코드
		tresize(185);
	}
	function doDelete(num)
	{
		var del_confirm = confirm('삭제하시겠습니까?');
		if(del_confirm == true)
		{
			var url = '${pageContext.request.contextPath}/rscBook.act?task=delete&facsNo='+num;
			document.location.href = url;
		}
		else
		{
			return;
		}
	}
	
	function inBook(num)
	{
		var txBookSeq = num;
		window.open('<html:rewrite page="/rscBook.act?task=inBook&txBookSeq=' + txBookSeq + '"/>', 'popup', 'scrollbars=no, menubar=no, width=650, height=301, status=yes top=150, left=150');
	}
	
	function outBook(num)
	{
		var txBookSeq = num;
		window.open('<html:rewrite page="/rscBook.act?task=outBook&txBookSeq=' + txBookSeq + '"/>', 'popup', 'scrollbars=no, menubar=no, width=650, height=301, status=yes top=150, left=150');
	}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="교재 관리" src="/images/resources/title_02.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--검색 -->
	<form method="POST"  action='<html:rewrite page="/rscBook.act?task=list"/>'>
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr>
		<td class="s1" width="75">교재명</td>
		<td class="sBg" width="1"></td>
		<td class="s2">									
		  <input type="text" name="searchKeyword" title="교재명" class="inputText" value="${searchKeyword}" />
		</td>
		<td width="60">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="document.forms[0].submit();" style="cursor:hand" align="absmiddle"/>
		</td>
	  </tr>
	  </table>
	</form>
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
		  <td class="t1">교재명</td>
		  <td class="sBg"></td>
		  <td class="t1" width="59">입고</td>
		  <td class="sBg"></td>
		  <td class="t1" width="59">출고</td>
		  <td class="sBg"></td>
		  <td class="t1" width="59">재고량</td>
		  <td class="sBg"></td>
		  <td class="t1" width="200">연결된 과정</td>
		  <td class="sBg"></td>
		  <td class="t1" width="135">처리</td>
		  <td class="t1" width="17"></td>
		</tr>
		</table>
		<!--테이블 헤더 끝-->
		<!--리스트 시작-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:set var="no" scope="request" value="1"/>
		  <c:forEach var="list" items="${rsRscBookList}" varStatus="i" >
		    <!-- 열 배경 -->
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t3">
				<a href='<html:rewrite page="/rscBook.act?task=modify&txBookSeq=${list.txBookSeq}"/>'">
				  &nbsp;<u><c:out value="${list.txBookName}"/></u>
				</a>
			  </td>
			  <td class="sBg"></td>
			  <td class="t4" width="59"><fmt:formatNumber value="${list.stockIn}" pattern="#,##0"/>&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t4" width="59"><fmt:formatNumber value="${list.stockOut}" pattern="#,##0"/>&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t4" width="59"><fmt:formatNumber value="${list.stockTotal}" pattern="#,##0"/>&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t3" width="200">&nbsp;<c:out value="${list.connCrs}"/></td>
			  <td class="sBg"></td>
			  <td class="t2" width="135">
				<img src='<html:rewrite page="/images/board/btn_history.gif"/>' align="absmiddle" alt="입고" onclick="location.href='<html:rewrite page="/rscBook.act?task=history&txBookSeq=${list.txBookSeq}"/>'" style="cursor:hand"/>
				<img src='<html:rewrite page="/images/board/btn_in.gif"/>'  align="absmiddle" alt="입고" onClick="inBook(${list.txBookSeq});" style="cursor:hand"/>
				<img src='<html:rewrite page="/images/board/btn_out.gif"/>' align="absmiddle" alt="출고" onClick="outBook(${list.txBookSeq});" style="cursor:hand"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="15" class="lbg3"></td>
			</tr>
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
	  </td>
	</tr>
	</table>
	<!--하단버튼 테이블 시작-->
	<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
	<tr valign="bottom"> 
	  <td align="right">
		<img src='<html:rewrite page="/images/board/btn_book_up.gif"/>' alt="교재등록"  align="absmiddle" style="cursor:hand" onclick="location.href='<html:rewrite page="/rscBook.act?task=create"/>'"/>
	  </td>
	</tr>
	</table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(185);
	document.forms[0].searchKeyword.focus();
//-->
</script>