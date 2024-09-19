<%@ page language="java"%>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti"%>
<script language="JavaScript">
<!--
	window.onresize = function() {
	    //   윈도우 사이즈 변경 셋팅 코드
	    tresize(165);
    }

    function doSubmit(frm) {
	    var max = Number(document.all.max.value);
	    var count = 0;
	    if (max == 1) {
		    if (document.all.isselectedarray.checked == true) {
			    count++;
		    }
	    } else {
		    for (var i = 0; i < max; i++) {
			    if (document.all.isselectedarray[i].checked == true) {
				    count++;
			    }
		    }
	    }

	    if (count == 0) {
		    var do_confirm;

		    do_confirm = confirm('선택한 교육생이 없습니다. 계속하시겠습니까?');
		    if (do_confirm == false) {
			    return;
		    }
	    }

	    frm.submit();
    }

    // 페이지 처음 열릴경우 기본값으로 조회
    function searchList(key) {
	    if (key == "move") {
		    document.forms[0].submit();
	    }
    }

    function checkAll() {
	    var max = Number(document.all.max.value);
	    if (max == 0) {
		    alert("조회된 데이터가 없습니다.");
		    return;
	    }

	    if (max == 1) {
		    if (document.all.isselectedarray.checked == false)
			    document.all.isselectedarray.checked = true;
		    else
			    document.all.isselectedarray.checked = false;
	    } else {
		    if (document.all.isselectedarray[0].checked == false)
			    for (var i = 0; i < max; i++)
				    document.all.isselectedarray[i].checked = true;
		    else
			    for (var i = 0; i < max; i++)
				    document.all.isselectedarray[i].checked = false;
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
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'>
						<img src='<html:rewrite page="/images/operation/title_07-2.gif"/>' alt="교육인원확정-교육인원선발" width="239" height="18" />
					</td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<table width="750" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="25" class="stitle">
									<img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />소속 : ${organname}
								</td>
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
									<!--테이블 헤더 시작-->
									<table width="750" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td class="lbg"></td>
											<td class="cbg">
												<table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
													<tr>
														<td class="t1" width="39">
															<a href="#" onclick="checkAll();"><u>선택</u></a>
														</td>
														<td class="sBg"></td>
														<td class="t1" width="169">소속</td>
														<td class="sBg"></td>
														<td class="t1" width="99">직급</td>
														<td class="sBg"></td>
														<td class="t1" width="69">직렬</td>
														<td class="sBg"></td>
														<td class="t1" width="59">성명</td>
														<td class="sBg"></td>
														<td class="t1">요약</td>
														<td width="17"></td>
													</tr>
												</table>
											</td>
											<td class="lbg"></td>
										</tr>
									</table>
									<!--테이블 헤더 시작-->
								</td>
							</tr>
							<tr>
								<td>
									<table width="750" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td class="lbg2"></td>
											<td width="746">
												<table width="746" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td valign="top">
															<html:form action="oprStudentFix.act?task=insert">
																<input type="hidden" name="chieforgan" value="${chieforgan}">
																<!--리스트 시작-->
																<div id="mainList" style="width: 746px; overflow-y: scroll; overflow-x: hidden;">
																	<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
																		<c:forEach var="organList" items="${rsOpr_StudentFixSelectList}" varStatus="i">
																			<c:if test="${organList.isselected eq 'Y'}">
																				<c:set var="check" value="checked" />
																			</c:if>
																			<c:if test="${organList.isselected ne 'Y'}">
																				<c:set var="check" value="" />
																			</c:if>
																			<c:if test="${i.count%2 == 0}">
																				<c:set var="lineBg" scope="request" value="tbg3" />
																			</c:if>
																			<c:if test="${i.count%2 == 1}">
																				<c:set var="lineBg" scope="request" value="" />
																			</c:if>
																			<tr class="${lineBg}">
																				<td class="t2" width="39">
																					<input type="checkbox" name="isselectedarray" value="${i.count}" ${check}>
																				</td>
																				<td class="sBg"></td>
																				<td class="t3" width="169">&nbsp;${organList.assignname }</td>
																				<td class="sBg"></td>
																				<td class="t2" width="99">${organList.rankname }</td>
																				<td class="sBg"></td>
																				<td class="t2" width="69">${organList.jobname }</td>
																				<td class="sBg"></td>
																				<td class="t2" width="59">${organList.stdname }</td>
																				<td class="sBg"></td>
																				<td class="t3">&nbsp;${organList.remark}</td>
																			</tr>
																			<tr>
																				<td class="lbg3" colspan="13"></td>
																			</tr>
																			<c:set value="${i.count}" var="count"></c:set>
																			<input type="hidden" name="seqarray" value="${organList.seq }">
																			<input type="hidden" name="juminnoarray" value="${organList.juminno }">
																		</c:forEach>
																	</table>
																</div>
																<!--리스트 끝-->
																<input type="hidden" name="max" value="${count}">
																<input type="hidden" name="courseCode" value="${courseCode}">
																<input type="hidden" name="courseName" value="${courseName}">
															</html:form>
														</td>
													</tr>
												</table>
											</td>
											<td class="lbg2"></td>
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
											<td>
												<c:if test="${chkMod eq 'Y'}">
													<img src='<html:rewrite page="/images/board/btn_selection.gif"/>' width="57" height="25" align="absmiddle" alt="선발"
														onclick="doSubmit(document.forms[0]);" style="cursor: hand" />
												</c:if>
												<c:if test="${chkMod ne 'Y'}">
													<%--<img src='<html:rewrite page="/images/board/btn_selection_off.gif"/>' width="57" height="25" align="absmiddle" alt="선발" /> --%>
													<img src='<html:rewrite page="/images/board/btn_selection.gif"/>' width="57" height="25" align="absmiddle" alt="선발"
														onclick="doSubmit(document.forms[0]);" style="cursor: hand" />
												</c:if>
												<img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" align="absmiddle" alt="목록"
													onclick="location.href='<html:rewrite page="/oprStudentFix.act?task=list&searchCourseCode=${courseCode}&searchCourseName=${courseName}"/>'"
													style="cursor: hand" />
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		<td></td>
	</tr>
</table>
<script type="text/javascript">
<!--
	tresize(165);
    searchList('${key}');
//-->
</script>
