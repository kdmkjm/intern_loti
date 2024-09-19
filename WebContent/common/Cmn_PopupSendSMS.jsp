<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SMS 발송</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link rel="stylesheet" href='<html:rewrite page="/style/main.css"/>' type="text/css" />
<script type="text/javascript" src='<html:rewrite page="/common/js/prototype.js"/>'></script>
<script type="text/javascript">

	String.prototype.trim = function()
	{
	 return this.replace(/(^\s*)|(\s*$)/gi, "");
	}

	// replaceAll(A를, B로) 바꾼다.
	String.prototype.replaceAll = function(str1, str2) 
	{
	 var temp_str = "";
	 if (this.trim() != "" && str1 != str2) {
	  temp_str = this.trim();
	  while (temp_str.indexOf(str1) > -1){
	   temp_str = temp_str.replace(str1, str2);
	  }
	 }
	 return temp_str;
	}

	function key_num_minus()	// BackSpace, DEL, TAB, -, 0 .. 9
	{
		if (!
			(event.keyCode == '8' || event.keyCode == '9' || event.keyCode == '46' ||
			 event.keyCode == '109' || event.keyCode == '189' ||		// '-'가 키가 먼지 모름.
	  		 event.keyCode == '39' || event.keyCode == '37' || 
			(event.keyCode >= '48' && event.keyCode <= '57') ||
			(event.keyCode >= '96' && event.keyCode <= '105') )
		   )
		{ event.returnValue = false; }
	}

	///데이터 직접입력을 표현 하기 위한 자바 스크립트 ==================================================================
	var idata_count = 0
	
	function getObj() { 
	   var obj = event.srcElement 
	   while (obj.tagName != 'TD') obj = obj.parentElement 
	   return obj 
	}
	
	function idata_del_row() 
	{ 
   var idx = getObj().parentElement.rowIndex 
   tbl.deleteRow(idx) 
   idata_count--;
   // 순번을 초기화 시켜준다.
   for (var i=1;i <= idata_count ; i++)
   { 
   	tbl.rows(i+1).cells(0).innerHTML = i + "&nbsp;" 
   }
	}

	function add_row()
	{ var ck, cck, len, telobj;
		// 배열이 될때(0)이 되고 처음에는 배열이 안되어 있기때문에 (0)하면 에러남.
		try	{
			ck = document.forms[0].sendtelno[0].value;  cck = document.forms[0].sendtelno[0]; 
		}	catch (Exception) { 
			ck = document.forms[0].sendtelno.value; cck = document.forms[0].sendtelno; 
		}
		// 휴대전화번호의 값이 없으면 insertrow를 하지 않는다.
		if (ck.trim() == "") return;
		ck = ck.replaceAll("-","");
		len = ck.length;

		try {
			if (!check_tel(document.forms[0].sendtelno[0])) return;		//전화번호 오류
		} catch (Exception) {
			if (!check_tel(document.forms[0].sendtelno)) return;		//전화번호 오류
		}	
		if(len==10) { cck.value = ck.substring(0,3)+"-"+ck.substring(3,6)+"-"+ck.substring(6,10); }
		if(len==11) { cck.value = ck.substring(0,3)+"-"+ck.substring(3,7)+"-"+ck.substring(7,11); }

		var idx = getObj().parentElement.rowIndex + 1 + idata_count; //늦게 입력한게 제일하단에 내려가도록 Idx를 구해온다.
		var r = tbl.insertRow(idx);
		idata_count++; // ROW의 갯수를 카운트한다.
	
		for (var i = 0; i < tbl.rows(2).cells.length; i++) {
			// 입력된 Row의 쉘객체를 가져온다.
			var bb = tbl.rows(2).cells(i);
			// Insert된 Row의 쉘객체를 가져온다.
			var c = tbl.rows(idx).insertCell(i);
			// 2번째 쉘을 만들때 삭제버턴을 배치한다.
			if (i == 4) {
				c.width = "45";
				c.className = "pt2";
				c.innerHTML = '<img src="/images/board/btn_del2.gif" width="34" height="18" alt="삭제" align="absmiddle" onclick="idata_del_row()">';
			} else if (i == 0) { // 첫번째 쉘을 만들때 일련번호를 넣는다.
			  c.width = "89";
				c.className = "pt2";
				c.innerHTML = idata_count;
			} else if (i == 2) {
				c.className = "pt2";
				c.innerHTML = tbl.rows(2).cells(i).innerHTML;
			} else	{	
			  c.className = "sBg";
				c.innerHTML = tbl.rows(2).cells(i).innerHTML;
			}
		} 
		// 초기입력된 부분을 초기화 시켜준다.
		// d1,d2,d3,d4,d5가 동적이므로 없는 부분에 대해서 에러가 나지않게 할려고 try를 사용했음.
		try	{ document.forms[0].sendtelno[0].value = '' } catch (Exception) { }
		// 입력부분으로 포커스를 맞추어 준다.
		document.forms[0].sendtelno[0].focus();
		return true;
	}
	
	//발송 방법 선택
	function select_type(type)
	{
		if (type == '01')	//직접입력
		{
			tbl_tr.style.display = "block";
		} else {
			tbl_tr.style.display = "none";
		}
	}
	
	//전화번호 체크(데이터 직접입력일 경우만 사용)
	function check_tel(obj)
	{
		var cellNumber = "";
		cellNumber = obj.value;
		cellNumber = cellNumber.replaceAll("-","");
		
		if(cellNumber == '') {
			return true;
		}

		if (cellNumber.length < 10 || cellNumber.length > 11) {
			alert('올바른 휴대전화번호를 입력하세요!');
			obj.value = "";
			obj.focus();
			return false;
		}
		
		temp = cellNumber.substring(0,3);
		switch (temp) {
			case '011': case '010': case '016': 
			case '017': case '018': case '019':			
			 return true;
			default : 
			 alert('올바른 휴대전화번호를 입력하세요!');
			 obj.value = "";
			 obj.focus();
			 return false;
		}

	}
	
	function getMsgLen(msgtext) 
	{
		var temp="";
		var i=0,l=0;
	
		//길이를 구한다.
		while(i < msgtext.length) {
			temp = msgtext.charAt(i);
			if (escape(temp).length > 4) {
				l+=2;
			}
			else if (temp!='\r') {
				l++;
			}
			i = i +1;		
		}	
		
		return l;	
	}

	//입력 바이트 수 증가(발송화면에서 사용)
	function msg_keyup(obj,imsg_f,msg_proto,maxLen)
	{		
			var msgtext, msglen;
			msgtext = obj.value;
			var i=0,l=0;
			var temp,lastl, alert_msg="", alert_msg1="";
			var alert_fl=false;
			
			//if (msg_proto=="001" && imsg_f != "") {	//sms인데 문안에 첨부파일 있을 경우 alert
			//	alert_msg1="본 업무는 SMS업무이므로 발송시 첨부파일이 첨부되지 않습니다."
			//}
			
			//길이를 구한다.
			while(i < msgtext.length) {
				temp = msgtext.charAt(i);
				if (escape(temp).length > 4) {
					l+=2;
				}
				else if (temp!='\r') {
					l++;
				}
	
				if (temp=='\r' && l>(maxLen-1)) {
					msgtext = msgtext.substr(0,i);
				}
				
				// OverFlow
				if(l>maxLen) {
					alert_msg="입력 가능한 길이를 초과하였습니다.\n메시지는 한글 "+(maxLen/2)+"자, 영문"+maxLen+"자까지만 쓰실 수 있습니다.\n(초과 입력된 메시지는 자동 삭제됩니다.)"
					//if (msg_proto=="001" && imsg_f != "") {
					//	alert(alert_msg+"\n\n"+alert_msg1);
					//} else {
						alert(alert_msg);
					//}
					alert_fl=true
					obj.value = msgtext.substr(0,i);
					l = lastl;
					i = msgtext.length;
					if (obj.name == "msg") {
						msg_keylen.innerText = l;					
						obj.focus();
					}
				}
				
				lastl = l;
				i = i +1;		
			}		
			if (obj.name == "msg") {
				msg_keylen.innerText = l;
			}
		
			//mms->sms 변경시
			if (msg_proto=="001" && imsg_f != "" && alert_fl==false) {
				if (alert_msg!="") alert_msg1="\n\n";
				alert(alert_msg1);
			}
	}	
	
	function formSubmit()
	{
		var frm = document.forms[0];
		var chkcnt = 0;
		var type = "";
		
		for(var j=0; j<frm.elements['type'].length; j++)
		{
			if(frm.type[j].checked == true)
			{
			 	type = frm.type[j].value;
			}
		}
		
		if(type == "02")
		{
			if (typeof(frm.elements['check_array'].length) == 'undefined') 
		 	{  
		   	if (frm.elements['check_array'].checked==true)   
			  {
			  	chkcnt = Number(chkcnt)+1;
			  }
			} 
			else 
			{ 
			  for (i=0; i<frm.elements['check_array'].length; i++)   
		    {  
		    	if(frm.elements['check_array'][i].checked==true)
		    	{
		    		chkcnt = Number(chkcnt)+1;
		    	}
		    }
		  }
	  
		  if(chkcnt ==0)
		  {
		  	alert("발송 대상이 없습니다 확인하여 주기시 바랍니다.");
		  	return false;
		  }
		}
	  
		if(frm.msg.value == ""){
			alert("발송 문자를  입력하여 주시기 바랍니다.");
			frm.msg.focus();
			return false;
			
		}
		frm.task.value = "insert";
		frm.submit();
		
	}

