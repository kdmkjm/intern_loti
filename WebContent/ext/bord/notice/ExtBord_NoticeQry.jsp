<%@ page language="java"%>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type='text/javascript' src='/editor/ckeditor.js'></script>
<script type="text/javascript"
	src='<html:rewrite page="/common/js/common_BoardComment.js"/>'></script>
<script type="text/javascript">

$.noConflict();
	jQuery(function(){
		 
		// 에디터 세팅
		CKEDITOR.replace('content',{
			customConfig: '/editor/config_view.js'
		});
		CKEDITOR.on('instanceReady', function( ev ){
			ev.editor.setReadOnly( true );
		});
		
		jQuery('#selectAll').change(function(){
			var $checkboxs = jQuery('#mainTable input[name="board_Idx_array"]');
			if(this.checked){
				$checkboxs.attr('checked','checked');
			}
			else{
				$checkboxs.attr('checked',false);
			}
		});
		
		var boardComment = new BoardComment('extBordNotice.act','board_Idx=${rsSvc_BoardNotice.board_Idx}&page=${cpage}', 'commentList', 'commentForm');
		boardComment.setEvents({
			submitBtn : 'input[type="button"]',
			writeBtn : 'a[title="댓글작성"]',
			updateBtn : 'a[title="댓글수정"]',
			deleteBtn : 'a[title="댓글삭제"]'
		});
		
		
	});
	function doDelete(num)
	{
		var del_confirm = confirm('삭제하시겠습니까?');
		if(del_confirm == true)
		{
			var url = '${pageContext.request.contextPath}/extBordNotice.act?task=delete&board_Idx='+num;
			document.location.href = url;
		}
		else
		{
			return;
		}
	}
