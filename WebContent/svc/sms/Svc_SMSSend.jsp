<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script language="JavaScript">
<!--
window.onresize = function(){
//   ������ ������ ���� ���� �ڵ�
tresize(195);
}

// ������ ó�� ������� �⺻������ ��ȸ
function searchList(key)
{
	setType('01');
	selectUser();
}

function setCrs()
{
	var searchCode = document.all.searchCourseCode.value;
	// type ���� �Ѱ��ش�. (onlyCrs) 
	window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
}

function setType(type)
{
	MM_swapImgRestore();
  MM_swapImage('Image'+type,'','<html:rewrite page="/images/resources/select_m_'+type+'_over.gif"/>',1);
  
  if(type == "01")
  {
    crsdiv.style.display = "none";
    profdiv.style.display = "block";
  }
  else
  {
    crsdiv.style.display = "block";
    profdiv.style.display = "none";
  }
  document.forms[0].type.value= type;
}

function selectUser()
{
  var type = document.forms[0].type.value;
  
  if(type == "01")
  {
  	var searchkeyword = document.forms[0].searchKeyword.value;
  	var pars = "type="+type+"&searchKeyword=" + searchkeyword;
  }
  else
  {
  	var searchCourseCode = document.getElementById('searchCourseName').value + '0' + document.getElementById('searchKeyword').value + '000';
  	var pars = "type="+type+"&searchCourseCode=" + searchCourseCode;
  }
  
	var url = "svcSMSSend.act?task=search";	
	

	var myAjax = new Ajax.Request(
					url,
                          {
                              method: 'post',
                              parameters: pars,
                              onComplete: success
                             });

}

function success(request)
{
	$('mainList').innerHTML = request.responseText;
	tresize(195);
}

// �߰� ��ư �����
function addUser()
{
	var doc = document;
	var fromfrm = doc.fromFrm;
	var tofrm = doc.toFrm;
	
	var rstTable = doc.getElementById("mainTable2");
	var rstTBodies = rstTable.tBodies[0];
	var schTable = doc.getElementById("mainTable");
	var schTBodies = schTable.tBodies[0];
	var schRows = schTBodies.rows;

	if(fromfrm.elements['count'].value >0  )
	{
		if (typeof(fromfrm.elements['chkuser'].length) == 'undefined') 
	 	{  
	   	if (fromfrm.elements['chkuser'].checked==true)   
	     {  	       
	     		if(typeof(rstTBodies) == 'undefined')
					{
						var tbodyElement = document.createElement("tbody");
						rstTable.insertAdjacentElement("beforeEnd",tbodyElement);
						rstTBodies = rstTable.tBodies[0];
					}
	     
					if(!existaddChk(fromfrm.elements['chkuser'].value)){
	     			rstTBodies.insertAdjacentElement("beforeEnd", schRows[0].cloneNode(true));
					}
	    		//schTBodies.rows[0].parentNode.removeChild(schTBodies.rows[0]);
	   	}  
		} 
		else 
		{ 
			for (i=0; i<fromfrm.elements['chkuser'].length; i++)   
	     {  
				if (fromfrm.elements['chkuser'][i].checked==true)  
				{ 
					if(typeof(rstTBodies) == 'undefined')
					{
						var tbodyElement = document.createElement("tbody");
						rstTable.insertAdjacentElement("beforeEnd",tbodyElement);
						rstTBodies = rstTable.tBodies[0];
						
					}
					
					if(!existaddChk(fromfrm.elements['chkuser'][i].value)){
						rstTBodies.insertAdjacentElement("beforeEnd", schRows[i].cloneNode(true));
					}
					//schTBodies.rows[i].parentNode.removeChild(schTBodies.rows[i]);
				}  
			}  
		} 
	}
	tresize(205);
}	

//������/���� ��
function existaddChk(searchchkuser)
{
	var doc = document;
	var tofrm = doc.toFrm;
	var rstTable = doc.getElementById("mainTable2");
	var rstTBodies = rstTable.tBodies[0];
	var delRows = rstTBodies.rows;
	
	//����
	if(typeof(tofrm.elements['chkuser']) == 'undefined')   
 	{  
 		return false;
	}
	else
	{
 		if(typeof(tofrm.elements['chkuser'].length) == 'undefined')
 		{   
			if(tofrm.elements['chkuser'].value == searchchkuser) 
				return true;
			else 
				return false;
 		}
 		
 		for (j=0; j<tofrm.elements['chkuser'].length; j++)   
		{
   		if(tofrm.elements['chkuser'][j].value == searchchkuser) 
   		{
   			return true;
   		}
		}
	}
}

