<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=8">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script language="JavaScript">
<!--
	function viewSurvey(surveyno)
	{
		var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
		window.open('<html:rewrite page="/tstSatis.act?task=preview&popflag=pop&surveyno='+surveyno+'"/>', 'popup', 'scrollbars=yes, menubar=no, width=667, height=600, status=yes top='+wint+', left='+winl);
	}
	function resultSurvey(surveyno, coursecode)
	{
		if(surveyno == "")
		{
			alert("�ش缳���� �������� �ʽ��ϴ�.")
			return;
		}
		document.location.href ='<html:rewrite page="/tstSatis.act?task=result&surveyno='+surveyno+'&coursecode='+coursecode+'"/>';
	}
	
	function ExcelDownload(surveyno, coursecode)
    {
    	size_w = 500;
  		size_h = 500;
    	var url='/tstSatis.act?task=excel&surveyno=' + surveyno + '&coursecode=' + coursecode;
    	openWinSetPo(url, '_blank', '', size_w, size_h);
    }
	
	function ozReport(){
		var date_yyyymm = replace(document.all.yyyymm.value, "-", "");
		var date_yyyy   = date_yyyymm.substring(0, 4);
		var date_mm;
		if(date_yyyymm.substring(4,5) == 0){
			date_mm     = date_yyyymm.substring(5, 6);
		} else {
			date_mm     = date_yyyymm.substring(4, 6);
		}
		
		if(date_yyyymm == ""){
			alert("��¥�� �������ּ���.");
			return;
		}
		
		var url = '<html:rewrite page="/ozMenu.act"/>?report=satis_result&date_yyyymm=' + date_yyyymm + '&date_yyyy=' + date_yyyy + '&date_mm=' + date_mm; 
			
		window.open(url , 'satis_result', 'scrollbars=no, resizable=yes, menubar=no, width=710, height=550, status=yes');
		
	}
	
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="���������� ��Ȳ" src="/images/poll/title_05.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--�˻� -->
	<html:form method="post" action="tstSatis.act?task=oprList">
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
			  <html:hidden property="isCyber" value="N"/>
			</td>
            <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="�˻�" onclick="doSearch()" style="cursor:hand"/></td>
          </tr>
          </table>
        </td>
      </tr>
      </table>
	</html:form>
	<!--�˻� ��-->
	<table>
	<tr> 
	  <td height="15"></td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr> 
		  <td class="t1" width="29">��<br>ȣ</td>
		  <td class="sBg"></td>
		  <td class="t1">������</td>
		  <td class="sBg"></td>
		  <td class="t1" width="79">�����Ⱓ</td>
		  <td class="sBg"></td>
		  <td class="t1" width="184">������</td>
		  <td class="sBg"></td>
		  <td class="t1" width="39">���</td>
		  <td class="sBg"></td>
		  <td class="t1" width="39">����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">���</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="1">
		  <c:forEach var="list" items="${rsTst_SatisOprList}" varStatus="i" >
			<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2" width="29">${i.count}</td>
			  <td class="sBg"></td>
			  <td class="t3">&nbsp;${list.courseName}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="79">${list.eduDate}</td>
			  <td class="sBg"></td>
			  <td class="t3" width="184">
				<c:if test="${list.title == '�����̿���'}"><span class="lend1">&nbsp;${list.title}</span></c:if>
				<c:if test="${list.title != '�����̿���'}">&nbsp;<a href="#" onclick="viewSurvey('${list.surveyno}')"><u>${list.title}</u></a></c:if>
			  </td>
			  <td class="sBg"></td>
			  <td class="t2" width="39">${list.rsptcnt}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="39">${list.replycnt}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">
			    <c:if test="${list.replycnt eq null or list.replycnt eq '0'}">
			    	<span class="lend1">������</span>
			    </c:if>
				<c:if test="${list.replycnt ne null and list.replycnt ne '0'}">
					<img src='<html:rewrite page="/images/poll/btn_view1.gif"/>' align="absmiddle" alt="����" onclick="resultSurvey('${list.surveyno}','${list.coursecode}')" style="cursor:hand"/>
					<br>
					<img src='<html:rewrite page="/images/poll/btn_excel.gif"/>' align="absmiddle" alt="���� �ٿ�ε�" onclick="ExcelDownload(${list.surveyno }, ${list.coursecode });" style="cursor:hand"/>
				</c:if>
			  </td>
			</tr>
			<tr>
			  <td colspan="31" class="lbg3"></td>
			</tr>
			<c:set var="count" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${count==null}">
			<tr class="tbg3">
			  <td class="t2">��ȸ�� �����Ͱ� �����ϴ�.</td>
			</tr>
		  </c:if>
		  </table>	
		</div>
		<!--����Ʈ ��-->
	  </td>
	</tr>
	</table>
  </td>
</tr>
</table>
<br>
<tr>
	<td class="s2" width="185" align="right">
		<input type="text" id="yyyymm" name ="yyyymm" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true" />
		<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor: hand" onclick="Calendar_M(document.all.yyyymm);" />
		<img src='<html:rewrite page="/images/board/btn_print.gif"/>' alt="�μ�" align="middle" style="cursor: hand" onclick="ozReport();" />
	</td>
</tr>
<script type="text/javascript">
<!--
	tresize(182);
//-->
</script>