<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<script type="text/javascript" src='<html:rewrite page="/common/js/prototype.js"/>'></script>
<script language="JavaScript">
// 추가 버튼 실행시
function addUser()
{
	var doc = document;
	var docForm = doc.forms[0];
	var rstTable = doc.getElementById("addList");
	var rstTBodies = rstTable.tBodies[0];
	
	var frmDoc = searchFrame.document;
	var frmDocForm = frmDoc.getElementById("searchForm");
	var schTable = frmDoc.getElementById("searchList");
	var schTBodies = schTable.tBodies[0];
	var schRows = schTBodies.rows;

	if(schRows.length >0)
	{
		//단일  
		if (typeof(frmDocForm.elements['chkuser'].length) == 'undefined') 
	 	{  
	   	if (frmDocForm.elements['chkuser'].checked==true)   
	     {  	 
	     	if(typeof(rstTBodies) == 'undefined' || rstTBodies == null)
				{
						var tbodyElement = document.createElement("tbody");
						rstTable.insertAdjacentElement("beforeEnd",tbodyElement);
						rstTBodies = rstTable.tBodies[0];
				}
				      
				if(!existaddChk(frmDocForm.elements['chkuser'].value))
				{
					rstTBodies.insertAdjacentElement("beforeEnd", schRows[0].cloneNode(true));
				}
	     	
	   	}  
		} 
		else 
		{ 
			for (i=0; i<frmDocForm.elements['chkuser'].length; i++)   
			{
				if (frmDocForm.elements['chkuser'][i].checked==true)  
				{
					if(typeof(rstTable.tBodies[0]) == 'undefined' || rstTable.tBodies[0]==null)
					{
						 var tbodyElement = document.createElement("tbody");
						 rstTable.insertAdjacentElement("beforeEnd",tbodyElement);
						 rstTBodies  = rstTable.tBodies[0];
					}
					
					if(!existaddChk(frmDocForm.elements['chkuser'][i].value)){
						rstTBodies.insertAdjacentElement("beforeEnd", schRows[i].cloneNode(true));
					}
				} 
			}
		}
	}
	/*
	//단일  
	if (typeof(frmDocForm.elements['chkuser'].length) == 'undefined') 
 	{  
   	if (frmDocForm.elements['chkuser'].checked==true)   
     {  	 
     	if(typeof(rstTBodies) == 'undefined')
			{
					var tbodyElement = document.createElement("tbody");
					rstTable.insertAdjacentElement("beforeEnd",tbodyElement);
					rstTable.tBodies[0];
			}      
     	rstTBodies.insertAdjacentElement("beforeEnd", schRows[0].cloneNode(true));
   	}  
	} 
	else 
	{ 
		for (i=0; i<frmDocForm.elements['chkuser'].length; i++)   
     {  
			if (frmDocForm.elements['chkuser'][i].checked==true)  
			{ 
				if(typeof(rstTable.tBodies[0]) == 'undefined' || rstTable.tBodies[0]==null)
				{
					 var tbodyElement = document.createElement("tbody");
					 rstTable.insertAdjacentElement("beforeEnd",tbodyElement);
					 rstTBodies  = rstTable.tBodies[0];
				}
				rstTBodies.insertAdjacentElement("beforeEnd", schRows[i].cloneNode(true));
			}  
		}  
	}  
	*/
}	

//오른쪽/왼쪽 비교
function existaddChk(searchchkuser){
	var doc = document;
	var docForm = doc.forms[0];
	var rstTable = doc.getElementById("addList");
	var rstTBodies = rstTable.tBodies[0];
	var delRows = rstTBodies.rows;
		
	var frmDoc = searchFrame.document;
	var frmDocForm = frmDoc.getElementById("searchForm");
	
	//단일
	if (typeof(docForm.elements['chkuser']) == 'undefined')   
 	{  
 		return false;
	}else{
 		if (typeof(docForm.elements['chkuser'].length) == 'undefined')
 		{   
 				if(docForm.elements['chkuser'].value == searchchkuser) return true;
 				else return false;
 		}
 		
 		for (j=0; j<docForm.elements['chkuser'].length; j++)   
		{
   		if(docForm.elements['chkuser'][j].value == searchchkuser) return true;
		}
	}
}

