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

	function showPointType() {
		//5110 �н���
		//5120 �ǽ���
		//5130 ����
        if (document.tstSubjectForm.esetp.value == "5110") {
            $('PointType1').style.display = 'inline';
            $('PointType2').style.display = 'none';
            $('PointType3').style.display = 'none';
        } else if (document.tstSubjectForm.esetp.value == "5120") {
            $('PointType1').style.display = 'none';
            $('PointType2').style.display = 'inline';
            $('PointType3').style.display = 'none';
        } else if (document.tstSubjectForm.esetp.value == "5130") {
            $('PointType1').style.display = 'none';
            $('PointType2').style.display = 'none';
            $('PointType3').style.display = 'inline';
        }
        else
        {
        	$('PointType1').style.display = 'none';
            $('PointType2').style.display = 'none';
            $('PointType3').style.display = 'none';
        }
        setSum();
    }
    function setSum() {
        //5110 �н���
		//5120 �ǽ���
		//5130 ����
        if (document.tstSubjectForm.esetp.value == "5110") {
            document.tstSubjectForm.esotp.value = parseFloat(document.tstSubjectForm.eseop.value) * parseFloat(document.tstSubjectForm.esoct.value);
            document.tstSubjectForm.esstp.value = parseFloat(document.tstSubjectForm.esesp.value) * parseFloat(document.tstSubjectForm.essct.value);
            document.tstSubjectForm.estpt.value = parseFloat(document.tstSubjectForm.esotp.value) + 
        										parseFloat(document.tstSubjectForm.esstp.value) +
        										parseFloat(document.tstSubjectForm.eshwp.value) + 
        										parseFloat(document.tstSubjectForm.esrtp.value); 
        } else if (document.tstSubjectForm.esetp.value == "5120") {
            document.tstSubjectForm.estpt.value = parseFloat(document.tstSubjectForm.estsp.value) + 
	        									parseFloat(document.tstSubjectForm.eshwp.value) + 
	        									parseFloat(document.tstSubjectForm.esrtp.value);
        } else {
            document.tstSubjectForm.estpt.value = parseFloat(document.tstSubjectForm.esgtp.value) + 
	        									parseFloat(document.tstSubjectForm.eshwp.value) + 
	        									parseFloat(document.tstSubjectForm.esrtp.value);
        }
        
    } 
	
	function toList()
	{
		var url = '/tstSubject.act?task=list';
		document.tstSubjectForm.action=url;
		document.tstSubjectForm.submit();
	}
	
	function deleteSubject()
    {
    	if(!confirm("�����Ͻðڽ��ϱ�?"))
  		{
  			return;
  		}
    	var url='/tstSubject.act?task=delete';
    	document.tstSubjectForm.action = url;
    	document.tstSubjectForm.submit();
    }
    
    function done()
    {
    	var esetp = document.forms[0].esetp.value;
    	var scoregbn = document.forms[0].scoregbn.value;
    	if(scoregbn == 'study' || scoregbn == 'foreign'){
    		if(esetp != '5110'){
    			alert("'�н�'�������� �н��򰡸� ������ �� �ֽ��ϴ�.");
    			return;
    		}
    	}
    	else{
    		if(esetp == '5110'){
                var option = document.forms[0].scoregbn;
                var score = option[option.selectedIndex].innerHTML;
    			alert("'"+score+"'�������� '�ǽ���'�� '����'�� ������ �� �ֽ��ϴ�.");
    			return;
    		}
    	}
    	document.tstSubjectForm.submit();
    }

//-->
</script>
<html:form action="/tstSubject.act?task=updatesubjinfo" method="post"> 
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="��������" src="/images/poll/title_01.gif" /></h1>
	</div>
  </td>
</tr>
<tr> 
   <td> 
    <table width="752" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="tbg2"></td>
    </tr>
    </table>
  </td>
