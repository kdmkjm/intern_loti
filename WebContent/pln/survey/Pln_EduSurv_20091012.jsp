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
	tresize(300);
	}

	// ������ư Ŭ����
	function modifySurv(row)
	{
		row = row-1;

		$('crsClumpCode').value = document.all.crsClumpCd[row].value;
		$('organCode').value = document.all.organCd[row].value;
		$('planYear').value = document.all.plnYear[row].value;

		$('crsClumpName').value = document.all.crsClumpNm[row].innerHTML;
		$('eduTarget').value = document.all.eduTgt[row].innerHTML;
		$('dayCount').value = document.all.dayCnt[row].innerHTML;
		$('turnCount').value = document.all.turnCnt[row].innerHTML;
		$('stdNumber').value = document.all.stdNum[row].innerHTML;
		$('chptCount').value = document.all.chptCnt[row].innerHTML;
		$('apvHour').value = document.all.apvHr[row].innerHTML;

		var frm = document.forms[1];
		var type1 = document.all.type1[row].value;
		var type2 = document.all.type2[row].value;
		var type3 = document.all.type3[row].value;
		frm.crsType.value = type1+type2+type3;

		$('insert').style.display = "none";
		$('update').style.display = "";

	}

	// ���� ���μ���
	function saveSurv()
	{

		var frm = document.forms[1];

		if(frm.crsClumpName.value == '')
		{
			alert('�������� �Է��ϼ���');
			frm.crsClumpName.focus();
			return;
		}

		if(frm.crsType.value == '')
		{
			alert('�з��� �Է��ϼ���');
			frm.crsType.focus();
			return;
		}

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

	// ����Ϸ�
	function saveComp(request)
	{
		alert('������ �Ϸ�Ǿ����ϴ�.');
		document.forms[0].submit();

	}

	//���� ����
	reportError = function(request)
	{
		alert('���� �� ������ �߻��Ͽ����ϴ�. \\n�����ڿ��� �����ϼ���.');
	}


	// �ű� Ŭ���� �Է�â �ʱ�ȭ
	function formReset()
	{
		$('crsClumpName').value = "";
		$('eduTarget').value = "";
		$('dayCount').value = "";
		$('turnCount').value = "";
		$('stdNumber').value = "";
		$('chptCount').value = "";
		$('apvHour').value = "";

		$('insert').style.display = "";
		$('update').style.display = "none";
	}



	// ���⵵ �ڷ� ��������
	function copySurvey()
	{

		today = new Date();



		var year = today.getYear() + 1;

		if(confirm(year+'�⵵ �ڷ�� ��� �����˴ϴ�. ����Ͻðڽ��ϱ�?'))
		{
				var url = '${pageContext.request.contextPath}/plnSurv.act';
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

	//���� �ٿ�ε�
	function excelDown()
	{
		var form = document.forms[0];
		var url = '${pageContext.request.contextPath}/plnSurv.act?task=excel&';
      	var pars = Form.serialize(form);

        /*
        var myAjax = new Ajax.Request(
                           url,
                           {
                               method: 'post',
                               parameters: pars
                           });
       */

       document.location.href = url+pars;

	}

	// ������ ó�� ������� �⺻������ ��ȸ
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
    <td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
  </tr>
  <tr>
    <td>
      <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/edu/title_01.gif"/>' alt="���缭" width="74" height="18" /></td>
        </tr>
        <tr>
          <td height="15"></td>
        </tr>
        <tr>
          <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
            <html:form action='plnSurv.act?task=list'>
 			<!--�˻� ���̺� ����-->
             <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                 <tr>
                      <td bgcolor="#FFFFFF">
			            <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="74" class="s1">����</td>
                            <td bgcolor="#E6E6E6" width="1"></td>
                            <td class="s2" width="99">
			                   <html:select property="selPlanYear">
			    				<html:optionsCollection name="planYearCode" property="beanCollection" />
			    			</html:select>
			                </td>
                            <td bgcolor="#E6E6E6" width="1"></td>
                            <td width="74" class="s1">�з�</td>
                            <td bgcolor="#E6E6E6" width="1"></td>
                            <td class="s2" width="99">
			                  <html:select property="selCrsType">
			    				<html:optionsCollection name="crsTypeCode" property="beanCollection" />
			    			 </html:select>
			                </td>
                            <td bgcolor="#E6E6E6" width="1"></td>
                            <td width="74" class="s1">���</td>
                            <td bgcolor="#E6E6E6" width="1"></td>
                            <td class="s2">
			                  <html:select property="selOrganCode">
			    				<html:optionsCollection name="orgTypeCode" property="beanCollection" />
			    			 </html:select>
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
                        <table width="746" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td class="t1" width="48">��ȣ</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="179">������</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="116">�������</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="49">�ϼ�</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="49">ȸ��</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="49">����<br>�ο�</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="49">���<br>�ο�</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="49">����</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="49">����<br>�ð�</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="99">ó��</td>
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
			<div id="mainList"  style=" width:746px;  overflow-y:scroll ;overflow-x:hidden;">
				<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
				<c:forEach var="survList" items="${rsPln_EduSurvList}" varStatus="i" >
					<c:if test="${i.count%2 == 0}">
       		        <tr class="tbg3">
       		        	<td class="t2" width="48" id="num"><c:out value="${survList.num}"/></td>
       		        	<td class="sBg"></td>
						<td class="t3" width="179" id="crsClumpNm"><c:out value="${survList.crsClumpName}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="116" id="eduTgt"><c:out value="${survList.eduTarget}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="dayCnt"><c:out value="${survList.dayCount}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="turnCnt"><c:out value="${survList.turnCount}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="stdNum"><c:out value="${survList.stdNumber}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="orgNum"><c:out value="${survList.orgStdNumber}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="chptCnt"><c:out value="${survList.chptCount}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="apvHr"><c:out value="${survList.apvHour}"/></td>
						<td class="sBg"></td>
			            <td class="t2" width="81">
			            <c:if test="${planCount==0}">
			            <img width="34" height="18" align="absmiddle" onclick="modifySurv(${i.count});" src='<html:rewrite page="/images/board/btn_modify.gif"/>'>
			            <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' width="34" height="18" align="absmiddle" alt="����" />
			            </c:if>
			            <c:if test="${planCount>0}">
			            <img width="34" height="18" align="absmiddle" src='<html:rewrite page="/images/board/btn_modify_off.gif"/>'>
			            <img src='<html:rewrite page="/images/board/btn_del2_off.gif"/>' width="34" height="18" align="absmiddle" alt="����" />
			            </c:if>
			            </td>
			        </tr>
		            <tr>
							<td class="lbg3" colspan="99"></td>
					</tr>
       		        </c:if>
       		        <c:if test="${i.count%2 == 1}">
       		        <tr>
       		        	<td class="t2" width="48" id="num"><c:out value="${survList.num}"/></td>
       		        	<td class="sBg"></td>
						<td class="t3" width="179" id="crsClumpNm"><c:out value="${survList.crsClumpName}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="116" id="eduTgt"><c:out value="${survList.eduTarget}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="dayCnt"><c:out value="${survList.dayCount}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="turnCnt"><c:out value="${survList.turnCount}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="stdNum"><c:out value="${survList.stdNumber}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="orgNum"><c:out value="${survList.orgStdNumber}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="chptCnt"><c:out value="${survList.chptCount}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="apvHr"><c:out value="${survList.apvHour}"/></td>
						<td class="sBg"></td>
			            <td class="t2" width="82"><c:if test="${planCount==0}">
			            <img width="34" height="18" align="absmiddle" onclick="modifySurv(${i.count});" src='<html:rewrite page="/images/board/btn_modify.gif"/>'>
			            <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' width="34" height="18" align="absmiddle" alt="����" />
			            </c:if>
			            <c:if test="${planCount>0}">
			            <img width="34" height="18" align="absmiddle" src='<html:rewrite page="/images/board/btn_modify_off.gif"/>'>
			            <img src='<html:rewrite page="/images/board/btn_del2_off.gif"/>' width="34" height="18" align="absmiddle" alt="����" />
			            </c:if>
			            </td>
			        </tr>
		            <tr>
							<td class="lbg3" colspan="99"></td>
					</tr>
       		        </c:if>

		        <input type="hidden" name="plnYear" id="plnYear" value="${survList.planYear }" >
				<input type="hidden" name="crsClumpCd" id="crsClumpCd" value="${survList.crsClumpCode }" >
				<input type="hidden" name="organCd" id="organCd" value="${survList.organCode }" >
				<input type="hidden" name="type1" id="type1" value="${survList.crsType1 }" >
				<input type="hidden" name="type2" id="type2" value="${survList.crsType2 }" >
				<input type="hidden" name="type3" id="type3" value="${survList.crsType3 }" >

		        </c:forEach>
			  </table>
			  </div>

    <!--�Խù� ��� ��-->
								</td>
                          </tr>

                        </table>

                      </td>
                      <td class="lbg" ></td>
                    </tr>
                  </table>


                </td>
              </tr>
              <tr>
              <td><table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="tbg2"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
              <td height="5"></td>
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
             	<table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="lbg"></td>
              	 		<td class="cbg3">

              	 <!--�Խù� �߰�/���� ����-->

            <html:form action="/plnSurv.act?task=insert" method="post">
            <input type="hidden" name="crsClumpCode" id="crsClumpCode" >
            <input type="hidden" name="organCode" id="organCode" >
            <input type="hidden" name="planYear" id="planYear" >
            <input type="hidden" name="crsType1" id="crsType1" >
            <input type="hidden" name="crsType2" id="crsType2" >
            <input type="hidden" name="crsType3" id="crsType3" >
             	<table width="746" border="0" cellspacing="0" cellpadding="0">
                     		<tr>
                                  <td width="59" class="t1">������</td>
                                  <td class="sBg2"></td>
                                  <td class="s2Center">
                                    <input type="text" name="crsClumpName" id="crsClumpName" style="width:87%;">
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="t1">�������</td>
                                  <td class="sBg2"></td>
                                  <td width="79" class="s2Center">
                                    <input type="text" name="eduTarget" id="eduTarget" style="width:90%;">
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="49" class="t1">�ϼ�</td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="s2Center">
                                    <input type="text" name="dayCount" id="dayCount" style="width:90%;">
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="t1">����</td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="s2Center">
                                  	<input type="text" name="chptCount" id="chptCount" style="width:90%;">
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="s2Center">
                                  <c:if test="${planCount==0}">
                                  	<img id="reset" src='<html:rewrite page="/images/board/btn_s_reset.gif"/>' width="60" height="19" alt="�ű�����" align="absmiddle" onclick="formReset();"/>
                                  </c:if>
                                  </td>
                          </tr>
                         <tr>
                                  <td colspan="16" class="lbg4"></td>
                         </tr>
                         <tr>
                                  <td width="59" class="t1">�з�</td>
                                  <td class="sBg2"></td>
                                  <td class="s2Center">
                                    <html:select property="crsType" style="width:90%;" >
			    						<html:optionsCollection name="crsTypeAll" property="beanCollection" />
			    					</html:select>
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="t1">�����ο�</td>
                                  <td class="sBg2"></td>
                                  <td width="79" class="s2Center">
                                    <input type="text" name="stdNumber" id="stdNumber" style="width:90%;">
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="49" class="t1">ȸ��</td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="s2Center">
                                    <input type="text" name="turnCount" id="turnCount" style="width:90%;">
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="t1">�����Ⱓ</td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="s2Center">
                                    <input type="text" name="apvHour" id="apvHour" style="width:88%;">
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="s2Center">
                                  	<c:if test="${planCount==0}">
									  <img id="update" src='<html:rewrite page="/images/board/btn_modifysave.gif"/>' width="60" height="19" alt="��������" align="absmiddle" style="display:none" onclick="saveSurv();"/>
									  <img id="insert" src='<html:rewrite page="/images/board/btn_newsave.gif"/>' width="60" height="19" alt="�ű�����" align="absmiddle" onclick="saveSurv();"/>
									</c:if>
								  </td>
                        </tr>
             </table>
			</html:form>

              	</td>
              	<td class="lbg" ></td>
            </tr>
            </table>
            </td>
           	</tr>
           	<tr>
              <td><table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="tbg2"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td>

                  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr valign="bottom">
                      <td>
                      <c:if test="${survCount==0}"> <img src='<html:rewrite page="/images/board/btn_import.gif"/>' width="127" height="25" align="absmiddle" alt="���⵵ �ڷ� ��������"  onclick="copySurvey();"/>
                      </c:if>
                      <c:if test="${survCount>0}"> <img src='<html:rewrite page="/images/board/btn_import_off.gif"/>' width="127" height="25" align="absmiddle" alt="���⵵ �ڷ� ��������" />
                      </c:if>
                      <c:if test="${planCount==0}">

                        <img src='<html:rewrite page="/images/board/btn_excel.gif"/>' width="94" height="25" align="absmiddle" alt="�����ٿ�ε�" onclick="excelDown();">
                        <a href="pln/survey/Pln_EduSurvExcelUp.jsp"><img src='<html:rewrite page="/images/board/btn_excelup.gif"/>' width="82" height="25" align="absmiddle" alt="�������ε�"></a>
                       </c:if>
                       <c:if test="${planCount>0}">
                        <img src='<html:rewrite page="/images/board/btn_excel_off.gif"/>' width="94" height="25" align="absmiddle" alt="�����ٿ�ε�">
                        <img src='<html:rewrite page="/images/board/btn_excelup_off.gif"/>' width="82" height="25" align="absmiddle" alt="�������ε�">
                       </c:if>
                        </td>
                        <td align="right">
                        	<img src='<html:rewrite page="/images/board/btn_print6.gif"/>' width="86" height="25" align="absbottom" alt="����ǥ �μ�">
                        </td>
                       </tr>
                  </table>



          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
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
	tresize(300);
	searchList('${key}');

//-->
</script>
