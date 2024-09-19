<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>

<link rel="stylesheet" href='<html:rewrite page="/style/main.css"/>' type="text/css" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script type="text/javascript" src='<html:rewrite page="/common/js/jquery-1.7.1.min.js"/>'></script>
<script language="JavaScript">
	<!--
	window.name = 'InsertSubject';
	$.noConflict();
	
	function showPointType() {
		//5110 �н���
		//5120 �ǽ���
		//5130 ����
		var PointType1 = document.getElementById('PointType1');
		var PointType2 = document.getElementById('PointType2');
		var PointType3 = document.getElementById('PointType3');
        if (document.tstSubjectForm.esetp.value == "5110") {
           	PointType1.style.display = 'inline';
            PointType2.style.display = 'none';
            PointType3.style.display = 'none';
        } else if (document.tstSubjectForm.esetp.value == "5120") {
            PointType1.style.display = 'none';
            PointType2.style.display = 'inline';
            PointType3.style.display = 'none';
        } else if (document.tstSubjectForm.esetp.value == "5130") {
            PointType1.style.display = 'none';
            PointType2.style.display = 'none';
            PointType3.style.display = 'inline';
        }
        else
        {
        	PointType1.style.display = 'none';
            PointType2.style.display = 'none';
            PointType3.style.display = 'none';
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
    
    function getSelectBoxCmidf()
	{
		var action = '/tstSubject.act?task=selection';
		action += '&do=year&year=' + document.forms[0].esyer.value;
		jQuery.ajax({
			url: "tstSubject.act",
			type: "GET",
			data: "task=selection&do=year&year=" + document.forms[0].esyer.value,
			cache: false,
			success: function(msg){
				jQuery('#cmidf_option')
					.html('')
					.append('<option value="">��������</option><option value="">----------------------------</option>')
					.append(msg);
			}
		});
		
		
	}
	

	function checkSbidf()
	{
		var frm = document.forms[0];
		
		// �����ڵ尡 ����-> �򰡹�� ���·� ����
		if(frm.sbidf.value.indexOf('GUN') == 0)
		{
			frm.esetp.value = '5130';
		}
		else
		{
			frm.esetp.value = '';
		}
		
		showPointType();
		setEsseq();
	}
  var isSubmitted = false;
  function checkComplete()
  {
  		var frm = document.forms[0];
  		if(frm.esyer.value == '')
		{
			alert('�����⵵�� �������ּ���');
			frm.esyer.focus();
			return;
		}
		
		if(frm.cmidf.value == '')
		{
			alert('�������� �������ּ���');
			frm.cmidf.focus();
			return; 
		}
		if(frm.sbidf.value == '')
		{
			alert('������ �������ּ���.');
			frm.sbidf.focus();
			return;
		}
		if(frm.scoregbn.value=='')
		{
			alert('���������� �������ּ���.');
			frm.scoregbn.focus();
			return;
		}
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
		frm.action = '/tstSubject.act?task=insertsubjinfo';
		frm.target = '_self';
		if (!isSubmitted) {
			isSubmitted = true;
			frm.submit();
		} 
  }
  
  function setEsseq()
  {
  	var frm = document.forms[0];
  	if(frm.esyer.value == '')
  	{
  		alert("�����⵵�� �������ּ���");
  		return;
  	}
	jQuery.ajax({
		url: "tstSubject.act",
		type: "GET",
		data: "task=selection&do=esseq&year="+jQuery('#selectyear option:selected').val(),
		cache: false,
		dataType: "xml",
		success: function(msg){
			var esseq = jQuery('esseq', msg).text();
			var cjsrl = jQuery('cjsrl', msg).text();
			jQuery('input[name=esseq]').val(esseq);
			jQuery('input[name=cjsrl]').val(cjsrl);
		}
	});
  }
  
  function toList()
	{
		var url = '/tstSubject.act?task=list';
		document.tstSubjectForm.target='_self';
		document.tstSubjectForm.action=url;
		document.tstSubjectForm.submit();
	}
  function searchSubject()
  {
	var searchword = jQuery('#SearchWord');
	jQuery.ajax({
		url: "tstSubject.act",
		type: "GET",
		data: "task=selection&do=subject&searchword=" + searchword.val(),
		cache: false,
		success: function(msg){
			if(msg == 0){
				alert('�˻������ �����ϴ�.');
				searchword.focus();
			}else{
				jQuery('#sbidf_option')
					.html('')
					.append('<option value="">����</option><option value="">----------------</option>')
					.append(msg)
					.focus();
			}
		}
	});
		
  }
//-->
</script>
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
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="tbg2"></td>
    </tr>
    </table>
  </td>
</tr>
<tr>
	<td>
	<html:form action="/tstSubject.act?task=insertsubjinfo" method="post"> 
    <!--�򰡰��� �⺻���� ����-->
      <table width="752" border="0" cellspacing="0" cellpadding="0">
      <tr> 
      <td class="lbg"></td>
      <td class="cbg"> 
          <table width="744" border="0" cellspacing="0" cellpadding="0" align="center">
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
	      		<IFRAME id="SelectBoxIframe" name="SelectBoxIframe" border="1" frameborder="0" scrolling="yes" width="1" height="1"></IFRAME>
		      	<table width="744" border="0" cellspacing="0" cellpadding="0" align="center">
		      	<logic:present name="yearOptions">
		      	  <tr>	
		      	  	<td width="20%" class="s1">����<font color=red>*</font></td>
		      	  	<td class="sBg"></td>
	               	<td colspan="5">
	               		&nbsp;
	               		<select name="esyer" id="selectyear" onchange="getSelectBoxCmidf()">
	               			<option value="">�⵵����</option>
	               			<option value="">-------</option>
	               			<bean:write name="yearOptions" filter="HTML"/>
	               		</select>
	               		<select name="cmidf" id="cmidf_option">
	               			<option value="">��������</option>
	               			<option value="">----------------------------</option>
							<logic:present name="courseOptions">
							<bean:write name="courseOptions" filter="HTML"/>
							</logic:present>
	               		</select>
	               	</td>
               	  </tr>
               	  <tr> 
	            	<td class="lbg3" colspan="29"></td>
	         	  </tr>
		          <tr>
		          	<td class="s1" width="20%">����<font color=red>*</font></td>
		          	<td class="sBg"></td>
		          	<td colspan="5" height="50">&nbsp;
		             	<input type="text" size="15" id="SearchWord" onkeydown="if(event.keyCode==13)searchSubject();"/><img src="/images/board/btn_zoom.gif" style="cursor:hand" onclick="searchSubject()"/>
		              <br>&nbsp;
		              <span id="span_sbnam">
		              	<select name="sbidf" id="sbidf_option" style="width:90%;" onchange="checkSbidf()">
		        			<option value="">����</option>
		        			<option value="">----------------</option>
	        			</select>
		              </span>
			        	<!-- <span id="span_sbnam">
			        		<select name="sbnam">
			        			<option value="">�������</option>
			        			<option value="">----------------</option>
			        		</select>
			        	</span>
			        
			        	<html:text name="tstSubjectForm" property="sbnam" size="40"/>-->
			        
		            </td>
		          </tr>
		          </logic:present>
		          <logic:present name="courseinfo">
		          <tr>	
		      	  	<td width="20%" class="s1">����<font color=red>*</font></td>
		      	  	<td class="sBg"></td>
	               	<td colspan="5">
	               		
	               	</td>
               	  </tr>
               	  <tr> 
	            	<td class="lbg3" colspan="29"></td>
	         	  </tr>
		          <tr>
		          	<td class="s1" width="20%">����<font color=red>*</font></td>
		          	<td class="sBg"></td>
		          	<td colspan="5" height="50">&nbsp;
		              	
		            </td>
		          </tr>
		          </logic:present>
		          <tr> 
	            	<td class="lbg3" colspan="29"></td>
	         	  </tr>
		          <tr>
		          	<td class="s1" width="20%">������</td>
		          	<td class="sBg"></td>
		          	<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esseq" readonly="true"/></td>
		          	<td class="sBg"></td>
		          	<td class="s1" width="20%">���������������</td>
		          	<td class="sBg"></td>
		          	<td>&nbsp;<html:text name="tstSubjectForm" property="cjsrl" readonly="true"/></td>
		          </tr>
		          <tr> 
	            	<td class="lbg3" colspan="29"></td>
	         	  </tr>
		          <tr>
		          	<td class="s1" width="20%">�ʼ��̼�����</td>
		          	<td class="sBg"></td>
		          	<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esisp" value="0" size="5" maxlength="5"/> ��</td>
		          	<td class="sBg"></td>
		          	<td class="s1" width="20%">�ʼ��̼�������</td>
		          	<td class="sBg"></td>
		          	<td>&nbsp;<html:text name="tstSubjectForm" property="esisr" value="0" size="5" maxlength="5"/> ��</td>
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
			        <table width="744" border="0" cellspacing="0" cellpadding="0" align="center">
			        	<tr>
			        		<td class="s1" width="20%">�򰡰����Ĺ���<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="eseop" value="0" size="5" maxlength="5" onblur="setSum();"/> ��</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">���ְ��Ĺ���<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="esesp" value="0" size="5" maxlength="5" onblur="setSum();"/> ��</td>
			        	</tr>
			        	<tr> 
			           		<td class="lbg3" colspan="29"></td>
			         	</tr>
			        	<tr>
			        		<td class="s1" width="20%">�򰡰����Ĺ��׼�<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esoct" value="0" size="5" maxlength="5" onblur="setSum();"/> ����</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">���ְ��Ĺ��׼�<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="essct" value="0" size="5" maxlength="5" onblur="setSum();"/> ����</td>
			        	</tr>
			        	<tr> 
			           		<td class="lbg3" colspan="29"></td>
			         	</tr>
			        	<tr>
			        		<td class="s1" width="20%">�򰡰���������</td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esotp" value="0" size="5" maxlength="5" style="text-align:right; padding-right:5px; IME-MODE:disabled;" readonly="true" onblur="setSum();"/> ��</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">���ְ�������</td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="esstp" value="0" size="5" maxlength="5" style="text-align:right; padding-right:5px; IME-MODE:disabled;" readonly="true" onblur="setSum();"/> ��</td>
			        	</tr>
			        	<tr> 
		           			<td class="lbg3" colspan="29"></td>
		         		</tr>
			         </table>
		         </div>
		         
		         <div id="PointType2" style="display:none;">
			        <table width="744" border="0" cellspacing="0" cellpadding="0" align="center">
			        	<tr>
			        		<td class="s1" width="20%">�ǽ�������<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="estsp" value="0" size="5" maxlength="5" onblur="setSum();"/> ��</td>
			        	</tr>
			        	<tr> 
			           		<td class="lbg3" colspan="29"></td>
			         	</tr>
			        	<tr>
			        		<td class="s1" width="20%">��������<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="essup" value="0" size="5" maxlength="5"/> ��</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">��������<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="eswop" value="0" size="5" maxlength="5"/> ��</td>
			        	</tr>
			        	<tr> 
			           		<td class="lbg3" colspan="29"></td>
			         	</tr>
			        	<tr>
			        		<td class="s1" width="20%">��������<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esyap" value="0" size="5" maxlength="5"/> ��</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">��������<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="esgap" value="0" size="5" maxlength="5"/> ��</td>
			        	</tr>
			        	<tr> 
		           			<td class="lbg3" colspan="29"></td>
		         		</tr>
			         </table>
		         </div>
		         
		         <div id="PointType3" style="display:none;">
			        <table width="744" border="0" cellspacing="0" cellpadding="0" align="center">
			        	<tr>
			        		<td class="s1" width="20%">����������<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esgtp" value="0" size="5" maxlength="5" onblur="setSum();"/> ��</td>
			        		
			        	</tr>
			        	<tr> 
		           			<td class="lbg3" colspan="29"></td>
		         		</tr>
			        </table>
		         </div>
		         
		         <table width="744" border="0" cellspacing="0" cellpadding="0" align="center">
		        	
		        	<tr>
		        		<td class="s1" width="20%">����������</td>
		        		<td class="sBg"></td>
		        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="eshwc" value="0" size="5" maxlength="5" onblur="setSum();"/> ��</td>
		    			<td class="sBg"></td>
		    			<td class="s1" width="20%">����������</td>
		          		<td class="sBg"></td>
		          		<td>&nbsp;<html:text name="tstSubjectForm" property="eshwp" value="0" size="5" maxlength="5" onblur="setSum();"/> ��</td>
		        	</tr>
		        	<tr> 
		           		<td class="lbg3" colspan="29"></td>
		         	</tr>
		        	<tr>
		        		<td class="s1" width="20%">����������</td>
		        		<td class="sBg"></td>
		        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esrtp" value="0" size="5" maxlength="5" onblur="setSum();"/> ��</td>
		    			<td class="sBg"></td>
		    			<td class="s1" width="20%">��������</td>
		          		<td class="sBg"></td>
		          		<td>&nbsp;<html:text name="tstSubjectForm" property="estpt" value="0" size="5" maxlength="5" readonly="ture"/> ��</td>
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
                        <td class="sBar"></td>
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
		  <td class="lbg"></td>
      </tr>

      </table>
      </html:form>
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
      <td height="5"> 
      </td>
    </tr>
    </table>
  </td>
</tr>
<tr> 
   <td> 
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td> 
	      <img src="/images/board/btn_save.gif" onclick="checkComplete()" alt="����" style="cursor:hand"/>
	      <img src="/images/board/btn_cancle2.gif" onclick="toList()" alt="���" style="cursor:hand"/>
      </td>
    </tr>
    </table>
  </td>
</tr>

</table>

<script type="text/javascript">
<!--
	//������ �ε� �Ϸ� �� �򰡹�� ����
	 showPointType();
//-->
</script>
