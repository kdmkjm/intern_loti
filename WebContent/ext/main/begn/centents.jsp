<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script language="JavaScript">
	// �����ȳ� �� ����
	function selectEduMenu(number)
	{		
		if(number == 1)
		{
			document.all.Image_m01.src = "${pageContext.request.contextPath}/images/board_m_01_over.gif";
			document.all.Image_m02.src = "${pageContext.request.contextPath}/images/board_m_02.gif";
			document.all.Image_m03.src = "${pageContext.request.contextPath}/images/board_m_03.gif";
			
			document.all.Layer_01.style.visibility = "";
			document.all.Layer_02.style.visibility = "hidden";
			document.all.Layer_03.style.visibility = "hidden";
			document.all.Layer_01.style.zIndex = "100";
			document.all.Layer_02.style.zIndex = "0";
			document.all.Layer_03.style.zIndex = "0";
			selectIng();
		}
		else if(number == 2)
		{
			document.all.Image_m01.src = "${pageContext.request.contextPath}/images/board_m_01.gif";
			document.all.Image_m02.src = "${pageContext.request.contextPath}/images/board_m_02_over.gif";
			document.all.Image_m03.src = "${pageContext.request.contextPath}/images/board_m_03.gif";
			
			document.all.Layer_01.style.visibility = "hidden";
			document.all.Layer_02.style.visibility = "";
			document.all.Layer_03.style.visibility = "hidden";
			document.all.Layer_01.style.zIndex = "0";
			document.all.Layer_02.style.zIndex = "100";
			document.all.Layer_03.style.zIndex = "0";
			selectCrs('01');
		}
		else if(number == 3)
		{
			document.all.Image_m01.src = "${pageContext.request.contextPath}/images/board_m_01.gif";
			document.all.Image_m02.src = "${pageContext.request.contextPath}/images/board_m_02.gif";
			document.all.Image_m03.src = "${pageContext.request.contextPath}/images/board_m_03_over.gif";
			
			document.all.Layer_01.style.visibility = "hidden";
			document.all.Layer_02.style.visibility = "hidden";
			document.all.Layer_03.style.visibility = "";
			document.all.Layer_01.style.zIndex = "0";
			document.all.Layer_02.style.zIndex = "0";
			document.all.Layer_03.style.zIndex = "100";
			selectPlan(document.all.tMonth.value);
		}
	}
	
	// �Խ��� �� ����
	function selectBrdMenu(number)
	{		
		if(number == 1)
		{
			document.all.Image_m04.src = "${pageContext.request.contextPath}/images/board_m_04_over.gif";
			document.all.Image_m05.src = "${pageContext.request.contextPath}/images/board_m_05.gif";
			document.all.Image_m06.src = "${pageContext.request.contextPath}/images/board_m_06.gif";
			
			document.all.Board_01.style.visibility = "";
			document.all.Board_02.style.visibility = "hidden";
			document.all.Board_03.style.visibility = "hidden";
			document.all.Board_01.style.zIndex = "100";
			document.all.Board_02.style.zIndex = "0";
			document.all.Board_03.style.zIndex = "0";
		}
		else if(number == 2)
		{
			document.all.Image_m04.src = "${pageContext.request.contextPath}/images/board_m_04.gif";
			document.all.Image_m05.src = "${pageContext.request.contextPath}/images/board_m_05_over.gif";
			document.all.Image_m06.src = "${pageContext.request.contextPath}/images/board_m_06.gif";
			
			document.all.Board_01.style.visibility = "hidden";
			document.all.Board_02.style.visibility = "";
			document.all.Board_03.style.visibility = "hidden";
			document.all.Board_01.style.zIndex = "0";
			document.all.Board_02.style.zIndex = "100";
			document.all.Board_03.style.zIndex = "0";
		}
		else if(number == 3)
		{
			document.all.Image_m04.src = "${pageContext.request.contextPath}/images/board_m_04.gif";
			document.all.Image_m05.src = "${pageContext.request.contextPath}/images/board_m_05.gif";
			document.all.Image_m06.src = "${pageContext.request.contextPath}/images/board_m_06_over.gif";
			
			document.all.Board_01.style.visibility = "hidden";
			document.all.Board_02.style.visibility = "hidden";
			document.all.Board_03.style.visibility = "";
			document.all.Board_01.style.zIndex = "0";
			document.all.Board_02.style.zIndex = "0";
			document.all.Board_03.style.zIndex = "100";
		}
	}	
	
	// ������ �����ȳ� ���ý�
	function selectCrs(crsType1)
	{
		var url = "extMainBegin.act?task=eduCrsInfo&crsType1="+crsType1;
		document.all.crsList.src = url;

		MM_swapImgRestore();
      	MM_swapImage('Lecture'+crsType1,'','${pageContext.request.contextPath}/images/lecture_'+crsType1+'_over.gif',1);

//        $.get("/extMainBegin.act", {task : "eduCrsInfo", crsType1 : crsType1},function(data){
//        	var info = data.areaGoodsCntList;
//        	$("#latest2").empty().append("");
//        	for(var i=0; i<info.length; i++) {
//        	
//        	}
//        }
	}	
	
	// ����� �����ȳ� ���ý�
	function selectIng()
	{
		var url = "extMainBegin.act?task=eduIngInfo";

		document.all.ingList.src = url;
	}	

	// ���� �����ȳ� ���ý�
	function selectPlan(month)
	{
		var url = "extMainBegin.act?task=eduMonthInfo&month="+month;
		document.all.mainList.src = url;
		 
		MM_swapImgRestore();
      	MM_swapImage('Image'+month,'','${pageContext.request.contextPath}/images/'+month+'_over.gif',1);
	}
	
	// ���� �󼼺��� �˾�â
	function showCourse(courseCode,crsType1)
	{
			LeftPosition=screen.width/2-(667/2);
			TopPosition=screen.height/2-(470/2);
			window.open('${pageContext.request.contextPath}/cmnCourseInfo.act?task=info&coursecode='+courseCode+'&crstype1='+crsType1,'pop1',
		  	'height=470,width=667,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=yes,top='+TopPosition+',left='+LeftPosition);
	}

	// �¶��� ���� �˾�â
	function onHelp()
	{
		window.open('${pageContext.request.contextPath}/onHelp.act?task=index', '_popup_onhelp','menubars=no, scrollbars=auto, resizable=yes, width=930,height=550');
	}
	
	function openPrivacyPolicy(){
		window.open('${pageContext.request.contextPath}/extMainBegin.act?task=privacyPolicy&num=1', '_popup_onhelp','menubars=no, scrollbars=yes, resizable=no, width=760,height=600');
	}
