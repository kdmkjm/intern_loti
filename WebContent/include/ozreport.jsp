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
				  <param name='connection.reportname' value='���������ȳ�.ozr'>  
				  <param name="connection.pcount" value="1">
	 			  <param name="connection.args1" value='ServerIP=<%=ozServerIp%>:<%=ozPort%>'>        
				  <param name='odi.odinames' value='���������ȳ�'> 				
				  <param name='odi.���������ȳ�.pcount' value='1'>  
				  <param name='odi.���������ȳ�.args1' value='courseCode=${courseCode}'>	
				</c:when>
				<c:when test="${report eq 'surv'}">
				  <param name='connection.reportname' value='�����Ʒü�����������ǥ.ozr'>          
				  <param name='odi.odinames' value='������������ǥ'> 				
				  <param name='odi.������������ǥ.pcount' value='3'>   
				  <param name='odi.������������ǥ.args1' value='selPlanYear=${selPlanYear}'> 
				  <param name='odi.������������ǥ.args2' value='selCrsType=${selCrsType}'> 
				  <param name='odi.������������ǥ.args3' value='selOrganCode=${selOrganCode}'> 
			 	</c:when>
			 	<c:when test="${report eq 'tday'}">
			  	<param name='connection.reportname' value='�ð�ǥm.ozr'>       
			   	<param name='odi.odinames' value='�ð�ǥm'> 				
			   	<param name='odi.�ð�ǥm.pcount' value='2'>   
			   	<param name='odi.�ð�ǥm.args1' value='searchdate=${searchdate}'>
			   	 <param name='odi.�ð�ǥm.args2' value='searchcharger=${searchcharger}'>
			  </c:when>
			  <c:when test="${report eq 'mday'}">
		  		<param name='connection.reportname' value='�����ð�ǥ.ozr'>
		  	 	<param name="connection.pcount" value="2">
	 				<param name="connection.args1" value='Year=${Year}'>
	 				<param name="connection.args2" value='Month=${Month}'>
			    <param name='odi.odinames' value='�����ð�ǥ'>
	        <param name='odi.�����ð�ǥ.pcount'value="2">
	        <param name='odi.�����ð�ǥ.args1' value='searchdate=${searchdate}'>
	        <param name='odi.�����ð�ǥ.args2' value='searchcharger=${searchcharger}'>
	        </c:when>
		    <c:when test="${report eq 'eplan'}">
			  	<param name='connection.reportname' value='�����������Ʒð�ȹ.ozr'>
	        <param name='odi.odinames' value='�����Ʒð�ȹ'>
	        <param name='odi.�����Ʒð�ȹ.pcount' value='2'>
	        <param name='odi.�����Ʒð�ȹ.args1' value='selPlanYear=${selPlanYear}'> 
			    <param name='odi.�����Ʒð�ȹ.args2' value='selCrsType=${selCrsType}'> 
			  </c:when>
			  <c:when test="${report eq 'lec'}">
			  	<param name='connection.reportname' value='���ǽ���Ȯ�μ�.ozr'>
	        <param name='odi.odinames' value='���ǽ���Ȯ�μ�'>
	        <param name='odi.���ǽ���Ȯ�μ�.pcount' value='2'>
	        <param name='odi.���ǽ���Ȯ�μ�.args1' value='year=${year}'>
	        <param name='odi.���ǽ���Ȯ�μ�.args2' value='issueSeq=${issueSeq}'>
			  </c:when>
			  <c:when test="${report eq 'hak'}">
			  	<param name='connection.reportname' value='������.ozr'>
	        <param name='odi.odinames' value='������'>
	        <param name='odi.������.pcount' value="1">
	        <param name='odi.������.args1' value="courseCode=${courseCode}">
		   	</c:when>
		   	<c:when test="${report eq 'name'}">
			   	<param name='connection.reportname' value='����.ozr'>
	        <param name='odi.odinames' value='����'>
	        <param name='odi.����.pcount' value="1">
	        <param name='odi.����.args1' value="courseCode=${courseCode}">
			   </c:when>
			  <c:when test="${report eq 'add'}">
			  	<param name='connection.reportname' value='��Ϻ�.ozr'>
	        <param name='odi.odinames' value='��Ϻ�'>
	        <param name='odi.��Ϻ�.pcount' value="1">
	        <param name='odi.��Ϻ�.args1' value="courseCode=${courseCode}">
			  </c:when>
			   <c:when test="${report eq 'team'}">
			  	<param name='connection.reportname' value='������.ozr'>
	        <param name='odi.odinames' value='������'>
	        <param name='odi.������.pcount' value="1">
	        <param name='odi.������.args1' value="courseCode=${courseCode}">
			  </c:when>
			  <c:when test="${report eq 'prf'}">
			  	<param name='connection.reportname' value='�ܷ������ⰭȮ��.ozr'>
	        <param name='odi.odinames' value='�ܷ������ⰭȮ��'>
	        <param name="connection.pcount" value="2">
	 				<param name="connection.args1" value="printDate=${printDate}">
	 				<param name="connection.args2" value="printUser=${printUser}">
	        <param name='odi.�ܷ������ⰭȮ��.pcount' value="1">
	        <param name='odi.�ܷ������ⰭȮ��.args1' value="pmData=${pmData}">
	          </c:when>
			   <c:when test="${report eq 'pay'}">
			  	<param name='connection.reportname' value='�������������.ozr'>
			  	<param name="connection.pcount" value="1">
	 				<param name="connection.args1" value="printUser=${printUser}">
	        <param name='odi.odinames' value='�������������'>
	        <param name='odi.�������������.pcount' value="1">
	        <param name='odi.�������������.args1' value="pmData=${pmData}">
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
			  			<param name='connection.reportname' value='����.ozr'>		  	
			        <param name='odi.odinames' value='����'>
			        <param name='odi.����.pcount' value="1">
			        <param name='odi.����.args1' value="crsClumpCode=${list.crsClumpCode}">  
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
			 				<param name='child${idx}.connection.reportname' value='����.ozr'>
			        <param name='child${idx}.odi.odinames' value='����'>
			        <param name='child${idx}.odi.����.pcount' value="1">
			        <param name='child${idx}.odi.����.args1' value="crsClumpCode=${list.crsClumpCode}">
			  		</c:if>
	  				<c:set var="idx" scope="request" value="${idx+1}"/>  
			  	</c:forEach>
			  	<c:forEach var="list" items="${rsCyber}" varStatus="i" >
			  		<c:if test="${idx == 0}">
			  			<param name='connection.reportname' value='���̹�����.ozr'>		  	
			        <param name='odi.odinames' value='���̹�����'>
			        <param name='odi.���̹�����.pcount' value="1">
			        <param name='odi.���̹�����.args1' value="crsClumpCode=${list.crsClumpCode}">  
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
			 				<param name='child${idx}.connection.reportname' value='���̹�����.ozr'>
			        <param name='child${idx}.odi.odinames' value='���̹�����'>
			        <param name='child${idx}.odi.���̹�����.pcount' value="1">
			        <param name='child${idx}.odi.���̹�����.args1' value="crsClumpCode=${list.crsClumpCode}">
			  		</c:if>
	  				<c:set var="idx" scope="request" value="${idx+1}"/>  
			  	</c:forEach>
	      </c:when>	
	      <c:when test="${report eq 'kyo'}">
			  	<param name='connection.reportname' value='����������.ozr'>
	        <param name='odi.odinames' value='����������'>
	        <param name='odi.����������.pcount' value="2">
	        <param name='odi.����������.args1' value="searchCourseCode=${searchCourseCode}">
	        <param name='odi.����������.args2' value="searchSort=${searchSort}">
	      </c:when>	 
	      <c:when test="${report eq 'end'}">
			  	<param name='connection.reportname' value='�̼�������.ozr'>
	        <param name='odi.odinames' value='�̼�������'>
	        <param name='odi.�̼�������.pcount' value="1">
	        <param name='odi.�̼�������.args1' value="courseCode=${courseCode}">
	      </c:when>	 
	      <c:when test="${report eq 'passLog'}">
			  	<param name='connection.reportname' value='������ �ο�����.ozr'>
	        <param name='odi.odinames' value='������ �ο�����'>
	     	</c:when>	
	      <c:when test="${report eq 'endconfirm'}">
			  	<param name='connection.reportname' value='�����Ʒ��̼������.ozr'>
	        <param name='odi.odinames' value='�����Ʒ��̼������'>
	        <param name='odi.�����Ʒ��̼������.pcount' value="1">
	        <param name='odi.�����Ʒ��̼������.args1' value="courseCode=${courseCode}">
			<param name='odi.�����Ʒ��̼������.args2' value="seq=${seq}">
	     	</c:when>	 
	      <c:when test="${report eq 'endhun'}">
			  	<param name='connection.reportname' value='�����Ʒ������.ozr'>
	        <param name='odi.odinames' value='�����Ʒ������'>
	        <param name='odi.�����Ʒ������.pcount' value="1">
	        <param name='odi.�����Ʒ������.args1' value="courseCode=${courseCode}">
	     	</c:when>	 
	      <c:when test="${report eq 'eduplan'}">
			  	<param name='connection.reportname' value='�����ο���ȹ.ozr'>
	        <param name='odi.odinames' value='�����ο���ȹ'>
	        <param name='odi.�����ο���ȹ.pcount' value="3">
	        <param name='odi.�����ο���ȹ.args1' value="searchCrsType=${searchCrsType}">
	        <param name='odi.�����ο���ȹ.args2' value="searchFromDate=${searchFromDate}">
	        <param name='odi.�����ο���ȹ.args3' value="searchToDate=${searchToDate}">
	      </c:when>	
		  <c:when test="${report eq 'eduplan2'}">
			  	<param name='connection.reportname' value='�����ο���ȹ2.ozr'>
	        <param name='odi.odinames' value='�����ο���ȹ'>
	        <param name='odi.�����ο���ȹ.pcount' value="3">
	        <param name='odi.�����ο���ȹ.args1' value="searchCrsType=${searchCrsType}">
	        <param name='odi.�����ο���ȹ.args2' value="searchFromDate=${searchFromDate}">
	        <param name='odi.�����ο���ȹ.args3' value="searchToDate=${searchToDate}">
	      </c:when>	
		  <c:when test="${report eq 'professor_info'}">
		  	<param name='connection.reportname' value='����ī��.ozr'>
	        <param name='odi.odinames' value='����ī��'>
	        <param name='odi.����ī��.pcount' value='1'>
	        <param name='odi.����ī��.args1' value='profno=${profno}'>
		  </c:when> 
			  <c:when test="${report eq 'prof_grade'}">
			  	<param name='connection.reportname' value='�����޺���ȸ.ozr'>
	        <param name='odi.odinames' value='�����޺���ȸ'>
	        <param name='odi.�����޺���ȸ.pcount' value='2'>
	        <param name='odi.�����޺���ȸ.args1' value='searchFromDate=${searchFromDate}'>
	        <param name='odi.�����޺���ȸ.args2' value='searchToDate=${searchToDate}'>
			  </c:when> 
			  <c:when test="${report eq 'finish'}">
			  	<param name='connection.reportname' value='�̼�������.ozr'>
	        <param name='odi.odinames' value='�̼�������'>
	        <param name='odi.�̼�������.pcount' value='1'>
	        <param name='odi.�̼�������.args1' value='courseCode=${courseCode}'>	        
			  </c:when>
			  <c:when test="${report eq 'isu'}">
			  	<param name='connection.reportname' value='�̼�Ȯ�μ�.ozr'>
	        <param name='odi.odinames' value='�̼�Ȯ�μ�'>
	        <param name='odi.�̼�Ȯ�μ�.pcount' value='1'>
	        <param name='odi.�̼�Ȯ�μ�.args1' value='courseCode=${courseCode}'>	        
			  </c:when> 
			  <c:when test="${report eq 'hun'}">
			  	<param name='connection.reportname' value='�����Ʒ������.ozr'>
	        <param name='odi.odinames' value='�����Ʒ������'>
	        <param name='odi.�����Ʒ������.pcount' value="1">
	        <param name='odi.�����Ʒ������.args1' value="courseCode=${courseCode}">
	     	</c:when>
	     	<c:when test="${report eq 'finishList' }">
	     		<param name='connection.reportname' value='�����������ڸ��.ozr'>
		        <param name='odi.odinames' value='�����������ڸ��'>
		        <param name='odi.�����������ڸ��.pcount' value="1">
		        <param name='odi.�����������ڸ��.args1' value="courseCode=${courseCode}">
	     	</c:when>
	    			
	     	<c:when test="${report eq 'prf_study'}">
			  	<param name='connection.reportname' value='new�ⰭȮ�μ�.ozr'>
		        <param name='odi.odinames' value='new�ⰭȮ�μ�'>
		        <param name='odi.new�ⰭȮ�μ�.pcount' value="3">
		        <param name='odi.new�ⰭȮ�μ�.args1' value="professorNo=${professorNo}">
		        <param name='odi.new�ⰭȮ�μ�.args2' value="searchFromDate=${searchFromDate}">
		        <param name='odi.new�ⰭȮ�μ�.args3' value="searchToDate=${searchToDate}">
			</c:when>

	     	<c:when test="${report eq 'prf_tax'}">
			  	<param name='connection.reportname' value='��õ��.ozr'>
		        <param name='odi.odinames' value='��õ��'>
		        <param name='odi.��õ��.pcount' value="6">
		        <param name='odi.��õ��.args1' value="totalSumtax=${totalSumtax}">
		        <param name='odi.��õ��.args2' value="convertTotalSumtax=${convertTotalSumtax}">
		        <param name='odi.��õ��.args3' value="title=${title}">
		        <param name='odi.��õ��.args4' value="title2=${title2}">
		        <param name='odi.��õ��.args5' value="title3=${title3}">
		        <param name='odi.��õ��.args6' value="year=${year}">
			</c:when>
			
	     	<c:when test="${report eq 'crs_guide'}">
			  	<param name='connection.reportname' value='�����ȳ���_��å��.ozr'>
		        <param name='odi.odinames' value='�����ȳ���_��å��'>
		        <param name='odi.�����ȳ���_��å��.pcount' value="1">
		        <param name='odi.�����ȳ���_��å��.args1' value="coursecode=${coursecode}">
			</c:when>
			
	     	<c:when test="${report eq 'satis_result'}">
			  	<param name='connection.reportname' value='������.ozr'>
		        <param name='odi.odinames' value='������'>
		        <param name='odi.������.pcount' value="3">
		        <param name='odi.������.args1' value="date_yyyymm=${date_yyyymm}">
		        <param name='odi.������.args2' value="date_yyyy=${date_yyyy}">
		        <param name='odi.������.args3' value="date_mm=${date_mm}">
			</c:when>
			
		  </c:choose>	           	  
		</object>
  </body>
</html>