</script>
</head>
<body>
<html:form action="cmnPopupSendSMS.act">
<input type="hidden" name="task" value="">
<input type="hidden" name="popflag" value="${popflag}">
<table width="650" border="0" cellspacing="5" cellpadding="0" height="490" bgcolor="#E7E7E7">
  <tr> 
    <td valign="top"> 
      <table width="640" border="0" cellspacing="1" cellpadding="0" height="480" bgcolor="#D1D1D1">
        <tr> 
          <td bgcolor="#FFFFFF" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/teacher/title_01-2.gif"/>' width="90" height="42" alt="SMS발송" /></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td> 
                  <table width="617" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr> 
                      <td height="25" class="p1" colspan="3"><img src='<html:rewrite page="/images/board/dot_02.gif"/>' width="17" height="3" align="absmiddle" alt="" />발송목록</td>
                    </tr>
                    <tr> 
                      <td height="300" valign="top" width="125"> 
                        <!--발송리스트 시작-->
                        <div id="Layer1" style="position:absolute; width:117px; height:310px; z-index:1; overflow: auto"> 
                          <table width="100" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
	                          <c:forEach var="sendList" items="${rsCmn_PopupSendSMSList }" varStatus="i">
	                          	<input type="hidden" name="juminno_array" value="${sendList.juminno }">
	                          	<input type="hidden" name="cellphone_array" value="${sendList.totel }">
	                          	<input type="hidden" name="username_array" value="${sendList.toname }">
	                          	<tr> 
	                              <td class="pt2" width="30"> 
	                                <input type="checkbox" name="check_array" value="${i.count }" checked="checked">
	                              </td>
	                              <td class="pt2Left">&nbsp;${sendList.toname }</td>
	                            </tr>
	                          </c:forEach>                          
                          </table>
                        </div>
                      </td>
                      <td height="300" width="200" valign="top"> 
                        <table width="175" border="0" cellspacing="0" cellpadding="0" height="311" background='<html:rewrite page="/images/teacher/phone_img.gif"/>'>
                          <tr> 
                            <td valign="top" > 
                              <!--문자입력 테이블 시작-->
                              <table width="147" border="0" cellspacing="0" cellpadding="0" align="center">
                                <tr> 
                                  <td height="70" colspan="3">&nbsp;</td>
                                </tr>
                                <tr> 
                                  <td height="117" class="Message" colspan="3"> 
                                    <textarea name="msg" rows="6" style="width:120px;" onkeyup="msg_keyup(this,'','',80);" ></textarea>
                                  </td>
                                </tr>
                                <tr> 
                                  <td height="28" class="size" colspan="3"><span id="msg_keylen">0</span>/80 byte</td>
                                </tr>
                                <tr> 
                                  <td height="43">&nbsp;</td>
                                  <td height="43" width="20" valign="bottom"> 
                                    <input type="radio" name="fromtype" value="${cellphone}" onclick="fromtel.value=this.value">
                                  </td>
                                  <td height="43" width="20" valign="bottom"><img src='<html:rewrite page="/images/teacher/icon_phone.gif"/>' width="14" height="20"></td>
                                </tr>
                                <tr> 
                                  <td height="25" align="center"> 
                                    <input type="text" name="fromtel" class="pNo"  style="width:80px;" value="${telphone}">
                                  </td>
                                  <td height="25" width="20"> 
                                    <input type="radio" name="fromtype" value="${telphone}" onclick="fromtel.value=this.value" checked>
                                  </td>
                                  <td height="25" width="20"><img src='<html:rewrite page="/images/teacher/icon_tel.gif"/>' width="14" height="13"></td>
                                </tr>                            
                              </table>
                              <!--문자입력 테이블 끝-->
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td height="300" valign="top"> 
                        <table width="282" border="0" cellspacing="1" cellpadding="0" bgcolor="#A2C8C8">
                          <tr> 
                            <td bgcolor="#F2FDFD" height="29"> 
                              <!--직접입력/발송그룹 선택 테이블-->
                              <table width="170" border="0" cellspacing="0" cellpadding="0" height="100%">
                                <tr> 
                                  <td> 
                                    <input type="radio" name="type" value="01" onclick="select_type('01')" >직접입력
                                  </td>
                                  <td> 
                                    <input type="radio" name="type" value="02" onclick="select_type('02')" checked="checked">발송그룹</td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr> 
                            <td bgcolor="#FFFFFF" valign="top"> 
                              <!--직접입력시 테이블 시작-->
                              <table id="tbl" width="280" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td colspan="2" class="pt1">&nbsp;</td>
                                  <td class="pt1">휴대번호</td>
                                  <td colspan="2" class="pt1">&nbsp;</td>
                                </tr>
                                <tr> 
                                  <td colspan="5" class="lbg3"></td>
                                </tr>
                                <tr id="tbl_tr"> 
                                  <td width="89" class="pt2">수신자입력</td>
                                  <td class="sBg"></td>
                                  <td class="pt2"> 
                                    <input type="text" name="sendtelno" maxlength="13"  style="width:90%;" onkeydown="key_num_minus();" onblur="check_tel(this);">
                                  </td>
                                  <td class="sBg"></td>
                                  <td width="45" class="pt2"><img src='<html:rewrite page="/images/board/btn_add2.gif"/>' width="34" height="18" alt="추가" align="absmiddle" onclick="add_row()" style="cursor:hand"/></td>
                                </tr>
                              </table>
                              <!--직접입력시 테이블 끝-->
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td class="p1" colspan="3" height="15"></td>
                    </tr>
                    <tr> 
                      <td class="p1" colspan="3"> 
                        <!--하단 버튼 시작-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="45">
                          <tr> 
                            <td align="right"><img src='<html:rewrite page="/images/board/btn_sms.gif"/>' width="73" height="25" align="absmiddle" alt="SMS발송" onclick="formSubmit()" style="cursor:hand"/></td>
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
</html:form>
<script type="text/javascript">
	select_type('02')
</script>
</body>
</html>
