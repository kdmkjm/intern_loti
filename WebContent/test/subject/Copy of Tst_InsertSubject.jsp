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
<script type="text/javascript" src="/common/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="jquery.jqia.selects.js"></script>
<script language="JavaScript">
	<!--
	jQuery(function(){
		jQuery('#esyer')
		.change(function(){
				var year = jQuery(this).val();
				jQuery(
	
	
	function showPointType() {
		//5110 학습평가
		//5120 실습평가
		//5130 근태
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
        //5110 학습평가
		//5120 실습평가
		//5130 근태
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
		var url = '/tstSubject.act?task=selection';
		url += '&do=year&year=' + document.forms[0].esyer.value;
		SelectBoxIframe.location.href = url;
		setEsseq();
	}
	
	function getSelectBoxSbnam()
	{
		var url = '/tstSubject.act?task=selection&do=subject';
		document.forms[0].action = url;
		document.forms[0].target = 'SelectBoxIframe';
		document.forms[0].submit();
	}
	
	function checkSbidf()
	{
		var frm = document.forms[0];
		
		// 과목코드가 근태-> 평가방법 근태로 설정
		if(frm.sbidf.value.indexOf('GUN') == 0)
		{
			frm.esetp.value = '5130';
		}
		else
		{
			frm.esetp.value = '';
		}
		
		showPointType();
	}
  
  function checkComplete()
  {
  		var frm = document.forms[0];
  		if(frm.esyer.value == '')
		{
			alert('과정년도를 선택해주세요');
			frm.esyer.focus();
			return;
		}
		
		if(frm.cmidf.value == '')
		{
			alert('과정명을 선택해주세요');
			frm.cmidf.focus();
			return; 
		}
		if(frm.sbidf.value == '')
		{
			alert('과목을 선택해주세요.');
			frm.sbidf.focus();
			return;
		}
		frm.action = '/tstSubject.act?task=insertsubjinfo';
		frm.target = '_self';
		frm.submit();
  }
  
  function setEsseq()
  {
  	var frm = document.forms[0];
  	if(frm.esyer.value == '')
  	{
  		alert("과정년도를 선택해주세요");
  		return;
  	}
  	var url = '/tstSubject.act?task=selection&do=esseq&year=' + frm.esyer.value;
		frm.action = url;
		frm.target = 'SelectBoxIframe';
		frm.submit();
  }
  
  function toList()
	{
		var url = '/tstSubject.act?task=list';
		document.tstSubjectForm.target='_self';
		document.tstSubjectForm.action=url;
		document.tstSubjectForm.submit();
	}
  
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="성적관리" src="/images/poll/title_01.gif" /></h1>
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
    <!--평가과목 기본정보 시작-->
      <table width="752" border="0" cellspacing="0" cellpadding="0">
      <tr> 
      <td class="lbg"></td>
      <td class="cbg"> 
          <table width="744" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr> 
            <td width="119" class="t1" colspan="99" style="text-align:left;">&nbsp;평가과목 기본정보</td>
          </tr>
          </table>
      </td>
      <td class="lbg"></td>
      </tr>
      <tr>
      	<td class="lbg"></td>
	      <td>
		      	<table width="744" border="0" cellspacing="0" cellpadding="0" align="center">
		      	  <tr>	
		      	  	<td width="20%" class="s1">과정<font color=red>*</font></td>
		      	  	<td class="sBg"></td>
	               	<td colspan="5">
	               		<IFRAME id="SelectBoxIframe" name="SelectBoxIframe" border="1" frameborder="0" scrolling="yes" width="1" height="1"></IFRAME>
	               		<select id="esyer"name="esyer" onchange="getSelectBoxCmidf()">
	               			<option value="">년도선택</option>
	               			<option value="">-------</option>
	               			<bean:write name="yearOptions" filter="HTML"/>
	               		</select>
	               		<span id="span_cmidf">
	                		<select id="cmidf" name="cmidf">
	                			<option value="">과정선택</option>
	                			<option value="">----------------------------</option>
	                			<bean:write name="option_cmidf" filter="HTML"/>
	                		</select>
	               		</span>
	               	</td>
               	  </tr>
               	  <tr> 
	            	<td class="lbg3" colspan="29"></td>
	         	  </tr>
		          <tr>
		          	<td class="s1" width="20%">과목<font color=red>*</font></td>
		          	<td class="sBg"></td>
		          	<td colspan="5" height="50">&nbsp;
		              <html:select name="tstSubjectForm" property="subjecttype" onchange="getSelectBoxSbnam()">
		                <html:option value="">교과목분류</html:option>
		                <html:option value="">-------</html:option>
		                <html:option value="4501">소양과목</html:option>
		                <html:option value="4502">직무과목</html:option>
		                <html:option value="4503">행정사항</html:option>
		                <html:option value="4509">해당없음</html:option>
		              </html:select>
		              <html:select name="tstSubjectForm" property="edugbn" onchange="getSelectBoxSbnam()">
		                <html:option value="">교육구분</html:option>
		                <html:option value="">-------</html:option>
		                <html:option value="Y">온라인</html:option>
		                <html:option value="N">오프라인</html:option>
		              </html:select>
		              <html:select name="tstSubjectForm" property="testgbn" onchange="getSelectBoxSbnam()">
		                <html:option value="">평가구분</html:option>
		                <html:option value="">-------</html:option>
		                <html:option value="Y">온라인</html:option>
		                <html:option value="N">오프라인</html:option>
		              </html:select>
		              <br>&nbsp;
		              <span id="span_sbnam">
		              	<select name="sbidf" id="sbidf" style="width:90%;" onchange="checkSbidf()">
		        			<option value="">선택</option>
		        			<option value="">----------------</option>
		        			<bean:write name="option_sbnam" filter="HTML"/>
	        			</select>
		              </span>
			        	<!-- <span id="span_sbnam">
			        		<select name="sbnam">
			        			<option value="">과목명선택</option>
			        			<option value="">----------------</option>
			        		</select>
			        	</span>
			        
			        	<html:text name="tstSubjectForm" property="sbnam" size="40"/>-->
			        
		            </td>
		          </tr>
		          <tr> 
	            	<td class="lbg3" colspan="29"></td>
	         	  </tr>
		          <tr>
		          	<td class="s1" width="20%">과목기수</td>
		          	<td class="sBg"></td>
		          	<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esseq" readonly="true"/></td>
		          	<td class="sBg"></td>
		          	<td class="s1" width="20%">과정구성과목순번</td>
		          	<td class="sBg"></td>
		          	<td>&nbsp;<html:text name="tstSubjectForm" property="cjsrl" readonly="true"/></td>
		          </tr>
		          <tr> 
	            	<td class="lbg3" colspan="29"></td>
	         	  </tr>
		          <tr>
		          	<td class="s1" width="20%">필수이수점수</td>
		          	<td class="sBg"></td>
		          	<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esisp" value="0" size="5" maxlength="5"/> 점</td>
		          	<td class="sBg"></td>
		          	<td class="s1" width="20%">필수이수진도율</td>
		          	<td class="sBg"></td>
		          	<td>&nbsp;<html:text name="tstSubjectForm" property="esisr" value="0" size="5" maxlength="5"/> 점</td>
		          </tr>
		          <tr> 
	            	<td class="lbg3" colspan="29"></td>
	         	  </tr>
		          <tr>
		          	<td class="s1" width="20%">평가방법 <font color=red>*</font></td>
		          	<td class="sBg"></td>
		          	 <td width="30%">&nbsp;
                            <html:select name="tstSubjectForm" property="esetp" onchange="showPointType();">
                                <html:option value="">선택</html:option>
                                <html:option value="">- - - - - - -</html:option>
								<html:option value="5110">학습평가</html:option>
                                <html:option value="5120">실습평가</html:option>
                                <html:option value="5130">근태</html:option>
                            </html:select>
                     </td>
                     <td class="sBg"></td>
                     <td class="s1" width="20%">Text구분및사용 <font color=red>*</font></td>
                     <td class="sBg"></td>
                     <td>&nbsp;
                         <html:select name="tstSubjectForm" property="esomr">
                         	<html:option value="">선택</html:option>
                         	<html:option value="">-------------</html:option>
                         	<html:option value="5110">OMR</html:option>
                         	<html:option value="5120">수작업</html:option>
                         	<html:option value="5130">사용안함</html:option>
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
			        		<td class="s1" width="20%">평가객관식배점<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="eseop" value="0" size="5" maxlength="5" onblur="setSum();"/> 점</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">평가주관식배점<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="esesp" value="0" size="5" maxlength="5" onblur="setSum();"/> 점</td>
			        	</tr>
			        	<tr> 
			           		<td class="lbg3" colspan="29"></td>
			         	</tr>
			        	<tr>
			        		<td class="s1" width="20%">평가객관식문항수<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esoct" value="0" size="5" maxlength="5" onblur="setSum();"/> 문항</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">평가주관식문항수<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="essct" value="0" size="5" maxlength="5" onblur="setSum();"/> 문항</td>
			        	</tr>
			        	<tr> 
			           		<td class="lbg3" colspan="29"></td>
			         	</tr>
			        	<tr>
			        		<td class="s1" width="20%">평가객관식총점</td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esotp" value="0" size="5" maxlength="5" style="text-align:right; padding-right:5px; IME-MODE:disabled;" readonly="true" onblur="setSum();"/> 점</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">평가주관식총점</td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="esstp" value="0" size="5" maxlength="5" style="text-align:right; padding-right:5px; IME-MODE:disabled;" readonly="true" onblur="setSum();"/> 점</td>
			        	</tr>
			        	<tr> 
		           			<td class="lbg3" colspan="29"></td>
		         		</tr>
			         </table>
		         </div>
		         
		         <div id="PointType2" style="display:none;">
			        <table width="744" border="0" cellspacing="0" cellpadding="0" align="center">
			        	<tr>
			        		<td class="s1" width="20%">실습평가총점<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="estsp" value="0" size="5" maxlength="5" onblur="setSum();"/> 점</td>
			        	</tr>
			        	<tr> 
			           		<td class="lbg3" colspan="29"></td>
			         	</tr>
			        	<tr>
			        		<td class="s1" width="20%">수평가점수<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="essup" value="0" size="5" maxlength="5"/> 점</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">우평가점수<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="eswop" value="0" size="5" maxlength="5"/> 점</td>
			        	</tr>
			        	<tr> 
			           		<td class="lbg3" colspan="29"></td>
			         	</tr>
			        	<tr>
			        		<td class="s1" width="20%">양평가점수<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esyap" value="0" size="5" maxlength="5"/> 점</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">가평가점수<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="esgap" value="0" size="5" maxlength="5"/> 점</td>
			        	</tr>
			        	<tr> 
		           			<td class="lbg3" colspan="29"></td>
		         		</tr>
			         </table>
		         </div>
		         
		         <div id="PointType3" style="display:none;">
			        <table width="744" border="0" cellspacing="0" cellpadding="0" align="center">
			        	<tr>
			        		<td class="s1" width="20%">근태평가점수<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esgtp" value="0" size="5" maxlength="5" onblur="setSum();"/> 점</td>
			        		
			        	</tr>
			        	<tr> 
		           			<td class="lbg3" colspan="29"></td>
		         		</tr>
			        </table>
		         </div>
		         
		         <table width="744" border="0" cellspacing="0" cellpadding="0" align="center">
		        	
		        	<tr>
		        		<td class="s1" width="20%">과제물갯수</td>
		        		<td class="sBg"></td>
		        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="eshwc" value="0" size="5" maxlength="5" onblur="setSum();"/> 개</td>
		    			<td class="sBg"></td>
		    			<td class="s1" width="20%">과제물총점</td>
		          		<td class="sBg"></td>
		          		<td>&nbsp;<html:text name="tstSubjectForm" property="eshwp" value="0" size="5" maxlength="5" onblur="setSum();"/> 점</td>
		        	</tr>
		        	<tr> 
		           		<td class="lbg3" colspan="29"></td>
		         	</tr>
		        	<tr>
		        		<td class="s1" width="20%">진도율총점</td>
		        		<td class="sBg"></td>
		        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esrtp" value="0" size="5" maxlength="5" onblur="setSum();"/> 점</td>
		    			<td class="sBg"></td>
		    			<td class="s1" width="20%">과목총점</td>
		          		<td class="sBg"></td>
		          		<td>&nbsp;<html:text name="tstSubjectForm" property="estpt" value="0" size="5" maxlength="5" readonly="ture"/> 점</td>
		        	</tr>
		        	<tr> 
		           		<td class="lbg3" colspan="29"></td>
		         	</tr>
		        	<tr>
		        		<td class="s1" width="20%">성적처리여부 <font color=red>*</font></td>
                        <td class="sBg"></td>
                        <td width="30%" colspan="3">&nbsp;
                            <html:select name="tstSubjectForm" property="esisu">
                            	<html:option value="">선택</html:option>
                                <html:option value="">- - - - - - -</html:option>
                                <html:option value="Y">처리완료</html:option>
                                <html:option value="N">미처리</html:option>
                            </html:select>
                        </td>
		        	</tr>
	
		         </table>	  
		  </td>
		  <td class="lbg"></td>
      </tr>

      </table>
      </html:form>
      <!--평가과목 기본정보 끝-->
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
	      <img src="/images/board/btn_save.gif" onclick="checkComplete()" alt="저장" style="cursor:hand"/>
	      <img src="/images/board/btn_cancle2.gif" onclick="toList()" alt="취소" style="cursor:hand"/>
      </td>
    </tr>
    </table>
  </td>
</tr>

</table>

<script type="text/javascript">
<!--
	//페이지 로드 완료 후 평가방법 셋팅
	 showPointType();
//-->
</script>