</script>
<div id="mainContent">
  <div class="mainFlash">
    <object width="320" height="75" title="������ ��� �н�ü�踦 �����ϴ� ��ġ������ ���������ý���" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000">
      
      <!--[if !IE]>-->
      <param value="/images/swf/mainVisual.swf" name="movie" />
      <param value="high" name="quality" />
      <param value="transparent" name="wmode" />
      <object width="320" height="75" title="������ ��� �н�ü�踦 �����ϴ� ��ġ������ ���������ý���" data="/images/swf/mainVisual.swf" type="application/x-shockwave-flash">
        <!--<![endif]-->
        
        <param value="/images/swf/mainVisual.swf" name="movie" />
        <param value="transparent" name="wmode" />
        <p><img width="320" height="75" alt="������ ��� �н�ü�踦 �����ϴ� ��ġ������ ���������ý���" src="/images/mainTitle.png" /></p>
        <!--[if !IE]>-->
      </object>
      
      <!--<![endif]-->
    </object>
  </div>
  <div class="bnrLink">
    <ul class="clearfix">
    
      <li class="list1"><a href="/main/download/2014_plan.pdf" title="��â" target="_blank"><img alt="2014�⵵ ������ȹ DOWN" src="/images/quick_01.png" /></a></li>
      <li class="list2"><div onclick="onHelp();" style="cursor:hand"/><img alt="�¶��ε��� GO" src="/images/quick_02.png" /></li>
      <li class="list3"><a target="_blank" href="<html:rewrite page="/extRoomMap.act?task=list"/>" title="��â"><img alt="��ġ��������ġ�� GO" src="/images/quick_03.png" /></a></li>
    </ul>
  </div>
