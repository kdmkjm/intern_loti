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
	
    <!--평가과목 기본정보 시작-->
      <table width="750" border="0" cellspacing="0" cellpadding="0">
      <tr> 
	      <td class="lbg"></td>
	      <td class="cbg"> 
	          <table width="746" border="0" cellspacing="0" cellpadding="0">
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
	      	<html:hidden name="tstSubjectForm" property="cmidf"/> 
			<html:hidden name="tstSubjectForm" property="sbidf"/>
	      	<html:hidden name="tstSubjectForm" property="searchCourseCode"/>
	      	<html:hidden name="tstSubjectForm" property="searchSort"/>
	      	<%-- 세팅 끝 --%>
		      	<table width="746" border="0" cellspacing="0" cellpadding="0">
		          <tr>
					<td class="s1" width="20%">과목코드</td>
					<td class="sBar"></td>
					<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="sbidf"/></td>
					<td class="sBar"></td>
					<td class="s1" width="20%">과목명</td>
					<td class="sBar"></td>
		            <td>&nbsp;<bean:write name="tstSubjectForm" property="sbnam"/></td>
				  </tr>
				  <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr> 
		          <tr>
		          	<td class="s1" width="20%">년도</td>
		          	<td class="sBar"></td>
		          	<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="esyer"/></td>
		          	<td class="sBar"></td>
		          	<td class="s1" width="20%">과목기수</td>
		          	<td class="sBar"></td>
		          	<td>&nbsp;<bean:write name="tstSubjectForm" property="esseq"/></td>
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr> 
		          <tr>
		          	<td class="s1" width="20%">과정구성순번</td>
		          	<td class="sBar"></td>
		          	<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="cjsrl"/></td>
		          	
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr> 
		          <tr>
		          	<td class="s1" width="20%">필수이수점수</td>
		          	<td class="sBar"></td>
		          	<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="esisp"/></td>
		          	<td class="sBar"></td>
		          	<td class="s1" width="20%">필수이수진도율</td>
		          	<td class="sBar"></td>
		          	<td>&nbsp;<bean:write name="tstSubjectForm" property="esisr"/></td>
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
		          </tr> 
		          <tr>
		          	<td class="s1" width="20%">평가방법</td>
		          	<td class="sBar"></td>
		          	 <td width="30%">&nbsp;
		          	 	<html:hidden name="tstSubjectForm" property="esetp"/>
		          	 	<c:choose>
                      		<c:when test="${tstSubjectForm.esetp eq '5110'}">학습평가</c:when>
                      		<c:when test="${tstSubjectForm.esetp eq '5120'}">실습평가</c:when>
                      		<c:when test="${tstSubjectForm.esetp eq '5130'}">근태평가</c:when>
                      	</c:choose>
                     </td>
                     <td class="sBar"></td>
                     <td class="s1" width="20%">Text구분및사용 </td>
                     <td class="sBar"></td>
                     <td>&nbsp;
                         <html:hidden name="tstSubjectForm" property="esomr"/>
                         <c:choose>
                      		<c:when test="${tstSubjectForm.esomr eq '5310'}">OMR</c:when>
                      		<c:when test="${tstSubjectForm.esomr eq '5320'}">수작업</c:when>
                      		<c:when test="${tstSubjectForm.esomr eq '5330'}">사용안함</c:when>
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
			        		<td class="s1" width="20%">평가객관식배점</td>
			        		<td class="sBar"></td>
			        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="eseop"/> 점</td>
			    			<td class="sBar"></td>
			    			<td class="s1" width="20%">평가주관식배점</td>
			    			<td class="sBar"></td>
			          		<td>&nbsp;<bean:write name="tstSubjectForm" property="esesp"/> 점</td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
			            </tr> 
			        	<tr>
			        		<td class="s1" width="20%">평가객관식문항수</td>
			        		<td class="sBar"></td>
			        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="esoct"/> 문항</td>
			    			<td class="sBar"></td>
			    			<td class="s1" width="20%">평가주관식문항수</td>
			    			<td class="sBar"></td>
			          		<td>&nbsp;<bean:write name="tstSubjectForm" property="essct"/> 문항</td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
			            </tr> 
			        	<tr>
			        		<td class="s1" width="20%">평가객관식총점</td>
			        		<td class="sBar"></td>
			        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="esotp"/> 점</td>
			    			<td class="sBar"></td>
			    			<td class="s1" width="20%">평가주관식총점</td>
			    			<td class="sBar"></td>
			          		<td>&nbsp;<bean:write name="tstSubjectForm" property="esstp"/> 점</td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
			            </tr> 
			         </table>
		         </div>
		         
		         <div id="PointType2" style="display:none;">
			        <table width="746" border="0" cellspacing="0" cellpadding="0">
			        	<tr>
			        		<td class="s1" width="20%">실습평가총점</td>
			        		<td class="sBar"></td>
			        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="estsp"/> 점</td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
			            </tr> 
			        	<tr>
			        		<td class="s1" width="20%">수평가점수</td>
			        		<td class="sBar"></td>
			        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="essup"/></td>
			    			<td class="sBar"></td>
			    			<td class="s1" width="20%">우평가점수</td>
			    			<td class="sBar"></td>
			          		<td>&nbsp;<bean:write name="tstSubjectForm" property="eswop"/></td>
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
			            </tr> 
			        	<tr>
			        		<td class="s1" width="20%">양평가점수</td>
			        		<td class="sBar"></td>
			        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="esyap"/></td>
			    			<td class="sBar"></td>
			    			<td class="s1" width="20%">가평가점수</td>
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
			        		<td class="s1" width="20%">근태평가점수</td>
			        		<td class="sBar"></td>
			        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="esgtp"/> 점</td>
			        		
			        	</tr>
			        	<tr> 
				            <td class="lbg3" colspan="29"></td>
			            </tr> 
			        </table>
		         </div>
		         
		         <table width="746" border="0" cellspacing="0" cellpadding="0">
		        	
		        	<tr>
		        		<td class="s1" width="20%">과제물갯수</td>
		        		<td class="sBar"></td>
		        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="eshwc"/> 개</td>
		    			<td class="sBar"></td>
		    			<td class="s1" width="20%">과제물총점</td>
		    			<td class="sBar"></td>
		          		<td>&nbsp;<bean:write name="tstSubjectForm" property="eshwp"/> 점</td>
		        	</tr>
		        	<tr> 
			            <td class="lbg3" colspan="29"></td>
		            </tr>
		        	<tr>
		        		<td class="s1" width="20%">진도율총점</td>
		        		<td class="sBar"></td>
		        		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="esrtp"/> 점</td>
		    			<td class="sBar"></td>
		    			<td class="s1" width="20%">과목총점</td>
		    			<td class="sBar"></td>
		          		<td>&nbsp;<bean:write name="tstSubjectForm" property="estpt"/> 점</td>
		        	</tr>
		        	<tr> 
			            <td class="lbg3" colspan="29"></td>
		            </tr>
		        	<tr>
		        		<td class="s1" width="20%">성적처리여부</td>
		        		<td class="sBar"></td>
                        <td width="30%">&nbsp;
                        	<c:choose>
	                      		<c:when test="${tstSubjectForm.esisu eq 'Y'}">처리완료</c:when>
	                      		<c:when test="${tstSubjectForm.esisu eq 'N'}">미처리</c:when>
                      		</c:choose>
                        </td>
                        <td class="sBar"></td>
                        <td class="s1" width="20%">점수구분</td>
		        		<td class="sBar"></td>
                        <td>&nbsp;
							<c:choose>
	                      		<c:when test="${tstSubjectForm.scoregbn eq 'study'}">학습</c:when>
	                      		<c:when test="${tstSubjectForm.scoregbn eq 'attend'}">근태</c:when>
	                      		<c:when test="${tstSubjectForm.scoregbn eq 'research'}">현장학습</c:when>
	                      		<c:when test="${tstSubjectForm.scoregbn eq 'team'}">분임조</c:when>
	                      		<c:when test="${tstSubjectForm.scoregbn eq 'pra'}">실습/실기</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'foreign'}">외국어학습</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'conver'}">외국어회화</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'paper'}">연구논문</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'personal'}">개인강의</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'teamdisc'}">분임토의</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'value'}">핵심가치</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'hobby'}">취미소양</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'stamina'}">기초체력</c:when>
								<c:when test="${tstSubjectForm.scoregbn eq 'info'}">정보화</c:when>
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
      <!-- 평가과목 기본정보 끝 -->
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
      <!-- 평가과목 관리정보 시작 -->
      <tr>
      		<td class="lbg"></td>
       		<td class="cbg"> 
	          <table width="746" border="0" cellspacing="0" cellpadding="0">
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
       		<table width="746" border="0" cellspacing="0" cellpadding="0">
       			<tr>
		       		<td class="s1" width="20%">등록일시</td>
		       		<td class="sBar"></td>
		       		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="insdate"/></td>
		   			<td class="sBar"></td>
		   			<td class="s1" width="20%">수정일시</td>
		   			<td class="sBar"></td>
		         	<td>&nbsp;<bean:write name="tstSubjectForm" property="upddate"/></td>
	       		</tr>
	       		<tr> 
		         <td class="lbg3" colspan="29"></td>
		        </tr>
       			<tr>
		       		<td class="s1" width="20%">수정자ID</td>
		       		<td class="sBar"></td>
		       		<td width="30%">&nbsp;<bean:write name="tstSubjectForm" property="upduser"/></td>
       		
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
	      <img src="/images/board/btn_modify4.gif" onclick="updateForm()" alt="수정" style="cursor:hand"/>
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
