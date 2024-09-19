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
<script language="JavaScript">
</script>	
<table width="790" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
  </tr>
  <tr> 
    <td> 
      <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/operation/title_08-2.gif"/>' alt="교육생 관리-개인이력" width="186" height="18" /></td>
        </tr>
        <tr> 
          <td height="15"></td>
        </tr>
        <tr> 
          <td> 
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                	<html:form action="oprStudent.act?task=updateInfoPnE">
                  <html:hidden property="courseCode" value="${rsOpr_Student.courseCode}"/>
                  <html:hidden property="seq" value="${rsOpr_Student.seq}"/>
                  <html:hidden property="juminno" value="${rsOpr_Student.juminno}"/>
                  <!--검색 테이블 시작-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                  	<tr>
                  		<td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />${rsOpr_Student.courseName}</td>
                  	</tr>
                  </table>
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="99" height="30" class="s1">이름</td>
                            <td class="sBar"></td>
                            <td width="273" class="s2">${rsOpr_Student.stdname}</td>
                            <td class="sBar"></td>
                            <td width="99" class="s1">대체키</td>
                            <td class="sBar"></td>
                            <td width="274" class="s2">
                            	<%-- <c:if test="${fn:length(rsOpr_Student.juminno) eq 13}">${fn:substring(rsOpr_Student.juminno, 0, 6)}-${fn:substring(rsOpr_Student.juminno, 6, 13)}</c:if>
                            	<c:if test="${fn:length(rsOpr_Student.juminno) ne 13}">${rsOpr_Student.juminno}</c:if> --%>
                            	
                            	${rsOpr_Student.juminno}
                           	</td>
                          </tr>
                          <tr> 
                            <td colspan="15" class="lbg3"></td>
                          </tr>
                          <tr>
                            <td width="99" height="30" class="s1">소속</td>
                            <td class="sBar"></td>
                            <td width="273" class="s2">${rsOpr_Student.organname}</td>
                            <td class="sBar"></td>
                            <td width="99" class="s1">부서</td>                           
                            <td class="sBar"></td>
                            <td width="274" class="s2">${rsOpr_Student.assignname}</td>
                          </tr>
                          <tr> 
                            <td colspan="15" class="lbg3"></td>
                          </tr>
                          <tr> 
                            <td width="99" height="30" class="s1">직급</td>
                            <td class="sBar"></td>
                            <td width="273" class="s2">${rsOpr_Student.rankname}</td>
                            <td class="sBar"></td>
                            <td width="99" class="s1">직렬</td>
                            <td class="sBar"></td>
                            <td width="274" class="s2"> ${rsOpr_Student.jobname}</td>
                          </tr>
                          <tr> 
                            <td colspan="15" class="lbg3"></td>
                          </tr>
                          <tr>
                            <td width="99" height="30" class="s1">전화번호</td>
                            <td class="sBar"></td>
                            <td width="273" class="s2"><html:text property="cellphone" style="width:140px;" value="${rsOpr_Student.cellphone}"/></td>
                            <td class="sBar"></td>
                            <td width="99" class="s1">E-mail</td>
                            <td class="sBar"></td>
                            <td width="274" class="s2"><html:text property="email" style="width:140px;" value="${rsOpr_Student.email}"/></td>
                         	</tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                  <!--검색 테이블 끝-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0" height="30">
                    <tr> 
                      <td align="right">
                      	<img src='<html:rewrite page="/images/board/btn_list.gif"/>' alt="목록" onclick="document.location.href=document.referrer;" style="cursor:hand" align="absbottom"/>
                      	<img src='<html:rewrite page="/images/board/btn_save.gif"/>' alt="저장" onclick="document.forms[0].submit();" style="cursor:hand" align="absbottom"/>
                      </td>
                    </tr>
                  </table>
                  </html:form>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>