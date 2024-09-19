<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
	function modifySurv(row, value)
	{
		var max = document.all.max.value;
		
		try{
		document.all.can.click();
		} catch (Exception) {
		}
		var html = "<input type=text name=orgNumber value="+value+" size=7 style='IME-MODE:disabled' onkeydown='key_num()' >"
		var html1 = "<img onclick='modifySave("+row+");' src=<html:rewrite page='/images/board/btn_save2.gif'/>  width=34 height=18 align=absmiddle alt=����  style='cursor:hand'/>&nbsp;";
		html1 += "<img name='can' onclick='modifyCancel("+row+","+value+");' src=<html:rewrite page='/images/board/btn_cancle.gif'/>  width=34 height=18 align=absmiddle alt=��� style='cursor:hand'/>";
		
		// ��ȸ�� ���� �ϳ��� ���
		if(max == 1)
		{
			document.all.orgNum.innerHTML = html;
			document.all.modify.innerHTML = html1;
		}
		// ��ȸ�� ���� �������� ���
		else
		{
			document.all.orgNum[row-1].innerHTML = html;
			document.all.modify[row-1].innerHTML = html1;
		}
	}

	function modifySave(row)
	{
		var max = document.all.max.value;

		// ��ȸ�� ���� �ϳ��� ���
		if(max == 1)
		{
			var value = document.all.orgNumber.value;
			var html = "<img onclick='modifySurv("+row+","+value+");' src=<html:rewrite page='/images/board/btn_modify.gif'/>  width=34 height=18 align=absmiddle alt=���� />";
			document.all.orgNum.innerHTML = value;
			document.all.modify.innerHTML = html;
			var crsClumpCode = document.all.crsClumpCd.value;
		}
		// ��ȸ�� ���� �������� ���
		else
		{
			var value = document.all.orgNumber.value;
			var html = "<img onclick='modifySurv("+row+","+value+");' src=<html:rewrite page='/images/board/btn_modify.gif'/>  width=34 height=18 align=absmiddle alt=���� />";
			document.all.orgNum[row-1].innerHTML = value;
			document.all.modify[row-1].innerHTML = html;
			var crsClumpCode = document.all.crsClumpCd[row-1].value;
		}
		
		var stdNumber = value;
		document.all.crsClumpCode.value = crsClumpCode;
		document.all.stdNumber.value = stdNumber;
		
		var frm = document.forms[0];
		var url = "crsSurv.act?task=insert";
		var pars = Form.serialize(frm);
			
		var myAjax = new Ajax.Request(
						url,
                      {
                          method: 'post',
                          parameters: pars
                         });
	}

	function modifyCancel(row, value)
	{
		var max = document.all.max.value;
		
		var html = "<img onclick='modifySurv("+row+","+value+");' src=<html:rewrite page='/images/board/btn_modify.gif'/>  width=34 height=18 align=absmiddle alt=����/>";

		// ��ȸ�� ���� �ϳ��� ���
		if(max == 1)
		{
			document.all.orgNum.innerHTML = value;
			document.all.modify.innerHTML = html;
		}
		// ��ȸ�� ���� �������� ���
		else
		{
			document.all.orgNum[row-1].innerHTML = value;
			document.all.modify[row-1].innerHTML = html;
		}
	}

	function formSubmit()
	{
		var frm = document.forms[1];

		var url = frm.action;
      	var pars = Form.serialize(frm);

		new Ajax.Updater(
						 '',
                           url,
                            {
                              method: 'post',
                              parameters: pars,
                              evalScripts: true,
                              onFailure: reportError,
                              onComplete: saveComp
                            });

		//frm.submit();
	}

	function saveComp(request)
	{
		alert('������ �Ϸ�Ǿ����ϴ�.');
		document.forms[0].submit();
	}

	reportError = function(request)
	{
		alert('���� �� ������ �߻��Ͽ����ϴ�. \\n�����ڿ��� �����ϼ���.');
	}

	function selectCrsType()
	{
		window.open('${pageContext.request.contextPath}/crsSurv.act?task=search','search',
		  	'height=645,width=480,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=no,top=300,left=700');
	}

	function copySurvey()
	{
		var year = document.forms[0].selPlanYear.value;
		if(confirm(year+'�⵵ �ڷ�� ��� �����˴ϴ�. ����Ͻðڽ��ϱ�?'))
		{
				var url = '${pageContext.request.contextPath}/crsSurv.act';
      			var pars = 'task=copy&year='+year;

				new Ajax.Updater(
						 '',
                           url,
                            {
                              method: 'post',
                              parameters: pars,
                              evalScripts: true,
                              onFailure: reportError,
                              onComplete: saveComp
                        });
		}
	}

	function excelDown()
	{
		var form = document.forms[0];
		var url = '${pageContext.request.contextPath}/crsSurv.act?task=excel&';
      	var pars = Form.serialize(form);
       document.location.href = url+pars;

	}

	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="���� �������� ����" src="/images/edu/title_02.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action='crsSurv.act?task=list'>
      <input type="hidden" name="crsClumpCode">
      <input type="hidden" name="stdNumber">
      <!--�˻� ���̺� ����-->
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr>
        <td bgcolor="#FFFFFF">
		  <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="74" class="s1">����</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td class="s2" width="89">
			  <html:select property="selPlanYear" >
			    <html:optionsCollection name="planYearCode" property="beanCollection" />
			  </html:select>
			</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td width="74" class="s1">�з�</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td class="s2" width="189">
			  <html:select property="selCrsType">
			    <html:optionsCollection name="crsTypeCode" property="beanCollection" />
			  </html:select>
			</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td width="74" class="s1">�����</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td class="s2">
			  <html:select property="selOrganCode">
			    <html:optionsCollection name="orgTypeCode" property="beanCollection" />
			  </html:select>
			</td>
			<td width="60" align="center"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="�˻�" /></td>
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
          <td class="t1Line" width="40">��ȣ</td>
          <td class="t1Line" width="329">������</td>
          <td class="t1Line" width="110">�������</td>
          <td class="t1Line" width="80">�ϼ�</td>
          <td class="t1Line" width="80">�����ο�</td>
          <td class="t1Line" width="107">ó��</td>
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
      <td width="746">
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top">
<!--����Ʈ ����-->
<div id="mainList" style="width:746px; overflow-y:scroll; overflow-x:hidden;">
<script type="text/javascript">div_size(180);</script>
<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
	<c:forEach var="survList" items="${rsPln_EduSurvList}" varStatus="i" >
	<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if><c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>															
   	<tr class="${lineBg}">
    	<td class="t2Line" width="40" id="num">&nbsp;<c:out value="${i.count}"/></td>
			<td class="t3Line" width="329" id="crsClumpNm">&nbsp;<c:out value="${survList.crsClumpName}"/></td>
			<td class="t2Line" width="110" id="eduTgt">&nbsp;<c:out value="${survList.eduTarget}"/></td>
			<td class="t2Line" width="80" id="dayCnt">&nbsp;<c:out value="${survList.dayCount}"/></td>
			<td class="t2Line" width="80" id="orgNum">&nbsp;<c:out value="${survList.orgStdNumber}"/></td>
    	<td class="t2Line" width="90" id="modify">
				<c:if test="${isFinish == 0}">
					<c:if test="${isFix == 0}"><img onclick='modifySurv(${i.count},${survList.orgStdNumber});' src='<html:rewrite page="/images/board/btn_modify.gif"/>' width="34" height="18" align="absmiddle" alt="����" style="CURSOR: hand"/></c:if>
					<c:if test="${isFix > 0}"><img src='<html:rewrite page="/images/board/btn_modify_off.gif"/>'/></c:if>						          
				</c:if>
     	<c:if test="${isFinish != 0}"><img src='<html:rewrite page="/images/board/btn_modify_off.gif"/>'/></c:if>						          
		</td>
	</tr>
	<input type="hidden" name="crsClumpCd" id="crsClumpCd" value="${survList.crsClumpCode }" ><c:set var="count" value="${i.count}"/>
