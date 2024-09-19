<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
<!--
	function viewFile()
	{
		var frm = document.forms[0];

		frm.submit();
	}
	function doBackToList()
	{
		var courseCode = document.all.searchCourseCode.value;
		var courseName = document.all.searchCourseName.value;
		
		var url = '${pageContext.request.contextPath}/oprPass.act?task=cyberList&searchCourseCode='+courseCode+'&searchCourseName='+courseName;
		document.location.href = url;
	}

	function doSave(frm)
	{
//		var max = Number(frm.max.value);
//		if(max == 1)
//		{
//			if(document.all.arrayStdNo.value == "")
//			{
//				alert("������ �Է��ϼ���.");
//				return;
//			}
//		}
//		else
//		{
//			for(var i=0; i<max; i++)
//			{
//				if(document.all.arrayStdNo[i].value == "")
//				{
//					alert("������ �Է��ϼ���.");
//					return;
//				}
//			}
//		}
		document.all.courseCode.value = document.all.searchCourseCode.value;
		document.all.courseName.value = document.all.searchCourseName.value;
		
		frm.submit();
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="���̹� �̼����� - ���� ���ε�" src="/images/operation/title_13.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
						<!--�˻� -->
						<html:form action='oprPass.act?task=excel_view' enctype="multipart/form-data" >
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
							<tr>
							  <td width="119" class="s1">����</td>
							  <td class="sBar"></td>
							  <td class="s2"> 
							    <html:text property="searchCourseCode" style="width:80px;" readonly="true"/>&nbsp;
							    <html:text property="searchCourseName" style="width:220px" readonly="true"/>
							  </td>
							</tr>
							<tr>
								<td colspan="3" class="lbg3"></td>
							</tr>
							<tr>
								<td width="119" class="s1">����</td>
								<td bgcolor="#E6E6E6" width="1"></td>
								<td class="s2">
									<html:file property="file" onchange="viewFile();" style="width:250px"></html:file>
									<img src='<html:rewrite page="/images/board/btn_dawnload.gif"/>' alt="�Է¾�� �ٿ�ε�" style="cursor:hand" align="absmiddle" onclick="location.href='<html:rewrite page="/oprPass.act?task=sample_down"/>'"/>
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
						<html:form method="POST" action="oprPass.act?task=excel_save">
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
							<tr>
								<td>
									<!--���̺� ��� ����-->
									<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr> 
										  <td class="t1" width="29">����</td>
											<td class="sBg"></td>
											<td class="t1" width="49">����</td>
											<td class="sBg"></td>
											<td class="t1" width="99">��üŰ</td>
											<td class="sBg"></td>
											<td class="t1">�����/����</td>
											<td class="sBg"></td>
											<td class="t1" width="39">����<br>�ð�</td>
											<td class="sBg"></td>
											<td class="t1" width="39">����</td>
											<td class="sBg"></td>
											<td class="t1" width="39">����</td>
											<td class="sBg"></td>
											<td class="t1" width="59">�̼�<br>����</td>
											<td class="sBg"></td>
											<td class="t1" width="45">����</td>
											<td width="17"></td>
										</tr>
									</table>
									<!--���̺� ��� ��-->
									<!--����Ʈ ����-->
									<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
									<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
										<c:set var="no" scope="request" value="1"/>
										<c:forEach var="list" items="${rsOpr_PassCyberExcelUploadList}" varStatus="i" >
											<!-- �� ��� -->
											<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
											<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
											<html:hidden property="arrayStdName" 			value="${list.stdName}"/>
											<html:hidden property="arrayStdBirth" 		value="${list.juminNo}"/>
											<html:hidden property="arrayProgressRate" value="${list.progressRate}"/>
											<html:hidden property="arrayHomeStudy" 		value="${list.homeStudy}"/>
											<html:hidden property="arrayStudyHour" 		value="${list.studyHour}"/>
											<html:hidden property="arrayParticipate" 	value="${list.participate}"/>
											<html:hidden property="arrayConnectCount" value="${list.connectCount}"/>
											<html:hidden property="arrayAcquireScore" value="${list.acquireScore}"/>
											<html:hidden property="arrayIsFinish" 		value="${list.isFinish}"/>
											<tr class="${lineBg}">
												<td class="t2" width="29"><c:out value="${list.seq}"/></td>
                        <td class="sBg"></td>
                        <td class="t2" width="49"><c:out value="${list.stdName}"/></td>
                        <td class="sBg"></td>
                        <td class="t2" width="99"><c:out value="${list.juminNo}"/></td>
                        <td class="sBg"></td>
                        <td class="t2"><span title="${list.assignName}"><c:out value="${list.assignName}"/>&nbsp;/&nbsp;<c:out value="${list.rankName}"/></span></td>
                        <td class="sBg"></td>
                        <td class="t2" width="39"><c:out value="${list.studyHour}"/></td>
                        <td class="sBg"></td>
                        <td class="t2" width="39"><c:out value="${list.acquireScore}"/></td>
                        <td class="sBg"></td>
                        <td class="t2" width="39"><c:out value="${list.ranking}"/></td>
                        <td class="sBg"></td>
                        <td class="t2" width="59"><c:out value="${list.isFinish}"/></td>
                        <td class="sBg"></td>
                        <td class="t2" width="45"><c:out value="${list.stdNo}"/></td>
											</tr>
											<tr>
												<td colspan="99" class="lbg3"></td>
											</tr>
											<c:set var="no" scope="request" value="${no + 1}"/>
										</c:forEach>
										<html:hidden property="max" value="${no - 1}"/>
										<html:hidden property="courseCode"/>
										<html:hidden property="courseName"/>
										<c:if test="${no==1}">
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
						  	<td>
									<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="���" onclick="doBackToList();" style="cursor:hand"/> 
						  	</td>
						    <td align="right">
	                <c:if test="${no>1}">
										<img src='<html:rewrite page="/images/board/btn_save.gif"/>' alt="����" align="absmiddle" style="cursor:hand" onclick="doSave(document.forms[1]);"/>
	                </c:if>
								</td>
						  </tr>
						</table>
						</html:form>
					</td>
  </tr>
</table>
<script type="text/javascript">
<!--
	tresize(225);
	document.forms[0].file.focus();
//-->
</script>