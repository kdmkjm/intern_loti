<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script language="JavaScript">
<!--
window.onresize = function(){
//   윈도우 사이즈 변경 셋팅 코드
tresize(200);
}

//조직도 정보 가져오기 버튼 클릭
function formSubmit1()
{
	document.forms[0].action = 'sysOrg.act?task=sync_start';		
	document.forms[0].submit();
	/*
	var frm = document.forms[0];
	var url = "sysOrg.act?task=sync_start";
  var pars = Form.serialize(frm);

	new Ajax.Updater(
					 '',
                          url,
                           {
                             method: 'post',
                             parameters: pars,
                             evalScripts: true,
                             onComplete: saveComp1,
                             onFailure: reportError1
                             });
*/
	//frm.submit();
}

// 저장완료
function saveComp1(resXML)
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
		}
	}
}

function reportError1(e)
{
	alert(e);
}

//저장 버튼 클릭
function formSubmit2()
{
	var frm = document.forms[1];
	var url = frm.action;
  var pars = Form.serialize(frm);

	new Ajax.Updater(
					 '',
                          url,
                           {
                             method: 'post',
                             parameters: pars,
                             evalScripts: true,
                             onComplete: saveComp2,
                             onFailure: reportError2
                             });

	//frm.submit();
}

// 저장완료
function saveComp2(resXML)
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
		}
	}
}

function reportError2(e)
{
	alert(e);
}

function searchList(key)
{
	if(key=="move")
	{
		document.forms[0].submit();
	}
}

