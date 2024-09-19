<%@ page language="java"%>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf"%>
<script type="text/javascript" src="/editor/ckeditor.js"></script>
<script type="text/javascript" src="/common/js/jquery-1.7.1.min.js"></script>
<script language="JavaScript">
$.noConflict();
jQuery(function(){
	// ������ ����
	CKEDITOR.replace('content',{
		customConfig: '/editor/config_editor.js'
	});
});
	function doSubmit(frm)
	{
		jQuery('#content').val(CKEDITOR.instances.content.getData());
		
		var do_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(do_confirm == true)
			frm.submit();
	}
</script>
<body>
<html:form method="POST" action="/extBordAfNote.act?task=insert"
	onsubmit="return false;">
	<html:hidden property="board_Idx" />
	<html:hidden property="isReply" value="${isReply}" />
	<html:hidden property="task" value="${task}" />
	<table width="790" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<div class="ccGroup">
					<h2 class="hide">����������</h2>
					<h1>
						<img alt="�����ı�" src="/images/community/title_03.gif" />
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
									<td class="t3" width="648">&nbsp;<html:text
											property="title" style="width:98%;" maxlength="50"></html:text></td>
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
									<td class="t3" width="648">&nbsp;
										<c:if test="${isAdmin == 'Y'}">
											<input type="checkbox" name="isnotice" value="Y" <c:if test="${rsSvc_BoardNotice.isnotice == 'Y'}">checked</c:if>/>��������
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="3" class="lbg3"></td>
								</tr>
								<tr>
									<td class="t1 cbg4" width="97" height="260"><span
										class="red">*</span>����</td>
									<td class="sBg" width="1"></td>
									<td class="t3" width="648"><textarea id="content"
												name="content" rows="15" cols="60"
												style="width: 98%; height: 100%; display: none;">${rsSvc_BoardAfNote.content}</textarea></td>
								</tr>
							</table> <!--����Ʈ ��-->
						</td>
					</tr>
				</table> <!--�ϴܹ�ư ���̺� ����-->
				<table width="750" border="0" cellspacing="0" cellpadding="0"
					height="28">
					<tr valign="bottom">
						<td align="right"><c:if test="${task == 'create'}">
								<img src='<html:rewrite page="/images/board/btn_up3.gif"/>'
									align="absmiddle" alt="���"
									onclick="doSubmit(document.forms[0]);" style="cursor: hand" />
								<img src='<html:rewrite page="/images/board/btn_cancle2.gif"/>'
									align="absmiddle" alt="���"
									onclick='location.href="<html:rewrite page="/extBordAfNote.act?task=list"/>"'
									style="cursor: hand" />
							</c:if> <c:if test="${task == 'modify'}">
								<img src='<html:rewrite page="/images/board/btn_save.gif"/>'
									align="absmiddle" alt="����"
									onclick="doSubmit(document.forms[0]);" style="cursor: hand" />
								<img src='<html:rewrite page="/images/board/btn_cancle2.gif"/>'
									align="absmiddle" alt="���"
									onclick='location.href="<html:rewrite page="/extBordAfNote.act?task=info&board_Idx=${rsSvc_BoardAfNote.board_Idx}"/>"'
									style="cursor: hand" />
							</c:if></td>
					</tr>
				</table> <!--�ϴܹ�ư ���̺� ��-->
			</td>
		</tr>
	</table>
</html:form>
</body>