</tr>
<tr>
	<td>
    <!--�򰡰��� �⺻���� ����-->
      <table width="752" border="0" cellspacing="0" cellpadding="0">
      <tr> 
      <td class="lbg"></td>
      <td class="cbg"> 
          <table width="748" border="0" cellspacing="0" cellpadding="0">
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
	      	<%-- �� �̿ܰ� ���� --%>
	      	<html:hidden name="tstSubjectForm" property="essrl"/>
	      	<html:hidden name="tstSubjectForm" property="cmidf"/> 
	      	<html:hidden name="tstSubjectForm" property="searchCourseCode"/>
	      	<html:hidden name="tstSubjectForm" property="searchSort"/>
	      	<%-- ���� �� --%>
		      	<table width="748" border="0" cellspacing="0" cellpadding="0">
		          <tr>
					<td class="s1" width="20%">�����ڵ�<font color=red>*</font></td>
					<td class="sBg"></td>
					<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="sbidf" readonly="true"/></td>
					<td class="sBg"></td>
					<td class="s1" width="20%">�����<font color=red>*</font></td>
		            <td class="sBg"></td>
		            <td>&nbsp;<html:text name="tstSubjectForm" property="sbnam" readonly="true"/> </td>
				  </tr>
				  <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr>
		          <tr>
		          	<td class="s1" width="20%">�⵵<font color=red>*</font></td>
		          	<td class="sBg"></td>
		          	<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esyer" readonly="true"/></td>
		          	<td class="sBg"></td>
		          	<td class="s1" width="20%">������<font color=red>*</font></td>
		          	<td class="sBg"></td>
		          	<td>&nbsp;<html:text name="tstSubjectForm" property="esseq" readonly="true"/></td>
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr>
		          <tr>
		          	<td class="s1" width="20%">������������<font color=red>*</font></td>
		          	<td class="sBg"></td>
		          	<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="cjsrl" readonly="true"/></td>
		          	
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr>
		          <tr>
		          	<td class="s1" width="20%">�ʼ��̼�����</td>
		          	<td class="sBg"></td>
		          	<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esisp"/></td>
		          	<td class="sBg"></td>
		          	<td class="s1" width="20%">�ʼ��̼�������</td>
		          	<td class="sBg"></td>
		          	<td>&nbsp;<html:text name="tstSubjectForm" property="esisr"/></td>
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr>
		          <tr>
		          	<td class="s1" width="20%">�򰡹�� <font color=red>*</font></td>
		          	<td class="sBg"></td>
		          	<td width="30%">&nbsp;
                            <html:select name="tstSubjectForm" property="esetp" onchange="showPointType();">
                                <html:option value="">����</html:option>
                                <html:option value="">- - - - - - -</html:option>
								<html:option value="5110">�н���</html:option>
                                <html:option value="5120">�ǽ���</html:option>
                                <html:option value="5130">����</html:option>
                            </html:select>
                    </td>
                    <td class="sBg"></td>
                    <td class="s1" width="20%">Text���й׻�� <font color=red>*</font></td>
                    <td class="sBg"></td>
                    <td>&nbsp;
                        <html:select name="tstSubjectForm" property="esomr">
                        	<html:option value="">����</html:option>
                        	<html:option value="">-------------</html:option>
                        	<html:option value="5110">OMR</html:option>
                        	<html:option value="5120">���۾�</html:option>
                        	<html:option value="5130">������</html:option>
                        </html:select>
                    </td>
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr>
		        </table>
		        
		        <div id="PointType1" style="display:none;">
			        <table width="748" border="0" cellspacing="0" cellpadding="0">
			        	<tr>
			        		<td class="s1" width="20%">�򰡰����Ĺ���<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="eseop" size="5" maxlength="5" onblur="setSum();"/> ��</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">���ְ��Ĺ���<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="esesp" size="5" maxlength="5" onblur="setSum();"/> ��</td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
				        </tr>
			        	<tr>
			        		<td class="s1" width="20%">�򰡰����Ĺ��׼�<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esoct" size="5" maxlength="5" onblur="setSum();"/> ����</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">���ְ��Ĺ��׼�<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="essct" size="5" maxlength="5" onblur="setSum();"/> ����</td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
				        </tr>
			        	<tr>
			        		<td class="s1" width="20%">�򰡰���������</td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esotp" size="5" maxlength="5" style="text-align:right; padding-right:5px; IME-MODE:disabled;" readonly="true" onblur="setSum();"/> ��</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">���ְ�������</td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="esstp" size="5" maxlength="5" style="text-align:right; padding-right:5px; IME-MODE:disabled;" readonly="true" onblur="setSum();"/> ��</td>
			        	</tr>
			         </table>
		         </div>
		         
		         <div id="PointType2" style="display:none;">
			        <table width="748" border="0" cellspacing="0" cellpadding="0">
			        	<tr>
			        		<td class="s1" width="20%">�ǽ�������<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="estsp" size="5" maxlength="5" onblur="setSum();"/> ��</td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
				        </tr>
			        	<tr>
			        		<td class="s1" width="20%">��������<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="essup"/></td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">��������<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="eswop"/></td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
				        </tr>
			        	<tr>
			        		<td class="s1" width="20%">��������<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esyap"/></td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">��������<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="esgap"/></td>
			        	</tr>
			         </table>
		         </div>
		         
		         <div id="PointType3" style="display:none;">
			        <table width="748" border="0" cellspacing="0" cellpadding="0">
			        	<tr>
			        		<td class="s1" width="20%">����������<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td>&nbsp;<html:text name="tstSubjectForm" property="esgtp" size="5" maxlength="5" onblur="setSum();"/> ��</td>
			        		
			        	</tr>
			        </table>
		         </div>
		         
		         <table width="748" border="0" cellspacing="0" cellpadding="0">
		         	<tr> 
			            <td class="lbg3" colspan="29"></td>
			        </tr>
		        	<tr>
		        		<td class="s1" width="20%">����������</td>
		        		<td class="sBg"></td>
		        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="eshwc" size="5" maxlength="5" onblur="setSum();"/> ��</td>
		    			<td class="sBg"></td>
		    			<td class="s1" width="20%">����������</td>
		          		<td class="sBg"></td>
		          		<td>&nbsp;<html:text name="tstSubjectForm" property="eshwp" size="5" maxlength="5" onblur="setSum();"/> ��</td>
		        	</tr>
		        	<tr> 
			            <td class="lbg3" colspan="29"></td>
			        </tr>
		        	<tr>
		        		<td class="s1" width="20%">����������</td>
		        		<td class="sBg"></td>
		        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esrtp" size="5" maxlength="5" onblur="setSum();"/> ��</td>
		    			<td class="sBg"></td>
		    			<td class="s1" width="20%">��������</td>
		          		<td class="sBg"></td>
		          		<td>&nbsp;<html:text name="tstSubjectForm" property="estpt" size="5" maxlength="5" readonly="true"/> ��</td>
		        	</tr>
		        	<tr> 
			            <td class="lbg3" colspan="29"></td>
			        </tr>
		        	<tr>
		        		<td class="s1" width="20%">����ó������ <font color=red>*</font></td>
                        <td class="sBg"></td>
                        <td width="30%">&nbsp;
                            <html:select name="tstSubjectForm" property="esisu">
                            	<html:option value="">����</html:option>
                                <html:option value="">- - - - - - -</html:option>
                                <html:option value="Y">ó���Ϸ�</html:option>
                                <html:option value="N">��ó��</html:option>
                            </html:select>
                        </td>
                        <td class="sBg"></td>
                        <td class="s1" width="20%">�������� <font color=red>*</font></td>
		          		<td class="sBg"></td>
		          		<td>&nbsp;
		          			<html:select name="tstSubjectForm" property="scoregbn">
                                <html:option value="">����</html:option>
                                <html:option value="">- - - - - - -</html:option>
                                <html:option value="study">�н�</html:option>
                                <html:option value="attend">����</html:option>
                                <html:option value="research">�����н�</html:option>
                                <html:option value="team">������</html:option>
                                <html:option value="pra">�ǽ�/�Ǳ�</html:option>
                                <html:option value="foreign">�ܱ����н�</html:option>
                                <html:option value="conver">�ܱ���ȸȭ</html:option>
                                <html:option value="paper">������</html:option>
                                <html:option value="personal">���ΰ���</html:option>
								<html:option value="teamdisc">��������</html:option>
								<html:option value="hobby">��̼Ҿ�</html:option>
								<html:option value="stamina">����ü��</html:option>
								<html:option value="info">����ȭ</html:option>
								<html:option value="value">�ٽɰ�ġ</html:option>
		          			</html:select>
		          		</td>
		        	</tr> 	
		         </table>
		  </td>
		  <!-- �򰡰��� �⺻���� �� -->
		  <td class="lbg"></td>
      </tr>
     </table>
   </td>
