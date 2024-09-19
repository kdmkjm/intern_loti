<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>설문 작성하기</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link rel="stylesheet" href='<html:rewrite page="/style/main.css"/>' type="text/css" />
<script type="text/javascript" src='<html:rewrite page="/common/js/prototype.js"/>'></script>
<script type="text/javascript">
	String.prototype.trim = function()
	{
	 return this.replace(/(^\s*)|(\s*$)/gi, "");
	}
	function replySave(frm)
	{
		var itemcnt = frm.itemcnt.value;	
		
		for(var i=1; i<=itemcnt; i++)
		{
		  var reqseq = eval("document.forms[0].reqseq_array"+i+".value");
			var replytype = eval("document.forms[0].replytype_array"+i+".value");
			var etcflag = eval("document.forms[0].etcflag_array"+i+".value");
			var cnt=0;
			if(replytype=="1" || replytype=="5" || replytype == "6")
			{
				var examcnt = eval("document.forms[0].examcnt"+i+".value");
				for(var j=0; j<examcnt; j++)
				{	
					if(examcnt == 1)
					{
						var enc = eval("document.forms[0].reply_array"+i+".checked");
					}else{
						var enc = eval("document.forms[0].reply_array"+i+"["+j+"].checked");
					}
					
					if(enc)
					{
						cnt++;
					}
				}
				if(etcflag=="Y")
				{
					var enc = eval("document.forms[0].reply_array"+i+"["+(j)+"].checked");
					if(enc)
					{
						cnt++;
					}
				}
			}
			else if(replytype=="2")
			{
				var examcnt = eval("document.forms[0].examcnt"+i+".value");
				for(var j=1; j<=examcnt; j++)
				{
					var enc = eval("document.forms[0].reply_array"+i+""+j+".checked");
					
					//alert(enc);
					if(enc)
					{
						cnt++;
					}
				}
				if(etcflag=="Y")
				{
					var enc = eval("document.forms[0].reply_array"+i+""+(j)+".checked");
					if(enc)
					{
						cnt++;
					}
				}
			}
			else
			{
				cnt++;
			}
			
			if( cnt==0 )
			{
				alert(reqseq+"번째 선택 설문에 대한 답변이 없습니다.");
				var enc = eval("document.forms[0].reply_array"+i+"[1].focus()");
				if(enc)
				{
					return;
				}
				return;
			}
		}
		 
		if(document.all.jobcode.value == "")
		{
			alert("직렬을 선택하세요");
			return;
		}
		
		if(document.all.jobcode.value == "기타" && document.all.etc.value.trim() == "")
		{
			alert("직렬을 입력하세요");
			document.all.etc.value = "";
			document.all.etc.focus();
			return;
		}
		
		if( document.forms[0].rankcode.value == "")
		{
			alert("직급을 입력하여 주십시요.");
			return;
		}
		
		if( document.forms[0].gender[0].checked == false && document.forms[0].gender[1].checked == false)
		{
			alert("성별을 선택하여 주십시요.");
			return;
		}	
		
		if( document.forms[0].workday.value == "")
		{
			alert("근무년수를 입력하여 주십시요.");
			return;
		}	
		
		var tmp = document.all.replyOK.innerHTML;
		document.all.replyOK.innerHTML = "";
		var do_confirm = confirm("저장하시겠습니까?");
		if(do_confirm == true)
		{
			formSubmit();
		} else {
			document.all.replyOK.innerHTML = tmp;
		}		
	}
	
	function check_other(seq, eseq){
		var replytype = eval("document.forms[0].replytype_array"+seq+".value");
		var examcnt = eval("document.forms[0].examcnt"+seq+".value");

		if(replytype == "1"){
			if(etcflag=="Y"){
				if(eseq == examcnt){
					eval("document.forms[0].reply_array"+seq+"["+eseq+"].checked = true");
				}else{
					var other = eval("document.forms[0].other"+seq);
					other.value="";
				}
			}
		}else if(replytype == "2"){
			if(etcflag=="Y"){
				if(eseq == examcnt){
					eval("document.forms[0].reply_array"+seq+""+eseq+".checked= true");
				}
			}
		}
	}
	
	function formSubmit()
	{
		var frm = document.forms[0];
		var chkmod = frm.chkmod.value;
		
		if(chkmod == "C")
		{
			frm.action = "extMylcSurvey.act?task=insert";
		}
		else
		{
			frm.action = "extMylcSurvey.act?task=modify";
		}
		//var url = frm.action;
    //var pars = Form.serialize(frm);

		//new Ajax.Updater(
		//				 '',
    //                       url,
    //                        {
    //                          method: 'POST',
    //                          parameters: pars,
    //                          evalScripts: true,
    //                          onComplete: saveComp,
    //                          onFailure: reportError
    //                          });
		//frm.target = "actionFrame";
		frm.submit();
	}
	
	// 저장완료
	function saveComp(resXML)
	{
		var xmlDoc = resXML.responseXML;
		var cmd, retCode, msg;
		var resultNode = xmlDoc.getElementsByTagName('result');

		cmd = resultNode[0].childNodes[0].text;
		retCode = resultNode[0].childNodes[1].text;
		msg = resultNode[0].childNodes[2].text;

		if (retCode == "true") 
		{
			if(msg != "") 
			{
				alert(msg);
				opener.searchList("move");
				self.close();
			}
		}
	}
	
	function reportError(e)
	{
		alert(e);
	}	
	function checkEtc()
	{
		var job = document.all.jobcode.value;
		if(job == "기타")
			document.all.cellEtc.innerHTML = "<input type='etc' name='etc' id='etc' style='width:125px;'>";
		else
			document.all.cellEtc.innerHTML = "";
	}
