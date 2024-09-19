<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />

<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script language="JavaScript">
	function doSubmit(frm)
	{
		if(frm.stdHour.value == "")
		{
			alert('기준시간을 입력하세요.');
			frm.stdHour.focus();
			return;
		}
		if(frm.basePay.value == "")
		{
			alert('기본을 입력하세요.');
			frm.basePay.focus();
			return;
		}
		if(frm.exceedPay.value == "")
		{
			alert('초과를 입력하세요.');
			frm.exceedPay.focus();
			return;
		}
		var basePay = document.all.basePay.value;
		document.all.basePay.value = removeComma(basePay);

		if(document.all.basePay.value.length > 7)
		{
			document.all.basePay.value = basePay;
			alert('기본수당은 7자리 이상 입력할 수 없습니다.');
			frm.basePay.focus();
			return;
		}
		var exceedPay = document.all.exceedPay.value;
		document.all.exceedPay.value = removeComma(exceedPay);
		if(document.all.exceedPay.value.length > 7)
		{
			document.all.exceedPay.value = exceedPay;
			alert('초과수당은 7자리 이상 입력할 수 없습니다.');
			frm.exceedPay.focus();
			return;
		}


		var do_confirm = confirm('저장하시겠습니까?');
		if(do_confirm == true)
		{
			frm.submit();
		}
		else
		{
			document.all.basePay.value = basePay;
			document.all.exceedPay.value = exceedPay;
		}
	}


	/**
	* 천단위 콤마 표시
	* @param n
	* @return
	*/
	function setComma(n)
	{
		var commaNum= Number(String(n).replace(/\..*|[^\d]/g,"")).toLocaleString().slice(0,-3);
		return commaNum;
	}

	/**
	* 천단위 콤마 제거
	* @param n
	* @return
	*/
	function removeComma(n)
	{
 		str = parseInt(n.replace(/,/g, ""));
 		return str;
	}
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
						<img src='<html:rewrite page="/images/teacher/title_03-2.gif"/>' alt="강사료 지급 기준 - 수정" />
					</td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<html:form method="POST" action="/prfPayStandard.act?task=insert">
							<html:hidden property="profLevel" />
							<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #91B475">
								<tr>
									<td>
										<table width="746" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="t1 cbg4" width="119" height="25">구분</td>
												<td class="sBg" width="1"></td>
												<td class="t3" width="648">
													&nbsp;
													<c:out value="${rsPrf_PayStandard.levelName}" />
												</td>
											</tr>
											<tr>
												<td colspan="3" class="lbg3"></td>
											</tr>
											<tr>
												<td class="t1 cbg4" width="119">세부지급대상</td>
												<td class="sBg" width="1"></td>
												<td class="t3" width="648">
													&nbsp;
													<html:textarea property="payTarget" style="width:98%; height:100px"></html:textarea>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="lbg3"></td>
											</tr>
											<tr>
												<td class="t1 cbg4" width="119" height="25">
													<span class="red">*</span>기준시간
												</td>
												<td class="sBg" width="1"></td>
												<td class="t3" width="648">
													&nbsp;
													<html:text property='stdHour' style="width:100px; IME-MODE:disabled" maxlength="2" onkeydown="key_num()"></html:text>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="lbg3"></td>
											</tr>
											<tr>
												<td class="t1 cbg4" width="119" height="25">
													<span class="red">*</span>기본
												</td>
												<td class="sBg" width="1"></td>
												<td class="t3" width="648">
													&nbsp;
													<html:text property='basePay' style="width:100px; IME-MODE:disabled" maxlength="9" onkeydown="key_num()" onkeyup="this.value=setComma(this.value)"></html:text>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="lbg3"></td>
											</tr>
											<tr>
												<td class="t1 cbg4" width="119" height="25">
													<span class="red">*</span>초과
												</td>
												<td class="sBg" width="1"></td>
												<td class="t3" width="648">
													&nbsp;
													<html:text property='exceedPay' style="width:100px; IME-MODE:disabled" maxlength="9" onkeydown="key_num()"
														onkeyup="this.value=setComma(this.value)"></html:text>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="lbg3"></td>
											</tr>
											<tr>
												<td class="t1 cbg4" width="119" height="25">
													<span class="red">*</span>강사구분
												</td>
												<td class="sBg" width="1"></td>
												<td class="t3" width="648">
													&nbsp;
													<html:select property="profGubn" style="width:100px;">
														<html:optionsCollection name="profGubnCode" property="beanCollection" />
													</html:select>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="lbg3"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<!--하단버튼 테이블 시작-->
							<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
								<tr valign="bottom">
									<td align="right">
										<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록"
											onclick='location.href="<html:rewrite page="/prfPayStandard.act?task=list"/>"' style="cursor: hand" />
										<img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="저장" onclick="doSubmit(document.forms[0]);" style="cursor: hand" />
									</td>
								</tr>
							</table>
							<!--하단버튼 테이블 끝-->
						</html:form>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
<!--
	var num1 = document.all.basePay.value;
	document.all.basePay.value = setComma(num1);
	var num2 = document.all.exceedPay.value;
	document.all.exceedPay.value = setComma(num2);
//-->
</script>