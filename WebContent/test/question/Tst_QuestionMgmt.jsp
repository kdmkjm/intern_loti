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
	window.name = "QuestionMgmt";
	
	//�ϰ�����
	function batchinsert()
	{
		var essrl = '${rsTst_SubjInfo.essrl}';
		var cmidf = '${rsTst_SubjInfo.cmidf}';
		var sbidf = '${rsTst_SubjInfo.sbidf}';
		var url = '/tstQuestion.act?task=batchinsert';
		url += '&essrl=' + essrl;
		url += '&cmidf=' + cmidf;
		url += '&sbidf=' + sbidf;
		document.location.href = url;
	}
	
	//�ϰ�����
	function batchdelete()
	{
		if(!confirm("��� ������ �����մϴ�."))
		{
			return;
		}
		var essrl = '${rsTst_SubjInfo.essrl}';
		var cmidf = '${rsTst_SubjInfo.cmidf}';
		var sbidf = '${rsTst_SubjInfo.sbidf}';
		var url = '/tstQuestion.act?task=batchdelete';
		url += '&essrl=' + essrl;
		url += '&cmidf=' + cmidf;
		url += '&sbidf=' + sbidf;
		document.location.href = url;
	}
	
	//����textó��
	function uploadtext()
	{
		size_w = 450;
  		size_h = 200;
  		
  		var url = '<html:rewrite page="/tstQuestion.act';
  		url += '?task=openpopup'
  		url += '&essrl=' + '${rsTst_SubjInfo.essrl}';
  		url += '&do=uploadtext';
  		url += '"/>';
  		target = '_blank';
		openWinSetPo(url, target, '', size_w, size_h);
	}

	function modify(obj, eqnum, einum)
	{
		size_w = 450;
		if(obj == 'exqt')
  		{
  			size_h = 270;
  		}
  		else if(obj == 'exit')
  		{
  			size_h = 220;
  		}
  		
  		var url = '<html:rewrite page="/tstQuestion.act';
  		url += '?task=openpopup'
  		url += '&essrl=' + '${rsTst_SubjInfo.essrl}';
  		url += '&eqnum=' + eqnum;
  		url += '&do=' + obj;
  		if(einum != '0')
  		{
  			url += '&einum=' + einum;
  		}
  		url += '"/>';
  		target = '_blank';
		openWinSetPo(url, target, 'title', size_w, size_h);
	}
	
	function toList()
	{
		document.location.href="/tstSubject.act?task=list&searchCourseCode=${rsTst_SubjInfo.cmidf}";
	}
  
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="���װ���" src="/images/poll/title_02-6.gif" /></h1>
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
    <table width="750" border="0" cellspacing="0" cellpadding="0">
      <tr> 
      	  <td class="lbg"></td>
	      <td class="cbg"> 
	          <table width="746" border="0" cellspacing="0" cellpadding="0">
		          <tr> 
		            <td width="119" class="t1" style="text-align:left;">&nbsp;�򰡰��� ����</td>
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
				<td class="s1" width="20%">&nbsp;����</td>
				<td class="sBg"></td>
				<td width="30%" colspan="3">&nbsp;${rsTst_SubjInfo.essrl}</td>
			  </tr>
			  <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
			  <tr>
			  	<td class="s1" width="20%">&nbsp;�����</td>
			  	<td class="sBg"></td>
	            <td width="30%" colspan="3">&nbsp;${rsTst_SubjInfo.sbnam } </td>
			  </tr>
			  <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
	          <tr>
	          	<td class="s1" width="20%">����</td>
	          	<td class="sBg"></td>
	          	<td width="30%">&nbsp;${rsTst_SubjInfo.searchCourseName }</td>
	          	<td class="sBg"></td>
	          	<td class="s1" width="100">���</td>
	          	<td class="sBg"></td>
	          	<td>&nbsp;${rsTst_SubjInfo.esseq}</td>
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
  <td>&nbsp;</td>
</tr>
<tr> 
  <td> 
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td></td>
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
		         <td class="t1" width="34" colspan="4" style="text-align:left;">&nbsp;���� �򰡹���/�亯���</td>
		       </tr>
	       </table>
	     </td>
	     <td class="lbg"></td>
	   </tr>
    </table>
    <!--���̺� ��� ��-->
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
	            <!--����Ʈ ����-->
	            <div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden" > 
	              <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
	              <c:forEach var="rsTst_Exqt" items="${rsTst_ExqtList}" varStatus="i">
	              	<tr>
	                	<td class="t1up">����</td>
	                	<td class="s3">&nbsp;${rsTst_Exqt.eqnum}.&nbsp;<html:text name="rsTst_Exqt" property="eqsub" size="55" maxlength="100"/></td>
	                	<td class="s3">
	                		<a href="#" onclick="modify('exqt', '${i.count }', '0')">����</a>
	                		<html:select name="rsTst_Exqt" property="eqgbn">
	                			<html:option value="A">������</html:option>
	                			<html:option value="B">�ְ���</html:option>
	                		</html:select>
	                	</td>
	                </tr>
	               	<tr>
	               		<td class="t1up">�亯</td>
	               		<td colspan="2">
	               			<table width="95%" border="0" cellspacing="1" cellpadding="0">
	               			<c:forEach var="Tst_Exit" items="${rsTst_Exqt.exitList}" varStatus="j">
		       					<tr id="exit${i.count }_${j.count }">
		       						<td class="s3" width="30%">
		       							&nbsp;${Tst_Exit.einum }.&nbsp;${Tst_Exit.eisub }
		       							<c:if test="${Tst_Exit.eicyn eq 'Y'}">v</c:if>
		       							<html:hidden name="Tst_Exit" property="eicyn"/>
		       						</td>
		       						<td class="s3" width="70%" style="text-align:right;">
		       							<a href="#" onclick="modify('exit', '${i.count }', '${j.count }')">����</a>
		       							<!-- <img src="<html:rewrite page="/images/board/btn_minus_off.gif"/>" alt="�亯(����)���� ����" onclick="deleteExit('${i.count}', '${j.count}')"/>-->
		       						</td>
		       					</tr>
	       					</c:forEach>
	       					<logic:empty name="rsTst_Exqt" property="exitList">
	       						<tr>
	       							<td class="s3"></td>
	       						</tr>
	       					</logic:empty>
	               			</table>
	               		</td>
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
      <td height="5"></td>
    </tr>
    </table>
  </td>
</tr>
<tr> 
  <td> 
    <!--�ϴܹ�ư-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
    <tr valign="bottom"> 
      <td>
      	<c:if test="${count==null}">
      		<img src="/images/poll/btn_add_batch.gif" alt="�򰡹��� �ϰ�����" onclick="batchinsert()" style="cursor:hand"/>
      	</c:if>
      	<c:if test="${count!=null}">
      		<img src="/images/poll/btn_del_batch.gif" alt="�򰡹��� �ϰ�����" onclick="batchdelete()" style="cursor:hand"/>
      	</c:if>
      	<img src="/images/poll/btn_answer_text.gif" alt="����TEXTó��" onclick="uploadtext()" style="cursor:hand"/>
      	<img src="/images/board/btn_list.gif" onclick="toList()" alt="���" style="cursor:hand"/>
      </td>
    </tr>
    </table>
  </td>
</tr>
</table>

<script type="text/javascript">
<!--
	tresize(200);
//-->
</script>