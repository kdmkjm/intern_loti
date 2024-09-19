<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   ������ ������ ���� ���� �ڵ�
	tresize(255);
	}

	// ������ ó�� ������� �⺻������ ��ȸ
	function searchList(key)
	{
		frm = document.forms[0];
		if(key=="move")
		{
			var courseCode = frm.courseCode.value;
			var courseName = frm.courseName.value;
			var selOrganCode = frm.selOrganCode.value;
			document.location.href = "oprStudentListRcv.act?task=excel_up&courseCode="+courseCode+"&courseName="+courseName+"&selOrganCode="+selOrganCode;
		}
	}
	
	function doDelete(code, seq)
	{
		frm = document.forms[0];
		var selOrganCode = frm.selOrganCode.value;
		document.forms[0].action = "oprStudentListRcv.act?task=deleteAddRcv&selOrganCode="+selOrganCode+"&type=receive&courseCode="+code+"&seq="+seq;
		document.forms[0].submit();
	}
	
	function excel_upload()
	{
		var selorganCode = document.forms[0].selOrganCode.value;
		var file = document.forms[0].file.value;

		if(selorganCode == "")
		{
			alert("����ڵ带 �����Ͽ� �ֽʽÿ�.");
			document.forms[0].selOrganCode.focus();
			return;
		}
		
			if(file == "")
		{
			alert("���ε� ������ �����Ͽ� �ֽʽÿ�.");
			document.forms[0].file.focus();
			return;
		}
		
		document.forms[0].submit();
	}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="������ ��� ���� - ���� ���ε�" src="/images/operation/title_06-2.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                  <html:form action='oprStudentListRcv.act?task=excel_up' enctype="multipart/form-data" >
                  <!--�˻� ���̺� ����-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                         	<html:hidden property="courseCode" value="${courseCode}"/>
                         	<html:hidden property="courseName" value="${courseName}"/>
                          <tr> 
                            <td width="119" class="s1">��������</td>
                            <td class="sBar"></td>
                            <td class="s2" colspan="5"> ${courseName}</td>
                          </tr>
                          <tr> 
                            <td colspan="7" class="lbg3"></td>
                          </tr>
                          <tr> 
                            <td width="119" class="s1">�����</td>
                            <td class="sBar" width="199"></td>
                            <td class="s2"> 
			                  			<html:select property="selOrganCode" onchange="searchList('move')">
									    					<html:optionsCollection name="orgTypeCode" property="beanCollection" />
									    			 	</html:select>
                            </td>
                            <td class="sBar"></td>                            
                            <td width="119" class="s1">���ε�</td>
                            <td class="sBar"></td>
                            <td class="s2"> 
                              <html:file property="file" style="width:330px;"></html:file> 
                            </td>
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
                <td> 
                  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr> 
                      <td><img src='<html:rewrite page="/images/board/btn_dawnload.gif"/>' alt="�Է¾�� �ٿ�ε�" onclick="location.href='<html:rewrite page="/oprStudentListRcv.act?task=sample"/>'" style="CURSOR:hand" align="absbottom"/></td>
                      <td align="right">
                      	<b>�� ��Ÿ �����  Ÿ�õ� ������ ��� �ÿ� ���޸��� �� ������ּ���. (�ΰ� ����)</b>
                      	<c:if test="${chkMod eq 'Y'}">
                      		<img src='<html:rewrite page="/images/board/btn_upload.gif"/>' alt="���ε�"  onclick="excel_upload();" style="CURSOR:hand" align="absbottom"/>
                      	</c:if>

						<c:if test="${chkMod ne 'Y'}">
                      		<img src='<html:rewrite page="/images/board/btn_upload.gif"/>' alt="���ε�"  onclick="excel_upload();" style="CURSOR:hand" align="absbottom"/>
                      	</c:if>                      	

<%--
                      	<c:if test="${chkMod ne 'Y'}">
                      		<img src='<html:rewrite page="/images/board/btn_upload_off.gif"/>' alt="���ε�" align="absbottom"/>
                      	</c:if>                      	
--%>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />${courseName}����</td>
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
                            <td class="t1" width="30">NO</td>
                            <td class="sBg"></td>
                            <td class="t1">��������</td>
                            <td class="sBg"></td>
                            <td class="t1" width="49">����</td>
                            <td class="sBg"></td>
                            <td class="t1" width="74">�μ���</td>
                            <td class="sBg"></td>
                            <td class="t1" width="69">����</td>
                            <td class="sBg"></td>
                            <td class="t1" width="54">����</td>
                            <td class="sBg"></td>    
                            <td class="t1" width="58">����</td>
                            <td class="sBg"></td>
                            <td class="t1" width="89">�ڵ�����ȣ</td>
                            <td class="sBg"></td>
                            <td class="t1" width="120">�̸���</td>
                            <td class="sBg"></td>
                            <td class="t1" width="50">ó��</td>
                            <td width="17"></td>
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
                      <td class="lbg2"></td>
                      <td width="746"> 
                        <table width="746" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td> 
                              <!--����Ʈ ����-->
                              <div id="mainList" style="width:746px;  z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
                                <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
                                <c:forEach var="studentrcvList" items="${rsOpr_StudentListRcvList}" varStatus="i">
                                	<c:if test="${i.count%2 == 0}">
	         													<tr> 
	                                    <td class="t2" width="30">${studentrcvList.num}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t3">${studentrcvList.courseName}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="49">${studentrcvList.stdname}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="74">${studentrcvList.assignname}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="69">${studentrcvList.rankname}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="54">${studentrcvList.gradename}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="58">${studentrcvList.jobname}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="89">${studentrcvList.cellphone}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="120">${studentrcvList.email}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="50"><img src='<html:rewrite page="/images/board/btn_del2.gif"/>' alt="����"  onclick="doDelete(${studentrcvList.courseCode}, ${studentrcvList.seq});" style="CURSOR:hand"/></td>
	                                  </tr>
	                                  <tr> 
	                                    <td class="lbg3" colspan="19"></td>
	                                  </tr>                       	
                                	</c:if>
                                	<c:if test="${i.count%2 == 1}">
	                                	 <tr class="tbg3"> 
	                                    <td class="t2" width="30">${studentrcvList.num}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t3">${studentrcvList.courseName}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="49">${studentrcvList.stdname}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="74">${studentrcvList.assignname}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="69">${studentrcvList.rankname}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="54">${studentrcvList.gradename}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="58">${studentrcvList.jobname}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="89">${studentrcvList.cellphone}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="120">${studentrcvList.email}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="50"><img src='<html:rewrite page="/images/board/btn_del2.gif"/>' alt="����"  onclick="doDelete(${studentrcvList.courseCode}, ${studentrcvList.seq});" style="CURSOR:hand"/></td>
	                                  </tr>
	                                  <tr> 
	                                    <td class="lbg3" colspan="19"></td>
	                                  </tr>
                                	</c:if>
                                	<c:set var="count" value="${i.count}"/> 
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
              <tr> 
                <td> 
                  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr valign="bottom"> 
                      <td align="right"><a href="oprStudentListRcv.act?task=list&searchCourseCode=${courseCode}&searchCourseName=${courseName}"><img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" align="absmiddle" alt="���" /></a></td>
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
	tresize(255);
	searchList('${key}');
	document.forms[0].file.focus();
//-->
</script>