<div id="content" class="content">
<div class="left_con">
  <div class="tabList">
    <h2 class="hide">����α����ȳ�</h2>
    <ul>
      <li class="" id="title1"><a href="#" onclick="selectEduMenu(1);" ><img name="Image_m01" src='<html:rewrite page="/images/board_m_01_over.gif"/>' alt="����� �����ȳ�" /></a>
      <div id="Layer_01" style="z-index:100">
        <div class="process02">
          <ul id="process03">
            <li class="list9"><img alt="�����������ΰ���" src="/images/ingEdu.gif" /></li>
          </ul>
        </div>
        <div class="tabContent">
          <ul id="latest1" style="display: block;">
            <iframe frameborder="0" id="ingList" name="ingList" width="372" height="150" src='<html:rewrite page="/extMainBegin.act?task=eduIngInfo"/>' scrolling="no"></iframe>
<%-- 
          <c:forEach var="crsList" items="${rsExtMain_EduIngInfoList}" varStatus="i" >
            <c:if test="${(i.index+1)%2 != 0}">
            <li><a href="#" onclick="showCourse('${crsList.courseCode}','${crsList.crsType1}');"><c:out value="${fn:substring(crsList.courseName, 0, 25)}"/></a><span>${crsList.eduFromTo}</span></li>
            </c:if>
            <c:if test="${(i.index+1)%2 == 0}">
            <li class="tabcontentBg"><a href="#" onclick="showCourse('${crsList.courseCode}','${crsList.crsType1}');"><c:out value="${fn:substring(crsList.courseName, 0, 25)}"/></a><span>${crsList.eduFromTo}</span></li>
            </c:if>
          </c:forEach>
          <c:if test="${fn:length(rsExtMain_EduIngInfoList) == 0}">
            <li>��ȸ�� �����Ͱ� �����ϴ�.</li>
          </c:if>
--%>
          </ul>
        </div>
        <div class="tabMore" id="more1" style="display:block;"><a href="/crsCourse.act?task=list"><img alt="����� �����ȳ� ������" src="/images/more.gif" /></a></div>
      </div>
      </li>
      <li class="on" id="title2"><a href="#" onclick="selectEduMenu(2);" ><img name="Image_m02" src='<html:rewrite page="/images/board_m_02.gif"/>' alt="������ �����ȳ�" /></a>
      <div id="Layer_02" style="visibility:hidden; z-index:0"> 
        <div class="process01">
          <ul id="process02">
            <li class="list4"><a onclick="selectCrs('01');" href="#"><img alt="�⺻�����" name="Lecture01" src='<html:rewrite page="/images/lecture_01.gif"/>' /></a></li>
            <li class="list5"><a onclick="selectCrs('02');" href="#"><img alt="��������" name="Lecture02" src='<html:rewrite page="/images/lecture_02.gif"/>' /></a></li>
            <li class="list6"><a onclick="selectCrs('04');" href="#"><img alt="����ȭ" name="Lecture04" src='<html:rewrite page="/images/lecture_04.gif"/>' /></a></li>
            <li class="list7"><a onclick="selectCrs('05');" href="#"><img alt="�ܱ���" name="Lecture05" src='<html:rewrite page="/images/lecture_05.gif"/>' /></a></li>
            <li class="list8"><a onclick="selectCrs('03');" href="#"><img alt="���̹�" name="Lecture03" src='<html:rewrite page="/images/lecture_03.gif"/>' /></a></li>
          </ul>
        </div>
        <div class="tabContent">
          <ul id="latest2" style="display: block;">
            <iframe frameborder="0" id="crsList" name="crsList" width="372" height="150" scrolling="no"></iframe>
