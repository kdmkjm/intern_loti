<%@ page language="java"%>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti"%>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script language="JavaScript">
<!--
	window.onresize = function() {
	    //   ������ ������ ���� ���� �ڵ�
	    tresize(210);
    }

    function organList(courseCode, chiefOrgan, organName) {
	    var courseName = document.forms[0].searchCourseName.value;

	    document.location.href = "oprStudentFix.act?task=selectlist&searchCourseCode=" + courseCode + "&searchCourseName=" + courseName + "&chieforgan="
	            + chiefOrgan + "&organname=" + organName;
    }

    function fixStudent() {
	    jQuery('input[name="searchCourseCode"]').val(jQuery('#searchCourseName').val() + '0' + jQuery('#searchKeyword').val() + '000');
	    var courseCode = document.forms[0].searchCourseCode.value;

	    if (courseCode == '') {
		    alert('�����ڵ带 �����Ͽ� �ּ���.');
		    return;
	    }

	    if (confirm('Ȯ���Ͻðڽ��ϱ�?')) {
		    document.location.href = "oprStudentFix.act?task=insertBatch&searchCourseCode=" + courseCode;
	    }

    }

    function excelDown() {
	    var courseCode = document.forms[0].searchCourseCode.value;
	    var courseName = document.forms[0].searchCourseName.value;

	    if (courseName == '') {
		    alert('������ �����Ͽ� �ּ���.');
		    return;
	    }
	    document.location.href = "oprStudentFix.act?task=excel&courseCode=" + courseCode;
    }
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">����������</h2>
				<h1>
					<img alt="�����ο�Ȯ��" src="/images/operation/title_07.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<html:form action="oprStudentFix.act?task=list">
				<!--�˻� ���̺� ����-->
				<table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
					<tr>
						<td bgcolor="#FFFFFF">
							<table width="748" border="0" cellspacing="0" cellpadding="0">
								<html:hidden property="courseYear" />
								<html:hidden property="crsUser" />
								<tr>
									<td width="59" class="s1">����</td>
									<td class="sBar"></td>
									<td class="s2" width="420">
										<select id="searchYear"></select> <select id="searchCourseName" style="width: 260px;">
											<option value="">���� ����</option>
										</select> <select id="searchKeyword" style="width: 100px;">
											<option value="">������� ����</option>
										</select>
										<html:hidden property="searchColumn" />
										<html:hidden property="searchCourseCode" value="${searchCourseCode }" />
									</td>
									<td width="60" align="center">
										<img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="doSearch()" style="cursor: hand" align="absbottom" />
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<!--�˻� ���̺� ��-->
			</html:form>
		</td>
	</tr>
	<tr>
		<td height="15"></td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="tbg2"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<!--���̺� ��� ����-->
			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="lbg"></td>
					<td class="cbg">
						<table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
							<tr>
								<td class="t1">�Ҽ�</td>
								<td class="sBg"></td>
								<td class="t1" width="119">��û�ο�</td>
								<td class="sBg"></td>
								<td class="t1" width="119">Ȯ���ο�</td>
								<td class="sBg"></td>
								<td class="t1" width="120">�����ο�</td>
								<td width="17"></td>
							</tr>
						</table>
					</td>
					<td class="lbg"></td>
				</tr>
			</table>
			<!--���̺� ��� ����-->
		</td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="lbg"></td>
					<td width="746">
						<table width="746" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td valign="top">
									<!--����Ʈ ����-->
									<div id="mainList" style="width: 746px; overflow-y: scroll; overflow-x: hidden;">
										<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
											<c:forEach var="studentFixList" items="${rsOpr_StudentFixList}" varStatus="i">
												<c:if test="${i.count%2==0}">
													<tr class="tbg3">
														<td class="t2">${studentFixList.organname}</td>
														<td class="sBg"></td>
														<td class="t2" width="119">${studentFixList.sinwon }</td>
														<td class="sBg"></td>
														<td class="t2" width="119">
															<a href="#" onclick="javascript:organList('${studentFixList.courseCode}','${studentFixList.chieforgan}','${studentFixList.organname}');"><u>${studentFixList.finwon}</u></a>
														</td>
														<td class="sBg"></td>
														<td class="t2" width="120">${studentFixList.minwon }</td>
													</tr>
													<tr>
														<td class="lbg3" colspan="11"></td>
													</tr>
												</c:if>
												<c:if test="${i.count%2==1}">
													<tr>
														<td class="t2">${studentFixList.organname}</td>
														<td class="sBg"></td>
														<td class="t2" width="119">${studentFixList.sinwon }</td>
														<td class="sBg"></td>
														<td class="t2" width="119">
															<a href="#" onclick="javascript:organList('${studentFixList.courseCode}','${studentFixList.chieforgan}','${studentFixList.organname}');"><u>${studentFixList.finwon}</u></a>
														</td>
														<td class="sBg"></td>
														<td class="t2" width="120">${studentFixList.minwon }</td>
													</tr>
													<tr>
														<td class="lbg3" colspan="11"></td>
													</tr>
												</c:if>
												<c:set var="count" value="${i.count}" />
												<c:set var="tsinwon" value="${tsinwon + studentFixList.sinwon }" />
												<c:set var="tfinwon" value="${tfinwon + studentFixList.finwon }" />
												<c:set var="tminwon" value="${tminwon + studentFixList.minwon }" />
												<c:set var="jungwon" value="${studentFixList.jungwon }" />
											</c:forEach>
											<c:if test="${count==null}">
												<tr class="tbg3">
													<td class="t2" colspan="99">��ȸ�� �����Ͱ� �����ϴ�.</td>
												</tr>
											</c:if>
										</table>
									</div>
									<!--����Ʈ ��-->
									<c:if test="${count>0}">
										<table width="746" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="t2BgRed">����:${jungwon }��</td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="119">${tsinwon }</td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="119">${tfinwon }</td>
												<td class="sBg"></td>
												<td class="t2BgRed" width="120">${tminwon }</td>
												<td class="t2BgRed" width="17"></td>
											</tr>
											<tr>
												<td class="lbg3" colspan="11"></td>
											</tr>
										</table>
									</c:if>
								</td>
							</tr>
						</table>
					</td>
					<td class="lbg"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="tbg1"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
				<tr valign="bottom">
					<td align="right">
						<%--         <img src='<html:rewrite page="/images/board/btn_excel.gif"/>' width="94" height="25" align="absmiddle" alt="�����ٿ�ε�" onclick="excelDown()" style="cursor:hand"/>  --%>
						<!--  <img src='<html:rewrite page="/images/board/btn_send3.gif"/>' width="94" height="25" align="absmiddle" alt="Ȯ������" onclick="fixStudent()" style="cursor:hand"/>-->
						<img src="/images/btn_batch.gif" onclick="fixStudent()" alt="�ο��ϰ�Ȯ��" align="absmiddle" style="cursor: hand;" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
<!--
	tresize(210);
//-->
</script>
