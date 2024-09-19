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
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   윈도우 사이즈 변경 셋팅 코드
	tresize(235);
	}

	function checkAll()
	{
		var max = Number(document.all.max.value);
		if(max == 0)
		{
			alert("조회된 데이터가 없습니다.");
			return;
		}
		
		if(max == 1)
		{
			if(document.all.check_array.checked == false)
				document.all.check_array.checked = true;
			else
				document.all.check_array.checked = false;
		}
		else
		{
			if(document.all.check_array[0].checked == false)
				for(var i=0; i<max; i++)
					document.all.check_array[i].checked = true;
			else
				for(var i=0; i<max; i++)
					document.all.check_array[i].checked = false;
		}
	}
	
	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}
	
	function saveCalc()
	{
		var max = document.forms[1].max.value;
		var result = "";
		var flag = false;
		
		if(max == "")
		{
			alert("조회된 데이터가 없습니다.");
			return;
		}
		else if(max == 1)
		{
			if(document.forms[1].check_array.checked == false)
			{
				alert('체크박스를 선택하세요.');
				return;
			}					
		}
		else
		{
			for(var i=0; i<max; i++)
			{
				if(document.forms[1].check_array[i].checked == true)
					flag = true;
			}
			if(flag == false)
			{
				alert('체크박스를 선택하세요.');
				return;
			}
		}
	
		if(confirm('저장하시겠습니까?'))
		{
			var costyymm = document.all.setcostyymm.value;
			
			document.forms[1].costyymm.value = costyymm;
			document.forms[1].action = "crsCostCalc.act?task=insert";
			document.forms[1].submit();
		}
	}

	function setCost(num)
	{
		var doc = document;
		var docForm = doc.forms[1];
		
		if( typeof(docForm.elements['intro_array'].length) == 'undefined' )
		{
			var intro 	= replace(docForm.intro_array.value,',','');
			var msct    = replace(docForm.msct_array.value,',','');
			var common	= replace(docForm.common_array.value,',','');
			var axbook  = replace(docForm.axbook_array.value,',','');
			var pay     = replace(docForm.pay_array.value,',','');
			var travel  = replace(docForm.travel_array.value,',','');
			var question = replace(docForm.question_array.value,',','');
			var imcha   = replace(docForm.imcha_array.value,',','');
			var etc     = replace(docForm.etc_array.value,',','');

			var totalcost = Number(intro) + Number(msct) + Number(common) + Number(axbook) + Number(pay) + Number(travel) + Number(question) + Number(imcha) + Number(etc);
			totalcost = setComma(totalcost);
			document.all.totaltd.innerHTML = totalcost + "&nbsp;";
		}
		else
		{
			var intro 	= replace(docForm.intro_array[num-1].value,',','');
			var msct    = replace(docForm.msct_array[num-1].value,',','');
			var common	= replace(docForm.common_array[num-1].value,',','');
			var axbook  = replace(docForm.axbook_array[num-1].value,',','');
			var pay     = replace(docForm.pay_array[num-1].value,',','');
			var travel  = replace(docForm.travel_array[num-1].value,',','');
			var question = replace(docForm.question_array[num-1].value,',','');
			var imcha   = replace(docForm.imcha_array[num-1].value,',','');
			var etc     = replace(docForm.etc_array[num-1].value,',','');

			var totalcost = Number(intro) + Number(msct) + Number(common) + Number(axbook) + Number(pay) + Number(travel) + Number(question) + Number(imcha) + Number(etc);
			totalcost = setComma(totalcost);
			document.all.totaltd[num-1].innerHTML = totalcost + "&nbsp;";
		}		
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
                	<html:form action='crsCostCalc.act?task=${foward}'>
                	<input type="hidden" name="searchtimes" value="${times}">
                  <!--검색 테이블 시작-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="119" class="s1">회차 : ${times}</td>
                            <td width="119" class="s1">기준년월 : </td>
                            <td class="sBar"></td>
                            <td class="s2"> 
	                    				<html:text property="fromyymm" value="${fromyymm}" style="width:100px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].fromyymm);">
	                    				~<html:text property="toyymm" value="${toyymm}" style="width:100px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].toyymm);">
                            </td>
														<td width="60" align="center"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="검색" /></td>                            
                          </tr>  
                        </table>
                      </td>
                    </tr>
                  </table>
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
	                  <tr> 
			                <td height="8"></td>
			              </tr>
			            </table>
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="25" class="stitle" width="120">
                      	<img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />경비처리년월 : 
                      </td>
                      <td> 
                        <html:text property="setcostyymm" value="${costyymm}" style="width:100px" readonly="true"/>
                        <c:if test="${foward eq 'create'}">
                					<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.all.setcostyymm);">
                				</c:if>
                      </td>
                    </tr>
                  </table>
                  <!--검색 테이블 끝-->
                  </html:form>
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
                  <!--테이블 헤더 시작-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="lbg"></td>
                      <td class="cbg"> 
                        <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
                          <tr> 
                            <td class="t1" width="20"><a href="#" onclick="checkAll();"><u>선택</u></a></td>
                            <td class="sBg"></td>
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
														<td class="t1" width="279">
                            	<table width="100%" cellspacing="0" cellpadding="0">
                            		<tr>
			                      			<td class="t1" width="279" colspan="9">교재대</td>
																</tr>
                            		<tr> 
                                  <td class="lbg3" colspan="9"></td>
                                </tr>	
                                <tr>
																	<td class="t1" width="60">합계</td>
                          				<td class="sBg"></td>
                          				<td class="t1" width="55">교육<BR>안내</td>
                          				<td class="sBg"></td>
                          				<td class="t1" width="50">원고료</td>
                          				<td class="sBg"></td> 
                          				<td class="t1" width="55">공통<BR>교재</td>   
                          				<td class="sBg"></td>
                          				<td class="t1" width="55">부교재</td>                                
                                </tr>
                              </table>
                            </td>		                      			
			                      <td class="sBg"></td>
														<td class="t1" width="167">
                            	<table width="100%" cellspacing="0" cellpadding="0">
                            		<tr>			                      			                        
                            			<td class="t1" width="167" colspan="5">강사수당</td>
                            		</tr>
																<tr> 
                                  <td class="lbg3" colspan="5"></td>
                                </tr>	
                                <tr>
																	<td class="t1" width="60">수당</td>
			                          	<td class="sBg"></td>
			                          	<td class="t1" width="50">원거리여비</td>
			                          	<td class="sBg"></td> 
			                          	<td class="t1" width="55">출제<BR>수당</td>   
			                          </tr>
			                        </table>
			                      </td>                                                      			
                            <td class="sBg"></td>
														<td class="t1" width="111">
															<table width="100%" cellspacing="0" cellpadding="0">
                            		<tr>			                      			                        
                            			<td class="t1" width="111" colspan="3">기타경비</td>
                            		</tr>
																<tr> 
                                  <td class="lbg3" colspan="3"></td>
                                </tr>	
                                <tr>
																	<td class="t1" width="55" height="33">임차료</td>
			                          	<td class="sBg"></td>
			                          	<td class="t1" width="55">기타</td>
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
                           	<html:form action="crsCostCalc.act?task=insert">
                           	<input type="hidden" name="times" value="${times }">
                           	<input type="hidden" name="costyymm">
                            <td valign="top"> 
                              <!--리스트 시작-->
                              <div id="mainList" style="width:746px;  overflow-y:scroll ;overflow-x:hidden"> 
                                <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
                                  <c:forEach var="costCalcList" items="${rsCrs_CostCalcModList}" varStatus="i">
                                    <input type="hidden" name="coursecode_array" value="${costCalcList.coursecode }">
                                    <input type="hidden" name="cybertimes_array" value="${costCalcList.cybertimes }">
                                    <input type="hidden" name="cyberyymm_array" value="${costCalcList.cyberyymm }">
                                    <input type="hidden" name="coursename_array" value="${costCalcList.coursename }">
                                  	<fmt:parseDate var="edufrom" value="${costCalcList.edufrom}" pattern="yyyymmdd"></fmt:parseDate>
                                  	<fmt:parseDate var="eduto" value="${costCalcList.eduto}" pattern="yyyymmdd"></fmt:parseDate>
																		<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
																		<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
																		<tr class="${lineBg}">
	                                    <td class="t2" width="20"> 
	                                    	<c:if test="${costCalcList.times == null}">
	                                    		<input type="checkbox" name="check_array" value="${i.count }">
	                                    	</c:if>
	                                    	<c:if test="${costCalcList.times != null}">
	                                    		<input type="checkbox" name="check_array" value="${i.count }" checked>
	                                    	</c:if> 
	                                    </td>
	                                    <td class="sBg"></td>
	                                    <td class="t3">&nbsp;${costCalcList.coursename}</td>
	                                    <td class="sBg"></td>
	                                  <c:if test="${costCalcList.coursecode eq 'C'}">
																			<td class="t2" width="40">-</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="60" id="totaltd"><fmt:formatNumber value="${costCalcList.totalcost}" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="55">-<input type="hidden" name="intro_array" value=""></td>
	                                    <td class="sBg"></td>		 
	                                    <td class="t2" width="50">-<input type="hidden" name="msct_array" value=""></td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="55">-<input type="hidden" name="common_array" value=""></td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="55">-<input type="hidden" name="axbook_array" value=""></td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="60">-<input type="hidden" name="pay_array" value=""></td>
	                                    <td class="sBg"></td>		 
	                                    <td class="t2" width="50">-<input type="hidden" name="travel_array" value=""></td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="55">-<input type="hidden" name="question_array" value=""></td>
	                                    <td class="sBg"></td>	
	                                    <td class="t2" width="55">-<input type="hidden" name="imcha_array" value=""/>
	                                    </td>	
	                                    <td class="sBg"></td>	
	                                    <td class="t4" width="55">
	                                    	<fmt:formatNumber value="${costCalcList.etccost}" pattern="#,##0"/>&nbsp;
	                                    	<input type="hidden" name="etc_array" value="${costCalcList.etccost}"/>
	                                    </td>	
	                                  </c:if>
	                                  <c:if test="${costCalcList.coursecode ne 'C'}">
																			<td class="t2" width="40"><fmt:formatDate value="${edufrom}" pattern="mm.dd"/>~<fmt:formatDate value="${eduto}" pattern="mm.dd"/></td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="60" id="totaltd"><fmt:formatNumber value="${costCalcList.totalcost}" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="55">
	                                      <fmt:formatNumber var="introCost" value="${costCalcList.txtbookcostIntro}" pattern="#,##0"/>
	                                    	<input type="text" name="intro_array" value="${introCost}" style="text-align:right; width:90%; IME-MODE:disabled" onkeydown="key_num();" onkeyup="this.value=setComma(this.value); setCost(${i.count});"/>
	                                    </td>
	                                    <td class="sBg"></td>		 
	                                    <td class="t4" width="50">
	                                    	<fmt:formatNumber value="${costCalcList.txtbookcostMsct}" pattern="#,##0"/>&nbsp;
	                                    	<input type="hidden" name="msct_array" value="${costCalcList.txtbookcostMsct}">
	                                    </td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="55">
	                                    	<fmt:formatNumber var="commonCost" value="${costCalcList.txtbookcostCommon}" pattern="#,##0"/>
	                                    	<input type="text" name="common_array" value="${commonCost}" style="text-align:right; width:90%; IME-MODE:disabled" onkeydown="key_num();" onkeyup="this.value=setComma(this.value); setCost(${i.count});"/>
	                                    </td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="55">
	                                    	<fmt:formatNumber var="axbookCost" value="${costCalcList.txtbookcostAxbook}" pattern="#,##0"/>
	                                    	<input type="text" name="axbook_array" value="${axbookCost}" style="text-align:right; width:90%; IME-MODE:disabled" onkeydown="key_num();" onkeyup="this.value=setComma(this.value); setCost(${i.count});"/>
	                                    </td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="60">
	                                    	<fmt:formatNumber value="${costCalcList.profcostPay}" pattern="#,##0"/>&nbsp;
	                                    	<input type="hidden" name="pay_array" value="${costCalcList.profcostPay}"/>
	                                    </td>
	                                    <td class="sBg"></td>		 
	                                    <td class="t4" width="50">
	                                    	<fmt:formatNumber value="${costCalcList.profcostTravel}" pattern="#,##0"/>&nbsp;
	                                    	<input type="hidden" name="travel_array" value="${costCalcList.profcostTravel}"/>
	                                    </td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="55">
																				<fmt:formatNumber var="questionCost" value="${costCalcList.profcostQuestion}" pattern="#,##0"/>
																				<input type="text" name="question_array" value="${questionCost}" style="text-align:right; width:90%; IME-MODE:disabled" onkeydown="key_num();" onkeyup="this.value=setComma(this.value); setCost(${i.count});"/>
	                                    </td>	
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="55">
	                                    	<fmt:formatNumber var="imchaCost" value="${costCalcList.imchacost}" pattern="#,##0"/>
	                                    	<input type="text" name="imcha_array" value="${imchaCost}" style="text-align:right; width:90%; IME-MODE:disabled" onkeydown="key_num();" onkeyup="this.value=setComma(this.value); setCost(${i.count});"/>
	                                    </td>	
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="55">
	                                    	<fmt:formatNumber var="etcCost" value="${costCalcList.etccost}" pattern="#,##0"/>
	                                    	<input type="text" name="etc_array" value="${etcCost}" style="text-align:right; width:90%; IME-MODE:disabled" onkeydown="key_num();" onkeyup="this.value=setComma(this.value); setCost(${i.count});"/>
	                                    </td>	
	                                  </c:if>		                                    
	                                  </tr>
		                                <tr> 
	                                    <td class="lbg3" colspan="99"></td>
	                                  </tr>
		                              	<c:set value="${i.count}" var="count"></c:set>
                                  </c:forEach>
                                  <c:if test="${count==null}">
																		<tr class="tbg3">
																			<td class="t2" colspan="99">조회된 데이터가 없습니다.</td>
																		</tr>
																	</c:if>
                                  <html:hidden property="max" value="${count}"/>
                                </table>                                
                              </div>
                              <!--리스트 끝-->
                            </td>
                            </html:form>
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
												<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록" onclick="location.href='<html:rewrite page="/crsCostCalc.act?task=list&year=${fn:substring(courseyymm,1,4)}"/>'" style="cursor:hand"/>   
												<c:if test="${chkCost eq 'Y' }">
													<img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" align="absmiddle" alt="저장" onclick="saveCalc()" style="cursor:hand"/>
												</c:if>
												<c:if test="${chkCost ne 'Y' }">
													<img src='<html:rewrite page="/images/board/btn_save_off.gif"/>' width="57" height="25" align="absmiddle" alt="저장"/>
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
<script type="text/javascript">
<!--
	tresize(235);
	searchList('${key}');

//-->
</script>
