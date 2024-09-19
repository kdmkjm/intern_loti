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
		var url = "crsTimeTblDay.act?task=chk_tblDay";
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
		frm.action = "crsTimeTblDay.act?task=list";	
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
		document.getElementById("actionFrame").src = '<html:rewrite page="/crsTimeTblDay.act?task=excel&searchdate='+searchdate+'"/>'
	}
	
	function showMonthList()
	{		
	  var searchdate = document.forms[0].searchdate.value;
	  
		document.forms[0].action = 'crsTimeTblDay.act?task=monthlist&searchdate='+searchdate;
		document.forms[0].submit();
	}
	
	function AddTimeTbl()
	{		
	  var searchdate = document.forms[0].searchdate.value;
	  
		document.forms[0].action = 'crsTimeTblDay.act?task=AddTimeTbl&searchdate='+searchdate;
		document.forms[0].submit();
	}
	
	function searchTime(courseCode) {
		var searchdate = document.forms[0].searchdate.value;
		document.forms[0].action = 'crsTimeTblDay.act?task=search_time&searchdate='+searchdate+'&searchCourseCode='+courseCode;
		document.forms[0].submit();		
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="교육시간표 조회 - 일자별" src="/images/operation/title_02.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action='crsTimeTblDay.act?task=list'>
      <!--검색 테이블 시작-->
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr>
        <td bgcolor="#FFFFFF">
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="74" class="s1">담당자</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td class="s2" width="99">
			  <html:select property="searchcharger">
			    <html:optionsCollection name="crsUser" property="beanCollection" />
			  </html:select>
			</td>
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
  </td>
</tr>
<tr align="left">
  <td height="25"><b><c:out value="${rsCrs_TimeTblCrsTotalInfo}"/></b></td>
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
          <td class="t1" width="39">연번</td>
          <td class="sBg"></td>
          <td class="t1">과정</td>
          <td class="sBg"></td>
          <td class="t1" width="44">09:00<br>
            ~<br>
          09:50</td>
          <td class="sBg"></td>
          <td class="t1" width="44">10:00<br>
            ~<br>
          10:50</td>
          <td class="sBg"></td>
          <td class="t1" width="44">11:00<br>
            ~<br>
          11:50</td>
          <td class="sBg"></td>
          <td class="t1" width="44">12:00<br>
            ~<br>
          12:50</td>
          <td class="sBg"></td>
          <td class="t1" width="44">13:00<br>
            ~<br>
          13:50</td>
          <td class="sBg"></td>
          <td class="t1" width="44">14:00<br>
            ~<br>
          14:50</td>
          <td class="sBg"></td>
          <td class="t1" width="44">15:00<br>
            ~<br>
          15:50</td>
          <td class="sBg"></td>
          <td class="t1" width="44">16:00<br>
            ~<br>
          16:50</td>
          <td class="sBg"></td>
          <td class="t1" width="44">17:00<br>
            ~<br>
          17:50</td>
          <td class="sBg"></td>
          <td class="t1" width="44">18:00<br>
            ~<br>
          18:50</td>
          <td class="sBg"></td>
          <td class="t1" width="44">19:00<br>
            ~<br>
          19:50</td>
          <td class="sBg"></td>
          <td class="t1" width="44">20:00<br>
            ~<br>
          20:50</td>
          <td class="sBg"></td>
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
      <td class="lbg"></td>
      <td>
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <!--리스트 시작-->
			<div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden;">
			  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
              <c:forEach var="timeTblCrsList" items="${rsCrs_TimeTblCrsList}" varStatus="i">
                <tr>
                  <td class="t2" width="39">${i.count}</td>
                  <td class="sBg"></td>
	              <td class="t2">
	              	<a href="#mainList" onclick="searchTime('${timeTblCrsList.coursecode}')">
	              	${timeTblCrsList.coursename}<br>${timeTblCrsList.stdcnt }명 / ${timeTblCrsList.lecroom }
	              	</a> 
              	  </td>
	              <td class="sBg"></td>  
                  <c:set var="times" value="${1}"/>
                  <td width="540">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
					<c:forEach var="subList" items="${timeTblCrsList.timetbldayList}">
			          <c:if test="${timeTblCrsList.coursecode eq subList.coursecode}">
		              <c:forEach begin="${times}" end="${subList.gubun}">
		                <c:if test="${times == subList.gubun}">
		                  <c:if test="${subList.colspan > 1}">
		                    <td class="t2" width="${(44*subList.colspan)+(subList.colspan-1)}" colspan="${subList.colspan+(subList.colspan-1)}">${subList.subjname}<br>${subList.prof_Assign}&nbsp;${subList.prof_Name}</td>
		                    <td class="sBg"></td>
		                  </c:if>
		                  <c:if test="${subList.colspan == 1}">
		                    <td class="t2" width="44">${subList.subjname}<br>${subList.prof_Assign}&nbsp;${subList.prof_Name}</td>
		                    <td class="sBg"></td>
		                  </c:if>                                						      
			              <c:set var="times" value="${times+subList.colspan }"/>
			            </c:if>
		                <c:if test="${times < subList.gubun}">
			              <td class="t2" width="44"></td>
				          <td class="sBg"></td>
				          <c:set var="times" value="${times+1 }"/>
			            </c:if>				                                    				
		              </c:forEach>                           						
			          </c:if>
			        </c:forEach>
			        <c:if test="${times < 12 }">
			        <c:forEach begin="${times}" end="12">
			          <td class="t2" width="44"></td>
			          <td class="sBg"></td>
			          <c:set var="times" value="${times+1 }"/>
			        </c:forEach>    
			        </c:if>
			        </tr>
			        </table>
			      </td>
			    </tr>
                <tr> 
	              <td class="lbg3" colspan="28"></td>
	            </tr>
                <c:set var="check" value="${i.count}"/>
              </c:forEach>
              <input type="hidden" id="max" name="max" value="${check}"/>
              <c:if test="${check==null}">
				<tr class="tbg3">
				  <td class="t2" colspan="99">조회된 데이터가 없습니다.</td>
				</tr>
			  </c:if>
              </table>
            </div>
            <!--리스트 끝-->
          </td>
        </tr>
        </table>
      </td>
      <td class="lbg"></td>
    </tr>
    </table>
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
    <!--하단버튼-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
    <tr valign="bottom">
      <td>
        <c:if test="${isAdmin == 'Y'}">	
	      <img src='<html:rewrite page="/images/board/btn_excel.gif"/>' width="94" height="25" alt="엑셀다운" align="absmiddle" onclick="doExcel()" style="cursor:hand"/>
	      <img src='<html:rewrite page="/images/board/btn_view_month.gif"/>' width="86" height="25" align="absmiddle" alt="월별로 보기" onclick="showMonthList();" style="cursor:hand"/>
	    </c:if>
      </td>
      <td align="right">
        <c:if test="${isAdmin == 'Y'}">	
	      <img src='<html:rewrite page="/images/board/btn_time2.gif"/>' align="absmiddle" alt="시간표 등록"  onclick="AddTimeTbl();" style="cursor:hand"/>
	      <img src='<html:rewrite page="/images/board/btn_print.gif"/>' width="57" height="25" align="absmiddle" alt="인쇄"  onclick="chk_tblDay();" style="cursor:hand"/>
        </c:if>
      </td>
    </tr>
    </table>
  </td>
</tr>
</table>

<%-- <html:form action='crsTimeTblDay.act?task=search_time' method="post">
	<html:hidden property="searchdate" />
	<html:hidden property="searchCourseCode" />
</html:form> --%>
<iframe id="actionFrame" width="0" height="0"></iframe>
<script type="text/javascript">
<!--
	tresize(205);
	searchList('${key}');
//-->
</script>
