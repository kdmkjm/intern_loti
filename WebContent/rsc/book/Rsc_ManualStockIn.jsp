<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>교재관리 - 교재입고</title>

<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>

<script language="JavaScript">
<!--
	function stock(frm)
	{
		// 콤마 제거
		frm.stockTotal.value 	= removeComma(frm.stockTotal.value);
		frm.stockIn.value 		= removeComma(frm.stockIn.value);
		
		var stockTotal = frm.stockTotal.value;
		var stockIn = frm.stockIn.value;
		stockTotal = Number(stockTotal) + Number(stockIn);
		 
		// 콤마 추가
		frm.stockTotal.value 	= setComma(frm.stockTotal.value);
		frm.stockIn.value 		= setComma(frm.stockIn.value);
		stockTotal = setComma(stockTotal);
		
		document.all.total.innerHTML = "<b>" + stockTotal + "</b>&nbsp;";
	}
	
	function insertStock(frm) 
	{ 
		if(frm.ioDate.value == "")
		{
			alert('입고일자를 입력하지 않으셨습니다.');
			frm.ioDate.focus();
			return;
		}
		if(frm.stockIn.value == "")
		{
			alert('입고수량을 입력하지 않으셨습니다.');
			frm.stockIn.focus();
			return;
		}
		
		var stockIn = frm.stockIn.value;
		frm.stockIn.value = removeComma(stockIn);
		
		if(frm.stockIn.value.length > 5)
		{
			frm.stockIn.value = stockIn;
			alert('입고수량은 5자리 이상 입력할 수 없습니다.');
			frm.stockIn.focus();
			return;
		}
		frm.submit();
	}
	
	function closeWin() 
	{ 
		self.close();
	}
//-->
</script>
</head>
<body>
<html:form method="POST" action="/rscBook.act?task=stockIO" >
<html:hidden property="txBookSeq" value="${rsRscBook.txBookSeq}"/>
<html:hidden property="seqNo" value="${rsRscBook.seqNo}"/>
<table width="650" border="0" cellspacing="5" cellpadding="0" height="300" bgcolor="#E7E7E7">
  <tr> 
    <td valign="top"> 
      <table width="640" border="0" cellspacing="1" cellpadding="0" height="290" bgcolor="#D1D1D1">
        <tr> 
          <td bgcolor="#FFFFFF" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/resources/title_02-5.gif"/>' alt="교재관리-교재입고" /></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td> 
                  <table width="620" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr> 																			
                      <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />등록자   : <c:out value="${userName}"/></td>
                    </tr>
                    <tr> 
                      <td> 
                        <!--리스트 헤더 시작-->
                        <table width="607" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
                          <tr> 
                            <td class="pt1" >교재명</td>
                            <td class="pt1" width="110"><span class="red">*</span>입고일자</td>
                            <td class="pt1" width="65">현재수량</td>
                            <td class="pt1" width="65"><span class="red">*</span>입고수량</td>
                            <td class="pt1" width="65">총수량</td>
                            <td class="pt1" width="150">비고</td>
                          </tr>
                        </table>
                        <!--리스트 헤더 끝-->
                      </td>
                    </tr>
                    <tr> 
                      <td height="130" valign="top"> 
                        <!--리스트 테이블 시작-->
                        <table width="607" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
                          <tr> 
                            <td class="pt2Left">&nbsp;<c:out value="${rsRscBook.txBookName}"/></td>
                            <td class="pt2" width="110">
                            	<html:text property="ioDate" value="${rsRscBook.ioDate}" style="width:70px; IME-MODE:disabled" readonly="true" maxlength="10"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, ioDate, 'yyyy-mm-dd');">
                           	</td>
                            <td class="pt2Right" width="65">
                             <c:if test="${rsRscBook.seqNo == null}">
                             	<b><fmt:formatNumber value="${rsRscBook.stockTotal}" pattern="#,##0"/></b>&nbsp;
                             	<html:hidden property="stockTotal" value="${rsRscBook.stockTotal}"/>
                            	</c:if>
                           	</td>
                            <td class="pt2" width="65">
                            	<c:if test="${rsRscBook.seqNo == null}">
                              	<html:text property="stockIn" style="width:50px; IME-MODE:disabled; direction:rtl;" maxlength="6" onkeydown="key_num();" onkeyup="stock(document.forms[0]);"/>
                              </c:if>
                            	<c:if test="${rsRscBook.seqNo != null}">
                              	<html:text property="stockIn" value="${rsRscBook.stockIn}" style="width:50px; IME-MODE:disabled; direction:rtl;" maxlength="6" onkeydown="key_num();"/>
                              </c:if>
                            </td>
                            <td class="pt2Right" width="65" id="total">
                            	<c:if test="${rsRscBook.seqNo == null}">
                            		<b><fmt:formatNumber value="${rsRscBook.stockTotal}" pattern="#,##0"/></b>&nbsp;
                            	</c:if>
                         		</td>
                            <td class="pt2" width="150">
                            	<c:if test="${rsRscBook.seqNo == null}">
                            		<html:text property="remarks" style="width:130px" maxlength="250"/>
                            	</c:if>
                            	<c:if test="${rsRscBook.seqNo != null}">
                            		<html:text property="remarks" value="${rsRscBook.remarks}" style="width:130px" maxlength="250"/>
                            	</c:if>
                            </td>
                          </tr>
                        </table>
                        <!--리스트 테이블 끝-->
                      </td>
                    </tr>
                    <tr> 
                      <td> 
                        <table width="607" border="0" cellspacing="0" cellpadding="0" height="28">
                          <tr valign="bottom"> 
														<td align="right">
                            	<img src='<html:rewrite page="/images/board/btn_save.gif"/>' 	align="absmiddle" alt="저장" onclick="insertStock(document.forms[0]);" style="cursor:hand" /> 
                              <img src='<html:rewrite page="/images/board/btn_close.gif"/>' align="absmiddle" alt="닫기" onclick="closeWin();" style="cursor:hand"/>
														</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html:form>
</body>
</html>
