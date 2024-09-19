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
	//   ������ ������ ���� ���� �ڵ�
	tresize(210);
	}
	
	// ������ ó�� ������� �⺻������ ��ȸ
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}

  function goList(coursecode)
  {
  	document.location.href = 'tstScore.act?task=list&searchSort=STDNO&searchCourseCode='+coursecode; 
  }
  
  function setCrs()
	{
		window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs"/>', 'popup', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
	
	function setScore(num)
	{
		var doc = document;
		var docForm = doc.forms[0];
		
		if( typeof(docForm.elements['seq_array'].length) == 'undefined' )
		{
			var subj1 	= docForm.subj1_array.value;
			var subj2 	= docForm.subj2_array.value;
			var subj3 	= docForm.subj3_array.value;
			var subj4 	= docForm.subj4_array.value;
			var research  = docForm.research_array.value;
			var team    = docForm.team_array.value;
			var attend	= docForm.attend_array.value;
			var add  		= docForm.add_array.value;
			var pra     = docForm.pra_array.value;
			var etc  		= docForm.etc_array.value;
			
			var stduy = Number(subj1) + Number(subj2)+ Number(subj3) + Number(subj4)
			var totalscore = Number(stduy) + Number(research)+ Number(team) + Number(attend) + Number(add) + Number(pra) + Number(etc); 
			
			if(add >0)
			{
				if(totalscore > 950)
				{
					alert("������ ���� ������ 95%�� ������ �����ϴ�.");
					docForm.add_array.value = 0;
					return;
				}
			}
			docForm.study_array.value = study
			document.all.studytd.innerHtml = study
			document.all.totaltd.innerHTML = totalscore
		}
		else
		{
			var subj1 	= docForm.subj1_array[num-1].value;
			var subj2 	= docForm.subj2_array[num-1].value;
			var subj3 	= docForm.subj3_array[num-1].value;
			var subj4 	= docForm.subj4_array[num-1].value;
			var research  = docForm.research_array[num-1].value;
			var team    = docForm.team_array[num-1].value;
			var attend	= docForm.attend_array[num-1].value;
			var add  		= docForm.add_array[num-1].value;
			var pra     = docForm.pra_array[num-1].value;
			var etc  		= docForm.etc_array[num-1].value;
			
			var study = Number(subj1) + Number(subj2) + Number(subj3) + Number(subj4);
			var totalscore = Number(study) + Number(research) + Number(team) + Number(attend) + Number(add) + Number(pra) + Number(etc);
			if(add >0)
			{ 
				if(totalscore > 950)
				{
					alert("������ ���� ������ 95%�� ������ �����ϴ�.");
					docForm.add_array[num-1].value = 0;
					return;
				}
			}
			docForm.study_array[num-1].value = study
			document.all.studytd[num-1].innerHTML = study
			document.all.totaltd[num-1].innerHTML = totalscore
		}		
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
          <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/poll/title_01-2.gif"/>' alt="�������� - ������ �Է�" width="200" height="18" /></td>
        </tr>
        <tr> 
          <td height="15"></td>
        </tr>
        <tr> 
          <td> 
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                  <!--�˻� ���̺� ����-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td class="s1Left">���� : ${coursename}</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                  <!--�˻� ���̺� ��-->
                </td>
              </tr>
              <tr> 
                <td> 
                  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr> 
                      <td align="right" class="stitle">���� : 1,000��</td>
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
                  <!--���̺� ��� ����-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="lbg"></td>
                      <td class="cbg"> 
                        <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
                          <tr> 
                            <td class="t1" width="34">����</td>
                            <td class="sBg"></td>
                            <td class="t1" width="54">����</td>
                            <td class="sBg"></td>
                            <td class="t1" width="249">
			                      	<table width="100%" cellspacing="0" cellpadding="0">
			                      		<tr>
			                      			<td class="t1" colspan="9">�н�</td>
			                      		</tr>
			                      		<tr> 
			                            <td class="lbg3" colspan="9"></td>
			                          </tr>
			                      		<tr>
			                      			<td class="t1" width="49">��</td>
			                    				<td class="sBg"></td>
			                      			<td class="t1" width="49">����1</td>
			                      			<td class="sBg"></td>
			                      			<td class="t1" width="49">����2</td>
			                      			<td class="sBg"></td>
			                      			<td class="t1" width="49">����3</td>
			                      			<td class="sBg"></td>
			                      			<td class="t1" width="49">����4</td>			                      
			                      		</tr>
			                      	</table>                            
                            </td>
                            <td class="sBg"></td>
                            <td class="t1" width="49">����</td>
                            <td class="sBg"></td>
                            <td class="t1" width="49">����</td>
                            <td class="sBg"></td>
                            <td class="t1" width="49">����</td>
                            <td class="sBg"></td>
                            <td class="t1" width="49">����</td>
                            <td class="sBg"></td>
                            <td class="t1" width="49">�ǽ�<br>
                              /�Ǳ�</td>
                            <td class="sBg"></td>
                            <td class="t1" width="49">��Ÿ</td>
                            <td class="sBg"></td>
                            <td class="t1">����</td>
                            <td width="17"></td>
                          </tr>
                        </table>
                      </td>
                      <td class="lbg"></td>
                    </tr>
                  </table>
                  <!--���̺� ��� ����-->
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
                            	<html:form action="tstScore.act?task=insert">
                            	<input type="hidden" name="coursecode" value="${coursecode }">
                              <!--����Ʈ ����-->
                              <div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden" > 
                                <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
                                	<c:forEach var="scoreList" items="${rsTst_ScoreModList}" varStatus="i">
                                	<input type="hidden" name="seq_array" value="${scoreList.seq }">
                                	<input type="hidden" name="study_array" value="${scoreList.scorestudy }">
                                		<c:if test="${i.count%2 == 0}">
                                			<c:set var="lineBg" scope="request" value="tbg3"/>
                                		</c:if>
                                		<c:if test="${i.count%2 == 1}">
                                			<c:set var="lineBg" scope="request" value=""/>
                                		</c:if>
																		<tr class="${lineBg }"> 
	                                    <td class="t2" width="34">${scoreList.stdno}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="54" title="${scoreList.rankname }${scoreList.rankname }">${scoreList.stdname }</td>
	                                    <td class="sBg"></td>
	                                    <td id="studytd" class="t2" width="49">
	                                    	${scoreList.scorestudy }
	                                    </td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="49"> 
	                                      <input type="text" name="subj1_array" value="${scoreList.scoresubj1 }" style="width:40px; IME-MODE:disabled; direction:rtl;" onkeydown="key_num();" onkeyup="setScore(${i.count});">
	                                    </td>		
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="49"> 
	                                      <input type="text" name="subj2_array" value="${scoreList.scoresubj2 }" style="width:40px; IME-MODE:disabled; direction:rtl;" onkeydown="key_num();" onkeyup="setScore(${i.count});">
	                                    </td>	
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="49"> 
	                                      <input type="text" name="subj3_array" value="${scoreList.scoresubj3 }" style="width:40px; IME-MODE:disabled; direction:rtl;" onkeydown="key_num();" onkeyup="setScore(${i.count});">
	                                    </td>	
	                                    <td class="sBg"></td>		
                                		  <td class="t2" width="49"> 
	                                      <input type="text" name="subj4_array" value="${scoreList.scoresubj4 }" style="width:40px; IME-MODE:disabled; direction:rtl;" onkeydown="key_num();" onkeyup="setScore(${i.count});">
	                                    </td>	
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="49"> 
	                                      <input type="text" name="research_array" value="${scoreList.scoreresearch }" style="width:40px; IME-MODE:disabled; direction:rtl;" onkeydown="key_num();" onkeyup="setScore(${i.count});">
	                                    </td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="49">
	                                    	${scoreList.scoreteam }
	                                    	<input type="hidden" name="team_array" value="${scoreList.scoreteam }" style="width:40px; IME-MODE:disabled; direction:rtl;" onkeydown="key_num();" onkeyup="setScore(${i.count});">
	                                    </td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="49">
	                                    	${scoreList.scoreattend }
	                                    	<input type="hidden" name="attend_array" value="${scoreList.scoreattend }">		                                    
																			</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="49"> 
	                                      <input type="text" name="add_array" value="${scoreList.scoreadd }" style="width:40px; IME-MODE:disabled; direction:rtl;" onkeydown="key_num();" onkeyup="setScore(${i.count});">
	                                    </td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="49"> 
	                                      <input type="text" name="pra_array" value="${scoreList.scorepra }" style="width:40px; IME-MODE:disabled; direction:rtl;" onkeydown="key_num();" onkeyup="setScore(${i.count});">
	                                    </td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="49"> 
	                                      <input type="text" name="etc_array" value="${scoreList.scoreetc }" style="width:40px; IME-MODE:disabled; direction:rtl;" onkeydown="key_num();" onkeyup="setScore(${i.count});">
	                                    </td>
	                                    <td class="sBg"></td>
	                                    <td id="totaltd" class="t2">${scoreList.scoretotal }</td>
	                                  </tr>
	                                  <tr> 
	                                    <td class="lbg3" colspan="27"></td>
	                                  </tr>                                		
                                	</c:forEach>
                                </table>
                              </div>
                              <!--����Ʈ ��-->
                              </html:form>
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
                  <!--�ϴܹ�ư-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr valign="bottom"> 
                      <td align="right"><img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" alt="���" align="absmiddle" onclick="goList('${coursecode}')" style="cursor:hand"/> 
                        <img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" align="absmiddle" alt="����" onclick="document.forms[0].submit()" style="cursor:hand"/></td>
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
<script type="text/javascript">
<!--
	tresize(210);
	searchList('${key}');

//-->
</script>
