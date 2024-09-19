<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���� �̸�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link rel="stylesheet" href='<html:rewrite page="/style/main.css"/>' type="text/css" />
<script language="JavaScript">
	function checkEtc()
	{
		var job = document.all.jobcode.value;
		if(job == "��Ÿ")
			document.all.cellEtc.innerHTML = "<input type='etc' name='etc' id='etc' style='width:125px;'>";
		else
			document.all.cellEtc.innerHTML = "";
	}
	</script>
</head>
<body>
<html:form action="tstSurvey.act?task=preview" onsubmit="return false">
<table width="650" border="0" cellspacing="5" cellpadding="0" height="490" bgcolor="#E7E7E7">
  <tr> 
    <td valign="top"> 
      <table width="640" border="0" cellspacing="1" cellpadding="0" height="480" bgcolor="#D1D1D1">
        <tr> 
          <td bgcolor="#FFFFFF" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/poll/title_02-3.gif"/>' width="118" height="42" alt="���� �̸�����" /></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td> 
                  <table width="617" border="0" cellspacing="0" cellpadding="0" align="center">
                  <fmt:parseDate var="fromdate" value="${rsTst_SurveyPreview.fromdate}" pattern="yyyy-mm-dd"></fmt:parseDate>
                  <fmt:parseDate var="todate" value="${rsTst_SurveyPreview.todate}" pattern="yyyy-mm-dd"></fmt:parseDate>
                    <tr> 
                      <td> 
                        <!--�������� ���̺� ����-->
                        <table width="617" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8" align="center">
                          <tr> 
                            <td class="pt4" width="98">��������</td>
                            <td class="pt2Left">
                            	&nbsp;${rsTst_SurveyPreview.title }<br>${loti:convertHtmlBrNbsp(rsTst_SurveyPreview.summary) } 
                          	</td>
                          </tr>
                          <tr> 
                            <td class="pt4" width="98">�����Ⱓ</td>
                            <td class="pt2Left">
                            	<c:if test="${fromdate != null}">
                            		&nbsp;<fmt:formatDate value="${fromdate}" pattern="yyyy.mm.dd"/> ~ <fmt:formatDate value="${todate}" pattern="yyyy.mm.dd"/>
                            	</c:if>
                            	<c:if test="${fromdate == null}">
                            		&nbsp;���
                            	</c:if> 
                            </td>
                          </tr>
                        </table>
                        <!--�������� ���̺� ��-->
                      </td>
                    </tr>
                    <tr> 
                      <td> 
                        <!--���� ���� ���̺� ����-->
                        <table width="617" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td> 
                              <table width="617" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_01.gif"/>' width="5" height="5" alt=""></td>
                                  <td width="607" height="5" bgcolor="#F8F2E6"></td>
                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_02.gif"/>' width="5" height="5" alt=""></td>
                                </tr>
                                <tr bgcolor="#F8F2E6"> 
                                  <td width="5"></td>
                                  <td width="607" bgcolor="#F8F2E6" class="pHead"> 
                                  	${loti:convertHtmlBrNbsp(rsTst_SurveyPreview.headtext) }
                                  </td>
                                  <td width="5"></td>
                                </tr>
                                <tr> 
                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_03.gif"/>' width="5" height="5" alt=""></td>
                                  <td width="607" height="5" bgcolor="#F8F2E6"></td>
                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_04.gif"/>' width="5" height="5" alt=""></td>
                                </tr>
                              </table>
                            </td>
                          </tr>  
                          <tr> 
                            <td height="10"></td>
                          </tr>                      
                          <c:forEach var="itemList" items="${rsTst_SurveyPreview.itemlist}">
                          	<c:if test="${itemList.itemgroup ne null}">
                          	  <tr> 
                                <td><img src='<html:rewrite page="/images/poll/view_t_bg_top.gif"/>' width="617" height="5"></td>
                              </tr>
                              <tr> 
                                <td class="pTitle1">${loti:convertHtmlBrNbsp(itemList.itemgroup) }</td>
                              </tr>
                              <tr> 
                                <td height="8" valign="top"><img src='<html:rewrite page="/images/poll/view_t_bg_bottom.gif"/>' width="617" height="5"></td>
                              </tr>
                          	</c:if>
                         		<tr> 
                              <td><img src='<html:rewrite page="/images/poll/view_t_bg2_top.gif"/>' width="617" height="5"></td>
                            </tr>
                            <tr> 
                              <td class="pTitle2">${itemList.reqseq }.${itemList.itemcontents }</td>
                            </tr>
                            <tr> 
                              <td height="8" valign="top"><img src='<html:rewrite page="/images/poll/view_t_bg2_bottom.gif"/>' width="617" height="5"></td>
                            </tr>                           	
	                          <tr>                          
		                          <c:choose>
		                          	<c:when test="${itemList.replytype == 1}">
		                          		<td> 
	                              		<table width="617" border="0" cellspacing="0" cellpadding="0">	 
						                          <c:forEach var="examList" items="${itemList.examlist}">
						                          	<c:if test="${itemList.replytype eq 1}">
							                          	<tr> 
							                          		<td width="45" class="pR"> 
							                          			${examList.examseq }.
						                                  		<!-- <input type="radio" name="examseq" value="${examList.examseq}">
						                                  		 -->
						                                	</td>
						                                <td class="pt2Left">${examList.examcontents}</td>
						                            	</tr>
						                            	<tr> 
			                                  		<td class="poL" colspan="2"></td>
			                                		</tr>
						                          	</c:if>                         	
						                          </c:forEach>
						                          <c:if test="${itemList.etcflag eq 'Y'}">
							                          <tr>
							                         		<td width="45" class="pR"> 
							                              <input type="radio" name="examseq" value="6">
							                            </td>
						                            	<td class="pt2Left">��Ÿ&nbsp;<input type="text" name="other" class="style6" style="width:500;"></td>				                            
							                          </tr>
						                          </c:if>
						                        </table>
						                      </td>				                                                  	
				                 				</c:when>
		                          	<c:when test="${itemList.replytype == 2}">
		                          		<td> 
	                              		<table width="617" border="0" cellspacing="0" cellpadding="0">		                          	
																			<c:forEach var="examList" items="${itemList.examlist}">
						                          	<c:if test="${itemList.replytype eq '2'}">
						                          		<tr>
							                          		<td width="45" class="pR"> 
						                                  <input type="checkbox" name="examseq" value="${examList.examseq}">
						                                </td>
						                                <td class="pt2Left">${examList.examcontents}</td>
						                            	</tr>
						                            	<tr> 
			                                  		<td class="poL" colspan="2"></td>
			                                		</tr>			                            	
						                          	</c:if>	                          	
						                          </c:forEach> 
						                          <c:if test="${itemList.etcflag eq 'Y'}">                         	
					                          		<tr>
					                          			<td width="45" class="pR"> 
					                                	<input type="checkbox" name="examseq" value="6">
					                              	</td>
					                              	<td class="pt2Left">��Ÿ&nbsp;<input type="text" name="other" class="style6" style="width:500;"></td>
					                              </tr>
					                            </c:if>
				                           	</table>
						                      </td>	
	                          		</c:when>
		                          	<c:when test="${itemList.replytype > 4}">
			                            <td> 
			                              <table width="560" border="0" cellspacing="0" cellpadding="0" align="center" height="35">
			                                <tr> 					                          		
																				<td width="15"> 
			                                    <input type="radio" name="examseq" value="1">
			                                  </td>
			                                  <td class="pt2Left" width="65">�ſ츸��</td>
			                                  <td width="15"> 
			                                    <input type="radio" name="examseq" value="2">
			                                  </td>
			                                  <td class="pt2Left" width="65">����</td>
			                                  <td width="15"> 
			                                    <input type="radio" name="examseq" value="3">
			                                  </td>
			                                  <td class="pt2Left" width="65">����</td>
			                                  <td width="15"> 
			                                    <input type="radio" name="examseq" value="4">
			                                  </td>
			                                  <td class="pt2Left" width="65">�Ҹ�</td>
			                                  <td width="15"> 
			                                    <input type="radio" name="examseq" value="5">
			                                  </td>
			                                  <td class="pt2Left">�ſ�Ҹ���</td>
			                                </tr>	    
			                          		</table>
			                        		</td>
		                          	</c:when>
		                          	<c:when test="${itemList.replytype == 3}">
			                            <td> 
			                              <input type="text" name="textarea3" style="width:99%;">
			                            </td>                          	
		                          	</c:when>		                          	
		                          	<c:otherwise>
			                            <td> 
			                              <textarea name="textarea3" style="width:99%;" rows="3"></textarea>
			                            </td>                          	
		                          	</c:otherwise>
				                      </c:choose>
				                      </tr>
				                      <tr> 
                            		<td height="10"></td>
                          		</tr> 
	                          </c:forEach> 			                          
	                          <tr> 
	                            <td height="10"></td>
	                          </tr>
	                          <tr> 
	                            <td> 
	                              <table width="617" border="0" cellspacing="0" cellpadding="0">
	                                <tr> 
	                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_01.gif"/>' width="5" height="5" alt=""></td>
	                                  <td width="607" height="5" bgcolor="#F8F2E6"></td>
	                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_02.gif"/>' width="5" height="5" alt=""></td>
	                                </tr>
	                                <tr bgcolor="#F8F2E6"> 
	                                  <td width="5"></td>
	                                  <td width="607" bgcolor="#F8F2E6" class="pHead">
	                                  	${loti:convertHtmlBrNbsp(rsTst_SurveyPreview.tailtext) }
																		</td>
	                                  <td width="5"></td>
	                                </tr>
	                                <tr> 
	                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_03.gif"/>' width="5" height="5" alt=""></td>
	                                  <td width="607" height="5" bgcolor="#F8F2E6"></td>
	                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_04.gif"/>' width="5" height="5" alt=""></td>
	                                </tr>
	                              </table>
	                            </td>
	                          </tr>
	                          <tr> 
                            	<td height="10"></td>
                          	</tr>
                     			</table>
                        <!--���� ���� ���̺� ��-->
                      	</td>
                    	</tr>
                    	<tr> 
	                      <td> 
	                        <!--���������� ���� ���̺� ����-->
	                        <table width="617" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
	                        	<tr> 
	                            <td class="pt1" width="89">����</td>
	                            <td class="pt2Left" width="218">
   															<table width="100%" border="0" cellspacing="0" cellpadding="0">
   																<tr>
   																	<td width="80">
   																		&nbsp;<html:select property="jobcode" onchange="checkEtc()">
				                            		<option value="" selected>����</option>
				                            		<html:optionsCollection name="jobCode" property="beanCollection"/>
			   															</html:select>
   																	</td>
   																	<td width="138" id="cellEtc"></td>
   																</tr>
   															</table>
	                            </td>
	                            <td class="pt1" width="89">����</td>
	                            <td class="pt2Left" width="219"> 
	                            	&nbsp;<select style="width:80px;">
                                	<option value="4" selected>4��</option>
                                	<option value="5" >5��</option>
                                	<option value="6" >6��</option>
                                	<option value="7" selected="selected">7��</option>
                                	<option value="8" >8��</option>
                                	<option value="9" >9��</option>
                                	<option value="10">10��</option>
                              	</select>
	                            </td>
	                          </tr>
	                          <tr>
	                            <td class="pt1" width="89">����</td>
	                            <td class="pt2Left"> 
	                              &nbsp;<input type="radio" name="radio" value="0" checked>���� 
	                              <input type="radio" name="radio" value="1">����
	                            </td>
	                            <td class="pt1" width="89">�ѱٹ����</td>
	                            <td class="pt2Left"> 
	                              &nbsp;<input type="text" name="workday" style="width:60px;">��
	                            </td>
	                          </tr>
	                        </table>
	                        <!--���������� ���� ���̺� ��-->
	                      </td>
	                    </tr>
	                    <tr> 
	                      <td> 
	                        <!--�ϴ� ��ư-->
	                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="45">
	                          <tr> 
	                            <td align="right"><img src='<html:rewrite page="/images/board/btn_close.gif"/>' width="57" height="25" align="absmiddle" alt="�ݱ�" onclick="self.close()" style="cursor:hand"/></td>
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
</html:form>
</body>
</html>
