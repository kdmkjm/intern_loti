<%@ page language="java"%>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf"%>
<script type='text/javascript' src='/editor/ckeditor.js'></script>
<script type="text/javascript" src="/common/js/common_BoardFile.js"></script>
<script language="JavaScript">
$.noConflict();
	jQuery(function(){
		// ������ ����
		CKEDITOR.replace('content',{
			customConfig: '/editor/config_editor.js'
		});
		var boardFile = new BoardFile('extBordMorgue.act', 'div_files', 'file_list', 'ProgressLayer');
	});
</script>
<body>
<html:form method="POST" action="/extBordMorgue.act?task=insert"
	enctype="multipart/form-data">
	<html:hidden property="board_Idx" />
	<html:hidden property="task" value="${task}" />
	<table width="790" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<div class="ccGroup">
					<h2 class="hide">����������</h2>
					<h1>
						<img alt="�ڷ��" src="/images/community/title_02.gif" />
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
									<td class="t1 cbg4" width="97"><span class="red">*</span>����</td>
									<td class="sBg" width="1"></td>
									<td class="t2" width="648"><html:text property="title"
											style="width:98%;" maxlength="50"></html:text></td>
								</tr>
								<tr>
									<td colspan="3" class="lbg3"></td>
								</tr>
								<tr>
									<td class="t1 cbg4" width="97">�ۼ���</td>
									<td class="sBg" width="1"></td>
									<td class="t3" width="648">&nbsp;<c:out
											value="${userName}" /></td>
								</tr>
								<tr>
									<td colspan="3" class="lbg3"></td>
								</tr>
								<tr>
									<td class="t1 cbg4" width="97">�ΰ�����</td>
									<td class="sBg" width="1"></td>
									<td class="t3" width="648">&nbsp;<input type="checkbox"
										name="isnotice" value="Y"
										<c:if test="${rsSvc_BoardMorgue.isnotice == 'Y'}">checked</c:if>>��������</input>
									</td>
								</tr>
								<tr>
									<td colspan="3" class="lbg3"></td>
								</tr>
								<tr>
									<td class="t1 cbg4" width="97" height="220"><span
										class="red">*</span>����</td>
									<td class="sBg" width="1"></td>
									<td class="t3" width="648"><textarea id="content"
												name="content" rows="15" cols="60"
												style="width: 98%; height: 100%; display: none;">${rsSvc_BoardMorgue.content}</textarea></td>
								</tr>
								<tr>
									<td colspan="3" class="lbg3"></td>
								</tr>
								<tr>
									<td class="t1 cbg4" width="97">����÷��</td>
									<td class="sBg" width="1"></td>
									<td class="t3" width="648"><input type="hidden" name="fileYN" value="N" />
										<div id="div_files"class="table">
											<ul>
												<li><input type="file" name="file"
													style="width: 300px;" /></li>
												<li><a id="FileAddBtn" style="cursor: hand;">÷������
														�߰�</a></li>
											</ul>
										</div>
										<div class="table">
											<ul>
												<li>
													<select id="file_list" multiple="multiple" style="width: 300px; height: 100px;">
														<c:if test="${rsSvc_BoardMorgue.file_IdxList != null}">
															<c:forEach items="${rsSvc_BoardMorgue.file_IdxList}" var="file">
																<option value="${file.file_Idx }">${file.fname}(${file.fsize } byte)</option>
															</c:forEach>
														</c:if>
													</select>
													<!--<br> ���� ũ�� / �ִ� ũ�� : <span id="TotalSize">0</span>MB / 10MB-->
												</li>
												<li><a id="FileDelBtn" style="cursor: hand;">÷������ ����</a></li>
											</ul>
										</div>
									</td>
								</tr>
							</table> <!--����Ʈ ��-->
						</td>
					</tr>
				</table> <!--�ϴܹ�ư ���̺� ����-->
				<table width="750" border="0" cellspacing="0" cellpadding="0"
					height="28">
					<tr valign="bottom">
						<td align="right"><c:if test="${task == 'create'}">
								<img id="SubmitBtn" src='<html:rewrite page="/images/board/btn_up3.gif"/>'
									align="absmiddle" alt="���" style="cursor: hand" />
								<img src='<html:rewrite page="/images/board/btn_cancle2.gif"/>'
									align="absmiddle" alt="���"
									onclick='location.href="<html:rewrite page="/extBordMorgue.act?task=list"/>"'
									style="cursor: hand" />
							</c:if> <c:if test="${task == 'modify'}">
								<img id="ModifyBtn" src='<html:rewrite page="/images/board/btn_save.gif"/>'
									align="absmiddle" alt="����" style="cursor: hand" />
								<img src='<html:rewrite page="/images/board/btn_cancle2.gif"/>'
									align="absmiddle" alt="���"
									onclick='location.href="<html:rewrite page="/extBordMorgue.act?task=info&board_Idx=${rsSvc_BoardMorgue.board_Idx}"/>"'
									style="cursor: hand" />
							</c:if></td>
					</tr>
				</table> <!--�ϴܹ�ư ���̺� ��-->
			</td>
		</tr>
	</table>
	<!-- �Խù� ��� �˸� ���̾� ����-->
	<div id="mask"></div>
	<div id="ProgressLayer" class="window">
		<div id="progressText">��û ó����..</div>
		<div id="progressbar" style="width: 300px;"></div>
	</div>
	<!-- �Խù� ��� �˸� ���̾� ��-->
</html:form>
</body>