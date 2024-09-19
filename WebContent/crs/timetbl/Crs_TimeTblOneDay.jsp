<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   윈도우 사이즈 변경 셋팅 코드
	tresize(205);
	}
	
	function chk_tblDay()
	{  
		var frm = document.forms[0];
		var url = "crsTimeTblOneDay.act?task=chk_tblDay";
      	var pars = Form.serialize(frm);

		var myAjax = new Ajax.Request(
						url,
                      {
                          method: 'post',
                          parameters: pars,
                          onComplete: ozReport
                         });
	}
	
	ozReport = function(request)
	{
		var result = request.responseXML.documentElement.firstChild;
    var chkDate = result.getAttribute('chkDate');

		var frm = document.forms[1];

		if(chkDate=='0')
		{
			alert('조회된 데이터가 없습니다.');
			return;
		}
	
		var frm = document.forms[0];
		
		var str 
	 	var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
	 	str = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,width=710,height=550,top="+wint+",left="+winl;  
	    window.open('','popup', str);
		frm.action = "ozMenu.act?report=tday"	
		frm.target = "popup";
		frm.submit();	
		frm.action = "crsTimeTblOneDay.act?task=list";	
		frm.target = "";
	}
	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}
	
	function doExcel()
	{
		var searchdate = document.forms[0].searchdate.value;
		document.getElementById("actionFrame").src = '<html:rewrite page="/crsTimeTblOneDay.act?task=excel&searchdate='+searchdate+'"/>'
	}
	
	function showMonthList()
	{		
	  var searchdate = document.forms[0].searchdate.value;
	  
		document.forms[0].action = 'crsTimeTblOneDay.act?task=monthlist&searchdate='+searchdate;
		document.forms[0].submit();
	}
	
	function AddTimeTbl()
	{		
	  var searchdate = document.forms[0].searchdate.value;
	  
		document.forms[0].action = 'crsTimeTblOneDay.act?task=AddTimeTbl&searchdate='+searchdate;
		document.forms[0].submit();
	}
	
	function searchTime(courseCode) {
		var searchdate = document.forms[0].searchdate.value;
		document.forms[0].action = 'crsTimeTblOneDay.act?task=search_time&searchdate='+searchdate+'&searchCourseCode='+courseCode;
		document.forms[0].submit();		
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="일일시간표 조회" src="/images/operation/title_37.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action='crsTimeTblOneDay.act?task=list'>
      <!--검색 테이블 시작-->
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr>
        <td bgcolor="#FFFFFF">
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr>            
            <td class="sBar"></td>
            <td width="119" class="s1">일자</td>
            <td class="sBar"></td>
            <td class="s2">
	          <html:text property="searchdate" style="width:100px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchdate, 'yyyy-mm-dd');">
            </td>
            <td width="60">
			  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="document.forms[0].submit();" style="cursor:hand" align="absbottom"/>
			</td>
          </tr>
          </table>
        </td>
      </tr>
      </table>
      <!--검색 테이블 끝-->
    </html:form>
    <div id="sCourse2">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td height="20" align="left">${rsCrs_TimeTblCrsTotalInfo}</td>
		</tr>
		</table>
		<c:out value="${timeTable }" escapeXml="false" />
	  </div>
      <!--하단버튼-->
      <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
      <tr valign="bottom" align="right">
        <td class="t2" width="650"><div id="sDay2" style="display:none"><b>검색조건을 기간으로 선택시에는 엑셀 다운로드만 가능합니다.</b></div></td>
        <%-- <td><img src='<html:rewrite page="/images/board/btn_excel.gif"/>' width="94" height="25" alt="엑셀다운" align="absmiddle" onclick="doExcel()" style="cursor:hand"/></td> --%>
        <td align="right"><img src='<html:rewrite page="/images/board/btn_print.gif"/>' alt="소책자" align="absmiddle" style="CURSOR: hand"/></td>
      </tr>
      </table>
  </td>
</tr>
</table>
<iframe id="actionFrame" width="0" height="0"></iframe>
<script language="JavaScript">
	tresize(215);
</script>