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
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
<!--
	window.name = "SurveyNew";
	var jq = $.noConflict(true);
	
	jq(function(){
		jq('select[name="itemgroup_array"]').each(function(idx){
			jq(this).change(function(){
				var content;
				if(this.value == '강의만족도'){
					content = '강의만족도 - ';
				}
				else{
					contnet = '';
				}
				jq('input[name="itemcontents_array"]').eq(idx).val(content);
			});
		});
		
		document.forms[0].title.focus();
		if(jq('#mainList') != null)
		{
			tresize(140);
		}
		if('${itemAdded}' == 1){
			jq('#mainList').scrollTop(jq('#mainList')[0].scrollHeight);
		}
	});
	
	function goList()
  {
  	if(confirm('변경사항이 저장되지 않았습니다.\n취소하시겠습니까?'))
  	{
  		document.location.href = '<html:rewrite page="/tstSurvey.act?task=list"/>';
  	}
  }
  
	function maxlength_check(obj, len) 
	{
		if(obj.value.length > len) 
		{
			obj.blur();
			obj.focus();
			obj.value = obj.value.substring(0, len);
		}
	}
  
  function showSwtichLayer(obj, option) 
  {	
		if(option == "1" || option == "2") 
		{
			//(단일선택,중복선택)선택형
			eval("itemExam"+obj).style.display = "block"; 
			if(option =="1")
			{
				eval("scorediv"+obj).style.display = "block"; 
			}
			else
			{
				eval("scorediv"+obj).style.display = "none"; 
			}	
		} 
		else
		{
		  //단답형, 장문형, 
			eval("itemExam"+obj).style.display = "none";	
			eval("scorediv"+obj).style.display = "none"; 
			
		}
	}
	
	function showReplyLayer(option)
	{
		jq('#surveyPassword').hide();
		var itemcount = document.forms[0].itemcount.value;
		
		for(var i=1; i<=itemcount; i++)
		{
			if(option == "1") 
			{
				//(단일선택,중복선택)선택형
				eval("replydiv"+i).style.display = "block";
			} 
			else
			{
			  //단답형, 장문형, 
				eval("replydiv"+i).style.display = "none";
			}
		}
	}

	
	
	/*
	 * CheckBox를 Hidden으로 바꿔주는 함수
	 *    f : 폼이름
	 *    ele : checkbox 이름
	 *	  div : 교체할 checkbox를 포함한 DIV태그
	 */
	function CheckboxToHidden(f,ele, div) {
	    var ele_h;
	    var val;
		ele = jq(ele);
        for (var i = 1; i <= ele.length; i++) {
            // hidden객체생성, 이름은 checkbox와 같게한다.
            ele_h = document.createElement("input");
            ele_h.setAttribute("type","hidden");
            ele_h.setAttribute("name",ele[i-1].name);
            if(ele[i-1].checked == 'checked'){
             	val = 'Y';
             }
             else{
             	val = 'N';
             }
            ele_h.setAttribute("value",val);
            eval(div+i).replaceChild(ele_h, ele[i-1]);
        }
	}

	
	
		//내역 취소 
	function cancel_check(){
		if(confirm(' 변경사항이 모두 삭제됩니다.\n취소하시겠습니까?'))
		{	
		  	document.forms[0].action = 'tstSurvey.act?task=list';
	    	document.forms[0].submit();
		}
	}
	

	
	
	//설문 미리보기
	function viewSurvey(surveyno)
	{
		var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
		window.open('<html:rewrite page="/tstSurvey.act?task=preview&popflag=pop&surveyno='+surveyno+'"/>', 'popup', 'scrollbars=yes, menubar=no, width=667, height=600, status=yes top='+wint+', left='+winl);
	}
	
	//완료시에 확인해야 할 사항
	function check_complete(frm)
	{	
		var range;
			
		if(frm.title.value.trim() == "") 
		{
			alert("제목을 입력하세요.");			
			frm.title.focus();
			return;
		}
		
		if(frm.courseYear.value == '')
		{
			alert('과정년도를 선택해주세요');
			frm.couseYesr.focus();
			return;
		}
		
		if(frm.coursecode.value == '')
		{
			alert('과정명을 선택해주세요');
			frm.cousecode.focus();
			return;
		}
		/*	
			기본항목만 사용할 경우를 위함
			if(frm.acnt.value < 1){		
				alert('항목만들기를 먼저 수행하세요!');
				return;
			}
		*/
		
		if(typeof(frm.elements['reqseq_array']) == 'undefined')
		{
		  if(frm.itemcount.value == "")
		  {
		  	alert('문항수를 입력하고 문항만들기를 먼저 수행하세요!');
		  	frm.itemcount.focus();
				return;
		  }
			if(frm.itemcount.value > 0)
			{		
				alert('문항만들기를 먼저 수행하세요!');
				return;
			}
		} 
		else 
		{
			if(typeof(frm.reqseq_array.value) != 'undefined')
			{
				if(frm.itemcontents_array.value.trim() == "")
				{
					alert("1번 문항의의 제목을 입력하세요.");
					frm.itemcontents_array.focus();
					return;
				}		
			}	
			else 
			{
				if(frm.reqseq_array.length != frm.itemcount.value)
				{
					alert('문항만들기를 먼저 수행하세요!');
					return;
				}
				var count = 0;
				for(var i=0;i<frm.itemcontents_array.length;i++)
				{
					if(frm.itemcontents_array[i].value.trim() == "")
					{
						alert(i+1+"번 항목의 제목을 입력하세요.");
						frm.itemcontents_array[i].value = "";
						frm.itemcontents_array[i].focus();
						return;
					}
				}
			}		
		}
		
		
		
		if(confirm('설문 작성을 완료 합니다.\n완료하시겠습니까?'))
		{	
			CheckboxToHidden(frm, frm.scoreflag_array, 'scorediv');
			//CheckboxToHidden(frm, frm.etcflag_array, 'etcdiv');
			CheckCourseOptions();
			
			if("${rsTst_Survey.chkmod}" == 'Y')
			{
				frm.action = "/tstSurvey.act?task=moddone";
			}
			else
			{
				frm.action='tstSurvey.act?task=insert';
			}
			
			jq('#contents_table').find('select[name="itemgroup_array"]').each(function(idx){
				if(jq(this).val() == '강의만족도'){
					var itemcontent = jq('#contents_table').find('input[name="itemcontents_array"]').eq(idx);
					if(jq(itemcontent).val().indexOf('강의만족도') != 0){
						jq(itemcontent).val('강의만족도 - ' + jq(itemcontent).val());						
					}
				}	
			});
			frm.submit();
		}
	}  	  
	
	function getSelectBoxCmidf()
	{
		jq.ajax({
			url: "tstSurvey.act",
			type: "GET",
			data: "task=selection&do=year&year=" + document.forms[0].courseYear.value,
			cache: false,
			success: function(msg){
				jq('#cmidf_option')
					.html('')
					.append('<option value="">과정선택</option><option value="">----------------------------</option>')
					.append(msg);
			}
		});
	}
	
	function CheckCourseOptions()
	{
		if("${rsTst_Survey.chkmod == 'Y'}")
		{
			document.forms[0].courseYear.disabled = false;
			document.forms[0].coursecode.disabled = false;
		}
	}
	
	//문항만들기
	function makeItemList()
	{
		var itemcount = document.forms[0].itemcount.value;
		
		
		if(document.forms[0].itemcount.value > 99)
		{
			alert('문항만들기는 99개 까지 수행할 수 있습니다.');
			document.forms[0].itemcount.focus();
			return;
		}
		CheckCourseOptions();
		
		var url = '/tstSurvey.act?task=makeitems&itemcount=' + itemcount;
		document.forms[0].action = url;
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}

	
	function ExamDefaultInput(reqseq)
	{
		var frm = document.forms[0];
		var req = new Array();
		req[0] = '만족';
		req[1] = '비교적 만족';
		req[2] = '보통';
		req[3] = '다소 미흡';
		req[4] = '미흡';
		var table = eval("examtable"+reqseq);
		var text = jq(table).find('input[type="text"][name="examcontents_array"]');
		jq(text).each(function(idx){
			jq(this).val(req[idx]);
		});
	}
	
	
	//설문문항 추가
  function makeForm(frm, task)
  {
    var itemcount = frm.itemcount.value;
		
		CheckboxToHidden(frm, frm.scoreflag_array, 'scorediv');
		//CheckboxToHidden(frm, frm.etcflag_array, 'etcdiv');
		frm.action = '/tstSurvey.act?task=add';
		CheckCourseOptions();
		frm.submit();	
	}
	
	//설문문항 삭제
	function check_delete(reqseq)
	{
		if(confirm(reqseq+"번 항목을 삭제합니다."))
		{
			var frm = document.forms[0];	
			CheckboxToHidden(frm, frm.scoreflag_array, 'scorediv');
			//CheckboxToHidden(frm, frm.etcflag_array, 'etcdiv');
			frm.action = '/tstSurvey.act?task=deleteitem&reqseq='+reqseq;
			CheckCourseOptions();
			frm.submit();	
		} 
	}
	
	//보기문항 추가
	function addExam(reqseq)
	{
		//var table = eval("examtable"+reqseq);
		var table = jq("#examtable"+reqseq);
		var count = parseInt(jq("#examtable"+reqseq).find('input[name="examseq_array"]:last').val());
		var tr = document.createElement('tr');
		var td = jq(document.createElement('td')).appendTo(jq(tr)).addClass('s2');
		jq(td).append(jq(document.createElement('input')).attr({type:'hidden', name:'examseq_array', value: count+1}))
			  .append(jq(document.createElement('input')).attr({type:'text', name:'examcontents_array', style:'width:95%;'}))
			  .append('&nbsp;')
			  .append(jq(document.createElement('img')).attr({src:'/images/board/btn_minus.gif', width: 15, height: 10, alt:'보기삭제', onclick:'delExam(this, '+reqseq+')', style:'cursor:hand;'}));
		jq(table).append(tr);
	}
	
	//보기문항 삭제
	function delExam(obj, reqseq)
	{
		jq(obj).parent().parent().remove();
// 		var table = eval('examtable'+reqseq);
		var table = jq("#examtable"+reqseq);
		var examseq_array = jq(table).find("input[name='examseq_array']");
		
		for(var i=0; i<jq(examseq_array).length; i++){
			examseq_array[i].value = i+1;
		}
	}
	
	function setProf(i, j)
	{		
		window.open('<html:rewrite page="/tstSurvey.act?task=profList&reqseq=' + i + '&profFlag=' + j +'"/>', 'popup', 'scrollbars=no, menubar=no, toolbar=no, location=no, width=410, height=520, status=yes');
	}

	function internetSurvey(){
		
		jq('#surveyPassword').show();
		
	}
	
