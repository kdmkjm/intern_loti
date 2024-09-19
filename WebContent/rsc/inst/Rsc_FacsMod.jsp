<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>기자재 관리 - 신규등록</title>

<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
<!--
	function doSubmit(frm)
	{
		if(frm.facsType.value == "")
		{
			alert('물품명을 입력하세요.');
			frm.facsType.focus();
			return;
		}
		if(frm.count.value == "")
		{
			alert('수량을 입력하세요.');
			frm.count.focus();
			return;
		}
		if(frm.as_Corp.value == "")
		{
			alert('A/S 업체명을 입력하세요.');
			frm.as_Corp.focus();
			return;
		}
		var buyAmount = document.all.buyAmount.value;
		document.all.buyAmount.value = removeComma(buyAmount);
		
		if(document.all.buyAmount.value.length > 8)
		{
			document.all.buyAmount.value = buyAmount;
			alert('구입가격은 8자리 이상 입력할 수 없습니다.');
			frm.buyAmount.focus();
			return;
		}
		if(document.all.buyAmount.value == 'NaN')
		{
			document.all.buyAmount.value = '0';
		}
		
		var do_confirm = confirm('저장하시겠습니까?');
		if(do_confirm == true)
		{
			frm.submit();
		}
		else
		{
			document.all.buyAmount.value = buyAmount;			
		}
	}
	function goList()
	{		
		document.forms[0].action = 'rscInst.act?task=list';
		document.forms[0].submit();
	}
//-->
</script>
</head>

<body>
<html:form method="POST" action="/rscInst.act?task=insert" >
<html:hidden property="facsNo"/>
<html:hidden property="searchFacsType" value="${searchFacsType}"/>
<html:hidden property="searchKeyword" value="${searchKeyword}"/>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
</tr>
<tr>
	<td>
		<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/resources/title_01-3.gif"/>' alt="기자재 관리-신규등록"/></td>
		</tr>
		<tr>
			<td height="15"></td>
		</tr>
		<tr>
			<td>
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
				<tr>
					<td>
						<table width="746" border="0" cellspacing="0" cellpadding="0">
						<tr> 
							<td class="t1 cbg4" width="99" height="25"><span class="red">*</span>물품명</td>
							<td class="sBg" width="1"></td>
							<td class="t3" width="274">
								&nbsp;<html:select property="facsType"><html:optionsCollection name="facsTypeCode" property="beanCollection" /></html:select>
							</td> 
							<td class="sBg"></td>
							<td class="t1 cbg4" width="99">규격명</td>
							<td class="sBg"></td>
							<td class="t3">&nbsp;<html:text property='spec' style="width:95%;" maxlength="25"/></td>
						</tr>
						<tr>
							<td colspan="7" class="lbg3"></td>
						</tr>
						<tr> 
							
							<td class="t1 cbg4" width="99" height="25">제조회사</td>
							<td class="sBg"></td>
							<td class="t3" width="274">&nbsp;<html:text property='manuFact' style="width:95%;" maxlength="50"/></td>
							<td class="sBg"></td>
							<td class="t1 cbg4" width="99">구입일자</td>
							<td class="sBg"></td>
							<td class="t3">&nbsp;<html:text property="buyDate" style="width:100px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, buyDate, 'yyyy-mm-dd');"></td>
						</tr>
						<tr>
							<td colspan="7" class="lbg3"></td>
						</tr>
						<tr> 
							<td class="t1 cbg4" width="99" height="25">취득단가</td>
							<td class="sBg"></td>
							<td class="t3" width="274">&nbsp;<html:text property='buyAmount' style="width:100px; IME-MODE:disabled; direction:rtl;" maxlength="10" onkeydown="key_num()" onkeyup="this.value=setComma(this.value)"/></td>
							<td class="sBg"></td>
							<td class="t1 cbg4" width="99"><span class="red">*</span>수량</td>
							<td class="sBg"></td>
							<td class="t3">&nbsp;<html:text property='count' style="width:100px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()"/></td>
						</tr>
						<tr>
							<td colspan="7" class="lbg3"></td>
						</tr>
						<tr> 
							<td class="t1 cbg4" width="99" height="25">설치장소</td>
							<td class="sBg" width="1"></td>
							<td class="t3" width="274">&nbsp;<html:text property='place' style="width:95%;" maxlength="50"/></td>
							<td class="sBg"></td>
							<td class="t1 cbg4" width="99">정수여부</td>
							<td class="sBg"></td>
							<td class="t3">&nbsp;<html:text property='purpose' style="width:100px;" maxlength="25"/></td>
						</tr>
						<tr>
							<td colspan="7" class="lbg3"></td>
						</tr>
						<tr> 
							<td class="t1 cbg4" width="99" height="25"><span class="red">*</span>AS 업체명</td>
							<td class="sBg"></td>
							<td class="t3" width="274">&nbsp;<html:text property='as_Corp' style="width:95%;" maxlength="15"/></td>
							<td class="sBg"></td>
							<td class="t1 cbg4" width="99">AS 연락처</td>
							<td class="sBg"></td>
							<td class="t3">&nbsp;<html:text property='as_Phone' style="width:95%; IME-MODE:disabled" maxlength="20" onkeydown="key_num_minus()"/></td>
						</tr>
						<tr>
							<td colspan="7" class="lbg3"></td>
						</tr>
						<tr> 
							<td class="t1 cbg4" width="99" height="75">수리이력</td>
							<td class="sBg"></td>
							<td class="t3" colspan="5">&nbsp;<html:textarea property="as_Log" style="width:98%; height:70px"></html:textarea></td>
						</tr>
						</table>
					</td>
				</tr>
				</table>
				<!--하단버튼 테이블 시작-->
				<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
				<tr valign="bottom"> 
					<td align="right">
						<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록" onclick="goList();" style="cursor:hand"/> 
					  <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="저장" onclick="doSubmit(document.forms[0]);" style="cursor:hand"/>
				  </td>
				</tr>
				</table>
				<!--하단버튼 테이블 끝-->
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>
</html:form>
</body>
</html>
<script type="text/javascript">
<!--
	var num = document.all.buyAmount.value;
	document.all.buyAmount.value = setComma(num);
//-->
</script>