function check_usefl(obj, seq, val){
 var cname = "deptgubnarry["+seq+"]";
  if(!val.checked)
  {
		for(var i=0;i<obj.getElementsByName(cname).length;i++)
		{
			if(obj.getElementsByName(cname)[i].checked)
			{
				obj.getElementsByName(cname)[i].id = "temp";
				obj.getElementsByName(cname)[i].checked = false;
				obj.getElementsByName(cname)[i].id = "";
			}		
		}
	}	
}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="조직도 조회" src="/images/system/title_15.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td>
        <table width="350" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <html:form action='sysOrg.act?task=list'>
 			  <!--검색 테이블 시작-->
              <table width="350" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
              <tr>
                <td bgcolor="#FFFFFF">
			      <table width="348" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td bgcolor="#E6E6E6" width="1"></td>
                    <td width="74" class="s1">기관</td>
                    <td bgcolor="#E6E6E6" width="1"></td>
                    <td class="s2">
			          <html:select property="selorgancode">
			    		<html:optionsCollection name="orgTypeCode" property="beanCollection" />
			    	  </html:select>
			    	</td>
			    	<!-- 
			    	<td class="s2">       	
				      <input type="checkbox" name="usedisplay" value="1"/> 사용부서만 표시<br> 
					</td>
					-->		
			        <td width="60" align="center"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="검색" /></td>
                  </tr>
                  </table>
            	</td>
              </tr>
              </table>
              <!--검색 테이블 끝-->
			</html:form>
          </td>
        </tr>
        <tr><td height="15"></td></tr>
        <tr>
          <td>
            <table width="350" border="0" cellspacing="0" cellpadding="0">
            <tr><td class="tbg2"></td></tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>              
            <!--테이블 헤더 시작-->
            <table width="350" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td class="lbg"></td>
              <td class="cbg">
                <table width="346" border="0" cellspacing="0" cellpadding="0" height="100%">
				<tr> 
				  <td class="t1">부서명칭</td>
				  <td class="sBg"></td>
				  <!-- 
				  <td class="t1" width="45">실국</td>
				  <td class="sBg"></td>
				  <td class="t1" width="45">부서</td>
				  <td class="sBg"></td>
				  <td class="t1" width="45">동</td>
				  <td class="sBg"></td>
				  <td width="60" class="t1">사용</td>
				  <td width="17" class="t1">&nbsp;</td>
				  -->
				</tr>                        
                </table>
              </td>
              <td class="lbg"></td>
            </tr>
            </table>
            <!--테이블 헤더 끝-->
          </td>
        </tr>
		<tr>
          <td>
            <html:form method="POST" action="/sysOrg.act?task=modify">  
              <table width="350" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="lbg"></td>
                <td>
                  <table width="346" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td valign="top">
                    <!--리스트 시작-->
					  <div id="mainList"  style=" width:346px;overflow-y:scroll ;overflow-x:hidden;">
					    <table id="mainTable" width="329" border="0" cellspacing="0" cellpadding="0">
						<c:forEach var="orgList" items="${rsSysOrgList}" varStatus="i" >
						  <c:set var="blank" value="${orgList.level}"/>
						  <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
						  <c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
						  <tr class="${lineBg}">
							<td class="t3">&nbsp;${loti:fillCh("&nbsp;&nbsp;&nbsp;",(blank-1)*3)}<c:out value="${orgList.simplename}"/></td>
							<td class="sBg"></td>
							<!-- 
							<td class="t2" width="45">
							  <c:if test="${orgList.deptgubn eq 'A'}">
								<input type="radio" name="deptgubnarry[${i.count}]" value='A${orgList.organcode }' checked>
							  </c:if>
							  <c:if test="${orgList.deptgubn ne 'A'}">
								<input type="radio" name="deptgubnarry[${i.count}]" value='A${orgList.organcode }' >
							  </c:if>																				
							</td>
							<td class="sBg"></td>
							<td class="t2" width="45">
							  <c:if test="${orgList.deptgubn eq 'B'}">
								<input type="radio" name="deptgubnarry[${i.count}]" value='B${orgList.organcode }' checked>
							  </c:if>	
							  <c:if test="${orgList.deptgubn ne 'B'}">
								<input type="radio" name="deptgubnarry[${i.count}]" value='B${orgList.organcode }'>
							  </c:if>
							</td>
							<td class="sBg"></td>
							<td class="t2" width="45">
							  <c:if test="${orgList.deptgubn eq 'C'}">
								<input type="radio" name="deptgubnarry[${i.count}]" value='B${orgList.organcode}' checked>
							  </c:if>	
							  <c:if test="${orgList.deptgubn ne 'C'}">
								<input type="radio" name="deptgubnarry[${i.count}]" value='B${orgList.organcode}'>
							  </c:if>																			
							</td>
							<td class="sBg"></td>
							<td class="t2" width="60">
							  <c:if test="${orgList.inuse eq '0'}">        	
								<input type="checkbox" name="inusearry" value="${orgList.organcode}" checked onclick="check_usefl(document,'${i.count}', this);">
							  </c:if>
							  <c:if test="${orgList.inuse ne '0'}">
								<input type="checkbox" name="inusearry" value="${orgList.organcode}" onclick="check_usefl(document,'${i.count}', this);">
							  </c:if>   																			
							</td>
							-->
						  </tr>
						  <tr><td class="lbg3" colspan="99"></td></tr>
						  <input type="hidden" name="organcode" value="${orgList.organcode }">
						  <input type="hidden" name="selorgancode" value="${orgList.selorgancode }">									       		        
						</c:forEach>
						</table>
					  </div>
					  <!--게시물 목록 끝-->
					</td>
                  </tr>
                  </table>
                </td>
                <td class="lbg"></td>
              </tr>
              </table>
            </html:form>
          </td>
        </tr>              
        <tr>
          <td>
            <table width="350" border="0" cellspacing="0" cellpadding="0">
            <tr><td class="tbg2"></td></tr>
            </table>
          </td>
        </tr>            
        </table>
        <!--	게시물 아래 버튼 시작	-->
		<table width="350" border="0" cellspacing="0" cellpadding="0" height="28">
		<tr valign="bottom">	      	
		  <td align="left">
			<input type="image" src='<html:rewrite page="/images/board/btn_import_chart2.gif"/>' alt="조직도 정보 가져오기" onclick="formSubmit1()" align="absmiddle">
		  </td>     	
		  <!-- 
		  <td align="right">
			<input type="image" src='<html:rewrite page="/images/board/btn_save.gif"/>' alt="저장" onclick="formSubmit2()" align="absmiddle">
		  </td>
		  -->
		</tr>
		</table>
      </td>
    </tr>     
    </table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(180);
	searchList('${key}');

//-->
</script>              