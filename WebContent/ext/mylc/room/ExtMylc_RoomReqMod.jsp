<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
	function doSubmit(frm)
	{
		if(frm.reqName.value == "")
		{
			alert('대여자를 입력하세요.');
			frm.reqName.focus();
			return;
		}
		if(frm.lendFrom.value == "")
		{
			alert('대여시작 날짜를 입력하세요.');
			frm.lendFrom.focus();
			return;
		}
		if(frm.lendTo.value == "")
		{
			alert('대여종료 날짜를 입력하세요.');
			frm.lendTo.focus();
			return;
		}
		if(replace(frm.lendFrom.value, "-", "") > replace(frm.lendTo.value, "-", ""))
		{
			alert('대여종료 날짜가 대여시작 날짜보다 이전일 수 없습니다.');
			return;
		}
		if(frm.reqPhone.value == "")
		{
			alert('연락처를 입력하세요.');
			frm.reqPhone.focus();
			return;
		}
		if(frm.lendWhy.value == "")
		{
			alert('대여사유를  입력하세요.');
			frm.lendWhy.focus();
			return;
		}
		var do_confirm = confirm('저장하시겠습니까?');
		if(do_confirm == true)
			frm.submit();
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
</tr>
<tr>
	<td>
		<html:form method="POST" action="/extMylcRoom.act?task=insert" >
		<html:hidden property="lendSeq"/>
		<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>' width="200"><img src='<html:rewrite page="/images/resources/title_09-3.gif"/>' alt="교육장 대여신청"/></td>
			<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>' width="550" valign="bottom">
				<table width="308" border="0" cellspacing="0" cellpadding="0" align="right">
				<tr> 
					<td width="103">
						<img name="Image10" border="0" src='<html:rewrite page="/images/resources/tab_01.gif"/>' alt="교육장 대여안내" 
							onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=lentInfo"/>'"  
							onMouseOut="MM_swapImgRestore()" 
							onMouseOver="MM_swapImage('Image10','','<html:rewrite page="/images/resources/tab_01_over.gif"/>',1)" style="cursor:hand"/>
					</td>
					<td width="103">
						<img name="Image11" border="0" src='<html:rewrite page="/images/resources/tab_02.gif"/>' alt="대여현황"
							onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=month"/>'"  
							onMouseOut="MM_swapImgRestore()" 
							onMouseOver="MM_swapImage('Image11','','<html:rewrite page="/images/resources/tab_02_over.gif"/>',1)" style="cursor:hand"/>
					</td>
					<td width="102">
						<img name="Image12" border="0" src='<html:rewrite page="/images/resources/tab_03_over.gif"/>' alt="대여신청" 
							onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=list"/>'"  
							onMouseOut="MM_swapImgRestore()" 
							onMouseOver="MM_swapImage('Image12','','<html:rewrite page="/images/resources/tab_03_over.gif"/>',1)" style="cursor:hand"/>
					</td>
				</tr>
	            </table>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="15"></td>
		</tr>
		<tr> 
			<td class="stitle" colspan="2"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" />교육장대여신청 - 수정 및 등록</td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
				<tr>
					<td>
						<!--테이블 헤더 시작-->
						<table width="746" border="0" cellspacing="0" cellpadding="0">
						<tr> 
							<td class="t1 cbg4" width="109" height="25"><span class="red">*</span>강의실</td>
							<td class="sBg"></td>
							<td class="t3" width="230">&nbsp;<html:select property="roomNo" style="width:105px"><html:optionsCollection name="roomNoCode" property="beanCollection" /></html:select></td>
							<td class="sBg"></td>
							<td class="t1 cbg4" width="109"><span class="red">*</span>대여자</td>
							<td class="sBg"></td>
							<td class="t3" width="295">
								&nbsp;<c:out value="${userName}(${organName})"/>
								<html:hidden property="reqName" value="${userName}"/>
								<html:hidden property="reqOrgan" value="${organName}"/>
							</td>
						</tr>
						<tr>
							<td colspan="7" class="lbg3"></td>
						</tr>
						<tr> 
							<td class="t1 cbg4" height="25"><span class="red">*</span>대여시작</td>
							<td class="sBg"></td>
							<td class="t3">&nbsp;<html:text property="lendFrom" style="width:100px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, lendFrom, 'yyyy-mm-dd');"></td>
							<td class="sBg"></td>
							<td class="t1 cbg4"><span class="red">*</span>대여종료</td>
							<td class="sBg"></td>
							<td class="t3">&nbsp;<html:text property="lendTo" style="width:100px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, lendTo, 'yyyy-mm-dd');"></td>
						</tr>
						<tr>
							<td colspan="7" class="lbg3"></td>
						</tr>
						<tr> 
							<td class="t1 cbg4" height="25"><span class="red">*</span>연락처</td>
							<td class="sBg"></td>
							<td class="t3">&nbsp;<html:text property="reqPhone" style="width:100px; IME-MODE:disabled" maxlength="13" onkeydown="key_num_minus()"></html:text></td>
							<td class="sBg"></td>
							<td class="t1 cbg4"><span class="red">*</span>사용인원</td>
							<td class="sBg"></td>
							<td class="t3">&nbsp;<html:text property="lendPeople" style="width:100px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()"/></td>
						</tr>
						<tr>
							<td colspan="7" class="lbg3"></td>
						</tr>
						<tr> 
							<td class="t1 cbg4" height="25"><span class="red">*</span>대여사유</td>
							<td class="sBg"></td>
							<td class="t3" colspan="5">&nbsp;<html:textarea property="lendWhy" style="width:98%;" rows="5" /></td>
						</tr>
						</table>
						<!--테이블 헤더 끝-->
					</td>
				</tr>
				</table>
				<!--	게시물 아래 버튼 시작	-->
				<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
					<tr valign="bottom"> 
						<td align="right">
							<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록" onclick="document.location.href=document.referrer;" style="cursor:hand"/>
						  <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="저장" onclick="doSubmit(document.forms[0]);" style="cursor:hand"/>
						</td>
					</tr>
				</table>
				<!--게시물 아래 버튼 끝-->
			</td>
		</tr>
		</table>
		</html:form>
	</td>
</tr>
</table>