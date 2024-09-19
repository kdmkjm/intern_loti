<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
<!--

	window.onresize = function(){
	//   윈도우 사이즈 변경 셋팅 코드
	tresize(200);
	}
	
	function selectYear()
	{
		var type = document.all.type.value;
		
		selectPlan(type);
	}

	function selectPlan(crsType)
	{
		var url = "crsMonth.act?task=list_ance";
		var year = document.forms[0].year.value;
      	var pars = "year="+year+"&crsType=0000"+crsType;

		MM_swapImgRestore();
      	MM_swapImage('Image'+crsType,'','${pageContext.request.contextPath}/images/edu/course_0'+crsType+'_over.gif',1);

		var myAjax = new Ajax.Request(
						url,
                           {
                               method: 'post',
                               parameters: pars,
                               onComplete: success
                              });
                              
		document.all.type.value = crsType;
		
	}

	function success(request)
	{
		$('mainList').innerHTML = request.responseText;
		tresize(200);
	}

	function showCourse(courseCode,crsType1)
	{
			LeftPosition=screen.width/2-(667/2);
			TopPosition=screen.height/2-(470/2);
			window.open('${pageContext.request.contextPath}/cmnCourseInfo.act?task=info&coursecode='+courseCode+'&crstype1='+crsType1,'pop1',
		  	'height=470,width=667,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=yes,top='+TopPosition+',left='+LeftPosition);
	}


//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="과정별교육안내" src="/images/edu/title_08.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <!--검색 테이블 시작-->
    <html:form action="crsMonth.act?task=list">
	  <html:hidden property="type" value="${type}"/>
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr>
        <td bgcolor="#FFFFFF">
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="129" class="s1">연도</td>
            <td class="sBar"></td>
            <td class="s2">
              <html:select property="year" value="${thisYear}" onchange="selectYear();">
			    <html:optionsCollection name="crsYear" property="beanCollection" />
			  </html:select>
            </td>
          </tr>
          </table>
        </td>
      </tr>
      </table>
    </html:form>
    <!--검색 테이블 끝-->
  </td>
</tr>
<tr>
  <td height="8"></td>
</tr>
<tr>
  <td>
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="89" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('1');"><img name="Image1" border="0" src='<html:rewrite page="/images/edu/course_01.gif"/>' width="87" height="24" alt="기본교육" /></a></td>
      <td width="89" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('2');"><img name="Image2" border="0" src='<html:rewrite page="/images/edu/course_02.gif"/>' width="87" height="24" alt="직무교육" /></a></td>
      <td width="89" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('3');"><img name="Image3" border="0" src='<html:rewrite page="/images/edu/course_03.gif"/>' width="87" height="24" alt="Cyber교육" /></a></td>
      <td width="89" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('4');"><img name="Image4" border="0" src='<html:rewrite page="/images/edu/course_04.gif"/>' width="87" height="24" alt="정보화교육" /></a></td>
      <td width="89" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('5');"><img name="Image5" border="0" src='<html:rewrite page="/images/edu/course_05.gif"/>' width="87" height="24" alt="외국어교육" /></a></td>
      <td background='<html:rewrite page="/images/edu/month_bg.gif"/>'>&nbsp;</td>
    </tr>
    </table>
  </td>
</tr>
<tr>
  <td height="4"></td>
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
          <td class="t1" width="40">번호</td>
          <td class="sBg"></td>
          <td class="t1">과정명</td>
          <td class="sBg"></td>
          <td class="t1" width="85">기간</td>
          <td class="sBg"></td>
          <td class="t1" width="95">대상</td>
          <td class="sBg"></td>
          <td class="t1" width="50">일수</td>
          <td class="sBg"></td>
          <td class="t1" width="50">인원</td>
          <td class="sBg"></td>                           
          <td class="t1" width="60">강의실</td>
          <td class="sBg"></td>
          <td class="t1" width="60">담당자</td>
          <td class="sBg"></td>
          <td class="t1" width="70">처리</td>
          <td width="17"></td>
        </tr>
        </table>
      </td>
      <td class="lbg"></td>
    </tr>
    </table>
    <!--테이블 헤더 끝-->
  </td>
</tr>
<tr>
  <td>
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="lbg2"></td>
      <td width="746">
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top">
            <!--리스트 시작-->
            <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 

            </div>
            <!--리스트 끝-->
          </td>
        </tr>
        </table>
      </td>
      <td class="lbg2"></td>
    </tr>
    </table>
  </td>
</tr>
<tr>
  <td>
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="tbg1"></td>
    </tr>
    </table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(200);
	selectPlan('2');

//-->
</script>