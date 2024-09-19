<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=8">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script language="JavaScript">
	<!--
	function closeWin()
	{
		
		
		document.forms[0].action = '/tstScore.act?task=scoreupdate';
		document.forms[0].target="ScoreMgmt";
		document.forms[0].submit();
		window.close();
	}

//-->
</script>
   <!--점수수정테이블 시작-->
<%-- 폼 설정 (Bean으로만 사용)--%>
<html:form action="/tstScore.act?task=scoreupdate" method="post">
<html:hidden name="tstSubject" property="essrl"/>
<html:hidden name="tstScoreForm" property="sduno"/>
<html:hidden name="tstSubject" property="cmidf"/>
<html:hidden name="tstSubject" property="sbidf"/>
<html:hidden name="tstSubject" property="sbnam"/>
<html:hidden name="tstSubject" property="esyer"/>
<html:hidden name="tstSubject" property="esseq"/>
<html:hidden name="tstSubject" property="esetp"/>
<html:hidden name="tstScoreForm" property="ekoca"/>
<html:hidden name="tstScoreForm" property="eksca"/>
<html:hidden name="tstScoreForm" property="ekooc"/>
<html:hidden name="tstScoreForm" property="eksoc"/>
<html:hidden name="tstScoreForm" property="ektop"/>
<html:hidden name="tstScoreForm" property="ekrgd"/>
<html:hidden name="tstScoreForm" property="insuser"/>
<html:hidden name="tstScoreForm" property="insdate"/>
<html:hidden name="tstScoreForm" property="upduser"/>
<html:hidden name="tstScoreForm" property="upddate"/>
<html:hidden name="tstScoreForm" property="searchSort"/>
<table width="500" border="0" cellspacing="5" cellpadding="0" align="center">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="성적관리" src="/images/poll/title_02-7.gif" /></h1>
	</div>
  </td>
