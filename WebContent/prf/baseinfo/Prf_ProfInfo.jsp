<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script type="text/javascript" src='<html:rewrite page="/script/Prf_ProfInfo.js"/>'></script>

<script language="JavaScript">
	// �������� �ٿ�ε�
	function exceldownProf()
	{
		var year = document.forms[0].excelDownYear.value;
		if(year == "��ü") {
			if(confirm("�˻������� ��ü�� �����Ͻø� �ð��� ���� �ҿ�� �� �ֽ��ϴ�.\n����Ͻðڽ��ϱ�?")) {
  			document.location.href = '/prfBaseInfo.act?task=exceldown&excelDownYear=';
			}
		} else {
  		document.location.href = '/prfBaseInfo.act?task=exceldown&excelDownYear='+year;
		}
	}
	// �������� �ٿ�ε�
	function excelProfTotal()
	{
		var year = document.forms[0].excelDownYear.value;
		if(year == "��ü") {
			if(confirm("�˻������� ��ü�� �����Ͻø� �ð��� ���� �ҿ�� �� �ֽ��ϴ�.\n����Ͻðڽ��ϱ�?")) {
  			document.location.href = '/prfBaseInfo.act?task=excelProfTotal&excelDownYear=';
			}
		} else {
  		document.location.href = '/prfBaseInfo.act?task=excelProfTotal&excelDownYear='+year;
		}
	}
	function openSMS(profname, proftel)
	{
		var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
		window.open('<html:rewrite page="/cmnPopupSendSMS.act?task=list&popflag=prof&username_array=' + profname + '&cellphone_array=' + proftel +'"/>', 'course', 'scrollbars=no, menubar=no, width=650, height=490, status=yes top=' + wint + ', left=' + winl);
	}

	function openEMAIL(profname, profemail)
	{
		var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
		window.open('<html:rewrite page="/cmnPopupSendEMail.act?task=list&username_array='+profname+'&email_array='+profemail +'"/>', 'course', 'scrollbars=no, menubar=no, width=650, height=490, status=yes top=' + wint + ', left=' + winl);
	}
	function ozReport(profno)
	{
		window.open('<html:rewrite page="/ozMenu.act"/>?report=professor_info&profno=' + profno, 'professor_info', 'scrollbars=no, resizable=yes, menubar=no, width=710, height=550, status=yes');
	}
	
	function excelUpload()
	{
		var file = document.forms[1].file.value;

		if(file == "") {
			alert("���ε� ������ �����Ͽ� �ֽʽÿ�.");
			document.forms[1].file.focus();
			return;
		}
		
		document.forms[1].submit();
	}
	

// 	jQuery(function(){
// 		jQuery('#searchKeyword').on('change', function(){
// 			jQuery.ajax({
// 				url : '/prfBaseInfo.act',
// 				data : 'task=selectSubject&searchCourseCode='+jQuery('#searchCourseName').val()+'0'+jQuery('#searchKeyword').val()+'000',
// 				dataType : 'json',
// 				success : function(data){
// 					jQuery('#searchSubject').empty().append('<option value="">���� ����</option>');
// 					jQuery.each(data, function(){
// 						jQuery('#searchSubject').append('<option value="'+this.subjseq+'">'+this.subjname+'</option>');
// 					});
// 				}
// 			});
// 		});

