<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>

<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   ������ ������ ���� ���� �ڵ�
		tresize(210);
	}
/*
	function doSearch(frm)
	{
		if(document.all.searchCourseCode.value == "")
		{
			alert("������ �����ϼ���");
			return;
		}
			
		frm.submit();
	}
*/
	// ������ ó�� ������� �⺻������ ��ȸ
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}
	// �����Ʈ���(��ư�� ���� ��¹�����)
	function ozReport(k)
	{
		var courseCode = document.all.searchCourseCode.value;
		if(k==1)
		{	//�������
			url = '<html:rewrite page="/ozMenu.act"/>?report=name&courseCode='+courseCode;
			window.open(url,'popup', 'scrollbars = no, resizable=yes, menubar = no, width = 710 height =550, status = yes');
		}
		else if(k==2)
		{
			url = '<html:rewrite page="/ozMenu.act"/>?report=team&courseCode='+courseCode;
			window.open(url,'popup', 'scrollbars = no,resizable=yes,  menubar = no, width = 710 height =550, status = yes');
		}
		
		else if(k==3)
		{
			url = '<html:rewrite page="/ozMenu.act"/>?report=add&courseCode='+courseCode;
			window.open(url,'popup', 'scrollbars = no,resizable=yes, menubar = no, width =710 height =550, status = yes');
		}
		else if(k==4)
		{
			url = '<html:rewrite page="/ozMenu.act"/>?report=hak&courseCode='+courseCode;
			window.open(url,'popup', 'scrollbars = no,resizable=yes, menubar = no, width =710 height =550, status = yes');
		}
		
	}
	function setCrs()
	{
		var searchCode = document.all.searchCourseCode.value;
		// type ���� �Ѱ��ش�. (onlyCrs)
		window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
	
	function openHistory(courseCode, seq, chieforgan)
	{
		document.location.href = "oprStudent.act?task=info&courseCode="+courseCode+"&seq="+seq+"&chieforgan="+chieforgan;
	}
	
	function createStdNo(frm)
	{
		var max = Number(frm.count.value);
		if(max == 0)
		{
			alert("��ȸ�� �����Ͱ� �����ϴ�.");
			return;
		}
		
		// �˻������ 1���� ���
		if(max == 1)
		{
			if(frm.iscost.checked == true)
				frm.iscostarray.value = "Y";
			else
				frm.iscostarray.value = "N";
								
			if(frm.isleader.checked == true)
				frm.isleaderarray.value = "Y";
			else
				frm.isleaderarray.value = "N";
		}
		// �˻������ �������� ���
		else
		{
			for(var i=0; i<max; i++)
			{
				if(frm.iscost[i].checked == true)
					frm.iscostarray[i].value = "Y";
				else
					frm.iscostarray[i].value = "N";
					
				if(frm.isleader[i].checked == true)
					frm.isleaderarray[i].value = "Y";
				else
					frm.isleaderarray[i].value = "N";
			}
		}
		
		if(confirm("���������� �Ͻðڽ��ϱ�?"))
		{
			var stdNoType = jQuery('#selectStdNo').val();
			frm.courseCode.value = document.forms[0].searchCourseCode.value;
			frm.courseName.value = document.forms[0].searchCourseName.value;
			
		 	//frm.action = "<html:rewrite page="/oprStudent.act?task=updatestdno"/>";
		 	frm.action = "oprStudent.act?task=updatestdno&stdNoType=" + stdNoType;
		 	frm.submit();
		}
	}

	function sort(order)
	{
		var tblObj = document.getElementById("mainTable");
		var li_row_index = event.srcElement.parentElement.parentElement.rowIndex;
		
		if(order == 'up'){
	  	if(Number(li_row_index) == 0){
	  		alert("�ֻ����Դϴ� �����Ҽ� �����ϴ�.");
	  		return;
	  	}
	  	tblObj.moveRow(li_row_index, li_row_index-1);
	  }else{
	  	if(Number(li_row_index) == Number(tblObj.rows.length)-1){
	  		alert("�������Դϴ� �����Ҽ� �����ϴ�.");
	  		return;
	  	}
	  	tblObj.moveRow(li_row_index, li_row_index+1);
		}
	}

	//���� �ٿ�ε�
	function excelDown()
	{
		var form = document.forms[0];
		var url = '${pageContext.request.contextPath}/oprStudent.act?task=excel&';
      	var pars = Form.serialize(form);

       document.location.href = url+pars;

	}
	
	//����
	function doSubmit(frm)
	{
		var max = Number(frm.count.value);
		if(max == 0)
		{
			alert("��ȸ�� �����Ͱ� �����ϴ�.");
			return;
		}
		
		// �˻������ 1���� ���
		if(max == 1)
		{
			if(frm.iscost.checked == true)
				frm.iscostarray.value = "Y";
			else
				frm.iscostarray.value = "N";
								
			if(frm.isleader.checked == true)
				frm.isleaderarray.value = "Y";
			else
				frm.isleaderarray.value = "N";
		}
		// �˻������ �������� ���
		else
		{
			for(var i=0; i<max; i++)
			{
				if(frm.iscost[i].checked == true)
					frm.iscostarray[i].value = "Y";
				else
					frm.iscostarray[i].value = "N";
					
				if(frm.isleader[i].checked == true)
					frm.isleaderarray[i].value = "Y";
				else
					frm.isleaderarray[i].value = "N";
			}
		}
		frm.submit();
	}
	
	
	function oprStuCancle(courseCode, seq, chieforgan)
	{
		window.open('<html:rewrite page="/oprStudent.act?task=oprStuCancle&courseCode=' + courseCode + '&seq=' + seq + '&chieforgan=' + chieforgan + '"/>', 'oprStuCancle', 'scrollbars=no, menubar=no, width=600, height=361, status=yes top=150, left=150');
	}
	
	function chkLeader(num)
	{
		var frm = document.forms[1];
		var max = Number(frm.count.value);
		
		// �˻������ 1���� ���
		if(max == 1)
		{
			if(num != 1)
			{
				frm.isleader.checked = false;
			}
		}
		// �˻������ �������� ���
		else
		{
			for(var i=0; i<max; i++)
			{
				if(Number(i) != Number(num))
				{
					frm.isleader[i].checked = false;
				}
			}
		}
	}
	
	function orderby(obj){
		var order;
		if('${orderby}'.split(" ")[1] == 'asc'){
			order = 'desc';
		}
		else{
			order = 'asc';
		}
		
		if(obj == 'random'){
			document.forms[0].action = document.forms[0].action + '&orderby=' + obj;
		}else{
			document.forms[0].action = document.forms[0].action + '&orderby=' + obj + ' ' + order;
		}
		
		document.forms[0].submit();
	}
	
	function assignTeam(){
		var NumOfTeam = jQuery('#SelectTeamNo').val();
		if(NumOfTeam == '')
		{
			alert('������ �� ������ �������ּ���.');
			select.focus();
		}
		else
		{
			var i = 1;
			var teamnoarray = jQuery('select[name=teamnoarray]');
			jQuery.each(teamnoarray, function(){
				if(i>NumOfTeam){
					i=1;
				}
				jQuery(this).val(i);
				i++;
			});
		}
	}
	
	function smsList()
	{
		if(document.all.searchCourseName.value == "")
		{
			alert("������ �����ϼ���");
			return;
		}
	
		var form = document.forms[0];
		var url = '${pageContext.request.contextPath}/oprStudent.act?task=excel&do=sms&';
		var pars = Form.serialize(form);
	    
	    document.location.href = url+pars;
	}
	
	function nameTagDownload(){
		
		var form = document.forms[0];
		var url = '/oprStudent.act?task=nameTagList&';
		var pars = Form.serialize(form);
	    
	    document.location.href = url+pars;
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="������ ����" src="/images/operation/title_08.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <!--�˻� ���̺� ����-->
    <html:form action="oprStudent.act?task=list" >
      <!--�˻� ���̺� ����-->
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
            <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="�˻�" onclick="doSearch()" style="cursor:hand"/></td>
          </tr>
          </table>
        </td>
      </tr>
      </table>
      <!--�˻� ���̺� ��-->
	</html:form>
	<table width="750" cellspacing="0" cellpadding="0">
	<tr>
	  <td height="15">&nbsp; </td>
	</tr>
	<tr>
	  <td height="15" align="left">
	  	<c:if test="${stdcount != null}">
	  		�� ${stdcount }��
	  	</c:if>
	  	
	  </td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
	    <tr>
	      <td class="t1" width="39"><a href="#" onclick="orderby('stdno')">����</a></td>
	      <td class="sBg"></td>
	      <td class="t1">�Ҽ�</td>
	      <td class="sBg"></td>
	      <td class="t1" width="109">����</td>
	      <td class="sBg"></td>
	      <td class="t1" width="64"><a href="#" onclick="orderby('stdname')">����</td>
	      <td class="sBg"></td>
	      <td class="t1" width="49">����</td>
	      <td class="sBg"></td>
	      <td class="t1" width="49">��ġ<br>ȸ��</td>
	      <td class="sBg"></td>
	      <td class="t1" width="49">����</td>
	      <td class="sBg"></td>
	      <td class="t1" width="69">������</td>
	      <td class="sBg"></td>
	      <td class="t1" width="49">���ȣ</td>
	      <td class="sBg"></td>
	      <td class="t1" width="54">����<br>���</td>
	      <td class="sBg"></td>
	      <td class="t1" width="60"><a href="#" onclick="orderby('random')">����</a></td>
	      <td width="17"></td>
	    </tr>
	    </table>
	    <!--���̺� ��� ��-->
	    <!--����Ʈ ����-->
        <html:form action="oprStudent.act?task=modify">
          <!--����Ʈ ����-->
          <div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden;">
            <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
            <c:forEach var="studentList" items="${rsOpr_StudentList}" varStatus="i">
			  <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			  <c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			  <tr class="${lineBg}">
				<input type="hidden" name="juminnoarray" value="${studentList.juminno }">
                <input type="hidden" name="seqarray" value="${studentList.seq }">
                <input type="hidden" name="coursecodearray" value="${studentList.courseCode}">
                <input type="hidden" name="iscostarray">
                <input type="hidden" name="isleaderarray">
				<td class="t2" width="39" style="border-bottom:1px solid #D6D6D6">&nbsp;${studentList.stdno}&nbsp;</td>
	            <td class="sBg"></td>
	            <td class="t3" style="border-bottom:1px solid #D6D6D6">&nbsp;${studentList.assignname}</td>
	            <td class="sBg"></td>
	            <td class="t3" width="109" style="border-bottom:1px solid #D6D6D6">&nbsp;${studentList.rankname}</td>
	            <td class="sBg"></td>
	            <td class="t2" width="64" style="border-bottom:1px solid #D6D6D6"><a href="#" onclick="javascript:openHistory('${studentList.courseCode}','${studentList.seq}','${studentList.chieforgan}');"><u>${studentList.stdname }</u></a></td>
	            <td class="sBg"></td>
	            <td class="t2" width="49" style="border-bottom:1px solid #D6D6D6">
	              <c:if test="${studentList.iscost eq 'Y'}">
	                <input type="checkbox" name="iscost" checked>
	              </c:if>
	              <c:if test="${studentList.iscost ne 'Y'}">
	                <input type="checkbox" name="iscost">
	              </c:if>
				</td>
				<td class="sBg"></td>
				<td class="t2" width="49" style="border-bottom:1px solid #D6D6D6">
				  <c:if test="${studentList.isleader eq 'Y'}">
					<input type="checkbox" name="isleader" checked onmousedown="chkLeader(${i.count-1});">
				  </c:if>
				  <c:if test="${studentList.isleader ne 'Y'}">
					<input type="checkbox" name="isleader" onmousedown="chkLeader(${i.count-1});">
				  </c:if>
                </td>
                <td class="sBg"></td>
                <td class="t2" width="49" style="border-bottom:1px solid #D6D6D6">
                	<input type="text" name="scoreaddarray" value="${studentList.scoreadd }" size="4" maxlength="4"/>
                </td>
				<td class="sBg"></td>
				<td class="t2" width="69" style="border-bottom:1px solid #D6D6D6">
				  <html:select property="teamnoarray" value="${studentList.teamno}">
					<html:option value=""></html:option>
					<html:option value="1">1��</html:option>
					<html:option value="2">2��</html:option>
					<html:option value="3">3��</html:option>
					<html:option value="4">4��</html:option>
					<html:option value="5">5��</html:option>
					<html:option value="6">6��</html:option>
					<html:option value="7">7��</html:option>
					<html:option value="8">8��</html:option>
					<html:option value="9">9��</html:option>
					<html:option value="10">10��</html:option>
				  </html:select>
				</td>
				<td class="sBg"></td>
				<td class="t2" width="49" style="border-bottom:1px solid #D6D6D6">
					<html:text property="roomnoarray" value="${studentList.roomno }" size="4"/>
				</td>
				<td class="sBg"></td>
				<td class="t2" width="54" style="border-bottom:1px solid #D6D6D6">
				  <c:if test="${delMod eq 'N'}">
					<img src=<html:rewrite page="/images/board/btn_cancle.gif"/> alt="���" align="absmiddle" />
				  </c:if>
				  <c:if test="${delMod eq 'Y'}">
					<img src=<html:rewrite page="/images/board/btn_cancle3.gif"/> alt="���" align="absmiddle" onclick="oprStuCancle('${studentList.courseCode}','${studentList.seq}','${studentList.chieforgan}');" style="cursor:hand"/>
				  </c:if>
				</td>
				<td class="sBg"></td>
				<td class="t2" width="60" style="border-bottom:1px solid #D6D6D6">
				  <img src='<html:rewrite page="/images/board/up.gif"/>' width="15" height="14" align="absmiddle" alt="����" onclick="sort('up')" style="cursor:hand"/>
				  <img src='<html:rewrite page="/images/board/dawn.gif"/>' width="15" height="14" align="absmiddle" alt="�Ʒ���" onclick="sort('dn')" style="cursor:hand"/>
				</td>
			  </tr>
              <c:if test="${studentList.stdno != null}">
                <c:set var="checkCount" value="${checkCount+1}"/>
              </c:if>
              <c:set var="count" value="${i.count }"/>
            </c:forEach>
            <c:if test="${count==null}">
			  <tr class="tbg3">
				<td class="t2" colspan="99">��ȸ�� �����Ͱ� �����ϴ�.</td>
			  </tr>
			</c:if>
            </table>
          </div>
          <!--����Ʈ ��-->
          <input type="hidden" name="count" value="${count}">
          <input type="hidden" name="courseCode">
          <input type="hidden" name="courseName">
        </html:form>
      </td>
    </tr>
	</table>
    <!--�ϴܹ�ư : ��Ȱ��ȭ�� ������ư��_off �� �ۼ��ص�-->
    <table width="500" border="0" cellspacing="0" cellpadding="0" height="28" style="float:left; margin-top:5px;">
    <c:if test="${checkCount >0 }">
      <tr valign="top">
        <td colspan = 2>
        <c:if test="${chkMod eq 'Y'}">
         	<select id="selectStdNo" style="width:70px;">
				<option value="1">����</option>
				<option value="2">����</option>
				<option value="3">������</option>
		  	</select>
          <img src='<html:rewrite page="/images/board/btn_num.gif"/>' width="72" height="25" alt="��������" align="absmiddle" onclick="javascript:createStdNo(document.forms[1])" style="cursor:hand"/>
        </c:if>
        <c:if test="${chkMod eq 'N'}">
        	 <select id="selectStdNo" style="width:70px;">
				<option value="1">����</option>
				<option value="2">����</option>
				<option value="3">������</option>
		  	</select>
          <%-- <img src='<html:rewrite page="/images/board/btn_num_off.gif"/>' width="72" height="25" alt="��������" align="absmiddle"/>  --%>
          <img src='<html:rewrite page="/images/board/btn_num.gif"/>' width="72" height="25" alt="��������" align="absmiddle" onclick="javascript:createStdNo(document.forms[1])" style="cursor:hand"/>
        </c:if>
        </td>
		<td>
        <img src='<html:rewrite page="/images/board/btn_listdawn.gif"/>' width="94" height="25" align="absmiddle" alt="��ܴٿ�ε�" style="cursor:hand" onclick="excelDown();"/>
        </td>
		<td>
        <img src='<html:rewrite page="/images/board/btn_name_print2.gif"/>' width="72" height="25" align="absmiddle" alt="�����μ�" style="cursor:hand" onclick="ozReport('1');" />
        </td>
		<td>
        <img src='<html:rewrite page="/images/board/btn_name_print3.gif"/>' width="86" height="25" align="absmiddle" alt="�������μ�" style="cursor:hand" onclick="ozReport('2');"/>
		</td>
		<td colspan="4">
        <img src='<html:rewrite page="/images/board/btn_name_print4.gif"/>' width="86" height="25" align="absmiddle" alt="�⼮���μ�" style="cursor:hand"  onclick="ozReport('3');"/>
        
<%--         <img src='<html:rewrite page="/images/board/btn_name_print5.gif"/>' width="86" height="25" align="absmiddle" alt="�������μ�" style="cursor:hand"  onclick="ozReport('4');" /> --%>
        </td>
        <td>
        
        </td>
      </tr>
      <tr>
      	<td>
        <img src="/images/btn_sms_list.gif" onclick="smsList()" width="98" height="25" align="absmiddle" alt="SMS �߼۸��" style="cursor:hand"/>
        </td>
		<td>
        <img src="/images/operation/btn_down.gif" onclick="nameTagDownload();" width="122" height="25" align="absmiddle" alt="�������" style="cursor:hand"/>
       </td>
	   <td colspan="6">
        <select id="SelectTeamNo" style="width:70px;">
			<option value="">�� ����</option>
			<option value="">-----------</option>
			<option value="1">1��</option>
			<option value="2">2��</option>
			<option value="3">3��</option>
			<option value="4">4��</option>
			<option value="5">5��</option>
			<option value="6">6��</option>
			<option value="7">7��</option>
			<option value="8">8��</option>
			<option value="9">9��</option>
			<option value="10">10��</option>
	  	</select>
        <img src="/images/btn_team.gif" onclick="assignTeam()" width="85" height="25" align="absmiddle" alt="������ ����" style="cursor:hand"/>
      	</td>
		<td></td>
      </tr>
    </c:if>
    <c:if test="${checkCount == null }">
      <tr valign="bottom">
        <td>
        <c:if test="${chkMod eq 'Y'}">
          	<select id="selectStdNo" style="width:70px;">
				<option value="1">����</option>
				<option value="2">����</option>
				<option value="3">������</option>
		  	</select>
          <img src='<html:rewrite page="/images/board/btn_num.gif"/>' width="72" height="25" alt="��������" align="absmiddle" onclick="javascript:createStdNo(document.forms[1])" style="cursor:hand"/>
        </c:if>
        <c:if test="${chkMod eq 'N'}">
           	<select id="selectStdNo" style="width:70px;">
				<option value="1">����</option>
				<option value="2">����</option>
				<option value="3">������</option>
		  	</select>
          <%-- <img src='<html:rewrite page="/images/board/btn_num_off.gif"/>' width="72" height="25" alt="��������" align="absmiddle"/> --%>
          <img src='<html:rewrite page="/images/board/btn_num.gif"/>' width="72" height="25" alt="��������" align="absmiddle" onclick="javascript:createStdNo(document.forms[1])" style="cursor:hand"/>
        </c:if>
        <img src='<html:rewrite page="/images/board/btn_listdawn_off.gif"/>' width="94" height="25" align="absmiddle" alt="��ܴٿ�ε�" />
        <img src='<html:rewrite page="/images/board/btn_name_print2_off.gif"/>' width="72" height="25" align="absmiddle" alt="�����μ�" />
        <img src='<html:rewrite page="/images/board/btn_name_print3_off.gif"/>' width="86" height="25" align="absmiddle" alt="�������μ�" />
        <img src='<html:rewrite page="/images/board/btn_name_print4_off.gif"/>' width="86" height="25" align="absmiddle" alt="�⼮���μ�" />
        <!--<img src='<html:rewrite page="/images/board/btn_name_print5_off.gif"/>' width="86" height="25" align="absmiddle" alt="�������μ�"  /> -->
        </td>
      </tr>
    </c:if>
    </table>
	<c:if test="${checkCount gt 0}">
	<div style="width:760; float:right; margin-right:40px; margin-top:5px;">
	<img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" align="absmiddle" alt="����" onclick="doSubmit(document.forms[1]);" style="cursor:hand;"/>
	</div>
	</c:if>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(210);

//-->
</script>