</tr>
  <tr> 
    <td> 
      <table width="450" border="0" cellspacing="0" cellpadding="0">
        
        <tr> 
          <td> 
            <table width="440" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                  <table width="440" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="tbg2"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td> 
                  <!--테이블 헤더 시작-->
                  <table width="440" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="lbg"></td>
                      <td class="cbg"> 
                        <table width="436" border="0" cellspacing="0" cellpadding="0" height="100%">
                          <tr> 
                            <td class="t1" width="34" style="text-align:left;">&nbsp;평가점수 수정</td>
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
	               	<table width="440" border="0" cellspacing="0" align="center" cellpadding="0" bgcolor="#FFFFFF">
			  		  <tr>
			  		  	<html:hidden name="tstSubject" property="scoregbn"/>
			  		  	<td class="lbg"></td>
						<td class="s1" width="100">교번</td>
						<td class="sBg"></td>
						<td class="s2">&nbsp;${tstScoreForm.sduno }</td>
						<td class="lbg"></td>
					  </tr>
					  <tr>
					    <td colspan="31" class="lbg3"></td>
					  </tr>
					  
			  		  <logic:present name="ekevp">
			  		    <html:hidden name="tstScoreForm" property="ekotp"/>
						<html:hidden name="tstScoreForm" property="ekstp"/>
						<html:hidden name="tstScoreForm" property="ekrtp"/>
						<html:hidden name="tstScoreForm" property="ekhwp"/>
			          <c:if test="${tstSubject.esetp eq '5120'}">
			          <tr>
			          	<td class="lbg"></td>
			          	
			          	<td class="s1" width="100">실습점수</td>
			          	<td class="sBg"></td>
			          	<td class="s2">
							<html:select name="tstScoreForm" property="ekevp">
								<html:option value="${tstSubject.essup}">수 (${tstSubject.essup}점)</html:option>
								<html:option value="${tstSubject.eswop}">우 (${tstSubject.eswop}점)</html:option>
								<html:option value="${tstSubject.esyap}">양 (${tstSubject.esyap}점)</html:option>
								<html:option value="${tstSubject.esgap}">가 (${tstSubject.esgap}점)</html:option>
							</html:select>
						</td>
			          	<td class="lbg"></td>
			          </tr>
			          </c:if>
			          <c:if test="${tstSubject.esetp eq '5130'}">
			          	<tr>
			          	<td class="lbg"></td>
			          	
			          	<td class="s1" width="100">근태점수</td>
			          	<td class="sBg"></td>
			          	<td class="s2">
							<html:text name="tstScoreForm" property="ekevp"></html:text>
						</td>
			          	<td class="lbg"></td>
			          </tr>
			          </c:if>
			          </logic:present>
			          
			    	  <logic:present name="ekotp">
						<html:hidden name="tstScoreForm" property="ekstp"/>
						<html:hidden name="tstScoreForm" property="ekevp"/>
						<html:hidden name="tstScoreForm" property="ekrtp"/>
						<html:hidden name="tstScoreForm" property="ekhwp"/>
			          <tr>
			          	<td class="lbg"></td>
			          	<td class="s1" width="100">주관식점수</td>
			          	<td class="sBg"></td>
			          	<td class="s2">&nbsp;<html:text name="tstScoreForm" property="ekotp" size="5" maxlength="5"/> 점</td>
			          	<td class="lbg"></td>
			          </tr>
			    	  </logic:present>
			    	  
			    	  <logic:present name="ekstp">
			    	    <html:hidden name="tstScoreForm" property="ekotp"/>
						<html:hidden name="tstScoreForm" property="ekevp"/>
						<html:hidden name="tstScoreForm" property="ekrtp"/>
						<html:hidden name="tstScoreForm" property="ekhwp"/>
			          <tr>
			          	<td class="lbg"></td>
			          	<td class="s1" width="100">주관식점수</td>
			          	<td class="sBg"></td>
			          	<td class="s2">&nbsp;<html:text name="tstScoreForm" property="ekstp" size="5" maxlength="5"/> 점</td>
			          	<td class="lbg"></td>
			          </tr>
				      </logic:present>
				      
				      <logic:present name="ekrtp">
				      	<html:hidden name="tstScoreForm" property="ekotp"/>
						<html:hidden name="tstScoreForm" property="ekstp"/>
						<html:hidden name="tstScoreForm" property="ekevp"/>
						<html:hidden name="tstScoreForm" property="ekhwp"/>
			          <tr>
			          	<td class="lbg"></td>
			          	<td class="s1" width="100">진도율점수</td>
			          	<td class="sBg"></td>
			          	<td class="s2">&nbsp;<html:text name="tstScoreForm" property="ekrtp" size="5" maxlength="5"/> 점</td>
			          	<td class="lbg"></td>
			          </tr>
			    	  </logic:present>
			    	 
			          <logic:present name="ekhwp">
			         	<html:hidden name="tstScoreForm" property="ekotp"/>
						<html:hidden name="tstScoreForm" property="ekstp"/>
						<html:hidden name="tstScoreForm" property="ekevp"/>
						<html:hidden name="tstScoreForm" property="ekrtp"/>
			          <tr>
			          	<td class="lbg"></td>
			          	<td class="s1" width="100">과제물점수</td>
			          	<td class="sBg"></td>
			          	<td class="s2">&nbsp;<html:text name="tstScoreForm" property="ekhwp" size="5" maxlength="5"/> 점</td>
			          	<td class="lbg"></td>
			          </tr>
			    	 </logic:present>
			    	 
			    	 </table>
                 </td>
              </tr>
              <tr> 
                <td> 
                  <table width="440" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="tbg1"></td>
                    </tr>
                    <tr> 
                      <td height="5"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td> 
                  <!--하단버튼-->
                  <table width="440" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr valign="bottom"> 
                      	<td align="right"><img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" alt="목록" align="absmiddle" onclick="javascript:window.close();opener.focus();" style="cursor:hand"/> 
                        <img name="btnSave" src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" align="absmiddle" alt="저장" style="cursor:hand" onclick="javascript:closeWin();"/></td>
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
