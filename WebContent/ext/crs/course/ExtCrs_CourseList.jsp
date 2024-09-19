<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   ������ ������ ���� ���� �ڵ�
	tresize(235);
	}
	// ������ ó�� ������� �⺻������ ��ȸ
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
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
	function showCourse(courseCode,crsType1)
	{
			LeftPosition=screen.width/2-(667/2);
			TopPosition=screen.height/2-(470/2);
			window.open('${pageContext.request.contextPath}/cmnCourseInfo.act?task=info&coursecode='+courseCode+'&crstype1='+crsType1,'pop1',
		  	'height=470,width=667,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=yes,top='+TopPosition+',left='+LeftPosition);
	}
-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="������ȸ" src="/images/operation/title_01.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action='extCrsCourse.act?task=list'>
 	  <!--�˻� ���̺� ����-->
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr>
        <td bgcolor="#FFFFFF">
		  <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="74" class="s1">�����</td>
            <td class="sBar"></td>
            <td class="s2" width="119">
			  <html:select property="selEduCharger">
			    <html:optionsCollection name="crsUser" property="beanCollection" />
			  </html:select>
			</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td width="119" class="s1">����</td>
            <td class="sBar"></td>
            <td class="s2"><html:text property="coursename" style="width:150px;"/></td>
            <td width="60" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td class="lbg3" colspan="8"></td>
          </tr>
          <tr>
            <td width="74" class="s1">�����Ⱓ</td>
            <td class="sBar"></td>                           
            <td class="s2" colspan="5"> 
	          <html:text property="searchFromDate" style="width:100px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchFromDate, 'yyyy-mm-dd');">
              ~<html:text property="searchToDate" style="width:100px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchToDate, 'yyyy-mm-dd');">
            </td>
            <td width="60" align="center"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle" width="55" height="25" alt="�˻�" /></td>
          </tr>
          </table>
        </td>
      </tr>
      </table>
      <!--�˻� ���̺� ��-->
	</html:form>
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
        <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
        <tr>
          <td class="t1" width="40"><a href="#" onclick="checkAll();"><u>����</u></a></td>
          <td class="sBg"></td>
          <td class="t1" width="50">����</td>
          <td class="sBg"></td>
          <td class="t1">������</td>
          <td class="sBg"></td>                            
          <td class="t1" width="80">�����Ⱓ</td>
          <td class="sBg"></td>
          <td class="t1" width="90">���</td>
          <td class="sBg"></td>
          <td class="t1" width="50">�ϼ�</td>
          <td class="sBg"></td>
          <td class="t1" width="50">����</td>
          <td class="sBg"></td>
          <td class="t1" width="50">����</td>
          <td class="sBg"></td>
		  <td class="t1" width="60">���ǽ�</td>
          <td class="sBg"></td>                            
          <td class="t1" width="60">�����</td>            
          <td class="t1" width="17"></td>
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
	  <td class="lbg"></td>
      <td>
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td  valign="top">
			<!--����Ʈ ����-->
			<div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden;">
			  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			  <c:forEach var="courseList" items="${rsExtCrs_CourseList}" varStatus="i" >
				<c:if test="${i.count%2 == 0}">
				<tr class="tbg3">
                  <td class="t2" width="40"><input type="checkbox" name="checkbox" value="${courseList.coursecode}"></td>
                  <td class="sBg"></td>
                  <td class="t2" width="50"><c:out value="${courseList.baseyymm}"/></td>
                  <td class="sBg"></td>
                  <td class="t3">&nbsp;<a href="javascript:showCourse('${courseList.coursecode}', '${courseList.crstype1}')"><u><c:out value="${courseList.coursename}"/></u></a></td>
				  <td class="sBg"></td>                                    
                  <td class="t2" width="80"><c:out value="${courseList.edufrom}"/>~<c:out value="${courseList.eduto}"/></td>                                  
                  <td class="sBg"></td>
                  <td class="t2" width="90"><c:out value="${courseList.edutarget}"/></td> 
                  <td class="sBg"></td>
                  <td class="t2" width="50"><fmt:formatNumber value="${courseList.daycount}" pattern="#,##0"/></td>
                  <td class="sBg"></td>
                  <td class="t2" width="50"><fmt:formatNumber value="${courseList.educount}" pattern="#,##0"/></td>
                  <td class="sBg"></td>
                  <td class="t2" width="50"><fmt:formatNumber value="${courseList.selcnt}" pattern="#,##0"/></td>
                  <td class="sBg"></td>
                  <td class="t2" width="60"><c:out value="${courseList.lecroomno}"/></td>
                  <td class="sBg"></td>
                  <td class="t2" width="60"><c:out value="${courseList.chargername}"/></td>
                </tr>
                <tr>
                  <td class="lbg3" colspan="20"></td>
                </tr>
			    </c:if>
				<c:if test="${i.count%2 == 1}">
				<tr>
                  <td class="t2" width="40"><input type="checkbox" name="checkbox" value="${courseList.coursecode}"></td>
                  <td class="sBg"></td>
                  <td class="t2" width="50"><c:out value="${courseList.baseyymm}"/></td>
                  <td class="sBg"></td>
                  <td class="t3">&nbsp;<a href="javascript:showCourse('${courseList.coursecode}', '${courseList.crstype1}')"><u><c:out value="${courseList.coursename}"/></u></a></td>
                  <td class="sBg"></td>                                    
                  <td class="t2" width="80"><c:out value="${courseList.edufrom}"/>~<c:out value="${courseList.eduto}"/></td>                                  
                  <td class="sBg"></td>
                  <td class="t2" width="90"><c:out value="${courseList.edutarget}"/></td> 
                  <td class="sBg"></td>
                  <td class="t2" width="50"><fmt:formatNumber value="${courseList.daycount}" pattern="#,##0"/></td>
                  <td class="sBg"></td>
                  <td class="t2" width="50"><fmt:formatNumber value="${courseList.educount}" pattern="#,##0"/></td>
                  <td class="sBg"></td>
                  <td class="t2" width="50"><fmt:formatNumber value="${courseList.selcnt}" pattern="#,##0"/></td>
                  <td class="sBg"></td>
                  <td class="t2" width="60"><c:out value="${courseList.lecroomno}"/></td>
                  <td class="sBg"></td>
                  <td class="t2" width="60"><c:out value="${courseList.chargername}"/></td>
			    </tr>
			    <tr>
                  <td class="lbg3" colspan="20"></td>
                </tr>
       		    </c:if>
       		    <c:set value="${i.count}" var="count"/>  
       		    <c:set var="total_educount" value="${total_educount + courseList.educount}"/>
       		    <c:set var="total_selcnt" value="${total_selcnt + courseList.selcnt}"/>
			  </c:forEach>
			  <input type="hidden" id="max" name="max" value="${count}"/>
			  <c:if test="${count==null}">
			  <tr class="tbg3">
				<td class="t2" colspan="99">��ȸ�� �����Ͱ� �����ϴ�.</td>
			  </tr>
			  </c:if>											
			  </table>
			</div>
			<c:if test="${count>0}">
			  <table width="746" border="0" cellspacing="0" cellpadding="0">
		      <tr>
                <td class="t2BgRed" width="91">��</td>
                <td class="sBg"></td>                               
                <td class="t2BgRed">${crsCnt}�� ���� ${count}ȸ</td>
                <td class="sBg"></td>
                <td class="t2BgRed" width="80">&nbsp;</td>
                <td class="sBg"></td>
                <td class="t2BgRed" width="90">&nbsp;</td>
                <td class="sBg"></td>
                <td class="t2BgRed" width="50">&nbsp;</td>
                <td class="sBg"></td>
                <td class="t2BgRed" width="50"><fmt:formatNumber value="${total_educount}" pattern="#,##0"/></td>
                <td class="sBg"></td>
                <td class="t2BgRed" width="50"><fmt:formatNumber value="${total_selcnt}" pattern="#,##0"/></td>
                <td class="sBg"></td>
                <td class="t2BgRed" width="60">&nbsp;</td>
                <td class="sBg"></td>
                <td class="t2BgRed" width="77">&nbsp;</td>                                
              </tr>
              <tr>
                <td class="lbg3" colspan="15"></td>
              </tr>
              </table>
            </c:if>
    		<!--�Խù� ��� ��-->
            <!--����Ʈ ��-->
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
    <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
    <tr valign="bottom">
      <td align="left"><img src='<html:rewrite page="/images/board/btn_schedule_print2.gif"/>' alt="�����ȳ��μ�" align="absmiddle" style="CURSOR: hand" onClick = "ozReport();"/></td>
      <td align="right"><img src='<html:rewrite page="/images/board/btn_print.gif"/>' alt="��å��" align="absmiddle" style="CURSOR: hand" onclick="ozReport2()"/></td>
    </tr>
    </table>
  </td>
