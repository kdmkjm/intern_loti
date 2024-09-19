<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>������ȸ - ������ȸ(���̹�)</title>
<link rel="stylesheet" href='<html:rewrite page="/style/main.css"/>' type="text/css" />
</head>
<body>
<table width="650" border="0" cellspacing="5" cellpadding="0" height="470" bgcolor="#E7E7E7">
  <tr> 
    <td valign="top"> 
      <table width="640" border="0" cellspacing="1" cellpadding="0" height="460" bgcolor="#D1D1D1">
        <tr> 
          <td bgcolor="#FFFFFF" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/edu/title_06-3.gif"/>' width="194" height="42" alt="������ȸ - ������ȸ(���̹�)" /></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td> 
                  <table width="620" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr> 
                      <td valign="top" height="360"> 
                        <table width="620" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="25" class="p1" align="center">${rsExtCrs_Course.coursename}</td>
                          </tr>
                          <tr> 
                            <td> 
                              <!--������ȸ ���̺� ����-->
                              <table width="620" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8" align="center">
                                <tr> 
                                  <td class="pt1" width="98">��������</td>
                                  <td class="pt2None"> 
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td class="pt2">${rsExtCrs_Course.crstype}</td>
                                        <td class="sBg"></td>
                                        <td class="pt1" width="98">�����ð�</td>
                                        <td class="sBg"></td>
                                        <td class="pt2">${rsExtCrs_Course.apvhour}�ð�(${rsExtCrs_Course.chptcount}����)</td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr> 
                                  <td class="pt1" width="98">������ǥ</td>
                                  <td class="pt2Left" style="padding-left:3px">${rsExtCrs_Course.eduobjectives}</td>
                                </tr>
                                <tr> 
                                  <td class="pt1" width="98">�������</td>
                                  <td class="pt2Left" style="padding-left:3px">${rsExtCrs_Course.eduway}</td>
                                </tr>
                                <tr> 
                                  <td class="pt1" width="98">�����Ⱓ</td>
                                  <td class="pt2None"> 
                                    <!--�����Ⱓ ���̺� ����-->
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td class="pt3" width="79"><fmt:formatNumber value="${fn:substring(rsExtCrs_Course.coursecode,10,12)}" pattern="#,##0"/>��</td>
                                        <td class="sBg"></td>
                                        <td class="pt2Left" style="padding-left:3px">������û�Ⱓ : ${rsExtCrs_Course.reqfrom} ~ ${rsExtCrs_Course.reqto}</td>
                                        <td class="sBg"></td>
                                        <td class="pt2Left" width="219" style="padding-left:3px">�н��Ⱓ : ${rsExtCrs_Course.edufrom} ~ ${rsExtCrs_Course.eduto}</td>
                                      </tr>
                                    </table>
                                    <!--�����Ⱓ ���̺� ��-->
                                  </td>
                                </tr>
                                <tr> 
                                  <td class="pt1" width="98">�������<br>�� ��</td>
                                  <td class="pt2">${rsExtCrs_Course.edutarget}/ ${rsExtCrs_Course.educount}�� x 3ȸ</td>
                                </tr>
                                <tr> 
                                  <td class="pt1" width="98">��������</td>
                                  <td class="pt2None"> 
                                    <!--�������� ���̺� ����-->
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td class="pt3" width="79px">�� ��</td>
                                        <td class="sBg"></td>
                                        <td class="pt3">�� �� �� ��</td>
                                      </tr>
																			<c:forEach var="subjectList" items="${rsExtCrs_SubjList}" >
	                                      <tr> 
	                                        <td class="lbg3" colspan="3"></td>
	                                      </tr>
																			  <tr> 
	                                        <td class="pt2" width="79px">${subjectList.subjname}</td>
	                                        <td class="sBg"></td>
	                                        <td class="pt2Left">��&nbsp;${subjectList.educontents}</td>
                                      	</tr>
																			</c:forEach>                                      
                                    </table>
                                    <!--�������� ���̺� ��-->
                                  </td>
                                </tr>
                                <tr> 
                                  <td class="pt1" width="98">�򰡳���</td>
                                  <td class="pt2None"> 
                                    <!--�����Ⱓ ���̺� ����-->
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                      	<td width="50%">
                                      		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      			<tr>
			                                        <td class="pt3" width="79">����</td>
			                                        <td class="sBg"></td>
			                                        <td class="pt3" width="79">��</td>
			                                        <td class="sBg"></td>
			                                        <td class="pt3">�̼�����</td>
																						</tr>
			                                      <tr> 
			                                        <td class="lbg3" colspan="5"></td>
			                                      </tr>
																						<tr>
			                                        <td class="pt2" width="79">${rsExtCrs_Course.cyberprgsrate}%</td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2" width="79">${rsExtCrs_Course.cyberminhour}%</td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2Left" style="padding-left:3px">${rsExtCrs_Course.cyberfinbase}</td>
																						</tr>
			                                      <tr> 
			                                        <td class="lbg3" colspan="5"></td>
			                                      </tr>
                                      			<tr>
			                                        <td class="pt3" width="79">�̼��뺸</td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2Left" colspan="3" style="padding-left:3px">${rsExtCrs_Course.cyberfinnotice}</td>
																						</tr>
																					</table>
																				</td>
                                      </tr>
                                    </table>
                                    <!--�����Ⱓ ���̺� ��-->
                                  </td>
                                </tr>
                              </table>
                              <!--������ȸ ���̺� ��-->
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td> 
                        <!--�ϴ� ��ư-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="28">
                          <tr valign="bottom"> 
                            <td align="right"><img src='<html:rewrite page="/images/board/btn_close.gif"/>' width="57" height="25" align="absmiddle" alt="�ݱ�" onclick="window.close()" style="cursor:pointer"/></td>
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
    </td>
  </tr>
</table>
</body>
</html>