//������ư�����
function delUser()
{

	var doc = document;
	var tofrm = doc.toFrm;
	var rstTable = doc.getElementById("mainTable2");
	var rstTBodies = rstTable.tBodies[0];
	var delRows = rstTBodies.rows;
	
	if(delRows.length >0 )
	{		
		var len = tofrm.elements['chkuser'].length;

		//����
		if (typeof(tofrm.elements['chkuser'].length) == 'undefined')   
	 	{  
	   	if (tofrm.elements['chkuser'].checked==true)   
	     {  
	     	rstTBodies.rows[0].parentNode.removeChild(rstTBodies.rows[0]);
	   	}  
		} 
		else 
		{ 
			try
			{
				for (var i = (len - 1) ; i > -1 ; i--){
					if (tofrm.elements['chkuser'][i].checked == true){
						rstTBodies.rows[i].parentNode.removeChild(rstTBodies.rows[i]);
					}
				} 
			}
			catch(Exception)
			{
				alert("������ ������ �����ϴ�.");
			}  
		} 
	}
}

function openSMS(frm)
{
	var str;
 	var winl = (screen.width - 700) / 2;
 	var wint = (screen.height - 750) / 2;
 	str = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,width=650,height=490,top="+wint+",left="+winl;  
  window.open('','popsms', str);
	frm.action = "cmnPopupSendSMS.act";
	frm.task.value = "list";	
	frm.target = "popsms";
	frm.method = "post"
	frm.submit();		
	frm.target = "";
}


