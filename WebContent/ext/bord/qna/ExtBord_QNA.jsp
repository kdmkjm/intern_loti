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
			alert('������ �Խù��� �������ּ���');
		}
		else{
			if(confirm('�����Ͻðڽ��ϱ�?')){
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
				<h2 class="hide">����������</h2>
				<h1>
					<img alt="Q&amp;A" src="/images/community/title_01.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<!--�˻� -->
			<form method="POST"
				action='<html:rewrite page="/extBordQNA.act?task=list"/>'>
				<table width="750" border="0" cellspacing="0" cellpadding="0">
					<tr align="right" valign="top">
						<td height="20" valign="middle"><select name="searchType">
								<option value="00001" selected>����</option>
								<option value="00002">����</option>
								<option value="00003">�ۼ���</option>
						</select></td>
						<td width="130" class="s2"><input type="text"
							name="searchKeyword" title="����" class="inputText"
							value="${searchKeyword}" /></td>
						<td width="60"><input type="image"
							src='<html:rewrite page="/images/board/btn_search.gif"/>'
							alt="�˻�" /></td>
					</tr>
				</table>
			</form> <!--�˻� ��-->
			<table width="750" border="0" cellspacing="0" cellpadding="0"
				style="border: 2px solid #50a1f0">
				<tr>
					<td>
						<!--���̺� ��� ����-->
						<table width="746" border="0" cellspacing="0" cellpadding="0"
							class="cbg">
							<tr>
								<c:if test="${isAdmin == 'Y'}">
									<td class="t1" width="45"><input id="selectAll" type="checkbox"/></td>
									<td class="sBg" width="1"></td>
								</c:if>
								<td class="t1" width="69">��ȣ</td>
								<td class="sBg" width="1"></td>
								<td class="t1">����</td>
								<td class="sBg" width="1"></td>
								<td class="t1" width="99">�ۼ���</td>
								<td class="sBg" width="1"></td>
								<td class="t1" width="99">�ۼ���</td>
								<td class="sBg" width="1"></td>
								<td class="t1" width="70">��ȸ��</td>
							</tr>
						</table> <!--����Ʈ ����-->
						<div id="mainList" style="width: 746px; z-index: 0;">
							<table id="mainTable" width="746" border="0" cellspacing="0"
								cellpadding="0">
								<c:set var="no" scope="request" value="1" />
								<jsp:useBean id="now" class="java.util.Date" />
								<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"
									var="nowDate" />
								<c:forEach var="list" items="${rsSvc_BoardQNAList}"
									varStatus="i">
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
											<td class="t1" width="45"><input type="checkbox" name="board_Idx_array" value="${list.board_Idx}"/></td>
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
										<td class="t3">&nbsp;
											<c:if test="${list.re_Level > 0}">
												<c:forEach begin="1" end="${list.re_Level}">
													&nbsp;
												</c:forEach>
												<img src='<html:rewrite page="/images/board/btn_re.gif"/>'
													alt="�亯" align="absmiddle" style="cursor: hand" />
											</c:if>
											<c:if test="${list.issecret == 'Y' }">
												<img src="/images/board/icon_secret.gif" alt="��б�" style="vertical-align: middle;"/>
												<c:choose>
													<c:when test="${isAdmin == 'Y' || list.userId == authID }">
														<a href="extBordQNA.act?task=info&board_Idx=${list.board_Idx}&page=${cpage}" style="${titleStyle }">
															<u><c:out value="${list.title}" /></u>
														</a>
													</c:when>
													<c:otherwise>��б��Դϴ�.</c:otherwise>
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
						<img src='<html:rewrite page="/images/board/btn_write.gif"/>' alt="�۾���"
						align="absmiddle"
						onclick="location.href='<html:rewrite page="/extBordQNA.act?task=create"/>'"
						style="cursor: hand" />
						<c:if test="${isAdmin == 'Y'}">
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
</table>