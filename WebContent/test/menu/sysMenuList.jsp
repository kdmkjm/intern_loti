<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>


		<!---------- 메인 화면  ----------->

		<div class="main">
		<div class="mainText">

		<!--검색 -->
		<form method="POST"  action="" class="boardSearchForm" >
		<table border="0" cellspacing="0" width="660">
		<tr>
			<td>
			메뉴명 <input type="text" name="searchKeyword" title="메뉴명"  class="inputText "  />
			</td>
			<td width="50">
			<a href="#"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="45" height="20" alt="검색" align="absmiddle" border="0" /></a>
			</td>
		</tr>
		</table>
		</form>
		<hr class="displayNone" />
		<!--검색 끝-->

		<!--게시물 목록 시작-->
		<fieldset>
		 <table border="1" cellspacing="0" class="boardList" summary="메뉴목록">
		  <caption>메뉴목록</caption>
				<thead>
				<tr bgcolor="#FFFFFF" height="27" align="center">
					<th scope="col">메뉴코드</th>
					<th scope="col">상위코드</th>
					<th scope="col">메뉴명</th>
					<th scope="col">프로그램명</th>
					<th scope="col">프로그램ID</th>
					<th scope="col"  class="end">삭제</th>
				</tr>
				</thead>
				<tbody>

        <tr >
      		<td>1</td>
      		<td>0</td>
            <td class="subject" >
            <a href=''><span>시스템관리</span></a></td>
          	<td class="subject">시스템관리</td>
            <td></td>
            <td><a href=''>삭제</a></td>
        </tr>
         <tr>
				<td colspan="6" bgcolor="efefef" height="1"></td>
		</tr>

        <tr >
      		<td>2</td>
      		<td>1</td>
            <td class="subject" >
            <a href=''><span>사용자/그룹관리</span></a></td>
          	<td class="subject">사용자/그룹관리</td>
            <td></td>
            <td><a href=''>삭제</a></td>
        </tr>

         <tr>
				<td colspan="6" bgcolor="efefef" height="1"></td>
		</tr>

		<tr>
				<td colspan="6" bgcolor="efefef" height="1"></td>
		</tr>
				</tbody>
			  </table>

			</fieldset>

    <!--게시물 목록 끝-->

		<!--게시물 아래 버튼 시작-->
		<div class="boardBottom">
		  <div class="buttonRight">
            <input type="button" name="Submit3" value="신규등록" class="button" onclick="location.href='<html:rewrite page="/sysMenuAdd.jsp"/>'">
          </div>
		 </div>

		<!--게시물 아래 버튼 끝-->
		</div>

		<!------ 메인화면 끝------>

	</div>

