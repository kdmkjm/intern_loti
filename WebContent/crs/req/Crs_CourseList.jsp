<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
<!--

	window.onresize = function(){
	//   ������ ������ ���� ���� �ڵ�
	tresize(160);
	}

	// ������ ó�� ������� �⺻������ ��ȸ
	function searchList(key)
	{
		if(key=="move")
		{
			//document.forms[0].submit();
		}
	}

	function showCourse(courseCode,crsType1)
	{
			LeftPosition=screen.width/2-(667/2);
			TopPosition=screen.height/2-(470/2);
			window.open('${pageContext.request.contextPath}/cmnCourseInfo.act?task=info&coursecode='+courseCode+'&crstype1='+crsType1,'pop1',
		  	'height=470,width=667,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=yes,top='+TopPosition+',left='+LeftPosition);
	}

	function checkDate()
	{

		var frm = document.forms[0];
		var chk = frm.check;

		if(chk.checked==true)
		{
			frm.isCheck.value='Y';
		}
		else
		{
			frm.isCheck.value='N';
		}
	}
//-->
	function doSubmit(frm)
	{
		if(frm.check.checked == false && frm.searchKeyword.value.trim() == "")
		{
			alert("�������� �Է��ϼ���.");
			frm.searchKeyword.focus();
			return;
		}
		frm.submit();
	}
	
	String.prototype.trim = function()
	{
	 return this.replace(/(^\s*)|(\s*$)/gi, "");
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="���������˻�" src="/images/edu/title_06.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <!--�˻� ���̺� ����-->
    <html:form action='crsCourse.act?task=list'>
      <html:hidden property="isCheck" value="Y"/>
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr>
        <td bgcolor="#FFFFFF">
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="99" class="s1"><html:checkbox property="check" value="on" onclick="checkDate();" />&nbsp;�����Ⱓ</td>
            <td class="sBar"></td>
            <td class="s2" width="229">
              <html:text property="eduFrom" style="width:70px" readonly="true"   onkeydown="checkDay();" /><img  src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[0], 'yyyy-mm-dd')">
              ~
              <html:text property="eduTo" style="width:70px" readonly="true"  onkeydown="checkDay();" /><img  src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[3], 'yyyy-mm-dd')">
            </td>
            <td class="sBar"></td>
            <td width="99" class="s1">������</td>
            <td class="sBar"></td>
            <td class="s2" colspan="5">
              <html:text property="searchKeyword" style="width:190px;"/>
            </td>
            <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="doSubmit(document.forms[0]);" style="cursor:hand" align="absbottom"/></td>
          </tr>
          </table>
        </td>
      </tr>
      </table>
    </html:form>
    <!--�˻� ���̺� ��-->
  </td>
</tr>
<tr>
  <td height="15"></td>
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
    <!--���̺� ��� ����-->
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="lbg"></td>
      <td class="cbg">
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="t1" width="40">��ȣ</td>
          <td class="sBg"></td>
          <td class="t1">������</td>
          <td class="sBg"></td>
          <td class="t1" width="85">�Ⱓ</td>
          <td class="sBg"></td>
          <td class="t1" width="95">���</td>
          <td class="sBg"></td>
          <td class="t1" width="50">�ϼ�</td>
          <td class="sBg"></td>
          <td class="t1" width="50">�ο�</td>
          <td class="sBg"></td>                           
          <td class="t1" width="60">���ǽ�</td>
          <td class="sBg"></td>
          <td class="t1" width="60">�����</td>
          <td class="sBg"></td>
          <td class="t1" width="70">ó��</td>
          <td width="17"></td>
        </tr>
        </table>
      </td>
      <td class="lbg"></td>
    </tr>
    </table>
    <!--���̺� ��� ��-->
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
            <!--����Ʈ ����-->
            <div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden;">
              <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			  <c:forEach var="crsList" items="${rsCrs_CourseList}" varStatus="i" >
				<c:if test="${i.count%2 == 0}">
				<tr>
		          <td class="t2" width="40">${i.count}</td>
		          <td class="sBg"></td>
		          <td class="t3">&nbsp;${crsList.courseName}</td>
		          <td class="sBg"></td>
		          <td class="t2" width="85">${crsList.eduFromTo}</td>
		          <td class="sBg"></td>
		          <td class="t2" width="95">${crsList.eduTarget}</td>
		          <td class="sBg"></td>
		          <td class="t2" width="50"><fmt:formatNumber value="${crsList.eduDay}" pattern="#,##0"/></td>
		          <td class="sBg"></td>
		          <td class="t2" width="50"><fmt:formatNumber value="${crsList.eduCount}" pattern="#,##0"/></td>
		          <td class="sBg"></td>		                                   
		          <td class="t2" width="60">${crsList.lecRoomNo}</td>
		          <td class="sBg"></td>
		          <td class="t2" width="60">${crsList.charger}</td>
		          <td class="sBg"></td>
		          <td class="t2" width="70"><img src='<html:rewrite page="/images/board/btn_view.gif"/>' width="53" height="18" align="absmiddle" alt="��������" onclick="showCourse('${crsList.courseCode}','${crsList.crsType1}');" style="CURSOR: hand"/></td>
		        </tr>
				<tr>
				  <td class="lbg3" colspan="99"></td>
				</tr>
			    </c:if>
			    <c:if test="${i.count%2 == 1}">
				<tr class="tbg3">
				  <td class="t2" width="40">${i.count}</td>
		          <td class="sBg"></td>
		          <td class="t3">&nbsp;${crsList.courseName}</td>
		          <td class="sBg"></td>
		          <td class="t2" width="85">${crsList.eduFromTo}</td>
		          <td class="sBg"></td>
		          <td class="t2" width="95">${crsList.eduTarget}</td>
		          <td class="sBg"></td>
		          <td class="t2" width="50"><fmt:formatNumber value="${crsList.eduDay}" pattern="#,##0"/></td>
		          <td class="sBg"></td>
		          <td class="t2" width="50"><fmt:formatNumber value="${crsList.eduCount}" pattern="#,##0"/></td>
		          <td class="sBg"></td>		                                 
		          <td class="t2" width="60">${crsList.lecRoomNo}</td>
		          <td class="sBg"></td>
		          <td class="t2" width="60">${crsList.charger}</td>
		          <td class="sBg"></td>
		          <td class="t2" width="70"><img src='<html:rewrite page="/images/board/btn_view.gif"/>' width="53" height="18" align="absmiddle" alt="��������" onclick="showCourse('${crsList.courseCode}','${crsList.crsType1}');" style="CURSOR: hand"/></td>
		        </tr>
				<tr>
				  <td class="lbg3" colspan="99"></td>
				</tr>
				</c:if>
				<c:set value="${i.count}" var="count"></c:set>
			  </c:forEach>
			  <c:if test="${count==null}">
				<tr class="tbg3">
				  <td class="t2" colspan="99">��ȸ�� �����Ͱ� �����ϴ�.</td>
				</tr>
			  </c:if>
			  </table>
            </div>
            <!--����Ʈ ��-->
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
	tresize(160);
	searchList('${key}');
	document.forms[0].searchKeyword.focus();

//-->
</script>
