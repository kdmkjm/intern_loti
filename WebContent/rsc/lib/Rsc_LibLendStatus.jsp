<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>

<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   윈도우 사이즈 변경 셋팅 코드
		tresize(185);
	}
	function goList()
	{		
		document.forms[0].action = 'rscLib.act?task=list';
		document.forms[0].submit();
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
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/resources/title_03-2.gif"/>' alt="도서대출현황"/></td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<!--상단 검색 테이블 시작 -->
						<html:form method="POST" action="/rscLib.act?task=lendStatus" >
						<html:hidden property="searchKeywordBookType1" 	value="${searchBookType}"/>
						<html:hidden property="searchKeywordReqNo" 			value="${searchReqNo}"/>
						<html:hidden property="searchKeywordBookName" 	value="${searchBookName}"/>
						<html:hidden property="searchKeywordPublisher" 	value="${searchPublisher}"/>
						<html:hidden property="searchKeywordAuthor" 		value="${searchAuthor}"/>
						<html:hidden property="searchKeywordUserName" 	value="${searchUserName}"/>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
							<tr> 
								<td width="99" class="s1">대출구분</td>
								<td class="sBg"></td>
								<td width="150" class="s2"> 
									<html:select property="searchKeywordIsLent" style="width:100px">
										<html:option value="">전체</html:option>
										<html:option value="ingLend">대출중</html:option>
										<html:option value="trueLend">반납완료</html:option>
										<html:option value="noRetn">미반납</html:option>
									</html:select>
								</td>
								<td class="sBg"></td>
								<td width="99" class="s1">기간</td>
								<td class="sBg"></td>
								<td class="s2"> 
									<html:text property="searchKeywordLendFromDate" style="width:80px" /><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' width="16" height="19" align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchKeywordLendFromDate, 'yyyy-mm-dd');"> ~  
									<html:text property="searchKeywordLendToDate" style="width:80px" /><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' width="16" height="19" align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchKeywordLendToDate, 'yyyy-mm-dd');">
								</td>
								<td width="60"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" /></td>
						  </tr>
						</table>
						</html:form>
						<!--상단 검색 테이블 끝-->
						<table>
							<tr>
			        	<td height="15"></td>
							</tr>
						</table>
						<!--게시물 목록 시작-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
			            <!--테이블 헤더 시작-->
			            <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr> 
									    <td class="t1">도서명</td>
											<td class="sBg"></td>
									    <td class="t1" width="59">도서분류</td>
											<td class="sBg"></td>
									    <td class="t1" width="59">저자</td>
											<td class="sBg"></td>
									    <td class="t1" width="79">출판사</td>
											<td class="sBg"></td>
									    <td class="t1" width="69">대출일자</td>
											<td class="sBg"></td>
									    <td class="t1" width="69">반납일자</td>
											<td class="sBg"></td>
									    <td class="t1" width="64">대출구분</td>
											<td class="sBg"></td>
									    <td class="t1" width="59">대출자</td>
											<td class="sBg"></td>
									    <td class="t1" width="90">연락처</td>
									    <td width="17"></td>
										</tr>
									</table>
									<!--테이블 헤더 끝-->
                  <!--리스트 시작-->
                  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
									<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
										<c:set var="no" scope="request" value="1"/>
										<c:forEach var="libLendList" items="${rsRscLibLendStatus}" varStatus="i" >
								    	<!-- 열 배경 -->
											<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
											<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
											<tr class="${lineBg}">
												<td class="t3">&nbsp;<c:out value="${libLendList.bookName}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="59"><c:out value="${libLendList.bookType1}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="59"><c:out value="${libLendList.author}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="79"><c:out value="${libLendList.publisher}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="69"><c:out value="${libLendList.lendDate}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="69"><c:out value="${libLendList.retnDate}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="64"><c:out value="${libLendList.isLent}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="59"><c:out value="${libLendList.lendUserName}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="90"><c:out value="${libLendList.lendUserPhone}"/></td> 
								    	</tr>
											<tr> 
                        <td class="lbg3" colspan="19"></td>
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
  								<!--게시물 목록 끝-->
  							</td>
  						</tr>
  					</table>
  					<!--게시물 아래 버튼 시작-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
							<tr valign="bottom">
								<td align="right">
									<input type="image" src='<html:rewrite page="/images/board/btn_list.gif" />' align="absmiddle" alt="목록" onclick="goList();"/>
								</td> 
							</tr>
						</table>
						<!--게시물 아래 버튼 끝-->
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
<!--
	tresize(185);
//-->
</script>