<%-- 
          <c:forEach var="crsList" items="${rsExtMain_EduCrsInfoList}" varStatus="i" >
            <c:if test="${(i.index+1)%2 != 0}">
            <li><a href="#" onclick="showCourse('${crsList.courseCode}','${crsList.crsType1}');"><c:out value="${fn:substring(crsList.courseName, 0, 25)}"/></a><span>${crsList.eduFromTo}</span></li>
            </c:if>
            <c:if test="${(i.index+1)%2 == 0}">
            <li class="tabcontentBg"><a href="#" onclick="showCourse('${crsList.courseCode}','${crsList.crsType1}');"><c:out value="${fn:substring(crsList.courseName, 0, 25)}"/></a><span>${crsList.eduFromTo}</span></li>
            </c:if>
          </c:forEach>
          <c:if test="${fn:length(rsExtMain_EduCrsInfoList) == 0}">
            <li>��ȸ�� �����Ͱ� �����ϴ�.</li>
          </c:if>
--%>          
          </ul>
        </div>
        <div class="tabMore" id="more2" style="display:block;"><a href="/crsMonth.act?task=move_ance"><img alt="������ �����ȳ� ������" src="/images/more.gif" /></a></div>
      </div>
      </li>
      <li class="" id="title3"><a href="#" onclick="selectEduMenu(3);" ><img name="Image_m03" src='<html:rewrite page="/images/board_m_03.gif"/>' alt="���� �����ȳ�" /></a>
      <div id="Layer_03" style="visibility:hidden;; z-index:0">
        <div class="process03">
          <ul id="process04">
            <li class="list10"><a onclick="selectPlan('01');" href="#"><img alt="1��" name="Image01" src='<html:rewrite page="/images/01.gif"/>' /></a></li>
            <li class="list11"><a onclick="selectPlan('02');" href="#"><img alt="2��" name="Image02" src='<html:rewrite page="/images/02.gif"/>' /></a></li>
            <li class="list12"><a onclick="selectPlan('03');" href="#"><img alt="3��" name="Image03" src='<html:rewrite page="/images/03.gif"/>' /></a></li>
            <li class="list13"><a onclick="selectPlan('04');" href="#"><img alt="4��" name="Image04" src='<html:rewrite page="/images/04.gif"/>' /></a></li>
            <li class="list14"><a onclick="selectPlan('05');" href="#"><img alt="5��" name="Image05" src='<html:rewrite page="/images/05.gif"/>' /></a></li>
            <li class="list15"><a onclick="selectPlan('06');" href="#"><img alt="6��" name="Image06" src='<html:rewrite page="/images/06.gif"/>' /></a></li>
            <li class="list16"><a onclick="selectPlan('07');" href="#"><img alt="7��" name="Image07" src='<html:rewrite page="/images/07.gif"/>' /></a></li>
            <li class="list17"><a onclick="selectPlan('08');" href="#"><img alt="8��" name="Image08" src='<html:rewrite page="/images/08.gif"/>' /></a></li>
            <li class="list18"><a onclick="selectPlan('09');" href="#"><img alt="9��" name="Image09" src='<html:rewrite page="/images/09.gif"/>' /></a></li>
            <li class="list19"><a onclick="selectPlan('10');" href="#"><img alt="10��" name="Image10" src='<html:rewrite page="/images/10.gif"/>' /></a></li>
            <li class="list20"><a onclick="selectPlan('11');" href="#"><img alt="11��" name="Image11" src='<html:rewrite page="/images/11.gif"/>' /></a></li>
            <li class="list21"><a onclick="selectPlan('12');" href="#"><img alt="12��" name="Image12" src='<html:rewrite page="/images/12.gif"/>' /></a></li>
          </ul>
        </div>
        <div class="tabContent">
          <ul id="latest3" style="display: block;">
            <iframe frameborder="0" id="mainList" name="mainList" width="372" height="150" src="" scrolling="no" ></iframe>
