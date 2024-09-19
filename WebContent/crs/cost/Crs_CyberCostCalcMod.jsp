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
	tresize(205);
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
		if(confirm('저장하시겠습니까?'))
		{
			document.forms[1].cyberyymm.value = document.all.setcyberyymm.value;
			document.forms[1].fincnt.value 		= replace(document.all.totalfincnt.value,",","");
			document.forms[1].monprice.value 	= replace(document.all.totalcost.value,",","");
			document.forms[1].appcnt.value 		= replace(document.all.totalappcnt.value,",","");
			document.forms[1].action = "crsCyberCostCalc.act?task=insert";			
			document.forms[1].submit();
		}
	}
	
	function setCheck(seq)
	{
		var doc = document;
		var docForm = doc.forms[1];
		var totalfincnt = 0;
		if( typeof(docForm.elements['check_array'].length) == 'undefined' )
		{
			if(docForm.elements['check_array'].checked == true)
			{
				var fincnt = docForm.fincnt_array.value;
				
				totalfincnt = Number(fincnt); 
				docForm.totalfincnt.value = totalfincnt;
				document.all.totaltd.innerHTML = totalfincnt;
			}
		}
		else
		{
			for(var i=0; i<docForm.elements['check_array'].length; i++)
			{
				if(docForm.elements['check_array'][i].checked==true)
				{
					var fincnt = docForm.fincnt_array[i].value;
					totalfincnt = Number(totalfincnt) + Number(fincnt);
				}
			}
			docForm.totalfincnt.value = totalfincnt;
			document.all.totaltd.innerHTML = totalfincnt;
		}		
	}
	
	function setCalc()
	{
		var doc = document;
		var docForm = doc.forms[1];
		if(docForm.count.value == "")
		{
			alert("계산을 처리할 데이터가 존재하지 않습니다.");
			return false;
		}
		var totalfincnt = replace(docForm.totalfincnt.value,",","");
		var totalcost   = replace(docForm.totalcost.value,",","");
		var totalappcnt = replace(docForm.totalappcnt.value,",","");
		var totaleducosttd = Number(totalfincnt) * Number(totalcost) + Number(totalappcnt);
		
		document.all.totaleducosttd.innerHTML = setComma(totaleducosttd) + '&nbsp;'; 
	}	

	function checkAll()
	{
		var max = Number(document.all.max.value);
		var doc = document;
		var docForm = doc.forms[1];
		if(max == 0)
		{
			alert("조회된 데이터가 없습니다.");
			return;
		}
		if(docForm.count.value == "")
		{
			alert("계산을 처리할 데이터가 존재하지 않습니다.");
			return false;
		}
		
		if(max == 1)
		{
			if(document.all.check_array.checked == false)
			{
				document.all.check_array.checked = true;
				var fincnt = Number(docForm.fincnt_array[i].value);
				document.all.totaltd.innerHTML = setComma(fincnt);
			}
			else
			{
				document.all.check_array.checked = false;
				document.all.totaltd.innerHTML = 0;
			}
		}
		else
		{
			if(document.all.check_array[0].checked == false)
			{
				for(var i=0; i<max; i++)
				{
					document.all.check_array[i].checked = true;
					var fincnt = 0;
					for(var no=0; no<docForm.elements['check_array'].length; no++)
					{
						fincnt += Number(docForm.fincnt_array[no].value);
					}
					document.all.totaltd.innerHTML = setComma(fincnt);
				}
			}
			else
			{
				for(var i=0; i<max; i++)
				{
					document.all.check_array[i].checked = false;
					document.all.totaltd.innerHTML = 0;
				}
			}
		}
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="교육비관리 - 사이버 민간 콘텐츠 등록 및 수정" src="/images/operation/title_04-6.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                	<html:form action='crsCyberCostCalc.act?task=${foward}'>
                	<input type="hidden" name="cybertimes" value="${cybertimes}">
                  <!--검색 테이블 시작-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="119" class="s1">회차 : ${cybertimes }</td>
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
                  <!--검색 테이블 끝-->
                  </html:form>
                </td>
              </tr>
              <tr> 
                <td height="8"></td>
              </tr>
              <tr> 
                <td > 
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="25" class="stitle" width="120">
                      	<img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />경비처리년월 : 
                      </td>
                      <td> 
                        <input type="text" name="setcyberyymm" value="${cyberyymm}" style="width:100px" readonly="readonly"/>
                        <c:if test="${foward eq 'create'}">
                					<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.all.setcyberyymm);">
                				</c:if>
                      </td>
                    </tr>
                  </table>
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
                          	<td class="t1" width="39"><a href="#" onclick="checkAll();"><u>선택</u></a></td>
                            <td class="sBg"></td>
                         		<td class="t1">과정명</td> 
                          	<td class="sBg"></td>
                          	<td class="t1" width="100">이수인원</td>
                          	<td class="sBg"></td>
                          	<td class="t1" width="100"></td>
                          	<td width="17"></td>
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
                          	<html:form action="crsCyberCostCalc.act?task=insert">
                          	<input type="hidden" name="fincnt">
                          	<input type="hidden" name="monprice">
                          	<input type="hidden" name="appcnt">
                          	<input type="hidden" name="cyberyymm">
                          	<input type="hidden" name="cybertimes" value="${cybertimes}">
                            <td valign="top"> 
                              <!--리스트 시작-->
                              <div id="mainList" style="width:746px;  overflow-y:scroll ;overflow-x:hidden"> 
                                <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
                                  <c:forEach var="costCalcList" items="${rsCrs_CyberCostCalcModList}" varStatus="i">
                                    <input type="hidden" name="coursecode_array" value="${costCalcList.coursecode}">
                                    <input type="hidden" name="fincnt_array" value="${costCalcList.fincnt}">
                                  	<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
																		<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
																		<tr class="${lineBg}">
	                                    <td class="t2" width="39"> 
	                                    	<c:if test="${costCalcList.cybertimes == null}"><input type="checkbox" name="check_array" value="${i.count}" onclick="setCheck('${i.count}')"></c:if>
	                                    	<c:if test="${costCalcList.cybertimes != null}"><input type="checkbox" name="check_array" value="${i.count}" onclick="setCheck('${i.count}')" checked></c:if> 
	                                    </td> 
	                                    <td class="sBg"></td>      		        										
	                                    <td class="t3">&nbsp;${costCalcList.coursename}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="100"><fmt:formatNumber value="${costCalcList.fincnt}" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="100"></td>	                                    	                                    
	                                  </tr>
		                                <tr> 
	                                    <td class="lbg3" colspan="21"></td>
	                                  </tr>
		                              	<c:set value="${i.count}" var="count"/>
		                              	<c:set value="${total_fincnt+costCalcList.fincnt}" var="total_fincnt"/>
                                  </c:forEach>
                                  <input type="hidden" name="max" value="${count}">
                                  <c:if test="${count==null}">
																		<tr class="tbg3">
																			<td class="t2" colspan="99">조회된 데이터가 없습니다.</td>
																		</tr>
																	</c:if>
                                </table>                               
                              </div>
                              <!--리스트 끝-->
                              <c:if test="${count >0}">
                              	<table width="746" border="0" cellspacing="0" cellpadding="0">
                              		<input type="hidden" name="totalfincnt" value="${total_fincnt}">
   		        										<tr>
	                                  <td class="t2BgRed" colspan="2">합계</td>
	                                  <td class="sBg"></td>		 
	                                  <td class="t2BgRed" width="79">월교육단가<br>
	                                  	<c:if test="${foward ne 'modify'}"><input type="text" name="totalcost" value="0" style="width:68px; text-align:right;" onkeyup="this.value=setComma(this.value);"></c:if>
	                                  	<c:if test="${foward eq 'modify'}"><input type="text" name="totalcost" value="${monprice}" style="width:68px; text-align:right;" onkeyup="this.value=setComma(this.value);"></c:if>
	                                  </td>
	                                  <td class="sBg"></td>
	                                  <td class="t2BgRed" width="79">기타금액<br>
	                                  	<c:if test="${foward ne 'modify'}"><input type="text" name="totalappcnt" value="0" style="width:68px; text-align:right;" onkeyup="this.value=setComma(this.value);"></c:if>
	                                  	<c:if test="${foward eq 'modify'}"><input type="text" name="totalappcnt" value="${appcnt}" style="width:68px; text-align:right;" onkeyup="this.value=setComma(this.value);"></c:if>
	                                  </td>
	                                  <td class="sBg"></td>
	                                  <td class="t2BgRedR" width="95" id="totaltd" style="padding-right:5px"><fmt:formatNumber value="${total_fincnt}" pattern="#,##0"/></td>
	                                  <td class="sBg"></td>
	                                  <td class="t2BgRedR" width="100" id="totaleducosttd">
	                                  	<c:if test="${foward ne 'modify'}"><fmt:formatNumber value="${total_educost}" pattern="#,##0"/>&nbsp;</c:if>
	                                  	<c:if test="${foward eq 'modify'}"><fmt:formatNumber value="${educost}" pattern="#,##0"/>&nbsp;</c:if>
	                                  </td> 
	                                  <td class="t2BgRed" width="17"></td>                          	                                    
	                                </tr>	                              	
                              	</table>	
                              </c:if>
                            </td>
                            <input type="hidden" name="count" value="${count}">
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
                      	<img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" align="absmiddle" alt="목록" style="cursor:hand" onclick="location.href='<html:rewrite page="/crsCyberCostCalc.act?task=list&year=${fn:substring(courseyymm,1,4)}"/>'"/>
                      	<c:if test="${chkCost eq 'Y'}">
                      		<img src='<html:rewrite page="/images/board/btn_price.gif"/>' width="57" height="25" align="absmiddle" alt="계산" onclick="setCalc()" style="cursor:hand"/>
                      		<img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" align="absmiddle" alt="저장" onclick="saveCalc()" style="cursor:hand"/>                      	
                      	</c:if>
                      	<c:if test="${chkCost ne 'Y'}">
                      		<img src='<html:rewrite page="/images/board/btn_price_off.gif"/>' width="57" height="25" align="absmiddle" alt="계산" />
                      		<img src='<html:rewrite page="/images/board/btn_save_off.gif"/>' width="57" height="25" align="absmiddle" alt="저장" />
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
	tresize(245);
	searchList('${key}');
	
	if('modify' == '${foward}')
	{
		document.all.totalcost.value = setComma(document.all.totalcost.value);
		document.all.totalappcnt.value = setComma(document.all.totalappcnt.value);
	}
//-->
</script>
