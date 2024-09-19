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
	tresize(180);
	}

	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}

	function saveCost()
	{
		if(confirm('저장하시겠습니까?'))
		{
			document.forms[1].submit();
		}
	}
	
	function numchk(num)
	{ 
    num=new String(num); 
    num=num.replace(/,/gi,""); 
    return numchk1(num); 
	} 
	
	function numchk1(num)
	{ 
    var sign=""; 
    if(isNaN(num)) { 
        alert("숫자만 입력할 수 있습니다."); 
        return 0; 
    } 
    if(num==0) { 
        return num; 
    } 

    if(num<0){ 
        num=num*(-1); 
        sign="-"; 
    } 
    else{ 
        num=num*1; 
    } 
    num = new String(num) 
    var temp=""; 
    var pos=3; 
    num_len=num.length; 
    while (num_len>0){ 
        num_len=num_len-pos; 
        if(num_len<0) { 
            pos=num_len+pos; 
            num_len=0; 
        } 
        temp=","+num.substr(num_len,pos)+temp; 
    } 
    return sign+temp.substr(1); 
	} 
 
	
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="교육비관리 - 예산등록" src="/images/operation/title_04-3.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                	<html:form action="crsCostBudget.act?task=info">
                  <!--검색 테이블 시작-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="119" class="s1">연도</td>
                            <td class="sBar"></td>
                            <td class="s2"> 
			                   			<html:select property="searchdate" value="${searchdate}">
										    				<html:optionsCollection name="applyYear" property="beanCollection" />
										    			</html:select>
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
                            <td class="t1" width="159">과목코드</td>
                            <td class="sBg"></td>
                            <td class="t1">과목명</td>
                            <td class="sBg"></td>
                            <td class="t1" width="200">예산액</td>
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
                            <html:form action="crsCostBudget.act?task=insert"> 
                            <input type="hidden" name="year" value="${searchdate}">                          
                            <td valign="top"> 
                              <!--리스트 시작-->
                              <div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden"> 
                                <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td class="t2" width="159"> 01001</td>
                                    <td class="sBg"></td>
                                    <td class="t3">&nbsp;교육안내</td>
                                    <td class="sBg"></td>
                                    <td class="t2" width="200">
                                      <fmt:formatNumber var="txtbookcostIntro" value="${rsCrs_CostBudget.txtbookcostIntro}" pattern="#,##0"></fmt:formatNumber>
                                      <input type="text" name="txtbookcostIntro" style="width:90%;direction:rtl;" value="${txtbookcostIntro}" align="left" onkeydown="key_num();" onkeyup="this.value=numchk(this.value);">
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td class="lbg3" colspan="5"></td>
                                  </tr>
                                  <tr class="tbg3"> 
                                    <td class="t2" width="159"> 01001</td>
                                    <td class="sBg"></td>
                                    <td class="t3">&nbsp;원고료</td>
                                    <td class="sBg"></td>
                                    <td class="t2" width="200"> 
                                    	<fmt:formatNumber var="txtbookcostMsct" value="${rsCrs_CostBudget.txtbookcostMsct}" pattern="#,##0"></fmt:formatNumber>
                                      <input type="text" name="txtbookcostMsct" style="width:90%;direction:rtl;" value="${txtbookcostMsct}" align="right" onkeydown="key_num();" onkeyup="this.value=numchk(this.value);">
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td class="lbg3" colspan="5"></td>
                                  </tr>
                                  <tr> 
                                    <td class="t2" width="159"> 01001</td>
                                    <td class="sBg"></td>
                                    <td class="t3">&nbsp;공통교재</td>
                                    <td class="sBg"></td>
                                    <td class="t2" width="200"> 
                                    	<fmt:formatNumber var="txtbookcostCommon" value="${rsCrs_CostBudget.txtbookcostCommon}" pattern="#,##0"></fmt:formatNumber>
                                      <input type="text" name="txtbookcostCommon" style="width:90%;direction:rtl;" value="${txtbookcostCommon}"  align="right" onkeydown="key_num();" onkeyup="this.value=numchk(this.value);">
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td class="lbg3" colspan="5"></td>
                                  </tr>
                                  <tr class="tbg3"> 
                                    <td class="t2" width="159"> 01001</td>
                                    <td class="sBg"></td>
                                    <td class="t3">&nbsp;부교재</td>
                                    <td class="sBg"></td>
                                    <td class="t2" width="200"> 
                                   		<fmt:formatNumber var="txtbookcostAxbook" value="${rsCrs_CostBudget.txtbookcostAxbook}" pattern="#,##0"></fmt:formatNumber>
                                      <input type="text" name="txtbookcostAxbook" style="width:90%;direction:rtl;" value="${txtbookcostAxbook}" align="right" onkeydown="key_num();" onkeyup="this.value=numchk(this.value);">
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td class="lbg3" colspan="5"></td>
                                  </tr>
                                  <tr> 
                                    <td class="t2" width="159"> 01001</td>
                                    <td class="sBg"></td>
                                    <td class="t3">&nbsp;강사수당</td>
                                    <td class="sBg"></td>
                                    <td class="t2" width="200">
                                    	<fmt:formatNumber var="profcostPay" value="${rsCrs_CostBudget.profcostPay}" pattern="#,##0"></fmt:formatNumber> 
                                      <input type="text" name="profcostPay" style="width:90%;direction:rtl;" value="${profcostPay}" align="right" onkeydown="key_num();" onkeyup="this.value=numchk(this.value);">
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td class="lbg3" colspan="5"></td>
                                  </tr>        
                                  <tr class="tbg3"> 
                                    <td class="t2" width="159"> 01001</td>
                                    <td class="sBg"></td>
                                    <td class="t3">&nbsp;원거리여비</td>
                                    <td class="sBg"></td>
                                    <td class="t2" width="200"> 
																			<fmt:formatNumber var="profcostTravel" value="${rsCrs_CostBudget.profcostTravel}" pattern="#,##0"></fmt:formatNumber>                                     
                                      <input type="text" name="profcostTravel" style="width:90%;direction:rtl;" value="${profcostTravel}" align="right" onkeydown="key_num();" onkeyup="this.value=numchk(this.value);">
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td class="lbg3" colspan="5"></td>
                                  </tr>
                                  <tr> 
                                    <td class="t2" width="159"> 01001</td>
                                    <td class="sBg"></td>
                                    <td class="t3">&nbsp;출제수당</td>
                                    <td class="sBg"></td>
                                    <td class="t2" width="200"> 
																			<fmt:formatNumber var="profcostQuestion" value="${rsCrs_CostBudget.profcostQuestion}" pattern="#,##0"></fmt:formatNumber>                                     
                                      <input type="text" name="profcostQuestion" style="width:90%;direction:rtl;" value="${profcostQuestion}" align="right" onkeydown="key_num();" onkeyup="this.value=numchk(this.value);">
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td class="lbg3" colspan="5"></td>
                                  </tr>  
                                  <tr class="tbg3"> 
                                    <td class="t2" width="159"> 01001</td>
                                    <td class="sBg"></td>
                                    <td class="t3">&nbsp;기타교육경비</td>
                                    <td class="sBg"></td>
                                    <td class="t2" width="200"> 
																			<fmt:formatNumber var="etccost" value="${rsCrs_CostBudget.etccost}" pattern="#,##0"></fmt:formatNumber>                                      
                                      <input type="text" name="etccost" style="width:90%;direction:rtl;" value="${etccost}" align="right" onkeydown="key_num();" onkeyup="this.value=numchk(this.value);">
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td class="lbg3" colspan="5"></td>
                                  </tr>
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
                        <img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" align="absmiddle" alt="저장" onclick="saveCost()" style="cursor:hand"/>
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
	tresize(180);
	searchList('${key}');

//-->
</script>
