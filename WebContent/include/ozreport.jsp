<%@page contentType="text/html;charset=euc-kr" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	    String ozServerIp = "127.0.0.1";
	    String ozPort = "8080";
// 	    String ozServerIp = request.getLocalAddr();
// 	    String ozPort = String.valueOf(request.getServerPort());
 %>
<html>
    <body leftmargin="1" topmargin="1" marginwidth="1" marginheight="1">
    	<object id="ZTransferX" width="0" height="0" CLASSID="CLSID:C7C7225A-9476-47AC-B0B0-FF3B79D55E67" codebase="http://<%=ozServerIp%>:<%=ozPort%>/ozviewer/ZTransferX.cab#version=2,2,1,6">
    		<param name="download.Server" value="http://<%=ozServerIp%>/ozviewer">
				<param name="download.Port" value="<%=ozPort%>">
				<param name="download.Instruction" value="ozrviewer.idf">
				<param name="install.Base" value="<PROGRAMS>/Forcs">
				<param name="install.NameSpace" value="LOTI">
      </object>
      <object id ='ozviewer' CLASSID='CLSID:0DEF32F8-170F-46f8-B1FF-4BF7443F5F25' width='100%' height='100%'> 
        <param name='connection.servlet' value="http://<%=ozServerIp%>:<%=ozPort%>/oz51/server">
        <param name='viewer.isframe' value='false'>
        <param name='print.size' value='A4'>
        <param name='global.language' value='ko/KR'>
        <param name='viewer.configmode' value='html'>   
        <param name='toolbar.addmemo' value='false'>
        <param name='viewer.zoom'  value='80'>  
        <param name='toolbar.find'  value='false'>
        <param name='toolbar.help'  value='false'>
        <param name='toolbar.refresh'  value='false'>
        <param name='toolbar.showtree'  value='false'>
        <param name='toolbar.close'  value='false'>
        <param name='viewer.showerrormessage' value='true'>
        <param name='export.applyformat' value='hwp,pdf,xls'>
		 	<c:choose>
			  <c:when test="${report eq 'edu'}">
				  <param name='connection.reportname' value='교육과정안내.ozr'>  
				  <param name="connection.pcount" value="1">
	 			  <param name="connection.args1" value='ServerIP=<%=ozServerIp%>:<%=ozPort%>'>        
				  <param name='odi.odinames' value='교육과정안내'> 				
				  <param name='odi.교육과정안내.pcount' value='1'>  
				  <param name='odi.교육과정안내.args1' value='courseCode=${courseCode}'>	
				</c:when>
				<c:when test="${report eq 'surv'}">
				  <param name='connection.reportname' value='교육훈련수요조사집계표.ozr'>          
				  <param name='odi.odinames' value='수요조사집계표'> 				
				  <param name='odi.수요조사집계표.pcount' value='3'>   
				  <param name='odi.수요조사집계표.args1' value='selPlanYear=${selPlanYear}'> 
				  <param name='odi.수요조사집계표.args2' value='selCrsType=${selCrsType}'> 
				  <param name='odi.수요조사집계표.args3' value='selOrganCode=${selOrganCode}'> 
			 	</c:when>
			 	<c:when test="${report eq 'tday'}">
			  	<param name='connection.reportname' value='시간표m.ozr'>       
			   	<param name='odi.odinames' value='시간표m'> 				
			   	<param name='odi.시간표m.pcount' value='2'>   
			   	<param name='odi.시간표m.args1' value='searchdate=${searchdate}'>
			   	 <param name='odi.시간표m.args2' value='searchcharger=${searchcharger}'>
			  </c:when>
			  <c:when test="${report eq 'mday'}">
		  		<param name='connection.reportname' value='월별시간표.ozr'>
		  	 	<param name="connection.pcount" value="2">
	 				<param name="connection.args1" value='Year=${Year}'>
	 				<param name="connection.args2" value='Month=${Month}'>
			    <param name='odi.odinames' value='월별시간표'>
	        <param name='odi.월별시간표.pcount'value="2">
	        <param name='odi.월별시간표.args1' value='searchdate=${searchdate}'>
	        <param name='odi.월별시간표.args2' value='searchcharger=${searchcharger}'>
	        </c:when>
		    <c:when test="${report eq 'eplan'}">
			  	<param name='connection.reportname' value='과정별교육훈련계획.ozr'>
	        <param name='odi.odinames' value='교육훈련계획'>
	        <param name='odi.교육훈련계획.pcount' value='2'>
	        <param name='odi.교육훈련계획.args1' value='selPlanYear=${selPlanYear}'> 
			    <param name='odi.교육훈련계획.args2' value='selCrsType=${selCrsType}'> 
			  </c:when>
			  <c:when test="${report eq 'lec'}">
			  	<param name='connection.reportname' value='강의실적확인서.ozr'>
	        <param name='odi.odinames' value='강의실적확인서'>
	        <param name='odi.강의실적확인서.pcount' value='2'>
	        <param name='odi.강의실적확인서.args1' value='year=${year}'>
	        <param name='odi.강의실적확인서.args2' value='issueSeq=${issueSeq}'>
			  </c:when>
			  <c:when test="${report eq 'hak'}">
			  	<param name='connection.reportname' value='학적부.ozr'>
	        <param name='odi.odinames' value='학적부'>
	        <param name='odi.학적부.pcount' value="1">
	        <param name='odi.학적부.args1' value="courseCode=${courseCode}">
		   	</c:when>
		   	<c:when test="${report eq 'name'}">
			   	<param name='connection.reportname' value='명찰.ozr'>
	        <param name='odi.odinames' value='명찰'>
	        <param name='odi.명찰.pcount' value="1">
	        <param name='odi.명찰.args1' value="courseCode=${courseCode}">
			   </c:when>
			  <c:when test="${report eq 'add'}">
			  	<param name='connection.reportname' value='등록부.ozr'>
	        <param name='odi.odinames' value='등록부'>
	        <param name='odi.등록부.pcount' value="1">
	        <param name='odi.등록부.args1' value="courseCode=${courseCode}">
			  </c:when>
			   <c:when test="${report eq 'team'}">
			  	<param name='connection.reportname' value='분임조.ozr'>
	        <param name='odi.odinames' value='분임조'>
	        <param name='odi.분임조.pcount' value="1">
	        <param name='odi.분임조.args1' value="courseCode=${courseCode}">
			  </c:when>
			  <c:when test="${report eq 'prf'}">
			  	<param name='connection.reportname' value='외래강사출강확인.ozr'>
	        <param name='odi.odinames' value='외래강사출강확인'>
	        <param name="connection.pcount" value="2">
	 				<param name="connection.args1" value="printDate=${printDate}">
	 				<param name="connection.args2" value="printUser=${printUser}">
	        <param name='odi.외래강사출강확인.pcount' value="1">
	        <param name='odi.외래강사출강확인.args1' value="pmData=${pmData}">
	          </c:when>
			   <c:when test="${report eq 'pay'}">
			  	<param name='connection.reportname' value='과정별교육경비.ozr'>
			  	<param name="connection.pcount" value="1">
	 				<param name="connection.args1" value="printUser=${printUser}">
	        <param name='odi.odinames' value='과정별교육경비'>
	        <param name='odi.과정별교육경비.pcount' value="1">
	        <param name='odi.과정별교육경비.args1' value="pmData=${pmData}">
			  </c:when>	
			  <c:when test="${report eq 'crsInfo'}">
			  	<c:if test="${cnt_report != 0}">
			   		<param name='viewer.focus_doc_index' value='0'>
			   		<param name='viewer.childcount' value="${cnt_report}">
			   		<param name='viewer.showtree' value='false'>
			   		<param name='print.alldocument' value='true'>
			   		<param name='global.concatpage' value='true'>	   
		   		</c:if>		 
			  	<c:set var="idx" scope="request" value="0"/>
			  	<c:set var="odi" scope="request" value=""/>
			  	<c:forEach var="list" items="${rsJiphap}" varStatus="i" >
			  		<c:if test="${idx == 0}">
			  			<param name='connection.reportname' value='과정.ozr'>		  	
			        <param name='odi.odinames' value='과정'>
			        <param name='odi.과정.pcount' value="1">
			        <param name='odi.과정.args1' value="crsClumpCode=${list.crsClumpCode}">  
			  		</c:if>
			  		<c:if test="${idx != 0}">    
			        <param name='child${idx}.connection.servlet' value="http://<%=ozServerIp%>:<%=ozPort%>/oz51/server">
			        <param name='child${idx}.viewer.configmode' value='html'>
			 				<param name='child${idx}.viewer.isframe' value='false'> 				 
			 				<param name='child${idx}.toolbar.addmemo' value='false'>
			        <param name='child${idx}.viewer.zoom'  value='80'>  
			        <param name='child${idx}.toolbar.find'  value='false'>
			        <param name='child${idx}.toolbar.help'  value='false'>
			        <param name='child${idx}.toolbar.refresh'  value='false'>
			        <param name='child${idx}.toolbar.showtree'  value='false'>
			        <param name='child${idx}.toolbar.close'  value='false'>
			        <param name='child${idx}.export.applyformat' value='hwp,pdf,xls'>
			 				<param name='child${idx}.connection.reportname' value='과정.ozr'>
			        <param name='child${idx}.odi.odinames' value='과정'>
			        <param name='child${idx}.odi.과정.pcount' value="1">
			        <param name='child${idx}.odi.과정.args1' value="crsClumpCode=${list.crsClumpCode}">
			  		</c:if>
	  				<c:set var="idx" scope="request" value="${idx+1}"/>  
			  	</c:forEach>
			  	<c:forEach var="list" items="${rsCyber}" varStatus="i" >
			  		<c:if test="${idx == 0}">
			  			<param name='connection.reportname' value='사이버과정.ozr'>		  	
			        <param name='odi.odinames' value='사이버과정'>
			        <param name='odi.사이버과정.pcount' value="1">
			        <param name='odi.사이버과정.args1' value="crsClumpCode=${list.crsClumpCode}">  
			  		</c:if>
			  		<c:if test="${idx != 0}">    
			        <param name='child${idx}.connection.servlet' value="http://<%=ozServerIp%>:<%=ozPort%>/oz51/server">
			        <param name='child${idx}.viewer.configmode' value='html'>
			 				<param name='child${idx}.viewer.isframe' value='false'> 				 
			 				<param name='child${idx}.toolbar.addmemo' value='false'>
			        <param name='child${idx}.viewer.zoom'  value='80'>  
			        <param name='child${idx}.toolbar.find'  value='false'>
			        <param name='child${idx}.toolbar.help'  value='false'>
			        <param name='child${idx}.toolbar.refresh'  value='false'>
			        <param name='child${idx}.toolbar.showtree'  value='false'>
			        <param name='child${idx}.toolbar.close'  value='false'>
			        <param name='child${idx}.export.applyformat' value='hwp,pdf,xls'>
			 				<param name='child${idx}.connection.reportname' value='사이버과정.ozr'>
			        <param name='child${idx}.odi.odinames' value='사이버과정'>
			        <param name='child${idx}.odi.사이버과정.pcount' value="1">
			        <param name='child${idx}.odi.사이버과정.args1' value="crsClumpCode=${list.crsClumpCode}">
			  		</c:if>
	  				<c:set var="idx" scope="request" value="${idx+1}"/>  
			  	</c:forEach>
	      </c:when>	
	      <c:when test="${report eq 'kyo'}">
			  	<param name='connection.reportname' value='과정교번별.ozr'>
	        <param name='odi.odinames' value='과정교번별'>
	        <param name='odi.과정교번별.pcount' value="2">
	        <param name='odi.과정교번별.args1' value="searchCourseCode=${searchCourseCode}">
	        <param name='odi.과정교번별.args2' value="searchSort=${searchSort}">
	      </c:when>	 
	      <c:when test="${report eq 'end'}">
			  	<param name='connection.reportname' value='이수수료증.ozr'>
	        <param name='odi.odinames' value='이수수료증'>
	        <param name='odi.이수수료증.pcount' value="1">
	        <param name='odi.이수수료증.args1' value="courseCode=${courseCode}">
	      </c:when>	 
	      <c:when test="${report eq 'passLog'}">
			  	<param name='connection.reportname' value='수료증 부여대장.ozr'>
	        <param name='odi.odinames' value='수료증 부여대장'>
	     	</c:when>	
	      <c:when test="${report eq 'endconfirm'}">
			  	<param name='connection.reportname' value='교육훈련이수증명원.ozr'>
	        <param name='odi.odinames' value='교육훈련이수증명원'>
	        <param name='odi.교육훈련이수증명원.pcount' value="1">
	        <param name='odi.교육훈련이수증명원.args1' value="courseCode=${courseCode}">
			<param name='odi.교육훈련이수증명원.args2' value="seq=${seq}">
	     	</c:when>	 
	      <c:when test="${report eq 'endhun'}">
			  	<param name='connection.reportname' value='교육훈련증명원.ozr'>
	        <param name='odi.odinames' value='교육훈련증명원'>
	        <param name='odi.교육훈련증명원.pcount' value="1">
	        <param name='odi.교육훈련증명원.args1' value="courseCode=${courseCode}">
	     	</c:when>	 
	      <c:when test="${report eq 'eduplan'}">
			  	<param name='connection.reportname' value='교육인원계획.ozr'>
	        <param name='odi.odinames' value='교육인원계획'>
	        <param name='odi.교육인원계획.pcount' value="3">
	        <param name='odi.교육인원계획.args1' value="searchCrsType=${searchCrsType}">
	        <param name='odi.교육인원계획.args2' value="searchFromDate=${searchFromDate}">
	        <param name='odi.교육인원계획.args3' value="searchToDate=${searchToDate}">
	      </c:when>	
		  <c:when test="${report eq 'eduplan2'}">
			  	<param name='connection.reportname' value='교육인원계획2.ozr'>
	        <param name='odi.odinames' value='교육인원계획'>
	        <param name='odi.교육인원계획.pcount' value="3">
	        <param name='odi.교육인원계획.args1' value="searchCrsType=${searchCrsType}">
	        <param name='odi.교육인원계획.args2' value="searchFromDate=${searchFromDate}">
	        <param name='odi.교육인원계획.args3' value="searchToDate=${searchToDate}">
	      </c:when>	
		  <c:when test="${report eq 'professor_info'}">
		  	<param name='connection.reportname' value='강사카드.ozr'>
	        <param name='odi.odinames' value='강사카드'>
	        <param name='odi.강사카드.pcount' value='1'>
	        <param name='odi.강사카드.args1' value='profno=${profno}'>
		  </c:when> 
			  <c:when test="${report eq 'prof_grade'}">
			  	<param name='connection.reportname' value='강사등급별조회.ozr'>
	        <param name='odi.odinames' value='강사등급별조회'>
	        <param name='odi.강사등급별조회.pcount' value='2'>
	        <param name='odi.강사등급별조회.args1' value='searchFromDate=${searchFromDate}'>
	        <param name='odi.강사등급별조회.args2' value='searchToDate=${searchToDate}'>
			  </c:when> 
			  <c:when test="${report eq 'finish'}">
			  	<param name='connection.reportname' value='이수수료증.ozr'>
	        <param name='odi.odinames' value='이수수료증'>
	        <param name='odi.이수수료증.pcount' value='1'>
	        <param name='odi.이수수료증.args1' value='courseCode=${courseCode}'>	        
			  </c:when>
			  <c:when test="${report eq 'isu'}">
			  	<param name='connection.reportname' value='이수확인서.ozr'>
	        <param name='odi.odinames' value='이수확인서'>
	        <param name='odi.이수확인서.pcount' value='1'>
	        <param name='odi.이수확인서.args1' value='courseCode=${courseCode}'>	        
			  </c:when> 
			  <c:when test="${report eq 'hun'}">
			  	<param name='connection.reportname' value='교육훈련증명원.ozr'>
	        <param name='odi.odinames' value='교육훈련증명원'>
	        <param name='odi.교육훈련증명원.pcount' value="1">
	        <param name='odi.교육훈련증명원.args1' value="courseCode=${courseCode}">
	     	</c:when>
	     	<c:when test="${report eq 'finishList' }">
	     		<param name='connection.reportname' value='과정별수료자명단.ozr'>
		        <param name='odi.odinames' value='과정별수료자명단'>
		        <param name='odi.과정별수료자명단.pcount' value="1">
		        <param name='odi.과정별수료자명단.args1' value="courseCode=${courseCode}">
	     	</c:when>
	    			
	     	<c:when test="${report eq 'prf_study'}">
			  	<param name='connection.reportname' value='new출강확인서.ozr'>
		        <param name='odi.odinames' value='new출강확인서'>
		        <param name='odi.new출강확인서.pcount' value="3">
		        <param name='odi.new출강확인서.args1' value="professorNo=${professorNo}">
		        <param name='odi.new출강확인서.args2' value="searchFromDate=${searchFromDate}">
		        <param name='odi.new출강확인서.args3' value="searchToDate=${searchToDate}">
			</c:when>

	     	<c:when test="${report eq 'prf_tax'}">
			  	<param name='connection.reportname' value='원천세.ozr'>
		        <param name='odi.odinames' value='원천세'>
		        <param name='odi.원천세.pcount' value="6">
		        <param name='odi.원천세.args1' value="totalSumtax=${totalSumtax}">
		        <param name='odi.원천세.args2' value="convertTotalSumtax=${convertTotalSumtax}">
		        <param name='odi.원천세.args3' value="title=${title}">
		        <param name='odi.원천세.args4' value="title2=${title2}">
		        <param name='odi.원천세.args5' value="title3=${title3}">
		        <param name='odi.원천세.args6' value="year=${year}">
			</c:when>
			
	     	<c:when test="${report eq 'crs_guide'}">
			  	<param name='connection.reportname' value='교육안내서_소책자.ozr'>
		        <param name='odi.odinames' value='교육안내서_소책자'>
		        <param name='odi.교육안내서_소책자.pcount' value="1">
		        <param name='odi.교육안내서_소책자.args1' value="coursecode=${coursecode}">
			</c:when>
			
	     	<c:when test="${report eq 'satis_result'}">
			  	<param name='connection.reportname' value='설문지.ozr'>
		        <param name='odi.odinames' value='설문지'>
		        <param name='odi.설문지.pcount' value="3">
		        <param name='odi.설문지.args1' value="date_yyyymm=${date_yyyymm}">
		        <param name='odi.설문지.args2' value="date_yyyy=${date_yyyy}">
		        <param name='odi.설문지.args3' value="date_mm=${date_mm}">
			</c:when>
			
		  </c:choose>	           	  
		</object>
  </body>
</html>