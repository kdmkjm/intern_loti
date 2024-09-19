<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
	<!--

	function formSubmit()
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
			}
		}
	}

 	//
	function reportError(e)
	{
		alert(e);
	}
	-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
  </tr>
  <tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/system/title_14.gif"/>' alt="조직도 정보가져오기" width="163" height="18" /></td>
				</tr>
				<tr>
				  <td height="15"></td>
				</tr>
        <tr>
          <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
			           	<!--	게시물 아래 버튼 시작	-->
			           	<html:form method="POST" action="/sysOrg.act?task=sync_start" onsubmit="return false">  
									<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
						      	<tr valign="bottom">	      	
					          	<td align="center">
												<input type="image" src='<html:rewrite page="/images/board/btn_save.gif"/>' alt="저장" onclick="formSubmit()" style="cursor:hand">
											</td>
										</tr>
									</table>
									</html:form>
          			</td>
              </tr>
          	</table>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>       
      </table>
    </td>
  </tr>
</table>             