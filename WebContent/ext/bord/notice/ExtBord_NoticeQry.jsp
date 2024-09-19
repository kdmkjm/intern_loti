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
		 
		// ������ ����
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
			writeBtn : 'a[title="����ۼ�"]',
			updateBtn : 'a[title="��ۼ���"]',
			deleteBtn : 'a[title="��ۻ���"]'
		});
		
		
	});
	function doDelete(num)
	{
		var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
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
					<h2 class="hide">����������</h2>
					<h1>
						<img alt="��������" src="/images/community/title_06.gif" />
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
							<!--���̺� ��� ����-->
							<table width="746" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="t1 cbg4" width="97">����</td>
									<td class="sBg" width="1"></td>
									<td class="t3" width="648" colspan="5">&nbsp;<c:out value="${rsSvc_BoardNotice.title}" /></td>
								</tr> 
								<tr>
									<td colspan="7" class="lbg3"></td>
								</tr>
								<tr>
									<td class="t1 cbg4" width="97">�ۼ���</td>
									<td class="sBg" width="1"></td>
									<td class="t3" width="274">&nbsp;<c:out value="${rsSvc_BoardNotice.userNm}" /></td>
									<td class="sBg" width="1"></td>
									<td class="t1 cbg4" width="97">�ۼ���</td>
									<td class="sBg" width="1"></td>
									<td class="t3" width="275">&nbsp;<c:out value="${rsSvc_BoardNotice.udate}" /></td>
								</tr>
								<tr>
									<td colspan="7" class="lbg3"></td>
								</tr>
								<tr>
									<td class="t1 cbg4" width="97">��ȸ��</td>
									<td class="sBg" width="1"></td>
									<td class="t3" colspan="5">&nbsp;<c:out value="${rsSvc_BoardNotice.counts}" /></td>
								</tr>
								<tr>
									<td colspan="7" class="lbg3"></td>
								</tr>
								<tr>
									<td class="t1 cbg4" width="97" height="220">����</td>
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
										<td class="t1 cbg4" width="97">÷������</td>
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
							<!--����Ʈ ��-->
						</td>
					</tr>
				</table> 
				<!-- �ڸ�Ʈ ���� ���� -->
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
											<td>������ ����Դϴ�.</td>
											<td width="40" align="right"></td>
										</tr>
									</c:if>
									<c:if test="${item.isdeleted != 'Y' }">
										<tr>
											<c:if test="${item.re_Level > 0}"><td width="20">��</td></c:if>
											<td colspan="2">${item.userNm} (${item.wdate })</td>
										</tr>
										<tr>
											<td height="5"></td>
										</tr>
										<tr>
											<c:if test="${item.re_Level > 0}"><td width="20"></td></c:if>
											<td class="commentContent"><c:out value="${item.content }"/></td>
											<td width="40" align="right">
													<a title="����ۼ�" style="cursor: hand;">���</a>
												<c:if test="${isAdmin == 'Y' || authID == item.userId}">
													<br>
													<a title="��ۼ���" style="cursor: hand;">����</a>
													<br>
													<a title="��ۻ���" style="cursor: hand;">����</a>
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
						<li style="float:right;"><input type="button" value="�ǰ߾���"></li>
					</ul>
				</div>
				-->
				 <!-- �ڸ�Ʈ ���� �� --> 
				 
				 <!--�ϴܹ�ư ���̺� ����-->
				<table width="750" border="0" cellspacing="0" cellpadding="0"
					height="28">
					<tr valign="bottom">
						<td align="right">
							<c:if test="${isAdmin == 'Y' || isAuth == 'Y'}">
								<img src='<html:rewrite page="/images/board/btn_modify4.gif"/>' align="absmiddle" alt="����" onclick='location.href="<html:rewrite page="/extBordNotice.act?task=modify&board_Idx=${rsSvc_BoardNotice.board_Idx}"/>"' style="cursor: hand" />
								<img src='<html:rewrite page="/images/board/btn_del.gif"/>' align="absmiddle" alt="����" onclick="doDelete(${rsSvc_BoardNotice.board_Idx});" style="cursor: hand" />
							</c:if>
							<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="���" onclick='location.href="<html:rewrite page="/extBordNotice.act?task=list"/>"' style="cursor: hand" />
						</td>
					</tr>
				</table> 
				<!--�ϴܹ�ư ���̺� ��-->
			</td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
		<!-- �Խñ� ����Ʈ ���� -->
		<tr>
			<td>
				<!--�˻� -->
				<form method="POST"
					action='<html:rewrite page="/extBordNotice.act?task=list"/>'>
					<table width="750" border="0" cellspacing="0" cellpadding="0">
						<tr align="right" valign="top">
							<td height="20" valign="middle"><select name="searchType">
									<option value="00001" selected>����</option>
									<option value="00002">����</option>
									<option value="00003">�ۼ���</option>
							</select></td>
							<td width="130" class="s2"><input type="text" name="searchKeyword" title="����" class="inputText" value="${searchKeyword}" /></td>
							<td width="60"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" /></td>
						</tr>
					</table>
				</form> <!--�˻� ��-->
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #50a1f0">
					<tr>
						<td>
							<!--���̺� ��� ����-->
							<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
								<tr>
									<c:if test="${isAdmin == 'Y'}">
										<td class="t1" width="50"><input id="selectAll" type="checkbox"/></td>
										<td class="sBg" width="1"></td>
									</c:if>
									<td class="t1" width="69">��ȣ</td>
									<td class="sBg" width="1"></td>
									<td class="t1">����</td>
									<td class="sBg" width="1"></td>
									<td class="t1" width="69">÷������</td>
									<td class="sBg" width="1"></td>
									<td class="t1" width="79">�ۼ���</td>
									<td class="sBg" width="1"></td>
									<td class="t1" width="99">�ۼ���</td>
									<td class="sBg" width="1"></td>
									<td class="t1" width="70">��ȸ��</td>
								</tr>
							</table> <!--����Ʈ ����-->
							<div id="mainList" style="width: 746px; z-index: 0;">
								<table id="mainTable" width="746" border="0" cellspacing="0" cellpadding="0">
									<c:set var="no" scope="request" value="1" />
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />
									<c:forEach var="list" items="${rsSvc_BoardNoticeList}" varStatus="i">
										<!-- �� ��� -->
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
													<c:out value="��������" />
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
													&nbsp;<img src="/images/board/etc.gif" style="vertical-align: middle;" alt="÷������" title="÷������" />
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
											<td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
										</tr>
									</c:if>
								</table>
							</div> <!--����Ʈ ��-->
						</td>
					</tr>
				</table>
				<table width="746" border="0" cellspacing="0" cellpadding="0"
					height="20">
					<tr valign="bottom" align="center">
						<td>${page}</td>
					</tr>
				</table> <!--�ϴܹ�ư ���̺� ����-->
				<table width="750" border="0" cellspacing="0" cellpadding="0">
					<tr valign="bottom">
						<td align="right">
							<c:if test="${isAdmin == 'Y'}">
								<img src='<html:rewrite page="/images/board/btn_write.gif"/>' alt="�۾���" align="absmiddle" onclick="location.href='<html:rewrite page="/extBordNotice.act?task=create"/>'" style="cursor: hand" />
								<img src='<html:rewrite page="/images/board/btn_del.gif"/>'
								alt="����" align="absmiddle"
								onclick="checkDelete()"
								style="cursor: hand" />
							</c:if>
						</td>
					</tr>
				</table> <!--�ϴܹ�ư ���̺� ��-->
			</td>
		</tr>
		<!-- �Խñ� ����Ʈ �� -->
	</table>
</body>