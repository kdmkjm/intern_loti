<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
<c:forEach var="crsList" items="${rsExtCrs_PlanList}" varStatus="i" >
	<c:if test="${i.count%2 == 0}">
         <tr>
           <td class="t2" width="40">${i.count}</td>
           <td class="sBg"></td>
           <td class="t3">&nbsp;${crsList.courseName}</td>
           <td class="sBg"></td>
           <td class="t2" width="85">${crsList.eduFromTo}</td>
           <td class="sBg"></td>
           <td class="t2" width="95">${crsList.eduTarget}</td>
           <td class="sBg"></td>
           <td class="t2" width="50"><fmt:formatNumber value="${crsList.eduDay}" pattern="#,##0"/></td>
           <td class="sBg"></td>
           <td class="t2" width="50"><fmt:formatNumber value="${crsList.eduCount}" pattern="#,##0"/></td>
           <td class="sBg"></td>         
           <td class="t2" width="60">${crsList.lecRoomNo}</td>
           <td class="sBg"></td>
           <td class="t2" width="60">${crsList.charger}</td>
           <td class="sBg"></td>
           <td class="t2" width="70"><img src='<html:rewrite page="/images/board/btn_view.gif"/>' width="53" height="18" align="absmiddle" alt="과정보기" onclick="showCourse('${crsList.courseCode}','${crsList.crsType1}');" style="CURSOR: hand"/></td>
         </tr>
         <tr>
           <td class="lbg3" colspan="99"></td>
         </tr>
         </c:if>
         <c:if test="${i.count%2 == 1}">
         <tr class="tbg3">
           <td class="t2" width="40">${i.count}</td>
           <td class="sBg"></td>
           <td class="t3">&nbsp;${crsList.courseName}</td>
           <td class="sBg"></td>
           <td class="t2" width="85">${crsList.eduFromTo}</td>
           <td class="sBg"></td>
           <td class="t2" width="95">${crsList.eduTarget}</td>
           <td class="sBg"></td>
           <td class="t2" width="50"><fmt:formatNumber value="${crsList.eduDay}" pattern="#,##0"/></td>
           <td class="sBg"></td>
           <td class="t2" width="50"><fmt:formatNumber value="${crsList.eduCount}" pattern="#,##0"/></td>
           <td class="sBg"></td>         
           <td class="t2" width="60">${crsList.lecRoomNo}</td>
           <td class="sBg"></td>
           <td class="t2" width="60">${crsList.charger}</td>
           <td class="sBg"></td>
           <td class="t2" width="70"><img src='<html:rewrite page="/images/board/btn_view.gif"/>' width="53" height="18" align="absmiddle" alt="과정보기" onclick="showCourse('${crsList.courseCode}','${crsList.crsType1}');" style="CURSOR: hand"/></td>
         </tr>
         <tr>
           <td class="lbg3" colspan="99"></td>
         </tr>
         </c:if>
		<c:set value="${i.count}" var="count"></c:set>
	</c:forEach>
		<c:if test="${count==null}">
         <tr class="tbg3">
         	<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
         </tr>
         </c:if>
</table>