//삭제버튼실행시
function delUser()
{
	var doc = document;
	var docForm = doc.forms[0];
	var rstTable = doc.getElementById("addList");
	var rstTBodies = rstTable.tBodies[0];
	var delRows = rstTBodies.rows;
	
	if(delRows.length>0)
	{
		var len = docForm.elements['chkuser'].length;
		//단일
		if (typeof(docForm.elements['chkuser'].length) == 'undefined')   
	 	{  
	   	if (docForm.elements['chkuser'].checked==true)   
	     {  
	     	rstTBodies.rows[0].parentNode.removeChild(rstTBodies.rows[0]);
	   	}  
		} 
		else 
		{ 
			try
			{
					for (var i = (len - 1) ; i > -1 ; i--){
						if (docForm.elements['chkuser'][i].checked == true){
							rstTBodies.rows[i].parentNode.removeChild(rstTBodies.rows[i]);
						}
					} 
			}
			catch(Exception)
			{
				alert("선택할 내용이 없습니다.");
			}
		}
	}
	/*
	//단일
	if (typeof(docForm.elements['chkuser'].length) == 'undefined')   
 	{  
   	if (docForm.elements['chkuser'].checked==true)   
     {  
     	rstTBodies.rows[0].parentNode.removeChild(rstTBodies.rows[0]);
   	}  
	} 
	else 
	{ 
		try
		{
			for (i=0; i<docForm.elements['chkuser'].length; i++)   
      {  
				
				if (docForm.elements['chkuser'][i].checked==true)  
				{  
					rstTBodies.rows[i].parentNode.removeChild(rstTBodies.rows[i]);
					//docForm.elements['chkuser'][i].removeNode(true);
					
				}  
			}  
		}
		catch(Exception)
		{
			alert("선택할 내용이 없습니다.");
		}
	} 
	*/

}
	
	function setProf(row)
	{
		var doc = document;
		var docForm = doc.forms[0];
		var profname = "";
		var profnoarray = "";
		var profassign = "";
		var proflevel = "";
		var count =0;
		if(docForm.elements['profnoarray'] != null)
		{
			if (typeof(docForm.elements['profnoarray'].length) == 'undefined') 
			{ 
				profname = docForm.profnamearray.value;
				profnoarray = docForm.profnoarray.value;
				profassign = docForm.profassignarray.value;
				proflevel = docForm.proflevelarray.value;
			}
			else
			{
				for(i=0; i<docForm.elements['profnoarray'].length; i++)
				{
				  if(i ==0)
				  {
				  	profname = docForm.profnamearray[i].value;
				  	profnoarray = docForm.profnoarray[i].value;
				  	profassign = docForm.profassignarray[i].value;
				  	proflevel = docForm.proflevelarray[i].value;
				  }
				  else
				  {
				    profnoarray = profnoarray + ',' + docForm.profnoarray[i].value;
				    count = count +1;
				  }
				}
				
				if(count>0){
					profname = profname+'외'+count
				}
			}
		}
		opener.document.all.profName[row].value = profname;
		opener.document.all.profnoarray[row].value = profnoarray;
		opener.document.all.profAssign[row].value = profassign;
		opener.document.all.profLevel[row].value = proflevel;
		self.close();
	}
	
	function formSubmit()
	{
		var frm = document.forms[0];
		frm.submit();		
	}
	
	function formSubmit1()
	{
		var frm = document.forms[0];
		var url = frm.action;
    var pars = Form.serialize(frm);

		new Ajax.Updater(
						 '',
                           url,
                            {
                              method: 'post',
                              parameters: pars,
                              evalScripts: true,
                              onComplete: saveComp,
                              onFailure: reportError
                              });

		//frm.submit();
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

 	//
	function reportError(e)
	{
		alert(e);
	}	
	
</script>
<title>강사지정</title>
<link rel="stylesheet" href='<html:rewrite page="/style/main.css"/>' type="text/css" />
</head>
<body>
<table width="760" border="0" cellspacing="5" cellpadding="0" height="490" bgcolor="#E7E7E7">
	<tr> 
		<td valign="top"> 
			<table width="750" border="0" cellspacing="1" cellpadding="0" height="480" bgcolor="#D1D1D1">
				<tr> 
					<td bgcolor="#FFFFFF" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/edu/title_05-5.gif"/>' width="87" height="42" alt="강사지정" /></td>
              </tr>
              <tr><td height="10"></td></tr>
              <tr> 
                <td> 
                  <table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr> 
                      <td colspan="3"> 
                        <!--강의정보 테이블 시작-->
                        <table width="720" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8" align="center">
                        	<fmt:parseDate var="disFrom" value="${rsCmn_PopupProf.edufrom}" pattern="yyyymmdd"></fmt:parseDate>
													<fmt:parseDate var="disTo" value="${rsCmn_PopupProf.eduto}" pattern="yyyymmdd"></fmt:parseDate>
                          <tr> 
                            <td class="pt4" width="98">일 자</td>
                            <td class="pt2Left">ㆍ<fmt:formatDate value="${disFrom}" pattern="yyyy.mm.dd"/> ~ <fmt:formatDate value="${disTo}" pattern="yyyy.mm.dd"/></td>
                          </tr>
                          <tr> 
                            <td class="pt4" width="98">과 정</td>
                            <td class="pt2Left">ㆍ${rsCmn_PopupProf.courseName}</td>
                          </tr>
                        </table>
                        <!--강의정보 테이블 끝-->
                      </td>
                    </tr>
                    <tr><td colspan="3" height="10px;"></td></tr>
                    <tr> 
                      <td height="330" valign="top" width="335"> 
                        <table width="335" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="25" class="p1">&nbsp; </td>
                          </tr>
                          <tr> 
                            <td> 
                            	<iframe frameborder="0" id="searchFrame" name="searchFrame" width="335" height="285" src='<html:rewrite page="/cmnProf.act?task=frame"/>' scrolling="no"></iframe>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td height="330" width="57"> 
                        <!--추가/삭제 버튼-->
                        <table width="46" border="0" cellspacing="0" cellpadding="0" align="center">
                          <tr> 
                            <td height="30"><input type="image" src='<html:rewrite page="/images/board/btn_s_add2.gif"/>' width="46" height="25" alt="추가" onClick="addUser();" /></td>
                          </tr>
                          <tr> 
                            <td><input type="image" src='<html:rewrite page="/images/board/btn_s_del2.gif"/>'  width="46" height="25" alt="삭제" onClick="delUser();"/></td>
                          </tr>
                        </table>
                      </td>
                      <td height="330" valign="top" width="320"> 
                        <table width="320" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="25" class="p1"><img src='<html:rewrite page="/images/board/dot_02.gif"/>' width="17" height="3" align="absmiddle" alt="" />지정된 강사</td>
                          </tr>
                          <tr> 
                            <td> 
                              <table width="320" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="5" height="5"><img src='<html:rewrite page="/images/board/round_01.gif"/>' width="5" height="5" alt="" /></td>
                                  <td bgcolor="#F3F3F3" height="5" width="190"></td>
                                  <td width="5" height="5"><img src='<html:rewrite page="/images/board/round_02.gif"/>' width="5" height="5" alt="" /></td>
                                </tr>
                                <tr> 
                                  <td bgcolor="#F3F3F3" width="5"></td>
                                  <td bgcolor="#F3F3F3" width="190" height="275" valign="top"> 
                                    <table width="320" border="0" cellspacing="0" cellpadding="0" align="center">
                                      <tr><td height="10"></td></tr>
                                      <tr> 
                                        <td height="200" valign="top"> 
                                          <!--지정된강사 리스트 시작-->
                                          <div id="Layer1" style="position:absolute; width:320px; height:260px; z-index:1;overflow-y:scroll ;overflow-x:hidden">
	                                          <!--지정된강사 헤더 시작-->
	                                          <table width="303" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
	                                            <tr> 
																				          <td class="pt1" width="30">선택</td>
																				          <td class="pt1" width="60">이름</td>
																				          <td class="pt1">소속</td>
																				          <td class="pt1" width="55">생년월일</td>
																				          <!-- 
																				          <td class="pt1" width="77">직책</td>	
																				          -->																		          
	                                            </tr>
	                                          </table>
                                          	<!--지정된강사 헤더 끝-->                                          
                                            <html:form action='cmnProf.act?task=insert'>
                                            	<html:hidden property="courseCode" value="${rsCmn_PopupProf.courseCode}"/>	
                                            	<html:hidden property="lectdate" value="${rsCmn_PopupProf.lectdate}"/>
                                            	<html:hidden property="timeseq" value="${rsCmn_PopupProf.timeseq}"/> 	
	                                            <table id="addList" width="303" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
	                                            <c:forEach var="lectProfList" items="${rsCmn_PopupProfList}" varStatus="i">
	                                              <tr> 
	                                                <td class="pt2" width="30"> 
	                                                  <input type="checkbox" id="chkuser" name="chkuser" value="${lectProfList.profno}">
	                                                </td>
	                                                <td class="pt2" width="60">${lectProfList.profname }
	                                                 	<input type="hidden" name="profnamearray" value="${lectProfList.profname}">
	                                                	<input type="hidden" name="profnoarray" value="${lectProfList.profno }">
	                                                	<input type="hidden" name="profassignarray" value="${lectProfList.profassign }">
	                                                	<input type="hidden" name="profbirtharray" value="${lectProfList.birth }">
	                                                	<input type="hidden" name="proflevelarray" value="${lectProfList.proflevel}">
	                                                </td>
																			            <td class="pt2Left">&nbsp;${lectProfList.profassign }</td>
																			            <td class="pt2Left" width="55">&nbsp;${lectProfList.birth }</td>
																			            <!-- 
																			            <td class="pt2" width="60">&nbsp;</td>
																			             -->	                                                
	                                              </tr>
	                                              <c:set var="count" value="${i.count}"/>
																							</c:forEach>				                                              
	                                            </table>
                                            </html:form>
                                          </div>
                                          <!--지정된강사 리스트 끝-->
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                  <td bgcolor="#F3F3F3" width="5"></td>
                                </tr>
                                <tr> 
                                  <td width="5" height="5"><img src='<html:rewrite page="/images/board/round_03.gif"/>' width="5" height="5" alt="" /></td>
                                  <td bgcolor="#F3F3F3" height="5" width="190"></td>
                                  <td width="5" height="5"><img src='<html:rewrite page="/images/board/round_04.gif"/>' width="5" height="5" alt="" /></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="3"> 
                        <!--하단 버튼 시작-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="28">
                          <tr> 
                            <td align="right">
                            	<c:if test="${rowidx != null}">
                            		<input type="image" src='<html:rewrite page="/images/board/btn_ok.gif"/>' width="57" height="25" align="absmiddle" alt="확인" onclick="setProf('${rowidx}')">
                            	</c:if>
                            	<c:if test="${rowidx == null}">
                            		<input type="image" src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" align="absmiddle" alt="저장" onclick="formSubmit()">
                            	</c:if> 
                              <input type="image" src='<html:rewrite page="/images/board/btn_close.gif"/>' width="57" height="25" align="absmiddle" alt="닫기" onclick="window.close()"></td>
                          </tr>
                        </table>
	                     	<!--하단 버튼 끝-->
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
</body>
</html>
