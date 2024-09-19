<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script type="text/javascript">
<!--
	function showCourse(courseCode,crsType1)
	{
			LeftPosition=screen.width/2-(667/2);
			TopPosition=screen.height/2-(470/2);
			window.open('${pageContext.request.contextPath}/cmnCourseInfo.act?task=info&coursecode='+courseCode+'&crstype1='+crsType1,'pop1',
		  	'height=470,width=667,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=yes,top='+TopPosition+',left='+LeftPosition);
	}
//-->
</script>
<!--���̺� ��� ����-->
<table width="729" border="0" cellspacing="0" cellpadding="0" class="cbg">
	<tr> 
		<td class="t1">����</td>
		<td class="sBg"></td>
		<td class="t1" width="49">���ǽ�</td>
		<td class="sBg"></td>
		<td class="t1" width="89">�Ⱓ</td>
		<td class="sBg"></td>
		<td class="t1" width="55">�ð�ǥ</td>
		<td class="sBg"></td>
		<td class="t1" width="95">����</td>
		<td class="sBg"></td>
		<td class="t1" width="95">����������</td>
		<td class="sBg"></td>
		<td class="t1" width="55">���</td>
		<td class="sBg"></td>
		<td class="t1" width="70">�����</td>
           </tr>
</table>
<!--���̺� ��� ��-->
<!--����Ʈ ����-->
<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
	<c:set var="no" scope="request" value="1"/>
<c:forEach var="list" items="${rsSvc_StdPortalList}" varStatus="i" >
	<!-- �� ��� -->
	<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
	<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
	<tr class="${lineBg}">
		<td class="t3">&nbsp;
			<a href="#" onclick="showCourse('${list.courseCode}','${list.crsType1}');"><u><c:out value="${list.courseName}"/></u></a>
		</td>
		<td class="sBg"></td>
		<td class="t2" width="49"><c:out value="${list.roomNo}"/></td>
		<td class="sBg"></td>
		<td class="t2" width="89"><c:out value="${list.eduDate}"/></td>
		<td class="sBg"></td>
		<td class="t2" width="55">
			<c:if test="${list.timeFlag eq 'F'}"><img src='<html:rewrite page="/images/board/btn_s_search2.gif"/>' align="absmiddle" style="cursor:hand" alt="�ð�ǥ ��ȸ" onclick="timeAdd('${list.courseCode}','${list.eduFrom}','${list.eduTo}','${list.today}');"></c:if>
			<c:if test="${list.timeFlag eq 'I'}"><img src='<html:rewrite page="/images/board/btn_insert.gif"/>' align="absmiddle" style="cursor:hand" alt="�ð�ǥ ���" onclick="timeAdd('${list.courseCode}','${list.eduFrom}','${list.eduTo}','${list.today}');"></c:if>
			<c:if test="${list.timeFlag eq 'U'}"><img src='<html:rewrite page="/images/board/btn_modify6.gif"/>' align="absmiddle" style="cursor:hand" alt="�ð�ǥ ����" onclick="timeAdd('${list.courseCode}','${list.eduFrom}','${list.eduTo}','${list.today}');"></c:if>
		</td>
		<td class="sBg"></td>
		<td class="t2" width="95">
			<img src='<html:rewrite page="/images/board/btn_lecture.gif"/>' align="absmiddle" style="cursor:hand" alt="�Ⱝ" onclick="lectureMgmt('${list.courseCode}','${list.eduFrom}','${list.eduTo}','${list.today}');">
			<img src='<html:rewrite page="/images/board/btn_pay.gif"/>' align="absmiddle" style="cursor:hand" alt="����" onclick="profPay('${list.courseCode}');">
		</td>
		<td class="sBg"></td>
		<td class="t2" width="95"><img src='<html:rewrite page="/images/board/btn_namelist.gif"/>' align="absmiddle" style="cursor:hand" alt="���/�⼮��" onclick="studentMgmt('${list.courseCode}');"></td>
		<td class="sBg"></td>
		<td class="t2" width="55"><img src='<html:rewrite page="/images/board/btn_insert.gif"/>' align="absmiddle" style="cursor:hand" alt="�����" onclick="attend('${list.courseCode}','${list.eduFrom}','${list.eduTo}','${list.today}');"></td>
		<td class="sBg"></td>
		<td class="t2" width="70"><c:out value="${list.userName}"/></td>
	</tr>
	<tr>
		<td colspan="15" class="lbg3"></td>
	</tr>
	<c:set var="no" scope="request" value="${no + 1}"/>
</c:forEach>
<html:hidden property="max" value="${no - 1}"/>
<c:if test="${no==1}">
	<tr class="tbg3" height="21">
		<td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
	</tr>
</c:if>
</table>
<!--����Ʈ ��-->