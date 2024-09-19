<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script type="text/javascript" src='<html:rewrite page="/common/js/prototype.js"/>'></script>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script language="JavaScript">
<!--

	window.onresize = function(){
	//   ������ ������ ���� ���� �ڵ�
	tresize(200);
	}
	
	function selectYear()
	{
		var month = document.all.thisMonth.value;
		
		selectPlan(month);
	}

	function selectPlan(month)
	{
		var url = "crsMonth.act?task=list";
		var year = document.forms[0].year.value;
      	var pars = "month="+month+"&year="+year;

		MM_swapImgRestore();
      	MM_swapImage('Image'+month,'','${pageContext.request.contextPath}/images/edu/'+month+'_over.gif',1);

		var myAjax = new Ajax.Request(
						url,
                           {
                               method: 'post',
                               parameters: pars,
                               onComplete: success
                              });
                              
		document.all.thisMonth.value = month;
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
	<h2 class="hide">����������</h2>
	<h1><img alt="������������" src="/images/edu/title_07.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <!--�˻� ���̺� ����-->
    <html:form action="crsMonth.act?task=list">
	  <html:hidden property="thisMonth" value="${thisMonth}"/>
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr>
        <td bgcolor="#FFFFFF">
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="129" class="s1">����</td>
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
    <!--�˻� ���̺� ��-->
  </td>
</tr>
<tr>
  <td height="8"></td>
</tr>
<tr>
  <td>
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="62" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('01');" ><img name="Image01" border="0" src='<html:rewrite page="/images/edu/01.gif"/>' width="60" height="24" alt="1��" /></a></td>
      <td width="62" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('02');" ><img name="Image02" border="0" src='<html:rewrite page="/images/edu/02.gif"/>' width="60" height="24" alt="2��" /></a></td>
      <td width="62" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('03');" ><img name="Image03" border="0" src='<html:rewrite page="/images/edu/03.gif"/>' width="60" height="24" alt="3��" /></a></td>
      <td width="63" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('04');" ><img name="Image04" border="0" src='<html:rewrite page="/images/edu/04.gif"/>' width="60" height="24" alt="4��" /></a></td>
      <td width="63" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('05');" ><img name="Image05" border="0" src='<html:rewrite page="/images/edu/05.gif"/>' width="60" height="24" alt="5��" /></a></td>
      <td width="63" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('06');" ><img name="Image06" border="0" src='<html:rewrite page="/images/edu/06.gif"/>' width="60" height="24" alt="6��" /></a></td>
      <td width="63" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('07');" ><img name="Image07" border="0" src='<html:rewrite page="/images/edu/07.gif"/>' width="60" height="24" alt="7��" /></a></td>
      <td width="63" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('08');" ><img name="Image08" border="0" src='<html:rewrite page="/images/edu/08.gif"/>' width="60" height="24" alt="8��" /></a></td>
      <td width="63" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('09');" ><img name="Image09" border="0" src='<html:rewrite page="/images/edu/09.gif"/>' width="60" height="24" alt="9��" /></a></td>
      <td width="63" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('10');" ><img name="Image10" border="0" src='<html:rewrite page="/images/edu/10.gif"/>' width="60" height="24" alt="10��" /></a></td>
      <td width="63" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('11');" ><img name="Image11" border="0" src='<html:rewrite page="/images/edu/11.gif"/>' width="60" height="24" alt="11��" /></a></td>
      <td width="60" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="selectPlan('12');" ><img name="Image12" border="0" src='<html:rewrite page="/images/edu/12.gif"/>' width="60" height="24" alt="12��" /></a></td>
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
    <!--���̺� ��� ����-->
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="lbg"></td>
      <td class="cbg">
        <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
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
            <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
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
	tresize(200);
	selectPlan('${thisMonth}');
//-->
</script>
