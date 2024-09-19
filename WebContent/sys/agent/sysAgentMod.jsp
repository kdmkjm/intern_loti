<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script type="text/javascript">
<!--
//라디오체크값에 따라 달라지는 UI
function showLayer(val){ 
	//일별
	if (val=="00001"){
		document.all.layer_t1.style.display = ""
		document.all.layer_t2.style.display = "none"
		document.all.layer_t3.style.display = "none"
		document.all.layer_t4.style.display = "none"
		document.all.layer_t2.style.disabled = true
		document.all.layer_t3.style.disabled = true
		document.all.layer_t4.style.disabled = true
		if(!document.forms[0].p_type[0].checked){
			document.forms[0].p_type[0].checked  = true;
		}
	
	//주간별
	}else if (val=="00002"){
		document.all.layer_t1.style.display = "none"
		document.all.layer_t2.style.display = ""
		document.all.layer_t3.style.display = "none"
		document.all.layer_t4.style.display = "none"
		document.all.layer_t1.style.disabled = true
		document.all.layer_t3.style.disabled = true
		document.all.layer_t4.style.disabled = true
		if(!document.forms[0].p_type[1].checked){
			document.forms[0].p_type[1].checked  = true;
		}
	
	//월별
	}else if (val=="00003"){
		document.all.layer_t1.style.display = "none"
		document.all.layer_t2.style.display = "none"
		document.all.layer_t3.style.display = ""
		document.all.layer_t4.style.display = "none"
		document.all.layer_t1.style.disabled = true
		document.all.layer_t2.style.disabled = true
		document.all.layer_t4.style.disabled = true
		if(!document.forms[0].p_type[2].checked){
			document.forms[0].p_type[2].checked  = true;
		}
	
	//연도별
	}else if (val=="00004"){
		document.all.layer_t1.style.display = "none"
		document.all.layer_t2.style.display = "none"
		document.all.layer_t3.style.display = "none"
		document.all.layer_t4.style.display = ""
		document.all.layer_t1.style.disabled = true
		document.all.layer_t2.style.disabled = true
		document.all.layer_t3.style.disabled = true
		if(!document.forms[0].p_type[3].checked){
			document.forms[0].p_type[3].checked  = true;
		}
	}
}
//저장버튼 클릭
function getSaveSubmit(frm){
	var radioVal=false;
		for(var i=0;i<frm.p_type.length; i++){ 
			 if (frm.p_type[i].checked == true){ 
				 radioVal = true; 
				 break; 
			 } 
		} 
		
		if (!radioVal){
			alert("스케줄타입을 선택하여 주십시오.");
			return false;
		}
		frm.target="mgr";
		frm.submit();
		self.close();
}
//-->
</script>
<title>Agent Runtime 등록</title>
<body onload="showLayer('${txType}');">
<html:form method="post" action="/sysAgent.act?task=${txMode}">
<html:hidden property="p_id" />
<html:hidden property="p_seq" />
<table width="500" border="0" cellspacing="5" cellpadding="0" height="220" bgcolor="#E7E7E7">
  <tr> 
    <td valign="top"> 
      <table width="490" border="0" cellspacing="1" height="210" cellpadding="0" bgcolor="#D1D1D1">
        <tr> 
          <td bgcolor="#FFFFFF" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/system/title_06-2.gif"/>' width="150" height="42" alt="Agent Runtime 등록" /></td>
              </tr>
              <tr> <td height="10"></td></tr>
              <tr height="120" valign="top" align="center"> 
                <td>
									<table width="450" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr bgcolor="CECECE">
											<td colspan="3" height="1"></td>
										</tr>
										<tr>
											<td width="120" height="26" bgcolor="F6F6F6" ><div align="center"><strong>프로그램명</strong></div></td>
											<td width="1" bgcolor="CECECE"></td>
											<td align="left">&nbsp;<html:text property="p_nm" style="width:250px;"></html:text></td>
										</tr>
										<tr bgcolor="CECECE"><td height="1" colspan="3"></td></tr>
										<tr>
											<td height="26" align="center" bgcolor="F6F6F6"><strong>스케줄타입</strong></td>
											<td bgcolor="CECECE"></td>
											<td align="left">&nbsp;
												<html:radio property="p_type" value="00001" styleClass="input2" onclick="showLayer(this.value);">매일</html:radio>&nbsp;&nbsp;&nbsp;
												<html:radio property="p_type" value="00002" styleClass="input2" onclick="showLayer(this.value);">매주</html:radio>&nbsp;&nbsp;&nbsp;
												<html:radio property="p_type" value="00003" styleClass="input2" onclick="showLayer(this.value);">매월</html:radio>&nbsp;&nbsp;&nbsp;
												<html:radio property="p_type" value="00004" styleClass="input2" onclick="showLayer(this.value);">매년</html:radio>&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
										<tr bgcolor="CECECE"><td height="1" colspan="3"></td></tr>
										<tr id="layer_t1" style="display:none">
											<td height="26" align="center" bgcolor="F6F6F6"><strong>매일</strong></td>
											<td bgcolor="CECECE"></td>
											<td align="left">&nbsp;
												<html:select property="p_t1_1" >
			    								<html:optionsCollection name="pT1_1" property="beanCollection" />
			    			 				</html:select>&nbsp;
												<html:select property="p_t1_2" >
			    								<html:optionsCollection name="pT1_2" property="beanCollection" />
			    			 				</html:select>
			    			 			</td>
										</tr>
										<tr id="layer_t2" style="display:none">
											<td height="26" bgcolor="F6F6F6" align="center"><strong>일시(주)</strong></td>
											<td bgcolor="CECECE"></td>
											<td align="left">&nbsp;
												<html:select property="p_t2_1" >
			    								<html:optionsCollection name="pT2_1" property="beanCollection" />
			    			 				</html:select>&nbsp;
												<html:select property="p_t2_2" >
			    								<html:optionsCollection name="pT1_1" property="beanCollection" />
			    			 				</html:select>&nbsp;
												<html:select property="p_t2_3" >
			    								<html:optionsCollection name="pT1_2" property="beanCollection" />
			    			 				</html:select>
			    			 			</td>
										</tr>
										<tr id="layer_t3" style="display:none">
											<td height="26" bgcolor="F6F6F6" align="center"><strong>일시(월)</strong></td>
											<td bgcolor="CECECE"></td>
											<td align="left">&nbsp;
												<html:select property="p_t3_1" >
			    								<html:optionsCollection name="pT3_1" property="beanCollection" />
			    			 				</html:select>일&nbsp;
												<html:select property="p_t3_2" >
			    								<html:optionsCollection name="pT1_1" property="beanCollection" />
			    			 				</html:select>&nbsp;
												<html:select property="p_t3_3" >
			    								<html:optionsCollection name="pT1_2" property="beanCollection" />
			    			 				</html:select>
			    			 			</td>
										</tr>
										<tr id="layer_t4" style="display:none">
											<td height="26" bgcolor="F6F6F6" align="center"><strong>일시(년)</strong></td>
											<td bgcolor="CECECE"></td>
											<td align="left">&nbsp;
												<html:select property="p_t4_1" >
			    								<html:optionsCollection name="pT4_1" property="beanCollection" />
			    			 				</html:select>월&nbsp;
												<html:select property="p_t4_2" >
			    								<html:optionsCollection name="pT3_1" property="beanCollection" />
			    			 				</html:select>일&nbsp;
												<html:select property="p_t4_3" >
			    								<html:optionsCollection name="pT1_1" property="beanCollection" />
			    			 				</html:select>&nbsp;
												<html:select property="p_t4_4" >
			    								<html:optionsCollection name="pT1_2" property="beanCollection" />
			    			 				</html:select>
			    			 			</td>
										</tr>
										<tr bgcolor="CECECE"><td height="1" colspan="3"></td></tr>
										<tr>
											<td height="26" align="center" bgcolor="F6F6F6"><strong>상태</strong></td>
											<td bgcolor="CECECE"></td>
											<td align="left">&nbsp;
												<html:select property="p_use" >
			    								<html:optionsCollection name="pUser" property="beanCollection" />
			    			 				</html:select>
			    			 			</td>
										</tr>
										<tr bgcolor="CECECE"><td height="1" colspan="3"></td></tr>
									</table>
                </td>
              </tr>
              <tr>
              	<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0" height="20" valign="ceneter">
									  <tr> 
									    <td align="center">
									      <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="저장" style="cursor:hand" onclick="getSaveSubmit(document.forms[0]);"/>
									      <img src='<html:rewrite page="/images/board/btn_close.gif"/>' align="absmiddle" alt="닫기" style="cursor:hand" onclick="window.close();"/>
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
</html:form>