<%-- 
          <c:forEach var="crsList" items="${rsExtMain_EduMonthInfoList}" varStatus="i" >
            <c:if test="${(i.index+1)%2 != 0}">
            <li><a href="#" onclick="showCourse('${crsList.courseCode}','${crsList.crsType1}');"><c:out value="${fn:substring(crsList.courseName, 0, 25)}"/></a><span>${crsList.eduFromTo}</span></li>
            </c:if>
            <c:if test="${(i.index+1)%2 == 0}">
            <li class="tabcontentBg"><a href="#" onclick="showCourse('${crsList.courseCode}','${crsList.crsType1}');"><c:out value="${fn:substring(crsList.courseName, 0, 25)}"/></a><span>${crsList.eduFromTo}</span></li>
            </c:if>
          </c:forEach>
          <c:if test="${fn:length(rsExtMain_EduMonthInfoList) == 0}">
            <li>��ȸ�� �����Ͱ� �����ϴ�.</li>
          </c:if>
--%>
          </ul>
        </div>
        <div class="tabMore" id="more3" style="display:block;"><a href="/crsMonth.act?task=move"><img alt="���� �����ȳ� ������" src="/images/more.gif" /></a></div>
        <input type="hidden" name="tMonth" value="${tMonth}">
      </div>
      </li>
    </ul>
  </div>
  </div>
  <div class="right_con">
<div class="tabList01">
<h2 class="hide">��������</h2>
<ul>
  <li class="on" id="title4"><a href="#" onclick="selectBrdMenu(1);" ><img name="Image_m04" src='<html:rewrite page="/images/board_m_04_over.gif"/>' alt="��������" /></a>
  <div id="Board_01" style="z-index:100">
    <div class="tabContent01">
      <ul id="latest4" style="display: block;">
        <c:forEach var="list" items="${rsExtMain_BrdNoticeList}" varStatus="i" >
          <li><a href="/extBordNotice.act?task=info&board_Idx=${list.board_Idx}"><c:out value="${fn:substring(list.title, 0, 22)}"/></a><span><c:out value="${list.wdate}"/></span></li>
        </c:forEach>
        <c:if test="${fn:length(rsExtMain_BrdNoticeList) == 0}">
          <li>��ȸ�� �����Ͱ� �����ϴ�.</li>
        </c:if>
      </ul>
    </div>
    <div class="tabMore" id="more4" style="display: block;"><a href="/extBordNotice.act?task=list"><img alt="�������� ������" src="/images/more.gif" /></a></div>
  </div>
  </li>
  <li id="title5"><a href="#" onclick="selectBrdMenu(2);" ><img name="Image_m05" src='<html:rewrite page="/images/board_m_05.gif"/>' alt="�ڷ��" /></a>
  <div id="Board_02" style="visibility:hidden; z-index:0">
    <div class="tabContent01">
      <ul id="latest5" style="display: block;">
        <c:forEach var="list" items="${rsExtMain_BrdDataList}" varStatus="i" >
          <li><a href="/extBordMorgue.act?task=info&board_Idx=${list.board_Idx}"><c:out value="${fn:substring(list.title, 0, 22)}"/></a><span><c:out value="${list.wdate}"/></span></li>
        </c:forEach>
        <c:if test="${fn:length(rsExtMain_BrdDataList) == 0}">
          <li>��ȸ�� �����Ͱ� �����ϴ�.</li>
        </c:if>
      </ul>
    </div>
    <div class="tabMore" id="more5" style="display: block;"><a href="/extBordMorgue.act?task=list"><img alt="�ڷ�� ������" src="/images/more.gif" /></a></div>
  </div>
  </li>
  <li id="title6"><a href="#" onclick="selectBrdMenu(3);" ><img name="Image_m06" src='<html:rewrite page="/images/board_m_06.gif"/>' alt="�����ı�" /></a>
  <div id="Board_03" style="visibility:hidden; z-index:0">
    <div class="tabContent01">
      <ul id="latest6" style="display: block;">
        <c:forEach var="list" items="${rsExtMain_BrdAfNoteList}" varStatus="i" >
          <li>&nbsp;<a href="/extBordAfNote.act?task=info&board_Idx=${list.board_Idx}"><c:out value="${fn:substring(list.title, 0, 22)}"/></a><span><c:out value="${list.wdate}"/></span></li>
        </c:forEach>
        <c:if test="${fn:length(rsExtMain_BrdAfNoteList) == 0}">
          <li>��ȸ�� �����Ͱ� �����ϴ�.</li>
        </c:if>
      </ul>
    </div>
    <div class="tabMore" id="more6" style="display: block;"><a href="/extBordAfNote.act?task=list"><img alt="�����ı� ������" src="/images/more.gif" /></a></div>
  </div>
  </li>
