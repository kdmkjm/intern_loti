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
	tresize(200);
	}
	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}	
	
	function ozReport()
	{ 
		var max = document.all.max.value;
		var printUser = document.all.printUser.value;
		var flag = false;
		var pmData = "";
		
		if(max == 0)
		{
			alert('조회된 데이터가 없습니다.');
			return;
		}
		else if(max == 1)
		{
			if(document.all.checkbox.checked == true)
			{
				 pmData = document.all.checkbox.value + ',';
				 flag = true;
			}
		}
		else
		{
			for(var i=0; i<max; i++)
			{
				if(document.all.checkbox[i].checked == true)
				{
					 pmData = pmData + document.all.checkbox[i].value + ',';
					 flag = true;
				}
			}
		}
		
		// 체크된 값이 있다면
		if(flag == true)
		{
			pmData = pmData.substring(0, pmData.length - 1);
			
			window.open('<html:rewrite page="/ozMenu.act"/>?report=pay&pmData='+ pmData + '&printUser=' + printUser, 'oz_popup', 'scrollbars = no, menubar = no, resizable=yes,width = 710 height =550, status = yes');
		}
		else
		{
			alert("한 건 이상 선택하여 주세요.");
			return;
		}
	}
	
  function openInfo(costyymm, times)
  {
   		document.location.href = 'crsCostCalc.act?task=info&costyymm='+costyymm+'&searchtimes='+times ; 
  	
  }
  
  function modifyCalc(costyymm, times)
  {
  	document.location.href = "crsCostCalc.act?task=modify&costyymm="+costyymm+"&searchtimes="+times;
  }
  
  function deleteCalc(costyymm, times)
  {
  	if(confirm('삭제하시겠습니까?'))
  	{
  		document.location.href = "crsCostCalc.act?task=delete&costyymm="+costyymm+"&searchtimes="+times;
  	}
  }
  
  function doExcel()
	{
		var searchdate = document.forms[0].searchdate.value;
		document.getElementById("actionFrame").src = '<html:rewrite page="/crsCostCalc.act?task=excel&searchdate='+searchdate+'"/>'
	}
  
  function doCourseExcel()
	{
		var searchdate = document.forms[0].searchdate.value;
		document.getElementById("actionFrame").src = '<html:rewrite page="/crsCostCalc.act?task=excelCourse&searchdate='+searchdate+'"/>'
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
          	<!--검색 테이블 시작-->
           	<html:form action='crsCostCalc.act?task=list'>
           	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
							<tr>
							  <td width="119" class="s1">연도</td>
							  <td class="sBar"></td>
							  <td class="s2"> 
							<html:select property="searchdate">
							<html:optionsCollection name="applyYear" property="beanCollection" />
							</html:select>
							  </td>
							  <td width="60" align="center"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="검색" /></td>
							</tr>
						</table>  
						</html:form>
						<!--검색 테이블 끝--> 
						<table>
							<tr>
			        	<td height="15"></td>
							</tr>
						</table>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
							<tr>
								<td>
									<!--테이블 헤더 시작-->
									<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
                    <tr> 
                      <td class="t1" width="59" >출력</td>
                      <td class="sBg"></td>
                      <td class="t1" width="197">처리년월</td>
                      <td class="sBg"></td>
                      <td class="t1" width="99">회차</td>
                      <td class="sBg"></td>
                      <td class="t1" width="150">
                      	<table width="100%" cellspacing="0" cellpadding="0">
                      		<tr>
                      			<td class="t1" colspan="3" width="150">대상과정</td>
                      		</tr>
                      		<tr> 
                            <td class="lbg3" colspan="3"></td>
                          </tr>
                      		<tr>
                      			<td class="t1" width="69">일반</td>
                    				<td class="sBg"></td>
                      			<td class="t1" width="80">Cyber(민간)</td>
                      		</tr>
                      	</table>
                      </td>
                      <td class="sBg"></td>
                      <td class="t1" width="119">총금액</td>
                      <td class="sBg"></td>
                      <td class="t1" width="100">처리</td>
                      <td width="17" rowspan="3"></td>
                    </tr>                       
                  </table>
			            <!--리스트 시작-->
			            <html:form action="crsCostCalc.act?task=modify"> 
			            <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
										<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		                  <c:forEach var="costCalcList" items="${rsCrs_CostCalcList}" varStatus="i">
			                 	<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
												<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
												<tr class="${lineBg}">
		                      <td class="t2" width="59"> 
		                        <input type="checkbox" name="checkbox" value="${costCalcList.costyymm}${costCalcList.times}">
		                      </td>
		                      <td class="sBg"></td>
		                      <td class="t2" width="197"><a href="#" onclick=javascript:openInfo('${costCalcList.costyymm }','${costCalcList.times }')><u>${fn:substring(costCalcList.costyymm, 0, 4)}-${fn:substring(costCalcList.costyymm, 4, 6)}</u></a></td>
		                      <td class="sBg"></td>
		                      <td class="t2" width="99">${costCalcList.times}</td>
		                      <td class="sBg"></td>
		                      <td class="t2" width="69">${costCalcList.coursecount}</td>
		                      <td class="sBg"></td>
		                      <td class="t2" width="80">${costCalcList.cybercount}</td>
		                      <td class="sBg"></td>		 
		                      <td class="t4" width="119"><fmt:formatNumber value="${costCalcList.totalcost}" pattern="#,##0"/>&nbsp;</td>
		                      <td class="sBg"></td>
		                      <td class="t2" width="100">
		                      	<c:if test="${costCalcList.chkCost eq 'Y' }">
		                      		<img src='<html:rewrite page="/images/board/btn_modify.gif"/>' width="34" height="18" alt="수정" align="absmiddle" onclick="modifyCalc('${costCalcList.costyymm }','${costCalcList.times }')" style="cursor:hand"/>
		                      		<img src='<html:rewrite page="/images/board/btn_del2.gif"/>' width="34" height="18" alt="삭제" align="absmiddle" onclick="deleteCalc('${costCalcList.costyymm }','${costCalcList.times }')" style="cursor:hand"/>			                      	
		                      	</c:if>
		                      	<c:if test="${costCalcList.chkCost ne 'Y' }">
		                      		<img src='<html:rewrite page="/images/board/btn_modify_off.gif"/>' width="34" height="18" alt="수정" align="absmiddle" />
		                      		<img src='<html:rewrite page="/images/board/btn_del2_off.gif"/>' width="34" height="18" alt="삭제" align="absmiddle" />			                      	
		                      	</c:if>			                      	
		                      </td>
		                    </tr>
		                   	<tr> 
		                    	<td class="lbg3" colspan="13"></td>
		                    </tr>
			                	<c:set value="${i.count}" var="count"></c:set>
			                	<c:set value="${total_course + costCalcList.coursecount}" var="total_course"></c:set>
			                	<c:set value="${total_cyber + costCalcList.cybercount}" var="total_cyber"></c:set>
			                	<c:set value="${total_unitprice + costCalcList.totalcost}" var="total_unitprice"></c:set>
		                  </c:forEach>
											<html:hidden property="max" value="${count}"/>
											<c:if test="${count==null}">
												<tr class="tbg3">
													<td class="t2" colspan="99">조회된 데이터가 없습니다.</td>
												</tr>
											</c:if>
	                  </table>                               
									</div>
									<c:if test="${count>0}">
		  							<table width="746" border="0" cellspacing="0" cellpadding="0">
											<tr> 
											  <td class="t2BgRed" colspan="5">합계</td>
											  <td class="sBg"></td>
											  <td class="t2BgRed" width="69"><fmt:formatNumber value="${total_course }" pattern="#,##0"/></td>
											  <td class="sBg"></td>
											  <td class="t2BgRed" width="80"><fmt:formatNumber value="${total_cyber }" pattern="#,##0"/></td>
											  <td class="sBg"></td>                                    
											  <td class="t2BgRedR" width="119"><fmt:formatNumber value="${total_unitprice }" pattern="#,##0"/>&nbsp;</td>
											  <td class="sBg"></td>
											  <td class="t2BgRed" width="117"></td>
											</tr>
	                 	</table>
									</c:if>                               
									</html:form>
								</td>
							</tr>
						</table> 
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
						  <tr valign="middle" class="stitle"> 
						    <td>
						    	<img src='<html:rewrite page="/images/board/btn_new.gif"/>' width="57" height="25" alt="신규" align="middle" onclick="location.href='<html:rewrite page="/crsCostCalc.act?task=create"/>'" style="cursor:hand"/> 
						    	<img src='<html:rewrite page="/images/board/btn_price3.gif"/>' width="116" height="25" alt="월별 경비 지급내역" align="middle" onclick="doExcel()" style="cursor:hand"/> 
						    	<img src='<html:rewrite page="/images/board/btn_price4.gif"/>' alt="과정별 경비 지급내역" align="middle" onclick="doCourseExcel()" style="cursor:hand"/>
						    </td>
						    <td align="right">
						    	<img src='<html:rewrite page="/images/board/dot.gif"/>' align="middle"/>확인자 <input type="text" name="printUser" id="printUser" style="width:150px;"/>
						    </td>
						    <td align="right" width="95">                      	
						      <img src='<html:rewrite page="/images/board/btn_price_print.gif"/>' width="86" height="25" align="middle" alt="교육비인쇄" style="cursor:hand"  onclick="ozReport();"/> 
						    </td>
						  </tr>
						</table>
          </td>
  </tr>
</table>
<iframe id="actionFrame" width="0" height="0"></iframe>
<script type="text/javascript">
<!--
	tresize(235);
	searchList('${key}');

//-->
</script>
