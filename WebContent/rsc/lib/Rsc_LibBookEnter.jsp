<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
<!--
	function doSubmit(frm)
	{
		if(frm.reqNo.value == "")
		{
			alert('청구기호를 입력하세요');
			frm.reqNo.focus();
			return;
		}
		if(frm.bookName.value == "")
		{
			alert('도서명을 입력하세요.');
			frm.bookName.focus();
			return;
		}
		if(frm.author.value == "")
		{
			alert('저자를 입력하세요.');
			frm.author.focus();
			return;
		}
		if(frm.publisher.value == "")
		{
			alert('출판사를 입력하세요.');
			frm.publisher.focus();
			return;
		}
		var buyAmount = document.all.buyAmount.value;
		document.all.buyAmount.value = removeComma(buyAmount);
		
		if(document.all.buyAmount.value.length > 10)
		{
			document.all.buyAmount.value = buyAmount;
			alert('도서가격은 10자리 이상 입력할 수 없습니다.');
			frm.buyAmount.focus();
			return;
		}
		if(document.all.buyAmount.value == 'NaN')
		{
			document.all.buyAmount.value = '0';
		}
		
		var do_confirm = confirm('저장하시겠습니까?');
		if(do_confirm == true)
			frm.submit();
	}
	function doDelete(frm)
	{
		var del_confirm = confirm('삭제하시겠습니까?');
		if(del_confirm == true)
		{
			document.forms[0].action = 'rscLib.act?task=delete';
			document.forms[0].submit();
		}
		else
		{
			return;
		}
	}
	function goList()
	{		
		document.forms[0].action = 'rscLib.act?task=list';
		document.forms[0].submit();
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
	</tr>
	<tr>
		<td>
			<html:form method="POST" action="/rscLib.act?task=insert" >
			<html:hidden property="bookCode" 				value="${rsRscLib.bookCode}"/>
			<html:hidden property="searchBookType" 	value="${searchBookType}"/>
			<html:hidden property="searchReqNo" 		value="${searchReqNo}"/>
			<html:hidden property="searchBookName" 	value="${searchBookName}"/>
			<html:hidden property="searchPublisher" value="${searchPublisher}"/>
			<html:hidden property="searchAuthor" 		value="${searchAuthor}"/>
			<html:hidden property="searchUserName" 	value="${searchUserName}"/>
			<html:hidden property="searchKeywordBookType1" 	value="${searchBookType}"/>
			<html:hidden property="searchKeywordReqNo" 			value="${searchReqNo}"/>
			<html:hidden property="searchKeywordBookName" 	value="${searchBookName}"/>
			<html:hidden property="searchKeywordPublisher" 	value="${searchPublisher}"/>
			<html:hidden property="searchKeywordAuthor" 		value="${searchAuthor}"/>
			<html:hidden property="searchKeywordUserName" 	value="${searchUserName}"/>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/resources/title_03-2.gif"/>' alt="도서관리"/></td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
                  <!--등록테이블 시작-->
                  <!--테이블 헤더 시작-->
									<table width="746" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="t1 cbg4" width="99" height="25"><span class="red">*</span>도서분류</td>
											<td class="sBg"></td>
                      <td class="t3" width="272">&nbsp;<html:select property="bookType1" style="width:100px;"><html:optionsCollection name="libTypeCode" property="beanCollection" /></html:select></td>
											<td class="sBg"></td>
                      <td class="t1 cbg4" width="99"><span class="red">*</span>청구기호</td>
											<td class="sBg"></td>
                      <td class="t3" width="273">&nbsp;<html:text property='reqNo' style="width:180px;" maxlength="15"/></td> 
                    </tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
                    <tr> 
											<td class="t1 cbg4" width="99" height="25"><span class="red">*</span>도서명</td>
											<td class="sBg"></td>
											<td class="t3" width="272" colspan="5">&nbsp;<html:text property='bookName' style="width:97%" maxlength="25"/></td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
                    <tr> 
											<td class="t1 cbg4" width="99" height="25"><span class="red">*</span>저자</td>
											<td class="sBg"></td>
											<td class="t3" width="272">&nbsp;<html:text property='author' style="width:180px;" maxlength="15"></html:text></td>
											<td class="sBg"></td>
                      <td class="t1 cbg4" width="99"><span class="red">*</span>자료구분</td>
											<td class="sBg"></td>
                      <td class="t3" width="272">&nbsp;<html:select property="bookGubn" style="width:100px;"><html:optionsCollection name="libGubnCode" property="beanCollection" /></html:select></td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr> 
											<td class="t1 cbg4" width="99" height="25"><span class="red">*</span>출판사</td>
											<td class="sBg"></td>
											<td class="t3" width="272">&nbsp;<html:text property='publisher' style="width:180px;" maxlength="15"></html:text></td>
											<td class="sBg"></td>
											<td class="t1 cbg4" width="99">출판일</td>
											<td class="sBg"></td>
											<td class="t3" width="272">&nbsp;<html:text property="pubDate" style="width:100px; IME-MODE:disabled" maxlength="10"/></td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr> 
											<td class="t1 cbg4" width="99" height="25">구입일자</td>
											<td class="sBg"></td>
											<td class="t3" width="272">&nbsp;<html:text property="buyDate" style="width:100px; IME-MODE:disabled" maxlength="10"/></td>
											<td class="sBg"></td>
											<td class="t1 cbg4" width="99">구입가격</td>
											<td class="sBg"></td>
											<td class="t3" width="272">&nbsp;<html:text property='buyAmount' style="width:180px; direction:rtl; IME-MODE:disabled" maxlength="13" onkeydown="key_num()" onkeyup="this.value=setComma(this.value)"></html:text></td>
										</tr>
										<c:if test="${rsRscLib.num == '0'}">
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr> 
											<td class="t1 cbg4" width="99" height="25">사용유무</td>
											<td class="sBg"></td>
											<td class="t3" width="272" colspan="5">&nbsp;<html:select property="isUse" style="width:100px">
													<html:option value="Y">사용가능</html:option>
													<html:option value="N">사용불가</html:option>
												</html:select>
											</td>
										</tr>
										</c:if>
									</table>                 
									<!--등록테이블 끝-->
                </td>
              </tr>
						</table> 
						<!--하단버튼 테이블 시작-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
						  <tr valign="bottom"> 
						    <td align="right">
						    	<c:if test="${type == 'modify'}">
						    		<img src='<html:rewrite page="/images/board/btn_del.gif"/>' align="absmiddle" alt="삭제" onclick="doDelete(document.forms[0]);" style="cursor:hand"/>
						    	</c:if>  
									<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록" onclick="goList();" style="cursor:hand"/>
								  <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="저장" onclick="doSubmit(document.forms[0]);" style="cursor:hand"/>
								</td>
						  </tr>
						</table>
						<!--하단버튼 테이블 끝-->
          </td>
        </tr>
      </table>
      </html:form>
    </td>
  </tr>
</table>
