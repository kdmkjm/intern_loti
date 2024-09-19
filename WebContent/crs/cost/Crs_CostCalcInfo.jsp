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
	//   윈도우 사이즈 변경 셋팅 코드
	tresize(240);
	}

	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}
	function ozReport(costyymm, times)
	{   //과정별교육비인쇄
	  	
	  	window.open('<html:rewrite page="/ozMenu.act"/>?report=pay&costyymm='+ costyymm +'&searchtimes=' + times,'popup', 'scrollbars = no, resizable = yes, menubar = no, width =710 height =550, status = yes');
	}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="교육비관리 - 계산" src="/images/operation/title_04.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                	<html:form action='crsCostCalc.act?task=list'>
                  <!--검색 테이블 시작-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="119" class="s1">회차 : ${times }</td>
														<td class="s1">처리년월 : ${fn:substring(costyymm, 0, 4)}-${fn:substring(costyymm, 4, 6)}</td>
                          </tr>                          
                        </table>
                      </td>
                    </tr>
                  </table>
                  <!--검색 테이블 끝-->
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
                  <!--테이블 헤더 시작-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="lbg"></td>
                      <td class="cbg"> 
                        <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
                       		<tr> 
                          	<td class="t1">
                            	<table width="100%" cellspacing="0" cellpadding="0">
                            		<tr>
			                            <td class="t1" colspan="3">과정</td>
			                         	</tr>
                            		<tr> 
                                  <td class="lbg3" colspan="3"></td>
                                </tr>
                            		<tr>
																	<td class="t1">과정명</td>
			                          	<td class="sBg"></td>                              		
			                          	<td class="t1" width="40">교육<br>기간</td>                          		
			                          </tr>
			                        </table>
			                      </td>
														<td class="sBg"></td>	
														<td class="t1" width="70">합계</td>
														<td class="sBg"></td>	
														<td class="t1" width="235">
                            	<table width="100%" cellspacing="0" cellpadding="0">
                            		<tr>
			                      			<td class="t1" width="235" colspan="9">교재대</td>
																</tr>
                            		<tr> 
                                  <td class="lbg3" colspan="9"></td>
                                </tr>	
                                <tr>
                          				<td class="t1" width="58">교육<BR>안내</td>
                          				<td class="sBg"></td>
                          				<td class="t1" width="58">원고료</td>
                          				<td class="sBg"></td> 
                          				<td class="t1" width="58">공통<BR>교재</td>   
                          				<td class="sBg"></td>
                          				<td class="t1" width="58">부교재</td>                                
                                </tr>
                              </table>
                            </td>		                      			
			                      <td class="sBg"></td>
														<td class="t1" width="188">
                            	<table width="100%" cellspacing="0" cellpadding="0">
                            		<tr>			                      			                        
                            			<td class="t1" width="188" colspan="5">강사수당</td>
                            		</tr>
																<tr> 
                                  <td class="lbg3" colspan="5"></td>
                                </tr>	
                                <tr>
																	<td class="t1" width="70">수당</td>
			                          	<td class="sBg"></td>
			                          	<td class="t1" width="58">원거리<br>여비</td>
			                          	<td class="sBg"></td> 
			                          	<td class="t1" width="58">출제<br>수당</td>   
			                          </tr>
			                        </table>
			                      </td>                                                      			
                            <td class="sBg"></td>
														<td class="t1" width="117">
															<table width="100%" cellspacing="0" cellpadding="0">
                            		<tr>			                      			                        
                            			<td class="t1" width="117" colspan="3">기타경비</td>
                            		</tr>
																<tr> 
                                  <td class="lbg3" colspan="3"></td>
                                </tr>	
                                <tr>
																	<td class="t1" width="58" height="33">임차료</td>
			                          	<td class="sBg"></td>
			                          	<td class="t1" width="58">기타</td> 
			                          </tr>
			                        </table>
														</td>         
														<td class="t1" width="17"></td>
                          </tr>                        		                          
                        </table>
                      </td>
                      <td class="lbg"></td>
                    </tr>
                  </table>
                  <!--테이블 헤더 시작-->
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
                              <!--리스트 시작-->
                              <div id="mainList" style="width:746px;  overflow-y:scroll ;overflow-x:hidden"> 
                                <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
                                  <c:forEach var="costCalcList" items="${rsCrs_CostCalcInfoList}" varStatus="i">
                                  	<fmt:parseDate var="edufrom" value="${costCalcList.edufrom}" pattern="yyyymmdd"></fmt:parseDate>
                                  	<fmt:parseDate var="eduto" value="${costCalcList.eduto}" pattern="yyyymmdd"></fmt:parseDate>
                                  	<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
																		<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
																		<tr class="${lineBg}">
	                                    <td class="t3">&nbsp;${costCalcList.coursename}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="40"><fmt:formatDate value="${edufrom}" pattern="mm.dd"/>~<fmt:formatDate value="${eduto}" pattern="mm.dd"/> </td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="70"><fmt:formatNumber value="${costCalcList.totalcost}" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="58"><fmt:formatNumber value="${costCalcList.txtbookcostIntro}" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>		 
	                                    <td class="t4" width="58"><fmt:formatNumber value="${costCalcList.txtbookcostMsct}" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="58"><fmt:formatNumber value="${costCalcList.txtbookcostCommon}" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="58"><fmt:formatNumber value="${costCalcList.txtbookcostAxbook}" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="70"><fmt:formatNumber value="${costCalcList.profcostPay}" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>		 
	                                    <td class="t4" width="58"><fmt:formatNumber value="${costCalcList.profcostTravel}" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="58"><fmt:formatNumber value="${costCalcList.profcostQuestion}" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="58"><fmt:formatNumber value="${costCalcList.imchacost}" pattern="#,##0"/>&nbsp;</td>		
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="58"><fmt:formatNumber value="${costCalcList.etccost}" pattern="#,##0"/>&nbsp;</td>		                                    	                                    
	                                  </tr>
		                                <tr> 
	                                    <td class="lbg3" colspan="23"></td>
	                                  </tr>
		                              	<c:set value="${i.count}" var="count"></c:set>
		                              	<c:set value="${total_cost+costCalcList.totalcost}" var="total_cost"></c:set>
		                              	<c:set value="${total_intro+costCalcList.txtbookcostIntro }" var="total_intro"></c:set>
		                              	<c:set value="${total_msct+costCalcList.txtbookcostMsct }" var="total_msct"></c:set>
		                              	<c:set value="${total_common+costCalcList.txtbookcostCommon }" var="total_common"></c:set>
		                              	<c:set value="${total_axbook+costCalcList.txtbookcostAxbook }" var="total_axbook"></c:set>
		                              	<c:set value="${total_pay+costCalcList.profcostPay }" var="total_pay"></c:set>
		                              	<c:set value="${total_travel+costCalcList.profcostTravel }" var="total_travel"></c:set>
		                              	<c:set value="${total_question+costCalcList.profcostQuestion }" var="total_question"></c:set>                  	
		                              	<c:set value="${total_imchacost+costCalcList.imchacost }" var="total_imchacost"></c:set>              	
		                              	<c:set value="${total_etccost+costCalcList.etccost }" var="total_etccost"></c:set>
                                  </c:forEach>
                                </table>                               
                              </div>
                              <!--리스트 끝-->
                              <c:if test="${count>0}">
                              	<table width="746" border="0" cellspacing="0" cellpadding="0">
                              		<tr>
                                    <td class="t2BgRed" colspan="2">합계</td>
                                    <td class="sBg"></td>
                                    <td class="t2BgRedR" width="70"><fmt:formatNumber value="${total_cost}" pattern="#,##0"/></td>
                                    <td class="sBg"></td>
                                    <td class="t2BgRedR" width="58"><fmt:formatNumber value="${total_intro}" pattern="#,##0"/></td>
                                    <td class="sBg"></td>		 
                                    <td class="t2BgRedR" width="58"><fmt:formatNumber value="${total_msct}" pattern="#,##0"/></td>
                                    <td class="sBg"></td>
                                    <td class="t2BgRedR" width="58"><fmt:formatNumber value="${total_common}" pattern="#,##0"/></td>
                                    <td class="sBg"></td>
                                    <td class="t2BgRedR" width="58"><fmt:formatNumber value="${total_axbook}" pattern="#,##0"/></td>
                                    <td class="sBg"></td>
                                    <td class="t2BgRedR" width="70"><fmt:formatNumber value="${total_pay}" pattern="#,##0"/></td>
                                    <td class="sBg"></td>		 
                                    <td class="t2BgRedR" width="58"><fmt:formatNumber value="${total_travel}" pattern="#,##0"/></td>
                                    <td class="sBg"></td>
                                    <td class="t2BgRedR" width="58"><fmt:formatNumber value="${total_question}" pattern="#,##0"/></td>
                                    <td class="sBg"></td>
                                    <td class="t2BgRedR" width="58"><fmt:formatNumber value="${total_imchacost}" pattern="#,##0"/></td>
                                    <td class="sBg"></td>
                                    <td class="t2BgRedR" width="75"><fmt:formatNumber value="${total_etccost}" pattern="#,##0"/>&nbsp;</td>
                                	</tr>	 	                                    	                                	
                              	</table>
                              </c:if>
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
                      <td align="right">
                      	<a href='<html:rewrite page="/crsCostCalc.act?task=list&year=${fn:substring(courseyymm,1,4)}"/>'><img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" align="absmiddle" alt="목록"/></a>
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
	tresize(240);
	searchList('${key}');

//-->
</script>