</script>
</head>
<body>
<html:form action="extMylcSurvey.act?task=insert">
<input type="hidden" name="coursecode" value="${coursecode }">
<input type="hidden" name="surveyno" value="${rsExtMylc_Survey.surveyno }">
<input type="hidden" name="stdno" value="${stdno }">
<input type="hidden" name="chkmod" value="${chkmod }">
<table width="650" border="0" cellspacing="5" cellpadding="0" height="490" bgcolor="#E7E7E7">
  <tr> 
    <td valign="top"> 
      <table width="640" border="0" cellspacing="1" cellpadding="0" height="480" bgcolor="#D1D1D1">
        <tr> 
          <td bgcolor="#FFFFFF" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/poll/title_02-4.gif"/>' width="118" height="42" alt="설문 작성하기" /></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td> 
                  <table width="617" border="0" cellspacing="0" cellpadding="0" align="center">
                  <fmt:parseDate var="fromdate" value="${rsExtMylc_Survey.fromdate}" pattern="yyyymmdd"></fmt:parseDate>
                  <fmt:parseDate var="todate" value="${rsExtMylc_Survey.todate}" pattern="yyyymmdd"></fmt:parseDate>
                    <tr> 
                      <td> 
                        <!--설문개요 테이블 시작-->
                        <table width="617" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8" align="center"> 
                         	<c:if test="${rsExtMylc_Course.coursename == null}">
                         		<tr>
	                          	<td class="pt4" width="98">설문개요</td>
	                           	<td class="pt2Left">
	                          		&nbsp;${rsExtMylc_Survey.title }<br>${loti:convertHtmlBrNbsp(rsExtMylc_Survey.summary) }
	                          	</td>
	                          </tr>
	                          <tr> 
	                            <td class="pt4" width="98">설문기간</td>
	                            <td class="pt2Left">
	                            	<c:if test="${fromdate != null}">
	                            		&nbsp;<fmt:formatDate value="${fromdate}" pattern="yyyy.mm.dd"/> ~ <fmt:formatDate value="${todate}" pattern="yyyy.mm.dd"/>
	                            	</c:if>
	                            	<c:if test="${fromdate == null}">
	                            		&nbsp;상시
	                            	</c:if>
	                            </td>                            	
	                          </tr>	                          
                         	</c:if>
                         	<c:if test="${rsExtMylc_Course.coursename != null}">
                         		<tr>
	                         		<td class="pt4" width="98">과정명</td>
	                          	<td class="pt2Left">
	                         			&nbsp;${rsExtMylc_Course.coursename }
	                         		</td>
	                         	</tr>
	                         	<tr> 
	                            <td class="pt4" width="98">과정기간</td>
	                            <td class="pt2Left">
	                            <fmt:parseDate var="edufrom" value="${rsExtMylc_Course.edufrom}" pattern="yyyymmdd"></fmt:parseDate>
                  						<fmt:parseDate var="eduto" value="${rsExtMylc_Course.eduto}" pattern="yyyymmdd"></fmt:parseDate>
	                            	<c:if test="${fromdate != null}">
	                            		&nbsp;<fmt:formatDate value="${edufrom}" pattern="yyyy.mm.dd"/> ~ <fmt:formatDate value="${eduto}" pattern="yyyy.mm.dd"/>
	                            	</c:if>
	                            	<c:if test="${fromdate == null}">
	                            		&nbsp;상시
	                            	</c:if>
	                            </td>                            	
                          	</tr>
                         	</c:if>
                        </table>
                        <!--설문개요 테이블 끝-->
                      </td>
                    </tr>
                    <tr> 
                      <td> 
                        <!--설문 내용 테이블 시작-->
                        <table width="617" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td> 
                              <table width="617" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_01.gif"/>' width="5" height="5" alt=""></td>
                                  <td width="607" height="5" bgcolor="#F8F2E6"></td>
                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_02.gif"/>' width="5" height="5" alt=""></td>
                                </tr>
                                <tr bgcolor="#F8F2E6"> 
                                  <td width="5"></td>
                                  <td width="607" bgcolor="#F8F2E6" class="pHead"> 
                                  	${loti:convertHtmlBrNbsp(rsExtMylc_Survey.headtext) }
                                  </td>
                                  <td width="5"></td>
                                </tr>
                                <tr> 
                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_03.gif"/>' width="5" height="5" alt=""></td>
                                  <td width="607" height="5" bgcolor="#F8F2E6"></td>
                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_04.gif"/>' width="5" height="5" alt=""></td>
                                </tr>
                              </table>
                            </td>
                          </tr>  
                          <tr> 
                            <td height="10"></td>
                          </tr>  
                          <c:forEach var="itemList" items="${rsExtMylc_Survey.itemlist}" varStatus="idx">
											     		<input type="hidden" id="reqseq_array${idx.count}" name="reqseq_array${idx.count}" value="${itemList.reqseq}">
											     		<input type="hidden" id="replytype_array${idx.count}" name="replytype_array${idx.count}" value="${itemList.replytype }"> 
											     		<input type="hidden" id="etcflag_array${idx.count }" name="etcflag_array${idx.count }"  value="${itemList.etcflag }">                  
	                          	<c:if test="${itemList.replytype eq '6' }">
		                          	<c:if test="${itemList.itemgroup ne null}">                        	
		                          		<tr> 
		                                <td><img src='<html:rewrite page="/images/poll/view_t_bg_top.gif"/>' width="617" height="5"></td>
		                              </tr>
		                              <tr> 
		                                <td class="pTitle1">${loti:convertHtmlBrNbsp(itemList.itemgroup) }</td>
		                              </tr>
		                          	  <c:if test="${itemList.profno ne preProfno}">
			                              <tr> 
			                                <td class="pTitle1">[${itemList.subjname } - ${itemList.profname }]에 대하여 (과목별 공통사항)</td>
			                              </tr>                          	  	
		                          	  </c:if>			                              
		                              <tr> 
		                                <td height="8" valign="top"><img src='<html:rewrite page="/images/poll/view_t_bg_bottom.gif"/>' width="617" height="5"></td>
		                              </tr>
		                          	</c:if>	                          		                          	
	                          		<tr> 
	                                <td><img src='<html:rewrite page="/images/poll/view_t_bg2_top.gif"/>' width="617" height="5"></td>
	                              </tr>
	                              <tr> 
	                                <td class="pTitle2">${itemList.reqseq }.${itemList.itemcontents }</td>
	                              </tr>
	                              <tr> 
	                                <td height="8" valign="top"><img src='<html:rewrite page="/images/poll/view_t_bg2_bottom.gif"/>' width="617" height="5"></td>
	                              </tr> 
	                              <c:set var="preProfno" value="${itemList.profno}"/>                         	
	                          	</c:if>
	                          	<c:if test="${itemList.replytype ne '6' }">
		                          	<c:if test="${itemList.itemgroup ne null}">                        	
		                          		<tr> 
		                                <td><img src='<html:rewrite page="/images/poll/view_t_bg_top.gif"/>' width="617" height="5"></td>
		                              </tr>
		                              <tr> 
		                                <td class="pTitle1">${loti:convertHtmlBrNbsp(itemList.itemgroup) }</td>
		                              </tr>
		                              <tr> 
		                                <td height="8" valign="top"><img src='<html:rewrite page="/images/poll/view_t_bg_bottom.gif"/>' width="617" height="5"></td>
		                              </tr>
		                          	</c:if>	                          	
	                          		<tr> 
	                                <td><img src='<html:rewrite page="/images/poll/view_t_bg2_top.gif"/>' width="617" height="5"></td>
	                              </tr>
	                              <tr> 
	                                <td class="pTitle2">${itemList.disreqseq }.${itemList.itemcontents }${itemList.profname }</td>
	                              </tr>
	                              <tr> 
	                                <td height="8" valign="top"><img src='<html:rewrite page="/images/poll/view_t_bg2_bottom.gif"/>' width="617" height="5"></td>
	                              </tr>  
	                          	</c:if>                          	
			                          <c:choose>
			                          	<c:when test="${itemList.replytype == 1}">
			                          		<tr> 
				                          		<td> 
			                              		<table width="617" border="0" cellspacing="0" cellpadding="0">	 
								                          <c:forEach var="examList" items="${itemList.examlist}" varStatus="eidx">
							                          	  <c:if test="${itemList.reply == examList.examseq}">
							                          	  	<c:set var="chkflag" value="checked"/>
							                          	  </c:if>
							                          	  <c:if test="${itemList.reply != examList.examseq}">
							                          	  	<c:set var="chkflag" value=""/>
							                          	  </c:if>						                          	  
								                          	<tr>
								                          		<td width="45" class="pR"> 
							                                  <input type="radio" name="reply_array${idx.count }" value="${examList.examseq}" ${chkflag } >
							                                </td>
							                                <td class="pt2Left">${examList.examcontents}</td>
							                            	</tr>
							                            	<tr> 
				                                  		<td class="poL" colspan="2"></td>
				                                		</tr>  
								                          	<c:set var="examcnt" value="${eidx.count}"/>	                      	
								                          </c:forEach>
								                          <c:if test="${itemList.etcflag eq 'Y' }">
							                            	<c:if test="${itemList.reply == examcnt+1}">
							                          	  	<c:set var="chkflag" value="checked"/>
							                          	  </c:if>
							                          	  <c:if test="${itemList.reply != examcnt+1}">
							                          	  	<c:set var="chkflag" value=""/>
						                          	  	</c:if>	
									                          <tr>
									                         		<td width="45" class="pR"> 
									                              <input type="radio" name="reply_array${idx.count}" value="${examcnt+1}" ${chkflag }>
									                            </td>
								                            	<td class="pt2Left">기타&nbsp;<input type="text" name="other${idx.count }" class="style6" style="width:500;" value="${itemList.other }"></td>				                            
									                          </tr>
								                          </c:if>
								                          <input type="hidden" name="examcnt${idx.count }" value="${examcnt}">
								                        </table>
								                      </td>		
								                    </tr>		                                                  	
					                 				</c:when>
			                          	<c:when test="${itemList.replytype == 2}">
			                          		<tr>
				                          		<td> 
			                              		<table width="617" border="0" cellspacing="0" cellpadding="0">		                          	
																					<c:forEach var="examList" items="${itemList.examlist}" varStatus="eidx">
																						<c:set var="chkflag" value=""/>
																					  <c:forTokens var="token" items="${itemList.reply}" delims=",">
																						  <c:if test="${token == examList.examseq}">
								                          	  	<c:set var="chkflag" value="checked"/>
								                          	  </c:if>
																					  </c:forTokens>								                          	
							                          		<tr>
								                          		<td width="45" class="pR"> 
							                                  <input type="checkbox" name="reply_array${idx.count}${eidx.count}" value="${examList.examseq}" ${chkflag}>
							                                </td>
							                                <td class="pt2Left">${examList.examcontents}</td>
							                            	</tr>
							                            	<tr> 
				                                  		<td class="poL" colspan="2"></td>
				                                		</tr>			                            	
								                          	<c:set var="examcnt" value="${eidx.count}"/>	                          	
								                          </c:forEach>                          	
								                          <c:if test="${itemList.etcflag eq 'Y' }">
									                          <tr>
									                         		<td width="45" class="pR"> 
									                              <input type="checkbox" name="reply_array${idx.count}${examcnt+1}"" value="${examcnt+1 }">
									                            </td>
								                            	<td class="pt2Left">기타&nbsp;<input type="text" name="other${idx.count }" class="style6" style="width:500;" value="${itemList.other }"></td>				                            
									                          </tr>
								                          </c:if>
						                              <input type="hidden" name="examcnt${idx.count }" value="${examcnt}">
						                           	</table>
								                      </td>	
								                  	</tr>
		                          		</c:when>
			                          	<c:when test="${itemList.replytype == 5}">
			                          	  <c:set var="chkflag1" value=""/>
			                          	  <c:set var="chkflag2" value=""/>
			                          	  <c:set var="chkflag3" value=""/>
			                          	  <c:set var="chkflag4" value=""/>
			                          	  <c:set var="chkflag5" value=""/>

		                          	  	<c:if test="${itemList.reply == 1}">
		                          	  		<c:set var="chkflag1" value="checked"/>
		                          	  	</c:if>
		                          	    <c:if test="${itemList.reply == 2}">
		                          	    	<c:set var="chkflag2" value="checked"/>
		                          	  	</c:if>
		                          	  	<c:if test="${itemList.reply == 3}">
		                          	  		<c:set var="chkflag3" value="checked"/>
		                          	  	</c:if>
		                          	  	<c:if test="${itemList.reply == 4}">
		                          	  		<c:set var="chkflag4" value="checked"/>
		                          	  	</c:if>
		                          	  	<c:if test="${itemList.reply == 5}">
		                          	  		<c:set var="chkflag5" value="checked"/>
		                          	  	</c:if>
			                          		<tr>
																			<td> 
					                              <table width="560" border="0" cellspacing="0" cellpadding="0" align="center" height="35">
					                                <tr> 					                          		
																						<td width="15"> 
					                                    <input type="radio" name="reply_array${idx.count}" value="1" ${chkflag1 }>
					                                  </td>
					                                  <td class="pt2Left" width="65">매우만족</td>
					                                  <td width="15"> 
					                                    <input type="radio" name="reply_array${idx.count}" value="2" ${chkflag2 }>
					                                  </td>
					                                  <td class="pt2Left" width="65">만족</td>
					                                  <td width="15"> 
					                                    <input type="radio" name="reply_array${idx.count}" value="3" ${chkflag3 }>
					                                  </td>
					                                  <td class="pt2Left" width="65">보통</td>
					                                  <td width="15"> 
					                                    <input type="radio" name="reply_array${idx.count}" value="4" ${chkflag4 }>
					                                  </td>
					                                  <td class="pt2Left" width="65">불만</td>
					                                  <td width="15"> 
					                                    <input type="radio" name="reply_array${idx.count}" value="5" ${chkflag5 }>
					                                  </td>
					                                  <td class="pt2Left">매우불만족</td>
					                                </tr>
					                                <input type="hidden" name="examcnt${idx.count }" value="5">	  
					                          		</table>
					                        		</td>
					                       		</tr>
				                        	</c:when>
			                          	<c:when test="${itemList.replytype == 6}"> 
			                          	  <c:set var="chkflag1" value=""/>
			                          	  <c:set var="chkflag2" value=""/>
			                          	  <c:set var="chkflag3" value=""/>
			                          	  <c:set var="chkflag4" value=""/>
			                          	  <c:set var="chkflag5" value=""/>
			                          	  
		                          	  	<c:if test="${itemList.reply == 1}">
		                          	  		<c:set var="chkflag1" value="checked"/>
		                          	  	</c:if>
		                          	    <c:if test="${itemList.reply == 2}">
		                          	    	<c:set var="chkflag2" value="checked"/>
		                          	  	</c:if>
		                          	  	<c:if test="${itemList.reply == 3}">
		                          	  		<c:set var="chkflag3" value="checked"/>
		                          	  	</c:if>
		                          	  	<c:if test="${itemList.reply == 4}">
		                          	  		<c:set var="chkflag4" value="checked"/>
		                          	  	</c:if>
		                          	  	<c:if test="${itemList.reply == 5}">
		                          	  		<c:set var="chkflag5" value="checked"/>
		                          	  	</c:if>
						                          <tr> 
						                            <td> 
						                              <table width="560" border="0" cellspacing="0" cellpadding="0" align="center" height="35">
						                                <tr> 
						                                  <td width="15"> 
						                                    <input type="radio" name="reply_array${idx.count }" value="1" ${chkflag1 }>
						                                  </td>
						                                  <td class="pt2Left" width="65">매우만족</td>
						                                  <td width="15"> 
						                                    <input type="radio" name="reply_array${idx.count }" value="2" ${chkflag2 }>
						                                  </td>
						                                  <td class="pt2Left" width="65">만족</td>
						                                  <td width="15"> 
						                                    <input type="radio" name="reply_array${idx.count }" value="3" ${chkflag3 }>
						                                  </td>
						                                  <td class="pt2Left" width="65">보통</td>
						                                  <td width="15"> 
						                                    <input type="radio" name="reply_array${idx.count }" value="4" ${chkflag4 }>
						                                  </td>
						                                  <td class="pt2Left" width="65">불만</td>
						                                  <td width="15"> 
						                                    <input type="radio" name="reply_array${idx.count }" value="5" ${chkflag5 }>
						                                  </td>
						                                  <td class="pt2Left">매우불만족</td>
						                                </tr>
						                                <input type="hidden" name="examcnt${idx.count}" value="5">
						                                <input type="hidden" name="profno${idx.count}" value="${itemList.profno }">	
						                              </table>
						                            </td>
						                         	</tr>
			                          	</c:when>
			                          	<c:when test="${itemList.replytype == 3}">
			                          	<tr>
				                            <td> 
				                              <input type="text" name="reply_array${idx.count}" style="width:99%;" value="${itemList.reply }">
				                            </td>
				                          </tr> 		                          	
			                          	</c:when>
			                          	<c:otherwise>
			                          	<tr>
				                            <td> 
				                              <textarea name="reply_array${idx.count}" style="width:99%;" rows="3">${itemList.reply }</textarea>
				                            </td>  
				                          </tr>                        	
			                          	</c:otherwise>
					                      </c:choose>
					                      <c:set var="itemcnt" value="${idx.count }"/>
					                      <tr> 
			                            <td height="10"></td>
			                          </tr>
	                          </c:forEach> 
	                          <input type="hidden" name="itemcnt" value="${itemcnt }">			                          			                          
	                          <tr> 
	                            <td height="10"></td>
	                          </tr>
	                          <tr> 
	                            <td> 
	                              <table width="617" border="0" cellspacing="0" cellpadding="0">
	                                <tr> 
	                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_01.gif"/>' width="5" height="5" alt=""></td>
	                                  <td width="607" height="5" bgcolor="#F8F2E6"></td>
	                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_02.gif"/>' width="5" height="5" alt=""></td>
	                                </tr>
	                                <tr bgcolor="#F8F2E6"> 
	                                  <td width="5"></td>
	                                  <td width="607" bgcolor="#F8F2E6" class="pHead">
	                                  	${loti:convertHtmlBrNbsp(rsExtMylc_Survey.tailtext) }
																		</td>
	                                  <td width="5"></td>
	                                </tr>
	                                <tr> 
	                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_03.gif"/>' width="5" height="5" alt=""></td>
	                                  <td width="607" height="5" bgcolor="#F8F2E6"></td>
	                                  <td width="5"><img src='<html:rewrite page="/images/poll/round_04.gif"/>' width="5" height="5" alt=""></td>
	                                </tr>
	                              </table>
	                            </td>
	                          </tr>
	                          <tr> 
                            	<td height="10"></td>
                          	</tr>
                     			</table>
                        <!--설문 내용 테이블 끝-->
                      	</td>
                    	</tr>
                    	<tr> 
	                      <td> 
	                        <!--설문참여자 정보 테이블 시작-->
	                        <table width="617" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
	                          <tr> 
	                            <td class="pt1" width="89">직렬</td>
	                            <td class="pt2Left" width="218"> 
	                            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
   																<tr>
 																		<c:if test="${fn:substring(rsExtMylc_Survey.jobcode, 0, 2) == '기타'}">
 																			<c:set var="checkJobCode" scope="request" value="Y"/>
 																		</c:if>
   																	<c:if test="${checkJobCode == 'Y'}">
	   																	<td width="80">
				   															&nbsp;<html:select property="jobcode" value="기타" onchange="checkEtc()">
				                              		<option value="">선택</option>
				   																<html:optionsCollection name="jobCode" property="beanCollection" />
				   															</html:select>
	   																	</td>
	   																	<td width="138" id="cellEtc"><input type='etc' name='etc' id='etc' style="width:125px;" value="${fn:substring(rsExtMylc_Survey.jobcode, 2, fn:length(rsExtMylc_Survey.jobcode))}"></td>
	   																</c:if>
   																	<c:if test="${checkJobCode != 'Y'}">
	   																	<td width="80">
				   															&nbsp;<html:select property="jobcode" value="${rsExtMylc_Survey.jobcode}" onchange="checkEtc()">
				                              		<option value="" selected="selected">선택</option>
				   																<html:optionsCollection name="jobCode" property="beanCollection" />
				   															</html:select>
	   																	</td>
	   																	<td width="138" id="cellEtc"></td>
	   																</c:if>
   																</tr>
   															</table>
	                            </td>
	                            <td class="pt1" width="89">직급</td>
	                            <td class="pt2Left" width="218"> 
	                            	&nbsp;<select name="rankcode" style="width:80px;">
                                	<option value="4" <c:if test="${rsExtMylc_Survey.rankcode == 4}">selected</c:if>>4급</option>
                                	<option value="5" <c:if test="${rsExtMylc_Survey.rankcode == 5}">selected</c:if>>5급</option>
                                	<option value="6" <c:if test="${rsExtMylc_Survey.rankcode == 6}">selected</c:if>>6급</option>
                                	<option value="7" <c:if test="${rsExtMylc_Survey.rankcode == null}">selected</c:if><c:if test="${rsExtMylc_Survey.rankcode == 7}">selected</c:if>>7급</option>
                                	<option value="8" <c:if test="${rsExtMylc_Survey.rankcode == 8}">selected</c:if>>8급</option>
                                	<option value="9" <c:if test="${rsExtMylc_Survey.rankcode == 9}">selected</c:if>>9급</option>
                                	<option value="10" <c:if test="${rsExtMylc_Survey.rankcode == 10}">selected</c:if>>10급</option>
                                	<option value="99" <c:if test="${rsExtMylc_Survey.rankcode == 10}">selected</c:if>>기타</option>
                              	</select>
	                            </td>
	                          </tr>
	                          <tr>
	                            <td class="pt1" width="89">성별</td>
	                            <td class="pt2Left"> 
	                              &nbsp;<input type="radio" name="gender" value="0" <c:if test="${rsExtMylc_Survey.gender == 0}">checked</c:if>>남성 
	                              <input type="radio" name="gender" value="1" <c:if test="${rsExtMylc_Survey.gender == 1}">checked</c:if>>여성
	                            </td>
	                            <td class="pt1" width="89">총근무년수</td>
	                            <td class="pt2Left"> 
	                              &nbsp;<input type="text" name="workday" style="width:60px;" value="${rsExtMylc_Survey.workday }">년
	                            </td>
	                          </tr>
	                        </table>
	                        <!--설문참여자 정보 테이블 끝-->
	                      </td>
	                    </tr>
	                    <tr> 
	                      <td> 
	                        <!--하단 버튼-->
	                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="45">
	                          <tr> 
	                            <td align="right" id="replyOK">
	                            	<img src='<html:rewrite page="/images/board/btn_okpoll.gif"/>' alt="답변 등록" style="cursor:hand" onclick="replySave(document.forms[0])">
	                            </td>
	                          </tr>
	                        </table>
	                      </td>
	                		</tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<iframe id="actionFrame" width="0" height="0"></iframe>
</html:form>
</body>
</html>