</tr>
</table>
<form name="toFrm">
<input type="hidden" name="report">
<input type="hidden" name="check_array" size="50">
</form>
<script type="text/javascript">
<!--
	tresize(235);
	searchList('${key}');
	document.forms[0].coursename.focus();

	function ozReport()
	{
	    var ch="";
	  	var check_count = 0;
	  	
	  	if(document.all.max.value == "")
	  	{
	  		alert("��ȸ�� �����Ͱ� �����ϴ�.");	
	  		return;
	  	}
	  	else if(document.all.max.value == "1")
	  	{
	  		if(document.all.checkbox.checked == true)
	  		{
	  			ch = document.all.checkbox.value+ ",";
	  			check_count++;
	  		}
	  	}  	
	  	else
	  	{
		   	for(var i=0; i < document.all.checkbox.length; i++)
		   	{    
					if(document.all.checkbox[i].checked == true)
		    	{
		    		ch = ch + document.all.checkbox[i].value+ ",";
						check_count++;
		    	}	    
		    }
			}
		    
	  	if(check_count == 0)
	  	{
	    	alert("�μ��� ������ ���õǾ� ���� �ʽ��ϴ�.\n�μ��� ������ �����Ͽ� �ֽñ� �ٶ��ϴ�.");
	    	return false;
	   	}  
	    document.all.check_array.value = ch.substring(0, ch.length-1);   // ������ ','�� �����ش�.
	  	document.forms[1].report.value = "edu";
	  
			var str 
		 	var winl = (screen.width - 700) / 2;
		 	var wint = (screen.height - 750) / 2;
		 	str = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,width=650,height=490,top="+wint+",left="+winl;  	
			window.open('','popup', str);
			document.forms[1].action = "ozMenu.act"
			document.forms[1].target = "popup";			
			document.forms[1].submit();		
			document.forms[1].target = "";
	}
	
	function ozReport2(){
		var coursecode = "";
		for(var i=0; i < document.all.checkbox.length; i++)
	   	{    
			if(document.all.checkbox[i].checked == true){
	    		coursecode= document.all.checkbox[i].value;					
	    	}	    
	    }
		if(coursecode != ""){
			var url = '<html:rewrite page="/ozMenu.act"/>?report=crs_guide&coursecode=' + coursecode; 
		
			window.open(url , 'crs_guide', 'scrollbars=no, resizable=yes, menubar=no, width=710, height=550, status=yes');
		} else {
			alert("������ �������ּ���.");
		}
	}
//-->
</script>
