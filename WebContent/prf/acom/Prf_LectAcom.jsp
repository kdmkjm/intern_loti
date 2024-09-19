<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   ������ ������ ���� ���� �ڵ�
		tresize(185);
	}
	function ozReport(data, data1)
	{
		var year = data;
		var issueSeq = data1;

			window.open('<html:rewrite page="/ozMenu.act"/>?report=lec&year=' + year + '&issueSeq=' + issueSeq,'popup', 'scrollbars = no,resizable=yes, menubar = no, width = 710 height =550, status = yes');
	}
	function infoAcom(num1, num2)
	{
		var year = num1;
		var issueSeq = num2;

		document.forms[0].action = 'prfLectAcom.act?task=info&year=' + year + '&issueSeq=' + issueSeq;

		document.forms[0].submit();
	}
	function newAcom()
	{
		document.forms[0].action = 'prfLectAcom.act?task=create';

		document.forms[0].submit();
	}

	function doDelete(data, data1)
	{
		var year = data;
		var issueSeq = data1;

		var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(del_confirm == true)
		{
			var url = '${pageContext.request.contextPath}/prfLectAcom.act?task=delete&year=' + year + '&issueSeq=' + issueSeq;
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
		<td>
			<div class="ccGroup">
				<h2 class="hide">����������</h2>
				<h1>
					<img alt="���ǽ���Ȯ��" src="/images/teacher/title_04.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<!--�˻� -->
			<html:form method="POST" action="prfLectAcom.act?task=list">
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 1px solid #D6D6D6">
					<tr>
						<td class="s1" width="100">����</td>
						<td class="sBar"></td>
						<td class="s2" width="150">
							<html:select property="searchKeywordYear" style="width:80px" value="${thisYear}">
								<html:optionsCollection name="searchYearCode" property="beanCollection" />
							</html:select>
						</td>
						<td class="sBar"></td>
						<td class="s1" width="100">�����</td>
						<td class="sBar"></td>
						<td class="s2">
							<html:text property="searchKeyword" style="width:180px;" />
						</td>
						<td width="60" align="center">
							<input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" />
						</td>
					</tr>
				</table>
			</html:form>
			<!--�˻� ��-->
			<table>
				<tr>
					<td height="15"></td>
				</tr>
			</table>
			<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #50a1f0">
				<tr>
					<td>
						<!--���̺� ��� ����-->
						<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
							<tr>
								<td class="t1" width="99">�����ȣ</td>
								<td class="sBg"></td>
								<td class="t1" width="99">��������</td>
								<td class="sBg"></td>
								<td class="t1" width="79">����</td>
								<td class="sBg"></td>
								<td class="t1">�Ҽ�</td>
								<td class="sBg"></td>
								<td class="t1" width="89">����</td>
								<td class="sBg"></td>
								<td class="t1" width="100">���</td>
								<td width="17"></td>
							</tr>
						</table>
						<!--���̺� ��� ��-->
						<!--����Ʈ ����-->
						<div id="mainList" style="width: 746px; z-index: 0; overflow-y: scroll; overflow-x: hidden">
							<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
								<c:forEach var="list" items="${rsPrf_LectAcomList}" varStatus="i">
									<!-- �� ��� -->
									<c:if test="${i.count%2 == 0}">
										<c:set var="lineBg" scope="request" value="tbg3" />
									</c:if>
									<c:if test="${i.count%2 == 1}">
										<c:set var="lineBg" scope="request" value="" />
									</c:if>
									<tr class="${lineBg}">
										<td class="t2" width="99">
											<c:out value="${list.year}-${list.issueSeq}" />
										</td>
										<td class="sBg"></td>
										<td class="t2" width="99">
											<c:out value="${list.issueDate}" />
										</td>
										<td class="sBg"></td>
										<td class="t2" width="79">
											<a href="#" onclick="infoAcom(${list.year},${list.issueSeq});"><u><c:out value="${list.profName}" /></u></a>
										</td>
										<td class="sBg"></td>
										<td class="t2">
											<c:out value="${list.asSign}" />
										</td>
										<td class="sBg"></td>
										<td class="t2" width="89">
											<c:out value="${list.position}" />
										</td>
										<td class="sBg"></td>
										<td class="t2" width="100">
											<img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle" alt="����" onclick="doDelete(${list.year},${list.issueSeq});" style="cursor: hand">
											<img src='<html:rewrite page="/images/board/btn_s_print.gif"/>' align="absmiddle" alt="�μ�" style="cursor: hand" onclick="ozReport(${list.year},${list.issueSeq});">
										</td>
									<tr>
										<td colspan="11" class="lbg3"></td>
									</tr>
									<c:set value="${i.count}" var="count"></c:set>
								</c:forEach>
								<c:if test="${count==null}">
									<tr class="tbg3">
										<td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
									</tr>
								</c:if>
							</table>
						</div>
						<!--����Ʈ ��-->
					</td>
				</tr>
			</table>
			<!--�ϴܹ�ư ���̺� ����-->
			<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
				<tr valign="bottom">
					<td align="right">
						<img src='<html:rewrite page="/images/board/btn_new.gif"/>' align="absmiddle" alt="�ű�" onclick="newAcom();" style="cursor: hand" />
					</td>
				</tr>
			</table>
			<!--�ϴܹ�ư ���̺� ��-->
		</td>
	</tr>
</table>
<script type="text/javascript">
<!--
	tresize(185);
	document.forms[0].searchKeyword.focus();
//-->
</script>