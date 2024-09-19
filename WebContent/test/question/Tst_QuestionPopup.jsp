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
	<logic:present name="uploadtext">
		window.onload = function(){
		document.btnSave.onclick = function(){
	       		alert("먼저 업로드할 파일을 선택해야 합니다.");
	          	};
		}
	</logic:present>

	function checkTxtFile() {
        imgurl = document.forms[0].file.value;
        var extension = imgurl.substring(imgurl.lastIndexOf(".") +1 , imgurl.length).toLowerCase();
        if (extension!="txt") {
            alert("txt 형식의 파일만 지원합니다.\t");
            document.forms[0].file.select();
            document.selection.clear();
            document.btnSave.onclick = function(){
            		alert("먼저 업로드할 파일을 선택해야 합니다.");
            	};
            return;
        }
        else
        {
        	document.btnSave.onclick = function(){
            		document.forms[0].submit();
					window.close();
            	};
        	return;
        }
    }
   function save()
   {
		document.forms[0].submit();
		window.close();
   }
	
	
//-->
</script>
<table width="500" border="0" cellspacing="5" cellpadding="0">
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
        <logic:present name="uploadtext">
        <tr> 
          <td height="15">
          	<!-- 머리글 시작 -->
		    <table width="95%" cellpadding="5" cellspacing="0" border="0" align="center">
		        <tr>
		            <td bgcolor="#F3F3F3">
		                <table cellpadding="0" cellspacing="1" border="0" width="100%" bgcolor="#DDDDDD">
		                    <tr>
		                        <td width="100%" bgcolor="#FFFFFF">
	                                <li>학습평가일 경우, 정답번호를 기재한 텍스트화일을 업로드 하십시오.</li>
	                                <li>각 문항의 정답구분은 쉼표(,) 로 합니다.</li>
		                        </td>
		                    </tr>
		                </table>
		            </td>
		        </tr>
		        <tr height="20"><td></td></tr>
		    </table>
		    <!-- 머리글 끝 -->
          </td>
        </tr>
        </logic:present>
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
              <!-- 
              <tr> 
                <td> 
                  <!--테이블 헤더 시작--
                  <table width="440" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="lbg"></td>
                      <td class="cbg"> 
                        <table width="436" border="0" cellspacing="0" cellpadding="0" height="100%">
                          <tr> 
                            <td class="t1" width="34">※ '<font color=red>OMR</font>' 결과파일을 첨부하여 주십시요</td>
                          </tr>
                        </table>
                      </td>
                      <td class="lbg"></td>
                    </tr>
                  </table>
                  <!--테이블 헤더 시작--
                </td>
              </tr>
              -->
              <tr> 
                <td> 
                <logic:present name="exit">
                	<html:form action="tstQuestion.act?task=update&do=exit" target="QuestionMgmt">
	                  <table width="440" border="0" cellspacing="0" cellpadding="0">
	                    <tr> 
	                      <td class="lbg2"></td>
	                      <td width="436"> 
	                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                          <tr> 
	                            <td valign="top"> 
	                            	<table id="mainTable" width="100%" border="0" cellspacing="0" cellpadding="0">
	                                	<tr>
		                                	<td class="s1" width="30%">
		                                		답변(보기) 번호
		                                	</td>
		                                	<td class="sBg"></td>
		                                	<td class="s2">
		                                		<html:hidden name="exit" property="essrl"/>
		                                		<html:hidden name="exit" property="eqnum"/>
		                                		<html:hidden name="exit" property="einum"/>
		                                        <bean:write name="exit" property="einum"/>
		                                	</td>
	                                	</tr>
	                                	<tr>
	                                		<td colspan="31" class="lbg3"></td>
	                                	</tr>
	                                	<tr>
		                                	<td class="s1" width="30%">
		                                		답변(보기) 내용
		                                	</td>
		                                	<td class="sBg"></td>
		                                	<td class="s2">
		                                        <html:text name="exit" property="eisub"/>
		                                	</td>
	                                	</tr>
	                                	<tr>
	                                		<td colspan="31" class="lbg3"></td>
	                                	</tr>
	                                	<tr>
		                                	<td class="s1" width="30%">
		                                		정답여부
		                                	</td>
		                                	<td class="sBg"></td>
		                                	<td class="s2">
		                                        <html:select name="exit" property="eicyn">
		                                        	<html:option value="Y">Y</html:option>
		                                        	<html:option value="N">N</html:option>
		                                        </html:select>
		                                	</td>
	                                	</tr>
	                                </table>
	                            </td>
	                          </tr>
	                        </table>
	                      </td>
	                      <td class="lbg2"></td>
	                    </tr>
	                  </table>
                  	</html:form>
                  	</logic:present>
                  	<logic:present name="exqt">
                	<html:form action="tstQuestion.act?task=update&do=exqt" target="QuestionMgmt">
	                  <table width="440" border="0" cellspacing="0" cellpadding="0">
	                    <tr> 
	                      <td class="lbg2"></td>
	                      <td width="436"> 
	                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                          <tr> 
	                            <td valign="top"> 
	                            	<table id="mainTable" width="100%" border="0" cellspacing="0" cellpadding="0">
	                                	<tr>
		                                	<td class="s1" width="30%">
		                                		문항 번호
		                                	</td>
		                                	<td class="sBg"></td>
		                                	<td class="s2">
		                                		<html:hidden name="exqt" property="essrl"/>
		                                		<html:hidden name="exqt" property="eqnum"/>
		                                        <bean:write name="exqt" property="eqnum"/>
		                                	</td>
	                                	</tr>
	                                	<tr>
	                                		<td colspan="31" class="lbg3"></td>
	                                	</tr>
	                                	<tr>
		                                	<td class="s1" width="30%">
		                                		문항 내용
		                                	</td>
		                                	<td class="sBg"></td>
		                                	<td class="s2">
		                                        <html:text name="exqt" property="eqsub"/>
		                                	</td>
	                                	</tr>
	                                	<tr>
	                                		<td colspan="31" class="lbg3"></td>
	                                	</tr>
	                                	<tr>
		                                	<td class="s1" width="30%">
		                                		문항구분
		                                	</td>
		                                	<td class="sBg"></td>
		                                	<td class="s2">
		                                        <html:select name="exqt" property="eqgbn">
		                                        	<html:option value="A">객관식</html:option>
		                                        	<html:option value="B">주관식</html:option>
		                                        </html:select>
		                                	</td>
	                                	</tr>
	                                	<tr>
	                                		<td colspan="31" class="lbg3"></td>
	                                	</tr>
	                                	<tr>
		                                	<td class="s1" width="30%">
		                                		최대답변
		                                	</td>
		                                	<td class="sBg"></td>
		                                	<td class="s2">
		                                        <html:text name="exqt" property="eqmax"/>
		                                	</td>
	                                	</tr>
	                                	<tr>
	                                		<td colspan="31" class="lbg3"></td>
	                                	</tr>
	                                	<tr>
		                                	<td class="s1" width="30%">
		                                		최소답변
		                                	</td>
		                                	<td class="sBg"></td>
		                                	<td class="s2">
		                                        <html:text name="exqt" property="eqmin"/>
		                                	</td>
	                                	</tr>
	                                </table>
	                            </td>
	                          </tr>
	                        </table>
	                      </td>
	                      <td class="lbg2"></td>
	                    </tr>
	                  </table>
                  	</html:form>
                  	</logic:present>
                  	<logic:present name="uploadtext">
                  	<html:form action="tstQuestion.act?task=uploadtext" enctype="multipart/form-data" target="QuestionMgmt">
                		<html:hidden name="tstQuestionForm" property="essrl"/>
	                  <table width="440" border="0" cellspacing="0" cellpadding="0">
	                    <tr> 
	                      <td class="lbg2"></td>
	                      <td width="436"> 
	                        <table width="436" border="0" cellspacing="0" cellpadding="0">
	                          <tr> 
	                            <td valign="top"> 
	                            	<table id="mainTable" width="429" border="0" cellspacing="0" cellpadding="0">
	                                	<tr>
		                                	<td class="s1" width="30%">
		                                		정답 text파일
		                                	</td>
		                                	<td class="sBg"></td>
		                                	<td class=s2" width="70%">
		                                        <html:file name="tstQuestionForm" property="file" style="height:25;" onchange="checkTxtFile()"/>
		                                	</td>
	                                	</tr>
	                                </table>
	                            </td>
	                          </tr>
	                        </table>
	                      </td>
	                      <td class="lbg2"></td>
	                    </tr>
	                  </table>
                  	</html:form>
                  	</logic:present>
                </td>
              </tr>
              <tr> 
                <td> 
                  <table width="440" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="tbg1"></td>
                    </tr>
                    <tr> 
                      <td height="10"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td> 
                  <!--하단버튼-->
                  <table width="440" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr valign="bottom"> 
                      <td align="right"><img src='<html:rewrite page="/images/board/btn_cancle2.gif"/>' width="57" height="25" alt="취소" align="absmiddle" onclick="javascript:window.close();opener.focus();" style="cursor:hand"/> 
                        <img name="btnSave" src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" align="absmiddle" alt="저장" onclick="save()" style="cursor:hand"/></td>
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


