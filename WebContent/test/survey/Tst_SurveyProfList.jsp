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
<html>
<head>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script language="JavaScript">

function profSearch(frm, reqseq){
	frm.submit();
}

function setProf(tmp)
{
	var profFlag = $('#profFlag2').val();
	
	if(profFlag == 1){

		var profNo	 = $('#profNo'+tmp).val();
		var profName = $('#profName'+tmp).val();
		var reqseq 	 = $('#reqseq2').val();
		
		opener.document.getElementById("profNo" + reqseq).value = profNo;
		opener.document.getElementById("profName" + reqseq).value = profName;
		
	} else if(profFlag == 2) {

		var profNo	 = $('#profNo'+tmp).val();
		var profName = $('#profName'+tmp).val();
		var reqseq 	 = $('#reqseq2').val();
		
		opener.document.getElementById("profName" + reqseq).value = "강의만족도 - 강사명:" + profName;
		opener.document.getElementById("profNo" + reqseq).value = profNo;
		
	}

    close();
}

</script>
<title>강사지정</title>
<link rel="stylesheet" href='<html:rewrite page="/style/main.css"/>' type="text/css" />
</head>
<body>
<table width="410" border="0" cellspacing="5" cellpadding="0" height="490" bgcolor="#E7E7E7">
<%String reqseq = request.getParameter("reqseq");%>
<c:set var="tmp2" value="<%=reqseq %>" property="tmp2"/>
<input type="hidden" id="reqseq2" name="reqseq2" value="${tmp2}"/>

<%String profFlag = request.getParameter("profFlag");%>
<c:set var="tmp3" value="<%=profFlag %>" property="tmp3"/>
<input type="hidden" id="profFlag2" name="profFlag2" value="${tmp3}"/>

	<tr> 
		<td valign="top"> 
		<table width="400" border="0" cellspacing="1" cellpadding="0" height="1" bgcolor="#D1D1D1">
			<tr> 
				<td bgcolor="#FFFFFF" valign="top"> 
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr> 
							<td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/edu/title_05-5.gif"/>' width="87" height="42" alt="강사지정" /></td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>														
							<td height="10" valign="top" width="320">							 
                        <table width="320" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                        
                       	<!--검색-->
						<html:form method="post" action="/tstSurvey.act?task=profList&reqseq=${tmp2}&profFlag=${tmp3}">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border: 1px solid #D6D6D6">
								<tr valign="middle">
									<td class="s1">성명 또는 소속</td>
									<td class="sBar"></td>
									<td class="s2">
										<input type="text" id="searchKeyword" name="searchKeyword"/>
									</td>
									<td align="center">
										<img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="profSearch(document.forms[0], <%=reqseq %>, <%=profFlag %>);" style="cursor:pointer;"/>
									</td>
								</tr>
							</table>
						</html:form>
						<!--검색 끝-->
                        	
                        </tr>
                          <tr> 					
                            <td> 
                              <table width="320" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td bgcolor="#F3F3F3" width="5"></td>
                                  <td bgcolor="#F3F3F3" width="190" height="275" valign="top"> 
                                    <table width="380" border="0" cellspacing="0" cellpadding="0" align="center">
                                      <tr><td height="10"></td></tr>
                                      <tr> 
                                        <td height="390" valign="top"> 
                                          <div id="Layer1" style="position:absolute; width:380px; height:380px; z-index:1;overflow-y:scroll ;overflow-x:hidden">
	                                          <table width="363" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
	                                            <tr> 
										          <td class="pt1" width="30">번호</td>
										          <td class="pt1" width="60">이름</td>
										          <td class="pt1">소속</td>
										          <td class="pt1" width="55">생년월일</td>
	                                            </tr>
	                                          </table>
	                                            <table id="addList" width="363" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
	                                            	<c:set var="tmp" value="1"/>
		                                            <c:forEach var="prof" items="${rsTst_ProfList}" varStatus="i">
			                                            <tr> 
			                                                <td class="pt2" width="30">${prof.rnum}</td>
			                                                <td class="pt2" width="60" onclick="setProf(${tmp})" style="cursor: pointer;"><u>${prof.profName}</u></td>
			                                                <td class="pt2">${prof.workPlace}</td>
			                                                <td class="pt2" width="55">${prof.juminNo}</td>
			                                                
			                                                <input type="hidden" id="profNo${tmp}" value="${prof.professorNo}"/>
			                                                <input type="hidden" id="profName${tmp}" value="${prof.profName}"/>
			                                                <c:set var="tmp" value="${tmp+1 }"/>		                                                
			                                            </tr>
													</c:forEach>				                                              
	                                            </table>	  
                                          </div>
                                        </td>
                                      </tr>
                                      <tr>
                                      <td align="right">
<%--                                       <input type="image" src='<html:rewrite page="/images/board/btn_ok.gif"/>' width="57" height="25" align="absmiddle" alt="확인" onclick="setProf()"> --%>
                                      <input type="image" src='<html:rewrite page="/images/board/btn_close.gif"/>' width="57" height="25" align="absmiddle" alt="닫기" onclick="window.close()">
                                      </td>
                                      </tr>
                                    </table>
                                  </td>
                                  <td bgcolor="#F3F3F3" width="5"></td>
                                </tr>
                                <tr> 
                                  <td width="5" height="5"><img src='<html:rewrite page="/images/board/round_03.gif"/>' width="5" height="5" alt="" /></td>
                                  <td bgcolor="#F3F3F3" height="5" width="190"></td>
                                  <td width="5" height="5"><img src='<html:rewrite page="/images/board/round_04.gif"/>' width="5" height="5" alt="" /></td>
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