</tr>
<tr> 
   <td> 
    <table width="752" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="tbg2"></td>
    </tr>
    </table>
  </td>
</tr>
<tr> 
  <td> 
    <table width="752" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td style="height:5px;"></td>
    </tr>
    </table>
  </td>
</tr>
<tr> 
   <td> 
    <table width="752" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="tbg2"></td>
    </tr>
    </table>
  </td>
</tr>
<tr>
	<td>
     <table width="752" border="0" cellspacing="0" cellpadding="0">
      <!-- �򰡰��� �������� ���� -->
      <tr>
      		<td class="lbg"></td>
       		<td class="cbg"> 
	          <table width="748" border="0" cellspacing="0" cellpadding="0">
	          <tr> 
	            <td width="119" class="t1" colspan="99" style="text-align:left;">&nbsp;�򰡰��� ��������</td>
	          </tr>
	          </table>
	      	</td>
	      	<td class="lbg"></td>
      </tr>
      <tr>
      	<td class="lbg"></td>
   		<td>
   			<table width="748" border="0" cellspacing="0" cellpadding="0">
	   			<tr>
		       		<td class="s1" width="20%">����Ͻ�</td>
		       		<td class="sBg"></td>
		       		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="insdate" readonly="ture"/></td>
		   			<td class="sBg"></td>
		   			<td class="s1" width="20%">�����Ͻ�</td>
		         	<td class="sBg"></td>
		         	<td>&nbsp;<html:text name="tstSubjectForm" property="upddate" readonly="ture"/></td>
	      		</tr>
	      		<tr> 
			        <td class="lbg3" colspan="29"></td>
			    </tr>
			    <tr>
		       		<td class="s1" width="20%">������ID</td>
		       		<td class="sBg"></td>
		       		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="upduser"/></td>
		     		
		      	</tr>
	     	</table>
     	</td>
     	<td class="lbg"></td>
       </tr>
      </table>
      <!--�򰡰��� �������� ��-->
	</td>
</tr>
<tr> 
   <td> 
    <table width="752" border="0" cellspacing="0" cellpadding="0">
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
    <tr>
    	<td>
    		<img src="/images/board/btn_save.gif" onclick="done()" alt="����" style="cursor:hand"/>
		    <img src="/images/board/btn_del.gif" onclick="deleteSubject()" alt="����" style="cursor:hand">
		    <img src="/images/board/btn_list.gif" onclick="toList()" alt="���" style="cursor:hand"/> 
    	</td>
    </tr>
    </table>
  </td>
</tr>
</table>
</html:form>
<script type="text/javascript">
<!--
	//������ �ε� �Ϸ� �� �򰡹���� ���� ȭ�� ����
	 showPointType();
//-->
</script>