// 	});
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">����������</h2>
				<h1>
					<img alt="��������" src="/images/teacher/title_01.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<!--�˻� -->
			<html:form method="POST" action="prfBaseInfo.act?task=list">
				<html:hidden property="professorNo" />
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 1px solid #D6D6D6">
					<colgroup>
						<col width="100px"/>
						<col width="2px"/>
						<col width="260px"/>
						<col width="2px"/>
						<col width="100px"/>
						<col width="2px"/>
						<col width="180px"/>
						<col width="2px"/>
						<col width="100px"/>
						<col width="2px"/>
						<col />
					</colgroup>
					<tr valign="middle">
						<td width="90" class="s1">�Ⱓ</td>
						<td class="sBar"></td>
						<td class="s2" width="185">
							<html:text property="searchFromDate" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true" />
							<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor: hand" onclick="Calendar_M(document.forms[0].searchFromDate);" />
							~&nbsp;
							<html:text property="searchToDate" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true" />
							<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor: hand" onclick="Calendar_M(document.forms[0].searchToDate);" />
						</td>
						<td class="sBar"></td>
						<td width="90" class="s1">������</td>
						<td class="sBar"></td>
						<td class="s2">
							<%-- <select id="searchYear"></select>
							<select id="searchCourseName" >
								<option value="">���� ����</option>
							</select>
							<select id="searchKeyword">
								<option value="">������� ����</option>
							</select>
							<html:hidden property="searchColumn"/>
							<html:hidden property="searchCourseCode"/> --%>
							<html:text property="searchCourseName" onkeydown="javascript:if (event.keyCode == 13) { doSearch(document.forms[0]); }" />
						</td>
						<td class="sBar"></td>
						<td width="90" class="s1">�����</td>
						<td class="sBar"></td>
						<td class="s2" width="185">
							<html:text property="searchSubjName" onkeydown="javascript:if (event.keyCode == 13) { doSearch(document.forms[0]); }" />
						</td>
					</tr>
					<tr>
						<td colspan="12" class="lbg3"></td>
					</tr>
					<tr valign="middle">
						<td width="90" class="s1">���Ǻо�</td>
						<td class="sBar"></td>
						<td class="s2" width="185">
							<html:select property="searchLecType" style="width:120px">
								<html:optionsCollection name="prfLecCode" property="beanCollection" />
							</html:select>
						</td>
						<td class="sBar"></td>
						<td width="90" class="s1">������</td>
						<td class="sBar"></td>
						<td class="s2" width="140">
							<html:select property="searchProfLevel" style="width:120px">
								<html:optionsCollection name="prfProLevelCode" property="beanCollection" />
							</html:select>
						</td>
						<td class="sBar"></td>
						<td width="90" class="s1">������</td>
						<td class="sBar"></td>
						<td class="s2">
							<html:select property="searchGradeCode" style="width:130px">
								<html:optionsCollection name="prfGradeCode" property="beanCollection" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td colspan="12" class="lbg3"></td>
					</tr>
					<tr>
						<td width="90" class="s1">����</td>
						<td class="sBar"></td>
						<td class="s2">
							<html:select property="searchAreaCode" style="width:50px">
								<html:optionsCollection name="prfAreaCode" property="beanCollection" />
							</html:select>
						</td>
						<td class="sBar"></td>
						<td class="s1">����</td>
						<td class="sBar"></td>
						<td class="s2">
							<html:text property="searchName" style="width:114px;" onkeydown="javascript:if (event.keyCode == 13) { doSearch(document.forms[0]); }" />
						</td>
						<td class="sBar"></td>
						<td class="s2" colspan="7"></td>
						<td width="60" align="center">
							<img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="doSearch(document.forms[0]);" style="cursor: hand" align="absbottom" />
						</td>
					</tr>
				</table>
				<!--�˻� ��-->
				<table width="750" cellspacing="0" cellpadding="0">
					<tr valign="bottom">
						<td class="t4" height="25" id="prof_count"></td>
					</tr>
				</table>
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #50a1f0">
					<tr>
						<td>
							<!--���̺� ��� ����-->
							<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
								<tr>
									<td class="t1Line" width="40"></td>
									<td class="t1Line" width="50">����</td>
									<td class="t1Line" width="60">�������</td>
									<td class="t1Line" >�Ҽ�</td>
									<td class="t1Line" width="90">����</td>
									<td class="t1Line" width="90">������</td>
									<!-- <td class="t1Line">���Ǻо�</td> -->
									<!-- <td class="t1Line" width="90">SMS/E-mail</td> -->
									<td class="t1Line" width="35">�ⰭȽ��</td>
<!-- 									<td class="t1Line" width="45">������</td> -->
									<td class="t1Line" width="45">�Ⱝ</td>
									<!-- <td class="t1Line" width="45">�Ұ���</td> -->
									<td class="t1Line" width="62">�����̷�</td>
								</tr>
							</table>
							<!--���̺� ��� ��-->
							<!--����Ʈ ����-->
							<div id="mainList" style="width: 746px; z-index: 0; overflow-y: scroll; overflow-x: hidden">
								<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
									<c:forEach var="list" items="${rsPrf_ProfInfoList}" varStatus="i">
										<c:if test="${i.count%2 == 0}">
											<c:set var="lineBg" scope="request" value="tbg3" />
										</c:if>
										<c:if test="${i.count%2 == 1}">
											<c:set var="lineBg" scope="request" value="" />
										</c:if>
										<tr class="${lineBg}">
											<c:if test="${list.infoDelYn != 'Y'}">
												<td class="t2Line" width="40">
													<c:out value="${i.count}" />
												</td>
												<td class="t2Line" width="50">
													&nbsp;<a href="#" onclick="modifyProf('${list.professorNo}','');"><u>${list.profName}</u></a>
												</td>
												<td class="t2Line" width="60">
													&nbsp;${fn:substring(list.juminNo, 0, 6)}
												</td>
												<td class="t3Line" >
													&nbsp;
													<c:out value="${list.workPlace}" />
												</td>
												<td class="t2Line" width="90">
													<c:out value="${list.workPos}" />
												</td>
												<td class="t2Line" width="90">
													<c:out value="${list.jobCode}" />
												</td>
<%--
												<td class="t2Line">
													<c:out value="${list.lectureType}" />
												</td>
--%>
 												<%-- <td class="t2Line" width="90">
				  <img src='<html:rewrite page="/images/board/btn_s_sms.gif"/>' align="absmiddle" alt="SMS" onclick="openSMS('${list.profName}','${list.cellPhone}')" style="cursor:hand"/>
				  <img src='<html:rewrite page="/images/board/btn_s_email.gif"/>' align="absmiddle" alt="E-mail" onclick="openEMAIL('${list.profName}','${list.email}')" style="cursor:hand" />
				</td> --%>
												<td class="t2Line" width="35">
													${list.lectCount }
												</td>
