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
<script language="javascript" type="text/javascript" src="/common/js/common.js"></script>
<script language="JavaScript">
	<!--
	window.name = "ScoreMgmt";

  function modifyScorePopup(coursecode, subjectcode, stdno)
  {
  	var cmidf = coursecode;
  	var sbidf = subjectcode;
  	var sduno = stdno;
	window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 
	'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
  }
  
  function setRank()
  {
  	var coursecode = document.forms[0].searchCourseCode.value;
  	var coursename = document.forms[0].searchCourseName.value;
	 	var searchSort = document.all.searchSort.value; 
  	if(coursename == "")
  	{
  		alert("���� ���þ��� ���� ������� �� �����ϴ�.");
  		return;
  	}
  	document.forms[0].action = "tstScore.act?task=rank" 
  	document.forms[0].submit();
  }
  
  function setCrs()
	{
		var searchCode = document.all.searchCourseCode.value;
		// type ���� �Ѱ��ش�. (onlyCrs) 
		window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
	
  function updateScoreForm(essrl, sduno, ekmr)
  {
  		if("${rsTst_SubjInfo.esisu}" == 'Y')
  		{
  			alert("����ó���� �Ϸ�� �����Դϴ�.");
  			return;
  		}
  		size_w = 450;
  		size_h = 200;
  		
  		var url = '<html:rewrite page="/tstScore.act';
  		url += '?task=updatescoreform';
  		url += '&essrl=' + essrl;
  		url += '&sduno=' + sduno;
  		url += '&scoregbn=' + '${rsTst_SubjInfo.scoregbn}';
  		url += '&ekmr='+ ekmr + '"/>';
  		target = '_blank';
		openWinSetPo(url, target, '', size_w, size_h);
  		
  }
  
   function openUploadOMRForm()
   {
   		if("${rsTst_SubjInfo.esisu}" == 'Y')
  		{
  			alert("����ó���� �Ϸ�� �����Դϴ�.");
  			return;
  		}
  		
  		size_w = 460;
  		size_h = 270;
  		
  		var url = '<html:rewrite page="/tstScore.act';
  		url += '?task=uploadomrform'
  		url += '&cmidf=' + '${rsTst_SubjInfo.cmidf}';
  		url += '&sbidf=' + '${rsTst_SubjInfo.sbidf}';
  		url += '&esetp=' + '${rsTst_SubjInfo.esetp}';
  		url += '&scoregbn=' + '${rsTst_SubjInfo.scoregbn}';
  		url += '"/>';
  		target = '_blank';
		openWinSetPo(url, target, '', size_w, size_h);
	}
  
  	function deleteScore()
  	{
  		var url='/tstScore.act?task=delete';
  		document.tstScoreForm.action = url;
  		document.tstScoreForm.submit();
  	}
  	
  	function batch()
  	{
  		var score;
  		var gbn;
  		if("${rsTst_SubjInfo.esetp}" == '5120')
  		{
  			score = "${rsTst_SubjInfo.estsp}";
  			gbn = "�Ǳ�";
  		}
  		else if("${rsTst_SubjInfo.esetp}" == '5130')
  		{
  			score = "${rsTst_SubjInfo.esgtp}";
  			gbn = "����";
  		}
  		
  		if(!confirm(gbn + "������ �ϰ������Ͻðڽ��ϱ�?\n����� ������ '"+ score + "' �Դϴ�."))
  		{
  			return;
  		}
  		
  		if("${rsTst_SubjInfo.esisu}" == 'Y')
  		{
  			alert("����ó���� �Ϸ�� �����Դϴ�.");
  			return;
  		}
  		
  		document.location.href = "/tstScore.act?task=scorebatchprocessing&cmidf=${rsTst_SubjInfo.cmidf }&sbidf=${rsTst_SubjInfo.sbidf }&scoregbn=${rsTst_SubjInfo.scoregbn}&searchSort=${tstScoreForm.searchSort }";
  	}
  	
  	function evaldone()
  	{
  		if(!confirm("���� �򰡸� �Ϸ��մϴ�."))
  		{
  			return;
  		}
  		document.location.href = "/tstSubject.act?task=evaldone&cmidf=${rsTst_SubjInfo.cmidf }&sbidf=${rsTst_SubjInfo.sbidf }&curesisu=${rsTst_SubjInfo.esisu }&scoregbn=${rsTst_SubjInfo.scoregbn}";
  	}
  	
  	function updateTeamScore()
  	{
  		if("${rsTst_SubjInfo.esisu}" == 'Y')
  		{
  			alert("����ó���� �Ϸ�� �����Դϴ�.");
  			return;
  		}
  		document.forms[0].action='/tstScore.act?task=teamscoreupdate';
  		document.forms[0].submit();
  	}
  	
  	function selectTeam(obj)
  	{
  		var teamno = obj.options[obj.selectedIndex].value;
  		var chks = document.getElementsByName('sduno_array');
  		for(var i=0; i<chks.length; i++){
  			if(chks[i].className == teamno){
  				chks[i].checked = true;
  			}
  			else{
  				chks[i].checked = false;
  			}
  		}
  	}
  	
  	var selected = false;
  	function selectall(){
  	var chks = document.getElementsByName('sduno_array');
  		if(selected == false)
  		{
  			selected = true;
  		}
  		else if(selected == true)
  		{
  			selected = false;
  		}
  		for(var i=0; i<chks.length; i++){
  				chks[i].checked = selected;
		}
  	}
  	
  	function resetScore(){
  		if("${rsTst_SubjInfo.esisu}" == 'Y')
  		{
  			alert("����ó���� �Ϸ�� �����Դϴ�.");
  			return;
  		}
  		if(confirm("�� ������ ������ �ʱ�ȭ�˴ϴ�.\n����Ͻðڽ��ϱ�?")){
	  		document.forms[0].action='/tstScore.act?task=resetscore';
	  		document.forms[0].submit();
  		}
  	}
//-->
</script>

<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="��������" src="/images/poll/title_02-7.gif" /></h1>
	</div>
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
    <!--�򰡰��� �⺻���� ����-->
      <table width="750" border="0" cellspacing="0" cellpadding="0" >
      <tr> 
      <td class="lbg"></td>
      <td class="cbg"> 
          <table width="746" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="119" class="t1" colspan="99" style="text-align:left;">&nbsp;�򰡰��� �⺻����</td>
          </tr>
          </table>
      </td>
      <td class="lbg"></td>
      </tr>
      <tr>
      	<td class="lbg"></td>
      	<td>
	      	<table width="746" border="0" cellspacing="0" cellpadding="0">
	          <tr>
				<td class="s1" width="100">�����</td>
				<td class="sBg"></td>
				<td class="s2">&nbsp;${rsTst_SubjInfo.sbnam}</td>
				<td class="sBg"></td>
				<td class="s1" width="100">�򰡹��</td>
				<td class="sBg"></td>
	            <td class="s2">
			  		<c:if test="${rsTst_SubjInfo.esetp eq '5110'}">&nbsp;�н���</c:if>
	            	<c:if test="${rsTst_SubjInfo.esetp eq '5120'}">&nbsp;�ǽ���</c:if>
	            	<c:if test="${rsTst_SubjInfo.esetp eq '5130'}">&nbsp;����</c:if>
			  	</td>
			  </tr>
			  <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
	          <tr>
	          	<td class="s1" width="100">������</td>
	          	<td class="sBg"></td>
	          	<td class="s2">
	          		<c:choose>
	          			<c:when test="${rsTst_SubjInfo.esetp eq '5110'}">${rsTst_SubjInfo.esotp + rsTst_SubjInfo.esstp} ��</c:when>
	          			<c:when test="${rsTst_SubjInfo.esetp eq '5120'}">${rsTst_SubjInfo.estsp} ��</c:when>
	          			<c:when test="${rsTst_SubjInfo.esetp eq '5130'}">${rsTst_SubjInfo.esgtp} ��</c:when>
	          		</c:choose>
	          	</td>
	          	<td class="sBg"></td>
	          	<td class="s1" width="100">�򰡴���ο�</td>
	          	<td class="sBg"></td>
	          	<td class="s2" id="stdCount">
					
				</td>
	          </tr>
	         </table>
	      </td>
	      <td class="lbg"></td>
      </tr>
      </table>
      <!--�򰡰��� �⺻���� ��-->

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
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td style="height:5px;"></td>
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
<html:form action="/tstScore.act?task=teamscoreupdate" method="post" target="ScoreMgmt">
<html:hidden name="rsTst_SubjInfo" property="essrl"/>
<html:hidden name="rsTst_SubjInfo" property="cmidf"/>
<html:hidden name="rsTst_SubjInfo" property="sbidf"/>
<html:hidden name="rsTst_SubjInfo" property="esetp"/>
<html:hidden name="rsTst_SubjInfo" property="scoregbn"/>
<c:if test="${rsTst_SubjInfo.esetp eq '5110'}">
<tr> 
  <td> 
    <!--���̺� ��� ����-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" >
    <tr> 
      <td class="lbg"></td>
      <td class="cbg"> 
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        
        <tr>
          <td class="t1" width="50"><a href="#" onclick="selectall()" style="cursor:hand">����</a></td>
          <td class="sBg"></td>
          <td class="t1" width="70">����</td>
          <td class="sBg"></td>
          <td class="t1" width="70">������</td>
          <td class="sBg"></td>
          <td class="t1" width="100">��������</td>
          <td class="sBg"></td>
		  <td class="t1" width="86">����������</td>
	      <td class="sBg"></td>
		  <td class="t1" width="86">�ְ�������</td>
          <td class="sBg"></td>
          <td class="t1" width="86">����������</td>
          <td class="sBg"></td>
          <td class="t1" width="86">����������</td>
          <td class="sBg"></td>
          <td class="t1" width="86">�������</td>
         <td class="t1" width="18">&nbsp;</td>
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
    <table width="750" border="0" cellspacing="0" cellpadding="0" style="text-align: center;">
	    <tr> 
	      <td class="lbg2"></td>
	      <td width="746"> 
	        <table width="746" border="0" cellspacing="0" cellpadding="0">
	        <tr> 
	          <td valign="top"> 
	            <!--����Ʈ ����-->
	            
	            <div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden" > 
	              <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		              <c:forEach var="scoreList" items="${rsTst_ScoreList}" varStatus="i">
		                <c:if test="${i.count%2 eq 0}"><c:set var="trstyle" value="tbg3"/></c:if>
		                <c:if test="${i.count%2 eq 1}"><c:set var="trstyle" value=""/></c:if>
						  <tr class="${trstyle }">
						  	<td class="t2" width="50"><input type="checkbox" value="${scoreList.sduno }" name="sduno_array" class="${scoreList.teamno }"><!--<html:checkbox property="sduno_array" value="${scoreList.sduno}"></html:checkbox>--></td>
				            <td class="sBg"></td>
				            <td class="t2" width="70">${scoreList.sduno }</td>
				            <td class="sBg"></td>
				            <td class="t2" width="70">${scoreList.teamno }</td>
				            <td class="sBg"></td>
				            <td class="t2" width="100">${scoreList.stdname }</td>
				            <td class="sBg"></td>
							<td class="t2" width="86">
								<a href="#" onclick="updateScoreForm('${scoreList.essrl}', '${scoreList.sduno}', 'ekotp')">${scoreList.ekotp }</a>
							</td>
							<td class="sBg"></td>
							<td class="t2" width="86">
								<a href="#" onclick="updateScoreForm('${scoreList.essrl}', '${scoreList.sduno}', 'ekstp')">${scoreList.ekstp }</a>
							</td>
				            <td class="sBg"></td>
				            <td class="t2" width="86">
								<a href="#" onclick="updateScoreForm('${scoreList.essrl}', '${scoreList.sduno}', 'ekrtp')">${scoreList.ekrtp }</a>
							</td>
				            <td class="sBg"></td>
				            <td class="t2" width="86">
								<a href="#" onclick="updateScoreForm('${scoreList.essrl}', '${scoreList.sduno}', 'ekhwp')">${scoreList.ekhwp }</a>
							</td>
				            <td class="sBg"></td>
				            <td class="t2" width="86">${scoreList.ektop }</td>
				          </tr>
				          <tr> 
				            <td class="lbg3" colspan="29"></td>
				          </tr>     
		                <c:set value="${i.count}" var="count"/>  
		              </c:forEach>
		              <c:if test="${count==null}">
						<tr class="tbg3">
						  <td class="t2" colspan="99">��ȸ�� �����Ͱ� �����ϴ�.</td>
						</tr>
					  </c:if>
	              </table>
	            </div>
	            <!--����Ʈ ��-->
	          </td>
	        </tr>
	        </table>
	      </td>
	      <td class="lbg2"></td>
	    </tr>
    </table>
  </td>
</tr>
	</c:if>
	
	<c:if test="${rsTst_SubjInfo.esetp eq '5120' or rsTst_SubjInfo.esetp eq'5130'}">
<tr>
  <td>
   <!--���̺� ��� ����-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" >
    <tr> 
      <td class="lbg"></td>
      <td class="cbg"> 
        <table width="746" border="0" cellspacing="0" cellpadding="0" height="70%">
        <tr>
          <td class="t1" width="50"><a href="#" onclick="selectall()" style="cursor:hand">����</a></td>
          <td class="sBg"></td>
          <td class="t1" width="70">����</td>
          <td class="sBg"></td>
          <td class="t1" width="70">������</td>
          <td class="sBg"></td>
          <td class="t1" width="110">��������</td>
          <td class="sBg"></td>
          <c:if test="${rsTst_SubjInfo.esetp eq '5120'}">
         	<td class="t1" width="106">�ǽ�������</td>
          </c:if>
      	  <c:if test="${rsTst_SubjInfo.esetp eq '5130'}">
      	 	<td class="t1" width="106">��������</td>
      	  </c:if>
          <td class="sBg"></td>
          <td class="t1" width="106">����������</td>
          <td class="sBg"></td>
          <td class="t1" width="106">����������</td>
          <td class="sBg"></td>
          <td class="t1" width="106">�������</td>
         <td class="t1" width="18">&nbsp;</td>
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
    <table width="750" border="0" cellspacing="0" cellpadding="0" style="text-align: center;">
    <tr> 
      <td class="lbg2"></td>
      <td width="746"> 
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td valign="top"> 
            <!--����Ʈ ����-->
            
            <div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden" > 
              <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
              <c:forEach var="scoreList" items="${rsTst_ScoreList}" varStatus="i">
                <c:if test="${i.count%2 eq 0}"><c:set var="trstyle" value="tbg3"/></c:if>
                <c:if test="${i.count%2 eq 1}"><c:set var="trstyle" value=""/></c:if>
				  <tr class="${trstyle }"> 
				  	<td class="t2" width="50"><input type="checkbox" value="${scoreList.sduno }" name="sduno_array" class="${scoreList.teamno }"><!--<html:checkbox property="sduno_array" value="${scoreList.sduno}"></html:checkbox>--></td>
		            <td class="sBg"></td>
		            <td class="t2" width="70">${scoreList.sduno }</td>
		            <td class="sBg"></td>
		            <td class="t2" width="70">${scoreList.teamno }</td>
		            <td class="sBg"></td>
		            <td class="t2" width="110">${scoreList.stdname }</td>
		            <td class="sBg"></td>
					<td class="t2" width="106">
						<a href="#" onclick="updateScoreForm('${scoreList.essrl}', '${scoreList.sduno}', 'ekevp')">${scoreList.ekevp }</a>
					</td>
		            <td class="sBg"></td>
		            <td class="t2" width="106">
						<a href="#" onclick="updateScoreForm('${scoreList.essrl}', '${scoreList.sduno}', 'ekrtp')">${scoreList.ekrtp }</a>
					</td>
		            <td class="sBg"></td>
		            <td class="t2" width="106">
						<a href="#" onclick="updateScoreForm('${scoreList.essrl}', '${scoreList.sduno}', 'ekhwp')">${scoreList.ekhwp }</a>
					</td>
		            <td class="sBg"></td>
		            <td class="t2" width="106">${scoreList.ektop }</td>
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr>     
                <c:set value="${i.count}" var="count"/>  
              </c:forEach>
              <c:if test="${count==null}">
				<tr class="tbg3">
				  <td class="t2" colspan="99">��ȸ�� �����Ͱ� �����ϴ�.</td>
				</tr>
			  </c:if>
              </table>
            </div>
            <!--����Ʈ ��-->
          </td>
        </tr>
        </table>
      </td>
      <td class="lbg2"></td>
    </tr>
    </table>
  </td>
</tr>
</c:if>
<tr> 
  <td> 
    <table width="750" border="0" cellspacing="0" cellpadding="0">
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
    <!--�ϴܹ�ư-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
    <tr valign="top"> 
      <td>
        <c:if test="${rsTst_SubjInfo.esetp eq '5110'}">
        	<img src="/images/poll/btn_omr_upload.gif" onclick="openUploadOMRForm()" style="cursor:hand" alt="OMR�ؽ�Ʈ���� ���ε�"/>
        </c:if>
        <c:if test="${rsTst_SubjInfo.esetp eq '5120'}">
        	<img src="/images/poll/btn_batch1.gif" onclick="batch()" style="cursor:hand" alt="�Ǳ����� �ϰ�ó��"/>
        </c:if>
        <c:if test="${rsTst_SubjInfo.esetp eq '5130'}">
        	<img src="/images/poll/btn_batch2.gif" onclick="batch()" style="cursor:hand" alt="�������� �ϰ�ó��"/>
        </c:if>
        <c:if test="${rsTst_SubjInfo.esisu eq 'N'}">
        	<img src="/images/poll/btn_eval_done.gif" onclick="evaldone()" style="cursor:hand" alt="������ �Ϸ�"/>
        </c:if>
        <img src="images/board/btn_reset.gif" onclick="resetScore()" alt="���� �ʱ�ȭ" style="cursor:hand"/>
        <img src="images/board/btn_list.gif" onclick="document.location.href='/tstSubject.act?task=list&searchCourseCode=${rsTst_SubjInfo.cmidf }&searchSort=${tstScoreForm.searchSort }'" style="cursor:hand" alt="���"/>
      </td>
      <td align="right">&nbsp;
	      <select onchange="selectTeam(this)">
	      	<option value="">������ ����</option>
	      	<option value="">------</option>
	      	<c:forEach var="teamno" items="${rsTst_TeamNo}">
	      		<option value="${teamno }">${teamno }��</option>
	      	</c:forEach>
	      </select>
	      <html:text property="teamscore"></html:text>
	      <html:select property="gbn">
	      	<c:if test="${rsTst_SubjInfo.esetp eq '5110'}">
		      	<html:option value="ekotp">����������</html:option>
		      	<html:option value="ekstp">�ְ�������</html:option>
	      	</c:if>
	      	<c:if test="${rsTst_SubjInfo.esetp eq '5120'}">
	      		<html:option value="ekevp">�ǽ�������</html:option>
	      	</c:if>
	      	<c:if test="${rsTst_SubjInfo.esetp eq '5130'}">
	      		<html:option value="ekevp">��������</html:option>
	      	</c:if>
	      	<html:option value="ekrtp">�������������</html:option>
	      	<html:option value="ekhwp">�������������</html:option>
	      </html:select>
	      <img src="/images/board/btn_modify4.gif" alt="��������" align="absmiddle" onclick="updateTeamScore()" style="cursor:hand"/>
      </td>
    </tr>
    </table>
  </td>
</tr>
</html:form>
</table>
<script type="text/javascript">
<!--
	tresize(270);
	
	document.getElementById('stdCount').innerHTML += document.getElementsByName('sduno_array').length +" ��";
	
	window.onresize = function(){
		tresize(270);
	};
//-->
</script>
