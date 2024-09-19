<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>

<script language="JavaScript">
<!--

	function checkDay()
	{
		alert('Ȯ��');
	}

	// ������ ó�� ������� �⺻������ ��ȸ
	function searchList(key)
	{
		if(key=="time_mod")
		{
			document.forms[0].submit();
		}
	}
	
	function searchForm()
	{
		var frm = document.forms[0];
		var disedufrom = frm.disEduFrom.value;
		var diseduto = frm.disEduTo.value;
		var edufrom = replace(frm.eduFrom.value,"-","");

		if(parseInt(disedufrom)>parseInt(edufrom))
		{
			alert("���� ������ ���� ��¥�Դϴ�. \n ��¥�� �ٽ� �����ϼ���.");
			return;
		}
		
		if(parseInt(diseduto)<parseInt(edufrom))
		{
			alert("���� ������ ���� ��¥�Դϴ�. \n ��¥�� �ٽ� �����ϼ���.");
			return;
		}
		
		frm.submit();
	}

	function insertTime()
	{
		if(!checkTime()) return;
		var frm = document.forms[1];
		var sFrm = document.forms[0];

		//frm.lectDate.value = sFrm.eduFrom.value;
		frm.courseCode.value = sFrm.courseCode.value;

		checkLectDate();

		//frm.submit();
	}

	function checkTime()
	{
		var frm = document.forms[1];

		for(var i = 0; i<10 ; i++)
		{
			var fromTime = Number(frm.fromTime[i].value.replace(":",""));
			var toTime = Number(frm.toTime[i].value.replace(":",""));

			if(fromTime!=0 && toTime!=0)
			{
				if(fromTime >= toTime)
				{
					alert('�߸��� �ð��Դϴ�.');
					frm.toTime[i].focus();
					return false;
				}
				else
				{
					for(var j=0; j<10;j++)
					{
						var fTime = Number(frm.fromTime[j].value.replace(":",""));
						var tTime = Number(frm.toTime[j].value.replace(":",""));

						if(i!=j)
						{
							if(fromTime >= fTime && fromTime < tTime)
							{
								alert('�߸��� �ð��Դϴ�.');
								return false;
							}
						    if(toTime >= fTime && toTime < tTime)
						    {

						    }
						}
					}

				}
			}
		}

		return true;

	}

	function goURL()
	{
		var url = document.forms[0].return_url.value;
		document.forms[0].action = url;
		document.forms[0].submit();
	}
	
	function goList()
	{
		document.location.href = "crsOrg.act?task=list";
	}

	function deleteTime(i,j)
	{
		//alert("ù��°:"+i);
		//alert("�ι�°:"+j);

		idx = Number(i) + Number(j) - 1;
		var frm = document.forms[1];
		frm.fromTime[idx].value="";
		frm.toTime[idx].value="";
		document.all.time[idx].innerHTML = "";
		frm.subjSeq[idx].value="";
		frm.profName[idx].value="";
		frm.profAssign[idx].value="";

	}

	function checkLectDate()
	{
		var frm = document.forms[0];
		var url = "crsOrg.act?task=chk_lect";
      	var pars = Form.serialize(frm);

		var myAjax = new Ajax.Request(
						url,
                           {
                               method: 'post',
                               parameters: pars,
                               onComplete: success
                              });
	}

	success = function(request)
	{
		var result = request.responseXML.documentElement.firstChild;
    var chkDate = result.getAttribute('chkDate');

    var frm0 = document.forms[0];
		var frm1 = document.forms[1];

		if(chkDate=='0')
		{
			alert('�����Ⱓ�� ���� ��¥�Դϴ�.');
			return;
		}

		frm1.submit();
	}

	function showTime(i,j,obj)
	{
		idx = Number(i) + Number(j) - 1;

		var frm = document.forms[1];

		var fromTime = Number(frm.fromTime[idx].value.substr(0,2));
		var toTime = Number(frm.toTime[idx].value.substr(0,2));

		var hour = toTime-fromTime;

		if(toTime!=0 && fromTime!=0)
		{
			if(hour<1)
			{
				alert('�߸��� �ð��Դϴ�.')
				obj.focus();
				obj.value="";
				document.all.time[idx].innerHTML = "";

				return;
			}
			document.all.time[idx].innerHTML = toTime-fromTime;
		}
		else
		{
			document.all.time[idx].innerHTML = "";
		}

	}

	function copyTime(today)
	{


		if(!checkTime()) return;
		var frm = document.forms[1];
		var sFrm = document.forms[0];

		var disedufrom = sFrm.disEduFrom.value;
		var diseduto = sFrm.disEduTo.value;
		var lectDate = frm.lectDate.value;
		var copyDate = document.all.copyDate.value;

		disedufrom = disedufrom.substring(0,4)+'-'+disedufrom.substring(4,6)+'-'+disedufrom.substring(6,8);
		diseduto = diseduto.substring(0,4)+'-'+diseduto.substring(4,6)+'-'+diseduto.substring(6,8);

		if(lectDate=='' || copyDate=='')
		{
			alert('��¥�� �Է��ϼ���.');
			return;
		}
		
		if(today > copyDate)
		{
			alert('������ ���� ����  ��¥�Դϴ�.');
			return;
		}
		
		if(copyDate > diseduto)
		{
			alert('���� ������ ����  ��¥�Դϴ�.');
			return;
		}
		
		if(copyDate < disedufrom)
		{
			alert('���� ������ ����  ��¥�Դϴ�.');
			return;
		}		
		
		if(lectDate==copyDate)
		{
			alert('������ ��¥�Դϴ�.');
			return;
		}
		if(!confirm(lectDate+'�ڷḦ '+copyDate+'�� �����մϴ�. \n ��� �Ͻðڽ��ϱ�?')) return;

		frm.lectDate.value = copyDate;
		frm.courseCode.value = sFrm.courseCode.value;

		checkLectDate();
	}
	
	
	function setProf(i,j)
	{
		idx = Number(i) + Number(j) - 1;
		var frm = document.forms[1];
		var courseCode = frm.courseCode.value;
		var lectDate = frm.lectDate.value;
		var subjSeq = frm.subjSeq[idx].value;
		profno = frm.profnoarray[idx].value;
		
 		window.open('<html:rewrite page="/crsLectureMgmt.act?task=setprof&courseCode=' + courseCode + '&lectdate='+lectDate+'&subjseq='+subjSeq+'&timeseq='+(idx+1)+'&rowidx='+idx+'&profno='+profno+'"/>', 'popup', 'scrollbars=no, menubar=no, width=760, height=490, status=yes top=150, left=150');

	}
	
	function eatingTime(i, j, type)
	{			
		var num  = Number(i) + Number(j) - 1;
		var frm = document.forms[1];
		var subjSeq = frm.subjSeq[num].value;
		var html = null;
		
		if(subjSeq == '98' || subjSeq == '99')
		{
			frm.profnoarray[num].value	= "";
			frm.profAssign[num].value	= "";
			frm.profName[num].value 	= "";
			frm.profAssign[num].readOnly = true;
			frm.profName[num].readOnly = true;
			frm.profName[num].style.backgroundColor = "#E1E1E1";
			frm.profAssign[num].style.backgroundColor = "#E1E1E1";
			frm.profName[num].style.borderStyle = "groove";
			frm.profAssign[num].style.borderStyle = "groove";
			frm.popup_prof[num].src = '<html:rewrite page="/images/board/btn_zoom_off.gif"/>';
			frm.popup_prof[num].onclick = ""; 
		}
		else
		{
			html = '<input type="text" name="profName" style="width:70px;" value='+ frm.profName[num].value +'>&nbsp;';
			html += '<input type="hidden" name="profnoarray" style="width:70px;" value='+ frm.profnoarray[num].value+'>&nbsp;';
			if(type == 1)
				html += '<img id="popup_prof" name="popup_prof" src=<html:rewrite page="/images/board/btn_zoom.gif"/> width="19" height="19" align="absmiddle" alt="ã�ƺ���" onclick="setProf('+Number(i)+',0)" style="cursor:hand"/>';
			else
				html += '<img id="popup_prof" name="popup_prof" src=<html:rewrite page="/images/board/btn_zoom.gif"/> width="19" height="19" align="absmiddle" alt="ã�ƺ���" onclick="setProf('+Number(i)+','+Number(j)+')" style="cursor:hand"/>';

			document.all.prof_zone[num].innerHTML = html;
			
			html = '<input type="text" name="profAssign" style="width:90%; value='+ frm.profAssign[num].value +'">'
			document.all.assign_zone[num].innerHTML = html;
		}
	}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="����������-�ð�ǥ���" src="/images/edu/title_05-4.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
      <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                  <!--�˻� ���̺� ����-->
                  <html:form action="crsOrg.act?task=search_time" method="post">
									<html:hidden property="courseCode" value="${rsCrs_Org.courseCode}"/>
									<html:hidden property="return_url" value="${return_url}"/>
									<html:hidden property="disEduFrom" value="${rsCrs_Org.disEduFrom }"/>
									<html:hidden property="disEduTo" value="${rsCrs_Org.disEduTo }"/>
									<fmt:parseDate var="disFrom" value="${rsCrs_Org.disEduFrom}" pattern="yyyymmdd"></fmt:parseDate>
									<fmt:parseDate var="disTo" value="${rsCrs_Org.disEduTo}" pattern="yyyymmdd"></fmt:parseDate>
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr>
                      <td bgcolor="#FFFFFF">
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="74" class="s1">�����</td>
                            <td class="sBar"></td>
                            <td class="s2" width="99">${rsCrs_Org.charger}</td>
                            <td class="sBar"></td>
                            <td width="74" class="s1">����</td>
                            <td class="sBar"></td>
                            <td class="s2">${rsCrs_Org.courseName}<br>(<fmt:formatDate value="${disFrom}" pattern="mm.dd"/>~<fmt:formatDate value="${disTo}" pattern="mm.dd"/>)</td>
                            <td class="sBar"></td>                           
                            <td width="74" class="s1">��¥</td>
                            <td class="sBar"></td>
                            <td class="s2" width="109">
                              <html:text property="eduFrom" style="width:70px" value="${rsCrs_Org.eduFrom}" readonly="true" onkeydown="checkDay();"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absmiddle" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[0], 'yyyy-mm-dd')">
                            </td>
                            <td class="s2" width="60"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="�˻�" onclick="searchForm()" style="cursor:hand"></td>
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
                        <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
                          <tr>
                            <td class="t1" width="69">���۽ð�</td>
                            <td class="sBg"></td>
                            <td class="t1" width="69">����ð�</td>
                            <td class="sBg"></td>
                            <td class="t1" width="59">�ð�</td>
                            <td class="sBg"></td>
                            <td class="t1">�����</td>
                            <td class="sBg"></td>
                            <td class="t1" width="119">�Ҽ�</td>
                            <td class="sBg"></td>
                            <td class="t1" width="119">����</td>
                            <td class="sBg"></td>
                            <td class="t1" width="77">���</td>
                          </tr>
                        </table>
                      </td>
                      <td class="lbg"></td>
                    </tr>
                  </table>
                  <!--���̺� ��� ����-->
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
															<html:form action="crsOrg.act?task=save_time" method="post">
															<input type="hidden" name="courseCode" id="courseCode" value="${rsCrs_Org.courseCode}">
															<input type="hidden" name="lectDate" id="lectDate" value="${lectDate}">
                               	<table width="746" border="0" cellspacing="0" cellpadding="0">
                               	<c:forEach var="timeList" items="${rsCrs_TimeTblList}" varStatus="i" >
                                  <tr>
                                    <td class="t2" width="69">
                                      <html:select property="fromTime" value="${timeList.fromTime}" onchange="showTime(${i.count},0,this);">
                                      	<html:option value=""></html:option>
                                        <html:option value="09:00">09:00</html:option>
                                        <html:option value="10:00">10:00</html:option>
                                        <html:option value="11:00">11:00</html:option>
                                        <html:option value="12:00">12:00</html:option>
                                        <html:option value="13:00">13:00</html:option>
                                        <html:option value="14:00">14:00</html:option>
                                        <html:option value="15:00">15:00</html:option>
                                        <html:option value="16:00">16:00</html:option>
                                        <html:option value="17:00">17:00</html:option>
                                        <html:option value="18:00">18:00</html:option>
                                        <html:option value="19:00">19:00</html:option>
                                        <html:option value="20:00">20:00</html:option>
                                        <html:option value="21:00">21:00</html:option>
                                      </html:select>
                                    </td>
																		<td class="sBg"></td>
                                    <td class="t2" width="69">
                                      <html:select property="toTime" value="${timeList.toTime}" onchange="showTime(${i.count},0,this);">
                                      	<html:option value=""></html:option>
                                        <html:option value="09:00">09:00</html:option>
                                        <html:option value="10:00">10:00</html:option>
                                        <html:option value="11:00">11:00</html:option>
                                        <html:option value="12:00">12:00</html:option>
                                        <html:option value="13:00">13:00</html:option>
                                        <html:option value="14:00">14:00</html:option>
                                        <html:option value="15:00">15:00</html:option>
                                        <html:option value="16:00">16:00</html:option>
                                        <html:option value="17:00">17:00</html:option>
                                        <html:option value="18:00">18:00</html:option>
                                        <html:option value="19:00">19:00</html:option>
                                        <html:option value="20:00">20:00</html:option>
                                        <html:option value="21:00">21:00</html:option>
                                      </html:select>
                                    </td>
																		<td class="sBg"></td>
                                    <td class="t2" width="59" id="time">${timeList.hour}</td>
																		<td class="sBg"></td>
                                    <td class="t3">
                                      <html:select property="subjSeq" value="${timeList.subjSeq }"  style="width:90%;" onchange="eatingTime(${i.count}, 0, 1);">
											    							<html:optionsCollection name="rsSubject" property="beanCollection" />
											    			 			</html:select>
                                    </td>
																		<td class="sBg"></td>
                                    <td class="t2" width="119" id="assign_zone">
                                      <input type="text" name="profAssign" style="width:90%;" value="${timeList.profAssign }">
                                    </td>
																		<td class="sBg"></td>
                                    <td class="t2" width="119" id="prof_zone">
                                      <input type="text" name="profName" style="width:70px;" value="${timeList.profName }">
																			<input type="hidden" name="profnoarray" style="width:70px;" value="${timeList.profno }">                                      
                                      <img id="popup_prof" name="popup_prof" src='<html:rewrite page="/images/board/btn_zoom.gif"/>' width="19" height="19" align="absmiddle" alt="ã�ƺ���" onclick="setProf('${i.count }',0)" style="cursor:hand"/>
                                    </td>
																		<td class="sBg"></td>
                                    <td class="t2" width="77">
                                    	<c:if test="${timeList.modyn eq 'Y'}">
                                    		<c:if test="${rsCrs_Org.finishFlag eq 'N' }">
                                    			<img src='<html:rewrite page="/images/board/btn_del2.gif"/>' width="34" height="18" align="absmiddle" alt="����" onclick="deleteTime('${j.count}','${i.count}');" />
                                    		</c:if>
	                                    	<c:if test="${rsCrs_Org.finishFlag ne 'N' }">
	                                    		<img src='<html:rewrite page="/images/board/btn_del2_off.gif"/>' width="34" height="18" align="absmiddle" />
	                                    	</c:if> 
                                    	</c:if>
                                    	<c:if test="${timeList.modyn ne 'Y'}">
                                    		<img src='<html:rewrite page="/images/board/btn_del2_off.gif"/>' width="34" height="18" align="absmiddle" />
                                    	</c:if>                                    	
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="lbg3" colspan="13"></td>
                                  </tr>
																<c:set var="count" value="${i.count}"/>
																<c:set var="modyn" value="${timeList.modyn }"/>
																</c:forEach>
																<c:forEach varStatus="j"  begin="${count}" end="9" step="1">
                                  <tr>
                                    <td class="t2" width="69">
                                      <html:select property="fromTime" onchange="showTime('${j.count}','${count}',this);">
                                      	<html:option value=""></html:option>
                                        <html:option value="09:00">09:00</html:option>
                                        <html:option value="10:00">10:00</html:option>
                                        <html:option value="11:00">11:00</html:option>
                                        <html:option value="12:00">12:00</html:option>
                                        <html:option value="13:00">13:00</html:option>
                                        <html:option value="14:00">14:00</html:option>
                                        <html:option value="15:00">15:00</html:option>
                                        <html:option value="16:00">16:00</html:option>
                                        <html:option value="17:00">17:00</html:option>
                                        <html:option value="18:00">18:00</html:option>
                                        <html:option value="19:00">19:00</html:option>
                                        <html:option value="20:00">20:00</html:option>
                                        <html:option value="21:00">21:00</html:option>
                                      </html:select>
                                    </td>
																		<td class="sBg"></td>
                                    <td class="t2" width="69">
                                      <html:select property="toTime" onchange="showTime('${j.count}','${count}',this);">
                                      	<html:option value=""></html:option>
                                        <html:option value="09:00">09:00</html:option>
                                        <html:option value="10:00">10:00</html:option>
                                        <html:option value="11:00">11:00</html:option>
                                        <html:option value="12:00">12:00</html:option>
                                        <html:option value="13:00">13:00</html:option>
                                        <html:option value="14:00">14:00</html:option>
                                        <html:option value="15:00">15:00</html:option>
                                        <html:option value="16:00">16:00</html:option>
                                        <html:option value="17:00">17:00</html:option>
                                        <html:option value="18:00">18:00</html:option>
                                        <html:option value="19:00">19:00</html:option>
                                        <html:option value="20:00">20:00</html:option>
                                        <html:option value="21:00">21:00</html:option>
                                      </html:select>
                                    </td>
																		<td class="sBg"></td>
                                    <td class="t2" width="59" id="time"></td>
																		<td class="sBg"></td>
                                    <td class="t3">
                                      <html:select property="subjSeq" style="width:90%;" onchange="eatingTime('${j.count}','${count}', 2);">
											    							<html:optionsCollection name="rsSubject" property="beanCollection" />
											    			 			</html:select>
                                    </td>
																		<td class="sBg"></td>
                                    <td class="t2" width="119" id="assign_zone">
                                      <input type="text" name="profAssign" style="width:90%;">
                                    </td>
																		<td class="sBg"></td>
                                    <td class="t2" width="119" id="prof_zone">
                                      <input type="text" name="profName" style="width:70px;">
                                      <input type="hidden" name="profnoarray" style="width:70px;">
                                      <img id="popup_prof" name="popup_prof" src='<html:rewrite page="/images/board/btn_zoom.gif"/>' width="19" height="19" align="absmiddle" alt="ã�ƺ���" onclick="setProf('${j.count}','${count}')" style="cursor:hand"/>
                                    </td>
																		<td class="sBg"></td>
                                    <td class="t2" width="77"> 
                                    	<c:if test="${modyn eq 'Y' }">
                                    		<c:if test="${rsCrs_Org.finishFlag eq 'N' }">
                                    			<img src='<html:rewrite page="/images/board/btn_del2.gif"/>' width="34" height="18" align="absmiddle" alt="����" onclick="deleteTime('${j.count}','${count}');" />
                                    		</c:if>
	                                    	<c:if test="${rsCrs_Org.finishFlag ne 'N' }">
	                                    		<img src='<html:rewrite page="/images/board/btn_del2_off.gif"/>' width="34" height="18" align="absmiddle" />
	                                    	</c:if>                                      		
                                    	</c:if>  
                                    	<c:if test="${modyn ne 'Y' }">
                                    		<img src='<html:rewrite page="/images/board/btn_del2_off.gif"/>' width="34" height="18" align="absmiddle" />
                                    	</c:if>  
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="lbg3" colspan="13"></td>
                                  </tr>
																</c:forEach>
                                </table>
															</html:form>
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
                      <td align="right">
                      <input type="text" name="copyDate" id="copyDate" value="${rsCrs_Org.eduFrom}" style="width:70px" readonly="true"  onkeydown="checkDay();"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absmiddle" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[0], 'yyyy-mm-dd')">
	                      <c:if test="${rsCrs_Org.finishFlag eq 'N' }">
	                      	<img src='<html:rewrite page="/images/board/btn_timecopy.gif"/>' width="82" height="25" align="absmiddle" alt="�ð�ǥ ����" onclick="copyTime('${today }');" style="CURSOR: hand"/>
	                      </c:if> 
	                      <c:if test="${rsCrs_Org.finishFlag ne 'N' }">
	                      	<img src='<html:rewrite page="/images/board/btn_timecopy_off.gif"/>' width="82" height="25" align="absmiddle" alt="�ð�ǥ ����" />
	                      </c:if> 	                      
	                     	<c:if test="${return_url == null || return_url == ''}"><c:set var="return" value="list"/></c:if>
												<c:if test="${return == 'list'}">	                      
		                      <img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" align="absmiddle" alt="���" onclick="goList();" style="CURSOR: hand"/>
												</c:if>
												<c:if test="${return != 'list'}">	                      
		                      <img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" align="absmiddle" alt="���" onclick="goURL();" style="CURSOR: hand"/>
												</c:if>
												<c:if test="${modyn eq 'Y'}">
													<c:if test="${rsCrs_Org.today<= rsCrs_Org.eduFrom}">
														<c:if test="${rsCrs_Org.finishFlag eq 'N' }">
															<img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="����" align="absmiddle" onclick="insertTime();" style="CURSOR: hand"/>
														</c:if>
														<c:if test="${rsCrs_Org.finishFlag ne 'N' }">
															<img src='<html:rewrite page="/images/board/btn_save_off.gif"/>' width="57" height="25" alt="����" align="absmiddle" />
														</c:if>
													</c:if>
													<c:if test="${rsCrs_Org.today > rsCrs_Org.eduFrom}">
														<img src='<html:rewrite page="/images/board/btn_save_off.gif"/>' width="57" height="25" alt="����" align="absmiddle" />
													</c:if>													
												</c:if>
												<c:if test="${modyn ne 'Y'}">
													<c:if test="${rsCrs_Org.today<= rsCrs_Org.eduFrom}">
														<c:if test="${rsCrs_Org.finishFlag eq 'N' }">
															<img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="����" align="absmiddle" onclick="insertTime();" style="CURSOR: hand"/>
														</c:if>
														<c:if test="${rsCrs_Org.finishFlag ne 'N' }">
															<img src='<html:rewrite page="/images/board/btn_save_off.gif"/>' width="57" height="25" alt="����" align="absmiddle" />
														</c:if>
													</c:if>
													<c:if test="${rsCrs_Org.today > rsCrs_Org.eduFrom}">
														<img src='<html:rewrite page="/images/board/btn_save_off.gif"/>' width="57" height="25" alt="����" align="absmiddle" />
													</c:if>	
												</c:if>
											</td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<script type="text/javascript">
<!--
	searchList('${key}');
	
	var frm = document.forms[1];
	for(var no=0; no<9; no++)
	{	
		var subjSeq = frm.subjSeq[no].value;
		if(subjSeq == '98' || subjSeq == '99')
		{
			frm.profAssign[no].value	= "";
			frm.profnoarray[no].value	= "";
			frm.profName[no].value 	= "";
			frm.profAssign[no].readOnly = true;
			frm.profName[no].readOnly = true;
			frm.profName[no].style.backgroundColor = "#E1E1E1";
			frm.profAssign[no].style.backgroundColor = "#E1E1E1";
			frm.profName[no].style.borderStyle = "groove";
			frm.profAssign[no].style.borderStyle = "groove";
			frm.popup_prof[no].src = '<html:rewrite page="/images/board/btn_zoom_off.gif"/>';
			frm.popup_prof[no].onclick = ""; 
		}
	}

//-->
</script>
