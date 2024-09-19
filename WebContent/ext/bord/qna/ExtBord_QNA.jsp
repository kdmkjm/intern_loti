<%@ page language="java"%>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type='text/javascript' src='/common/js/jquery-1.7.1.min.js'></script>
<script type="text/javascript">
<!--
$.noConflict();
	jQuery(function(){
		jQuery('#selectAll').change(function(){
			var $checkboxs = jQuery('#mainTable input[name="board_Idx_array"]');
			if(this.checked){
				$checkboxs.attr('checked','checked');
			}
			else{
				$checkboxs.attr('checked',false);
			}
		});
	});
	
	function checkDelete(){
		if(jQuery('#mainTable input[name="board_Idx_array"]:checked').size() == 0){
			alert('삭제할 게시물을 선택해주세요');
		}
		else{
			if(confirm('삭제하시겠습니까?')){
				var $form = jQuery('<form action="/extBordQNA.act?task=delete" method="post"/>').appendTo('body');
				$form.append(jQuery('#mainTable input[name="board_Idx_array"]:checked').clone(true));
				$form.submit();
			}
		}
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">현재경로정보</h2>
				<h1>
					<img alt="Q&amp;A" src="/images/community/title_01.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<!--검색 -->
			<form method="POST"
				action='<html:rewrite page="/extBordQNA.act?task=list"/>'>
				<table width="750" border="0" cellspacing="0" cellpadding="0">
					<tr align="right" valign="top">
						<td height="20" valign="middle"><select name="searchType">
								<option value="00001" selected>제목</option>
								<option value="00002">내용</option>
								<option value="00003">작성자</option>
						</select></td>
						<td width="130" class="s2"><input type="text"
							name="searchKeyword" title="제목" class="inputText"
							value="${searchKeyword}" /></td>
						<td width="60"><input type="image"
							src='<html:rewrite page="/images/board/btn_search.gif"/>'
							alt="검색" /></td>
					</tr>
				</table>
			</form> <!--검색 끝-->
			<table width="750" border="0" cellspacing="0" cellpadding="0"
				style="border: 2px solid #50a1f0">
				<tr>
					<td>
						<!--테이블 헤더 시작-->
						<table width="746" border="0" cellspacing="0" cellpadding="0"
							class="cbg">
							<tr>
								<c:if test="${isAdmin == 'Y'}">
									<td class="t1" width="45"><input id="selectAll" type="checkbox"/></td>
									<td class="sBg" width="1"></td>
								</c:if>
								<td class="t1" width="69">번호</td>
								<td class="sBg" width="1"></td>
								<td class="t1">제목</td>
								<td class="sBg" width="1"></td>
								<td class="t1" width="99">작성자</td>
								<td class="sBg" width="1"></td>
								<td class="t1" width="99">작성일</td>
								<td class="sBg" width="1"></td>
								<td class="t1" width="70">조회수</td>
							</tr>
						</table> <!--리스트 시작-->
						<div id="mainList" style="width: 746px; z-index: 0;">
							<table id="mainTable" width="746" border="0" cellspacing="0"
								cellpadding="0">
								<c:set var="no" scope="request" value="1" />
								<jsp:useBean id="now" class="java.util.Date" />
								<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"
									var="nowDate" />
								<c:forEach var="list" items="${rsSvc_BoardQNAList}"
									varStatus="i">
									<!-- 열 배경 -->
									<c:if test="${no%2 == 0}">
										<c:set var="lineBg" scope="request" value="tbg3" />
									</c:if>
									<c:if test="${no%2 == 1}">
										<c:set var="lineBg" scope="request" value="" />
									</c:if>
									<c:set var="titleStyle" value="" />
									<c:if test="${list.isnotice == 'Y'}">
										<c:set var="titleStyle" value="font-weight:bold;" />
									</c:if>
									<tr class="${lineBg}">
										<c:if test="${isAdmin == 'Y'}">
											<td class="t1" width="45"><input type="checkbox" name="board_Idx_array" value="${list.board_Idx}"/></td>
											<td class="sBg" width="1"></td>
										</c:if>
										<td class="t2" width="69">
											<c:if test="${list.isnotice == 'Y'}">
												<c:out value="공지사항" />
											</c:if>
											<c:if test="${list.isnotice != 'Y'}">
												<c:out value="${list.board_Idx}" />
											</c:if>
										</td>
										<td class="sBg" width="1"></td>
										<td class="t3">&nbsp;
											<c:if test="${list.re_Level > 0}">
												<c:forEach begin="1" end="${list.re_Level}">
													&nbsp;
												</c:forEach>
												<img src='<html:rewrite page="/images/board/btn_re.gif"/>'
													alt="답변" align="absmiddle" style="cursor: hand" />
											</c:if>
											<c:if test="${list.issecret == 'Y' }">
												<img src="/images/board/icon_secret.gif" alt="비밀글" style="vertical-align: middle;"/>
												<c:choose>
													<c:when test="${isAdmin == 'Y' || list.userId == authID }">
														<a href="extBordQNA.act?task=info&board_Idx=${list.board_Idx}&page=${cpage}" style="${titleStyle }">
															<u><c:out value="${list.title}" /></u>
														</a>
													</c:when>
													<c:otherwise>비밀글입니다.</c:otherwise>
												</c:choose>
											</c:if>
											<c:if test="${list.issecret != 'Y' }">
												<a href="extBordQNA.act?task=info&board_Idx=${list.board_Idx}&page=${cpage}" style="${titleStyle }">
													<u><c:out value="${list.title}" /></u>
												</a>
											</c:if>
											<fmt:parseDate value="${list.wdate }" pattern="yyyy-MM-dd HH:ss" var="wDate" />
											<fmt:formatDate value="${wDate}" pattern="yyyy-MM-dd" var="wrDate" />
											<c:if test="${nowDate == wrDate}">
												&nbsp;<img src="/images/poll/poll_dot3.gif" style="width: 15px; height: 15px; vertical-align: middle;" />
											</c:if>
										</td>
										<td class="sBg" width="1"></td>
										<td class="t2" width="99"><c:out value="${list.userNm}" /></td>
										<td class="sBg" width="1"></td>
										<td class="t2" width="99">
											<fmt:parseDate value="${list.udate }" pattern="yyyy-MM-dd HH:ss" var="uDate" />
											<fmt:formatDate value="${uDate}" pattern="yyyy-MM-dd" var="udDate" />
											<c:out value="${udDate}" />
										</td>
										<td class="sBg" width="1"></td>
										<td class="t2" width="70"><c:out value="${list.counts}" /></td>
									</tr>
									<tr>
										<td colspan="13" class="lbg3"></td>
									</tr>
									<c:set var="no" scope="request" value="${no + 1}" />
								</c:forEach>
								<c:if test="${no==1}">
									<tr class="tbg3" height="21">
										<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
									</tr>
								</c:if>
							</table>
						</div> <!--리스트 끝-->
					</td>
				</tr>
			</table>
			<table width="746" border="0" cellspacing="0" cellpadding="0"
				height="20">
				<tr valign="bottom" align="center">
					<td>${page}</td>
				</tr>
			</table> <!--하단버튼 테이블 시작-->
			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr valign="bottom">
					<td align="right">
						<img src='<html:rewrite page="/images/board/btn_write.gif"/>' alt="글쓰기"
						align="absmiddle"
						onclick="location.href='<html:rewrite page="/extBordQNA.act?task=create"/>'"
						style="cursor: hand" />
						<c:if test="${isAdmin == 'Y'}">
						<img src='<html:rewrite page="/images/board/btn_del.gif"/>'
								alt="삭제" align="absmiddle"
								onclick="checkDelete()"
								style="cursor: hand" />
						</c:if>
					</td>
				</tr>
			</table> <!--하단버튼 테이블 끝-->
		</td>
	</tr>
</table>