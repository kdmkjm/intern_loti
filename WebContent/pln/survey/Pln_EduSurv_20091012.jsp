<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>

<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   윈도우 사이즈 변경 셋팅 코드
	tresize(300);
	}

	// 수정버튼 클릭시
	function modifySurv(row)
	{
		row = row-1;

		$('crsClumpCode').value = document.all.crsClumpCd[row].value;
		$('organCode').value = document.all.organCd[row].value;
		$('planYear').value = document.all.plnYear[row].value;

		$('crsClumpName').value = document.all.crsClumpNm[row].innerHTML;
		$('eduTarget').value = document.all.eduTgt[row].innerHTML;
		$('dayCount').value = document.all.dayCnt[row].innerHTML;
		$('turnCount').value = document.all.turnCnt[row].innerHTML;
		$('stdNumber').value = document.all.stdNum[row].innerHTML;
		$('chptCount').value = document.all.chptCnt[row].innerHTML;
		$('apvHour').value = document.all.apvHr[row].innerHTML;

		var frm = document.forms[1];
		var type1 = document.all.type1[row].value;
		var type2 = document.all.type2[row].value;
		var type3 = document.all.type3[row].value;
		frm.crsType.value = type1+type2+type3;

		$('insert').style.display = "none";
		$('update').style.display = "";

	}

	// 저장 프로세스
	function saveSurv()
	{

		var frm = document.forms[1];

		if(frm.crsClumpName.value == '')
		{
			alert('과정명을 입력하세요');
			frm.crsClumpName.focus();
			return;
		}

		if(frm.crsType.value == '')
		{
			alert('분류를 입력하세요');
			frm.crsType.focus();
			return;
		}

		var url = frm.action;
      	var pars = Form.serialize(frm);

		new Ajax.Updater(
						 '',
                           url,
                            {
                              method: 'post',
                              parameters: pars,
                              evalScripts: true,
                              onFailure: reportError,
                              onComplete: saveComp

                              });

		//frm.submit();
	}

	// 저장완료
	function saveComp(request)
	{
		alert('저장이 완료되었습니다.');
		document.forms[0].submit();

	}

	//저장 실패
	reportError = function(request)
	{
		alert('저장 중 오류가 발생하였습니다. \\n관리자에게 문의하세요.');
	}


	// 신규 클릭시 입력창 초기화
	function formReset()
	{
		$('crsClumpName').value = "";
		$('eduTarget').value = "";
		$('dayCount').value = "";
		$('turnCount').value = "";
		$('stdNumber').value = "";
		$('chptCount').value = "";
		$('apvHour').value = "";

		$('insert').style.display = "";
		$('update').style.display = "none";
	}



	// 전년도 자료 가져오기
	function copySurvey()
	{

		today = new Date();



		var year = today.getYear() + 1;

		if(confirm(year+'년도 자료는 모두 삭제됩니다. 계속하시겠습니까?'))
		{
				var url = '${pageContext.request.contextPath}/plnSurv.act';
      			var pars = 'task=copy&year='+year;

				new Ajax.Updater(
						 '',
                           url,
                            {
                              method: 'post',
                              parameters: pars,
                              evalScripts: true,
                              onFailure: reportError,
                              onComplete: saveComp

                        });
		}
	}

	//엑셀 다운로드
	function excelDown()
	{
		var form = document.forms[0];
		var url = '${pageContext.request.contextPath}/plnSurv.act?task=excel&';
      	var pars = Form.serialize(form);

        /*
        var myAjax = new Ajax.Request(
                           url,
                           {
                               method: 'post',
                               parameters: pars
                           });
       */

       document.location.href = url+pars;

	}

	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}



