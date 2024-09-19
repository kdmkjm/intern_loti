<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>SMS �߼���Ȳ - ����</title>
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
</head>
<body>
<table width="790" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
  </tr>
  <tr> 
    <td> 
      <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/resources/title_08-2.gif"/>' alt="SMS �߼���Ȳ - ����" width="175" height="18" /></td>
        </tr>
        <tr> 
          <td height="15">&nbsp; </td>
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
                            <td width="69" class="s1">�� ��</td>
                            <td class="sBar"></td>
                            <td class="s1" width="109"> ��û�Ͻ� </td>
                            <td class="sBar"></td>
                            <td width="49" class="s1">�߽���</td>
                            <td class="sBar"></td>
                            <td class="s1" width="79"> �߽Ź�ȣ </td>
                            <td class="sBar"></td>
                            <td  class="s1">�߼۹���</td>
                            <td class="sBar"></td>
                            <td width="55"  class="s1">�߼۰Ǽ�</td>
                            <td class="sBar"></td>
                            <td width="55"  class="s1"">�����Ǽ�</td>
                            <td class="sBar"></td>
                            <td width="55"  class="s1">���аǼ�</td>
                          </tr>
                          <tr> 
                            <td colspan="15" class="lbg3"></td>
                          </tr>
                          <tr> 
                            <td width="69" class="s2Center">${rsRscSMSStatus.code_name}</td>
                            <td class="sBar"></td>
                            <td class="s2Center" width="109">${loti:dateFormatSend(rsRscSMSStatus.send_dttm)}</td>
                            <td class="sBar"></td>
                            <td width="49" class="s2Center">${rsRscSMSStatus.from_name}</td>
                            <td class="sBar"></td>
                            <td class="s2Center" width="79">${loti:phoneFormat(rsRscSMSStatus.from_tel)}</td>
                            <td class="sBar"></td>
                            <td  class="s2">${rsRscSMSStatus.msg}</td>
                            <td class="sBar"></td>
                            <td width="55"  class="s2Center">${rsRscSMSStatus.chk_cnt}</td>
                            <td class="sBar"></td>
                            <td width="55"  class="s2Center">${rsRscSMSStatus.ok_cnt}</td>
                            <td class="sBar"></td>
                            <td width="55"  class="s2Center">${rsRscSMSStatus.fal_cnt}</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                  <!--�˻� ���̺� ��-->
                </td>
              </tr>
              <tr> 
                <td height="15">&nbsp; </td>
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
                            <td class="t1" width="49">����</td>
                            <td class="sBg"></td>
                            <td class="t1" width="59">����</td>
                            <td class="sBg"></td>
                            <td class="t1" width="99">�޴���ȭ��ȣ</td>
                            <td class="sBg"></td>
                            <td class="t1">�߼۹���</td>
                            <td class="sBg"></td>
                            <td class="t1" width="59">���</td>
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
                              <!--����Ʈ ����-->
																<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
																<c:set var="no" scope="request" value="1"/>
																<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0"> 
																<c:forEach var="rsinfoRscSMSStatusList" items="${rsinfoRscSMSStatusList}" varStatus="i">
																	<!-- �� ��� -->
																	<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
																	<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
                                  <tr class="${lineBg}"> 
                                    <td class="t2" width="49">${no}</td>
                                    <td class="sBg"></td>
                                    <td class="t2" width="59"><c:out value="${rsinfoRscSMSStatusList.to_name}"/></td>
                                    <td class="sBg"></td>
                                    <td class="t2" width="99">${loti:phoneFormat(rsinfoRscSMSStatusList.to_tel)}</td>
                                    <td class="sBg"></td>
                                    <td class="t3">&nbsp;${rsinfoRscSMSStatusList.msg}</td>
                                    <td class="sBg"></td>
				                            <td class="t1" width="59">${rsinfoRscSMSStatusList.chk_name}</td>
				                            <td width="17" class="sBg"></td>
                                  </tr>
                                  <tr><td class="lbg3" colspan="11"></td></tr>
																	<c:set var="no" scope="request" value="${no + 1}"/>
																	</c:forEach>
																	<c:if test="${no==1}">
																		<tr class="tbg3" height="21"><td class="t2" colspan="99">��ȸ�� �����Ͱ� �����ϴ�.</td></tr>
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
                      <td align="right"><img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" alt="���" align="absmiddle" onclick="document.location.href=document.referrer;" style="cursor:hand" /></td>
                    </tr>
                  </table>
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
<script type="text/javascript">
<!--
	tresize(200);
//-->
</script>