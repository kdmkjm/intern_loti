<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   ������ ������ ���� ���� �ڵ�
		tresize(180);
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
	
	function doSearch(frm)
	{
		document.all.searchCourseCode.value = document.getElementById('searchCourseName').value + '%' + document.getElementById('searchKeyword').value + '%';
		if(document.all.searchCourseCode.value == "%%")
		{
			alert("������ �����ϼ���");
			return;
		}
			
		frm.submit();
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
	<h1><img alt="���� �μ�" src="/images/resources/title_06.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--�˻� -->
	<html:form method="POST" action="certPrt.act?task=list&type=true">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
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
		<td width="60">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="doSearch(document.forms[0]);" style="cursor:hand" align="absbottom"/>
		</td>
	  </tr>
	  </table>
	</html:form>
	<!--�˻� ��-->
	<table width="750" cellspacing="0" cellpadding="0">
	<tr valign="bottom">
	  <td height="15"></td>
	</tr>
	</table>
	<html:form method="POST" action="certPrt.act?task=list&type=true">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	  <tr>
		<td>
		  <!--���̺� ��� ����-->
		  <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		  <tr> 
            <td class="t1" width="59"><a href="#" onclick="checkAll();"><u>����</u></a></td>
            <td class="sBg"></td>
            <td class="t1" width="99">����</td>
            <td class="sBg"></td>
            <td class="t1">�Ҽ�</td>
            <td class="sBg"></td>
            <td class="t1" width="149">����</td>
            <td class="sBg"></td>
            <td class="t1" width="79">����</td>
            <td class="sBg"></td>
            <td class="t1" width="80">�̼�����</td>
            <td width="17"></td>
          </tr>
		  </table>
		  <!--���̺� ��� ��-->
		  <!--����Ʈ ����-->
		  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			<c:forEach var="list" items="${rsExtMylc_CertPrtList}" varStatus="i" >
			  <!-- �� ��� -->
			  <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			  <c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			  <tr class="${lineBg}">
	            <td class="t2" width="59"><input type="checkbox" name="checkbox" value="${list.courseCode}${list.seq}" ></td>
	            <td class="sBg"></td>
                <td class="t2" width="99" id="stdName"><c:out value="${list.stdName}"/></td>
                <td class="sBg"></td>
                <td class="t3">&nbsp;<c:out value="${list.assignName}"/></td>
                <td class="sBg"></td>
                <td class="t3" width="149">&nbsp;<c:out value="${list.rankName}"/></td>
                <td class="sBg"></td>
                <td class="t2" width="79"><c:out value="${list.teamno}"/></td>
                <td class="sBg"></td>
				<td class="t2" width="80">
				  <c:if test="${list.isfinish == 'Y'}">
				    <span class="lend1">�̼�</span>
				    <html:hidden property="isfinish" value="Y"/>
				  </c:if>
				  <c:if test="${list.isfinish == 'N'}">
				    <span class="lend2">���̼�</span>
				    <html:hidden property="isfinish" value="N"/>
				  </c:if>
				  <c:if test="${list.isfinish == null}">
				    <html:hidden property="isfinish" value="NOTPASS"/>
				  </c:if>
			    </td>
			  </tr>
			  <tr>
				<td colspan="15" class="lbg3"></td>
			  </tr>
			  <c:set var="no" scope="request" value="${i.count}"/>
			</c:forEach>
			<html:hidden property="max" value="${no}"/>
			<c:if test="${no==null}">
			  <tr class="tbg3" height="21">
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
		<td>
		  <img src='<html:rewrite page="/images/board/btn_print3.gif"/>' align="absmiddle" style="cursor:hand" alt="�̼��� �μ�" onclick="ozReport('1');" /> 
		  <img src='<html:rewrite page="/images/board/btn_print4.gif"/>' align="absmiddle" style="cursor:hand" alt="�����̼�Ȯ�μ� �μ�" onclick="ozReport('2');" /> 
		  <img src='<html:rewrite page="/images/board/btn_print5.gif"/>' align="absmiddle" style="cursor:hand" alt="�����Ʒ������ �μ�" onclick="ozReport('3');"/>
		</td>
	  </tr>
	  </table>
	</html:form>
  </td>
</tr>
</table>
<form name="toFrm">
<input type="hidden" name="report">
<input type="hidden" name="check_array" size="50">
</form>
<script type="text/javascript">
<!--
	tresize(180);
	//document.forms[0].searchCourseCode.focus();

	function ozReport(gubun)
	{
	  var ch="";
		var max = Number(document.forms[1].max.value);
		var count = 0;
		var check = "";
		var stdName = "";
		var frm = document.forms[1];
			
		//�˻������ ������� - �����Ʈâ�� ��������
		if(max == 0)
		{
			alert("��ȸ�� �����Ͱ� �����ϴ�.");
			return;
		}
		
		//�˻������ �ϳ��ϰ��
		if(max == 1)
		{
			if(frm.checkbox.checked == true)
			{
				stdName = document.all.stdName.innerHTML;
				if(frm.isfinish.value == "Y")
				{
					ch = ch + frm.checkbox.value + ",";
					check = true;
				}
				else if(frm.isfinish.value == "NOTPASS")
				{
					check = false;
					alert("�̼�ó������ ���� �����ʹ� �μ��� �� �����ϴ�.\n[����:" + stdName + "]");
					return;
				}
				else
				{
					check = false;
					alert("���̼� �ο��� ���õǾ� �ֽ��ϴ�.\n[����:" + stdNo + "]");
					return;
				}
				count++;
			}
		}//�˻������ �������� ���
		else
		{
			for(var i=0; i<max; i++)
			{
				if(frm.checkbox[i].checked == true)
				{
					stdName = document.all.stdName[i].innerHTML;
					if(frm.isfinish[i].value == "Y")
					{
						ch = ch + frm.checkbox[i].value + ",";
						check = true;
					}
					else if(frm.isfinish[i].value == "NOTPASS")
					{
						check = false;
						alert("�̼�ó������ ���� �����ʹ� �μ��� �� �����ϴ�.\n[����:" + stdName + "]");
						return;
					}
					else
					{
						check = false;
						alert("���̼� �ο��� ���õǾ� �ֽ��ϴ�.\n[����:" + stdName + "]");
						return;
					}
					count++;
				}
			}
		}
		document.all.check_array.value = ch.substring(0, ch.length - 1); 
		//üũ�ڽ� ������ ���� �ʾ�����
		if(count == 0)
		{
			alert("�� �� �̻� �����Ͽ� �ּ���.");
			return;
		}
	    	       
		if(gubun==1)
			document.forms[2].report.value = "end";
		else if(gubun==2)
			document.forms[2].report.value = "endconfirm";
		else
			document.forms[2].report.value = "endhun";
			
	 	var str 
	 	var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
	 	str = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,width=710,height=550,top="+wint+",left="+winl;  	
		window.open('','popup', str);
		document.forms[2].action = "ozMenu.act"
		document.forms[2].target = "popup";			
		document.forms[2].submit();		
		document.forms[2].target = "";
	}
	
//-->
</script>