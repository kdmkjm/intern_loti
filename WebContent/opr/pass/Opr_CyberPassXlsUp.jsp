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
//				alert("교번을 입력하세요.");
//				return;
//			}
//		}
//		else
//		{
//			for(var i=0; i<max; i++)
//			{
//				if(document.all.arrayStdNo[i].value == "")
//				{
//					alert("교번을 입력하세요.");
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
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="사이버 이수관리 - 엑셀 업로드" src="/images/operation/title_13.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
						<!--검색 -->
						<html:form action='oprPass.act?task=excel_view' enctype="multipart/form-data" >
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
							<tr>
							  <td width="119" class="s1">과정</td>
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
								<td width="119" class="s1">파일</td>
								<td bgcolor="#E6E6E6" width="1"></td>
								<td class="s2">
									<html:file property="file" onchange="viewFile();" style="width:250px"></html:file>
									<img src='<html:rewrite page="/images/board/btn_dawnload.gif"/>' alt="입력양식 다운로드" style="cursor:hand" align="absmiddle" onclick="location.href='<html:rewrite page="/oprPass.act?task=sample_down"/>'"/>
								</td>
							</tr>
						</table>
						</html:form>
						<!--검색 끝-->
						<table>
							<tr>
			        	<td height="15"></td>
							</tr>
						</table>
						<html:form method="POST" action="oprPass.act?task=excel_save">
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
							<tr>
								<td>
									<!--테이블 헤더 시작-->
									<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr> 
										  <td class="t1" width="29">연번</td>
											<td class="sBg"></td>
											<td class="t1" width="49">성명</td>
											<td class="sBg"></td>
											<td class="t1" width="99">대체키</td>
											<td class="sBg"></td>
											<td class="t1">기관명/직급</td>
											<td class="sBg"></td>
											<td class="t1" width="39">인정<br>시간</td>
											<td class="sBg"></td>
											<td class="t1" width="39">성적</td>
											<td class="sBg"></td>
											<td class="t1" width="39">석차</td>
											<td class="sBg"></td>
											<td class="t1" width="59">이수<br>여부</td>
											<td class="sBg"></td>
											<td class="t1" width="45">교번</td>
											<td width="17"></td>
										</tr>
									</table>
									<!--테이블 헤더 끝-->
									<!--리스트 시작-->
									<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
									<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
										<c:set var="no" scope="request" value="1"/>
										<c:forEach var="list" items="${rsOpr_PassCyberExcelUploadList}" varStatus="i" >
											<!-- 열 배경 -->
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
												<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
											</tr>
										</c:if>
									</table>	
									</div>
									<!--리스트 끝-->
								</td>
							</tr>
						</table>
						<!--하단버튼 테이블 시작-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
						  <tr valign="bottom">
						  	<td>
									<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록" onclick="doBackToList();" style="cursor:hand"/> 
						  	</td>
						    <td align="right">
	                <c:if test="${no>1}">
										<img src='<html:rewrite page="/images/board/btn_save.gif"/>' alt="저장" align="absmiddle" style="cursor:hand" onclick="doSave(document.forms[1]);"/>
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