</c:forEach>
<input type="hidden" name="max" id="max" value="${count}" >
</table>
</div>
<!--�Խù� ��� ��-->
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
      <td>
	    <c:if test="${isFinish == 0}">
		  <c:if test="${isFix == 0}">
		    <img src='<html:rewrite page="/images/board/btn_excel.gif"/>' width="94" height="25" align="absmiddle" alt="�����ٿ�ε�" onclick="excelDown();" style="cursor:hand">
		    <img src='<html:rewrite page="/images/board/btn_excelup.gif"/>' width="82" height="25" align="absmiddle" alt="�������ε�" onclick="location.href='<html:rewrite page="ext/crs/survplan/ExtCrs_SurvEduPlanExcelUp.jsp"/>'" style="cursor:hand">
		  </c:if>
		  <c:if test="${isFix > 0}">
		    <img src='<html:rewrite page="/images/board/btn_excel_off.gif"/>' width="94" height="25" align="absmiddle" alt="�����ٿ�ε�">
		    <img src='<html:rewrite page="/images/board/btn_excelup_off.gif"/>' width="82" height="25" align="absmiddle" alt="�������ε�">
		  </c:if>                      
	    </c:if>
	    <c:if test="${isFinish != 0}">
	      <img src='<html:rewrite page="/images/board/btn_excel.gif"/>' width="94" height="25" align="absmiddle" alt="�����ٿ�ε�" onclick="excelDown();" style="cursor:hand">
	      <img src='<html:rewrite page="/images/board/btn_excelup_off.gif"/>' width="82" height="25" align="absmiddle" alt="�������ε�">
	    </c:if>                      
      </td>
    </tr>
    </table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	searchList('${key}');
//-->
</script>