//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
  </tr>
  <tr>
    <td>
      <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/edu/title_01.gif"/>' alt="조사서" width="74" height="18" /></td>
        </tr>
        <tr>
          <td height="15"></td>
        </tr>
        <tr>
          <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
            <html:form action='plnSurv.act?task=list'>
 			<!--검색 테이블 시작-->
             <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                 <tr>
                      <td bgcolor="#FFFFFF">
			            <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="74" class="s1">연도</td>
                            <td bgcolor="#E6E6E6" width="1"></td>
                            <td class="s2" width="99">
			                   <html:select property="selPlanYear">
			    				<html:optionsCollection name="planYearCode" property="beanCollection" />
			    			</html:select>
			                </td>
                            <td bgcolor="#E6E6E6" width="1"></td>
                            <td width="74" class="s1">분류</td>
                            <td bgcolor="#E6E6E6" width="1"></td>
                            <td class="s2" width="99">
			                  <html:select property="selCrsType">
			    				<html:optionsCollection name="crsTypeCode" property="beanCollection" />
			    			 </html:select>
			                </td>
                            <td bgcolor="#E6E6E6" width="1"></td>
                            <td width="74" class="s1">기관</td>
                            <td bgcolor="#E6E6E6" width="1"></td>
                            <td class="s2">
			                  <html:select property="selOrganCode">
			    				<html:optionsCollection name="orgTypeCode" property="beanCollection" />
			    			 </html:select>
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
              <tr>
                <td height="15"></td>
              </tr>
              <tr>
                <td>
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="tbg2"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                   <!--테이블 헤더 시작-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="lbg"></td>
                      <td class="cbg">
                        <table width="746" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td class="t1" width="48">번호</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="179">과정명</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="116">교육대상</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="49">일수</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="49">회수</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="49">교육<br>인원</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="49">등록<br>인원</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="49">차시</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="49">인정<br>시간</td>
                            <td width="1"><img src='<html:rewrite page="/images/board/bar.gif"/>' width="1" height="8"></td>
                            <td class="t1" width="99">처리</td>
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
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="lbg"></td>
                      <td width="746">
                        <table width="746" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td valign="top">
 			<!--리스트 시작-->
			<div id="mainList"  style=" width:746px;  overflow-y:scroll ;overflow-x:hidden;">
				<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
				<c:forEach var="survList" items="${rsPln_EduSurvList}" varStatus="i" >
					<c:if test="${i.count%2 == 0}">
       		        <tr class="tbg3">
       		        	<td class="t2" width="48" id="num"><c:out value="${survList.num}"/></td>
       		        	<td class="sBg"></td>
						<td class="t3" width="179" id="crsClumpNm"><c:out value="${survList.crsClumpName}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="116" id="eduTgt"><c:out value="${survList.eduTarget}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="dayCnt"><c:out value="${survList.dayCount}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="turnCnt"><c:out value="${survList.turnCount}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="stdNum"><c:out value="${survList.stdNumber}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="orgNum"><c:out value="${survList.orgStdNumber}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="chptCnt"><c:out value="${survList.chptCount}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="apvHr"><c:out value="${survList.apvHour}"/></td>
						<td class="sBg"></td>
			            <td class="t2" width="81">
			            <c:if test="${planCount==0}">
			            <img width="34" height="18" align="absmiddle" onclick="modifySurv(${i.count});" src='<html:rewrite page="/images/board/btn_modify.gif"/>'>
			            <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' width="34" height="18" align="absmiddle" alt="삭제" />
			            </c:if>
			            <c:if test="${planCount>0}">
			            <img width="34" height="18" align="absmiddle" src='<html:rewrite page="/images/board/btn_modify_off.gif"/>'>
			            <img src='<html:rewrite page="/images/board/btn_del2_off.gif"/>' width="34" height="18" align="absmiddle" alt="삭제" />
			            </c:if>
			            </td>
			        </tr>
		            <tr>
							<td class="lbg3" colspan="99"></td>
					</tr>
       		        </c:if>
       		        <c:if test="${i.count%2 == 1}">
       		        <tr>
       		        	<td class="t2" width="48" id="num"><c:out value="${survList.num}"/></td>
       		        	<td class="sBg"></td>
						<td class="t3" width="179" id="crsClumpNm"><c:out value="${survList.crsClumpName}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="116" id="eduTgt"><c:out value="${survList.eduTarget}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="dayCnt"><c:out value="${survList.dayCount}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="turnCnt"><c:out value="${survList.turnCount}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="stdNum"><c:out value="${survList.stdNumber}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="orgNum"><c:out value="${survList.orgStdNumber}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="chptCnt"><c:out value="${survList.chptCount}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="49" id="apvHr"><c:out value="${survList.apvHour}"/></td>
						<td class="sBg"></td>
			            <td class="t2" width="82"><c:if test="${planCount==0}">
			            <img width="34" height="18" align="absmiddle" onclick="modifySurv(${i.count});" src='<html:rewrite page="/images/board/btn_modify.gif"/>'>
			            <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' width="34" height="18" align="absmiddle" alt="삭제" />
			            </c:if>
			            <c:if test="${planCount>0}">
			            <img width="34" height="18" align="absmiddle" src='<html:rewrite page="/images/board/btn_modify_off.gif"/>'>
			            <img src='<html:rewrite page="/images/board/btn_del2_off.gif"/>' width="34" height="18" align="absmiddle" alt="삭제" />
			            </c:if>
			            </td>
			        </tr>
		            <tr>
							<td class="lbg3" colspan="99"></td>
					</tr>
       		        </c:if>

		        <input type="hidden" name="plnYear" id="plnYear" value="${survList.planYear }" >
				<input type="hidden" name="crsClumpCd" id="crsClumpCd" value="${survList.crsClumpCode }" >
				<input type="hidden" name="organCd" id="organCd" value="${survList.organCode }" >
				<input type="hidden" name="type1" id="type1" value="${survList.crsType1 }" >
				<input type="hidden" name="type2" id="type2" value="${survList.crsType2 }" >
				<input type="hidden" name="type3" id="type3" value="${survList.crsType3 }" >

		        </c:forEach>
			  </table>
			  </div>

    <!--게시물 목록 끝-->
								</td>
                          </tr>

                        </table>

                      </td>
                      <td class="lbg" ></td>
                    </tr>
                  </table>


                </td>
              </tr>
              <tr>
              <td><table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="tbg2"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
              <td height="5"></td>
              </tr>
              <tr>
                <td>

                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="tbg2"></td>
                    </tr>
                  </table>

                </td>
              </tr>
             <tr>
             	<td>
             	<table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="lbg"></td>
              	 		<td class="cbg3">

              	 <!--게시물 추가/수정 시작-->

            <html:form action="/plnSurv.act?task=insert" method="post">
            <input type="hidden" name="crsClumpCode" id="crsClumpCode" >
            <input type="hidden" name="organCode" id="organCode" >
            <input type="hidden" name="planYear" id="planYear" >
            <input type="hidden" name="crsType1" id="crsType1" >
            <input type="hidden" name="crsType2" id="crsType2" >
            <input type="hidden" name="crsType3" id="crsType3" >
             	<table width="746" border="0" cellspacing="0" cellpadding="0">
                     		<tr>
                                  <td width="59" class="t1">과정명</td>
                                  <td class="sBg2"></td>
                                  <td class="s2Center">
                                    <input type="text" name="crsClumpName" id="crsClumpName" style="width:87%;">
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="t1">교육대상</td>
                                  <td class="sBg2"></td>
                                  <td width="79" class="s2Center">
                                    <input type="text" name="eduTarget" id="eduTarget" style="width:90%;">
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="49" class="t1">일수</td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="s2Center">
                                    <input type="text" name="dayCount" id="dayCount" style="width:90%;">
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="t1">차시</td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="s2Center">
                                  	<input type="text" name="chptCount" id="chptCount" style="width:90%;">
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="s2Center">
                                  <c:if test="${planCount==0}">
                                  	<img id="reset" src='<html:rewrite page="/images/board/btn_s_reset.gif"/>' width="60" height="19" alt="신규저장" align="absmiddle" onclick="formReset();"/>
                                  </c:if>
                                  </td>
                          </tr>
                         <tr>
                                  <td colspan="16" class="lbg4"></td>
                         </tr>
                         <tr>
                                  <td width="59" class="t1">분류</td>
                                  <td class="sBg2"></td>
                                  <td class="s2Center">
                                    <html:select property="crsType" style="width:90%;" >
			    						<html:optionsCollection name="crsTypeAll" property="beanCollection" />
			    					</html:select>
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="t1">교육인원</td>
                                  <td class="sBg2"></td>
                                  <td width="79" class="s2Center">
                                    <input type="text" name="stdNumber" id="stdNumber" style="width:90%;">
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="49" class="t1">회수</td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="s2Center">
                                    <input type="text" name="turnCount" id="turnCount" style="width:90%;">
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="t1">인정기간</td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="s2Center">
                                    <input type="text" name="apvHour" id="apvHour" style="width:88%;">
                                  </td>
                                  <td class="sBg2"></td>
                                  <td width="69" class="s2Center">
                                  	<c:if test="${planCount==0}">
									  <img id="update" src='<html:rewrite page="/images/board/btn_modifysave.gif"/>' width="60" height="19" alt="수정저장" align="absmiddle" style="display:none" onclick="saveSurv();"/>
									  <img id="insert" src='<html:rewrite page="/images/board/btn_newsave.gif"/>' width="60" height="19" alt="신규저장" align="absmiddle" onclick="saveSurv();"/>
									</c:if>
								  </td>
                        </tr>
             </table>
			</html:form>

              	</td>
              	<td class="lbg" ></td>
            </tr>
            </table>
            </td>
           	</tr>
           	<tr>
              <td><table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="tbg2"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td>

                  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr valign="bottom">
                      <td>
                      <c:if test="${survCount==0}"> <img src='<html:rewrite page="/images/board/btn_import.gif"/>' width="127" height="25" align="absmiddle" alt="전년도 자료 가져오기"  onclick="copySurvey();"/>
                      </c:if>
                      <c:if test="${survCount>0}"> <img src='<html:rewrite page="/images/board/btn_import_off.gif"/>' width="127" height="25" align="absmiddle" alt="전년도 자료 가져오기" />
                      </c:if>
                      <c:if test="${planCount==0}">

                        <img src='<html:rewrite page="/images/board/btn_excel.gif"/>' width="94" height="25" align="absmiddle" alt="엑셀다운로드" onclick="excelDown();">
                        <a href="pln/survey/Pln_EduSurvExcelUp.jsp"><img src='<html:rewrite page="/images/board/btn_excelup.gif"/>' width="82" height="25" align="absmiddle" alt="엑셀업로드"></a>
                       </c:if>
                       <c:if test="${planCount>0}">
                        <img src='<html:rewrite page="/images/board/btn_excel_off.gif"/>' width="94" height="25" align="absmiddle" alt="엑셀다운로드">
                        <img src='<html:rewrite page="/images/board/btn_excelup_off.gif"/>' width="82" height="25" align="absmiddle" alt="엑셀업로드">
                       </c:if>
                        </td>
                        <td align="right">
                        	<img src='<html:rewrite page="/images/board/btn_print6.gif"/>' width="86" height="25" align="absbottom" alt="집계표 인쇄">
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
</td>
</tr>
</table>

<script type="text/javascript">
<!--
	tresize(300);
	searchList('${key}');

//-->
</script>
