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
	
	var chkbox = false		//모든 박스토글
	var sendFlag;
	function toggleallbox()
	{
		chkbox = !chkbox;
		var coll = document.all.tags("INPUT");
		if (coll!=null)	{
			for (i=0; i<coll.length; i++) {
	      if (coll[i].type == "checkbox") {
	        if ((coll[i].name == "sel")&&(!coll[i].disabled)) {
	          coll[i].checked = chkbox;
	        }
	      }
			}
		}
	}
	var win;
	//조회
	function doSearch(frm)
	{
		if(frm.searchFromDate.value == "" || frm.searchToDate.value == "")
		{
			alert("기간을 입력해주세요.");
			return;
		}
		frm.target = '_self';
		frm.submit();
	}
	
	//전송	
	function doSend(frm, flag){
		var temp = "";
		var chk = "";   //이수처리여부 검사
		
		try{
			var obj = frm.sel.length;
		} catch(Exception){ 
			alert('데이터를 조회 후 선택하세요.');
			return;
		}
		
		if(typeof(obj) != 'undefined'){			
	  	for(i=0;i<frm.sel.length;i++){
	  		if(frm.sel[i].checked){
	  			temp = temp + frm.sel[i].value + ",";
	  			if(frm.isPass[i].value != 'Y' && flag == 'finish'){
	  				alert('이수처리를 하지 않은 과정['+eval(i+1)+'행]이 포함되어 있습니다.');
	  				return;
	  			}
	  		}
	  	}
	  	temp = temp.substring(0,temp.length-1)
	  } else {	 
	    if(frm.sel.checked){
		  	temp = frm.sel.value;
		  	if(frm.isPass.value != 'Y' && flag == 'finish'){
	  				alert('이수처리를 하지 않은 과정이 포함되어 있습니다.');
	  				return;
	  		}	  	
		  }	  	
	  }
	  	   
	  if (temp == "") {
	  	alert("한 건 이상 선택하여 주세요.")
	  } else {
	  	win = window.open('include/processing_call.jsp','sso', "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,,width=386,height=177");
	  	sendFlag = flag;
	  	setTimeout("frmSend()", 3000);
	  }		
	}	
	
	function frmSend()
	{
		var frm = document.forms[1];
		frm.gbn.value = sendFlag;
  	frm.sendDt.value = document.forms[0].searchToDate.value;
  	
  	frm.target = 'sso';	  
  	frm.submit();
	  setTimeout("frmClose()", 35000);
	}
	
	function frmClose()
	{
  	win.close();
  	document.location.href = "/oprSendingList.act?task=send";
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="교육확정 및 이수전송" src="/images/operation/title_16.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <!--검색 테이블 시작-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <html:form method="POST" action="oprSendingList.act?task=list">
	  <tr> 
		<td width="89" class="s1">기간</td>
		<td class="sBar"></td>
		<td class="s2" width="250"> 
		  <html:text property="searchFromDate" style="width:75px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absmiddle" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchFromDate);">
			~&nbsp;<html:text property="searchToDate" style="width:75px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absmiddle" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchToDate);">
		</td>
		<td class="sBar"></td>
		<td width="89" class="s1">분류</td>
		<td class="sBar"></td>
		<td class="s2">
		  <html:select property="searchCrsType">
			<html:optionsCollection name="crsTypeCode" property="beanCollection" />
		  </html:select>
		</td>
		<td width="60">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch(document.forms[0]);" style="cursor:hand" align="absmiddle"/>
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
          <td class="t1" width="44"><a href="#" onclick="toggleallbox();"><u>선택</u></td>
          <td class="sBg"></td>
          <td class="t1">과정명</td>
          <td class="sBg"></td>                             
          <td class="t1" width="120">교육기간</td>
          <td class="sBg"></td>
          <td class="t1" width="75">확정명단<br>전송일자</td>
          <td class="sBg"></td>
          <td class="t1" width="75">이수명단<br>전송일자</td>
          <td class="sBg"></td>
          <td class="t1" width="60">이수처리</td>
          <td width="18"></td>                        
        </tr>
        </table> 
        <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <html:form method="POST" action="regToken.act?task=sending">
		    <html:hidden property="gbn"/>
		    <html:hidden property="sendDt"/>
		    <c:set var="no" scope="request" value="1"/>
            <c:forEach var="list" items="${sending_List}" varStatus="i">                             	                        	                    	
              <c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			  <c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
	          <tr class="${lineBg}"> 
	            <td class="t2" width="44">
	              <input type="checkbox" name="sel" value="${list.courseCode}"> 
                </td>
	            <td class="sBg"></td>
	            <td class="t3">&nbsp;<c:out value="${list.courseName}"/></td>
	            <td class="sBg"></td>	                            
	            <td class="t2" width="120"><c:out value="${list.eduDate}"/></td>
	            <td class="sBg"></td>
	            <td class="t2" width="75"><c:out value="${list.stdConfDate}"/></td>
	            <td class="sBg"></td>
	            <td class="t2" width="75"><c:out value="${list.passDate}"/></td>  
	            <td class="sBg"></td>
	            <td class="t2" width="60">
	              <html:hidden name="list" property="isPass"/>
	              <logic:equal name="list" property="isPass" value="Y">
	                <font color="blue">처리</font>
	              </logic:equal>
	              <logic:notEqual name="list" property="isPass" value="Y">
	                <font color="red">미처리</font>
	              </logic:notEqual>
                </td>  
	            <td class="sBg"></td>                                                            
	          </tr>
	          <tr> 
	            <td class="lbg3" colspan="15"></td>
	          </tr>
	          <c:set var="no" scope="request" value="${no + 1}"/>     
            </c:forEach>
            <c:if test="${no==1}">
			  <tr class="tbg3" height="21">
				<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
			  </tr>
			</c:if>
		  </html:form>
          </table>  
        </div>                           
      </td>                  
    </tr>
    </table>
  </td>
</tr>             
<tr> 
  <td> 
    <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
    <tr valign="bottom"> 
      <td align="right">
        <img style="cursor:hand" src='<html:rewrite page="/images/board/btn_send3.gif"/>' width="94" height="25" align="absmiddle" alt="확정전송" onclick="doSend(document.forms[1], 'confirm');"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img style="cursor:hand" src='<html:rewrite page="/images/board/btn_completion_send.gif"/>' width="94" height="25" align="absmiddle" alt="이수명단전송" onclick="doSend(document.forms[1],'finish');"/>
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
