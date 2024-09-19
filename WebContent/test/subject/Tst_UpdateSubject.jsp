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
		//5110 학습평가
		//5120 실습평가
		//5130 근태
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
	
	function toList()
	{
		var url = '/tstSubject.act?task=list';
		document.tstSubjectForm.action=url;
		document.tstSubjectForm.submit();
	}
	
	function deleteSubject()
    {
    	if(!confirm("삭제하시겠습니까?"))
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
    			alert("'학습'점수에는 학습평가만 선택할 수 있습니다.");
    			return;
    		}
    	}
    	else{
    		if(esetp == '5110'){
                var option = document.forms[0].scoregbn;
                var score = option[option.selectedIndex].innerHTML;
    			alert("'"+score+"'점수에는 '실습평가'나 '근태'만 선택할 수 있습니다.");
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
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="성적관리" src="/images/poll/title_01.gif" /></h1>
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
    <!--평가과목 기본정보 시작-->
      <table width="752" border="0" cellspacing="0" cellpadding="0">
      <tr> 
      <td class="lbg"></td>
      <td class="cbg"> 
          <table width="748" border="0" cellspacing="0" cellpadding="0">
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
	      	<%-- 폼 이외값 세팅 --%>
	      	<html:hidden name="tstSubjectForm" property="essrl"/>
	      	<html:hidden name="tstSubjectForm" property="cmidf"/> 
	      	<html:hidden name="tstSubjectForm" property="searchCourseCode"/>
	      	<html:hidden name="tstSubjectForm" property="searchSort"/>
	      	<%-- 세팅 끝 --%>
		      	<table width="748" border="0" cellspacing="0" cellpadding="0">
		          <tr>
					<td class="s1" width="20%">과목코드<font color=red>*</font></td>
					<td class="sBg"></td>
					<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="sbidf" readonly="true"/></td>
					<td class="sBg"></td>
					<td class="s1" width="20%">과목명<font color=red>*</font></td>
		            <td class="sBg"></td>
		            <td>&nbsp;<html:text name="tstSubjectForm" property="sbnam" readonly="true"/> </td>
				  </tr>
				  <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr>
		          <tr>
		          	<td class="s1" width="20%">년도<font color=red>*</font></td>
		          	<td class="sBg"></td>
		          	<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esyer" readonly="true"/></td>
		          	<td class="sBg"></td>
		          	<td class="s1" width="20%">과목기수<font color=red>*</font></td>
		          	<td class="sBg"></td>
		          	<td>&nbsp;<html:text name="tstSubjectForm" property="esseq" readonly="true"/></td>
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr>
		          <tr>
		          	<td class="s1" width="20%">과정구성순번<font color=red>*</font></td>
		          	<td class="sBg"></td>
		          	<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="cjsrl" readonly="true"/></td>
		          	
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr>
		          <tr>
		          	<td class="s1" width="20%">필수이수점수</td>
		          	<td class="sBg"></td>
		          	<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esisp"/></td>
		          	<td class="sBg"></td>
		          	<td class="s1" width="20%">필수이수진도율</td>
		          	<td class="sBg"></td>
		          	<td>&nbsp;<html:text name="tstSubjectForm" property="esisr"/></td>
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
			        <table width="748" border="0" cellspacing="0" cellpadding="0">
			        	<tr>
			        		<td class="s1" width="20%">평가객관식배점<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="eseop" size="5" maxlength="5" onblur="setSum();"/> 점</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">평가주관식배점<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="esesp" size="5" maxlength="5" onblur="setSum();"/> 점</td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
				        </tr>
			        	<tr>
			        		<td class="s1" width="20%">평가객관식문항수<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esoct" size="5" maxlength="5" onblur="setSum();"/> 문항</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">평가주관식문항수<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="essct" size="5" maxlength="5" onblur="setSum();"/> 문항</td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
				        </tr>
			        	<tr>
			        		<td class="s1" width="20%">평가객관식총점</td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esotp" size="5" maxlength="5" style="text-align:right; padding-right:5px; IME-MODE:disabled;" readonly="true" onblur="setSum();"/> 점</td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">평가주관식총점</td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="esstp" size="5" maxlength="5" style="text-align:right; padding-right:5px; IME-MODE:disabled;" readonly="true" onblur="setSum();"/> 점</td>
			        	</tr>
			         </table>
		         </div>
		         
		         <div id="PointType2" style="display:none;">
			        <table width="748" border="0" cellspacing="0" cellpadding="0">
			        	<tr>
			        		<td class="s1" width="20%">실습평가총점<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="estsp" size="5" maxlength="5" onblur="setSum();"/> 점</td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
				        </tr>
			        	<tr>
			        		<td class="s1" width="20%">수평가점수<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="essup"/></td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">우평가점수<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="eswop"/></td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
				        </tr>
			        	<tr>
			        		<td class="s1" width="20%">양평가점수<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esyap"/></td>
			    			<td class="sBg"></td>
			    			<td class="s1" width="20%">가평가점수<font color=red>*</font></td>
			          		<td class="sBg"></td>
			          		<td>&nbsp;<html:text name="tstSubjectForm" property="esgap"/></td>
			        	</tr>
			         </table>
		         </div>
		         
		         <div id="PointType3" style="display:none;">
			        <table width="748" border="0" cellspacing="0" cellpadding="0">
			        	<tr>
			        		<td class="s1" width="20%">근태평가점수<font color=red>*</font></td>
			        		<td class="sBg"></td>
			        		<td>&nbsp;<html:text name="tstSubjectForm" property="esgtp" size="5" maxlength="5" onblur="setSum();"/> 점</td>
			        		
			        	</tr>
			        </table>
		         </div>
		         
		         <table width="748" border="0" cellspacing="0" cellpadding="0">
		         	<tr> 
			            <td class="lbg3" colspan="29"></td>
			        </tr>
		        	<tr>
		        		<td class="s1" width="20%">과제물갯수</td>
		        		<td class="sBg"></td>
		        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="eshwc" size="5" maxlength="5" onblur="setSum();"/> 개</td>
		    			<td class="sBg"></td>
		    			<td class="s1" width="20%">과제물총점</td>
		          		<td class="sBg"></td>
		          		<td>&nbsp;<html:text name="tstSubjectForm" property="eshwp" size="5" maxlength="5" onblur="setSum();"/> 점</td>
		        	</tr>
		        	<tr> 
			            <td class="lbg3" colspan="29"></td>
			        </tr>
		        	<tr>
		        		<td class="s1" width="20%">진도율총점</td>
		        		<td class="sBg"></td>
		        		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="esrtp" size="5" maxlength="5" onblur="setSum();"/> 점</td>
		    			<td class="sBg"></td>
		    			<td class="s1" width="20%">과목총점</td>
		          		<td class="sBg"></td>
		          		<td>&nbsp;<html:text name="tstSubjectForm" property="estpt" size="5" maxlength="5" readonly="true"/> 점</td>
		        	</tr>
		        	<tr> 
			            <td class="lbg3" colspan="29"></td>
			        </tr>
		        	<tr>
		        		<td class="s1" width="20%">성적처리여부 <font color=red>*</font></td>
                        <td class="sBg"></td>
                        <td width="30%">&nbsp;
                            <html:select name="tstSubjectForm" property="esisu">
                            	<html:option value="">선택</html:option>
                                <html:option value="">- - - - - - -</html:option>
                                <html:option value="Y">처리완료</html:option>
                                <html:option value="N">미처리</html:option>
                            </html:select>
                        </td>
                        <td class="sBg"></td>
                        <td class="s1" width="20%">점수구분 <font color=red>*</font></td>
		          		<td class="sBg"></td>
		          		<td>&nbsp;
		          			<html:select name="tstSubjectForm" property="scoregbn">
                                <html:option value="">선택</html:option>
                                <html:option value="">- - - - - - -</html:option>
                                <html:option value="study">학습</html:option>
                                <html:option value="attend">근태</html:option>
                                <html:option value="research">현장학습</html:option>
                                <html:option value="team">분임조</html:option>
                                <html:option value="pra">실습/실기</html:option>
                                <html:option value="foreign">외국어학습</html:option>
                                <html:option value="conver">외국어회화</html:option>
                                <html:option value="paper">연구논문</html:option>
                                <html:option value="personal">개인강의</html:option>
								<html:option value="teamdisc">분임토의</html:option>
								<html:option value="hobby">취미소양</html:option>
								<html:option value="stamina">기초체력</html:option>
								<html:option value="info">정보화</html:option>
								<html:option value="value">핵심가치</html:option>
		          			</html:select>
		          		</td>
		        	</tr> 	
		         </table>
		  </td>
		  <!-- 평가과목 기본정보 끝 -->
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
      <!-- 평가과목 관리정보 시작 -->
      <tr>
      		<td class="lbg"></td>
       		<td class="cbg"> 
	          <table width="748" border="0" cellspacing="0" cellpadding="0">
	          <tr> 
	            <td width="119" class="t1" colspan="99" style="text-align:left;">&nbsp;평가과목 관리정보</td>
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
		       		<td class="s1" width="20%">등록일시</td>
		       		<td class="sBg"></td>
		       		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="insdate" readonly="ture"/></td>
		   			<td class="sBg"></td>
		   			<td class="s1" width="20%">수정일시</td>
		         	<td class="sBg"></td>
		         	<td>&nbsp;<html:text name="tstSubjectForm" property="upddate" readonly="ture"/></td>
	      		</tr>
	      		<tr> 
			        <td class="lbg3" colspan="29"></td>
			    </tr>
			    <tr>
		       		<td class="s1" width="20%">수정자ID</td>
		       		<td class="sBg"></td>
		       		<td width="30%">&nbsp;<html:text name="tstSubjectForm" property="upduser"/></td>
		     		
		      	</tr>
	     	</table>
     	</td>
     	<td class="lbg"></td>
       </tr>
      </table>
      <!--평가과목 관리정보 끝-->
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
    		<img src="/images/board/btn_save.gif" onclick="done()" alt="저장" style="cursor:hand"/>
		    <img src="/images/board/btn_del.gif" onclick="deleteSubject()" alt="삭제" style="cursor:hand">
		    <img src="/images/board/btn_list.gif" onclick="toList()" alt="목록" style="cursor:hand"/> 
    	</td>
    </tr>
    </table>
  </td>
</tr>
</table>
</html:form>
<script type="text/javascript">
<!--
	//페이지 로드 완료 후 평가방법에 따라 화면 셋팅
	 showPointType();
//-->
</script>