<!-- 												<td class="t2Line" width="45"> -->
<%-- 													<img src='<html:rewrite page="/images/board/btn_s_search2.gif"/>' align="absmiddle" alt="��ȸ" onclick='showSatis(${list.professorNo})' style="cursor: hand" /> --%>
<!-- 												</td> -->
												<td class="t2Line" width="45">
													<img src='<html:rewrite page="/images/board/btn_s_search2.gif"/>' align="absmiddle" alt="��ȸ" onclick='showLectList(${list.professorNo});' style="cursor: hand" />
												</td>
												<%--<td class="t2Line" width="45">
													<c:if test="${list.profIntroFile != null}">
														<c:set var="filetype" scope="request" value="N" />
														<c:if
															test="${list.realFileType == 'hwp' || list.realFileType == 'ppt' || list.realFileType == 'xls' || list.realFileType == 'doc' ||
					  list.realFileType == 'txt' || list.realFileType == 'pdf' || list.realFileType == 'bmp' || list.realFileType == 'gif' || list.realFileType == 'jpg'}">
															<c:set var="filetype" scope="request" value="Y" />
														</c:if>
														<c:if test="${filetype == 'Y'}">
															<img src='<html:rewrite page="/images/board/${list.realFileType}.gif"/>' align="absmiddle" alt="${list.profName}_�Ұ���.${list.realFileType}" onclick="location.href= '<html:rewrite page="/downLoad.act?downType=prof_info&downName=${list.profName}&fileName=${list.profIntroFile}"/>'" style="cursor: hand" />
														</c:if>
														<c:if test="${filetype == 'N'}">
															<img src='<html:rewrite page="/images/board/etc.gif"/>' align="absmiddle" alt="${list.profName}_�Ұ���.${list.realFileType}" onclick="location.href= '<html:rewrite page="/downLoad.act?downType=prof_info&downName=${list.profName}&fileName=${list.profIntroFile}"/>'" style="cursor: hand" />
														</c:if>
													</c:if>
												</td>--%>
												<td class="t2Line" width="45">
													<img src='<html:rewrite page="/images/board/btn_s_print.gif"/>' align="absmiddle" alt="�μ�" style="cursor: hand" onclick="ozReport(${list.professorNo});" />
												</td>
											</c:if>
											<c:if test="${list.infoDelYn == 'Y'}">
												<td class="t2Line" width="50">
													<c:out value="${i.count}" />
												</td>
												<td class="t2Line">
													&lt;
													<c:out value="${list.profName}" />
												</td>
												<td class="t2Line" width="470">������������</td>
												<td class="t2Line" width="60">
													<img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle" alt="����" onclick='modifyProf(${list.professorNo});'
														style="cursor: hand" />
												</td>
											</c:if>
										</tr>
										<c:set value="${i.count}" var="count"></c:set>
									</c:forEach>
									<c:if test="${count==null}">
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
				<!--�ϴܹ�ư ���̺� ����-->
				<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
					<tr valign="middle">
						<td>
							<html:select property="excelDownYear" value="${thisYear}" style="width:70px;">
								<html:optionsCollection name="applyYear" property="beanCollection" />
							</html:select>
							<img src='<html:rewrite page="/images/board/btn_prof_info.gif"/>' alt="��������" align="absmiddle" onclick="exceldownProf();" style="cursor: hand">
							<img src='<html:rewrite page="/images/board/btn_prof_total.gif"/>' alt="���纰����" align="absmiddle" onclick="excelProfTotal();" style="cursor: hand">
						</td>
						<td align="right">
							<img src='<html:rewrite page="/images/board/btn_excel.gif"/>' alt="�����ٿ�ε�" align="absmiddle" onclick="doExcel(document.forms[0])" style="cursor: hand" />
							<img src='<html:rewrite page="/images/board/btn_up2.gif"/>' alt="�űԵ��" align="absmiddle" onclick="newProf();" style="cursor: hand" />
						</td>
					</tr>
				</table>
				<!--�ϴܹ�ư ���̺� ��-->
			</html:form>
			<html:form action='prfBaseInfo.act?task=excelUp' enctype="multipart/form-data" >
				<table width="750" border="0" cellspacing="0" cellpadding="0" >
					<tr valign="middle">
						<td align="right">
							<html:file property="file" style="width:330px;"></html:file>
							<img src='<html:rewrite page="/images/board/btn_upload.gif"/>' alt="���ε�" align="absmiddle" onclick="excelUpload()" style="cursor:hand"/>
							<img src='<html:rewrite page="/images/board/btn_dawnload.gif"/>' align="absmiddle" alt="�Է¾�� �ٿ�ε�" onclick="location.href='<html:rewrite page="/prfBaseInfo.act?task=sample"/>'" style="CURSOR:hand" />
						</td>
					</tr>
				</table>
			</html:form>
		</td>
	</tr>
</table>
<iframe id="actionFrame" width="0" height="0"></iframe>
<script type="text/javascript">
<!--
	tresize(245);
	var count = Number(${count});
	document.all.prof_count.innerHTML = '<b>������Ȳ : '+count+'/${prof_count}</b>';
//-->
</script>