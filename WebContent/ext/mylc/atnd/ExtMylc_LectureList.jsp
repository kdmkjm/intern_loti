<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
	function searchList(tmp)
	{
		var frm = document.forms[0];
		frm.submit();
	}
	function showCourse(courseCode,crsType1)
	{
			LeftPosition=screen.width/2-(667/2);
			TopPosition=screen.height/2-(470/2);
			window.open('${pageContext.request.contextPath}/cmnCourseInfo.act?task=info&coursecode='+courseCode+'&crstype1='+crsType1,'pop1',
		  	'height=470,width=667,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=yes,top='+TopPosition+',left='+LeftPosition);
	}
	//������ȸ�� �̵�
	function rePlySurvey(surveyno, coursecode, stdno, chkmod)
	{
		var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
	 	
	 	if(surveyno == "")
		{
			alert("�ش缳���� �������� �ʽ��ϴ�.")
			return;
		}
		
		if(coursecode == "")
		{
			alert("�ش������ �������� �ʽ��ϴ�.")
			return;
		}
		window.open('<html:rewrite page="/extMylcSurvey.act?task=info&surveyno='+surveyno+'&coursecode='+coursecode+'&stdno='+stdno+'&chkmod='+chkmod+'"/>', 'popup', 'scrollbars=yes, menubar=no, width=668, height=600, status=yes top='+wint+', left='+winl);
	}
	
	function ozReport(data,data1,k)
	{
		var courseCode = data;
		var seq = data1;
		
		if(k==1)
		{//������
			url ='<html:rewrite page="/ozMenu.act"/>?report=end&check_array='+ courseCode + seq;	
			window.open(url,'popup', 'scrollbars = no,resizable=yes, menubar = no, width = 710 height =550, status = yes');
		}
		if(k==2)
		{ //�����Ʒ��̼������
			url ='<html:rewrite page="/ozMenu.act"/>?report=endconfirm&check_array='+ courseCode + seq; 	
			window.open(url,'popup', 'scrollbars = no, resizable=yes,menubar = no, width = 710 height =550, status = yes');
		}		
	}
	
	function popupScoreList(coursecode){
		var url = '/extMylcLecture.act?task=scorelist&coursecode=' + coursecode;
		var size_w = 780;
		var size_h = 600;
		window.open(url, 'popup','scrollbars=yes, menubar=no, width='+size_w+', height='+size_h+', status=yes top='+(screen.height/2 - size_h)+', left='+(screen.width/2 - size_w));
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/course/title_02.gif"/>' alt="����������ȸ"/></td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<!--�˻� -->
						<html:form method="POST"  action="extMylcLecture.act?task=list">
						<html:hidden property="searchCourseCode"/>
						<input type="hidden" name="searchType" value="�̼�"/>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
							<tr>
								<%--<td class="s1" width="75">�̼�����</td>
								<td class="sBg"></td>
								<td class="s2" width="80">
									<html:select property="searchType" style="width:75px">
										<html:option value="">��ü</html:option>
										<html:option value="�̼�">�̼�</html:option>
										<html:option value="���̼�">���̼�</html:option>
										<html:option value="������">������</html:option>
									</html:select>
								</td> --%>
								<td class="sBg"></td>
								<td class="s1" width="85">����/������</td>
								<td class="sBg"></td>
								<td class="s2">									
									<html:text property="searchKeyword" title="�����" style="width:170px"/>
								</td>
								<td class="sBg"></td>
								<td class="s1" width="50">�Ⱓ</td>
								<td class="sBg"></td>
								<td class="s2" width="195">	
									<html:text property="searchFrom" style="width:65px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchFrom, 'yyyy-mm-dd');">
									~ <html:text property="searchTo" style="width:65px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchTo, 'yyyy-mm-dd');">
								</td>
								<td width="60">
									<input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" align="absmiddle"/>
								</td>
							</tr>
						</table>
						</html:form>
						<!--�˻� ��-->
						<table style="width:100%;">
							<tr>
								<td height="15"></td>
							</tr>
							<tr>
								<td style="text-align: right; font-size: 8pt;">*������ ������ ���, ������ 1.�н�����, 2.�ǽ�����, 3.����������, 4.��������, 5.���� ������ �����˴ϴ�.</td>
							</tr>
						</table>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
							<tr>
								<td>
									<!--���̺� ��� ����-->
									<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr>
											<td class="t1" width="34">��ȣ</td>
											<td class="sBg"></td>
											<td class="t1">������</td>
											<td class="sBg"></td>
											<td class="t1" width="104">�����Ⱓ</td>
											<td class="sBg"></td>
											<td class="t1" width="40">����</td>
											<td class="sBg"></td>
											<td class="t1" width="40">����</td>
											<td class="sBg"></td>
											<td class="t1" width="59">�̼�����</td>
											<td class="sBg"></td>
<%-- 										<td class="t1" width="59">����</td>
											<td class="sBg"></td>
											<td class="t1" width="74">�̼���</td>
											<td class="sBg"></td> --%>
											<td class="t1" width="109">������</td>										
											<td width="17"></td>
										</tr>
									</table>
									<!--����Ʈ ����-->
									<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
										<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
											<c:set var="no" scope="request" value="1"/>
											<c:forEach var="list" items="${rsExtMylc_LectureListList}" varStatus="i" >
												<!-- �� ��� -->
												<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
												<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
												<tr class="${lineBg}">
													<td class="t2" width="34"><c:out value="${no}"/></td>
													<td class="sBg"></td>
													<td class="t3">&nbsp;
														<c:if test="${list.year <= 2009}">
															<c:out value="${list.courseName}"/>
														</c:if>
														<c:if test="${list.year > 2009}">
															<a href="#" onclick="showCourse('${list.courseCode}','${list.crsType1}');""><u><c:out value="${list.courseName}"/></u></a>
														</c:if>														
													</td>
													<td class="sBg"></td>
													<td class="t2" width="104"><c:out value="${list.eduDate}"/></td>
													<td class="sBg"></td>
													<td class="t2" width="40">
														<c:if test="${list.scoreAvg ne '0'}">
															<a href="#" onclick="popupScoreList('${list.courseCode }')">
																<c:out value="${list.scoreAvg}"/>
															</a>
															</c:if>
														<c:if test="${list.scoreAvg eq '0'}"><c:out value="-"/></c:if>
													</td>
													<td class="sBg"></td>
													<td class="t2" width="40">${list.ranking }</td>
													<td class="sBg"></td>
													<td class="t2" width="59"><c:out value="${list.isFinish}"/></td>
													<td class="sBg"></td>
<%-- 												<td class="t2" width="59">
														<c:if test="${list.surveyNo == 'N' || list.year <= 2009}">
															<img src='<html:rewrite page="/images/board/btn_poll_search_off.gif"/>' align="absmiddle" alt="������ȸ">
														</c:if>
														<c:if test="${list.surveyNo != 'N'}">
															<c:if test="${list.chkMod eq 'C' && list.year > 2009}">
																<img src='<html:rewrite page="/images/board/btn_poll.gif"/>' align="absmiddle" alt="��������" style="cursor:hand" onclick="rePlySurvey('${list.surveyNo }','${list.courseCode}','${list.stdNo }','C');">
															</c:if>	
															<c:if test="${list.chkMod ne 'C' && list.year > 2009}">
																<img src='<html:rewrite page="/images/board/btn_poll_search_off.gif"/>' align="absmiddle" alt="������ȸ">
															</c:if>	
														</c:if>
													</td>
													<td class="sBg"></td>
													<td class="t2" width="74">
														<c:if test="${list.isFinish == '�̼�' && list.year > 2009}">
															<img src='<html:rewrite page="/images/board/btn_completion_print.gif"/>' align="absmiddle" alt="�̼������" style="cursor:hand" onclick="ozReport('${list.courseCode}','${list.seq}','1');">
														</c:if>
														<c:if test="${list.isFinish != '�̼�' || list.year <= 2009}">
															<img src='<html:rewrite page="/images/board/btn_completion_print_off.gif"/>'>
														</c:if>
													</td>
													<td class="sBg"></td> --%>
													<td class="t2" width="109">
														<c:if test="${list.isFinish == '�̼�' && list.year > 2000}">
															<img src='<html:rewrite page="/images/board/btn_completion_print.gif"/>' align="absmiddle" alt="���������" style="cursor:hand" onclick="ozReport('${list.courseCode}','${list.seq}','1');">
														</c:if>
														<c:if test="${list.isFinish != '�̼�' || list.year <= 2000}">
															<img src='<html:rewrite page="/images/board/btn_completion_print_off.gif"/>' align="absmiddle">
														</c:if>
													</td>												
												</tr>
												<tr>
													<td colspan="17" class="lbg3"></td>
												</tr>
												<c:set var="no" scope="request" value="${no + 1}"/>
											</c:forEach>
											<c:if test="${no==1}">
												<tr class="tbg3" height="21">
													<td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
												</tr>
											</c:if>
										</table>
									</div>
									<!--����Ʈ ��-->
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>