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
	tresize(185);
	}

	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}
	function setCrs()
	{
		var searchCode = document.all.searchCourseCode.value;
		// type 값을 넘겨준다. (onlyCrs) 
		window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
  
  function doCostExcel()
	{
		var searchCourseCode = document.forms[0].searchCourseCode.value;
		document.getElementById("actionFrame").src = '<html:rewrite page="/crsCostCalc.act?task=excelCost&searchCourseCode='+searchCourseCode+'"/>'
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="교육비관리 - 과정별 교육비" src="/images/operation/title_04-2.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                	<html:form action="crsCostCalc.act?task=course">
                  <!--검색 테이블 시작-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="119" class="s1">과정</td>
                            <td class="sBar"></td>
													  <td class="s2" width="320"> 
													    <html:text property="searchCourseCode" style="width:80px;" maxlength="12" onkeydown="if(event.keyCode==13)setCrs();"/>&nbsp;
													    <html:text property="searchCourseName" style="width:220px" readonly="true"/>
													  </td>
													  <td class="s2">
													    <img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' alt="과정 연결" onClick="setCrs();" style="cursor:hand" align="absbottom">
													  </td>
                            <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="검색" onclick="document.forms[0].submit();" align="absbottom" style="cursor:hand"/></td>
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
                            <td class="t1Sub" colspan="5">과정</td>
                            <td class="sBg3"></td>
                            <td class="t1Sub" colspan="7">교재대</td>
                            <td class="sBg3"></td>
                            <td class="t1Sub" colspan="5">강사수당</td>
                            <td class="sBg3"></td>
                            <td class="t1Sub" colspan="3">기타</td>
                            <td class="t1Sub" width="17"></td>
                          </tr>
                          <tr> 
                            <td class="lbg5" colspan="99"></td>
                          </tr>
                          <tr> 
                            <td class="t1" width="44">기수</td>
                            <td class="sBg"></td>
                            <td class="t1">교육기간</td>
                            <td class="sBg"></td>
                            <td class="t1" width="75">합계</td>
                            <td class="sBg"></td>
                            <td class="t1" width="65">교육안내</td>
                            <td class="sBg"></td>
                            <td class="t1" width="55">원고료</td>
                            <td class="sBg"></td>
                            <td class="t1" width="55">공통교재</td>
                            <td class="sBg"></td>
                            <td class="t1" width="55">부교재</td>
                            <td class="sBg"></td>
                            <td class="t1" width="65">수당</td>
                            <td class="sBg"></td>
                            <td class="t1" width="60">원거리<br>여비</td>
                            <td class="sBg"></td>
                            <td class="t1" width="55">출제수당</td>
                            <td class="sBg"></td>
                            <td class="t1" width="55">임차료</td>
                            <td class="sBg"></td>
                            <td class="t1" width="55">기타<br>교육경비</td>
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
                            	<!-- 합계 시작-->
                            	<c:if test="${rsCrs_CostCourseTotalList != null}">
	                           		<table width="746" border="0" cellspacing="0" cellpadding="0">
																	<tr>
																	  <td class="t2BgRed">총계</td>
																	  <td class="sBg"></td>
																	  <td class="t2BgRedR" width="75"><fmt:formatNumber value="${rsCrs_CostCourseTotalList.totalcost }" pattern="#,##0"/>&nbsp;</td>
																	  <td class="sBg"></td>
																	  <td class="t2BgRedR" width="65"><fmt:formatNumber value="${rsCrs_CostCourseTotalList.txtbookcostIntro }" pattern="#,##0"/>&nbsp;</td>
																	  <td class="sBg"></td>
																	  <td class="t2BgRedR" width="55"><fmt:formatNumber value="${rsCrs_CostCourseTotalList.txtbookcostMsct }" pattern="#,##0"/>&nbsp;</td>
																	  <td class="sBg"></td>
																	  <td class="t2BgRedR" width="55"><fmt:formatNumber value="${rsCrs_CostCourseTotalList.txtbookcostCommon }" pattern="#,##0"/>&nbsp;</td>
																	  <td class="sBg"></td>
																	  <td class="t2BgRedR" width="55"><fmt:formatNumber value="${rsCrs_CostCourseTotalList.txtbookcostAxbook }" pattern="#,##0"/>&nbsp;</td>
																	  <td class="sBg"></td>
																	  <td class="t2BgRedR" width="65"><fmt:formatNumber value="${rsCrs_CostCourseTotalList.profcostPay }" pattern="#,##0"/>&nbsp;</td>
																	  <td class="sBg"></td>
																	  <td class="t2BgRedR" width="60"><fmt:formatNumber value="${rsCrs_CostCourseTotalList.profcostTravel }" pattern="#,##0"/>&nbsp;</td>
																	  <td class="sBg"></td>
																	  <td class="t2BgRedR" width="55"><fmt:formatNumber value="${rsCrs_CostCourseTotalList.profcostQuestion }" pattern="#,##0"/>&nbsp;</td>
																	  <td class="sBg"></td>
																	  <td class="t2BgRedR" width="55"><fmt:formatNumber value="${rsCrs_CostCourseTotalList.imchacost }" pattern="#,##0"/>&nbsp;</td>
																	  <td class="sBg"></td>
																	  <td class="t2BgRedR" width="72"><fmt:formatNumber value="${rsCrs_CostCourseTotalList.etccost }" pattern="#,##0"/>&nbsp;</td>
																	</tr>   
                                  <tr> 
                                    <td class="lbg3" colspan="99"></td>
                                  </tr>  
	                               </table>
	                             </c:if>
                               <!-- 합계 끝-->
                              <!--리스트 시작-->
                              <div id="mainList" style="width:746px;  overflow-y:scroll ;overflow-x:hidden"> 
                                <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
                                	<c:forEach var="courseList" items="${rsCrs_CostCourseList}" varStatus="i">
                                		<fmt:parseDate var="edufrom" value="${courseList.edufrom}" pattern="yyyymmdd"></fmt:parseDate>
                                		<fmt:parseDate var="eduto" value="${courseList.eduto}" pattern="yyyymmdd"></fmt:parseDate>
                                		<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
																		<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
																		<tr class="${lineBg}">
	                                    <td class="t2" width="44">${courseList.turnno}기</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2"><fmt:formatDate value="${edufrom}" pattern="mm.dd"/>~<fmt:formatDate value="${eduto}" pattern="mm.dd"/></td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="75"><fmt:formatNumber value="${courseList.totalcost }" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="65"><fmt:formatNumber value="${courseList.txtbookcostIntro }" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="55"><fmt:formatNumber value="${courseList.txtbookcostMsct }" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="55"><fmt:formatNumber value="${courseList.txtbookcostCommon }" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="55"><fmt:formatNumber value="${courseList.txtbookcostAxbook }" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="65"><fmt:formatNumber value="${courseList.profcostPay }" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="60"><fmt:formatNumber value="${courseList.profcostTravel }" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="55"><fmt:formatNumber value="${courseList.profcostQuestion }" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="55"><fmt:formatNumber value="${courseList.imchacost }" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="55"><fmt:formatNumber value="${courseList.etccost }" pattern="#,##0"/>&nbsp;</td>
	                                  </tr>
	                                  <tr> 
	                                    <td class="lbg3" colspan="99"></td>
	                                  </tr>   
                                		<c:set var="count" value="${i.count}"/>
                                	</c:forEach>
																	<c:if test="${count==null}">
																  	<tr class="tbg3">
																   		<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
																   	</tr>
																  </c:if>  
                                </table>
                              </div>
                              <!--리스트 끝-->
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
            </table>
          </td>
        </tr>
        <tr>
        	<td>
						<table width="750" border="0" cellspacing="0" cellpadding="0">
						  <tr> 
						    <td align="right"><img src='<html:rewrite page="/images/board/btn_excel.gif"/>' alt="엑셀 다운로드" align="absmiddle" onclick="doCostExcel();" style="cursor:hand"></td>
						  </tr>
						</table>
					</td>
				</tr>
</table>
<iframe id="actionFrame" width="0" height="0"></iframe>
<script type="text/javascript">
<!--
	tresize(185);
	searchList('${key}');
	document.forms[0].searchCourseCode.focus();
//-->
</script>
