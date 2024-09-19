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
		//   ������ ������ ���� ���� �ڵ�
		tresize(120);
	}
	function selectMemu(num)
	{
		selectCrs(num);
	}
	// ����(����/���̹�) ���ý�
	function selectCrs(type)
	{
		var link = null;
		if(type == "01")
			link = "jiphap";
		else if(type == "02")
			link = "cyber";
			
		var url = "svcStdPortal.act?task=" + link;
		var pars = "type="+type;	
	
		MM_swapImgRestore();
      	MM_swapImage('Image'+type,'','${pageContext.request.contextPath}/images/course/ing_'+type+'_over.gif',1);
      	
		var myAjax = new Ajax.Request(
						url,
                           {
                               method: 'post',
                               parameters: pars,
                               onComplete: successCrs
                              });
	}
	
	function successCrs(request)
	{
		$('mainList').innerHTML = request.responseText;
		tresize(120);
	}

	//�ð�ǥ ���
	function timeAdd(code, from, to, date)
	{
		var eduFrom = from.replace("-", "").replace("-", "");
		var eduTo 	= to.replace("-", "").replace("-", "");
		var today 	= date.replace("-", "").replace("-", "");
		var flag 		= false;
		var pmDate 	= null;
		// ������¥�� ���ó�¥�� ��
		for(var i=eduFrom; i<=eduTo; i++)
		{
			if(i==today)
			{
				flag = true;
			}
		}
		if(flag == true)
			pmDate = date;
		else
			pmDate = from;
			
		document.forms[0].searchCourseCode.value = code;
		document.forms[0].searchdate.value = pmDate;
		document.forms[0].action = 'crsTimeTblDay.act?task=search_time';
		document.forms[0].submit();
	}

	//���� �Ⱝ
	function lectureMgmt(code, from, to, date)
	{
		var eduFrom = from.replace("-", "").replace("-", "");
		var eduTo 	= to.replace("-", "").replace("-", "");
		var today 	= date.replace("-", "").replace("-", "");
		var flag 		= false;
		var pmDate 	= null;
		// ������¥�� ���ó�¥�� ��
		for(var i=eduFrom; i<=eduTo; i++)
		{
			if(i==today)
			{
				flag = true;
			}
		}
		if(flag == true)
			pmDate = date;
		else
			pmDate = from;
			
		document.forms[0].searchCourseCode.value = code;
		document.forms[0].searchdate.value = pmDate;
		document.forms[0].action = 'crsLectureMgmt.act?task=list';
		document.forms[0].submit();
	}

	//���� ����
	function profPay(code)
	{
		document.forms[0].searchCourseCode.value = code;
		document.forms[0].action = 'prfPay.act?task=list';
		document.forms[0].submit();
	}

	//������ ��� / �⼮��
	function studentMgmt(code)
	{
		document.forms[0].searchCourseCode.value = code;
		document.forms[0].action = 'oprStudent.act?task=list';
		document.forms[0].submit();
	}

	//���°���
	function attend(code, from, to, date)
	{
		var eduFrom = from.replace("-", "").replace("-", "");
		var eduTo 	= to.replace("-", "").replace("-", "");
		var today 	= date.replace("-", "").replace("-", "");
		var flag 		= false;
		var pmDate 	= null;
		// ������¥�� ���ó�¥�� ��
		for(var i=eduFrom; i<=eduTo; i++)
		{
			if(i==today)
			{
				flag = true;
			}
		}
		if(flag == true)
			pmDate = date;
		else
			pmDate = from;
			
		document.forms[0].searchCourseCode.value = code;
		document.forms[0].searchdate.value = pmDate;
		document.forms[0].action = 'oprAttend.act?task=list';
		document.forms[0].submit();
	}
	
	// ���� �󼼺��� �˾�â
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
	<h2 class="hide">����������</h2>
	<h1><img alt="����� �ʱ�޴�" src="/images/resources/title_menu2.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<html:form action="svcStdPortal.act?task=list" method="POST">
	  <html:hidden property="searchCourseCode"/>
	  <html:hidden property="courseCode"/>
	  <html:hidden property="searchdate"/>
	  <html:hidden property="eduFrom"/>
	  <html:hidden property="type"/>
	  <html:hidden property="return_url" value="svcStdPortal.act?task=list"/>
	  <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	  <tr>
		<td height="15">
		  <table width="750" cellspacing="0" cellpadding="0" align="center">
		  <tr>
			<td width="146" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectCrs('01');" ><img name="Image01" border="0" src='<html:rewrite page="/images/course/ing_01.gif"/>' alt="�������� ����" /></a></td>
			<td width="146" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectCrs('02');" ><img name="Image02" border="0" src='<html:rewrite page="/images/course/ing_02.gif"/>' alt="�������� ����(���̹�)" /></a></td>
			<td background='<html:rewrite page="/images/edu/month_bg.gif"/>'>&nbsp;</td>
		  </tr>
		  </table>
		</td>
	  </tr>
	  <!--����Ʈ ����--> 
	  <tr> 
		<td valign="top">
		  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
		  <tr>
			<td>
			  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			  </div>
			</td>
		  </tr>
		  </table>
		</td>
	  </tr>
	  </table>
      <!--����Ʈ ��-->
	</html:form>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	selectMemu('01');
	tresize(120);
//-->
</script>