<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="javascript" src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script language="javascript" src='<html:rewrite page="/common/js/common.js"/>'></script>
<script language="javascript">
	window.onresize = function(){
		//윈도우 사이즈 변경 셋팅 코드
		tresize(190);
	}
	function send(btCilckTime) {
	  	window.open('include/processing_call.jsp','onnara', "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,,width=386,height=177");
	  	
			var frm = document.forms[1];
			frm.btCilckTime.value = btCilckTime;
  		frm.target = 'onnara';
  		frm.submit();	 
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="확정 및 이수 전송 결과" src="/images/operation/title_33.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <!--검색 테이블 시작-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <html:form method="POST" action="oprSendingList.act?task=send">
	  <tr> 
	    <td width="89" class="s1">기간</td>
		<td class="sBar"></td>
		<td class="s2"> 
		  <html:text property="searchFromDate" style="width:75px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absmiddle" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchFromDate);">
		</td>
		<td width="60">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="document.forms[0].submit();" style="cursor:hand" align="absmiddle"/>
		</td>
	  </tr>
	  </html:form>
	</table>
    <!--검색 테이블 끝-->
  </td>
</tr>
<tr> 
  <td height="15"></td>
</tr>              
<tr> 
  <td> 
    <!--테이블 헤더 시작-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
    <tr>                       
      <td> 
        <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
        <tr> 
          <td class="t1">전송시간</td>
          <td class="sBg"></td>                             
          <td class="t1" width="100">전송구분</td>
          <td class="sBg"></td>                             
          <td class="t1" width="100">종합건수</td>
          <td class="sBg"></td>
          <td class="t1" width="100">성공건수</td>
          <td class="sBg"></td>
          <td class="t1" width="100">PDF다운</td>
          <td class="sBg"></td>
          <td class="t1" width="100">온나라전송</td>
          <td width="18"></td>                        
        </tr>
        </table> 
        <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
		  <html:form method="POST" action="onnaraSend.act?task=onnara">
			<html:hidden property="btCilckTime"/>
			<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			<c:set var="no" scope="request" value="1"/>
            <c:forEach var="list" items="${sending_List}" varStatus="i">                             	                        	                    	
              <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			  <c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
	          <tr class="${lineBg}" title="${title}"> 
	            <td class="sBg"></td>
	            <td class="t3">&nbsp;${list.btCilckTime}</td>
	            <td class="sBg"></td>	                            
	            <td class="t2" width="100">
	              <logic:notEmpty name="list" property="gbn">${list.gbn}</logic:notEmpty>
		          <logic:empty name="list" property="gbn">명단수신</logic:empty>
		        </td>
	            <td class="sBg"></td>	                            
	            <td class="t2" width="100">
	              <logic:notEmpty name="list" property="gbn">${list.totalCnt}</logic:notEmpty>
		          <logic:empty name="list" property="gbn">
		            <logic:equal name="list" property="totalCnt" value="0">수신중</logic:equal>
		            <logic:notEqual name="list" property="totalCnt" value="0">${list.totalCnt}</logic:notEqual>
		          </logic:empty>
	            </td>
	            <td class="sBg"></td>
	            <td class="t2" width="100">${list.successCnt}</td>
	            <td class="sBg"></td>
	            <td class="t2" width="100">
	              <logic:notEmpty name="list" property="gbn">
	                <img src='<html:rewrite page="/images/board/pdf.gif"/>' alt="pdf" align="absmiddle" onclick="location.href='<html:rewrite page="/downLoad.act?downType=onnara&fileName=${list.onnaraPDF}"/>'" style="cursor:hand"/>
	              </logic:notEmpty>
	            </td>
	            <td class="sBg"></td>
	            <td class="t2" width="100">
	              <logic:notEmpty name="list" property="gbn">
		            <img src='<html:rewrite page="/images/board/btn_s_send.gif"/>' alt="전송" onclick="send('${list.btCilckTime}')" style="cursor:hand" align="absmiddle"/>
		          </logic:notEmpty>
	            </td>
	            <td class="sBg"></td>                                                            
	          </tr>
	          <tr> 
	            <td class="lbg3" colspan="15"></td>
	          </tr>
            </c:forEach>
            </table>  
		  </html:form>
        </div>                           
      </td>                  
    </tr>
    </table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(190);
//-->
</script>