</script>
<body>
	<table width="790" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<div class="ccGroup">
					<h2 class="hide">현재경로정보</h2>
					<h1>
						<img alt="공지사항" src="/images/community/title_06.gif" />
					</h1>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<table width="750" border="0" cellspacing="0" cellpadding="0"
					style="border: 2px solid #91B475">
					<tr>
						<td>
							<!--테이블 헤더 시작-->
							<table width="746" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="t1 cbg4" width="97">제목</td>
									<td class="sBg" width="1"></td>
									<td class="t3" width="648" colspan="5">&nbsp;<c:out value="${rsSvc_BoardNotice.title}" /></td>
								</tr> 
								<tr>
									<td colspan="7" class="lbg3"></td>
								</tr>
								<tr>
									<td class="t1 cbg4" width="97">작성자</td>
									<td class="sBg" width="1"></td>
									<td class="t3" width="274">&nbsp;<c:out value="${rsSvc_BoardNotice.userNm}" /></td>
									<td class="sBg" width="1"></td>
									<td class="t1 cbg4" width="97">작성일</td>
									<td class="sBg" width="1"></td>
									<td class="t3" width="275">&nbsp;<c:out value="${rsSvc_BoardNotice.udate}" /></td>
								</tr>
								<tr>
									<td colspan="7" class="lbg3"></td>
								</tr>
								<tr>
									<td class="t1 cbg4" width="97">조회수</td>
									<td class="sBg" width="1"></td>
									<td class="t3" colspan="5">&nbsp;<c:out value="${rsSvc_BoardNotice.counts}" /></td>
								</tr>
								<tr>
									<td colspan="7" class="lbg3"></td>
								</tr>
								<tr>
									<td class="t1 cbg4" width="97" height="220">내용</td>
									<td class="sBg" width="1"></td>
									<td class="t3" width="648" colspan="5" valign="top">
										<textarea id="content" name="content" rows="15" cols="80" style="display: none;">${rsSvc_BoardNotice.content}</textarea>
									</td>
								</tr>
								<c:if test="${rsSvc_BoardNotice.file_IdxList != null}">
									<tr>
										<td colspan="7" class="lbg3"></td>
									</tr>
									<tr>
										<td class="t1 cbg4" width="97">첨부파일</td>
										<td class="sBg" width="1"></td>
										<td class="t3" width="648" colspan="5">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<c:forEach items="${rsSvc_BoardNotice.file_IdxList}" var="file" varStatus="i">
													<tr>
														<td><c:set var="filetype" scope="request" value="N" />
															<c:if test="${file.ftype == 'hwp' || file.ftype == 'ppt' || 
																			file.ftype == 'xls' || file.ftype == 'doc' || 
																			file.ftype == 'txt' || file.ftype == 'pdf' || 
																			file.ftype == 'bmp' || file.ftype == 'gif' || 
																			file.ftype == 'jpg'}">
																<c:set var="filetype" scope="request" value="Y" />
															</c:if> &nbsp; 
															<c:if test="${filetype == 'Y'}">
																<img src='<html:rewrite page="/images/board/${file.ftype}.gif"/>' alt="${file.ftype}" align="absmiddle" />
															</c:if>
															<c:if test="${filetype == 'N'}">
																<img src='<html:rewrite page="/images/board/etc.gif"/>' alt="etc" align="absmiddle" />
															</c:if>
															<a href='<html:rewrite page="/extBordNotice.act?task=downloadAttachment&file_Idx=${file.file_Idx}"/>'>
																<c:out value="${file.fname}" />[<c:out value="${file.fcount}"></c:out>]
															</a>
															<c:out value="(${file.fsize} byte)" />
														</td>
													</tr>
													<c:set var="count" value="${i.count}"></c:set>
												</c:forEach>
												<c:if test="${count == null}">
													<tr>
														<td></td>
													</tr>
												</c:if>
											</table>
										</td>
									</tr>
								</c:if>
							</table> 
							<!--리스트 끝-->
						</td>
					</tr>
				</table> 
				<!-- 코멘트 영역 시작 -->
				<!--
				<c:set var="commentListWidth" value="720"></c:set>
				<div id="commentList" style="width: ${commentListWidth}px;">
					<c:forEach items="${rsSvc_BoardNotice.commentList}" var="item">
						<div class="row">
							<c:forEach begin="0" end="${item.re_Level}" varStatus="j">
								<c:set var="leftTab" value="${j.current * 30}"></c:set>
							</c:forEach>
							<div class="leftMargin" style="width:${leftTab}px;">
								&nbsp;<input type="hidden" name="comment_Idx" value="${item.comment_Idx }" />
							</div>
							<div style="width:${commentListWidth-leftTab}px;">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="5"></td>
									</tr>
									<c:if test="${item.isdeleted == 'Y' }">
										<tr>
											<c:if test="${item.re_Level > 0}"><td width="20"></td></c:if>
											<td>삭제된 댓글입니다.</td>
											<td width="40" align="right"></td>
										</tr>
									</c:if>
									<c:if test="${item.isdeleted != 'Y' }">
										<tr>
											<c:if test="${item.re_Level > 0}"><td width="20">└</td></c:if>
											<td colspan="2">${item.userNm} (${item.wdate })</td>
										</tr>
										<tr>
											<td height="5"></td>
										</tr>
										<tr>
											<c:if test="${item.re_Level > 0}"><td width="20"></td></c:if>
											<td class="commentContent"><c:out value="${item.content }"/></td>
											<td width="40" align="right">
													<a title="댓글작성" style="cursor: hand;">댓글</a>
												<c:if test="${isAdmin == 'Y' || authID == item.userId}">
													<br>
													<a title="댓글수정" style="cursor: hand;">수정</a>
													<br>
													<a title="댓글삭제" style="cursor: hand;">삭제</a>
												</c:if>
											</td>
										</tr>
									</c:if>
								</table>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="table" id="commentForm" style="clear: both;">
					<ul>
						<li><textarea name="content" rows="6" cols="120" style="width:100%;"></textarea></li>
					</ul>
					<ul>
						<li style="float:right;"><input type="button" value="의견쓰기"></li>
					</ul>
				</div>
				-->
				 <!-- 코멘트 영역 끝 --> 
				 
				 <!--하단버튼 테이블 시작-->
				<table width="750" border="0" cellspacing="0" cellpadding="0"
					height="28">
					<tr valign="bottom">
						<td align="right">
							<c:if test="${isAdmin == 'Y' || isAuth == 'Y'}">
								<img src='<html:rewrite page="/images/board/btn_modify4.gif"/>' align="absmiddle" alt="수정" onclick='location.href="<html:rewrite page="/extBordNotice.act?task=modify&board_Idx=${rsSvc_BoardNotice.board_Idx}"/>"' style="cursor: hand" />
								<img src='<html:rewrite page="/images/board/btn_del.gif"/>' align="absmiddle" alt="삭제" onclick="doDelete(${rsSvc_BoardNotice.board_Idx});" style="cursor: hand" />
							</c:if>
							<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록" onclick='location.href="<html:rewrite page="/extBordNotice.act?task=list"/>"' style="cursor: hand" />
						</td>
					</tr>
				</table> 
				<!--하단버튼 테이블 끝-->
			</td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
		<!-- 게시글 리스트 시작 -->
		<tr>
			<td>
				<!--검색 -->
				<form method="POST"
					action='<html:rewrite page="/extBordNotice.act?task=list"/>'>
					<table width="750" border="0" cellspacing="0" cellpadding="0">
						<tr align="right" valign="top">
							<td height="20" valign="middle"><select name="searchType">
									<option value="00001" selected>제목</option>
									<option value="00002">내용</option>
									<option value="00003">작성자</option>
							</select></td>
							<td width="130" class="s2"><input type="text" name="searchKeyword" title="제목" class="inputText" value="${searchKeyword}" /></td>
							<td width="60"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" /></td>
						</tr>
					</table>
				</form> <!--검색 끝-->
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #50a1f0">
					<tr>
						<td>
							<!--테이블 헤더 시작-->
							<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
								<tr>
									<c:if test="${isAdmin == 'Y'}">
										<td class="t1" width="50"><input id="selectAll" type="checkbox"/></td>
										<td class="sBg" width="1"></td>
									</c:if>
									<td class="t1" width="69">번호</td>
									<td class="sBg" width="1"></td>
									<td class="t1">제목</td>
									<td class="sBg" width="1"></td>
									<td class="t1" width="69">첨부파일</td>
									<td class="sBg" width="1"></td>
									<td class="t1" width="79">작성자</td>
									<td class="sBg" width="1"></td>
									<td class="t1" width="99">작성일</td>
									<td class="sBg" width="1"></td>
									<td class="t1" width="70">조회수</td>
								</tr>
							</table> <!--리스트 시작-->
							<div id="mainList" style="width: 746px; z-index: 0;">
								<table id="mainTable" width="746" border="0" cellspacing="0" cellpadding="0">
									<c:set var="no" scope="request" value="1" />
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />
									<c:forEach var="list" items="${rsSvc_BoardNoticeList}" varStatus="i">
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
												<td class="t1" width="50"><input type="checkbox" name="board_Idx_array" value="${list.board_Idx}"/></td>
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
											<td class="t3">
												&nbsp; <c:if test="${rsSvc_BoardNotice.board_Idx == list.board_Idx}">
													<span style="color: red; font-weight: bold;"><c:out	value="${list.title}" /></span>
												</c:if> 
												<c:if test="${rsSvc_BoardNotice.board_Idx != list.board_Idx}">
													<a href="extBordNotice.act?task=info&board_Idx=${list.board_Idx}&page=${cpage}" style="${titleStyle }">
														<u><c:out value="${list.title}" /></u>
													</a>
												</c:if>
												<c:if test="${list.commentCount != null}">
													<span style="color: #FF7F50;"><c:out value="[${list.commentCount }]"></c:out></span>
												</c:if>
												<fmt:parseDate value="${list.wdate }" pattern="yyyy-MM-dd HH:ss" var="wDate" />
												<fmt:formatDate value="${wDate}" pattern="yyyy-MM-dd" var="wrDate" />
												<c:if test="${nowDate == wrDate}">
													&nbsp;<img src="/images/poll/poll_dot3.gif" style="width: 15px; height: 15px; vertical-align: middle;" />
												</c:if>
											</td>
											<td class="sBg" width="1"></td>
											<td class="t1" width="69">
												<c:if test="${list.fcount > 0}">
													&nbsp;<img src="/images/board/etc.gif" style="vertical-align: middle;" alt="첨부파일" title="첨부파일" />
												</c:if>
											</td>
											<td class="sBg" width="1"></td>
											<td class="t2" width="79"><c:out value="${list.userNm}" /></td>
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
							<c:if test="${isAdmin == 'Y'}">
								<img src='<html:rewrite page="/images/board/btn_write.gif"/>' alt="글쓰기" align="absmiddle" onclick="location.href='<html:rewrite page="/extBordNotice.act?task=create"/>'" style="cursor: hand" />
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
		<!-- 게시글 리스트 끝 -->
	</table>
</body>