</ul>
</div>
      
</div>   
  </div>
 <div class="footer01">
     <div>
     <%-- <span style="margin:20px; border:1px solid black;"><a onclick="openPrivacyPolicy();" style="cursor:hand; font-weight: bold;">��������ó����ħ</a></span><br/>  --%>
   <p class="copyRight" style="padding-bottom:15px; font-weight: bold; top:15px;cursor:pointer;"><a onclick="openPrivacyPolicy();" style="cursor:hand;color:#00F; text-decoration:none;">[��������ó����ħ]</a></p>
    <address>
    ��) 363-853 ��û�ϵ� û���� ������ �����߷� 425 / ����������:043)220-5432 / FAX:043)220-5439
    </address>
    
    <p class="copyRight">COPYRIGHT 2001~2012 CHUNGCHEONGBUK-DO INSTITUTE RESOURCES DEVELOPMENT. ALL RIGHTS RESERVED.</p>
  </div>
</div>
</div>

<%--
<table width="790" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr> 
    <td valign="top" class="mBg"> 
      <table width="757" border="0" cellspacing="0" cellpadding="0" align="right">
        <tr> 
          <td height="225" colspan="2"> 
            <table width="757" border="0" cellspacing="0" cellpadding="0">
              <tr> 
              	<td width="455"><img src='<html:rewrite page="/images/img.jpg"/>'/></td>
                <td width="303" valign="top">
                  <table width="255" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="99"><img src='<html:rewrite page="/images/img_text.gif"/>' alt="�뱸������ ������ ���� �¶��� �ý��� �Ϸ� �뱸�� �̲��� �� â�Ǥ��ǿ����� ��������" /></td>
                    </tr>
                    <tr> 
                      <td valign="top">
												<table width="255" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="44"><img src='<html:rewrite page="/images/img_left.gif"/>'></td>
                            <td width="61"><a href="http://100.31.15.180:8080/ebook/book/admin/9/" target="_blank" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image50','','images/quick_01_over.gif',1)"><img name="Image50" src='<html:rewrite page="/images/quick_01.gif"/>' alt="�Ա��ȳ���"/></a></td>
                            <td width="58"><img src='<html:rewrite page="/images/img_center.gif"/>'></td>
                            <td><a href='<html:rewrite page="/extRoomMap.act?task=list"/>' onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image51','','images/quick_02_over.gif',2)"><img name="Image51" src='<html:rewrite page="/images/quick_02.gif"/>' alt="��ġ��"/></a></td>
                            <td width="44"><img src='<html:rewrite page="/images/img_right.gif"/>'></td>
                          </tr>
                        </table>
											</td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr valign="top"> 
        	<td width="390"> 
						<!--�����ȳ� ����Ʈ ���̺� ����-->
						<table width="372" border="0" cellspacing="0" cellpadding="0">
						  <tr> 
						    <td background='<html:rewrite page="/images/board_bg.gif"/>' width="97"><a href="#" onclick="selectEduMemu(2);" ><img name="Image_m02" src='<html:rewrite page="/images/board_m_02_over.gif"/>' alt="����� �����ȳ�" /></a></td>
						    <td background='<html:rewrite page="/images/board_bg.gif"/>' width="88"><a href="#" onclick="selectEduMemu(1);" ><img name="Image_m01" src='<html:rewrite page="/images/board_m_01.gif"/>' alt="������ �����ȳ�" /></a></td>
						    <td background='<html:rewrite page="/images/board_bg.gif"/>' width="81"><a href="#" onclick="selectEduMemu(3);" ><img name="Image_m03" src='<html:rewrite page="/images/board_m_03.gif"/>' alt="���� �����ȳ�" /></a></td>
						    <td background='<html:rewrite page="/images/board_bg.gif"/>' align="right" width="106" id="eduInfoMore"><img src='<html:rewrite page="/images/board_more.gif"/>' alt="������" /></td>
						  </tr>
						</table>
						<!--�����ȳ� ����Ʈ ���̺� ��-->
						<!--������ �����ȳ� ���̺� ����-->
						<div id="Layer_01" style="position:absolute; visibility:hidden; z-index:0">
							<table width="372" border="0" cellspacing="0" cellpadding="0">
								<tr> 
									<td> 
										<table width="372" border="0" cellspacing="0" cellpadding="0" align="center">
											<tr> 
												<td width="31"><a href="#" onclick="selectCrs('01');" ><img name="Lecture01" src='<html:rewrite page="/images/lecture_01.gif"/>' alt="�⺻����" /></a></td>
												<td width="31"><a href="#" onclick="selectCrs('02');" ><img name="Lecture02" src='<html:rewrite page="/images/lecture_02.gif"/>' alt="��������" /></a></td>
												<td width="31"><a href="#" onclick="selectCrs('03');" ><img name="Lecture03" src='<html:rewrite page="/images/lecture_03.gif"/>' alt="Cyber����" /></a></td>
												<td width="31"><a href="#" onclick="selectCrs('04');" ><img name="Lecture04" src='<html:rewrite page="/images/lecture_04.gif"/>' alt="����ȭ����" /></a></td>
												<td width="31"><a href="#" onclick="selectCrs('05');" ><img name="Lecture05" src='<html:rewrite page="/images/lecture_05.gif"/>' alt="�ܱ����" /></a></td>
											</tr>
										</table>
									</td>
								</tr>
  							<!--����Ʈ ����--> 
								<tr> 
  								<td height="150">
  									<iframe frameborder="0" id="crsList" name="crsList" width="372" height="150" scrolling="no"></iframe>
  								</td>
								</tr>
	            	<!--����Ʈ ��-->
            	</table>
						</div>
						<!--������ �����ȳ� ���̺� ��-->
						<!--����� �����ȳ� ���̺� ����-->
						<div id="Layer_02" style="position:absolute; z-index:100">
							<table width="372" border="0" cellspacing="0" cellpadding="0">
								<tr> 
									<td> 
										<table width="372" border="0" cellspacing="0" cellpadding="0" align="center">
											<tr> 
												<td width="31"><img src='<html:rewrite page="/images/ingEdu.gif"/>' alt="���� �������� ��������" /></td>
											</tr>
										</table>
									</td>
								</tr>
  							<!--����Ʈ ����--> 
								<tr> 
  								<td height="150">
  									<iframe frameborder="0" id="ingList" name="ingList" width="372" height="150" src='<html:rewrite page="/extMainBegin.act?task=eduIngInfo"/>' scrolling="no"></iframe>
  								</td>
								</tr>
	            	<!--����Ʈ ��-->
            	</table>
						</div>
						<!--����� �����ȳ� ���̺� ��-->
						<!--���� �����ȳ� ���̺� ����-->
						<div id="Layer_03" style="position:absolute; visibility:hidden;; z-index:0">
							<table width="372" border="0" cellspacing="0" cellpadding="0">
								<tr> 
									<td> 
										<table width="372" border="0" cellspacing="0" cellpadding="0" align="center">
											<tr> 
												<td width="31"><a href="#" onclick="selectPlan('01');" ><img name="Image01" src='<html:rewrite page="/images/01.gif"/>' alt="1��" /></a></td>
												<td width="31"><a href="#" onclick="selectPlan('02');" ><img name="Image02" src='<html:rewrite page="/images/02.gif"/>' alt="2��" /></a></td>
												<td width="31"><a href="#" onclick="selectPlan('03');" ><img name="Image03" src='<html:rewrite page="/images/03.gif"/>' alt="3��" /></a></td>
												<td width="31"><a href="#" onclick="selectPlan('04');" ><img name="Image04" src='<html:rewrite page="/images/04.gif"/>' alt="4��" /></a></td>
												<td width="31"><a href="#" onclick="selectPlan('05');" ><img name="Image05" src='<html:rewrite page="/images/05.gif"/>' alt="5��" /></a></td>
												<td width="31"><a href="#" onclick="selectPlan('06');" ><img name="Image06" src='<html:rewrite page="/images/06.gif"/>' alt="6��" /></a></td>
												<td width="31"><a href="#" onclick="selectPlan('07');" ><img name="Image07" src='<html:rewrite page="/images/07.gif"/>' alt="7��" /></a></td>
												<td width="31"><a href="#" onclick="selectPlan('08');" ><img name="Image08" src='<html:rewrite page="/images/08.gif"/>' alt="8��" /></a></td>
												<td width="31"><a href="#" onclick="selectPlan('09');" ><img name="Image09" src='<html:rewrite page="/images/09.gif"/>' alt="9��" /></a></td>
												<td width="31"><a href="#" onclick="selectPlan('10');" ><img name="Image10" src='<html:rewrite page="/images/10.gif"/>' alt="10��" /></a></td>
												<td width="31"><a href="#" onclick="selectPlan('11');" ><img name="Image11" src='<html:rewrite page="/images/11.gif"/>' alt="11��" /></a></td>
												<td width="31"><a href="#" onclick="selectPlan('12');" ><img name="Image12" src='<html:rewrite page="/images/12.gif"/>' alt="12��" /></a></td>
											</tr>
										</table>
									</td>
								</tr>
  							<!--����Ʈ ����--> 
								<tr> 
  								<td height="150">
  									<iframe frameborder="0" id="mainList" name="mainList" width="372" height="150" src="" scrolling="no" ></iframe>
  								</td>
								</tr>
	            	<!--����Ʈ ��-->
	          	</table>
							<input type="hidden" name="tMonth" value="${tMonth}">
						</div>
						<!--���� �����ȳ� ���̺� ��-->
					</td>
          <td width="367">  
          	<!--������û ����Ʈ ���̺� ����-->
            <table width="350" border="0" cellspacing="0" cellpadding="0">
              <tr valign="middle"> 
                <td width="90" height="30"><img src='<html:rewrite page="/images/title_request.gif"/>' alt="������û" /></td>
                <td width="260"><img src='<html:rewrite page="/images/more.gif"/>' alt="������" style="cursor:hand" onclick="location.href='<html:rewrite page="/extCrs_ReqCrs.act?task=list"/>'"/></td>
              </tr>
						  <tr>
						    <td colspan="2" style="padding:15px 0 0 0;"> 
						      <table width="350" border="0" cellspacing="0" cellpadding="0" align="center">
						      	<c:forEach var="list" items="${rsExtMain_ReqCrsList}" varStatus="i" >
								      <tr> 
								        <td height="21" width="20" align="center"><img src='<html:rewrite page="/images/dot.gif"/>'></td>
								        <td height="21"><a href="extCrs_ReqCrs.act?task=info&board_Idx=${list.board_Idx}"><c:out value="${list.title}"/></a></td>
								        <td height="21" width="80" align="center"><font color="#A4A4A4"><c:out value="${list.wdate}"/></font></td>
								      </tr>
								      <tr bgcolor="#EAEAEA"> 
								        <td colspan="3" height="1"></td>
								      </tr>
						      	</c:forEach>
						      </table>
						    </td>
						  </tr>
						</table>
						<!--������û ����Ʈ ���̺� ��-->
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
--%>
<script type="text/javascript">
<!--
//-->
</script>