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
	
	function doSubmit(frm)
	{
		var do_confirm = confirm('저장하시겠습니까?');
		if(do_confirm == true)
			frm.submit();
	}
	
	var prev = ""; 
	var regexp = /^\d*(\.\d{0,1})?$/; 
	function imsi(obj) 
	{ 
		if(obj.value.search(regexp)==-1) 
		{ 
			obj.value = prev; 
		} 
		else 
		{ 
			prev = obj.value; 
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
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/operation/title_12-2.gif"/>' alt="근태관리-세부"/></td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<html:form method="POST" action="/oprAttend.act?task=update" >
						<html:hidden property="courseCode"	value="${rsOpr_Attend.courseCode}"/>
						<html:hidden property="courseName"	value="${rsOpr_Attend.courseName}"/>
						<html:hidden property="seq"					value="${rsOpr_Attend.seq}"/>
						<html:hidden property="eduDate" 		value="${rsOpr_Attend.searchDate}"/>
						<!-- 기본정보 시작-->
						<table width="750" cellspacing="0" cellpadding="0">
							<tr> 
                <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>'  align="absmiddle" alt="" />기본정보</td>
              </tr>
						</table>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<!--테이블 헤더 시작-->
									<table width="746" border="0" cellspacing="0" cellpadding="0">
										<tr> 
										  <td class="t1 cbg4" width="99">성명</td>
										  <td class="sBg"></td>
										  <td class="t3" width="220">&nbsp;<c:out value="${rsOpr_Attend.stdName}"/></td>
										  <td class="sBg"></td>
										  <td class="t1 cbg4" width="99">소속</td>
										  <td class="sBg"></td>
										  <td class="t3">&nbsp;<c:out value="${rsOpr_Attend.assignName}"/></td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr> 
										  <td class="t1 cbg4" width="99">직급</td>
										  <td class="sBg"></td>
										  <td class="t3" width="220">&nbsp;<c:out value="${rsOpr_Attend.rankName}"/></td>
										  <td class="sBg"></td>
										  <td class="t1 cbg4" width="99">직위</td>
										  <td class="sBg"></td>
										  <td class="t3">&nbsp;<c:out value="${rsOpr_Attend.gradeName}"/></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<!-- 기본정보 끝-->
						<!-- 근태정보 시작-->
						<table width="750" cellspacing="0" cellpadding="0">
							<tr>
								<td height="15"></td>
							</tr>
							<tr> 
                <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>'  align="absmiddle" alt="" />근태정보</td>
              </tr>
						</table>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<table width="746" border="0" cellspacing="0" cellpadding="0">
										<tr> 
										  <td class="t1 cbg4" width="99">과정</td>
										  <td class="sBg"></td>
										  <td class="t3" width="220">&nbsp;<c:out value="${rsOpr_Attend.courseName}"/></td>
										  <td class="sBg"></td>
										  <td class="t1 cbg4" width="99">일자</td>
										  <td class="sBg"></td>
										  <td class="t3">&nbsp;<c:out value="${rsOpr_Attend.eduDate}"/></td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr> 
										  <td class="t1 cbg4" width="99">출결여부</td>
										  <td class="sBg"></td>
										  <td class="t3" colspan="5">
										  	<c:if test="${rsOpr_Attend.attendYN == 'Y'}">
											    <input type="radio" name="attendYN" value="Y" checked>출석&nbsp;&nbsp;
											    <input type="radio" name="attendYN" value="N">결석
												</c:if> 
										  	<c:if test="${rsOpr_Attend.attendYN == 'N'}">
											    <input type="radio" name="attendYN" value="Y">출석&nbsp;&nbsp;
											    <input type="radio" name="attendYN" value="N" checked>결석
												</c:if>
											</td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr> 
										  <td class="t1 cbg4" width="99">세부내용</td>
										  <td class="sBg"></td>
										  <td class="t3" colspan="5"> 
										    &nbsp;<html:select property="attendGubn" value="${rsOpr_Attend.attendGubn}" style="width:105px">
										    	<html:optionsCollection name="attendCode" property="beanCollection" />
									    	</html:select>
									    </td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr> 
										  <td class="t1 cbg4" width="99">감점점수</td>
										  <td class="sBg"></td>
										  <td class="t3" colspan="5">&nbsp;<html:text property="atndScore" value="${rsOpr_Attend.atndScore}" style="width:100px; IME-MODE:disabled" maxlength="7" onkeyup="imsi(this)"/></td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr> 
										  <td class="t1 cbg4" width="99">비고</td>
										  <td class="sBg"></td>
										  <td class="t3" colspan="5">&nbsp;<textarea name="remarks" style="width:98%" rows="5" value="${rsOpr_Attend.remarks}"></textarea></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<!-- 근태정보 끝-->
						<!--하단버튼 테이블 시작-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
						  <tr valign="bottom"> 
						    <td align="right">
						    	<img src='<html:rewrite page="/images/board/btn_list.gif"/>' alt="목록" align="absmiddle" style="cursor:hand" onclick="document.location.href=document.referrer;"/>
						    	<img src='<html:rewrite page="/images/board/btn_save.gif"/>' alt="저장" align="absmiddle" style="cursor:hand" onclick="doSubmit(document.forms[0]);"/>
						    </td>
						  </tr>
						</table>
						</html:form>
					</td>
				</tr>
			</table>
		</td>
  </tr>
</table>