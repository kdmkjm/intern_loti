<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   ������ ������ ���� ���� �ڵ� 
		tresize(215);
	}
	var flag = false; 
	var saveRow;
	
	function modifyRoomLent(row)
	{
		// ���� ���� ��ư �����ٸ� flag ���� true��. ���� row ������ ����Լ� ȣ��
		if(flag == true)
		{
			modifyCancel(saveRow);
		}
		
		var html1 = "<img src='<html:rewrite page='/images/board/btn_save2.gif'/>' name='saveBt' value='����' onclick='modifySave(" + row + ");' style='cursor:hand'>&nbsp;";
		   html1 += "<img src='<html:rewrite page='/images/board/btn_cancle.gif'/>' name='cancelBt' value='���' onclick='modifyCancel(" + row + ");' style='cursor:hand'>";
		if(document.all.L1[1] != null)
		{
			document.all.L1[row-1].style.display = 'none';
			document.all.L2[row-1].style.display = "";
			document.all.modify[row-1].innerHTML = html1;
		}
		else
		{
			document.all.L1.style.display = 'none';
			document.all.L2.style.display = "";
			
			document.all.modify.innerHTML = html1;			
		}
		// ���� ��ư ���� ��
		flag = true;
		// ���� row�� ���
		saveRow = row;
		tresize(226);
	}
	
	function modifySave(row)
	{
		var do_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(do_confirm != true)
			return;
		if(document.all.L1[1] != null) 
		{
			var value = document.all.editStatUs[row-1].value;
			document.all.sUs[row-1].innerHTML = value;
			var lendSeq = document.all.lendSeq[row-1].value;
			var html = "<img src='<html:rewrite page='/images/board/btn_modify.gif'/>' align='absmiddle' alt='����' onclick='modifyRoomLent("+row+");' style='cursor:hand'/>&nbsp;";
			   html += "<img src='<html:rewrite page='/images/board/btn_del2.gif'/>' align='absmiddle' alt='����' onclick='doDelete("+lendSeq+");' style='cursor:hand'/>";
			document.all.modify[row-1].innerHTML = html;
	
		}
		else
		{
			var value = document.all.editStatUs.value;
			document.all.sUs.innerHTML = value;
			var lendSeq = document.all.lendSeq.value;		
			var html = "<img src='<html:rewrite page='/images/board/btn_modify.gif'/>' align='absmiddle' alt='����' onclick='modifyRoomLent("+row+");' style='cursor:hand'/>&nbsp;";
			   html += "<img src='<html:rewrite page='/images/board/btn_del2.gif'/>' align='absmiddle' alt='����' onclick='doDelete("+lendSeq+");' style='cursor:hand'/>";
			document.all.modify.innerHTML = html;
	
		}
		var statUs = value;
		var searchKeywordDate = document.all.searchKeywordDate.value;
		var url = '${pageContext.request.contextPath}/rscRoom.act?task=insert&searchKeywordDate=' + searchKeywordDate + '&lendSeq=' + lendSeq + '&statUs=' + statUs;

		document.location.href = url;
	}
	
	function modifyCancel(row)
	{
		if(document.all.L1[1] != null) 
		{
			var value = document.all.editStatUs[row-1].value;
			var lendSeq = document.all.lendSeq[row-1].value;
			document.all.upSUs[row-1].innerHTML = document.all.statUs[row-1].value;
			var html = "<img src='<html:rewrite page='/images/board/btn_modify.gif'/>' align='absmiddle' alt='����' onclick='modifyRoomLent("+row+");' style='cursor:hand'/>&nbsp;";
			   html += "<img src='<html:rewrite page='/images/board/btn_del2.gif'/>' align='absmiddle' alt='����' onclick='doDelete("+lendSeq+");' style='cursor:hand'/>";
			document.all.modify[row-1].innerHTML = html;
			
			document.all.L1[row-1].style.display = '';
			document.all.L2[row-1].style.display = 'none';
		}
		else
		{
			var value = document.all.editStatUs.value;
			var lendSeq = document.all.lendSeq.value;
			document.all.upSUs.innerHTML = document.all.statUs.value;
			var html = "<img src='<html:rewrite page='/images/board/btn_modify.gif'/>' align='absmiddle' alt='����' onclick='modifyRoomLent("+row+");' style='cursor:hand'/>&nbsp;";
			   html += "<img src='<html:rewrite page='/images/board/btn_del2.gif'/>' align='absmiddle' alt='����' onclick='doDelete("+lendSeq+");' style='cursor:hand'/>";
			document.all.modify.innerHTML = html;
			
			document.all.L1.style.display = '';
			document.all.L2.style.display = 'none';
		}
		// �����Ϸ�.
		flag = false;
	}
	
	function doDelete(num)
	{
		var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(del_confirm == true)
		{
			var url = '${pageContext.request.contextPath}/rscRoom.act?task=delete&lendSeq='+num;
			document.location.href = url;
		}
		else
		{
			return;
		}
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
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/resources/title_04.gif"/>' alt="���������"/></td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr> 
					<td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="8" align="absmiddle">������  �뿩</td>
				</tr>
				<tr>
					<td>
						<!--��� �˻� ���̺� ����-->
						<html:form method="POST" action="rscRoom.act?task=list">
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
					  	<tr>
					  		<td width="75" class="s1">�� ��</td>
								<td class="sBg" width="1"></td>
			          <td class="s2"> 
			           <html:text property="searchKeywordDate" style="width:100px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchKeywordDate);">
			          </td>
								<td width="60"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" /></td>
							</tr>
						</table>
						</html:form>
						<!--��� �˻� ���̺� ��-->
						<table>
						<tr>
		          <td height="15"></td>
						</tr>
						</table>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
						<tr>
							<td>
								<!-- ���̺� ��� ����-->
								<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
									<tr> 
										<td class="t1" width="54">���ǽ�</td>
										<td class="sBg"></td>
										<td class="t1" width="79">�뿩����</td>
										<td class="sBg"></td>
										<td class="t1" width="79">�뿩����</td>
										<td class="sBg"></td>
										<td class="t1" width="69">�뿩��</td>
										<td class="sBg"></td>
										<td class="t1" width="99">����ó</td>
										<td class="sBg"></td>
										<td class="t1">�뿩����</td>
										<td class="sBg"></td>
										<td class="t1" width="109">ó������</td>
										<td class="sBg"></td>
										<td class="t1" width="83">ó��</td>
										<td width="17"></td>
									</tr>
								</table>
								<!--���̺� ��� ��-->
								<!--����Ʈ ����-->
								<html:form method="POST" action="rscRoom.act?task=month">
								<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
								<c:set var="no" scope="request" value="1"/>
								<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
									<c:forEach var="list" items="${rsRscRoomList}" varStatus="i" >
									<!-- �� ��� -->
										<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
										<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
										<tr class="${lineBg}" height="28">
											<td class="t2" width="54"><c:out value="${list.roomNo}"/></td>
											<td class="sBg"></td>
											<td class="t2" width="79"><c:out value="${list.lendFrom}"/></td>
											<td class="sBg"></td>
											<td class="t2" width="79"><c:out value="${list.lendTo}"/></td>
											<td class="sBg"></td>
											<td class="t2" width="69">
												<c:if test="${list.reqOrgan ne null}">&nbsp;<span title="${list.reqName}(${list.reqOrgan})">${list.reqName}</span></c:if>
												<c:if test="${list.reqOrgan eq null}">&nbsp;<span title="${list.reqName}">${list.reqName}</span></c:if>
											</td>
											<td class="sBg"></td>
											<td class="t2" width="99"><c:out value="${list.reqPhone}"/></td>
											<td class="sBg"></td>
											<td class="t3">
												<c:if test="${fn:length(list.lendWhy) > 15}">&nbsp;<span title="${list.lendWhy}"><c:out value="${fn:substring(list.lendWhy, 0, 15)}��"/></span></c:if>
												<c:if test="${fn:length(list.lendWhy) < 15}">&nbsp;<c:out value="${list.lendWhy}"/></c:if>
											</td>
											<td class="sBg"></td>
											<td class="t2" width="109" id="sUs" valign="middle">
												<div id="L1" style="position:static; width:109px;" align="center">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
													<tr>
														<td id="upSUs"><c:out value="${list.statUs}"/></td>
													</tr>
												</table>
												</div>
												<div id="L2" style="position:static; display:none; width:109px;" align="center">
												<html:select property='editStatUs' style='width:100px;' value='${list.statUsCode}'>
													<html:optionsCollection name='statUsCode' property='beanCollection' />
												</html:select>
												</div>
											</td>
											<td class="sBg"></td>
											<td class="t2" width="83" id="modify" valign="middle">
												<img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle" alt="����" onclick="modifyRoomLent(${no});" style="cursor:hand"/>
												<img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle" alt="����" onclick="doDelete(${list.lendSeq});" style="cursor:hand"/>
											</td>
										</tr>
										<tr>
											<td colspan="15" class="lbg3"></td>
										</tr>
										<html:hidden property="lendSeq" value="${list.lendSeq}"/>
										<html:hidden property="statUs" value="${list.statUs}"/>
										<c:set var="no" scope="request" value="${no + 1}"/>
									</c:forEach>
									<c:if test="${no==1}">
										<tr class="tbg3" height="21">
											<td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
										</tr>
									</c:if>
								</table>
								</div>
								</html:form>
								<!--����Ʈ ��-->
							</td>
						</tr>
						</table>
						<!--�Խù� �Ʒ� ��ư ����-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
			      	<tr valign="bottom">
		          	<td align="right">		          	
									<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="������뿩" style="cursor:hand" onclick="location.href='<html:rewrite page="/rscRoom.act?task=month"/>'"/> 
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
<div id="cal"></div>
<script type="text/javascript">
<!--
	tresize(215);
//-->
</script>
