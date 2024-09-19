<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   ������ ������ ���� ���� �ڵ�
	tresize(180);
	}

	// ������ ó�� ������� �⺻������ ��ȸ
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}

  function goList(coursecode)
  {
  	document.location.href = 'tstScore.act?task=list&searchSort=STDNO&searchCourseCode='+coursecode; 
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
          <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/poll/title_01-3.gif"/>' alt="�������� - ���Ӻ� ���� �Է�" width="214" height="18" /></td>
        </tr>
        <tr> 
          <td height="15"></td>
        </tr>
        <tr> 
          <td> 
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                  <!--�˻� ���̺� ����-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td class="s1Left">���� : ${coursename}</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
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
                            <td class="t1" width="79">������</td>
                            <td class="sBg"></td>
                            <td class="t1">������</td>
                            <td class="sBg"></td>
                            <td class="t1" width="110">��������</td>
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
                            <td valign="top"> 
                              <html:form action="tstScore.act?task=teamins">
                              <input type="hidden" name="coursecode" value="${coursecode }">
                              <!--����Ʈ ����-->
                              <div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden" > 
                                <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
                                	<c:forEach var="teamList" items="${rsTst_ScoreTeamList}" varStatus="i">
                                		<input type="hidden" name="tno_array" value="${teamList.teamno }">
                                		<c:if test="${i.count%2 == 0}">
		                                  <tr class="tbg3"> 
		                                    <td class="t2" width="79">${teamList.teamno }��</td>
		                                    <td class="sBg"></td>
		                                    <td class="t3">&nbsp;${teamList.stdname }</td>
		                                    <td class="sBg"></td>
		                                    <td class="t2" width="110"> 
		                                      <input type="text" name="team_array" style="width:90px;">
		                                    </td>
		                                  </tr>
		                                  <tr> 
		                                    <td class="lbg3" colspan="5"></td>
		                                  </tr>
		                                </c:if>
																		<c:if test="${i.count%2 == 1}">		                                
		                                  <tr > 
		                                    <td class="t2" width="79">${teamList.teamno }��</td>
		                                    <td class="sBg"></td>
		                                    <td class="t3">&nbsp;${teamList.stdname }</td>
		                                    <td class="sBg"></td>
		                                    <td class="t2" width="110"> 
		                                      <input type="text" name="team_array" style="width:90px;">
		                                    </td>
		                                  </tr>
		                                  <tr> 
		                                    <td class="lbg3" colspan="5"></td>
		                                  </tr>
		                                </c:if>
		                              </c:forEach>
                                </table>
                              </div>
                              <!--����Ʈ ��-->
                              </html:form>
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
                  <!--�ϴܹ�ư-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr valign="bottom"> 
                      <td align="right"><img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" alt="���" align="absmiddle" onclick="goList('${coursecode}')" style="cursor:hand"/> 
                        <img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" align="absmiddle" alt="����" onclick="document.forms[0].submit()" style="cursor:hand"/></td>
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
	tresize(180);
	searchList('${key}');

//-->
</script>
