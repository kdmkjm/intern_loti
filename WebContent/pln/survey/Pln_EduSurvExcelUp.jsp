<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<link rel="stylesheet" href='<html:rewrite page="/style/main.css"/>' type="text/css" />
<script language="JavaScript">
<!--
	function viewFile()
	{
		var frm = document.forms[0];
		frm.submit();
	}

	function finsert()
	{
		if(confirm('기준년도 데이터는 삭제됩니다. 계속 하시겠습니까?'))
		{
			var url = "plnSurv.act?task=excel_up";
			document.location.href = url;
		}
	}
//-->
</script>

<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="조사서" src="/images/edu/title_01.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
          	<table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
            			<html:form action='plnSurv.act?task=excel_view' enctype="multipart/form-data" >
 									<!--검색 테이블 시작-->
             				<table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
             				  <tr> 
                      	<td bgcolor="#FFFFFF">
			            				<table width="748" border="0" cellspacing="0" cellpadding="0">
			            					<tr>             				  
			                        <td width="119" class="s1">기관명</td>
			                        <td class="sBar"></td>
			                        <td class="s2"> 
					                 			<html:select property="selOrganCode" value="${chiefOrgan}">
										    					<html:optionsCollection name="orgTypeCode" property="beanCollection" />
										    			 	</html:select>
			                        </td>
			                      </tr>
	                          <tr> 
	                            <td colspan="3" class="lbg3"></td>
	                          </tr>			                      
	                          <tr>
	                            <td width="119" class="s1">파일</td>
	                            <td class="sBar"></td>
	                            <td class="s2">
				                   			<html:file property="file" onchange="viewFile();"></html:file>
				                			</td>
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
                          	<td class="t1" width="100">기준년도</td>
                            <td class="sBg"></td>
														<td class="t1" width="100">과정코드</td>
                            <td class="sBg"></td>
                            <td class="t1" width="224">과정명</td>
                            <td class="sBg"></td>
                            <td class="t1" width="100">기관코드</td>
                            <td class="sBg"></td>
                            <td class="t1" width="100">교육인원</td>
                            <td class="sBg"></td>
                            <td class="t1" width="117">신청인원</td>
                          </tr>
                        </table>
                      </td>
                      <td class="lbg"></td>
                    </tr>
                  </table>
                  <!--테이블 헤더 끝-->
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
															<div id="mainList"  style=" width:746px;  overflow-y:scroll ;overflow-x:hidden;">
															<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
																<c:forEach var="survList" items="${rsPln_EduSurvList}" varStatus="i" >
																	<c:if test="${i.count%2 == 0}">
				       		        					<tr class="tbg3">
										       		        <td class="t2" width="100" id="planYear"><c:out value="${survList.planYear}"/></td>
										       		        <td class="sBg"></td>
																			<td class="t2" width="100" id="crsClumpCode"><c:out value="${survList.crsClumpCode}"/></td>
																			<td class="sBg"></td>
																			<td class="t3" width="224" id="crsClumpNm">&nbsp;<c:out value="${survList.crsClumpName}"/></td>
																			<td class="sBg"></td>
																			<td class="t2" width="100" id="organCode"><c:out value="${survList.organCode}"/></td>
																			<td class="sBg"></td>
																			<td class="t2" width="100" id="stdNum"><c:out value="${survList.stdNumber}"/></td>
																			<td class="sBg"></td>
																			<td class="t2" width="100" id="orgStdNumber"><c:out value="${survList.orgStdNumber}"/></td>
										            		</tr>
						            						<tr>
																			<td class="lbg3" colspan="99"></td>
																		</tr>
				       		        				</c:if>
					       		     					<c:if test="${i.count%2 == 1}">
					       		        				<tr>
										       		        <td class="t2" width="100" id="planYear"><c:out value="${survList.planYear}"/></td>
										       		        <td class="sBg"></td>
																			<td class="t2" width="100" id="crsClumpCode"><c:out value="${survList.crsClumpCode}"/></td>
																			<td class="sBg"></td>
																			<td class="t3" width="224" id="crsClumpNm">&nbsp;<c:out value="${survList.crsClumpName}"/></td>
																			<td class="sBg"></td>
																			<td class="t2" width="100" id="organCode"><c:out value="${survList.organCode}"/></td>
																			<td class="sBg"></td>
																			<td class="t2" width="100" id="stdNum"><c:out value="${survList.stdNumber}"/></td>
																			<td class="sBg"></td>
																			<td class="t2" width="100" id="orgStdNumber"><c:out value="${survList.orgStdNumber}"/></td>
								            				</tr>
							            					<tr>
																			<td class="lbg3" colspan="99"></td>
																		</tr>
					       		     					</c:if>
						        							<input type="hidden" name="plnYear" id="plnYear" value="${survList.planYear }" >
																	<input type="hidden" name="crsClumpCd" id="crsClumpCd" value="${survList.crsClumpCode }" >
																	<input type="hidden" name="organCd" id="organCd" value="${survList.organCode }" >
																	<c:set value="${i.count}" var="count"></c:set>
						        						</c:forEach>
							  							</table>
							  							</div>
				    									<!--게시물 목록 끝-->
														</td>
                          </tr>
                          <tr>
                            <td class="cbg3">
			                      <!--하단 추가변경 테이블 끝-->
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td class="lbg"></td>
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
	                  	<c:if test="${count>0}">
												<td align="left"><img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="저장" align="absmiddle" style="cursor:hand" onclick="finsert();"/></td>
	                		</c:if>                   	 
                      <td align="right"><a href="plnSurv.act?task=list&selPlanYear=${selPlanYear}"><img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" align="absmiddle" alt="목록" /></a></td>
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