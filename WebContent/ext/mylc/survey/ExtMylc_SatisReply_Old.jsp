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
function save(frm){
	
		var itemcnt = frm.itemcnt.value;	
		for(var i=1; i<=itemcnt; i++)
		{
			var replytype = eval("document.forms[0].replytype_array"+i+".value");
			var etcflag = eval("document.forms[0].etcflag_array"+i+".value");
			var cnt=0;
			if(replytype=="1" || replytype=="5")
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
			else if(replytype =="6")
			{
				var teachercnt = eval("document.forms[0].teachercnt"+i+".value");
				for(var k=1; k<=teachercnt ; k++)
				{
					var examcnt = eval("document.forms[0].examcnt"+i+""+k+".value");
					for(var l=0; l<examcnt; l++)
					{
						if(examcnt==1)
						{		
							var enc = eval("document.forms[0].reply_array"+i+""+k+".checked");
						}
						else
						{
							var enc = eval("document.forms[0].reply_array"+i+""+k+"["+l+"].checked");
						}
						
						if(enc)
						{
							cnt++;
						}
					}
				}
			
			}else{
				cnt++;
			}
			
			if( cnt==0 )
			{
				alert((i)+"번째 선택 설문에 대한 답변이 없습니다.");
				return;
			}
		}
		 
		if( document.forms[0].jobcode.value=="" )
		{
			alert("직렬을 선택하여 주십시요.");
			return;
		}
		
		if( document.forms[0].gradecode.value == "")
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
		
		var do_confirm = confirm('저장하시겠습니까?');
		if(do_confirm == true)
			alert(document.forms[0].replyOK.onClick);
			document.forms[0].replyOK.onClick = "";
			alert(document.forms[0].replyOK.onClick);
			return;
			formSubmit();

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
</script>
</head>
<body>
<html:form action="extMylcSurvey.act?task=insert">
<input type="hidden" name="coursecode" value="${coursecode }">
<input type="hidden" name="surveyno" value="${rsExtMylc_Survey.surveyno }">
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
                          	<c:if test="${itemList.replytype eq '6' }">
                          		<tr> 
                                <td><img src='<html:rewrite page="/images/poll/view_t_bg2_top.gif"/>' width="617" height="5"></td>
                              </tr>
                              <tr> 
                                <td class="pTitle2">${itemList.reqseq }.${itemList.itemcontents }</td>
                              </tr>
                              <tr> 
                                <td height="8" valign="top"><img src='<html:rewrite page="/images/poll/view_t_bg2_bottom.gif"/>' width="617" height="5"></td>
                              </tr>                          	
                          	</c:if>
                          	<c:if test="${itemList.replytype ne '6' }">
                          		<tr> 
                                <td><img src='<html:rewrite page="/images/poll/view_t_bg2_top.gif"/>' width="617" height="5"></td>
                              </tr>
                              <tr> 
                                <td class="pTitle2">${itemList.reqseq }.${itemList.itemcontents }</td>
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
							                          	<c:if test="${itemList.replytype eq 1}">
								                          	<tr> 
								                          		<td width="45" class="pR"> 
							                                  <input type="radio" name="reply_array${idx.count }" value="${examList.examseq}">
							                                </td>
							                                <td class="pt2Left">${examList.examcontents}</td>
							                            	</tr>
							                            	<tr> 
				                                  		<td class="poL" colspan="2"></td>
				                                		</tr>
							                          	</c:if>   
							                          	<c:set var="examcnt" value="${eidx.count}"/>	                      	
							                          </c:forEach>
							                          <c:if test="${itemList.etcflag eq 'Y' }">
								                          <tr>
								                         		<td width="45" class="pR"> 
								                              <input type="radio" name="reply_array${idx.count}" value="${examcnt+1}">
								                            </td>
							                            	<td class="pt2Left">기타&nbsp;<input type="text" name="other${idx.count }" class="style6" style="width:500;"></td>				                            
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
							                          	<c:if test="${itemList.replytype eq '2'}">
							                          		<tr>
								                          		<td width="45" class="pR"> 
							                                  <input type="checkbox" name="reply_array${idx.count}${eidx.count}" value="${examList.examseq}">
							                                </td>
							                                <td class="pt2Left">${examList.examcontents}</td>
							                            	</tr>
							                            	<tr> 
				                                  		<td class="poL" colspan="2"></td>
				                                		</tr>			                            	
							                          	</c:if>
							                          	<c:set var="examcnt" value="${eidx.count}"/>	                          	
							                          </c:forEach>                          	
							                          <c:if test="${itemList.etcflag eq 'Y' }">
								                          <tr>
								                         		<td width="45" class="pR"> 
								                              <input type="checkbox" name="reply_array${idx.count}${examcnt+1}"" value="${examcnt+1 }">
								                            </td>
							                            	<td class="pt2Left">기타&nbsp;<input type="text" name="other${idx.count }" class="style6" style="width:500;"></td>				                            
								                          </tr>
							                          </c:if>
					                              <input type="hidden" name="examcnt${idx.count }" value="${examcnt}">
					                           	</table>
							                      </td>	
							                  	</tr>
	                          		</c:when>
		                          	<c:when test="${itemList.replytype == 5}">
		                          		<tr>
																		<td> 
				                              <table width="560" border="0" cellspacing="0" cellpadding="0" align="center" height="35">
				                                <tr> 					                          		
																					<td width="15"> 
				                                    <input type="radio" name="reply_array${idx.count}" value="1">
				                                  </td>
				                                  <td class="pt2Left" width="65">매우만족</td>
				                                  <td width="15"> 
				                                    <input type="radio" name="reply_array${idx.count}" value="2">
				                                  </td>
				                                  <td class="pt2Left" width="65">만족</td>
				                                  <td width="15"> 
				                                    <input type="radio" name="reply_array${idx.count}" value="3">
				                                  </td>
				                                  <td class="pt2Left" width="65">보통</td>
				                                  <td width="15"> 
				                                    <input type="radio" name="reply_array${idx.count}" value="4">
				                                  </td>
				                                  <td class="pt2Left" width="65">불만</td>
				                                  <td width="15"> 
				                                    <input type="radio" name="reply_array${idx.count}" value="5">
				                                  </td>
				                                  <td class="pt2Left">매우불만족</td>
				                                </tr>
				                                <input type="hidden" name="examcnt${idx.count }" value="5">	  
				                          		</table>
				                        		</td>
				                       		</tr>
			                        	</c:when>
		                          	<c:when test="${itemList.replytype == 6}">
		                          		<c:forEach var="teacherList" items="${itemList.teacherlist}" varStatus="tidx">
			                          		<tr> 
			                                <td><img src='<html:rewrite page="/images/poll/view_t_bg2_top.gif"/>' width="617" height="5"></td>
			                              </tr>
			                              <tr> 
			                                <td class="pTitle2">${itemList.reqseq }-${tidx.count}.${teacherList.subjname} (${teacherList.profname })</td>
			                              </tr>
			                              <tr> 
			                                <td height="8" valign="top"><img src='<html:rewrite page="/images/poll/view_t_bg2_bottom.gif"/>' width="617" height="5"></td>
			                              </tr> 		                          		
					                          <tr> 
					                            <td> 
					                              <table width="560" border="0" cellspacing="0" cellpadding="0" align="center" height="35">
					                                <tr> 
					                                  <td width="15"> 
					                                    <input type="radio" name="reply_array${idx.count }${tidx.count}" value="1">
					                                  </td>
					                                  <td class="pt2Left" width="65">매우만족</td>
					                                  <td width="15"> 
					                                    <input type="radio" name="reply_array${idx.count }${tidx.count}" value="2">
					                                  </td>
					                                  <td class="pt2Left" width="65">만족</td>
					                                  <td width="15"> 
					                                    <input type="radio" name="reply_array${idx.count }${tidx.count}" value="3">
					                                  </td>
					                                  <td class="pt2Left" width="65">보통</td>
					                                  <td width="15"> 
					                                    <input type="radio" name="reply_array${idx.count }${tidx.count}" value="4">
					                                  </td>
					                                  <td class="pt2Left" width="65">불만</td>
					                                  <td width="15"> 
					                                    <input type="radio" name="reply_array${idx.count }${tidx.count}" value="5">
					                                  </td>
					                                  <td class="pt2Left">매우불만족</td>
					                                </tr>
					                                <input type="hidden" name="examcnt${idx.count}${tidx.count}" value="5">
					                                <input type="hidden" name="subjseq${idx.count}${tidx.count}" value="${teacherList.subjseq }">	
					                                <input type="hidden" name="profno${idx.count}${tidx.count}" value="${teacherList.profno }">	
					                              </table>
					                            </td>
					                         	</tr>
					                         	<c:set var="teachercnt" value="${tidx.count}"/>
		                          		</c:forEach>  
		                          		<input type="hidden" name="teachercnt${idx.count }" value="${teachercnt }">                       		
		                          	</c:when>
		                          	<c:when test="${itemList.replytype == 3}">
		                          	<tr>
			                            <td> 
			                              <input type="text" name="reply_array${idx.count}" style="width:99%;">
			                            </td>
			                          </tr> 		                          	
		                          	</c:when>
		                          	<c:otherwise>
		                          	<tr>
			                            <td> 
			                              <textarea name="reply_array${idx.count}" style="width:99%;" rows="3"></textarea>
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
	                                  	${loti:convertHtmlBrNbsp(rsTst_SurveyPreview.tailtext) }
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
	                            <td class="pt2">설문 작성하기&lt;<html:select property="jobcode"><html:optionsCollection name="jobCode" property="beanCollection" />
   															</html:select>
	                            </td>
	                            <td class="pt1" width="89">직급</td>
	                            <td class="pt2"> 
	                            	<select name="gradecode" style="width:80px;">
                                	<option value="4" selected>4급</option>
                                	<option value="5" >5급</option>
                                	<option value="6" >6급</option>
                                	<option value="7" >7급</option>
                                	<option value="8" >8급</option>
                                	<option value="9" >9급</option>
                                	<option value="기능">기능</option>
                              	</select>
	                            </td>
	                          </tr>
	                          <tr>
	                            <td class="pt1" width="89">성별</td>
	                            <td class="pt2"> 
	                              <input type="radio" name="gender" value="0" checked>남성 
	                              <input type="radio" name="gender" value="1">여성
	                            </td>
	                            <td class="pt1" width="89">총근무년수</td>
	                            <td class="pt2"> 
	                              <input type="text" name="workday" style="width:60px;">년
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
	                            <td align="right"><img id="replyOK" src='<html:rewrite page="/images/board/btn_okpoll.gif"/>' alt="답변 등록" style="cursor:hand" onclick="save(document.forms[0])"></td>
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
