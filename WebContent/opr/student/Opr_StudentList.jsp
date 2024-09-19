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


	function setCrs()
	{
		var searchCode = document.all.searchCourseCode.value;
		// type ���� �Ѱ��ش�. (onlyCrs) 
		window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
	
	//���� �ٿ�ε�
	function excelDown()
	{
		if(document.all.searchCourseName.value == "")
		{
			alert("������ �����ϼ���");
			return;
		}
	
		var form = document.forms[0];
		var url = '${pageContext.request.contextPath}/oprStudent.act?task=excel&do=justlist&';
    var pars = Form.serialize(form);
    
    document.location.href = url+pars;
	}
	function openHistory(courseCode, seq, chieforgan)
	{
		document.location.href = "oprStudent.act?task=modifyInfo&courseCode="+courseCode+"&seq="+seq+"&chieforgan="+chieforgan;
	}
	
	function orderby(){
		var order;
		if('${orderby}'.split(" ")[1] == 'asc'){
			order = 'desc';
		}
		else{
			order = 'asc';
		}
		document.forms[0].action += ('&orderby=organname ' + order +', stdname asc');
		document.forms[0].submit();
	}
//-->
</script>	
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="������ ���" src="/images/operation/title_23.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    
    <html:form action="oprStudent.act?task=justList" >
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
	      <td class="t1" width="44">����</td>
	      <td class="sBg"></td>
	      <td class="t1"><a href="#" onclick="orderby()">�Ҽ�</a></td>
	      <td class="sBg"></td>
	      <td class="t1" width="150">����</td>
	      <td class="sBg"></td>
	      <td class="t1" width="59">����</td>
	      <td class="sBg"></td>
	      <td class="t1" width="44">����</td>
	      <td class="sBg"></td>
	      <td class="t1" width="44">����</td>
	      <td class="sBg"></td>
	      <td class="t1" width="89">�޴���ȭ</td>
	      <td class="sBg"></td>
	      <td class="t1" width="149">�̸���</td>
	      <td width="17"></td>
	    </tr>
	    </table>
	    <!--���̺� ��� ��-->
        <!--����Ʈ ����-->
        <div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden;"> 
          <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
          <c:forEach var="studentList" items="${rsOpr_StudentList}" varStatus="i">
			<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2" width="44">&nbsp;${studentList.stdno}&nbsp;</td>
	          <td class="sBg"></td> 
	          <td class="t3">&nbsp;${studentList.organname }</td>
	          <td class="sBg"></td>
	          <td class="t3" width="150">&nbsp;${studentList.rankname}</td>
	          <td class="sBg"></td>
	          <td class="t2" width="59"><a href="#" onclick="javascript:openHistory('${studentList.courseCode}','${studentList.seq}','${studentList.chieforgan}');"><u>${studentList.stdname}</u></a></td>
	          <td class="sBg"></td>
	          <td class="t2" width="44">${studentList.sex }</td>
	          <td class="sBg"></td>
	          <td class="t2" width="44">${studentList.age }</td>
	          <td class="sBg"></td>
	          <td class="t2" width="89">${studentList.cellphone }</td>
			  <td class="sBg"></td>
			  <td class="t2" width="149">${studentList.email }</td>
			</tr>   
			<tr>
			  <td colspan="31" class="lbg3"></td>
			</tr>
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
      </td>
    </tr>
	</table> 
    <!--�ϴܹ�ư-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
    <tr valign="bottom"> 
      <td align="right">               	
        <img src='<html:rewrite page="/images/board/btn_listdawn.gif"/>' width="94" height="25" align="absmiddle" alt="��ܴٿ�ε�" style="cursor:hand" onclick="excelDown();"/> 
      </td>
    </tr>           
    </table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(182);
//-->
</script>
