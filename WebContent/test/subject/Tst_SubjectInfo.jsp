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
    }
	
	function toList()
	{
		var url = '/tstSubject.act?task=list';
		document.tstSubjectForm.action=url;
		document.tstSubjectForm.submit();
	}
	
	function updateForm()
	{
		document.tstSubjectForm.submit();
	}
//-->
</script>
<html:form action="/tstSubject.act?task=updatesubjinfoform" method="post"> 
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
	
    <!--�򰡰��� �⺻���� ����-->
      <table width="750" border="0" cellspacing="0" cellpadding="0">
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
	      	<%-- �� �̿ܰ� ���� --%>
	      	<html:hidden name="tstSubjectForm" property="cmidf"/> 
			<html:hidden name="tstSubjectForm" property="sbidf"/>
	      	<html:hidden name="tstSubjectForm" property="searchCourseCode"/>
	      	<html:hidden name="tstSubjectForm" property="searchSort"/>
	      	<%-- ���� �� --%>
		      	<table width="746" border="0" cellspacing="0" cellpadding="0">
		          <tr>
					<td class="s1" width="20%">�����ڵ�</td>
					<td class="sBar"></td>
					<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="sbidf"/></td>
					<td class="sBar"></td>
					<td class="s1" width="20%">�����</td>
					<td class="sBar"></td>
		            <td>&nbsp;<bean:write name="tstSubjectForm" property="sbnam"/></td>
				  </tr>
				  <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr> 
		          <tr>
		          	<td class="s1" width="20%">�⵵</td>
		          	<td class="sBar"></td>
		          	<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="esyer"/></td>
		          	<td class="sBar"></td>
		          	<td class="s1" width="20%">������</td>
		          	<td class="sBar"></td>
		          	<td>&nbsp;<bean:write name="tstSubjectForm" property="esseq"/></td>
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr> 
		          <tr>
		          	<td class="s1" width="20%">������������</td>
		          	<td class="sBar"></td>
		          	<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="cjsrl"/></td>
		          	
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr> 
		          <tr>
		          	<td class="s1" width="20%">�ʼ��̼�����</td>
		          	<td class="sBar"></td>
		          	<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="esisp"/></td>
		          	<td class="sBar"></td>
		          	<td class="s1" width="20%">�ʼ��̼�������</td>
		          	<td class="sBar"></td>
		          	<td>&nbsp;<bean:write name="tstSubjectForm" property="esisr"/></td>
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr> 
		          <tr>
		          	<td class="s1" width="20%">�򰡹��</td>
		          	<td class="sBar"></td>
		          	 <td width="30%">&nbsp;
		          	 	<html:hidden name="tstSubjectForm" property="esetp"/>
		          	 	<c:choose>
                      		<c:when test="${tstSubjectForm.esetp eq '5110'}">�н���</c:when>
                      		<c:when test="${tstSubjectForm.esetp eq '5120'}">�ǽ���</c:when>
                      		<c:when test="${tstSubjectForm.esetp eq '5130'}">������</c:when>
                      	</c:choose>
                     </td>
                     <td class="sBar"></td>
                     <td class="s1" width="20%">Text���й׻�� </td>
                     <td class="sBar"></td>
                     <td>&nbsp;
                         <html:hidden name="tstSubjectForm" property="esomr"/>
                         <c:choose>
                      		<c:when test="${tstSubjectForm.esomr eq '5310'}">OMR</c:when>
                      		<c:when test="${tstSubjectForm.esomr eq '5320'}">���۾�</c:when>
                      		<c:when test="${tstSubjectForm.esomr eq '5330'}">������</c:when>
                      	</c:choose>
                     </td>
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
            	  </tr> 
		        </table>
		        
		        <div id="PointType1" style="display:none;">
			        <table width="746" border="0" cellspacing="0" cellpadding="0">
			        	<tr>
			        		<td class="s1" width="20%">�򰡰����Ĺ���</td>
			        		<td class="sBar"></td>
			        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="eseop"/> ��</td>
			    			<td class="sBar"></td>
			    			<td class="s1" width="20%">���ְ��Ĺ���</td>
			    			<td class="sBar"></td>
			          		<td>&nbsp;<bean:write name="tstSubjectForm" property="esesp"/> ��</td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
			            </tr> 
			        	<tr>
			        		<td class="s1" width="20%">�򰡰����Ĺ��׼�</td>
			        		<td class="sBar"></td>
			        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="esoct"/> ����</td>
			    			<td class="sBar"></td>
			    			<td class="s1" width="20%">���ְ��Ĺ��׼�</td>
			    			<td class="sBar"></td>
			          		<td>&nbsp;<bean:write name="tstSubjectForm" property="essct"/> ����</td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
			            </tr> 
			        	<tr>
			        		<td class="s1" width="20%">�򰡰���������</td>
			        		<td class="sBar"></td>
			        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="esotp"/> ��</td>
			    			<td class="sBar"></td>
			    			<td class="s1" width="20%">���ְ�������</td>
			    			<td class="sBar"></td>
			          		<td>&nbsp;<bean:write name="tstSubjectForm" property="esstp"/> ��</td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
			            </tr> 
			         </table>
		         </div>
		         
		         <div id="PointType2" style="display:none;">
			        <table width="746" border="0" cellspacing="0" cellpadding="0">
			        	<tr>
			        		<td class="s1" width="20%">�ǽ�������</td>
			        		<td class="sBar"></td>
			        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="estsp"/> ��</td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
			            </tr> 
			        	<tr>
			        		<td class="s1" width="20%">��������</td>
			        		<td class="sBar"></td>
			        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="essup"/></td>
			    			<td class="sBar"></td>
			    			<td class="s1" width="20%">��������</td>
			    			<td class="sBar"></td>
			          		<td>&nbsp;<bean:write name="tstSubjectForm" property="eswop"/></td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
			            </tr> 
			        	<tr>
			        		<td class="s1" width="20%">��������</td>
			        		<td class="sBar"></td>
			        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="esyap"/></td>
			    			<td class="sBar"></td>
			    			<td class="s1" width="20%">��������</td>
			    			<td class="sBar"></td>
			          		<td>&nbsp;<bean:write name="tstSubjectForm" property="esgap"/></td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
			            </tr> 
			         </table>
		         </div>
		         
		         <div id="PointType3" style="display:none;">
			        <table width="746" border="0" cellspacing="0" cellpadding="0">
			        	<tr>
			        		<td class="s1" width="20%">����������</td>
			        		<td class="sBar"></td>
			        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="esgtp"/> ��</td>
			        		
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
			            </tr> 
			        </table>
		         </div>
		         
		         <table width="746" border="0" cellspacing="0" cellpadding="0">
		        	
		        	<tr>
		        		<td class="s1" width="20%">����������</td>
		        		<td class="sBar"></td>
		        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="eshwc"/> ��</td>
		    			<td class="sBar"></td>
		    			<td class="s1" width="20%">����������</td>
		    			<td class="sBar"></td>
		          		<td>&nbsp;<bean:write name="tstSubjectForm" property="eshwp"/> ��</td>
		        	</tr>
		        	<tr> 
			            <td class="lbg3" colspan="29"></td>
		            </tr>
		        	<tr>
		        		<td class="s1" width="20%">����������</td>
		        		<td class="sBar"></td>
		        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="esrtp"/> ��</td>
		    			<td class="sBar"></td>
		    			<td class="s1" width="20%">��������</td>
		    			<td class="sBar"></td>
		          		<td>&nbsp;<bean:write name="tstSubjectForm" property="estpt"/> ��</td>
		        	</tr>
		        	<tr> 
			            <td class="lbg3" colspan="29"></td>
		            </tr>
		        	<tr>
		        		<td class="s1" width="20%">����ó������</td>
		        		<td class="sBar"></td>
                        <td width="30%">&nbsp;
                        	<c:choose>
	                      		<c:when test="${tstSubjectForm.esisu eq 'Y'}">ó���Ϸ�</c:when>
	                      		<c:when test="${tstSubjectForm.esisu eq 'N'}">��ó��</c:when>
                      		</c:choose>
                        </td>
                        <td class="sBar"></td>
                        <td class="s1" width="20%">��������</td>
		        		<td class="sBar"></td>
                        <td>&nbsp;
							<c:choose>
	                      		<c:when test="${tstSubjectForm.scoregbn eq 'study'}">�н�</c:when>
	                      		<c:when test="${tstSubjectForm.scoregbn eq 'attend'}">����</c:when>
	                      		<c:when test="${tstSubjectForm.scoregbn eq 'research'}">�����н�</c:when>
	                      		<c:when test="${tstSubjectForm.scoregbn eq 'team'}">������</c:when>
	                      		<c:when test="${tstSubjectForm.scoregbn eq 'pra'}">�ǽ�/�Ǳ�</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'foreign'}">�ܱ����н�</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'conver'}">�ܱ���ȸȭ</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'paper'}">������</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'personal'}">���ΰ���</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'teamdisc'}">��������</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'value'}">�ٽɰ�ġ</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'hobby'}">��̼Ҿ�</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'stamina'}">����ü��</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'info'}">����ȭ</c:when>
	                      		<c:otherwise></c:otherwise>
                      		</c:choose>
						</td>
		        	</tr>
		        	
		        	
		         </table>
		  	</td>
		  	<td class="lbg"></td>
	      </tr>
		</table>
	</td>
</tr>
      <!-- �򰡰��� �⺻���� �� -->
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
<tr>
	<td>
	<table width="750" border="0" cellspacing="0" cellpadding="0">
      <!-- �򰡰��� �������� ���� -->
      <tr>
      		<td class="lbg"></td>
       		<td class="cbg"> 
	          <table width="746" border="0" cellspacing="0" cellpadding="0">
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
       		<table width="746" border="0" cellspacing="0" cellpadding="0">
       			<tr>
		       		<td class="s1" width="20%">����Ͻ�</td>
		       		<td class="sBar"></td>
		       		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="insdate"/></td>
		   			<td class="sBar"></td>
		   			<td class="s1" width="20%">�����Ͻ�</td>
		   			<td class="sBar"></td>
		         	<td>&nbsp;<bean:write name="tstSubjectForm" property="upddate"/></td>
	       		</tr>
	       		<tr> 
		         <td class="lbg3" colspan="29"></td>
		        </tr>
       			<tr>
		       		<td class="s1" width="20%">������ID</td>
		       		<td class="sBar"></td>
		       		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="upduser"/></td>
       		
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
      <td>
	      <img src="/images/board/btn_modify4.gif" onclick="updateForm()" alt="����" style="cursor:hand"/>
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