//-->
</script>
<body>
<form action="/tstSurvey.act?task=insert" method="post">
<table width="790" border="0" cellspacing="0" cellpadding="0">
  <tr>
	  <td>
		<div class="ccGroup">
		<h2 class="hide">현재경로정보</h2>
		<h1>
			<c:if test="${rsTst_Survey.chkmod ne 'Y'}">
				<img alt="설문지작성 - 새 설문 등록" src="/images/poll/title_02-2.gif" />
			</c:if>
			<c:if test="${rsTst_Survey.chkmod eq 'Y'}">
				<img alt="설문지작성 - 설문 수정" src="/images/poll/title_02-1.gif" />
			</c:if>
		</h1>
		</div>
	  </td>
  </tr>
  <tr> 
    <td> 
    	<table width="750" border="0" cellspacing="0" cellpadding="0">
      	
        <tr> 
          <td height="15"></td>
        </tr>
        <tr> 
          <td> 

            <table width="750" border="0" cellspacing="0" cellpadding="0">
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
                  <!--설문등록 기본테이블시작-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="lbg"></td>
                      <td class="cbg4" > 
                        <table width="746" border="0" cellspacing="0" cellpadding="0">
                          <tr > 
                            <td width="99" class="t1up">제목</td>
                            <td class="s3"> 
                            	<html:hidden property="surveyno" value="${rsTst_Survey.surveyno}"/>
                              <input type="text" name="title" style="width:98%;" value="${rsTst_Survey.title }">
                            </td>
                          </tr>
                           <tr>
                          	<td width="99" class="t1up">과정</td>
                          	<td class="s3">
                          		<input type="hidden" name="chkmod" value="${rsTst_Survey.chkmod }"/>
                          		
                          		<select name="courseYear" onchange="getSelectBoxCmidf()" <c:if test="${rsTst_Survey.chkmod=='Y' }">disabled="disabled"</c:if>>
                          			<option value="">년도선택</option>
                          			<option value="">-------</option>
                          			<bean:write name="yearOptions" filter="HTML"/>
                          		</select>
                          		<span id="span_cmidf">
	                          		<select id="cmidf_option" name="coursecode" <c:if test="${rsTst_Survey.chkmod=='Y' }">disabled="disabled"</c:if>>
	                          			<option value="">과정선택</option>
	                          			<option value="">----------------------------</option>
	                          			<bean:write name="option_coursecode" filter="HTML"/>
	                          		</select>
                          		</span>
                          	</td>
                          </tr>
                          <tr> 
                            <td width="99" class="t1up">설문종류</td>
                            <td> 
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td class="s3" width="250">
                                  	<c:if test="${rsTst_Survey.islectsurvey ne '1' }"> 
                                  		<c:set var="replydisply" value="display:none"/>
                                    	<input type="radio" name="islectsurvey" value="0" checked="checked" onclick="showReplyLayer('0')">일반설문 
