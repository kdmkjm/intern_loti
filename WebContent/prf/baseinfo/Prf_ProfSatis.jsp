<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script language="JavaScript">
    <!--
    window.onload = function(){
    	document.forms[0].coursecode.value = ${courseCode};
    	selectSatis();
    }
    
	window.onresize = function(){
		//   윈도우 사이즈 변경 셋팅 코드
		tresize(290);
	}
	
	function goList()
	{		
		document.forms[0].action = 'prfSubjectInfo.act?task=list';
		document.forms[0].submit();
	}
	
	function searchList(key)
	{
		setType('04');
		selectSatis()
	}
	
	function setType(type)
	{
		MM_swapImgRestore();
    MM_swapImage('Image'+type,'','<html:rewrite page="/images/resources/select_m_'+type+'_over.gif"/>',1);
    
    document.forms[0].type.value= type;
    selectSatis();
	}
	
	function selectSatis()
	{
		var type = document.forms[0].type.value;
		var url = "prfSatis.act?task=list";
		var profno = document.forms[0].profno.value;
		var coursecode = document.forms[0].coursecode.value;
    var pars = "type="+type+"&profno="+profno+"&coursecode="+coursecode;

		MM_swapImgRestore();
      	MM_swapImage('Image'+type,'','${pageContext.request.contextPath}/images/teacher/tab_m_'+type+'_over.gif',1);

		var myAjax = new Ajax.Request(
						url,
                           {
                               method: 'post',
                               parameters: pars,
                               onComplete: success
                              });
                              
	}

	function success(request)
	{
		$('mainList').innerHTML = request.responseText;
		tresize(290);
	}
	
	function DoExcel(){
		var profno = document.forms[0].profno.value;
		var coursecode = document.forms[0].coursecode.value;
		
		document.getElementById("actionFrame").src = '<html:rewrite page="/prfSatis.act?task=excel&profno='+profno+'&coursecode='+coursecode+'"/>'
	}
	
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">


  <tr> 
    <td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
  </tr>
  <tr> 
    <td> 
      <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/teacher/title_01-5.gif"/>' alt="강사정보-강사 만족도 조회" width="219" height="18" /></td>
        </tr>
        <tr> 
          <td height="15"></td>
        </tr>
        <tr> 
          <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />강사기본정보</td>
        </tr>
        <tr> 
          <td> 
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                	<html:form action="prfSatis.act?=info" onsubmit="return false">
						<html:hidden property="searchKeyword" value="${searchKeyword}"/>
						<html:hidden property="searchProfLevel" value="${searchProfLevel}"/>
						<html:hidden property="searchKeywordLecType" value="${searchKeywordLecType}"/>
						<html:hidden property="searchKeywordIsDate" value="${searchKeywordIsDate}"/>
                	<input type="hidden" name="profno" value="${rsPrf_ProfSatis.profno }">
                	<input type="hidden" name="type">
                  <!--검색 테이블 시작-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="89" class="s1">성명</td>
                            <td class="sBar"></td>
                            <td width="109" class="s2"> ${rsPrf_ProfSatis.profname}</td>
                            <td class="sBar"></td>
                            <td width="89" class="s1">연락처</td>
                            <td class="sBar"></td>
                            <td width="119" class="s2"> ${rsPrf_ProfSatis.cellphone}</td>
							  						<td class="sBar"></td>
                            <td width="89" class="s1">과정</td>
                            <td class="sBar"></td>
                            <td class="s2"> 
					          <html:select property="coursecode" style="width:200px;" onchange="selectSatis();">
							      	<html:optionsCollection name="prfCourseCode" property="beanCollection" />
						      </html:select>
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
                <td height="8"></td>
              </tr>
              <tr> 
                <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />만족도</td>
              </tr>
              <tr> 
                <td> 
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="82" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="setType('04');" ><img name="Image04" border="0" src='<html:rewrite page="/images/teacher/tab_m_04.gif"/>' width="80" height="24" alt="과목별" /></a></td>
                      <td width="82" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="setType('03');" ><img name="Image03" border="0" src='<html:rewrite page="/images/teacher/tab_m_03.gif"/>' width="80" height="24" alt="직렬별" /></a></td>                      
                      <td width="82" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="setType('02');" ><img name="Image02" border="0" src='<html:rewrite page="/images/teacher/tab_m_02.gif"/>' width="80" height="24" alt="직급별" /></a></td>
                      <td width="82" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="setType('05');" ><img name="Image05" border="0" src='<html:rewrite page="/images/teacher/tab_m_05.gif"/>' width="80" height="24" alt="성별" /></a></td>
                      <td background='<html:rewrite page="/images/edu/month_bg.gif"/>'>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="4"></td>
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
                            <td class="t1" width="119">구분</td>
                            <td class="sBg"></td>
                            <td class="t1" width="119">만족도 점수</td>
                            <td class="sBg"></td>
                            <td class="t1">점수 분포</td>
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
                              <form name="fromFrm">
                              <!--리스트 시작-->
                              <div id="mainList" style="width:746px; overflow-y:scroll; overflow-x:hidden;"> 
                                
                              </div>
                              <!--리스트 끝-->
                              </form>                            
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
<%--                       <td><img src='<html:rewrite page="/images/board/btn_excel.gif"/>' width="94" height="25" align="absmiddle" alt="엑셀다운로드" onclick="DoExcel()" style="cursor:hand"/></td> --%>
                      <td align="right"><img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" align="absmiddle" alt="목록" onclick="goList()" style="cursor:hand"/></td>
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
<iframe id="actionFrame" width="0" height="0"></iframe>
<script type="text/javascript">
<!--
	tresize(290);
//-->
</script>
