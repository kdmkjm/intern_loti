<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%
response.setHeader("Content-Type", "application/vnd.ms-xls");
response.setHeader("Content-Disposition", "attachment; filename="+request.getAttribute("coursename")+"_��������Ȳ.xls");
response.setHeader("Content-Description", "JSP Generated Data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25">�ҼӺ�</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="1" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" style="text-align:center">����</td>

		  <td class="t1" style="text-align:center">��</td>

		  <td class="t1" style="text-align:center" width="43">���</td>

		  <td class="t1" style="text-align:center" width="43">û��</td>

		  <td class="t1" style="text-align:center" width="43">����</td>

		  <td class="t1" style="text-align:center" width="43">��õ</td>

		  <td class="t1" style="text-align:center" width="43">����</td>

		  <td class="t1" style="text-align:center" width="43">��õ</td>

		  <td class="t1" style="text-align:center" width="43">����</td>

		   <td class="t1" style="text-align:center" width="43">����</td>

		  <td class="t1" style="text-align:center" width="43">��õ</td>

		  <td class="t1" style="text-align:center" width="43">����</td>

		  <td class="t1" style="text-align:center" width="43">����</td>

		  <td class="t1" style="text-align:center" width="43">�ܾ�</td>

		  <td class="t1" style="text-align:center" width="43">��Ÿ</td>
		  <td class="t1" style="text-align:center" width="56">(��)û��</td>
		  <td class="t1" style="text-align:center" width="43">û��</td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="1" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_AssignList}" varStatus="i" >
			<c:if test="${fn:substring(list.gubun,0,1) == '1'}">
				<c:set var="gubun" value="��ü"/>
			</c:if>
			<c:if test="${fn:substring(list.gubun,0,1) == '2'}">
				<c:set var="gubun" value="����"/>
			</c:if>
			<c:if test="${fn:substring(list.gubun,0,1) == '3'}">
				<c:set var="gubun" value="����"/>
			</c:if>
			<tr>

			  <td class="t2" style="text-align:center">${gubun }</td>

			  <td class="t2" style="text-align:center">${list.total}</td>

			  <td class="t2" width="43">${list.assignChungBuk}</td>

			  <td class="t2" width="43">${list.assignCheongju}</td>


			  <td class="t2" width="43">${list.assignChungJu}</td>

			  <td class="t2" width="43">${list.assignJaeChon}</td>



			  <td class="t2" width="43">${list.assignBoUn}</td>

			  <td class="t2" width="43">${list.assignOkChon}</td>

			  <td class="t2" width="43">${list.assignYoungDong}</td>

			  <td class="t2" width="43">${list.assignJungPyong}</td>

			  <td class="t2" width="43">${list.assignJinChon}</td>

			  <td class="t2" width="43">${list.assignGoeSan}</td>

			  <td class="t2" width="43">${list.assignUmSung}</td>

			  <td class="t2" width="43">${list.assignDanYang}</td>

			  <td class="t2" width="43">${list.assignEtc}</td>
			  <td class="t2" width="56">${list.assignChongJu}</td>
			  <td class="t2" width="43">${list.assignChongWon}</td>
			</tr>
			<c:set var="count" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${count==null}">
			<tr class="tbg3">
			  <td class="t2">��ȸ�� �����Ͱ� �����ϴ�.</td>
			</tr>
		  </c:if>
		  </table>
		</div>
		<!--����Ʈ ��-->
	  </td>
	</tr>
	</table>
	<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25">���޺�</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="1" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" style="text-align:center" colspan="2">��</td>

		  <td class="t1" style="text-align:center">4���̻�</td>

		  <td class="t1" style="text-align:center" width="72">5��</td>

		  <td class="t1" style="text-align:center" width="72">6��</td>

		  <td class="t1" style="text-align:center" width="72">7��</td>

		  <td class="t1" style="text-align:center" width="72">8��</td>

		  <td class="t1" style="text-align:center" width="72">9��</td>

		  <td class="t1" style="text-align:center" width="72">10��</td>

		  <td class="t1" style="text-align:center" width="72">��������</td>

		  <td class="t1" style="text-align:center" width="72">����</td>

		  <td class="t1" style="text-align:center" width="72">��Ÿ</td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="1" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_RankList}" varStatus="i" >
			<!-- �� ��� -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2" colspan="2" style="text-align:center">${list.total}</td>

			  <td class="t2" width="72">${list.rank4Geubup}</td>

			  <td class="t2" width="72">${list.rank5Geub}</td>

			  <td class="t2" width="72">${list.rank6Geub}</td>

			  <td class="t2" width="72">${list.rank7Geub}</td>

			  <td class="t2" width="72">${list.rank8Geub}</td>

			  <td class="t2" width="72">${list.rank9Geub}</td>

			  <td class="t2" width="72">${list.rank10Geub}</td>

			  <td class="t2" width="72">${list.rankYeonGuJiDo}</td>

			  <td class="t2" width="72">${list.rankByeolJeong}</td>

			  <td class="t2" width="72">${list.rankEtc}</td>
			</tr>
			<c:set var="count" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${count==null}">
		  <tr class="tbg3">
			<td class="t2">��ȸ�� �����Ͱ� �����ϴ�.</td>
		  </tr>
		  </c:if>
		  </table>
		</div>
		<!--����Ʈ ��-->
	  </td>
	</tr>
	</table>
	<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25">���ĺ�</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="1" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" style="text-align:center" colspan="2">��</td>

		  <td class="t1" style="text-align:center" width="65">����</td>

		  <td class="t1" style="text-align:center" width="65">����</td>

		  <td class="t1" style="text-align:center" width="65">�������</td>

		  <td class="t1" style="text-align:center" width="65">��ȸ����</td>

		  <td class="t1" style="text-align:center" width="65">�ü�</td>

		  <td class="t1" style="text-align:center" width="65">ȯ��</td>

		  <td class="t1" style="text-align:center" width="65">�����</td>

		  <td class="t1" style="text-align:center" width="65">�����ǹ�</td>

		  <td class="t1" style="text-align:center" width="65">���</td>

		  <td class="t1" style="text-align:center" width="65">��Ÿ</td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="1" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_JobList}" varStatus="i" >
		    <!-- �� ��� -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2" colspan="2" style="text-align:center">${list.total}</td>

			  <td class="t2" width="65">${list.jobHaengJeong}</td>

			  <td class="t2" width="65">${list.jobSeMu}</td>

			  <td class="t2" width="65">${list.jobJeongBoTongSin}</td>

			  <td class="t2" width="65">${list.jobSaHoiBokJi}</td>

			  <td class="t2" width="65">${list.jobSiSeol}</td>

			  <td class="t2" width="65">${list.jobHwanKyeong}</td>

			  <td class="t2" width="65">${list.jobNongSuSan}</td>

			  <td class="t2" width="65">${list.jobBoGeonEuiMu}</td>

			  <td class="t2" width="65">${list.jobGiNeung}</td>

			  <td class="t2" width="65">${list.jobEtc}</td>
			</tr>
			<c:set var="count" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${count==null}">
		    <tr class="tbg3">
			  <td class="t2">��ȸ�� �����Ͱ� �����ϴ�.</td>
			</tr>
		  </c:if>
		  </table>
		</div>
		<!--����Ʈ ��-->
	  </td>
	</tr>
	</table>
	<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25">���ɺ�</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="1" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" style="text-align:center" colspan="2">��</td>

		  <td class="t1" style="text-align:center" width="70">���</td>

		  <td class="t1" style="text-align:center" width="99">20������</td>

		  <td class="t1" style="text-align:center" width="99">21~30��</td>

		  <td class="t1" style="text-align:center" width="99">31~40��</td>

		  <td class="t1" style="text-align:center" width="99">41~50��</td>

		  <td class="t1" style="text-align:center" width="99">51~60��</td>

		  <td class="t1" style="text-align:center" width="99">61���̻�</td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="1" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_AgeList}" varStatus="i" >
			<!-- �� ��� -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2" colspan="2" style="text-align:center">${list.total}</td>

			  <td class="t2" width="70">${list.ageavg}</td>

			  <td class="t2" width="99">${list.age20down}</td>

			  <td class="t2" width="99">${list.age21to30}</td>

			  <td class="t2" width="99">${list.age31to40}</td>

			  <td class="t2" width="99">${list.age41to50}</td>

			  <td class="t2" width="99">${list.age51to60}</td>

			  <td class="t2" width="99">${list.age61up}</td>
			<c:set var="count" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${count==null}">
			<tr class="tbg3">
			  <td class="t2">��ȸ�� �����Ͱ� �����ϴ�.</td>
			</tr>
		  </c:if>
		  </table>
		</div>
		<!--����Ʈ ��-->
	  </td>
	</tr>
	</table>
	<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25">�ٹ������</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="1" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" style="text-align:center" colspan="2">��</td>

		  <td class="t1" style="text-align:center" width="70">���</td>

		  <td class="t1" style="text-align:center" width="79">5������</td>

		  <td class="t1" style="text-align:center" width="79">6~10��</td>

		  <td class="t1" style="text-align:center" width="79">11~15��</td>

		  <td class="t1" style="text-align:center" width="79">16~20��</td>

		  <td class="t1" style="text-align:center" width="79">21~25��</td>

		  <td class="t1" style="text-align:center" width="79">26~30��</td>

		  <td class="t1" style="text-align:center" width="79">31���̻�</td>

		  <td class="t1" style="text-align:center" width="79">��Ÿ</td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="1" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_InidateList}" varStatus="i" >
			<!-- �� ��� -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2" colspan="2" style="text-align:center">${list.total}</td>

			  <td class="t2" width="70">${list.inidateavg}</td>

			  <td class="t2" width="79">${list.inidate5down}</td>

			  <td class="t2" width="79">${list.inidate6to10}</td>

			  <td class="t2" width="79">${list.inidate11to15}</td>

			  <td class="t2" width="79">${list.inidate16to20}</td>

			  <td class="t2" width="79">${list.inidate21to25}</td>

			  <td class="t2" width="79">${list.inidate26to30}</td>

			  <td class="t2" width="79">${list.inidate31up}</td>

			  <td class="t2" width="79">${list.inidateunknown}</td>
			</tr>
			<c:set var="countini" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${countini==null}">
			<tr class="tbg3">
			  <td class="t2">��ȸ�� �����Ͱ� �����ϴ�.</td>
			</tr>
		  </c:if>
		  </table>
		</div>
		<!--����Ʈ ��-->
	  </td>
	</tr>
	</table>