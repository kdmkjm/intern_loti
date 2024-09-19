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
<title>������ȸ - ������ȸ</title>
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
                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/edu/title_06-2.gif"/>' width="154" height="42" alt="������ȸ - ������ȸ" /></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td> 
                  <table width="620" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr> 
                      <td valign="top"> 
                        <table width="620" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="25" class="p1" align="center">${rsExtCrs_Course.coursename}</td>
                          </tr>
                          <tr> 
                            <td> 
                              <!--������ȸ ���̺� ����-->
                              <table width="620" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8" align="center">
                                <tr> 
                                  <td class="pt1" width="98">������ǥ</td>
                                  <td class="pt2Left" style="padding-left:3px">${rsExtCrs_Course.eduobjectives}</td>
                                </tr>
                                <tr> 
                                  <td class="pt1" width="98">�����Ⱓ</td>
                                  <td class="pt2Left">���� <fmt:formatNumber value="${fn:substring(rsExtCrs_Course.coursecode,10,12)}" pattern="##"/>�� : ${rsExtCrs_Course.edufrom} ~ ${rsExtCrs_Course.eduto}(${rsExtCrs_Course.daycount}��) ${rsExtCrs_Course.termdesc }</td>
                                </tr>
                                <tr> 
                                  <td class="pt1" width="98">�������<br> �� �ο�</td>
                                  <td class="pt2Left">��${rsExtCrs_Course.edutarget}, �⺰ ��${rsExtCrs_Course.educount}��</td>
                                </tr>
                                <tr> 
                                  <td class="pt1" width="98">������</td>
                                  <td class="pt2None"> 
                                    <!--������ ���̺� ����-->
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td class="pt3">�� ��</td>
                                        <td class="sBg"></td>
                                        <td class="pt3">��</td>
                                        <td class="sBg"></td>
                                        <td class="pt3">�� �� �� ��</td>
                                        <td class="sBg"></td>
                                        <td class="pt3">�� �� �� ��</td>
                                        <td class="sBg"></td>
                                        <td class="pt3">���� �� ��Ÿ</td>
                                      </tr>
                                      <tr> 
                                        <td class="lbg3" colspan="9"></td>
                                      </tr>
                                      <tr> 
                                        <td class="pt2">�����ð�<br>(%)</td>
                                        <td class="sBg"></td>
                                        <c:set value="${rsExtCrs_Course.typecnt1+rsExtCrs_Course.typecnt2+rsExtCrs_Course.typecnt3}" var="typetcnt"></c:set>
                                        <td class="pt2"><fmt:formatNumber value="${typetcnt}" pattern="#,##0"/><br>(100%)</td>
                                        <td class="sBg"></td>
                                        <td class="pt2"><fmt:formatNumber value="${rsExtCrs_Course.typecnt1}" pattern="#,##0"/><br><c:out value="(${rsExtCrs_Course.typeRate1}%)"/></td>
                                        <td class="sBg"></td>
                                        <td class="pt2"><fmt:formatNumber value="${rsExtCrs_Course.typecnt2}" pattern="#,##0"/><br><c:out value="(${rsExtCrs_Course.typeRate2}%)"/></td>
                                        <td class="sBg"></td>
                                        <td class="pt2"><fmt:formatNumber value="${rsExtCrs_Course.typecnt3}" pattern="#,##0"/><br><c:out value="(${100-rsExtCrs_Course.typeRate1-rsExtCrs_Course.typeRate2}%)"/></td>
                                      </tr>
                                    </table>
                                    <!--������ ���̺� ��-->
                                  </td>
                                </tr>
                                <tr> 
                                  <td class="pt1" width="98">��������</td>
                                  <td class="pt2None"> 
                                    <!--�������� ���̺� ����-->
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td class="pt3" rowspan="3">������</td>
                                        <td class="sBg"></td>
                                        <td class="pt3" colspan="7">�� �� �� �� (%)</td>
                                      </tr>
                                      <tr> 
                                        <td class="sBg"></td>
                                        <td class="lbg3" colspan="7"></td>
                                      </tr>
                                      <tr> 
                                        <td class="sBg"></td>
                                        <td class="pt3">��</td>
                                        <td class="sBg"></td>
                                        <td class="pt3">��  ��  ��</td>
                                        <td class="sBg"></td>
                                        <td class="pt3">���� �н�</td>
                                        <td class="sBg"></td>
                                        <td class="pt3">��        Ÿ</td>
                                      </tr>
                                      <tr> 
                                        <td class="lbg3" colspan="9"></td>
                                      </tr>
                                      <tr> 
                                        <td class="pt2">�� ��</td>
                                        <td class="sBg"></td>
                                        <c:set var="waytcnt" value="${rsExtCrs_Course.waycnt1+rsExtCrs_Course.waycnt2+rsExtCrs_Course.waycnt3}"></c:set>
                                        <td class="pt2"><fmt:formatNumber value="${waytcnt}" pattern="#,##0"/><br>
                                          (100%)</td>
                                        <td class="sBg"></td>
                                        <td class="pt2"><fmt:formatNumber value="${rsExtCrs_Course.waycnt1}" pattern="#,##0"/><br><c:out value="(${rsExtCrs_Course.wayRate1}%)"/></td>
                                        <td class="sBg"></td>
                                        <td class="pt2"><fmt:formatNumber value="${rsExtCrs_Course.waycnt2}" pattern="#,##0"/><br><c:out value="(${rsExtCrs_Course.wayRate2}%)"/></td>
                                        <td class="sBg"></td>
                                        <td class="pt2"><fmt:formatNumber value="${rsExtCrs_Course.waycnt3}" pattern="#,##0"/><br><c:out value="(${100-rsExtCrs_Course.wayRate1-rsExtCrs_Course.wayRate2}%)"/></td>
                                      </tr>                                        		
                                      <c:forEach var="sublist" items="${rsExtCrs_SubjList}">
                                   			<c:if test="${sublist.subjtype eq '00001'}">
                                   				<c:set var="type1way1" value="${type1way1+sublist.lechour}"></c:set>
                                   				<c:set var="type1way2" value="${type1way2+sublist.pathour}"></c:set>
																					<c:set var="type1way3" value="${type1way3+sublist.etchour}"></c:set>	                                 				
                                   			</c:if>
                                   			<c:if test="${sublist.subjtype eq '00002'}">
                                   				<c:set var="type2way1" value="${type2way1+sublist.lechour}"></c:set>
                                   				<c:set var="type2way2" value="${type2way2+sublist.pathour}"></c:set>
																					<c:set var="type2way3" value="${type2way3+sublist.etchour}"></c:set>	
                                   			</c:if>
                                   			<c:if test="${sublist.subjtype eq '00003'}">
                                   				<c:set var="type3way1" value="${type3way1+sublist.lechour}"></c:set>
                                   				<c:set var="type3way2" value="${type3way2+sublist.pathour}"></c:set>
																					<c:set var="type3way3" value="${type3way3+sublist.etchour}"></c:set>	
                                   			</c:if>                                      			
                                      </c:forEach>                                                                       
                                      <c:forEach var="subjectList" items="${rsExtCrs_SubjList}" varStatus="i" > 
                                      	<c:if test="${subjectList.subjtype ne pretsubjtype }">
                                      	  <tr> 
		                                        <td class="lbg3" colspan="9"></td>
		                                      </tr>  
                                      	  <c:if test="${subjectList.subjtype eq '00001'}">
			                                   		<tr> 
			                                        <td class="pt2">(�Ҿ�о�)</td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2"><fmt:formatNumber value="${type1way1+type1way2+type1way3}" pattern="#,##0"/></td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2">${type1way1}</td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2">${type1way2}</td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2">${type1way3}</td>
			                                      </tr>
		                                     	</c:if>  
                                      	  <c:if test="${subjectList.subjtype eq '00002'}">
			                                   		<tr> 
			                                        <td class="pt2">(�����о�)</td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2"><fmt:formatNumber value="${type2way1+type2way2+type2way3}" pattern="#,##0"/></td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2">${type2way1}</td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2">${type2way2}</td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2">${type2way3}</td>
			                                      </tr>
		                                     	</c:if>  
		                                      <c:if test="${subjectList.subjtype eq '00003'}">
			                                   		<tr> 
			                                        <td class="pt2">(�����ױ�Ÿ)</td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2"><fmt:formatNumber value="${type3way1+type3way2+type3way3}" pattern="#,##0"/></td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2">${type3way1}</td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2">${type3way2}</td>
			                                        <td class="sBg"></td>
			                                        <td class="pt2">${type3way3}</td>
			                                      </tr>
		                                     	</c:if>  
		                                      <tr> 
		                                        <td class="lbg3" colspan="9"></td>
		                                      </tr>                                       	
                                      	</c:if>                                     
                                      	<c:if test="${subjectList.subjtype eq '00001'}">
                                      		<tr> 
		                                      	<td class="pt2Left">��${subjectList.subjname}</td>
		                                      	<td class="sBg"></td>
			                                      <td class="pt2"><fmt:formatNumber value="${subjectList.lechour + subjectList.pathour + subjectList.etchour}" pattern="#,##0"/></td>
			                                      <td class="sBg"></td>
			                                      <td class="pt2">${subjectList.lechour}</td>
			                                      <td class="sBg"></td>
			                                      <td class="pt2">${subjectList.pathour}</td>
			                                      <td class="sBg"></td>
			                                      <td class="pt2">${subjectList.etchour }</td>				                                        
		                                      </tr>
                                      	</c:if>
                                      	<c:if test="${subjectList.subjtype eq '00002'}">
		                                      <tr> 
		                                      	<td class="pt2Left">��${subjectList.subjname}</td>
		                                      	<td class="sBg"></td>
			                                      <td class="pt2"><fmt:formatNumber value="${subjectList.lechour + subjectList.pathour + subjectList.etchour}" pattern="#,##0"/></td>
			                                      <td class="sBg"></td>
			                                      <td class="pt2">${subjectList.lechour}</td>
			                                      <td class="sBg"></td>
			                                      <td class="pt2">${subjectList.pathour}</td>
			                                      <td class="sBg"></td>
			                                      <td class="pt2">${subjectList.etchour }</td>		
		                                      </tr>                                      	
                                      	</c:if>   
                                      	<c:if test="${subjectList.subjtype eq '00003'}">
		                                      <tr> 
		                                      	<td class="pt2Left">��${subjectList.subjname}</td>
		                                      	<td class="sBg"></td>
			                                      <td class="pt2"><fmt:formatNumber value="${subjectList.lechour + subjectList.pathour + subjectList.etchour}" pattern="#,##0"/></td>
			                                      <td class="sBg"></td>
			                                      <td class="pt2">${subjectList.lechour}</td>
			                                      <td class="sBg"></td>
			                                      <td class="pt2">${subjectList.pathour}</td>
			                                      <td class="sBg"></td>
			                                      <td class="pt2">${subjectList.etchour }</td>	
		                                      </tr>                                      	
                                      	</c:if>   
                                      	<c:set var="pretsubjtype" value="${subjectList.subjtype}"></c:set>
                                      </c:forEach>
                                    </table>
                                    <!--�������� ���̺� ��-->
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
                    			<tr><td height="10"></td></tr>
                          <tr valign="bottom"> 
                            <td align="right"><img src='<html:rewrite page="/images/board/btn_close.gif"/>' width="57" height="25" align="absmiddle" alt="�ݱ�" onclick="window.close()" style="cursor:pointer"/></td>
                          </tr>
                    			<tr><td height="10"></td></tr>
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
</html>