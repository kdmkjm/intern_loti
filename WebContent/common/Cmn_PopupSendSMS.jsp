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
<title>SMS �߼�</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link rel="stylesheet" href='<html:rewrite page="/style/main.css"/>' type="text/css" />
<script type="text/javascript" src='<html:rewrite page="/common/js/prototype.js"/>'></script>
<script type="text/javascript">

	String.prototype.trim = function()
	{
	 return this.replace(/(^\s*)|(\s*$)/gi, "");
	}

	// replaceAll(A��, B��) �ٲ۴�.
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
			 event.keyCode == '109' || event.keyCode == '189' ||		// '-'�� Ű�� ���� ��.
	  		 event.keyCode == '39' || event.keyCode == '37' || 
			(event.keyCode >= '48' && event.keyCode <= '57') ||
			(event.keyCode >= '96' && event.keyCode <= '105') )
		   )
		{ event.returnValue = false; }
	}

	///������ �����Է��� ǥ�� �ϱ� ���� �ڹ� ��ũ��Ʈ ==================================================================
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
   // ������ �ʱ�ȭ �����ش�.
   for (var i=1;i <= idata_count ; i++)
   { 
   	tbl.rows(i+1).cells(0).innerHTML = i + "&nbsp;" 
   }
	}

	function add_row()
	{ var ck, cck, len, telobj;
		// �迭�� �ɶ�(0)�� �ǰ� ó������ �迭�� �ȵǾ� �ֱ⶧���� (0)�ϸ� ������.
		try	{
			ck = document.forms[0].sendtelno[0].value;  cck = document.forms[0].sendtelno[0]; 
		}	catch (Exception) { 
			ck = document.forms[0].sendtelno.value; cck = document.forms[0].sendtelno; 
		}
		// �޴���ȭ��ȣ�� ���� ������ insertrow�� ���� �ʴ´�.
		if (ck.trim() == "") return;
		ck = ck.replaceAll("-","");
		len = ck.length;

		try {
			if (!check_tel(document.forms[0].sendtelno[0])) return;		//��ȭ��ȣ ����
		} catch (Exception) {
			if (!check_tel(document.forms[0].sendtelno)) return;		//��ȭ��ȣ ����
		}	
		if(len==10) { cck.value = ck.substring(0,3)+"-"+ck.substring(3,6)+"-"+ck.substring(6,10); }
		if(len==11) { cck.value = ck.substring(0,3)+"-"+ck.substring(3,7)+"-"+ck.substring(7,11); }

		var idx = getObj().parentElement.rowIndex + 1 + idata_count; //�ʰ� �Է��Ѱ� �����ϴܿ� ���������� Idx�� ���ؿ´�.
		var r = tbl.insertRow(idx);
		idata_count++; // ROW�� ������ ī��Ʈ�Ѵ�.
	
		for (var i = 0; i < tbl.rows(2).cells.length; i++) {
			// �Էµ� Row�� ����ü�� �����´�.
			var bb = tbl.rows(2).cells(i);
			// Insert�� Row�� ����ü�� �����´�.
			var c = tbl.rows(idx).insertCell(i);
			// 2��° ���� ���鶧 ���������� ��ġ�Ѵ�.
			if (i == 4) {
				c.width = "45";
				c.className = "pt2";
				c.innerHTML = '<img src="/images/board/btn_del2.gif" width="34" height="18" alt="����" align="absmiddle" onclick="idata_del_row()">';
			} else if (i == 0) { // ù��° ���� ���鶧 �Ϸù�ȣ�� �ִ´�.
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
		// �ʱ��Էµ� �κ��� �ʱ�ȭ �����ش�.
		// d1,d2,d3,d4,d5�� �����̹Ƿ� ���� �κп� ���ؼ� ������ �����ʰ� �ҷ��� try�� �������.
		try	{ document.forms[0].sendtelno[0].value = '' } catch (Exception) { }
		// �Էºκ����� ��Ŀ���� ���߾� �ش�.
		document.forms[0].sendtelno[0].focus();
		return true;
	}
	
	//�߼� ��� ����
	function select_type(type)
	{
		if (type == '01')	//�����Է�
		{
			tbl_tr.style.display = "block";
		} else {
			tbl_tr.style.display = "none";
		}
	}
	
	//��ȭ��ȣ üũ(������ �����Է��� ��츸 ���)
	function check_tel(obj)
	{
		var cellNumber = "";
		cellNumber = obj.value;
		cellNumber = cellNumber.replaceAll("-","");
		
		if(cellNumber == '') {
			return true;
		}

		if (cellNumber.length < 10 || cellNumber.length > 11) {
			alert('�ùٸ� �޴���ȭ��ȣ�� �Է��ϼ���!');
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
			 alert('�ùٸ� �޴���ȭ��ȣ�� �Է��ϼ���!');
			 obj.value = "";
			 obj.focus();
			 return false;
		}

	}
	
	function getMsgLen(msgtext) 
	{
		var temp="";
		var i=0,l=0;
	
		//���̸� ���Ѵ�.
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

	//�Է� ����Ʈ �� ����(�߼�ȭ�鿡�� ���)
	function msg_keyup(obj,imsg_f,msg_proto,maxLen)
	{		
			var msgtext, msglen;
			msgtext = obj.value;
			var i=0,l=0;
			var temp,lastl, alert_msg="", alert_msg1="";
			var alert_fl=false;
			
			//if (msg_proto=="001" && imsg_f != "") {	//sms�ε� ���ȿ� ÷������ ���� ��� alert
			//	alert_msg1="�� ������ SMS�����̹Ƿ� �߼۽� ÷�������� ÷�ε��� �ʽ��ϴ�."
			//}
			
			//���̸� ���Ѵ�.
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
					alert_msg="�Է� ������ ���̸� �ʰ��Ͽ����ϴ�.\n�޽����� �ѱ� "+(maxLen/2)+"��, ����"+maxLen+"�ڱ����� ���� �� �ֽ��ϴ�.\n(�ʰ� �Էµ� �޽����� �ڵ� �����˴ϴ�.)"
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
		
			//mms->sms �����
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
		  	alert("�߼� ����� �����ϴ� Ȯ���Ͽ� �ֱ�� �ٶ��ϴ�.");
		  	return false;
		  }
		}
	  
		if(frm.msg.value == ""){
			alert("�߼� ���ڸ�  �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
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
                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/teacher/title_01-2.gif"/>' width="90" height="42" alt="SMS�߼�" /></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td> 
                  <table width="617" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr> 
                      <td height="25" class="p1" colspan="3"><img src='<html:rewrite page="/images/board/dot_02.gif"/>' width="17" height="3" align="absmiddle" alt="" />�߼۸��</td>
                    </tr>
                    <tr> 
                      <td height="300" valign="top" width="125"> 
                        <!--�߼۸���Ʈ ����-->
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
                              <!--�����Է� ���̺� ����-->
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
                              <!--�����Է� ���̺� ��-->
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td height="300" valign="top"> 
                        <table width="282" border="0" cellspacing="1" cellpadding="0" bgcolor="#A2C8C8">
                          <tr> 
                            <td bgcolor="#F2FDFD" height="29"> 
                              <!--�����Է�/�߼۱׷� ���� ���̺�-->
                              <table width="170" border="0" cellspacing="0" cellpadding="0" height="100%">
                                <tr> 
                                  <td> 
                                    <input type="radio" name="type" value="01" onclick="select_type('01')" >�����Է�
                                  </td>
                                  <td> 
                                    <input type="radio" name="type" value="02" onclick="select_type('02')" checked="checked">�߼۱׷�</td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr> 
                            <td bgcolor="#FFFFFF" valign="top"> 
                              <!--�����Է½� ���̺� ����-->
                              <table id="tbl" width="280" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td colspan="2" class="pt1">&nbsp;</td>
                                  <td class="pt1">�޴��ȣ</td>
                                  <td colspan="2" class="pt1">&nbsp;</td>
                                </tr>
                                <tr> 
                                  <td colspan="5" class="lbg3"></td>
                                </tr>
                                <tr id="tbl_tr"> 
                                  <td width="89" class="pt2">�������Է�</td>
                                  <td class="sBg"></td>
                                  <td class="pt2"> 
                                    <input type="text" name="sendtelno" maxlength="13"  style="width:90%;" onkeydown="key_num_minus();" onblur="check_tel(this);">
                                  </td>
                                  <td class="sBg"></td>
                                  <td width="45" class="pt2"><img src='<html:rewrite page="/images/board/btn_add2.gif"/>' width="34" height="18" alt="�߰�" align="absmiddle" onclick="add_row()" style="cursor:hand"/></td>
                                </tr>
                              </table>
                              <!--�����Է½� ���̺� ��-->
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
                        <!--�ϴ� ��ư ����-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="45">
                          <tr> 
                            <td align="right"><img src='<html:rewrite page="/images/board/btn_sms.gif"/>' width="73" height="25" align="absmiddle" alt="SMS�߼�" onclick="formSubmit()" style="cursor:hand"/></td>
                          </tr>
                        </table>
                        <!--�ϴ� ��ư ��-->
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
