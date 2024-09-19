<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
	function doSubmit(frm)
	{
		var title = frm.title.value;
		title = title.replace(" ","");
		
		if(title == "")
		{
			alert('제목을 입력하세요.');
			frm.title.focus();
			return;
		}
		if(frm.content.value == "")
		{
			alert('내용을 입력하세요.');
			frm.content.focus();
			return;
		}
		
		var do_confirm = confirm('저장하시겠습니까?');
		if(do_confirm == true)
			frm.submit();
	}
</script>
<html:form method="POST" action="/extCrs_ReqCrs.act?task=insert" onsubmit="return false;">
<html:hidden property="board_Idx"/>
<html:hidden property="isReply" value="${isReply}"/>
<html:hidden property="task" value="${task}"/>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/community/title_05.gif"/>' alt="과정요청"/></td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<!--테이블 헤더 시작-->
									<table width="746" border="0" cellspacing="0" cellpadding="0">
										<tr> 
											<td class="t1 cbg4" width="97"><span class="red">*</span>제목</td>
											<td class="sBg" width="1"></td>
											<td class="t3" width="648">&nbsp;<html:text property="title" style="width:98%;" maxlength="50"></html:text></td>
										</tr>
										<tr>
											<td colspan="3" class="lbg3"></td>
										</tr>
										<tr> 
											<td class="t1 cbg4" width="97">작성자</td>
											<td class="sBg" width="1"></td>
											<td class="t3" width="648">&nbsp;<c:out value="${userName}"/></td>
										</tr>
										<tr>
											<td colspan="3" class="lbg3"></td>
										</tr>
										<tr> 
											<td class="t1 cbg4" width="97" height="260"><span class="red">*</span>내용</td>
											<td class="sBg" width="1"></td>
											<td class="t3" width="648">&nbsp;<html:textarea property="content" style="width:98%;" rows="18"></html:textarea></td>
										</tr>
									</table>
									<!--리스트 끝-->
								</td>
							</tr>
						</table>
						<!--하단버튼 테이블 시작-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
							<tr valign="bottom"> 
								<td align="right">
									<c:if test="${task == 'create'}">
										<img src='<html:rewrite page="/images/board/btn_up3.gif"/>' align="absmiddle" alt="등록" onclick="doSubmit(document.forms[0]);" style="cursor:hand"/>		
										<img src='<html:rewrite page="/images/board/btn_cancle2.gif"/>' align="absmiddle" alt="취소" onclick='location.href="<html:rewrite page="/extCrs_ReqCrs.act?task=list"/>"' style="cursor:hand"/>
									</c:if>
									<c:if test="${task == 'modify'}">		
										<img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="저장" onclick="doSubmit(document.forms[0]);" style="cursor:hand"/>
										<img src='<html:rewrite page="/images/board/btn_cancle2.gif"/>' align="absmiddle" alt="취소" onclick='location.href="<html:rewrite page="/extCrs_ReqCrs.act?task=info&board_Idx=${rsExtCrs_ReqCrs.board_Idx}"/>"' style="cursor:hand"/>
									</c:if> 
					  		</td>
							</tr>
						</table>
		    		<!--하단버튼 테이블 끝-->
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</html:form>