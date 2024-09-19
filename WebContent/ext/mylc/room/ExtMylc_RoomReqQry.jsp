<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
	function doDelete(num)
	{
		var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(del_confirm == true)
		{
			var url = '${pageContext.request.contextPath}/extMylcRoom.act?task=delete&lendSeq='+num;
			document.location.href = url;
		}
		else
		{
			return;
		}
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
</tr>
<tr>
	<td>
		<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>' width="200"><img src='<html:rewrite page="/images/resources/title_09-3.gif"/>' alt="������ �뿩��û"/></td>
			<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>' width="550" valign="bottom">
				<table width="308" border="0" cellspacing="0" cellpadding="0" align="right">
				<tr> 
					<td width="103">
						<img name="Image10" border="0" src='<html:rewrite page="/images/resources/tab_01.gif"/>' alt="������ �뿩�ȳ�" 
							onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=lentInfo"/>'"  
							onMouseOut="MM_swapImgRestore()" 
							onMouseOver="MM_swapImage('Image10','','<html:rewrite page="/images/resources/tab_01_over.gif"/>',1)" style="cursor:hand"/>
					</td>
					<td width="103">
						<img name="Image11" border="0" src='<html:rewrite page="/images/resources/tab_02.gif"/>' alt="�뿩��Ȳ"
							onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=month"/>'"  
							onMouseOut="MM_swapImgRestore()" 
							onMouseOver="MM_swapImage('Image11','','<html:rewrite page="/images/resources/tab_02_over.gif"/>',1)" style="cursor:hand"/>
					</td>
					<td width="102">
						<img name="Image12" border="0" src='<html:rewrite page="/images/resources/tab_03_over.gif"/>' alt="�뿩��û" 
							onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=list"/>'"  
							onMouseOut="MM_swapImgRestore()" 
							onMouseOver="MM_swapImage('Image12','','<html:rewrite page="/images/resources/tab_03_over.gif"/>',1)" style="cursor:hand"/>
					</td>
				</tr>
	      </table>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="15"></td>
		</tr>
		<tr> 
			<td class="stitle" colspan="2"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" />������뿩��û - ��</td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
				<tr>
					<td>
						<!--���̺� ��� ����-->
						<html:hidden property="lendSeq" value="${rsExtMylc_RoomReq.lendSeq}"/>
						<table width="746" border="0" cellspacing="0" cellpadding="0">
							<tr> 
								<td class="t1 cbg4" width="109" height="25">���ǽ�</td>
								<td class="sBg"></td>
								<td class="t3" width="230">&nbsp;<c:out value="${rsExtMylc_RoomReq.roomNoName}"/></td>
								<td class="sBg"></td>
								<td class="t1 cbg4" width="109">�뿩��</td>
								<td class="sBg"></td>
								<td class="t3" width="295">
									&nbsp;<c:out value="${rsExtMylc_RoomReq.reqName}"/>
									<c:if test="${rsExtMylc_RoomReq.reqOrgan ne null}">(${rsExtMylc_RoomReq.reqOrgan})</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="7" class="lbg3"></td>
							</tr>
							<tr> 
								<td class="t1 cbg4" height="25">�뿩����</td>
								<td class="sBg"></td>
								<td class="t3">&nbsp;<c:out value="${rsExtMylc_RoomReq.lendFrom}"/></td>
								<td class="sBg"></td>
								<td class="t1 cbg4">�뿩����</td>
								<td class="sBg"></td>
								<td class="t3">&nbsp;<c:out value="${rsExtMylc_RoomReq.lendTo}"/></td>
							</tr>
							<tr>
								<td colspan="7" class="lbg3"></td>
							</tr>
							<tr> 
								<td class="t1 cbg4" height="25">����ó</td>
								<td class="sBg"></td>
								<td class="t3">&nbsp;<c:out value="${rsExtMylc_RoomReq.reqPhone}"/></td>
								<td class="sBg"></td>
								<td class="t1 cbg4">����ο�</td>
								<td class="sBg"></td>
								<td class="t3">&nbsp;<c:out value="${rsExtMylc_RoomReq.lendPeople}"/></td>
							</tr>
							<tr>
								<td colspan="7" class="lbg3"></td>
							</tr>
							<tr> 
								<td class="t1 cbg4" height="25">����</td>
								<td class="sBg"></td>
								<td class="t3" colspan="5">&nbsp;${rsExtMylc_RoomReq.status}</td>
							</tr>
							<tr>
								<td colspan="7" class="lbg3"></td>
							</tr>
							<tr> 
								<td class="t1 cbg4" height="25">�뿩����</td>
								<td class="sBg"></td>
								<td class="t2" colspan="5">
									<html:textarea property="lendWhy" value="${rsExtMylc_RoomReq.lendWhy}" style="width:98%;" rows="5" readonly="true"></html:textarea>
								</td>
							</tr>
						</table>
						<!--���̺� ��� ��-->
					</td>
				</tr>
				</table>
				<!--	�Խù� �Ʒ� ��ư ����	-->
				<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
				<tr valign="bottom"> 
					<td align="right">
						<c:if test="${(isAuth == 'Y' && rsExtMylc_RoomReq.statusCode == '00001') || isAdmin == 'Y'}">
	            <img src='<html:rewrite page="/images/board/btn_modify4.gif"/>' alt="����" onclick='location.href="<html:rewrite page="/extMylcRoom.act?task=modify&lendSeq=${rsExtMylc_RoomReq.lendSeq}"/>"' style="cursor:hand" align="absmiddle"/>
							<img src='<html:rewrite page="/images/board/btn_del.gif"/>' alt="����" onclick="doDelete(${rsExtMylc_RoomReq.lendSeq});" style="cursor:hand" align="absmiddle"/>
						</c:if>
						<img src='<html:rewrite page="/images/board/btn_list.gif"/>' alt="���" onclick='location.href="<html:rewrite page="/extMylcRoom.act?task=list"/>"' style="cursor:hand" align="absmiddle"/>
					</td>
				</tr>
				</table>
				<!--�Խù� �Ʒ� ��ư ��-->
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>