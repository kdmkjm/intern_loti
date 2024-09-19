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
<script language="JavaScript">

	var jq = $.noConflict(true);
	
	jq(function(){
		var befunload = function(){
							return '��������� ������� �ʽ��ϴ�.';
						};
		jq('input[type="text"]').on('change paste keyup', function(e){
			jq(window).on('beforeunload', befunload);
		});
		jq('select').on('change', function(){
			jq(window).on('beforeunload', befunload);
		});
		jq('img.additem, img.delitem, img.addexam, img.delexam').on('click', function(){
			jq(window).on('beforeunload', befunload);
		});
		
		jq("#itemForm").on("change", "select[name=itemgroup_array]", function(){
			if(jq(this).val() == '���Ǹ�����') {
				jq("input[name=itemcontents_array]").eq(jq("select[name=itemgroup_array]").index(this)).val("���Ǹ����� - ");
			}
		});
		
		jq("#bankgrp_select").on("change", function(){
			jq("#bankgrp").val(jq(this).val());
			getBankgrpInfo(jq(this).val());
		});
		jq("#itemForm").on("change", "input[name=bankgrp_array]", function(){
			if(jq(this).attr("checked") == "checked")
				jq(this).val(jq("#bankgrp_select").val());
			else
				jq(this).val("0");
		});
		jq("#bankgrp_select").trigger("change");
	});
	
	function getBankgrpInfo(v){
		jq.get("/tstSurvey.act?task=getBankgrpInfos", "bankgrp="+v,
				function(data){
					
					jq.each(data, function(){	
						var itemno = this.itemno;
						var bankgrp = this.bankgrp;
						jq("#itemForm input[name=itemno_array]").filter(function(){
							return jq(this).val() == itemno; 
						}).siblings("input[name=bankgrp_array]").val(bankgrp);
					});
					var sel = jq("#bankgrp_select");
					jq("#itemForm input[name=bankgrp_array]").each(function(){
						if (jq(this).val() == v) {
							jq(this).attr("checked", true);
							jq(this).val(sel.val());
						} else {
							jq(this).attr("checked", false);
							jq(this).val("0");
						}
					});
				}
		);
	}
	
	function addItem(obj){
		var std = jq('#sampleItem');
		
		var count = jq('#mainTable td[title="rownum"]').length + 1;
		
		var _item = jq(std).find('table tr:eq(0)').clone();
		var _exam = jq(std).find('table tr:eq(1)').clone();
		var _line = jq(std).find('table tr:eq(2)').clone();
		
		jq('#mainTable tr').has(obj).next().next().after(_line).after(_exam).after(_item);
		
		jq('#mainTable td[title="rownum"]').each(function(idx){
			jq(this).html(idx+1).append('<input name="itemno_array" type="hidden" value="'+(idx+1)+'"/>');
		});
	}
	
	function addExam(obj){
		
		var table = jq("#mainTable table.ExamTable").has(obj);
		var curTR = jq(table).find('tr').has(obj);
		var tr = document.createElement('tr')
		var bartd = jq(document.createElement('td')).addClass('sBg');
		jq(bartd).clone().appendTo(tr);
		var td1 = jq(document.createElement('td'))
			.appendTo(tr)
			.attr('width','10')
			.append(1)
			.append(jq(document.createElement('input')).attr({type:'hidden', name:'examseq_array', value: 1}));
		jq(document.createElement('td'))
			.appendTo(tr)
			.append('. ')
			.append(jq(document.createElement('input')).attr({type:'text', name:'examcontents_array', style:"width:90%;"}));
		jq(document.createElement('td'))
			.appendTo(tr)
			.attr('width','10%')
			.append(jq(document.createElement('img')).attr({src:'/images/board/btn_plus.gif', width: 20, height: 15, alt:'�����߰�', onclick:'addExam(this)', style:'cursor:hand; vertical-align:middle;'}))
			.append('&nbsp;')
			.append(jq(document.createElement('img')).attr({src:'/images/board/btn_minus.gif', width: 20, height: 15, alt:'�������', onclick:'delExam(this)', style:'cursor:hand; vertical-align:middle;'}));
		jq(bartd).clone().appendTo(tr);
		jq(curTR).after(tr).after('<tr><td class="sBg"></td><td class="lbg3" colspan="5"></td><td class="sBg"></td></tr>');
		
		var examseq_array = jq(table).find('input[name="examseq_array"]');
		jq(examseq_array).each(function(idx){
			jq(this).parent().empty().append(idx+1).append(jq(document.createElement('input')).attr({type:'hidden', name:'examseq_array', value: idx+1}));
		});
	}
	
	function delItem(obj){
		var std = jq(obj).parent().parent();
		jq(std).next().remove();
		jq(std).next().remove();
		jq(std).remove();
		
		jq('#mainTable td[title="rownum"]').each(function(idx){
			jq(this).html(idx+1).append('<input name="itemno_array" type="hidden" value="'+(idx+1)+'"/>');
		});
	}
	
	function delExam(obj){
		var table = jq("#mainTable table.ExamTable").has(obj);
		if(jq(table).find('tr.exam').length > 1){
			jq(table).find('tr').has(obj).prev('tr').remove();
			jq(table).find('tr').has(obj).remove();
			jq(table).find("input[name='examseq_array']").each(function(idx){
				jq(this).val(idx+1).parent().html(idx+1).append(this);
			});
		}
		else{
			alert('���⹮���� �ּ� 1���� �����ؾ��մϴ�.');
		}
	}
	
	function showExam(obj){
		var div = jq('#mainTable tr').has(obj).next().find('div.subDiv');
		if(jq(div).is(':visible')){
			jq(div).hide();
		}
		else{
			jq(div).show();
			jq('#mainTable').find('div').not(div).hide();
		}
	}
	
	function done(){
		jq("#itemForm input[name=bankgrp_array]").each(function(){
			jq("#itemForm").append('<input type="hidden" name="bankgrp_array" value="'+jq(this).val()+'"/>');
			jq(this).remove();
		});
		jq('#itemForm').submit();
	}
	
	function checkCancle(){
		if(confirm('��������� ������� �ʽ��ϴ�. \n ����Ͻðڽ��ϱ�?')){
			window.close();
		}
	}
	
	function statExcelDownload(){
		var size_w = 100;
  		var size_h = 100;
  		
  		var url = '/tstSurvey.act?task=surveyItemBankStatExcel';
  		var target = '_blank';
		window.open(url, target, "width="+size_w+", height="+size_h+", scrollbars=yes, toolbar=no, menubar=no, location=no");
	}
	
	function viewStatList(){
		var size_w = 790;
  		var size_h = 700;
  		
  		var url = '/tstSurvey.act?task=surveyItemBankStat';
  		var target = '_blank';
		window.open(url, target, "width="+size_w+", height="+size_h+", scrollbars=yes, toolbar=no, menubar=no, location=no");
	}
	
	function viewStatListForPrint(){
		var size_w = 790;
  		var size_h = 700;
  		
  		var url = '/tstSurvey.act?task=surveyItemBankStatForPrint';
  		var target = '_blank';
		window.open(url, target, "width="+size_w+", height="+size_h+", scrollbars=yes, toolbar=no, menubar=no, location=no");
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">����������</h2>
				<h1>
					<img alt="������ �ۼ�" src="/images/poll/title_02.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td align="center">
			<div style="width:750px; text-align:left;">
				<select id="bankgrp_select">
					<option value="1">A��</option>
					<option value="2">B��</option>
					<option value="3">C��</option>
				</select>
			</div>
		</td>
	</tr>
	<tr>
		<td align="center">
			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="tbg2"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<!--���̺� ��� ����-->
			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="lbg"></td>
					<td class="cbg" width="746">
						<table width="746" border="0" cellspacing="0" cellpadding="0" height="100%" align="left">
							<tr>
								<td class="t1" width="40">����</td>
								<td class="sBg"></td>
								<td class="t1">����</td>
								<td class="sBg"></td>
								<td class="t1" width="119">����</td>
								<td class="sBg"></td>
								<td class="t1" width="89">����</td>
								<td class="sBg"></td>
								<td class="t1" width="79">����</td>
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
		<td align="center">
			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="lbg2"></td>
					<td width="746">
						<table width="746" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td valign="top">
									<!--����Ʈ ����-->
									<form id="itemForm" action="/tstSurvey.act?task=modifyServItemBank" method="post" target="_self">
										<input type="hidden" name="bankgrp" id="bankgrp"/>
										<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
											<c:forEach var="Item" items="${rsTst_SurveyItemList}" varStatus="i">
												<c:if test="${i.count%2 == 0}">
													<c:set var="lineBg" scope="request" value="tbg3" />
												</c:if>
												<c:if test="${i.count%2 == 1}">
													<c:set var="lineBg" scope="request" value="" />
												</c:if>
												<tr class="${lineBg}">
													<td class="t2" width="40" title="rownum">
														<input type="checkbox" name="bankgrp_array"/>
														${i.count }
														<input name="itemno_array" type="hidden" value="${Item.itemno }" />
													</td>
													<td class="sBg"></td>
													<td class="t3">
														&nbsp;
														<html:text property="itemcontents_array" value="${Item.itemcontents }" style="width:90%;" />
														&nbsp;<img src="/images/board/dawn.gif" class="showexam" align="absmiddle" onclick="showExam(this)" style="cursor: hand;" />
													</td>
													<td class="sBg"></td>
													<td class="t2" width="119">
														<html:select property="itemgroup_array" value="${Item.itemgroup}">
															<html:option value="�⺻�׸�">�⺻�׸�</html:option>
															<html:option value="����ȿ��">����ȿ��</html:option>
															<html:option value="�����">�����</html:option>
															<html:option value="�н���">�н���</html:option>
															<html:option value="������">������</html:option>
															<html:option value="�ü��̿�">�ü��̿�</html:option>
															<html:option value="���Ǹ�����">���Ǹ�����</html:option>
															<html:option value="��Ÿ">��Ÿ</html:option>
														</html:select>
													</td>
													<td class="sBg"></td>
													<td class="t2" width="89">
														<html:select property="itemgbn_array" value="${Item.itemgbn}">
															<html:option value="A">������</html:option>
															<html:option value="B">�ְ���</html:option>
														</html:select>
													</td>
													<td class="sBg"></td>
													<td class="t2" width="79" align="center">
														<img class="additem" src="/images/board/btn_plus.gif" align="middle" alt="�����߰�" onclick="addItem(this)"
															style="cursor: hand; vertical-align: middle;" title="�����߰�" /> <img class="delitem" src="/images/board/btn_minus.gif" align="middle" alt="���׻���"
															onclick="delItem(this)" style="cursor: hand; vertical-align: middle;" title="���� ����" />
													</td>
												</tr>
												<tr>
													<td colspan="2"></td>
													<td colspan="12" align="center">
														<div style="display: none;" class="subDiv" align="left">
															<table class="ExamTable" width="100%" border="0" cellspacing="0" cellpadding="0">
																<c:forEach var="exam" items="${Item.examlist}" varStatus="j">
																	<tr>
																		<td class="sBg"></td>
																		<td class="lbg3" colspan="5"></td>
																		<td class="sBg"></td>
																	</tr>
																	<tr class="exam">
																		<td class="sBg"></td>
																		<td width="10">
																			${exam.examseq } <input type="hidden" name="examseq_array" value="${exam.examseq }" />
																		</td>
																		<td>
																			.
																			<html:text property="examcontents_array" value="${exam.examcontents }" style="width:90%;" />
																		</td>
																		<td width="10%">
																			<img class="addexam" src="/images/board/btn_plus.gif" width="20" height="15" align="middle" alt="�����߰�" onclick="addExam(this)"
																				style="cursor: hand; vertical-align: middle;" title="���� �߰�" /> <img class="delexam" src="/images/board/btn_minus.gif"
																				onclick="delExam(this)" width="20" height="15" style="cursor: hand; vertical-align: middle;" />
																		</td>
																		<td class="sBg"></td>
																	</tr>
																</c:forEach>
															</table>
														</div>
													</td>
												</tr>
												<tr>
													<td class="lbg3" colspan="12"></td>
												</tr>
												<c:set value="${i.count}" var="count" />
											</c:forEach>
											<c:if test="${count==null}">
												<tr class="tbg3">
													<td class="t2" colspan="99">��ȸ�� �����Ͱ� �����ϴ�.</td>
												</tr>
											</c:if>
										</table>
									</form>
									<!--����Ʈ ��-->
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
		<td align="center">
			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="tbg1"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<!--�ϴܹ�ư-->
			<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
				<tr valign="bottom">
					<td align="right">
						<a href="#" onclick="statExcelDownload()">�������������</a> <a href="#" onclick="viewStatList()">������ü���</a> <a href="#" onclick="viewStatListForPrint()">��¿�������</a>
						<img src="/images/board/btn_save.gif" align="absmiddle" alt="����" style="cursor: hand" onclick="done()" /> <img src="/images/board/btn_cancle2.gif"
							align="absmiddle" alt="���" style="cursor: hand" onclick="checkCancle()" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%-- ���������߰��� ����  --%>
<div id="sampleItem" style="display: none;">
	<table>
		<tr>
			<td class="t2" width="30" title="rownum">
				<input type="checkbox" name="bankgrp_array"/>
				<input name="itemno_array" type="hidden" value="" />
			</td>
			<td class="sBg"></td>
			<td class="t3">
				&nbsp;<input type="text" name="itemcontents_array" value="" style="width: 90%;" />&nbsp;<img src="/images/board/dawn.gif" class="showexam" align="absmiddle"
					onclick="showExam(this)" style="cursor: hand;" />
			</td>
			<td class="sBg"></td>
			<td class="t2" width="119">
				<select name="itemgroup_array">
					<option value="�⺻�׸�">�⺻�׸�</option>
					<option value="����ȿ��">����ȿ��</option>
					<option value="�����">�����</option>
					<option value="�н���">�н���</option>
					<option value="������">������</option>
					<option value="�ü��̿�">�ü��̿�</option>
					<option value="���Ǹ�����">���Ǹ�����</option>
					<option value="��Ÿ">��Ÿ</option>
				</select>
			</td>
			<td class="sBg"></td>
			<td class="t2" width="89">
				<select name="itemgbn_array">
					<option value="A">������</option>
					<option value="B">�ְ���</option>
				</select>
			</td>
			<td class="sBg"></td>
			<td class="t2" width="79" align="center">
				<img class="additem" src="/images/board/btn_plus.gif" align="middle" alt="�����߰�" onclick="addItem(this)" style="cursor: hand; vertical-align: middle;" /> <img
					class="delitem" src="/images/board/btn_minus.gif" align="middle" alt="���׻���" onclick="delItem(this)" style="cursor: hand; vertical-align: middle;" />
			</td>
		</tr>
		<tr>
			<td colspan="2"></td>
			<td colspan="12" align="center">
				<div style="display: none;" class="subDiv" align="left">
					<table class="ExamTable" width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td class="sBg"></td>
							<td class="lbg3" colspan="5"></td>
							<td class="sBg"></td>
						</tr>
						<tr class="exam">
							<td class="sBg"></td>
							<td width="10">
								1 <input type="hidden" name="examseq_array" value="1" />
							</td>
							<td>
								. <input type="text" name="examcontents_array" value="����" style="width: 90%;" />
							</td>
							<td width="10%">
								<img class="addexam" src="/images/board/btn_plus.gif" width="20" height="15" align="middle" alt="�����߰�" onclick="addExam(this)"
									style="cursor: hand; vertical-align: middle;" title="���� �߰�" /> <img class="delexam" src="/images/board/btn_minus.gif" onclick="delExam(this)"
									width="20" height="15" style="cursor: hand; vertical-align: middle;" />
							</td>
							<td class="sBg"></td>
						</tr>
						<tr>
							<td class="sBg"></td>
							<td class="lbg3" colspan="5"></td>
							<td class="sBg"></td>
						</tr>
						<tr class="exam">
							<td class="sBg"></td>
							<td width="10">
								2 <input type="hidden" name="examseq_array" value="2" />
							</td>
							<td>
								. <input type="text" name="examcontents_array" value="���� ����" style="width: 90%;" />
							</td>
							<td width="10%">
								<img class="addexam" src="/images/board/btn_plus.gif" width="20" height="15" align="middle" alt="�����߰�" onclick="addExam(this)"
									style="cursor: hand; vertical-align: middle;" title="���� �߰�" /> <img class="delexam" src="/images/board/btn_minus.gif" onclick="delExam(this)"
									width="20" height="15" style="cursor: hand; vertical-align: middle;" />
							</td>
							<td class="sBg"></td>
						</tr>
						<tr>
							<td class="sBg"></td>
							<td class="lbg3" colspan="5"></td>
							<td class="sBg"></td>
						</tr>
						<tr class="exam">
							<td class="sBg"></td>
							<td width="10">
								3 <input type="hidden" name="examseq_array" value="3" />
							</td>
							<td>
								. <input type="text" name="examcontents_array" value="����" style="width: 90%;" />
							</td>
							<td width="10%">
								<img class="addexam" src="/images/board/btn_plus.gif" width="20" height="15" align="middle" alt="�����߰�" onclick="addExam(this)"
									style="cursor: hand; vertical-align: middle;" title="���� �߰�" /> <img class="delexam" src="/images/board/btn_minus.gif" onclick="delExam(this)"
									width="20" height="15" style="cursor: hand; vertical-align: middle;" />
							</td>
							<td class="sBg"></td>
						</tr>
						<tr>
							<td class="sBg"></td>
							<td class="lbg3" colspan="5"></td>
							<td class="sBg"></td>
						</tr>
						<tr class="exam">
							<td class="sBg"></td>
							<td width="10">
								4 <input type="hidden" name="examseq_array" value="4" />
							</td>
							<td>
								. <input type="text" name="examcontents_array" value="�ټ� ����" style="width: 90%;" />
							</td>
							<td width="10%">
								<img class="addexam" src="/images/board/btn_plus.gif" width="20" height="15" align="middle" alt="�����߰�" onclick="addExam(this)"
									style="cursor: hand; vertical-align: middle;" title="���� �߰�" /> <img class="delexam" src="/images/board/btn_minus.gif" onclick="delExam(this)"
									width="20" height="15" style="cursor: hand; vertical-align: middle;" />
							</td>
							<td class="sBg"></td>
						</tr>
						<tr>
							<td class="sBg"></td>
							<td class="lbg3" colspan="5"></td>
							<td class="sBg"></td>
						</tr>
						<tr class="exam">
							<td class="sBg"></td>
							<td width="10">
								5 <input type="hidden" name="examseq_array" value="5" />
							</td>
							<td>
								. <input type="text" name="examcontents_array" value="����" style="width: 90%;" />
							</td>
							<td width="10%">
								<img class="addexam" src="/images/board/btn_plus.gif" width="20" height="15" align="middle" alt="�����߰�" onclick="addExam(this)"
									style="cursor: hand; vertical-align: middle;" title="���� �߰�" /> <img class="delexam" src="/images/board/btn_minus.gif" onclick="delExam(this)"
									width="20" height="15" style="cursor: hand; vertical-align: middle;" />
							</td>
							<td class="sBg"></td>
						</tr>
					</table>
				</div>
			</td>
			<td class="sBg"></td>
		</tr>
		<tr>
			<td class="lbg3" colspan="12"></td>
		</tr>
	</table>
</div>