<!--                                     	<input type="radio" name="islectsurvey" value="1" onclick="showReplyLayer('1')">강의설문 -->
                                    	<input type="radio" name="islectsurvey" value="2" onclick="internetSurvey()">인터넷설문
                                    	<input type="text" name="surveyPassword" id="surveyPassword" style="width: 80px; display: none; " >
                                    </c:if>
                                    <c:if test="${rsTst_Survey.islectsurvey eq '1' }">
                                    	<c:set var="replydisply" value="display:block"/>
                                    	<input type="radio" name="islectsurvey" value="0" onclick="showReplyLayer('0')">일반설문
<!--                                     	<input type="radio" name="islectsurvey" value="1" checked="checked" onclick="showReplyLayer('1')">강의설문 -->
                                    	<input type="radio" name="islectsurvey" value="2" checked="checked" onclick="internetSurvey()">인터넷설문
                                    	<input type="text" name="surveyPassword" id="surveyPassword" style="width: 80px; display: none;"> 
                                   	</c:if>
                                  </td>
                                  <td class="t1up2" width="109">설문기간</td>
                                  <td class="s3"> 
                                    <input type="text" name="fromdate" style="width:80px;" value="${rsTst_Survey.fromdate }" readonly><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' style="cursor:hand" onclick="Calendar_D(this, fromdate, 'yyyy-mm-dd');">~ 
                                    <input type="text" name="todate" style="width:80px;" value="${rsTst_Survey.todate }" readonly><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' style="cursor:hand" onclick="Calendar_D(this, todate, 'yyyy-mm-dd');">
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr> 
                            <td width="99" class="t1up">설문개요</td>
                            <td class="s3"> 
                              <textarea name="summary" style="width:98%;" rows="3" onkeyup="maxlength_check(summary, 2000)" >${rsTst_Survey.summary }</textarea>
                            </td>
                          </tr>
                          <tr> 
                            <td width="99" class="t1up">문항수</td>
                            <td class="s3">
                           		<input type="text" name="itemcount" style="width:80px;" value="${rsTst_Survey.itemcount }">
                              	<img src='<html:rewrite page="/images/board/btn_make_poll.gif"/>' width="64" height="18" alt="문항만들기" onclick="makeItemList()" style="cursor:hand"/> 
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td class="lbg"></td>
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
            </table>
          </td>
        </tr>
        <c:if test="${rsTst_Survey.itemlist != null }">
        <tr> 
          <td> 
            <!--머리말 테이블 전체시작-->
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td> 
                  <table width="750" border="0" cellspacing="2" cellpadding="0" bgcolor="#91B475">
                    <tr> 
                      <td class="cbg4" > 
                        <table width="746" border="0" cellspacing="0" cellpadding="0">
                          <tr > 
                            <td width="99" class="t1up">머리말</td>
                            <td class="s3"> 
                              <textarea name="headtext" style="width:98%;" rows="3" >${rsTst_Survey.headtext }</textarea>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!--머리말 테이블 전체끝-->
          </td>
        </tr>
        <tr>
        	<td height="10"></td>
        </tr>
        <tr> 
          <td> 
            <!--추가문항 테이블 전체시작-->
            <div id="mainList" style="width:770px; overflow-y:scroll ;overflow-x:hidden" > 
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td> 
                  <table width="750" border="0" cellspacing="2" cellpadding="0" bgcolor="#91B475">
                    <tr> 
                      <td class="cbg4" > 
                        <table id="contents_table" width="746" border="0" cellspacing="0" cellpadding="0">
                        	<c:forEach var="itemList" items="${rsTst_Survey.itemlist}" varStatus="i">
                        	<input type="hidden" name="reqseq_array" value="${itemList.reqseq }"/>
	                        <tr> 
	                            <td width="99" class="t1up">설문그룹</td>
	                            <td class="s3">
	                            	<html:select property="itemgroup_array" value="${itemList.itemgroup}">
						        		<html:option value="기본항목">기본항목</html:option>
						        		<html:option value="교육효과">교육효과</html:option>
						        		<html:option value="과정운영">과정운영</html:option>
						        		<html:option value="학습평가">학습평가</html:option>
						        		<html:option value="참여식">참여식</html:option>
						        		<html:option value="시설이용">시설이용</html:option>
						        		<html:option value="강의만족도">강의만족도</html:option>
						        		<html:option value="기타">기타</html:option>
						      		</html:select>
	                            </td>
	                      </tr>
                          <tr> 
                            <td width="99" class="t1up">질문${i.count}<br>
								<img src='<html:rewrite page="/images/board/btn_del2.gif"/>' width="34" height="18" alt="삭제" onclick="check_delete(${itemList.reqseq})" style="cursor:hand" /> 	                     
                            </td>
                            <td class="s3none"> 
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td class="s2">
                                    
    	                                <input type="text" name="itemcontents_array" id="profName${i.count}" style="width:77%;" value="${itemList.itemcontents}"/>
	                                    &nbsp;&nbsp;<a href="javascript:ExamDefaultInput(${i.count });">기본답변항목입력</a>
	                                    <img src='<html:rewrite page="/images/board/btn_plus.gif"/>' width="20" height="15" alt="보기추가" title="보기 추가" onclick="addExam(${itemList.reqseq})" style="cursor:hand; vertical-align:middle; margin-bottom:2px;"/>
									 
                                    <c:if test="${i.count > 15}">
										<img id="popup_prof" name="popup_prof" onclick="setProf('${i.count }', '2')" src='<html:rewrite page="/images/board/btn_zoom.gif"/>' width="19" height="19" align="absmiddle" alt="찾아보기" style="cursor: pointer;" />
                    	                <input type="hidden" name="profNo_array" id="profNo${i.count}" value="${itemList.profNo}"/>
									</c:if>
									
                                  </td>
                                </tr>
                                <tr> 
                                  <td class="lbg3"></td>
                                </tr>
                                <tr> 
                                  <td class="s2">
                                  	<c:set var="check1" value=""/>
                                  	<c:set var="check2" value=""/>
                                  	<c:set var="check3" value=""/>
                                  	<c:set var="check4" value=""/>
                                  	<c:set var="check5" value=""/>
                                  	<c:set var="check6" value=""/>                            	 
                                  	<c:choose>
                                  		<c:when test="${itemList.replytype eq '2'}"><c:set var="check2" value="checked"/></c:when>
                                  		<c:when test="${itemList.replytype eq '3'}"><c:set var="check3" value="checked"/></c:when>
                                  		<c:when test="${itemList.replytype eq '4'}"><c:set var="check4" value="checked"/></c:when>
                                  		<c:when test="${itemList.replytype eq '5'}"><c:set var="check5" value="checked"/></c:when>
                                  		<c:when test="${itemList.replytype eq '6'}"><c:set var="check6" value="checked"/></c:when>
                                  		<c:otherwise><c:set var="check1" value="checked"/></c:otherwise>
                                  	</c:choose>
                                    <input type="radio" name="replytype_array[${i.count-1 }]" id="replytype_array[${i.count-1 }]" value="1" onclick="showSwtichLayer('${i.count}', '1')" ${check1}/>단일선택 
                                    <input type="radio" name="replytype_array[${i.count-1 }]" id="replytype_array[${i.count-1 }]" value="2" onclick="showSwtichLayer('${i.count}', '2')" ${check2}/>복수선택 
                                    <input type="radio" name="replytype_array[${i.count-1 }]" id="replytype_array[${i.count-1 }]" value="3" onclick="showSwtichLayer('${i.count}', '3')" ${check3}/>단답
                                    <input type="radio" name="replytype_array[${i.count-1 }]" id="replytype_array[${i.count-1 }]" value="4" onclick="showSwtichLayer('${i.count}', '4')" ${check4}/>장문
			                              <c:if test="${itemList.replytype == 1 or itemList.replytype == null}">
			                              	<c:set var="scoredisply" value="display:block"/>
			                              </c:if> 
			                              <c:if test="${itemList.replytype > 1}">
			                              	<c:set var="scoredisply" value="display:none"/>
			                              </c:if>                                     
                                    <div id="scorediv${i.count}" style="${scoredisply}">
                                    	<input type="checkbox" name="scoreflag_array" value="${i.count }" <c:if test="${itemList.scoreflag == 'Y' }">checked</c:if>/>점수반영
                                    </div>
									<div id="replydiv${i.count}" style="${replydisply }">	                                    
	                                    <input type="radio" name="replytype_array[${i.count-1 }]" id="replytype_array[${i.count-1 }]" value="5" onclick="showSwtichLayer('${i.count-1}', '5')" ${check5}/>만족도조사
	                                    <input type="radio" name="replytype_array[${i.count-1 }]" id="replytype_array[${i.count-1 }]" value="6" onclick="showSwtichLayer('${i.count-1}', '6')" ${check6}/>강사만족도
                                    </div> 
                                 	</td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr> 
                            <td width="99" class="t1up">선택내용</td>
                            <td class="s3none">      
                            <div id="itemExam${i.count}" style="${display}">
                              <c:if test="${itemList.replytype >2}">
                              	<c:set var="display" value="display:none"/>
                              </c:if> 
                              <c:if test="${itemList.replytype == null}">
                              	<c:set var="display" value="display:block"/>
                              </c:if> 
                              <table id="examtable${itemList.reqseq}" width="100%" border="0" cellspacing="0" cellpadding="0">
                              <c:if test="${itemList.replytype <=2}">
                              	<c:set var="display" value="display:block"/>
                              	
                              	<c:forEach var="examList" items="${itemList.examlist}" varStatus="j">
                                <tr> 
                                  <td class="s2"> 
                                 	<input type="hidden" name="examseq_array" value="${examList.examseq }">
                                  	<input type="text" name="examcontents_array" style="width:95%;" value="${examList.examcontents}">
                                  	<img src='<html:rewrite page="/images/board/btn_minus.gif"/>' width="15" height="10" alt="보기삭제" title="보기 삭제" onclick="delExam(this, ${i.count})" style="cursor:hand"/>
                                  </td>
                                </tr>
								</c:forEach>    
                              
                              <%-- '기타입력란'은 온라인설문을 사용하지 않으므로 삭제
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                               <tr> 
                                  <td class="lbg3"></td>
                                </tr>
                                <tr> 
                                  <td class="s2"> 
                                  	<c:if test="${itemList.etcflag eq 'Y'}">
                                  		<c:set var="etccheck" value="checked"/>
                                  	</c:if>       
                                  	<div id="etcdiv${i.count}" >
                                  		              	
                                    	<input type="checkbox" name="etcflag_array" value="${i.count }" ${etccheck}/>기타 ( 체크하시면 기타의견을 입력받을 수 있습니다.)
                                    </div>
                                  </td>
                                </tr>
                              </table>
                              --%>
                              </c:if>       
                              <c:if test="${itemList.replytype >= 3}">
                              	<c:set var="display" value="display:block"/>
                              	<c:forEach var="examList" items="${itemList.examlist}" varStatus="j">
                                <tr> 
                                  <td class="s2"> 
                                 	<input type="hidden" name="examseq_array" value="${examList.examseq }">
                                  	<input type="hidden" name="examcontents_array" style="width:95%;" value="${examList.examcontents}">
                                  </td>
                                </tr>
								</c:forEach> 
                              	<%-- '기타입력란'은 온라인설문을 사용하지 않으므로 삭제
                              	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                               <tr> 
                                  <td class="lbg3"></td>
                                </tr>
                                <tr> 
                                  <td class="s2">
                                  	 
                                  	<c:if test="${itemList.etcflag eq 'Y'}">
                                  		<c:set var="etccheck" value="checked"/>
                                  	</c:if>       
                                  	<div id="etcdiv${i.count}" >	
                                  	<c:forEach var="examList" items="${itemList.examlist}" varStatus="j">
                                  	<input type="hidden" name="examseq_array" value="${examList.examseq }"/>
                                  	<input type="hidden" name="examcontents_array" style="width:95%;" value="${examList.examcontents}"/>                         	
                                    	<input type="checkbox" name="etcflag_array" value="${i.count }" ${etccheck}/>기타 ( 체크하시면 기타의견을 입력받을 수 있습니다.)
                                    </c:forEach>
                                    </div>
                                    
                                  </td>
                                </tr>
                              </table>
                              --%>
                              </c:if> 
                              </table>
                            </div>
                            </td>
                          </tr>
                          </c:forEach>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            </div>
            <!--추가문항 테이블 전체끝-->
          </td>
        </tr>
        <tr> 
           <td> 
             <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
               <tr valign="bottom"> 
                 <td align="right">
					<img src='<html:rewrite page="/images/board/btn_poll_add.gif"/>' width="72" height="25" align="absmiddle" alt="설문추가"  onclick="javascript:makeForm(document.forms[0],'add');" style="cursor:hand"/>                   
                 </td>
               </tr>
             </table>
           </td>
         </tr>
        <tr> 
          <td> 
            <!--꼬리말 테이블 전체시작-->
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td> 
                  <table width="750" border="0" cellspacing="2" cellpadding="0" bgcolor="#91B475">
                    <tr> 
                      <td class="cbg4" > 
                        <table width="746" border="0" cellspacing="0" cellpadding="0">
                          <tr > 
                            <td width="99" class="t1up">꼬리말</td>
                            <td class="s3"> 
                              <textarea name="tailtext" style="width:98%;" rows="3">${rsTst_Survey.tailtext}</textarea>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!--꼬리말 테이블 전체끝-->
          </td>
        </tr>
        </c:if>
        <tr> 
          <td> 
            <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
              <tr> 
		        <td style="height:5px;"></td>
		      </tr>
              <tr> 
               	<td align="right">
               		<img src='<html:rewrite page="/images/board/btn_cancle2.gif"/>' width="57" height="25" alt="목록" onclick="goList()" style="cursor:hand" />                	
					<img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="저장" onclick="check_complete(document.forms[0])" style="cursor:hand"/>
				</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
	</td>
  </tr>
</table>
</form>
</body>