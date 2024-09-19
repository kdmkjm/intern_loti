<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   ������ ������ ���� ���� �ڵ�
		tresize(190);
	}
	
	function checkAll()
	{
		var max = Number(document.all.max.value);
		if(max == 0)
		{
			alert("��ȸ�� �����Ͱ� �����ϴ�.");
			return;
		}
		
		if(max == 1)
		{
			if(document.all.checkbox.checked == false)
				document.all.checkbox.checked = true;
			else
				document.all.checkbox.checked = false;
		}
		else
		{
			if(document.all.checkbox[0].checked == false)
				for(var i=0; i<max; i++)
					document.all.checkbox[i].checked = true;
			else
				for(var i=0; i<max; i++)
					document.all.checkbox[i].checked = false;
		}
	}
	
	function doSubmit(frm)
	{
		var max = Number(frm.max.value);
		if(max == 0)
		{
			alert("��ȸ�� �����Ͱ� �����ϴ�.");
			return;
		}
		// �˻������ 1���� ���
		if(max == 1)
		{
			frm.arrayEduDate.value = document.all.searchDate.value;
				
			if(frm.checkbox.checked == true)
			{
				frm.arrayAttendYN.value = "Y";
			}
			else
			{
				frm.arrayAttendYN.value = "N";
			}
		}
		// �˻������ �������� ���
		else
		{
			for(var i=0; i<max; i++)
			{
				frm.arrayEduDate[i].value = document.all.searchDate.value;
				
				if(frm.checkbox[i].checked == true)
				{
					frm.arrayAttendYN[i].value = "Y";
				}
				else
				{
					frm.arrayAttendYN[i].value = "N";
				}
			}
		}
		frm.courseCode.value 	= document.all.searchCourseCode.value;
		frm.eduDate.value 		= document.all.searchDate.value;
		frm.courseName.value 		= document.all.searchCourseName.value;
		
		var do_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(do_confirm == true)
			frm.submit();
	}
	function doModify(seq)
	{
		document.forms[1].courseCode.value 	= document.forms[0].searchCourseCode.value;
		document.forms[1].courseName.value 	= document.forms[0].searchCourseName.value;
		document.forms[1].eduDate.value 		= document.forms[0].searchDate.value;
		document.forms[1].seq.value 				= seq;
		 
		document.forms[1].action = 'oprAttend.act?task=info';
		document.forms[1].submit();
	}
	
	function setCrs()
	{
		var searchCode = document.all.searchCourseCode.value;
		// type ���� �Ѱ��ش�. (onlyCrs) 
		window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="���°���" src="/images/operation/title_12.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--�˻� --> 
	<html:form method="POST" action="oprAttend.act?task=list">
	<table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr> 
        <td bgcolor="#FFFFFF"> 
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="80" class="s1">����</td>
            <td class="sBar"></td>
			<td class="s2" width="420"> 
			  <select id="searchYear"></select>
			  <select id="searchCourseName" style="width:240px;">
			  	<option value="">���� ����</option>
			  </select>
			  <select id="searchKeyword" style="width:100px;">
			  	<option value="">������� ����</option>
			  </select>
			  <html:hidden property="searchColumn"/>
			  <html:hidden property="searchCourseCode"/>
			</td>
            <td class="sBar"></td>
			<td width="59" class="s1">��¥</td>
			<td class="sBar"></td>
			<td class="s2"> 
			  <html:text property="searchDate" style="width:75px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchDate, 'yyyy-mm-dd');">
			</td>
			<td width="60">
			  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="doSearch()" style="cursor:hand" align="absbottom"/>
			</td>
          </tr>
          </table>
        </td>
      </tr>
      </table>
      <!--�˻� ���̺� ��-->
	  
	</html:form>
	<!--�˻� ��-->
	<table width="750" cellspacing="0" cellpadding="0">
	<tr valign="bottom">
	  <td class="t4" height="25">
	  <c:if test="${eduDate != null}">
		<b>�����Ⱓ : <c:out value="${eduDate}"/></b>
	  </c:if>
	  </td>
	</tr>
	</table>
	<html:form method="POST" action="oprAttend.act?task=insert">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	  <tr>
		<td>
		  <!--���̺� ��� ����-->
		  <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		  <tr> 
            <td class="t1" width="44">����</td>
            <td class="sBg"></td>
            <td class="t1">�Ҽ�</td>
            <td class="sBg"></td>
            <td class="t1" width="129">����</td>
            <td class="sBg"></td>
            <td class="t1" width="79">����</td>
            <td class="sBg"></td>
            <td class="t1" width="74"><a href="#" onclick="checkAll();"><u>���</u></a></td>
            <td class="sBg"></td>
            <td class="t1" width="99">���</td>
            <td class="sBg"></td>
            <td class="t1" width="80">����</td>
            <td width="17"></td>
          </tr>
		  </table>
		  <!--���̺� ��� ��-->
		  <!--����Ʈ ����-->
		  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			<c:set var="no" scope="request" value="1"/>
			<c:forEach var="list" items="${rsOpr_AttendList}" varStatus="i" >
			  <!-- �� ��� -->
			  <c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			  <c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			  <html:hidden property="arrayAttendYN" value="${list.attendYN}"/>
			  <html:hidden property="arrayCourseCode" value="${list.courseCode}"/>
			  <html:hidden property="arraySeq" value="${list.seq}"/>
			  <html:hidden property="arrayEduDate" />
			  <tr class="${lineBg}">
				<td class="t2" width="44">&nbsp;<c:out value="${list.stdNo}"/></td>
				<td class="sBg"></td>
				<td class="t3">&nbsp;<c:out value="${list.assignName}"/>&nbsp;<c:out value="${list.workPlace}"/></td>
                <td class="sBg"></td>
                <td class="t3" width="129">&nbsp;<c:out value="${list.rankName}"/></td>
                <td class="sBg"></td>
                <td class="t2" width="79"><c:out value="${list.stdName}"/></td>
                <td class="sBg"></td>
                <td class="t2" width="74">
                  <c:if test="${list.attendYN == 'Y'}">
                    <input type="checkbox" name="checkbox" value="checkbox" checked>
                  </c:if>
                  <c:if test="${list.attendYN != 'Y'}">
                    <input type="checkbox" name="checkbox" value="checkbox">
                  </c:if>
                </td>
                <td class="sBg"></td>																																																																							
                <td class="t2" width="99">
                  <c:if test="${list.attendYN == 'Y'}">
                    <c:out value="${list.attendName}"/>
                  </c:if>
                  <c:if test="${list.attendYN != 'Y'}">
                    <span class="lend1"><c:out value="${list.attendName}"/></span>
                  </c:if>                        		
                </td>
                <td class="sBg"></td>																																																																							
                <td class="t2" width="80">
                  <c:if test="${list.attendYN != null}">
                    <c:if test="${isPass == '0'}">
                      <img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle" alt="����" style="cursor:hand" onclick="doModify(${list.seq});"/>
                    </c:if>
                    <c:if test="${isPass != '0'}">
                      <img src='<html:rewrite page="/images/board/btn_modify_off.gif"/>' align="absmiddle" alt="����"/>
                    </c:if>
                  </c:if>
                </td>
			  </tr>
			  <tr>
				<td colspan="15" class="lbg3"></td>
			  </tr>
			  <c:set var="no" scope="request" value="${no + 1}"/>
			</c:forEach>
			<html:hidden property="max" value="${no - 1}"/>
			<html:hidden property="courseCode"/>
			<html:hidden property="eduDate"/>
			<html:hidden property="courseName"/>
			<html:hidden property="seq"/>
			<c:if test="${no==1}">
			  <tr class="tbg3">
				<td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
			  </tr>
			</c:if>
			</table>	
		  </div>
		  <!--����Ʈ ��-->
		</td>
	  </tr>
	  </table>
	  <!--�ϴܹ�ư ���̺� ����-->
	  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
	  <tr valign="bottom"> 
		<td align="right">
		  <c:if test="${isPass == '0'}">
		    <img src='<html:rewrite page="/images/board/btn_save.gif"/>' alt="����"  align="absmiddle" style="cursor:hand" onclick="doSubmit(document.forms[1]);"/>
		  </c:if>
		  <c:if test="${isPass != '0'}">
		    <img src='<html:rewrite page="/images/board/btn_save_off.gif"/>' alt="����"  align="absmiddle"/>
		  </c:if>
		</td>
	  </tr>
	  </table>
	</html:form>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(190);
//-->
</script>