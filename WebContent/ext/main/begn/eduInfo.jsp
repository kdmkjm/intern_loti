<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<table id="mainTable" width="370" border="0" cellspacing="0" cellpadding="0">
	<c:forEach var="crsList" items="${rsExtMain_EduMonthInfoList}" varStatus="i" >
    <tr>
    	<td width="20" align="center"><img src='<html:rewrite page="/images/dot.gif"/>'></td>
			<td class="t3">
				<a href="#" onclick="showCourse('${crsList.courseCode}','${crsList.crsType1}');">
					<c:out value="${fn:substring(crsList.courseName, 0, 25)}"/>
				</a>
			</td>
			<td class="t2" width="150">${crsList.eduFromTo}</td>
		</tr>
		<tr> 
      <td colspan="4" height="1" background='<html:rewrite page="/images/line_bg.gif"/>'></td>
    </tr>
		<c:set value="${i.count}" var="count"></c:set>
	</c:forEach>
	<c:if test="${count==null}">
		<tr class="tbg3">
			<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
		</tr>
	</c:if>
</table>