function openEmail(frm)
{
	var str;
 	var winl = (screen.width - 700) / 2;
 	var wint = (screen.height - 750) / 2;
 	str = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,width=650,height=490,top="+wint+",left="+winl;  	
	window.open('','popemail', str);
	frm.action = "cmnPopupSendEMail.act";
	frm.task.value = "list";
	frm.target = "popemail";	
	frm.method = "post"		
	frm.submit();		
	frm.target = "";	
}	
	function checkAll()
	{
		if(document.all.count == 'undefined')
		{
			alert("��ȸ�� �����Ͱ� �����ϴ�.");
			return;
		}
	
		var max = Number(document.all.count.value);
		if(max == 0)
		{
			alert("��ȸ�� �����Ͱ� �����ϴ�.");
			return;
		}
		
		if(max == 1)
		{
			if(document.fromFrm.chkuser.checked == false)
				document.fromFrm.chkuser.checked = true;
			else
				document.fromFrm.chkuser.checked = false;
		}
		else
		{
			if(document.fromFrm.chkuser[0].checked == false)
				for(var i=0; i<max; i++)
					document.fromFrm.chkuser[i].checked = true;
			else
				for(var i=0; i<max; i++)
					document.fromFrm.chkuser[i].checked = false;
		}
	}
	
	function checkAllSend()
	{
		var doc = document;
		var tofrm = doc.toFrm;
		var flag;
		
		// ����
		try {
			if(tofrm.elements['chkuser'][0].checked == false)
				flag = false;
		} catch(Exception) {
		}
		for(var i=0; i<999; i++)
		{
			try {
				if(flag == false)
					tofrm.elements['chkuser'][i].checked = true;
				else 
				  tofrm.elements['chkuser'][i].checked = false;
			} catch(Exception) {
				break;
			}
		}
		
		// 1��
		try {
			if(tofrm.elements['chkuser'].checked == false)
				flag = false;
				
			if(flag == false)
				tofrm.elements['chkuser'].checked = true;
			else 
			  tofrm.elements['chkuser'].checked = false;
		} catch(Exception) {
			return;
		}
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="SMS/EMAIL�߼�" src="/images/resources/title_07.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td>
        <table width="750" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td> 
            <table width="750" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td valign="top" width="470"> 
                <!--����˻�/�����˻� ���̺�-->
                <table width="350" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td> 
                    <table width="340" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="82" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="setType('01');" ><img name="Image01" border="0" src='<html:rewrite page="/images/resources/select_m_01.gif"/>' width="80" height="24" alt="����˻�" /></a></td>
                      <td width="80" background='<html:rewrite page="/images/edu/month_bg.gif"/>'><a href="#" onclick="setType('02');" ><img name="Image02" border="0" src='<html:rewrite page="/images/resources/select_m_02.gif"/>' width="80" height="24" alt="�����˻�" /></a></td>
                      <td background='<html:rewrite page="/images/edu/month_bg.gif"/>'>&nbsp;</td>
                    </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td> 
                    <table width="340" border="0" cellspacing="0" cellpadding="0">
                    <tr><td height="4"></td></tr>
                    <tr> 
                      <td> 
                        <html:form action="svcSMSSend.act?task=list" onsubmit="return false" >
                          <input type="hidden" name="type">
                          <div id="profdiv" style="display:blok ">
                            <table width="260" border="0" cellspacing="0" cellpadding="0" align="right">
                            <tr> 
                              <td width="70" class="pItem">�̸�/�Ҽ�</td>
                              <td> 
                                <input type="text" name="searchKeyword" style="width:92%;" onkeypress="if(event.keyCode==13)selectUser()">
                              </td>
                              <td width="32"><img src='<html:rewrite page="/images/board/btn_s_search.gif"/>' width="34" height="18" align="absmiddle" alt="�˻�" onclick="selectUser()" style="cursor:hand"/></td>                                    
                            </tr>
                            </table>
                          </div>
                          <div id="crsdiv" style="display:none ">
                            <table width="340" border="0" cellspacing="0" cellpadding="0" align="right">
					        <tr> 
					          <td width="40" class="pItem">����</td>
					          <td class="s2" width="340"> 
								  <select id="searchYear"></select>
								  <select id="searchCourseName" style="width:150px;">
								  	<option value="">���� ����</option>
								  </select>
								  <select id="searchKeyword" style="width:50px;">
								  	<option value="">������� ����</option>
								  </select>
								  <html:hidden property="searchColumn"/>
								  <html:hidden property="searchCourseCode"/>
							 </td>
                              <td width="32"><img src='<html:rewrite page="/images/board/btn_s_search.gif"/>' width="34" height="18" align="absmiddle" alt="�˻�" onclick="selectUser()" style="cursor:hand"/></td>                                    
                            </tr>
                            </table>
                          </div>                                    
                        </html:form>
                      </td>
                    </tr>
                    <tr><td height="4"></td></tr>
                    <tr> 
                      <td> 
                        <table width="340" border="0" cellspacing="0" cellpadding="0">
                        <tr><td class="tbg2"></td></tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td> 
                        <!--���̺� ��� ����-->
                        <table width="340" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                          <td class="lbg"></td>
                          <td class="cbg" width="336"> 
                            <table width="336" border="0" cellspacing="0" cellpadding="0" height="100%">
                            <tr> 
                              <td class="t1" width="44"><a href="#" onclick="checkAll();"><u>����</u></td>
                              <td class="sBg"></td>
                              <td class="t1" width="89">�̸�</td>
                              <td class="sBg"></td>
                              <td class="t1">�Ҽ�</td>
                              <td width="17"></td>
                            </tr>
                            </table>
                          </td>
                          <td class="lbg"></td>
                        </tr>
                        </table>
                        <!--���̺� ��� ��-->
                      </td>
                    </tr>
                    <tr> 
                      <td> 
                        <table width="340" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                          <td class="lbg2"></td>
                          <td width="336"> 
                            <table width="336" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td height="270" valign="top"> 
                                <form name="fromFrm">
                                  <!--����Ʈ ����-->
                                  <div id="mainList" style="width:336px; height:250px; overflow-y:scroll ;overflow-x:hidden;"> 
                                  </div>
                                  <!--����Ʈ ��-->
                                </form>
                              </td>
                            </tr>
                            </table>
                          </td>
                          <td class="lbg2"></td>
                        </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td> 
                        <table width="340" border="0" cellspacing="0" cellpadding="0">
                        <tr><td class="tbg1"></td></tr>
                        </table>
                      </td>
                    </tr>
                    </table>
                  </td>
                </tr>
                </table>
              </td>
              <td width="80"> 
                <!--�߰�/���� ��ư-->
                <table width="56" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr> 
                  <td height="30" valign="top"><img src='<html:rewrite page="/images/board/btn_s_add2.gif"/>' width="46" height="25" alt="�߰�" onclick="addUser()" style="cursor:hand"/></td>
                </tr>
                <tr> 
                  <td><img src='<html:rewrite page="/images/board/btn_s_del2.gif"/>' width="46" height="25" alt="����" onclick="delUser()"  style="cursor:hand"/></td>
                </tr>
                </table>
              </td>
              <td valign="top" width="200"> 
                <!--�߼۸�� ���̺�-->
                <table width="340" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="10" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />�߼۸��</td>
                </tr>
                <tr> 
                  <td> 
                    <table width="340" border="0" cellspacing="0" cellpadding="0">
                    <tr><td class="tbg2"></td></tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td> 
                    <!--���̺� ��� ����-->
                    <table width="340" border="0" cellspacing="0" cellpadding="0">
	                <tr> 
	                  <td class="lbg"></td>
	                  <td>
                        <table width="336" border="0" cellspacing="0" cellpadding="0" bgcolor="#E5F1DC">
                        <tr><td class="t1" height="19">��&nbsp;��&nbsp;��&nbsp;��</td></tr>
                        </table>
                      </td>
	                  <td class="lbg"></td>
	                </tr>
	                <tr><td colspan="3" class="lbg3"></td></tr>
                    <tr> 
                      <td class="lbg"></td>
                      <td class="cbg" width="336"> 
                        <table width="336" border="0" cellspacing="0" cellpadding="0" height="100%">
                        <tr> 
                          <td class="t1" width="44"><a href="#" onclick="checkAllSend();"><u>����</u></td>
                          <td class="sBg"></td>
                          <td class="t1" width="89">�̸�</td>
                          <td class="sBg"></td>
                          <td class="t1">�Ҽ�</td>
                          <td width="17"></td>
                        </tr>
                        </table>
                      </td>
                      <td class="lbg"></td>
                    </tr>
                    </table>
                    <!--���̺� ��� ��-->
                  </td>
                </tr>
                <tr> 
                  <td> 
                    <table width="340" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="lbg2"></td>
                      <td width="196"> 
                        <table width="196" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                          <td height="270" valign="top"> 
                            <form name="toFrm" action="/cmnPopupSendSMS.act">
                              <input type="hidden" name="task">
                              <input type="hidden" name="popflag" value="all">
                              <!--����Ʈ ����-->
                              <div id="mainList2" style="width:336px; height:270px; overflow-y:scroll ;overflow-x:hidden;"> 
                                <table id="mainTable2" width="449" border="0" cellspacing="0" cellpadding="0">
                                </table>
                              </div>
                              <!--����Ʈ ��-->
                            </form>
                          </td>
                        </tr>
                        </table>
                      </td>
                      <td class="lbg2"></td>
                    </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td> 
                    <table width="340" border="0" cellspacing="0" cellpadding="0">
                    <tr><td class="tbg1"></td></tr>
                    </table>
                  </td>
                </tr>
                </table>
              </td>
            </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td> 
            <!--�ϴܹ�ư ���̺� ����-->
            <table width="750" border="0" cellspacing="0" cellpadding="0" height="30">
            <tr valign="bottom"> 
              <td align="right"><img src='<html:rewrite page="/images/board/btn_sms.gif"/>' width="73" height="25" align="absmiddle" alt="SMS �߼�" onclick="openSMS(document.forms[2])" style="cursor:hand"/> 
                <img src='<html:rewrite page="/images/board/btn_email.gif"/>' width="79" height="25" alt="EMAIL �߼�" align="absmiddle" onclick="openEmail(document.forms[2])" style="cursor:hand"/>
              </td>
            </tr>
            </table>
            <!--�ϴܹ�ư ���̺� ��-->
          </td>
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
	tresize(195);
	searchList('${key}');
	//document.forms[0].searchKeyword.focus();

//-->
</script>
